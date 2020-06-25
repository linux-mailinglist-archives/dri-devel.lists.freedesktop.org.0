Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C70209BE7
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 11:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BCB06E0ED;
	Thu, 25 Jun 2020 09:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080D46E0ED
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 09:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nR4AtFwGIMRFY4MvMa2HAwsNIEPZo5THnlgjbzn1kac=; b=Qap99a6HEDSf48mVTHOxVAUokV
 bNbna8MnS5cot8W/Gt15dx76UYvtb+tNzbIUP0N17Gg2aSj6HMWQ5V59saLUGhTFhPzx+0XIygMQt
 XSi4I29RD8Z1PLLNMdi9+Rxs/h4HNKTucbnmfgKV+/y/G5zcgzN0bHMMeLRjzOITRcOxfK3D4xJoP
 SkmQM47CkaG6GzXnyUq37Ixe0QSmP+b0FWo1fxOm1ocxaV9e4idPcVLMgZzfDbBY77au9XW7i4wMX
 0h/l0PAMS6ifeTsHXJTjj6Cg2IZUvL7t/FJNHTN6LQjLlRadPzmCaCI5+rlP7BTc+/jnEhGHXrfGY
 sTWZ3dYw==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1joOA4-0004lb-J7; Thu, 25 Jun 2020 12:27:12 +0300
Subject: Re: [RFC] Host1x/TegraDRM UAPI
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Jon Hunter
 <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org, gustavo@padovan.org
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <7cc0d47b-024a-263e-3b63-1d1184b462b3@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <8d60baf4-45e8-296a-279e-dc105966361c@kapsi.fi>
Date: Thu, 25 Jun 2020 12:27:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <7cc0d47b-024a-263e-3b63-1d1184b462b3@gmail.com>
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

T24gNi8yNS8yMCAxOjMzIEFNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMjMuMDYuMjAyMCAx
NTowOSwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4+IHN0cnVjdCBkcm1fdGVncmFfc3Vi
bWl0X3JlbG9jYXRpb24gewo+PiAgwqDCoMKgwqDCoMKgwqAgLyogW2luXSBJbmRleCBvZiBHQVRI
RVIgb3IgR0FUSEVSX1VQVFIgY29tbWFuZCBpbiBjb21tYW5kcy4gKi8KPj4gIMKgwqDCoMKgwqDC
oMKgIF9fdTMyIGdhdGhlcl9jb21tYW5kX2luZGV4Owo+Pgo+PiAgwqDCoMKgwqDCoMKgwqAgLyoK
Pj4gIMKgwqDCoMKgwqDCoMKgwqAgKiBbaW5dIE1hcHBpbmcgaGFuZGxlIChvYnRhaW5lZCB0aHJv
dWdoIENIQU5ORUxfTUFQKSBvZiB0aGUgbWVtb3J5Cj4+ICDCoMKgwqDCoMKgwqDCoMKgICrCoMKg
IHRoZSBhZGRyZXNzIG9mIHdoaWNoIHdpbGwgYmUgcGF0Y2hlZCBpbi4KPj4gIMKgwqDCoMKgwqDC
oMKgwqAgKi8KPj4gIMKgwqDCoMKgwqDCoMKgIF9fdTMyIG1hcHBpbmdfaWQ7Cj4+Cj4+ICDCoMKg
wqDCoMKgwqDCoCAvKgo+PiAgwqDCoMKgwqDCoMKgwqDCoCAqIFtpbl0gT2Zmc2V0IGluIHRoZSBn
YXRoZXIgdGhhdCB3aWxsIGJlIHBhdGNoZWQuCj4+ICDCoMKgwqDCoMKgwqDCoMKgICovCj4+ICDC
oMKgwqDCoMKgwqDCoCBfX3U2NCBnYXRoZXJfb2Zmc2V0Owo+Pgo+PiAgwqDCoMKgwqDCoMKgwqAg
LyoKPj4gIMKgwqDCoMKgwqDCoMKgwqAgKiBbaW5dIE9mZnNldCBpbiB0YXJnZXQgYnVmZmVyIHdo
b3NlIHBhZGRyL0lPVkEgd2lsbCBiZSB3cml0dGVuCj4+ICDCoMKgwqDCoMKgwqDCoMKgICrCoMKg
IHRvIHRoZSBnYXRoZXIuCj4+ICDCoMKgwqDCoMKgwqDCoMKgICovCj4+ICDCoMKgwqDCoMKgwqDC
oCBfX3U2NCB0YXJnZXRfb2Zmc2V0Owo+Pgo+PiAgwqDCoMKgwqDCoMKgwqAgLyoKPj4gIMKgwqDC
oMKgwqDCoMKgwqAgKiBbaW5dIE51bWJlciBvZiBiaXRzIHRoZSByZXN1bHRpbmcgYWRkcmVzcyB3
aWxsIGJlIGxvZ2ljYWxseQo+PiAgwqDCoMKgwqDCoMKgwqDCoCAqwqDCoCBzaGlmdGVkIHJpZ2h0
IGJlZm9yZSB3cml0aW5nIHRvIGdhdGhlci4KPj4gIMKgwqDCoMKgwqDCoMKgwqAgKi8KPj4gIMKg
wqDCoMKgwqDCoMKgIF9fdTMyIHNoaWZ0Owo+Pgo+PiAgwqDCoMKgwqDCoMKgwqAgX191MzIgcmVz
ZXJ2ZWRbMV07Cj4+IH07Cj4gCj4gV2Ugd2lsbCBhbHNvIG5lZWQgcmVhZC93cml0ZSBkaXJlY3Rp
b24gZmxhZyBoZXJlIGZvciB0aGUKPiBETUEtcmVzZXJ2YXRpb25zIHNldCB1cCwgaXQgd2lsbCBi
ZSB1c2VkIGZvciB0aGUgaW1wbGljaXQgQk8gZmVuY2luZyBieQo+IHRoZSBqb2IncyBzY2hlZHVs
ZXIuCj4gCgpJZGVhbGx5IG9uIG5ld2VyIGNoaXBzIHdpdGggY29udGV4dCBpc29sYXRpb24sIHdl
IG5vIGxvbmdlciBrbm93IHdoYXQgCkRNQS1CVUZzIGFyZSBiZWluZyB1c2VkIGJ5IHRoZSBqb2Ig
YXQgc3VibWl0IHRpbWUgLSB0aGV5IHdvdWxkIGp1c3QgYmUgCnBvaW50ZXJzIGFmdGVyIGJlaW5n
IE1BUHBlZC4KCkRvIHlvdSBrbm93IGhvdyBvdGhlciBHUFVzIGRlYWwgd2l0aCBETUEgcmVzZXJ2
YXRpb25zIC0gSSBleHBlY3QgCnNlcGFyYXRlIE1BUCBhbmQgU1VCTUlUIHN0ZXBzIHdvdWxkIGJl
IHByZXR0eSBjb21tb24/IERvIHlvdSBoYXZlIHRvIApwYXNzIHRoZSBETUEtQlVGIHRvIGJvdGgg
c3RlcHMgKGkuZS4gZG8gSU9NTVUgbWFwcGluZyBkdXJpbmcgTUFQLCBhbmQgCm1hbmFnZSByZXNl
cnZhdGlvbnMgYXQgU1VCTUlUKT8KCk1pa2tvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
