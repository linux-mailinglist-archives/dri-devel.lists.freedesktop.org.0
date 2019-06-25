Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B82AE55908
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 22:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588286E225;
	Tue, 25 Jun 2019 20:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5DCD6E225
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 20:39:46 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 812222002F;
 Tue, 25 Jun 2019 22:39:43 +0200 (CEST)
Date: Tue, 25 Jun 2019 22:39:37 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v3 1/5] drm/panel: simple: Add Sharp LQ070Y3DG3B panel
 support
Message-ID: <20190625203937.GB18595@ravnborg.org>
References: <cover.1559905870.git.hns@goldelico.com>
 <d16aaa1ac93e4f15c13cd7d621de95836257676a.1559905870.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d16aaa1ac93e4f15c13cd7d621de95836257676a.1559905870.git.hns@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=ztCEdXhiAAAA:8
 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=AypoIBVMmSo6Qq-R-C8A:9
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

T24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMDE6MTE6MDdQTSArMDIwMCwgSC4gTmlrb2xhdXMgU2No
YWxsZXIgd3JvdGU6Cj4gVGhlIGNoYW5nZSBhZGRzIHN1cHBvcnQgZm9yIHRoZSBTaGFycCBMUTA3
MFkzREczQiA3LjAiIFRGVCBMQ0QgcGFuZWwuCj4gCj4gVGVzdGVkIG9uIExldHV4NzAwNC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBILiBOaWtvbGF1cyBTY2hhbGxlciA8aG5zQGdvbGRlbGljby5jb20+
ClJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyB8IDMwICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKykKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIGIvZHJpdmVycy9n
cHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4gaW5kZXggNTY5YmU0ZWZkOGQxLi41YjI3ODI5
YzVhNzggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4gQEAgLTIyMDQs
NiArMjIwNCwzMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2Mgc2Ftc3VuZ19sdG4x
NDBhdDI5XzMwMSA9IHsKPiAgCX0sCj4gIH07Cj4gIAo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRy
bV9kaXNwbGF5X21vZGUgc2hhcnBfbHEwNzB5M2RnM2JfbW9kZSA9IHsKPiArCS5jbG9jayA9IDMz
MjYwLAo+ICsJLmhkaXNwbGF5ID0gODAwLAo+ICsJLmhzeW5jX3N0YXJ0ID0gODAwICsgNjQsCj4g
KwkuaHN5bmNfZW5kID0gODAwICsgNjQgKyAxMjgsCj4gKwkuaHRvdGFsID0gODAwICsgNjQgKyAx
MjggKyA2NCwKPiArCS52ZGlzcGxheSA9IDQ4MCwKPiArCS52c3luY19zdGFydCA9IDQ4MCArIDgs
Cj4gKwkudnN5bmNfZW5kID0gNDgwICsgOCArIDIsCj4gKwkudnRvdGFsID0gNDgwICsgOCArIDIg
KyAzNSwKPiArCS52cmVmcmVzaCA9IDYwLAo+ICsJLmZsYWdzID0gRElTUExBWV9GTEFHU19QSVhE
QVRBX1BPU0VER0UsCj4gK307Cj4gKwo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2Mg
c2hhcnBfbHEwNzB5M2RnM2IgPSB7Cj4gKwkubW9kZXMgPSAmc2hhcnBfbHEwNzB5M2RnM2JfbW9k
ZSwKPiArCS5udW1fbW9kZXMgPSAxLAo+ICsJLmJwYyA9IDgsCj4gKwkuc2l6ZSA9IHsKPiArCQku
d2lkdGggPSAxNTIsCS8qIDE1Mi40bW0gKi8KPiArCQkuaGVpZ2h0ID0gOTEsCS8qIDkxLjRtbSAq
Lwo+ICsJfSwKPiArCS5idXNfZm9ybWF0ID0gTUVESUFfQlVTX0ZNVF9SR0I4ODhfMVgyNCwKPiAr
CS5idXNfZmxhZ3MgPSBEUk1fQlVTX0ZMQUdfREVfSElHSCB8IERSTV9CVVNfRkxBR19QSVhEQVRB
X1BPU0VER0UgfAo+ICsJCSAgICAgRFJNX0JVU19GTEFHX1NZTkNfRFJJVkVfUE9TRURHRSwKPiAr
fTsKPiArCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBzaGFycF9scTAz
NXE3ZGIwM19tb2RlID0gewo+ICAJLmNsb2NrID0gNTUwMCwKPiAgCS5oZGlzcGxheSA9IDI0MCwK
PiBAQCAtMjc4Niw2ICsyODEzLDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQg
cGxhdGZvcm1fb2ZfbWF0Y2hbXSA9IHsKPiAgCX0sIHsKPiAgCQkuY29tcGF0aWJsZSA9ICJzaGFy
cCxscTAzNXE3ZGIwMyIsCj4gIAkJLmRhdGEgPSAmc2hhcnBfbHEwMzVxN2RiMDMsCj4gKwl9LCB7
Cj4gKwkJLmNvbXBhdGlibGUgPSAic2hhcnAsbHEwNzB5M2RnM2IiLAo+ICsJCS5kYXRhID0gJnNo
YXJwX2xxMDcweTNkZzNiLAo+ICAJfSwgewo+ICAJCS5jb21wYXRpYmxlID0gInNoYXJwLGxxMTAx
azFseTA0IiwKPiAgCQkuZGF0YSA9ICZzaGFycF9scTEwMWsxbHkwNCwKPiAtLSAKPiAyLjE5LjEK
PiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
