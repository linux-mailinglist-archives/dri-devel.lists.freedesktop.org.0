Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CDF5AF68
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 10:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D6589B8F;
	Sun, 30 Jun 2019 08:21:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D5089B8F
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 08:21:53 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 19C0220063;
 Sun, 30 Jun 2019 10:21:52 +0200 (CEST)
Date: Sun, 30 Jun 2019 10:21:50 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 3/3] DRM: ingenic: Add support for panels with 8-bit
 serial bus
Message-ID: <20190630082150.GE5081@ravnborg.org>
References: <20190627182114.27299-1-paul@crapouillou.net>
 <20190627182114.27299-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190627182114.27299-3-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8
 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=co-eyZKPhihzPdF-lREA:9
 a=CjuIK1q_8ugA:10 a=9LHmKk7ezEChjTCyhBa9:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 od@zcrc.me, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMDg6MjE6MTRQTSArMDIwMCwgUGF1bCBDZXJjdWVpbCB3
cm90ZToKPiBBZGQgc3VwcG9ydCBmb3IgdGhlIExDRCBwYW5lbHMgd2l0aCBhIHNlcmlhbCA4LWJp
dCBidXMsIHdoZXJlIHRoZSBjb2xvcgo+IGNvbXBvbmVudHMgb2YgZWFjaCAyNC1iaXQgcGl4ZWwg
YXJlIHNlbnQgc2VxdWVudGlhbGx5LgoKVGhlcmUgYXJlIHN0cmFuZ2UgYnVzIGZvcm1hdHMuLi4K
Cj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+
ClJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS5jIHwgNCArKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2luZ2VuaWMvaW5nZW5pYy1kcm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9pbmdlbmljL2luZ2VuaWMt
ZHJtLmMKPiBpbmRleCBkYTk2NmYzZGMxZjcuLmNlMWZhZTNhNzhhOSAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2luZ2VuaWMvaW5nZW5pYy1kcm0uYwo+IEBAIC00MjYsNiArNDI2LDkgQEAgc3RhdGljIHZv
aWQgaW5nZW5pY19kcm1fZW5jb2Rlcl9hdG9taWNfbW9kZV9zZXQoc3RydWN0IGRybV9lbmNvZGVy
ICplbmNvZGVyLAo+ICAJCQljYXNlIE1FRElBX0JVU19GTVRfUkdCODg4XzFYMjQ6Cj4gIAkJCQlj
ZmcgfD0gSlpfTENEX0NGR19NT0RFX0dFTkVSSUNfMjRCSVQ7Cj4gIAkJCQlicmVhazsKPiArCQkJ
Y2FzZSBNRURJQV9CVVNfRk1UX1JHQjg4OF8zWDg6Cj4gKwkJCQljZmcgfD0gSlpfTENEX0NGR19N
T0RFXzhCSVRfU0VSSUFMOwo+ICsJCQkJYnJlYWs7Cj4gIAkJCWRlZmF1bHQ6Cj4gIAkJCQlicmVh
azsKPiAgCQkJfQo+IEBAIC00NTEsNiArNDU0LDcgQEAgc3RhdGljIGludCBpbmdlbmljX2RybV9l
bmNvZGVyX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsCj4gIAljYXNl
IE1FRElBX0JVU19GTVRfUkdCNTY1XzFYMTY6Cj4gIAljYXNlIE1FRElBX0JVU19GTVRfUkdCNjY2
XzFYMTg6Cj4gIAljYXNlIE1FRElBX0JVU19GTVRfUkdCODg4XzFYMjQ6Cj4gKwljYXNlIE1FRElB
X0JVU19GTVRfUkdCODg4XzNYODoKPiAgCQlyZXR1cm4gMDsKPiAgCWRlZmF1bHQ6Cj4gIAkJcmV0
dXJuIC1FSU5WQUw7Cj4gLS0gCj4gMi4yMS4wLjU5My5nNTExZWMzNDVlMTgKPiAKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
