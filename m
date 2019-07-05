Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C5C60B85
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 20:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C7F789363;
	Fri,  5 Jul 2019 18:46:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A014B89363
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 18:46:49 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id C0E0720065;
 Fri,  5 Jul 2019 20:46:46 +0200 (CEST)
Date: Fri, 5 Jul 2019 20:46:44 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add support for Sharp
 LD-D5116Z01B panel
Message-ID: <20190705184644.GA5044@ravnborg.org>
References: <20190705165450.329-1-jeffrey.l.hugo@gmail.com>
 <20190705165755.515-1-jeffrey.l.hugo@gmail.com>
 <20190705172058.GA2788@ravnborg.org>
 <CAOCk7NrVSCt18QfMs+_nW1rDMuhK_dPKWL0roESmwEEy4u3BZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOCk7NrVSCt18QfMs+_nW1rDMuhK_dPKWL0roESmwEEy4u3BZQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=pGLkceISAAAA:8 a=XCh60BrB9CTw4ms3EqwA:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Dave Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 thierry.reding@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmVmZnJleS4KCk9uIEZyaSwgSnVsIDA1LCAyMDE5IGF0IDEyOjM1OjMwUE0gLTA2MDAsIEpl
ZmZyZXkgSHVnbyB3cm90ZToKPiBPbiBGcmksIEp1bCA1LCAyMDE5IGF0IDExOjIxIEFNIFNhbSBS
YXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4gd3JvdGU6Cj4gPgo+ID4gSGkgSmVmZnJleS4KPiA+
Cj4gPiBQYXRjaCBsb29rcyBnb29kLCBidXQgdGhlcmUgaXMgYSBmZXcgZmllbGRzIHRoYXQgYXJl
IG5vdCBpbml0aWFsaXplZC4KPiA+IERpZCB5b3UgZm9yZ2V0IHRoZW0sIG9yIGFyZSB0aGV5IG5v
dCBuZWVkZWQ/Cj4gCj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3LiAgT3Zlcmxvb2tlZCBzb21lIG9m
IHRoZW0uCj4gCj4gPgo+ID4gT24gRnJpLCBKdWwgMDUsIDIwMTkgYXQgMDk6NTc6NTVBTSAtMDcw
MCwgSmVmZnJleSBIdWdvIHdyb3RlOgo+ID4gPiBUaGUgU2hhcnAgTEQtRDUxMTZaMDFCIGlzIGEg
MTIuMyIgZURQIHBhbmVsIHdpdGggYSAxOTIwWDEyODAgcmVzb2x1dGlvbi4KPiA+ID4KPiA+ID4g
U2lnbmVkLW9mZi1ieTogSmVmZnJleSBIdWdvIDxqZWZmcmV5LmwuaHVnb0BnbWFpbC5jb20+Cj4g
PiA+IC0tLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIHwgMjYg
KysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNl
cnRpb25zKCspCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwtc2ltcGxlLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKPiA+
ID4gaW5kZXggNWE5M2M0ZWRmMWU0Li5lNmY1Nzg2NjczMjQgMTAwNjQ0Cj4gPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKPiA+ID4gQEAgLTIzNTQsNiArMjM1NCwyOSBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2Mgc2Ftc3VuZ19sdG4xNDBhdDI5XzMwMSA9IHsK
PiA+ID4gICAgICAgfSwKPiA+ID4gIH07Cj4gPiA+Cj4gPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0
IGRybV9kaXNwbGF5X21vZGUgc2hhcnBfbGRfZDUxMTZ6MDFiX21vZGUgPSB7Cj4gPiA+ICsgICAg
IC5jbG9jayA9IDE2ODQ4MCwKPiA+ID4gKyAgICAgLmhkaXNwbGF5ID0gMTkyMCwKPiA+ID4gKyAg
ICAgLmhzeW5jX3N0YXJ0ID0gMTkyMCArIDQ4LAo+ID4gPiArICAgICAuaHN5bmNfZW5kID0gMTky
MCArIDQ4ICsgMzIsCj4gPiA+ICsgICAgIC5odG90YWwgPSAxOTIwICsgNDggKyAzMiArIDgwLAo+
ID4gPiArICAgICAudmRpc3BsYXkgPSAxMjgwLAo+ID4gPiArICAgICAudnN5bmNfc3RhcnQgPSAx
MjgwICsgMywKPiA+ID4gKyAgICAgLnZzeW5jX2VuZCA9IDEyODAgKyAzICsgMTAsCj4gPiA+ICsg
ICAgIC52dG90YWwgPSAxMjgwICsgMyArIDEwICsgNTcsCj4gPiA+ICsgICAgIC52cmVmcmVzaCA9
IDYwLAo+ID4gPiArfTsKPiA+IE5vIC5mbGFncz8gSXMgaXQgbm90IG5lZWRlZCBmb3IgYW4gZURQ
IHBhbmVsPwo+IAo+IFRoZSBmbGFncyBkb24ndCBhcHBlYXIgdG8gbWFrZSBzZW5zZSBwZXIgbXkg
dW5kZXJzdGFuZGluZyBvZiBlRFAuCj4gVGhlcmVmb3JlIEkgaW50ZW5kZWQgLmZsYWdzIHRvIGJl
IDAsIHdoaWNoIGl0IGltcGxpY2l0bHkgaXMgYmVjYXVzZQo+IHRoaXMgaXMgYSBzdGF0aWMgc3Ry
dWN0LiAgV291bGQgeW91IHByZWZlciBJIGV4cGxpY2l0bHkgbGlzdCAuZmxhZ3MgPQo+IDA/Ckkg
d2FzIG5vdCBzdXJlIGhlbmNlIG15IFEuIEFuZCBkbyBub3Qgc2V0IGl0IHRvIDAsIGFzIHRoZW4g
c29tZW9uZSB3aWxsCmNvbWUgYW5kIHNheSB0aGlzIGlzIGRlZmF1bHQgYW5kIGRlbGV0ZSBpdC4K
TWF5YmUgbWVudGlvbiBpdCBpbiB0aGUgY2hhbmdlbG9nLgoKCj4gCj4gPgo+ID4gPiArCj4gPiA+
ICtzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2Mgc2hhcnBfbGRfZDUxMTZ6MDFiID0gewo+
ID4gPiArICAgICAubW9kZXMgPSAmc2hhcnBfbGRfZDUxMTZ6MDFiX21vZGUsCj4gPiA+ICsgICAg
IC5udW1fbW9kZXMgPSAxLAo+ID4gPiArICAgICAuYnBjID0gOCwKPiA+ID4gKyAgICAgLnNpemUg
PSB7Cj4gPiA+ICsgICAgICAgICAgICAgLndpZHRoID0gMjYwLAo+ID4gPiArICAgICAgICAgICAg
IC5oZWlnaHQgPSAxMjAsCj4gPiA+ICsgICAgIH0sCj4gPiA+ICt9Owo+ID4gTm8gLmJ1c19mb3Jt
YXQ/Cj4gCj4gQWgsIHllcy4gIExvb2tzIGxpa2UgaXQgc2hvdWxkIGJlIE1FRElBX0JVU19GTVRf
UkdCODg4XzFYMjQKPiBXaWxsIGZpeC4KPiAKPiA+IE5vIC5idXNfZmxhZ3M/Cj4gCj4gZURQIGlz
IGRpZmZlcmVudGlhbCBzaWduYWxpbmcsIHNvIHdoYXQgSSBzZWUgZ2VuZXJhbGx5IGRvZXNuJ3Qg
YXBwbHksCj4gYnV0IERSTV9CVVNfRkxBR19EQVRBX01TQl9UT19MU0IgZG9lcyBhcHBseSwgc28g
SSdsbCBhZGQgdGhhdC4KCldpdGggeW91ciBjaGFuZ2VzIHlvdSBjYW4gYWRkIG15OgpSZXZpZXdl
ZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgoKT24gYm90aCBwYXRjaGVzLgoK
CVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
