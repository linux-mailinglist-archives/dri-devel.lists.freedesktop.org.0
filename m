Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D13C293C32
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 14:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22486EC8A;
	Tue, 20 Oct 2020 12:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E81396EC8A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 12:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uGxWEQsK754B3hOZSl63aoEnD4e7Swtrm1bF3mwOKPw=; b=WkE+8hpnwpJq7/7GOu+amAhzHH
 fUudy/CdvWDL0aR4T5oBcdGrxh2ewoX6vaIKYVjG9EfaSPtWzk6Bnxs3cpnTFaHpFsxBJHgu1KXrx
 Z7SfCzMN7DlM7/Xr3NCzCF+6XVWU3/Jn7Qgbm8OBhu4kzwKz4DaVbNSZJNdaZyIVxnPgSbO6CwLua
 Y0W8O/9ElmK7UvejFALfbIaApSyjV/STjnDXh+UkZ8PxG5BIaA5cJGlXzZvlOF8HtdFU3GJDjT04/
 V6oFrlSz2mUZIryGUC5BC8Td8sAVAFMAkz82qp61D11c1fp8VuUds5HKUdzbEfAlcEjBJOzs6AgSM
 jw7GHFaQ==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1kUr6T-0003kC-IK; Tue, 20 Oct 2020 15:51:01 +0300
Subject: Re: [PATCH v3 19/20] drm/tegra: Implement new UAPI
To: Daniel Vetter <daniel@ffwll.ch>, Dmitry Osipenko <digetx@gmail.com>
References: <20201007171238.1795964-1-mperttunen@nvidia.com>
 <20201007171238.1795964-20-mperttunen@nvidia.com>
 <dd13ec2c-1e01-ca61-656c-b23b156b100f@gmail.com>
 <b33a5084-7dc3-a865-2f36-274ecebf2ee7@kapsi.fi>
 <1f3267a9-37b4-2cff-08a2-2ca7c905ce01@gmail.com>
 <CAKMK7uFWyMZQauakjzSWa9r494R4JKDkAk6ABZOLLsCXb6_yHg@mail.gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <ec4138c0-6c7f-b32e-2049-7848b6ac7f6b@kapsi.fi>
Date: Tue, 20 Oct 2020 15:51:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFWyMZQauakjzSWa9r494R4JKDkAk6ABZOLLsCXb6_yHg@mail.gmail.com>
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
Cc: Dave Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Jon Hunter <jonathanh@nvidia.com>, talho@nvidia.com, bhuntsman@nvidia.com,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Mikko Perttunen <mperttunen@nvidia.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMjAvMjAgMjo0MCBQTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBNb24sIE9jdCAx
OSwgMjAyMCBhdCA3OjI3IFBNIERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4gd3Jv
dGU6Cj4+Cj4+IDE5LjEwLjIwMjAgMTE6MTMsIE1pa2tvIFBlcnR0dW5lbiDQv9C40YjQtdGCOgo+
Pj4gT24gMTAvMTkvMjAgNToyMSBBTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4+IDA3LjEw
LjIwMjAgMjA6MTIsIE1pa2tvIFBlcnR0dW5lbiDQv9C40YjQtdGCOgo+Pj4+PiAraW50IHRlZ3Jh
X2RybV9pb2N0bF9jaGFubmVsX21hcChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCB2b2lkICpkYXRh
LAo+Pj4+PiArICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSkKPj4+Pj4gK3sK
Pj4+Pgo+Pj4+IEhlbGxvLCBNaWtrbyEKPj4+Pgo+Pj4+IENvdWxkIHlvdSBwbGVhc2UgdGVsbCB3
aGF0IGFyZSB0aGUgaG9zdDF4IGNsaWVudHMgdGhhdCBhcmUgZ29pbmcgdG8gYmUKPj4+PiB1cHN0
cmVhbWVkIGFuZCB3aWxsIG5lZWQgdGhpcyBJT0NUTD8KPj4+Pgo+Pj4KPj4+IEhpIERtaXRyeSEK
Pj4+Cj4+PiBJdCBpcyBuZWVkZWQgZm9yIGFueSBlbmdpbmUvam9iIHRoYXQgd2FudHMgdG8gYWNj
ZXNzIG1lbW9yeSwgYXMgdGhpcwo+Pj4gSU9DVEwgbXVzdCBiZSB1c2VkIHRvIG1hcCBtZW1vcnkg
Zm9yIHRoZSBlbmdpbmUuIFNvIGFsbCBvZiB0aGVtLgo+Pj4KPj4+IERvd25zdHJlYW0gZG9lc24n
dCBoYXZlIGFuIGVxdWl2YWxlbnQgSU9DVEwgYmVjYXVzZSBpdCAoY3VycmVudGx5KSBkb2VzCj4+
PiBtYXBwaW5nIGF0IHN1Ym1pdCB0aW1lLCBidXQgdGhhdCBpcyBzdWJvcHRpbWFsIGJlY2F1c2UK
Pj4+Cj4+PiAtIGl0IHJlcXVpcmVzIGRvaW5nIHJlbG9jYXRpb25zIGluIHRoZSBrZXJuZWwgd2hp
Y2ggaXNuJ3QgcmVxdWlyZWQgZm9yCj4+PiBUMTg2Kwo+Pj4gLSBpdCdzIGEgYmlnIHBlcmZvcm1h
bmNlIHBlbmFsdHksIGR1ZSB0byB3aGljaCB0aGUgZG93bnN0cmVhbSBrZXJuZWwgaGFzCj4+PiB0
aGUgImRlZmVycmVkIGRtYS1idWYgdW5tYXBwaW5nIiBmZWF0dXJlLCB3aGVyZSB1bm1hcHBpbmcg
YSBkbWFfYnVmIG1heQo+Pj4gbm90IGltbWVkaWF0ZWx5IHVubWFwIGl0IGluIGNhc2UgaXQncyB1
c2VkIGxhdGVyLCBzbyB0aGF0IHRoZSAibWFwcGluZyIKPj4+IGxhdGVyIGlzIGZhc3Rlci4gQSBm
ZWF0dXJlIHdoaWNoIHdlJ2QgcHJlZmVyYWJseSBnZXQgcmlkIG9mLgo+Pj4gLSBiZWNhdXNlIG9m
IHRoZSBhYm92ZSBmZWF0dXJlIG5vdCBiZWluZyBjb250cm9sbGVkIGJ5IHRoZSB1c2VyLCBpdCBj
YW4KPj4+IGNhdXNlIHZhcmlhbmNlIGluIHN1Ym1pdCB0aW1lcy4KPj4+Cj4+PiBPbiB0aGUgb3Ro
ZXIgaGFuZCwgd2UgY2Fubm90IChhdCBsZWFzdCBhbHdheXMpIGRvIHRoZSBtYXBwaW5nIGF0Cj4+
PiBhbGxvY2F0aW9uL2ltcG9ydCB0aW1lLCBiZWNhdXNlCj4+Pgo+Pj4gLSBBIHNpbmdsZSBGRCBt
YXkgaGF2ZSBtdWx0aXBsZSBjaGFubmVsX2N0eCdzLCBhbmQgYW4gYWxsb2NhdGlvbi9pbXBvcnQK
Pj4+IG1heSBuZWVkIHRvIGJlIHVzZWQgaW4gYW55IHN1YnNldCBvZiB0aGVtCj4+PiAtIFRoZSBp
bXBvcnQgSU9DVEwgaXMgZml4ZWQgYW5kIGRvZXNuJ3QgaGF2ZSB0aGUgcGFyYW1ldGVycyB3ZSdk
IG5lZWQgdG8KPj4+IGRvIHRoaXMgYXQgaW1wb3J0IHRpbWUKPj4+IC0gT3ZlcmFsbCBpdCdzIG1v
cmUgb3J0aG9nb25hbCB0byBoYXZlIEdFTSBvYmplY3QgYWNxdWlyZW1lbnQgaW4gb25lCj4+PiBz
dGVwIGFuZCBtYXBwaW5nIGluIGFub3RoZXIuCj4+Pgo+Pj4gTWF5YmUgdGhhdCdzIG5vdCBxdWl0
ZSB3aGF0IHlvdSBhc2tlZCwgYnV0IGl0J3Mgc29tZSBiYWNrZ3JvdW5kIGFueXdheSA6KQo+Pgo+
PiBJJ20gYXNraW5nIHRoaXMgcXVlc3Rpb24gYmVjYXVzZSByaWdodCBub3cgdGhlcmUgaXMgb25s
eSBvbmUgcG90ZW50aWFsCj4+IGNsaWVudCBmb3IgdGhpcyBJT0NUTCwgdGhlIFZJQy4gSWYgb3Ro
ZXIgY2xpZW50cyBhcmVuJ3Qgc3VwcG9zZWQgdG8gYmUgYQo+PiBwYXJ0IG9mIHRoZSBEUk0gZHJp
dmVyLCBsaWtlIGZvciBleGFtcGxlIE5WREVDIHdoaWNoIHByb2JhYmx5IHNob3VsZCBiZQo+PiBh
IFY0TCBkcml2ZXIsIHRoZW4gRFJNIGRyaXZlciB3aWxsIGhhdmUgb25seSBhIHNpbmdsZSBWSUMg
YW5kIGluIHRoaXMKPj4gY2FzZSB3ZSBzaG91bGRuJ3QgbmVlZCB0aGlzIElPQ1RMIGJlY2F1c2Ug
RFJNIGFuZCBWNEwgc2hvdWxkIHVzZSBnZW5lcmljCj4+IGRtYWJ1ZiBBUEkgZm9yIGltcG9ydGlu
ZyBhbmQgZXhwb3J0aW5nIGJ1ZmZlcnMuCj4gCj4gUmFuZG9tbHkganVtcGluZyBpbiBoZXJlIC4u
Lgo+IAo+IFNvIGlmIHlvdSBoYXZlIGEgZHJtIGRyaXZlciB3aXRoIHVzZXJzcGFjZSBpbiBtZXNh
M2QgYWxyZWFkeSwgdGhlCj4gdXN1YWwgYXBwcm9hY2ggaXMgdG8gaGF2ZSBhIGxpYnZhIGltcGxl
bWVudGF0aW9uIChpZGVhbGx5IGluIG1lc2EzZAo+IHRvbywgdXNpbmcgdGhlIGdhbGxpdW0gZnJh
bWV3b3JrIHNvIHRoYXQgYSBsb3Qgb2YgdGhlIGJvcmluZwo+IGludGVncmF0aW9uIGdsdWUgaXMg
dGFrZW4gY2FyZSBvZiBhbHJlYWR5KSBkaXJlY3RseSBvbiB0b3Agb2YgZHJtLiBObwo+IHY0bCBk
cml2ZXIgbmVlZGVkIGF0IGFsbCBoZXJlLgo+IAo+IEFuZCBpdCBzb3VuZHMgbGlrZSB0aGlzIG52
ZGVjIHRoaW5nIHdvdWxkIGZpdCB0aGF0IGJpbGwgcHJldHR5IG5lYXRseS4KU29tZXRoaW5nIGxp
a2UgdGhpcyB3b3VsZCBiZSBteSBwcmVmZXJlbmNlIGFzIHdlbGwuCgpNaWtrbwoKPiAKPj4gSSdt
IGFsc28gbm90IHF1aXRlIHN1cmUgYWJvdXQgd2hldGhlciB0aGUgY3VycmVudCBtb2RlbCBvZiB0
aGUgdW5pZmllZAo+PiBUZWdyYSBEUk0gZHJpdmVyIGlzIHN1aXRhYmxlIGZvciBoYXZpbmcgdGhl
IHNlcGFyYXRlZCBlbmdpbmVzLiBQZXJoYXBzCj4+IGVhY2ggc2VwYXJhdGVkIGVuZ2luZSBzaG91
bGQganVzdCBoYXZlIGl0cyBvd24gcmVuZGVyaW5nIG5vZGU/Cj4gCj4gQWJvdmUgbW9kZWwgdXNp
bmcgbGlidmEgZHJpdmVyIGluIHVzZXJzcGFjZSBmb3IgbnZkZWMgd291bGQgYXZvaWQgdGhpcwo+
IGlzc3VlIHRvby4KPiAtRGFuaWVsCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
