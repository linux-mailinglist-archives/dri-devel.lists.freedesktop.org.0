Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0359F20AEA4
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 11:01:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3366EC42;
	Fri, 26 Jun 2020 09:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065966EC42
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 09:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nu6ZjKpZ+xMdFFIrl2P3rKhq0wmkDony0hAKRpmeWYQ=; b=OI3CHHJq0xACp5ptbe6LX7jw1z
 iHyyMjkiJuRBz9rfB6esgQGR39Q2uXvw1T7SDiHdO2TPWuC4PPb8SCIYjXkwRMbCISqx0+wjZrAPQ
 MMzn0m3fKcEufvj8hW4SQKqfYLzxKh6TV1A+89pFNqflDNod+B+/47h811pqOg569cAs4Xb+p8AQ4
 RNkDDuEnpY7jNwPYVcTGkeSHg0QCQFUJxFCyKzon+e2ucWeWzGNOW3Op6Gky/qm1oLOzjPjPLDobU
 lnuoCVdgsB0kDXySkuCWQxIM/k1phpCwJdx2SSki0BfFaHZ+fXGsW01ZIsop/51SOl89cT6jUGDKn
 ruw1s3ww==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1jokEH-0005E1-EA; Fri, 26 Jun 2020 12:01:01 +0300
Subject: Re: [RFC] Host1x/TegraDRM UAPI (drm_tegra_submit_relocation)
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Jon Hunter
 <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org, gustavo@padovan.org
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <7cc0d47b-024a-263e-3b63-1d1184b462b3@gmail.com>
 <8d60baf4-45e8-296a-279e-dc105966361c@kapsi.fi>
 <eb3cac23-cd8c-732b-684c-c2d531de00a2@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <9486b5c7-7588-34fd-bb60-a3b0f252f113@kapsi.fi>
Date: Fri, 26 Jun 2020 12:01:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <eb3cac23-cd8c-732b-684c-c2d531de00a2@gmail.com>
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

T24gNi8yNi8yMCAxOjUwIEFNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMjUuMDYuMjAyMCAx
MjoyNywgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4+IE9uIDYvMjUvMjAgMTozMyBBTSwg
RG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4gMjMuMDYuMjAyMCAxNTowOSwgTWlra28gUGVydHR1
bmVuINC/0LjRiNC10YI6Cj4+Pj4gc3RydWN0IGRybV90ZWdyYV9zdWJtaXRfcmVsb2NhdGlvbiB7
Cj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqAgLyogW2luXSBJbmRleCBvZiBHQVRIRVIgb3IgR0FUSEVS
X1VQVFIgY29tbWFuZCBpbiBjb21tYW5kcy4gKi8KPj4+PiAgwqDCoMKgwqDCoMKgwqDCoCBfX3Uz
MiBnYXRoZXJfY29tbWFuZF9pbmRleDsKPj4+Pgo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgIC8qCj4+
Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCAqIFtpbl0gTWFwcGluZyBoYW5kbGUgKG9idGFpbmVkIHRo
cm91Z2ggQ0hBTk5FTF9NQVApIG9mIHRoZQo+Pj4+IG1lbW9yeQo+Pj4+ICDCoMKgwqDCoMKgwqDC
oMKgwqAgKsKgwqAgdGhlIGFkZHJlc3Mgb2Ygd2hpY2ggd2lsbCBiZSBwYXRjaGVkIGluLgo+Pj4+
ICDCoMKgwqDCoMKgwqDCoMKgwqAgKi8KPj4+PiAgwqDCoMKgwqDCoMKgwqDCoCBfX3UzMiBtYXBw
aW5nX2lkOwo+Pj4+Cj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqAgLyoKPj4+PiAgwqDCoMKgwqDCoMKg
wqDCoMKgICogW2luXSBPZmZzZXQgaW4gdGhlIGdhdGhlciB0aGF0IHdpbGwgYmUgcGF0Y2hlZC4K
Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqAgX191NjQg
Z2F0aGVyX29mZnNldDsKPj4+Pgo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgIC8qCj4+Pj4gIMKgwqDC
oMKgwqDCoMKgwqDCoCAqIFtpbl0gT2Zmc2V0IGluIHRhcmdldCBidWZmZXIgd2hvc2UgcGFkZHIv
SU9WQSB3aWxsIGJlCj4+Pj4gd3JpdHRlbgo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgKsKgwqAg
dG8gdGhlIGdhdGhlci4KPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4+Pj4gIMKgwqDCoMKg
wqDCoMKgwqAgX191NjQgdGFyZ2V0X29mZnNldDsKPj4+Pgo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKg
IC8qCj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCAqIFtpbl0gTnVtYmVyIG9mIGJpdHMgdGhlIHJl
c3VsdGluZyBhZGRyZXNzIHdpbGwgYmUgbG9naWNhbGx5Cj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDC
oCAqwqDCoCBzaGlmdGVkIHJpZ2h0IGJlZm9yZSB3cml0aW5nIHRvIGdhdGhlci4KPj4+PiAgwqDC
oMKgwqDCoMKgwqDCoMKgICovCj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqAgX191MzIgc2hpZnQ7Cj4+
Pj4KPj4+PiAgwqDCoMKgwqDCoMKgwqDCoCBfX3UzMiByZXNlcnZlZFsxXTsKPj4+PiB9Owo+Pj4K
Pj4+IFdlIHdpbGwgYWxzbyBuZWVkIHJlYWQvd3JpdGUgZGlyZWN0aW9uIGZsYWcgaGVyZSBmb3Ig
dGhlCj4+PiBETUEtcmVzZXJ2YXRpb25zIHNldCB1cCwgaXQgd2lsbCBiZSB1c2VkIGZvciB0aGUg
aW1wbGljaXQgQk8gZmVuY2luZyBieQo+Pj4gdGhlIGpvYidzIHNjaGVkdWxlci4KPj4+Cj4+Cj4+
IElkZWFsbHkgb24gbmV3ZXIgY2hpcHMgd2l0aCBjb250ZXh0IGlzb2xhdGlvbiwgd2Ugbm8gbG9u
Z2VyIGtub3cgd2hhdAo+PiBETUEtQlVGcyBhcmUgYmVpbmcgdXNlZCBieSB0aGUgam9iIGF0IHN1
Ym1pdCB0aW1lIC0gdGhleSB3b3VsZCBqdXN0IGJlCj4+IHBvaW50ZXJzIGFmdGVyIGJlaW5nIE1B
UHBlZC4KPiAKPiBUaGUgRE1BLUJVRnMgdGhlbXNlbHZlcyBzaG91bGRuJ3QgYmUgbmVlZGVkLCBi
dXQgR0VNcyBzaG91bGQuCgpZZXMsIEkgbWVhbnQgdG8gc2F5IEdFTSBpbnN0ZWFkIG9mIERNQS1C
VUYuCgo+IAo+PiBEbyB5b3Uga25vdyBob3cgb3RoZXIgR1BVcyBkZWFsIHdpdGggRE1BIHJlc2Vy
dmF0aW9ucyAtIEkgZXhwZWN0Cj4+IHNlcGFyYXRlIE1BUCBhbmQgU1VCTUlUIHN0ZXBzIHdvdWxk
IGJlIHByZXR0eSBjb21tb24/Cj4gCj4gSSBjYW4ndCBpbnN0YW50bHkgcmVjYWxsIHdoYXQgb3Ro
ZXIgZHJpdmVycyBkbywgY291bGQgYmUgd29ydGh3aGlsZSB0bwo+IHRha2UgYSBjbG9zZXIgbG9v
ay4KCkknbGwgc2VlIGlmIEkgY2FuIGZpbmQgc29tZSBzaW1pbGFyIHNpdHVhdGlvbnMgaW4gb3Ro
ZXIgZHJpdmVycy4KCk1pa2tvCgo+IAo+PiBEbyB5b3UgaGF2ZSB0bwo+PiBwYXNzIHRoZSBETUEt
QlVGIHRvIGJvdGggc3RlcHMgKGkuZS4gZG8gSU9NTVUgbWFwcGluZyBkdXJpbmcgTUFQLCBhbmQK
Pj4gbWFuYWdlIHJlc2VydmF0aW9ucyBhdCBTVUJNSVQpPwo+IAo+IFllcywgdGhpcyBzb3VuZHMg
Z29vZCB0byBtZSBpZiBETUEtQlVGIHBhcnQgaXMgcmVwbGFjZWQgd2l0aCBhIEdFTS4KPiAKPiBQ
bGVhc2Ugc2VlIG15IG90aGVyIHJlcGx5IHJlZ2FyZGluZyB0aGUgTUFQIElPQ1RMIHdoZXJlIEkn
bSBzdWdnZXN0aW5nCj4gdG8gYmFjayBtYXBwaW5nIElEcyB3aXRoIGEgR0VNLgo+Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
