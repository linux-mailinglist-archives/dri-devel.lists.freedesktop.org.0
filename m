Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79068292373
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 10:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1858F6E8F2;
	Mon, 19 Oct 2020 08:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB8986E8F2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 08:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t9SVbxJKpdvXfjX26zsjTYebgTJmlCiMsXrlzcLhYKo=; b=r4Dm4JXzNID4/9Gq6iPh2GkQmV
 FWAYQ2IygdSGbEw9lU3V3rPt2B3BVdY4hY6gmD/Jw6ZlPe/AQrSypOqd1bSSh2yrHIORZNS0QHYkK
 +NZQFRsSfYR9wX3HQ3+7JkoO0vnivq8GAOFarD6YE4TZkbxtPip+JenDvVmvuZmmZSWIOjSAAyEWi
 hVvHLcmePuvvAO9sxzP64uwvT4/iklq4+DpTMVR40aBUEXI9109RQWUnpWd/N+EXIPJncW/H0fUbp
 /TIXi1o2mL7pA0RyKSEgl+djjcKGi5AvRxgTMu8BgSp7CBtUKbRaNY5nyWtr6+7Vds84t4qugZ8au
 pWoxY2TA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1kUQIH-0007jE-3B; Mon, 19 Oct 2020 11:13:25 +0300
Subject: Re: [PATCH v3 19/20] drm/tegra: Implement new UAPI
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20201007171238.1795964-1-mperttunen@nvidia.com>
 <20201007171238.1795964-20-mperttunen@nvidia.com>
 <dd13ec2c-1e01-ca61-656c-b23b156b100f@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <b33a5084-7dc3-a865-2f36-274ecebf2ee7@kapsi.fi>
Date: Mon, 19 Oct 2020 11:13:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <dd13ec2c-1e01-ca61-656c-b23b156b100f@gmail.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMTkvMjAgNToyMSBBTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDA3LjEwLjIwMjAg
MjA6MTIsIE1pa2tvIFBlcnR0dW5lbiDQv9C40YjQtdGCOgo+PiAraW50IHRlZ3JhX2RybV9pb2N0
bF9jaGFubmVsX21hcChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCB2b2lkICpkYXRhLAo+PiArCQkJ
CXN0cnVjdCBkcm1fZmlsZSAqZmlsZSkKPj4gK3sKPiAKPiBIZWxsbywgTWlra28hCj4gCj4gQ291
bGQgeW91IHBsZWFzZSB0ZWxsIHdoYXQgYXJlIHRoZSBob3N0MXggY2xpZW50cyB0aGF0IGFyZSBn
b2luZyB0byBiZQo+IHVwc3RyZWFtZWQgYW5kIHdpbGwgbmVlZCB0aGlzIElPQ1RMPwo+IAoKSGkg
RG1pdHJ5IQoKSXQgaXMgbmVlZGVkIGZvciBhbnkgZW5naW5lL2pvYiB0aGF0IHdhbnRzIHRvIGFj
Y2VzcyBtZW1vcnksIGFzIHRoaXMgCklPQ1RMIG11c3QgYmUgdXNlZCB0byBtYXAgbWVtb3J5IGZv
ciB0aGUgZW5naW5lLiBTbyBhbGwgb2YgdGhlbS4KCkRvd25zdHJlYW0gZG9lc24ndCBoYXZlIGFu
IGVxdWl2YWxlbnQgSU9DVEwgYmVjYXVzZSBpdCAoY3VycmVudGx5KSBkb2VzIAptYXBwaW5nIGF0
IHN1Ym1pdCB0aW1lLCBidXQgdGhhdCBpcyBzdWJvcHRpbWFsIGJlY2F1c2UKCi0gaXQgcmVxdWly
ZXMgZG9pbmcgcmVsb2NhdGlvbnMgaW4gdGhlIGtlcm5lbCB3aGljaCBpc24ndCByZXF1aXJlZCBm
b3IgVDE4NisKLSBpdCdzIGEgYmlnIHBlcmZvcm1hbmNlIHBlbmFsdHksIGR1ZSB0byB3aGljaCB0
aGUgZG93bnN0cmVhbSBrZXJuZWwgaGFzIAp0aGUgImRlZmVycmVkIGRtYS1idWYgdW5tYXBwaW5n
IiBmZWF0dXJlLCB3aGVyZSB1bm1hcHBpbmcgYSBkbWFfYnVmIG1heSAKbm90IGltbWVkaWF0ZWx5
IHVubWFwIGl0IGluIGNhc2UgaXQncyB1c2VkIGxhdGVyLCBzbyB0aGF0IHRoZSAibWFwcGluZyIg
CmxhdGVyIGlzIGZhc3Rlci4gQSBmZWF0dXJlIHdoaWNoIHdlJ2QgcHJlZmVyYWJseSBnZXQgcmlk
IG9mLgotIGJlY2F1c2Ugb2YgdGhlIGFib3ZlIGZlYXR1cmUgbm90IGJlaW5nIGNvbnRyb2xsZWQg
YnkgdGhlIHVzZXIsIGl0IGNhbiAKY2F1c2UgdmFyaWFuY2UgaW4gc3VibWl0IHRpbWVzLgoKT24g
dGhlIG90aGVyIGhhbmQsIHdlIGNhbm5vdCAoYXQgbGVhc3QgYWx3YXlzKSBkbyB0aGUgbWFwcGlu
ZyBhdCAKYWxsb2NhdGlvbi9pbXBvcnQgdGltZSwgYmVjYXVzZQoKLSBBIHNpbmdsZSBGRCBtYXkg
aGF2ZSBtdWx0aXBsZSBjaGFubmVsX2N0eCdzLCBhbmQgYW4gYWxsb2NhdGlvbi9pbXBvcnQgCm1h
eSBuZWVkIHRvIGJlIHVzZWQgaW4gYW55IHN1YnNldCBvZiB0aGVtCi0gVGhlIGltcG9ydCBJT0NU
TCBpcyBmaXhlZCBhbmQgZG9lc24ndCBoYXZlIHRoZSBwYXJhbWV0ZXJzIHdlJ2QgbmVlZCB0byAK
ZG8gdGhpcyBhdCBpbXBvcnQgdGltZQotIE92ZXJhbGwgaXQncyBtb3JlIG9ydGhvZ29uYWwgdG8g
aGF2ZSBHRU0gb2JqZWN0IGFjcXVpcmVtZW50IGluIG9uZSAKc3RlcCBhbmQgbWFwcGluZyBpbiBh
bm90aGVyLgoKTWF5YmUgdGhhdCdzIG5vdCBxdWl0ZSB3aGF0IHlvdSBhc2tlZCwgYnV0IGl0J3Mg
c29tZSBiYWNrZ3JvdW5kIGFueXdheSA6KQoKQ2hlZXJzLApNaWtrbwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
