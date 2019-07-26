Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC7175FF3
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 09:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007016E89A;
	Fri, 26 Jul 2019 07:36:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1446E899;
 Fri, 26 Jul 2019 07:36:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: tomeu) with ESMTPSA id D762F28BE84
Subject: Re: [PATCH RESEND] drm: Switch to use DEVFREQ_GOV_SIMPLE_ONDEMAND
 constant
To: Yue Hu <zbestahu@gmail.com>, airlied@linux.ie, daniel@ffwll.ch,
 robdclark@gmail.com, sean@poorly.run, robh@kernel.org
References: <20190725035239.1192-1-zbestahu@gmail.com>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Message-ID: <261610bd-a3b2-89dc-8269-dcdeaf450d3c@collabora.com>
Date: Fri, 26 Jul 2019 09:36:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190725035239.1192-1-zbestahu@gmail.com>
Content-Language: en-US
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cw00.choi@samsung.com, huyue2@yulong.com, myungjoo.ham@samsung.com,
 zhangwen@yulong.com, freedreno@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy8yNS8xOSA1OjUyIEFNLCBZdWUgSHUgd3JvdGU6Cj4gRnJvbTogWXVlIEh1IDxodXl1ZTJA
eXVsb25nLmNvbT4KPiAKPiBTaW5jZSBnb3Zlcm5vciBuYW1lIGlzIGRlZmluZWQgYnkgREVWRlJF
USBmcmFtZXdvcmsgaW50ZXJuYWxseSwgdXNlIHRoZQo+IG1hY3JvIGRlZmluaXRpb24gaW5zdGVh
ZCBvZiB1c2luZyB0aGUgbmFtZSBkaXJlY3RseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBZdWUgSHUg
PGh1eXVlMkB5dWxvbmcuY29tPgoKQWNrZWQtYnk6IFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3Nv
QGNvbGxhYm9yYS5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ3B1LmMg
ICAgICAgICAgICAgICB8IDMgKystCj4gICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJv
c3RfZGV2ZnJlcS5jIHwgMyArKy0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21z
bV9ncHUuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dwdS5jCj4gaW5kZXggNGVkYjg3NC4u
ZjczMDhkNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9ncHUuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dwdS5jCj4gQEAgLTk1LDcgKzk1LDggQEAgc3Rh
dGljIHZvaWQgbXNtX2RldmZyZXFfaW5pdChzdHJ1Y3QgbXNtX2dwdSAqZ3B1KQo+ICAgCSAqLwo+
ICAgCj4gICAJZ3B1LT5kZXZmcmVxLmRldmZyZXEgPSBkZXZtX2RldmZyZXFfYWRkX2RldmljZSgm
Z3B1LT5wZGV2LT5kZXYsCj4gLQkJCSZtc21fZGV2ZnJlcV9wcm9maWxlLCAic2ltcGxlX29uZGVt
YW5kIiwgTlVMTCk7Cj4gKwkJCSZtc21fZGV2ZnJlcV9wcm9maWxlLCBERVZGUkVRX0dPVl9TSU1Q
TEVfT05ERU1BTkQsCj4gKwkJCU5VTEwpOwo+ICAgCj4gICAJaWYgKElTX0VSUihncHUtPmRldmZy
ZXEuZGV2ZnJlcSkpIHsKPiAgIAkJRFJNX0RFVl9FUlJPUigmZ3B1LT5wZGV2LT5kZXYsICJDb3Vs
ZG4ndCBpbml0aWFsaXplIEdQVSBkZXZmcmVxXG4iKTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5m
cm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMKPiBpbmRleCBkYjc5ODUzLi5hN2MxOGJjIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jCj4gQEAgLTE1Nyw3
ICsxNTcsOCBAQCBpbnQgcGFuZnJvc3RfZGV2ZnJlcV9pbml0KHN0cnVjdCBwYW5mcm9zdF9kZXZp
Y2UgKnBmZGV2KQo+ICAgCWRldl9wbV9vcHBfcHV0KG9wcCk7Cj4gICAKPiAgIAlwZmRldi0+ZGV2
ZnJlcS5kZXZmcmVxID0gZGV2bV9kZXZmcmVxX2FkZF9kZXZpY2UoJnBmZGV2LT5wZGV2LT5kZXYs
Cj4gLQkJCSZwYW5mcm9zdF9kZXZmcmVxX3Byb2ZpbGUsICJzaW1wbGVfb25kZW1hbmQiLCBOVUxM
KTsKPiArCQkJJnBhbmZyb3N0X2RldmZyZXFfcHJvZmlsZSwgREVWRlJFUV9HT1ZfU0lNUExFX09O
REVNQU5ELAo+ICsJCQlOVUxMKTsKPiAgIAlpZiAoSVNfRVJSKHBmZGV2LT5kZXZmcmVxLmRldmZy
ZXEpKSB7Cj4gICAJCURSTV9ERVZfRVJST1IoJnBmZGV2LT5wZGV2LT5kZXYsICJDb3VsZG4ndCBp
bml0aWFsaXplIEdQVSBkZXZmcmVxXG4iKTsKPiAgIAkJcmV0ID0gUFRSX0VSUihwZmRldi0+ZGV2
ZnJlcS5kZXZmcmVxKTsKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
