Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 398E3107F02
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2019 16:29:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D319C6E0CE;
	Sat, 23 Nov 2019 15:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D5F6E0CE
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2019 15:29:39 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 5595C2008C;
 Sat, 23 Nov 2019 16:29:37 +0100 (CET)
Date: Sat, 23 Nov 2019 16:29:36 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 3/3] drm/panel: simple: Add support for the Frida
 FRD350H54004 panel
Message-ID: <20191123152936.GC27045@ravnborg.org>
References: <20191120171027.1102250-1-paul@crapouillou.net>
 <20191120171027.1102250-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191120171027.1102250-3-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8
 a=ynqdyZ908_tY_8WrgD8A:9 a=CjuIK1q_8ugA:10 a=9LHmKk7ezEChjTCyhBa9:22
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

SGkgUGF1bC4KCk9uIFdlZCwgTm92IDIwLCAyMDE5IGF0IDA2OjEwOjI3UE0gKzAxMDAsIFBhdWwg
Q2VyY3VlaWwgd3JvdGU6Cj4gVGhlIEZSRDM1MEg1NDAwNCBpcyBhIHNpbXBsZSAzLjUiIDMyMHgy
NDAgMjQtYml0IFRGVCBwYW5lbCwgZm91bmQgZm9yCj4gaW5zdGFuY2UgaW5zaWRlIHRoZSBBbmJl
cm5pYyBSRy0zNTAgaGFuZGhlbGQgZ2FtaW5nIGNvbnNvbGUuCj4gCj4gU2lnbmVkLW9mZi1ieTog
UGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIGIvZHJpdmVycy9ncHUvZHJtL3Bh
bmVsL3BhbmVsLXNpbXBsZS5jCj4gaW5kZXggMjhmYTZiYTdiNzY3Li44YzAzZjdmZTQ2MWMgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4gQEAgLTEzNzgsNiArMTM3OCwz
MiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2MgZXZlcnZpc2lvbl92Z2c4MDQ4MjEg
PSB7Cj4gIAkuYnVzX2ZsYWdzID0gRFJNX0JVU19GTEFHX0RFX0hJR0ggfCBEUk1fQlVTX0ZMQUdf
UElYREFUQV9ORUdFREdFLAo+ICB9Owo+ICAKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlz
cGxheV9tb2RlIGZyaWRhX2ZyZDM1MGg1NDAwNF9tb2RlID0gewo+ICsJLmNsb2NrID0gNjc3NywK
PiArCS5oZGlzcGxheSA9IDMyMCwKPiArCS5oc3luY19zdGFydCA9IDMyMCArIDcwLAo+ICsJLmhz
eW5jX2VuZCA9IDMyMCArIDcwICsgNTAsCj4gKwkuaHRvdGFsID0gMzIwICsgNzAgKyA1MCArIDEw
LAo+ICsJLnZkaXNwbGF5ID0gMjQwLAo+ICsJLnZzeW5jX3N0YXJ0ID0gMjQwICsgNSwKPiArCS52
c3luY19lbmQgPSAyNDAgKyA1ICsgMSwKPiArCS52dG90YWwgPSAyNDAgKyA1ICsgMSArIDUsCj4g
KwkudnJlZnJlc2ggPSA2MCwKPiArCS5mbGFncyA9IERSTV9NT0RFX0ZMQUdfUEhTWU5DIHwgRFJN
X01PREVfRkxBR19QVlNZTkMsCj4gK307Cj4gKwo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVs
X2Rlc2MgZnJpZGFfZnJkMzUwaDU0MDA0ID0gewo+ICsJLm1vZGVzID0gJmZyaWRhX2ZyZDM1MGg1
NDAwNF9tb2RlLAo+ICsJLm51bV9tb2RlcyA9IDEsCj4gKwkuYnBjID0gOCwKPiArCS5zaXplID0g
ewo+ICsJCS53aWR0aCA9IDc3LAo+ICsJCS5oZWlnaHQgPSA2NCwKPiArCX0sCj4gKwkuYnVzX2Zv
cm1hdCA9IE1FRElBX0JVU19GTVRfUkdCODg4XzFYMjQsCj4gKwkuYnVzX2ZsYWdzID0gRFJNX0JV
U19GTEFHX0RFX0hJR0ggfCBEUk1fQlVTX0ZMQUdfUElYREFUQV9QT1NFREdFLAo+ICt9Owo+ICsK
PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIGZveGxpbmtfZmw1MDB3dnIw
MF9hMHRfbW9kZSA9IHsKPiAgCS5jbG9jayA9IDMyMjYwLAo+ICAJLmhkaXNwbGF5ID0gODAwLAo+
IEBAIC0zMTg2LDYgKzMyMTIsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBw
bGF0Zm9ybV9vZl9tYXRjaFtdID0gewo+ICAJfSwgewo+ICAJCS5jb21wYXRpYmxlID0gImV2ZXJ2
aXNpb24sdmdnODA0ODIxIiwKPiAgCQkuZGF0YSA9ICZldmVydmlzaW9uX3ZnZzgwNDgyMSwKPiAr
CX0sIHsKPiArCQkuY29tcGF0aWJsZSA9ICJmcmlkYSxmcmQzNTBoNTQwMDQiLAo+ICsJCS5kYXRh
ID0gJmZyaWRhX2ZyZDM1MGg1NDAwNCwKPiAgCX0sIHsKPiAgCQkuY29tcGF0aWJsZSA9ICJmb3hs
aW5rLGZsNTAwd3ZyMDAtYTB0IiwKPiAgCQkuZGF0YSA9ICZmb3hsaW5rX2ZsNTAwd3ZyMDBfYTB0
LAoKSW4gYWxwaGFiZXRpYyBvcmRlci4gZnJpZGEgY29tZXMgYWZ0ZXIgZm94LgoKCVNhbQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
