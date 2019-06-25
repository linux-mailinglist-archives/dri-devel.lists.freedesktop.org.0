Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A805590F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 22:40:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3706E227;
	Tue, 25 Jun 2019 20:40:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F566E226
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 20:40:03 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 86EE32002F;
 Tue, 25 Jun 2019 22:40:01 +0200 (CEST)
Date: Tue, 25 Jun 2019 22:40:00 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v3 2/5] drm/panel: simple: Add Ortustech COM37H3M panel
 support
Message-ID: <20190625204000.GC18595@ravnborg.org>
References: <cover.1559905870.git.hns@goldelico.com>
 <43b47034b618cff26cea0484591c6deafb7f0685.1559905870.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <43b47034b618cff26cea0484591c6deafb7f0685.1559905870.git.hns@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=ztCEdXhiAAAA:8
 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=mnJRnKJ8Oc643HJHjbEA:9
 a=CjuIK1q_8ugA:10 a=nCm3ceeH17rKjHWsMeRo:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 letux-kernel@openphoenux.org, David Airlie <airlied@linux.ie>,
 marek.belisko@gmail.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, tomi.valkeinen@ti.com,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMDE6MTE6MDhQTSArMDIwMCwgSC4gTmlrb2xhdXMgU2No
YWxsZXIgd3JvdGU6Cj4gVGhlIGNoYW5nZSBhZGRzIHN1cHBvcnQgZm9yIHRoZSBPcnR1c3RlY2gg
Q09NMzdIM00wNURUQy85OURUQyAzLjciIFRGVCBMQ0QgcGFuZWwuCj4gCj4gVGVzdGVkIG9uIExl
dHV4MzcwNC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBILiBOaWtvbGF1cyBTY2hhbGxlciA8aG5zQGdv
bGRlbGljby5jb20+ClJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyB8IDMzICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMzIGluc2VydGlvbnMo
KykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5j
IGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4gaW5kZXggNWIyNzgyOWM1
YTc4Li4xZmI3NDkwOGEyNjkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3Bh
bmVsLXNpbXBsZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5j
Cj4gQEAgLTIwMDcsNiArMjAwNywzMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2Mg
b250YXRfeXg3MDB3djAzID0gewo+ICAJLmJ1c19mb3JtYXQgPSBNRURJQV9CVVNfRk1UX1JHQjY2
Nl8xWDE4LAo+ICB9Owo+ICAKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2Rl
IG9ydHVzdGVjaF9jb20zN2gzbV9tb2RlICA9IHsKPiArCS5jbG9jayA9IDIyMTUzLAo+ICsJLmhk
aXNwbGF5ID0gNDgwLAo+ICsJLmhzeW5jX3N0YXJ0ID0gNDgwICsgOCwKPiArCS5oc3luY19lbmQg
PSA0ODAgKyA4ICsgMTAsCj4gKwkuaHRvdGFsID0gNDgwICsgOCArIDEwICsgMTAsCj4gKwkudmRp
c3BsYXkgPSA2NDAsCj4gKwkudnN5bmNfc3RhcnQgPSA2NDAgKyA0LAo+ICsJLnZzeW5jX2VuZCA9
IDY0MCArIDQgKyAzLAo+ICsJLnZ0b3RhbCA9IDY0MCArIDQgKyAzICsgNCwKPiArCS52cmVmcmVz
aCA9IDYwLAo+ICsJLmZsYWdzID0gRFJNX01PREVfRkxBR19OVlNZTkMgfCBEUk1fTU9ERV9GTEFH
X05IU1lOQywKPiArfTsKPiArCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyBvcnR1
c3RlY2hfY29tMzdoM20gPSB7Cj4gKwkubW9kZXMgPSAmb3J0dXN0ZWNoX2NvbTM3aDNtX21vZGUs
Cj4gKwkubnVtX21vZGVzID0gMSwKPiArCS5icGMgPSA4LAo+ICsJLnNpemUgPSB7Cj4gKwkJLndp
ZHRoID0gNTYsCS8qIDU2LjE2bW0gKi8KPiArCQkuaGVpZ2h0ID0gNzUsCS8qIDc0Ljg4bW0gKi8K
PiArCX0sCj4gKwkuYnVzX2Zvcm1hdCA9IE1FRElBX0JVU19GTVRfUkdCODg4XzFYMjQsCj4gKwku
YnVzX2ZsYWdzID0gRFJNX0JVU19GTEFHX0RFX0hJR0ggfCBEUk1fQlVTX0ZMQUdfUElYREFUQV9Q
T1NFREdFIHwKPiArCQkgICAgIERSTV9CVVNfRkxBR19TWU5DX0RSSVZFX1BPU0VER0UsCj4gK307
Cj4gKwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgb3J0dXN0ZWNoX2Nv
bTQzaDRtODV1bGNfbW9kZSAgPSB7Cj4gIAkuY2xvY2sgPSAyNTAwMCwKPiAgCS5oZGlzcGxheSA9
IDQ4MCwKPiBAQCAtMjc4Niw2ICsyODEzLDEyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2
aWNlX2lkIHBsYXRmb3JtX29mX21hdGNoW10gPSB7Cj4gIAl9LCB7Cj4gIAkJLmNvbXBhdGlibGUg
PSAib250YXQseXg3MDB3djAzIiwKPiAgCQkuZGF0YSA9ICZvbnRhdF95eDcwMHd2MDMsCj4gKwl9
LCB7Cj4gKwkJLmNvbXBhdGlibGUgPSAib3J0dXN0ZWNoLGNvbTM3aDNtMDVkdGMiLAo+ICsJCS5k
YXRhID0gJm9ydHVzdGVjaF9jb20zN2gzbSwKPiArCX0sIHsKPiArCQkuY29tcGF0aWJsZSA9ICJv
cnR1c3RlY2gsY29tMzdoM205OWR0YyIsCj4gKwkJLmRhdGEgPSAmb3J0dXN0ZWNoX2NvbTM3aDNt
LAo+ICAJfSwgewo+ICAJCS5jb21wYXRpYmxlID0gIm9ydHVzdGVjaCxjb200M2g0bTg1dWxjIiwK
PiAgCQkuZGF0YSA9ICZvcnR1c3RlY2hfY29tNDNoNG04NXVsYywKPiAtLSAKPiAyLjE5LjEKPiAK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
