Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B610D76F90
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 19:11:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030106ED09;
	Fri, 26 Jul 2019 17:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891A36E898;
 Fri, 26 Jul 2019 17:11:53 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d3b34610000>; Fri, 26 Jul 2019 10:12:01 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 26 Jul 2019 10:11:53 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 26 Jul 2019 10:11:53 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 26 Jul
 2019 17:11:48 +0000
Subject: Re: [PATCH v2 2/7] mm/hmm: a few more C style and comment clean ups
To: Christoph Hellwig <hch@lst.de>
References: <20190726005650.2566-1-rcampbell@nvidia.com>
 <20190726005650.2566-3-rcampbell@nvidia.com> <20190726062320.GA22881@lst.de>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <6673dc71-f43e-849f-ca36-0b20805fc092@nvidia.com>
Date: Fri, 26 Jul 2019 10:11:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190726062320.GA22881@lst.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1564161121; bh=esO7QnCCyx9dzKTMgBFciVXyQ2aruZtdaUPoDfDZZgU=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=BtXkSUiESCykynn98aAUZOYyg4yz7jKnWyWlQeuTkJgRs1pzxbnG+tdWelFiuNWFf
 lk2A6TLLDs6cQLe2Yo2AGejt/oTzYMtS1amgKmn2dm5v84UdJRMTYaGngk6xAfFfNb
 p99GEAtPQKu0WpF74vtOAbWCO1P3EV8HcGsPjmb/CtOUwIfsJf4d4RzpBS0UZFOFl5
 mKy6fFTJpky1hLxVBJ8kIaj3ucax+hLNkEj3Rb1EYWFnVqCmhNJAyxMjR01QHESrZT
 ZRtQfwyfeh21KLwAKZ3N0lRnAXuC9Yp0RdEq+oNcbACTXWG+Ly+6gcvZF0sXLDUj4M
 vgXH0/SGBnYgA==
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDcvMjUvMTkgMTE6MjMgUE0sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+IE5vdGU6IGl0
IHNlZW1zIGxpa2UgeW91J3ZlIG9ubHkgQ0NlZCBtZSBvbiBwYXRjaGVzIDItNywgYnV0IG5vdCBv
biB0aGUKPiBjb3ZlciBsZXR0ZXIgYW5kIHBhdGNoIDEuICBJJ2xsIHRyeSB0byBmaW5kIHRoZW0g
bGF0ZXIsIGJ1dCB0byBtYWtlIENjcwo+IHVzZWZ1bCB0aGV5IHNob3VsZCBub3JtYWxseSBjb3Zl
ciB0aGUgd2hvbGUgc2VyaWVzLgo+IAo+IE90aGVyd2lzZSB0aGlzIGxvb2tzIGZpbmUgdG8gbWU6
Cj4gCj4gUmV2aWV3ZWQtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IAoKVGhh
bmtzIGZvciB0aGUgcmV2aWV3IGFuZCBzb3JyeSBhYm91dCB0aGUgb3ZlcnNpZ2h0IG9uIENDcy4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
