Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 524AF10DE95
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2019 19:37:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1694E6E170;
	Sat, 30 Nov 2019 18:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D93F890B9
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2019 18:37:32 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 7FBE880563;
 Sat, 30 Nov 2019 19:37:30 +0100 (CET)
Date: Sat, 30 Nov 2019 19:37:29 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 3/3] drm/panel: simple: Add support for the Frida
 FRD350H54004 panel
Message-ID: <20191130183729.GD24722@ravnborg.org>
References: <20191120171027.1102250-1-paul@crapouillou.net>
 <20191120171027.1102250-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191120171027.1102250-3-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8
 a=4eiu5t_5MPiKWv0nutYA:9 a=CjuIK1q_8ugA:10 a=9LHmKk7ezEChjTCyhBa9:22
 a=pHzHmUro8NiASowvMSCR:22 a=6VlIyEUom7LUIeUMNQJH:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, od@zcrc.me,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGF1bC4KCkkgYW0gbm90IHN1cmUgaWYgSSBhbHJlYWR5IHdyb3RlIHRoaXMuLi4KCk9uIFdl
ZCwgTm92IDIwLCAyMDE5IGF0IDA2OjEwOjI3UE0gKzAxMDAsIFBhdWwgQ2VyY3VlaWwgd3JvdGU6
Cj4gVGhlIEZSRDM1MEg1NDAwNCBpcyBhIHNpbXBsZSAzLjUiIDMyMHgyNDAgMjQtYml0IFRGVCBw
YW5lbCwgZm91bmQgZm9yCj4gaW5zdGFuY2UgaW5zaWRlIHRoZSBBbmJlcm5pYyBSRy0zNTAgaGFu
ZGhlbGQgZ2FtaW5nIGNvbnNvbGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBDZXJjdWVpbCA8
cGF1bEBjcmFwb3VpbGxvdS5uZXQ+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC1zaW1wbGUuYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNo
YW5nZWQsIDI5IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3BhbmVsL3BhbmVsLXNpbXBsZS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBs
ZS5jCj4gaW5kZXggMjhmYTZiYTdiNzY3Li44YzAzZjdmZTQ2MWMgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4gQEAgLTEzNzgsNiArMTM3OCwzMiBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IHBhbmVsX2Rlc2MgZXZlcnZpc2lvbl92Z2c4MDQ4MjEgPSB7Cj4gIAkuYnVzX2Zs
YWdzID0gRFJNX0JVU19GTEFHX0RFX0hJR0ggfCBEUk1fQlVTX0ZMQUdfUElYREFUQV9ORUdFREdF
LAo+ICB9Owo+ICAKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIGZyaWRh
X2ZyZDM1MGg1NDAwNF9tb2RlID0gewo+ICsJLmNsb2NrID0gNjc3NywKPiArCS5oZGlzcGxheSA9
IDMyMCwKPiArCS5oc3luY19zdGFydCA9IDMyMCArIDcwLAo+ICsJLmhzeW5jX2VuZCA9IDMyMCAr
IDcwICsgNTAsCj4gKwkuaHRvdGFsID0gMzIwICsgNzAgKyA1MCArIDEwLAo+ICsJLnZkaXNwbGF5
ID0gMjQwLAo+ICsJLnZzeW5jX3N0YXJ0ID0gMjQwICsgNSwKPiArCS52c3luY19lbmQgPSAyNDAg
KyA1ICsgMSwKPiArCS52dG90YWwgPSAyNDAgKyA1ICsgMSArIDUsCj4gKwkudnJlZnJlc2ggPSA2
MCwKPiArCS5mbGFncyA9IERSTV9NT0RFX0ZMQUdfUEhTWU5DIHwgRFJNX01PREVfRkxBR19QVlNZ
TkMsCj4gK307Cj4gKwo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2MgZnJpZGFfZnJk
MzUwaDU0MDA0ID0gewo+ICsJLm1vZGVzID0gJmZyaWRhX2ZyZDM1MGg1NDAwNF9tb2RlLAo+ICsJ
Lm51bV9tb2RlcyA9IDEsCj4gKwkuYnBjID0gOCwKPiArCS5zaXplID0gewo+ICsJCS53aWR0aCA9
IDc3LAo+ICsJCS5oZWlnaHQgPSA2NCwKPiArCX0sCj4gKwkuYnVzX2Zvcm1hdCA9IE1FRElBX0JV
U19GTVRfUkdCODg4XzFYMjQsCj4gKwkuYnVzX2ZsYWdzID0gRFJNX0JVU19GTEFHX0RFX0hJR0gg
fCBEUk1fQlVTX0ZMQUdfUElYREFUQV9QT1NFREdFLAo+ICt9Owo+ICsKPiAgc3RhdGljIGNvbnN0
IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIGZveGxpbmtfZmw1MDB3dnIwMF9hMHRfbW9kZSA9IHsK
PiAgCS5jbG9jayA9IDMyMjYwLAo+ICAJLmhkaXNwbGF5ID0gODAwLAoKSW4gYWxwaGFiZXRpYyBv
cmRlci4gZnJpZGEgY29tZXMgYWZ0ZXIgZm94bGluay4KCj4gQEAgLTMxODYsNiArMzIxMiw5IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHBsYXRmb3JtX29mX21hdGNoW10gPSB7
Cj4gIAl9LCB7Cj4gIAkJLmNvbXBhdGlibGUgPSAiZXZlcnZpc2lvbix2Z2c4MDQ4MjEiLAo+ICAJ
CS5kYXRhID0gJmV2ZXJ2aXNpb25fdmdnODA0ODIxLAo+ICsJfSwgewo+ICsJCS5jb21wYXRpYmxl
ID0gImZyaWRhLGZyZDM1MGg1NDAwNCIsCj4gKwkJLmRhdGEgPSAmZnJpZGFfZnJkMzUwaDU0MDA0
LAo+ICAJfSwgewo+ICAJCS5jb21wYXRpYmxlID0gImZveGxpbmssZmw1MDB3dnIwMC1hMHQiLAo+
ICAJCS5kYXRhID0gJmZveGxpbmtfZmw1MDB3dnIwMF9hMHQsCkluIGFscGhhYmV0aWMgb3JkZXIu
IGZyaWRhIGNvbWVzIGFmdGVyIGZveGxpbmsuCgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
