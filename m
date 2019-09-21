Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CB8BA26B
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2019 14:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD33E896EC;
	Sun, 22 Sep 2019 12:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 781D46E075
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2019 19:07:45 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 85F402002D;
 Sat, 21 Sep 2019 21:07:43 +0200 (CEST)
Date: Sat, 21 Sep 2019 21:07:42 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH 1/3] drm/panel: simple: Add Logic PD Type 28 display
 support
Message-ID: <20190921190742.GC32133@ravnborg.org>
References: <20190917161214.2913-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190917161214.2913-1-aford173@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8
 a=7gkXJVJtAAAA:8 a=xK0do9HAD_rHnancwdkA:9 a=BOiP-fhdRgDUoPr4:21
 a=UG9U2V4UWY7noxTK:21 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-omap@vger.kernel.org,
 adam.ford@logicpd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWRhbS4KCk9uIFR1ZSwgU2VwIDE3LCAyMDE5IGF0IDExOjEyOjExQU0gLTA1MDAsIEFkYW0g
Rm9yZCB3cm90ZToKPiBQcmV2aW91c2x5LCB0aGVyZSB3YXMgYW4gb21hcCBwYW5lbC1kcGkgZHJp
dmVyIHRoYXQgd291bGQKPiByZWFkIGdlbmVyaWMgdGltaW5ncyBmcm9tIHRoZSBkZXZpY2UgdHJl
ZSBhbmQgc2V0IHRoZSBkaXNwbGF5Cj4gdGltaW5nIGFjY29yZGluZ2x5LiAgVGhpcyBkcml2ZXIg
d2FzIHJlbW92ZWQgc28gdGhlIHNjcmVlbgo+IG5vIGxvbmdlciBmdW5jdGlvbnMuICBUaGlzIHBh
dGNoIG1vZGlmaWVzIHRoZSBwYW5lbC1zaW1wbGUKPiBmaWxlIHRvIHNldHVwIHRoZSB0aW1pbmdz
IHRvIHRoZSBzYW1lIHZhbHVlcyBwcmV2aW91c2x5IHVzZWQuCj4gCj4gRml4ZXM6IDhiZjRiMTYy
MTE3OCAoImRybS9vbWFwOiBSZW1vdmUgcGFuZWwtZHBpIGRyaXZlciIpCj4gCj4gU2lnbmVkLW9m
Zi1ieTogQWRhbSBGb3JkIDxhZm9yZDE3M0BnbWFpbC5jb20+CgpQYXRjaCBsb29rcyBnb29kLgpS
ZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgYi9kcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKPiBpbmRleCA1YTkzYzRlZGYxZTQuLmM4NmMzMGYzYThh
MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKPiBAQCAtMTkwMCw2ICsx
OTAwLDQwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBtaXRzdWJpc2hp
X2FhMDcwbWMwMV9tb2RlID0gewo+ICAJLmZsYWdzID0gRFJNX01PREVfRkxBR19OSFNZTkMgfCBE
Uk1fTU9ERV9GTEFHX05WU1lOQywKPiAgfTsKPiAgCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJt
X2Rpc3BsYXlfbW9kZSBsb2dpY3BkX3R5cGVfMjhfbW9kZSA9IHsKPiArCS5jbG9jayA9IDkwMDAs
Cj4gKwkuaGRpc3BsYXkgPSA0ODAsCj4gKwkuaHN5bmNfc3RhcnQgPSA0ODAgKyAzLAo+ICsJLmhz
eW5jX2VuZCA9IDQ4MCArIDMgKyA0MiwKPiArCS5odG90YWwgPSA0ODAgKyAzICsgNDIgKyAyLAo+
ICsKPiArCS52ZGlzcGxheSA9IDI3MiwKPiArCS52c3luY19zdGFydCA9IDI3MiArIDIsCj4gKwku
dnN5bmNfZW5kID0gMjcyICsgMiArIDExLAo+ICsJLnZ0b3RhbCA9IDI3MiArIDIgKyAxMSArIDMs
Cj4gKwkudnJlZnJlc2ggPSA2MCwKPiArCS5mbGFncyA9IERSTV9NT0RFX0ZMQUdfUEhTWU5DIHwg
RFJNX01PREVfRkxBR19QVlNZTkMsCj4gK307Cj4gKwo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHBh
bmVsX2Rlc2MgbG9naWNwZF90eXBlXzI4ID0gewo+ICsJLm1vZGVzID0gJmxvZ2ljcGRfdHlwZV8y
OF9tb2RlLAo+ICsJLm51bV9tb2RlcyA9IDEsCj4gKwkuYnBjID0gOCwKPiArCS5zaXplID0gewo+
ICsJCS53aWR0aCA9IDEwNSwKPiArCQkuaGVpZ2h0ID0gNjcsCj4gKwl9LAo+ICsJLmRlbGF5ID0g
ewo+ICsJCS5wcmVwYXJlID0gMjAwLAo+ICsJCS5lbmFibGUgPSAyMDAsCj4gKwkJLnVucHJlcGFy
ZSA9IDIwMCwKPiArCQkuZGlzYWJsZSA9IDIwMCwKPiArCX0sCj4gKwkuYnVzX2Zvcm1hdCA9IE1F
RElBX0JVU19GTVRfUkdCODg4XzFYMjQsCj4gKwkuYnVzX2ZsYWdzID0gRFJNX0JVU19GTEFHX0RF
X0hJR0ggfCBEUk1fQlVTX0ZMQUdfUElYREFUQV9EUklWRV9QT1NFREdFIHwKPiArCQkgICAgIERS
TV9CVVNfRkxBR19TWU5DX0RSSVZFX05FR0VER0UsCj4gK307Cj4gKwo+ICBzdGF0aWMgY29uc3Qg
c3RydWN0IHBhbmVsX2Rlc2MgbWl0c3ViaXNoaV9hYTA3MG1jMDEgPSB7Cj4gIAkubW9kZXMgPSAm
bWl0c3ViaXNoaV9hYTA3MG1jMDFfbW9kZSwKPiAgCS5udW1fbW9kZXMgPSAxLAo+IEBAIC0yOTQ4
LDYgKzI5ODIsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBwbGF0Zm9ybV9v
Zl9tYXRjaFtdID0gewo+ICAJfSwgewo+ICAJCS5jb21wYXRpYmxlID0gImxnLGxwMTI5cWUiLAo+
ICAJCS5kYXRhID0gJmxnX2xwMTI5cWUsCj4gKwl9LCB7Cj4gKwkJLmNvbXBhdGlibGUgPSAibG9n
aWNwZCx0eXBlMjgiLAo+ICsJCS5kYXRhID0gJmxvZ2ljcGRfdHlwZV8yOCwKPiAgCX0sIHsKPiAg
CQkuY29tcGF0aWJsZSA9ICJtaXRzdWJpc2hpLGFhMDcwbWMwMS1jYTEiLAo+ICAJCS5kYXRhID0g
Jm1pdHN1YmlzaGlfYWEwNzBtYzAxLAo+IC0tIAo+IDIuMTcuMQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
