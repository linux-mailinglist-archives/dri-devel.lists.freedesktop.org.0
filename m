Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BDB7126A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F47E893A3;
	Tue, 23 Jul 2019 07:14:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5BB89E7B;
 Tue, 23 Jul 2019 01:11:05 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d365ea90001>; Mon, 22 Jul 2019 18:11:05 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 22 Jul 2019 18:11:05 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 22 Jul 2019 18:11:05 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 23 Jul
 2019 01:11:04 +0000
Subject: Re: hmm_range_fault related fixes and legacy API removal v2
To: Christoph Hellwig <hch@lst.de>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs
 <bskeggs@redhat.com>
References: <20190722094426.18563-1-hch@lst.de>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <7e1f33d4-4d3b-7927-38d1-b98b22ed4d78@nvidia.com>
Date: Mon, 22 Jul 2019 18:11:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190722094426.18563-1-hch@lst.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1563844265; bh=kscjS9D5ks2yd1t6YQtphh4j4hyaf8nJbzsPpcUAaRc=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=WU2eFWp8VxG3UTGHueSY5tPs9QU3Wq1Nhlz7guFIcl97+4qhR5QlTL95yfCf6KxaI
 zvG+wvbWkdeVrOlsvcu9YwOHFT+WhYBVxi0yTHTWJWeWbv6TU9qyGLhWAtsIkPPaUh
 awR6kqifuiaeIQAF50GonIw3mX+YkzyT++89VwOOVQISWEr4pkMmJrnIHmsaUNvtoH
 2zoQh8J+5RREkogqGWoKWu0eSqZGrb3UTIfWNNhJ6ZMui5fwrfv3d5fUl6WLQXvfdN
 gouWM4XU2Cp0eWulPvR6IKD/vQGHTorAA3LK19GR8gPJFxIuXdMCgf+trx2P/b7oT/
 xtykT8kHaBN4Q==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDcvMjIvMTkgMjo0NCBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gSGkgSsOpcsO0
bWUsIEJlbiBhbmQgSmFzb24sCj4gCj4gYmVsb3cgaXMgYSBzZXJpZXMgYWdhaW5zdCB0aGUgaG1t
IHRyZWUgd2hpY2ggZml4ZXMgdXAgdGhlIG1tYXBfc2VtCj4gbG9ja2luZyBpbiBub3V2ZWF1IGFu
ZCB3aGlsZSBhdCBpdCBhbHNvIHJlbW92ZXMgbGVmdG92ZXIgbGVnYWN5IEhNTSBBUElzCj4gb25s
eSB1c2VkIGJ5IG5vdXZlYXUuCj4gCj4gVGhlIGZpcnN0IDQgcGF0Y2hlcyBhcmUgYSBidWcgZml4
IGZvciBub3V2ZWF1LCB3aGljaCBJIHN1c3BlY3Qgc2hvdWxkCj4gZ28gaW50byB0aGlzIG1lcmdl
IHdpbmRvdyBldmVuIGlmIHRoZSBjb2RlIGlzIG1hcmtlZCBhcyBzdGFnaW5nLCBqdXN0Cj4gdG8g
YXZvaWQgcGVvcGxlIGNvcHlpbmcgdGhlIGJyZWFrYWdlLgo+IAo+IENoYW5nZXMgc2luY2UgdjE6
Cj4gICAtIGRvbid0IHJldHVybiB0aGUgdmFsaWQgc3RhdGUgZnJvbSBobW1fcmFuZ2VfdW5yZWdp
c3Rlcgo+ICAgLSBhZGRpdGlvbmFsIG5vdXZlYXUgY2xlYW51cHMKPiAKCkkgcmFuIHNvbWUgT3Bl
bkNMIHRlc3RzIGZyb20gSmVyb21lIHdpdGggbm91dmVhdSBhbmQgdGhpcyBzZXJpZXMsCjUuMy4w
LXJjMSwgYW5kIG15IHR3byBITU0gZml4ZXM6CigibW0vaG1tOiBmaXggWk9ORV9ERVZJQ0UgYW5v
biBwYWdlIG1hcHBpbmcgcmV1c2UiKQooIm1tL2htbTogRml4IGJhZCBzdWJwYWdlIHBvaW50ZXIg
aW4gdHJ5X3RvX3VubWFwX29uZSIpCgpZb3UgY2FuIGFkZCBmb3IgdGhlIHNlcmllczoKVGVzdGVk
LWJ5OiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
