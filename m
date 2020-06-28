Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF5620C782
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jun 2020 13:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80A06E087;
	Sun, 28 Jun 2020 11:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70DD6E087
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jun 2020 11:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DHyuYMJ7JTzjNLzLPP9D5XiJHzEzCIuzeBCvhkc4kf8=; b=jI83DcJiA71faumzvwrxPBCmw1
 kkCpG9djLZ9/FAmaqbrelqkX+r4/hcsPutDn2jL+8NqZplli61zdaUCJ3epM9lTbYwdyXIBunnHOS
 rgKy9HrczcLhf/R5ghLKzEng5pzrFuouEuS0jwy6gvSoNcQq2UHnDw0rvMGHnrsAuhsswkYsD/hOT
 KZTk4MlcArPcR5kWPG3SKSFRr/MKXHCl4VCD73H7fkjhaiMd9+kw9huOYkTlec7WSCRmcNJkrMaYY
 pmr7GDxoWPrcOihneskD61jYKK4+8Q+o9jQd4bmVno+3mbU5QzmUsNftOe2ML0YWZp8mWhMLeWSZk
 lGEqwTKg==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1jpVCz-0007Iq-OW; Sun, 28 Jun 2020 14:10:49 +0300
Subject: Re: [RFC] Host1x/TegraDRM UAPI (drm_tegra_submit_syncpt_incr)
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Jon Hunter
 <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org, gustavo@padovan.org
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <9ddfedff-f465-b22d-5d6f-c7ba01731455@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <3e859337-d282-7d91-32b0-070c44e67e1f@kapsi.fi>
Date: Sun, 28 Jun 2020 14:10:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <9ddfedff-f465-b22d-5d6f-c7ba01731455@gmail.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 84.250.171.65
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
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8yOC8yMCAxMjo0NyBBTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDIzLjA2LjIwMjAg
MTU6MDksIE1pa2tvIFBlcnR0dW5lbiDQv9C40YjQtdGCOgo+PiBzdHJ1Y3QgZHJtX3RlZ3JhX3N1
Ym1pdF9zeW5jcHRfaW5jciB7Cj4+ICDCoMKgwqDCoMKgwqDCoCAvKgo+PiAgwqDCoMKgwqDCoMKg
wqDCoCAqIFtpbl0gU3luY3BvaW50IEZEIG9mIHRoZSBzeW5jcG9pbnQgdGhhdCB0aGUgam9iIHdp
bGwKPj4gIMKgwqDCoMKgwqDCoMKgwqAgKsKgwqAgaW5jcmVtZW50Lgo+PiAgwqDCoMKgwqDCoMKg
wqDCoCAqLwo+PiAgwqDCoMKgwqDCoMKgwqAgX19zMzIgc3luY3B0X2ZkOwo+Pgo+PiAgwqDCoMKg
wqDCoMKgwqAgLyoKPj4gIMKgwqDCoMKgwqDCoMKgwqAgKiBbaW5dIE51bWJlciBvZiBpbmNyZW1l
bnRzIHRoYXQgdGhlIGpvYiB3aWxsIGRvLgo+PiAgwqDCoMKgwqDCoMKgwqDCoCAqLwo+PiAgwqDC
oMKgwqDCoMKgwqAgX191MzIgbnVtX2luY3JzOwo+Pgo+PiAgwqDCoMKgwqDCoMKgwqAgLyoKPj4g
IMKgwqDCoMKgwqDCoMKgwqAgKiBbb3V0XSBWYWx1ZSB0aGUgc3luY3BvaW50IHdpbGwgaGF2ZSBv
bmNlIGFsbCBpbmNyZW1lbnRzIGhhdmUKPj4gIMKgwqDCoMKgwqDCoMKgwqAgKsKgwqAgZXhlY3V0
ZWQuCj4+ICDCoMKgwqDCoMKgwqDCoMKgICovCj4+ICDCoMKgwqDCoMKgwqDCoCBfX3UzMiBmZW5j
ZV92YWx1ZTsKPj4KPj4gIMKgwqDCoMKgwqDCoMKgIF9fdTMyIHJlc2VydmVkWzFdOwo+PiB9Owo+
IAo+IFRoZSBqb2Igc2hvdWxkIGJlIGNvbnNpZGVyZWQgZXhlY3V0ZWQgb25jZSB0aGUgZmluYWwg
c3luYyBwb2ludCBpcwo+IGluY3JlbWVudGVkLgo+IAo+IEhlbmNlLCB0aGVyZSBzaG91bGQgYmUg
b25seSBvbmUgc3luYyBwb2ludCBwZXItam9iIGZvciBpbmNyZW1lbnQsIHdoeQo+IHdvdWxkIHlv
dSBldmVyIG5lZWQgbW9yZSB0aGFuIG9uZT8KPiAKPiBDb3VsZCB5b3UgcGxlYXNlIGV4cGxhaW4g
d2hhdCB0aGlzIHN1Ym1pdF9zeW5jcHRfaW5jciBpcyBhYm91dD8KPiAKClRoaXMgdGVsbHMgdGhl
IGtlcm5lbCB3aGljaCBzeW5jcG9pbnQgd2lsbCBiZSBpbmNyZW1lbnRlZCBhbmQgaG93IG1hbnkg
CnRpbWVzIGZvciBqb2IgdHJhY2tpbmcgYW5kIHZlcmlmeWluZyB0aGUgdXNlciBoYXMgYWNjZXNz
IHRvIHRoYXQgc3luY3BvaW50LgoKQSBzZWNvbmQgc3luY3BvaW50IGlzIHVzZWQgZm9yIE5WRU5D
IGluIHNsaWNlIGVuY29kaW5nIG1vZGUsIHdoZXJlIHRoZSAKZW5naW5lIGNhbiBiZSBwcm9ncmFt
bWVkIHRvIGNvdW50IGVuY29kZWQgc2xpY2VzIGJ5IGluY3JlbWVudGluZyBhIApzeW5jcG9pbnQu
IEknbGwgYXNrIGFyb3VuZCB0byBzZWUgaWYgSSBjYW4gZmluZCBzb21lIG1vcmUgZGV0YWlscyBv
biB0aGlzLgoKU2luY2UgdGhlIHVzZWNhc2UgaXMgc29tZXdoYXQgbmljaGUsIHdlIGNvdWxkIHNl
ZSBpZiB3ZSBjYW4gaGF2ZSBhIApkZXNpZ24gd2hlcmUgaXQncyBvbmx5IG9uZSBzeW5jcG9pbnQs
IGJ1dCBleHRlbnNpYmxlIGxhdGVyIGlmIG5lZWRlZC4KCk1pa2tvCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
