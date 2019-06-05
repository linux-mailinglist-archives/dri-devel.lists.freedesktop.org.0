Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD4536399
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 20:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B994F896A3;
	Wed,  5 Jun 2019 18:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8840F896A3
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 18:51:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id D929D2829B9
Message-ID: <5c14d7f756cf56308d4ad197ac828a74d9c6c5cf.camel@collabora.com>
Subject: Re: [PATCH v2] drm/panfrost: make devfreq optional again
From: Ezequiel Garcia <ezequiel@collabora.com>
To: Neil Armstrong <narmstrong@baylibre.com>, robh@kernel.org, 
 tomeu.vizoso@collabora.com
Date: Wed, 05 Jun 2019 15:50:58 -0300
In-Reply-To: <20190605150233.32722-1-narmstrong@baylibre.com>
References: <20190605150233.32722-1-narmstrong@baylibre.com>
Organization: Collabora
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
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
Cc: peron.clem@gmail.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDE5LTA2LTA1IGF0IDE3OjAyICswMjAwLCBOZWlsIEFybXN0cm9uZyB3cm90ZToK
PiBEZXZmcmVxIHJ1bnRpbWUgdXNhZ2Ugd2FzIG1hZGUgbWFuZGF0b3J5LCB0aHVzIG1ha2luZyBw
YW5mcm9zdCBmYWlsIHRvIHByb2JlCj4gb24gQW1sb2dpYyBTOTEyIFNvQ3MgbWlzc2luZyB0aGUg
Im9wZXJhdGluZy1wb2ludHMtdjIiIHByb3BlcnR5Lgo+IE1ha2UgaXQgb3B0aW9uYWwgYWdhaW4s
IGxlYXZpbmcgUE1fREVWRlJFUSBzZWxlY3RlZCBieSBkZWZhdWx0Lgo+IAo+IEZpeGVzOiBmMzYx
N2I0NDlkICgiZHJtL3BhbmZyb3N0OiBTZWxlY3QgZGV2ZnJlcSIpCj4gU2lnbmVkLW9mZi1ieTog
TmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgoKUmV2aWV3ZWQtYnk6IEV6
ZXF1aWVsIEdhcmNpYSA8ZXplcXVpZWxAY29sbGFib3JhLmNvbT4KClRoYW5rcyBmb3IgdGhlIGZp
eCwKRXplCgo+IC0tLQo+IENoYW5nZXMgc2luY2UgdjE6Cj4gLSBmaXhlZCBlbHNlL2lmIGxvZ2lj
IGluIHBhbmZyb3N0X2RldmZyZXFfaW5pdAo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3Qv
cGFuZnJvc3RfZGV2ZnJlcS5jIHwgMTMgKysrKysrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MTIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jIGIvZHJpdmVycy9ncHUvZHJtL3Bh
bmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYwo+IGluZGV4IDI5ZmNmZmRmMmQ1Ny4uZGI3OTg1MzJi
MGI2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZm
cmVxLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5j
Cj4gQEAgLTE0MCw3ICsxNDAsOSBAQCBpbnQgcGFuZnJvc3RfZGV2ZnJlcV9pbml0KHN0cnVjdCBw
YW5mcm9zdF9kZXZpY2UgKnBmZGV2KQo+ICAJCXJldHVybiAwOwo+ICAKPiAgCXJldCA9IGRldl9w
bV9vcHBfb2ZfYWRkX3RhYmxlKCZwZmRldi0+cGRldi0+ZGV2KTsKPiAtCWlmIChyZXQpCj4gKwlp
ZiAocmV0ID09IC1FTk9ERVYpIC8qIE9wdGlvbmFsLCBjb250aW51ZSB3aXRob3V0IGRldmZyZXEg
Ki8KPiArCQlyZXR1cm4gMDsKPiArCWVsc2UgaWYgKHJldCkKPiAgCQlyZXR1cm4gcmV0Owo+ICAK
PiAgCXBhbmZyb3N0X2RldmZyZXFfcmVzZXQocGZkZXYpOwo+IEBAIC0xNzAsNiArMTcyLDkgQEAg
dm9pZCBwYW5mcm9zdF9kZXZmcmVxX3Jlc3VtZShzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRl
dikKPiAgewo+ICAJaW50IGk7Cj4gIAo+ICsJaWYgKCFwZmRldi0+ZGV2ZnJlcS5kZXZmcmVxKQo+
ICsJCXJldHVybjsKPiArCj4gIAlwYW5mcm9zdF9kZXZmcmVxX3Jlc2V0KHBmZGV2KTsKPiAgCWZv
ciAoaSA9IDA7IGkgPCBOVU1fSk9CX1NMT1RTOyBpKyspCj4gIAkJcGZkZXYtPmRldmZyZXEuc2xv
dFtpXS5idXN5ID0gZmFsc2U7Cj4gQEAgLTE3OSw2ICsxODQsOSBAQCB2b2lkIHBhbmZyb3N0X2Rl
dmZyZXFfcmVzdW1lKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQo+ICAKPiAgdm9pZCBw
YW5mcm9zdF9kZXZmcmVxX3N1c3BlbmQoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCj4g
IHsKPiArCWlmICghcGZkZXYtPmRldmZyZXEuZGV2ZnJlcSkKPiArCQlyZXR1cm47Cj4gKwo+ICAJ
ZGV2ZnJlcV9zdXNwZW5kX2RldmljZShwZmRldi0+ZGV2ZnJlcS5kZXZmcmVxKTsKPiAgfQo+ICAK
PiBAQCAtMTg4LDYgKzE5Niw5IEBAIHN0YXRpYyB2b2lkIHBhbmZyb3N0X2RldmZyZXFfdXBkYXRl
X3V0aWxpemF0aW9uKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2LCBpCj4gIAlrdGltZV90
IG5vdzsKPiAgCWt0aW1lX3QgbGFzdDsKPiAgCj4gKwlpZiAoIXBmZGV2LT5kZXZmcmVxLmRldmZy
ZXEpCj4gKwkJcmV0dXJuOwo+ICsKPiAgCW5vdyA9IGt0aW1lX2dldCgpOwo+ICAJbGFzdCA9IHBm
ZGV2LT5kZXZmcmVxLnNsb3Rbc2xvdF0udGltZV9sYXN0X3VwZGF0ZTsKPiAgCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
