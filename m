Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6247CD989A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 19:41:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44F16E985;
	Wed, 16 Oct 2019 17:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11706E985
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 17:40:59 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9GHeiln054132;
 Wed, 16 Oct 2019 12:40:44 -0500
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9GHeiGq109306
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 16 Oct 2019 12:40:44 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 16
 Oct 2019 12:40:37 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 16 Oct 2019 12:40:44 -0500
Received: from [10.250.79.55] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9GHehq7108884;
 Wed, 16 Oct 2019 12:40:43 -0500
Subject: Re: [RESEND][PATCH v8 0/5] DMA-BUF Heaps (destaging ION)
To: Brian Starkey <Brian.Starkey@arm.com>
References: <20190906184712.91980-1-john.stultz@linaro.org>
 <CAO_48GFHx4uK6cWwJ4oGdJ8HNZNZYDzdD=yR3VK0EXQ86ya9-g@mail.gmail.com>
 <20190924162217.GA12974@arm.com> <20191009173742.GA2682@arm.com>
 <f4fb09a5-999b-e676-0403-cc0de41be440@ti.com>
 <20191014090729.lwusl5zxa32a7uua@DESKTOP-E1NTVVP.localdomain>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <a213760f-1f41-c4a3-7e38-8619898adecd@ti.com>
Date: Wed, 16 Oct 2019 13:40:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191014090729.lwusl5zxa32a7uua@DESKTOP-E1NTVVP.localdomain>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1571247644;
 bh=Wc7RR5GvEzErLs8YJE/8azaMJ2X1mI57r2l2h9Hi84s=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=pmneRVSlMMtJZS9TC6eP4IE7K4BF4wF7y7u3LRIFYqflLA9GQ+VyCckB/roTGGjQw
 NsHrk6pYWjxTBjTGacKt7dAwwErYSyjBlUpNYFQpOjeRQvtwPQEREYsnVH2osls3b/
 9FSc4kYRas+i3s6kdjxbR+T1vorvQ93zuWvWRMD4=
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
Cc: nd <nd@arm.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 Alistair Strachan <astrachan@google.com>, Liam Mark <lmark@codeaurora.org>,
 lkml <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Ayan Halder <Ayan.Halder@arm.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMTQvMTkgNTowNyBBTSwgQnJpYW4gU3RhcmtleSB3cm90ZToKPiBIaSBBbmRyZXcsCj4g
Cj4gT24gV2VkLCBPY3QgMDksIDIwMTkgYXQgMDI6Mjc6MTVQTSAtMDQwMCwgQW5kcmV3IEYuIERh
dmlzIHdyb3RlOgo+PiBUaGUgQ01BIGRyaXZlciB0aGF0IHJlZ2lzdGVycyB0aGVzZSBub2RlcyB3
aWxsIGhhdmUgdG8gYmUgZXhwYW5kZWQgdG8KPj4gZXhwb3J0IHRoZW0gdXNpbmcgdGhpcyBmcmFt
ZXdvcmsgYXMgbmVlZGVkLiBXZSBkbyBzb21ldGhpbmcgc2ltaWxhciB0bwo+PiBleHBvcnQgU1JB
TSBub2RlczoKPj4KPj4gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvMy8yMS81NzUKPj4KPj4g
VW5saWtlIHRoZSBzeXN0ZW0vZGVmYXVsdC1jbWEgZHJpdmVyIHdoaWNoIGNhbiBiZSBjZW50cmFs
aXplZCBpbiB0aGUKPj4gdHJlZSwgdGhlc2UgZXh0cmEgZXhwb3J0ZXJzIHdpbGwgcHJvYmFibHkg
bGl2ZSBvdXQgaW4gb3RoZXIgc3Vic3lzdGVtcwo+PiBhbmQgc28gYXJlIGFkZGVkIGluIGxhdGVy
IHN0ZXBzLgo+Pgo+PiBBbmRyZXcKPiAKPiBJIHdhcyB1bmRlciB0aGUgaW1wcmVzc2lvbiB0aGF0
IHRoZSAiY21hX2Zvcl9lYWNoX2FyZWEiIGxvb3AgaW4gcGF0Y2gKPiA0IHdvdWxkIGRvIHRoYXQg
KGFkZF9jbWFfaGVhcHMpLiBJcyBpdCBub3QgdGhlIGNhc2U/Cj4gCgpGb3IgdGhlc2UgY21hIG5v
ZGVzIHllcywgSSB0aG91Z2h0IHlvdSBtZWFudCByZXNlcnZlZCBtZW1vcnkgYXJlYXMgaW4KZ2Vu
ZXJhbC4KCkp1c3QgYXMgYSBzaWRlIG5vdGUsIEknbSBub3QgYSBodWdlIGZhbiBvZiB0aGUgY21h
X2Zvcl9lYWNoX2FyZWEoKSB0bwpiZWdpbiB3aXRoLCBpdCBzZWVtcyBhIGJpdCBvdXQgb2YgcGxh
Y2Ugd2hlbiB0aGV5IGNvdWxkIGJlIHNlbGVjdGl2ZWx5CmFkZGVkIGFzIGhlYXBzIGFzIG5lZWRl
ZC4gTm90IHN1cmUgaG93IHRoYXQgd2lsbCB3b3JrIHdpdGggY21hIG5vZGVzCnNwZWNpZmljYWxs
eSBhc3NpZ25lZCB0byBkZXZpY2VzLCBzZWVtcyBsaWtlIHdlIGNvdWxkIGp1c3Qgc3RlYWwgdGhl
aXIKbWVtb3J5IHNwYWNlIGZyb20gdXNlcnNwYWNlIHdpdGggdGhpcy4uCgpBbmRyZXcKCj4gVGhh
bmtzLAo+IC1Ccmlhbgo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
