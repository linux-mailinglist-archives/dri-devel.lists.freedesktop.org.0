Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1857C10DF71
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2019 22:51:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9E36E059;
	Sat, 30 Nov 2019 21:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792286E059
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2019 21:51:33 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id BD6322002B;
 Sat, 30 Nov 2019 22:51:29 +0100 (CET)
Date: Sat, 30 Nov 2019 22:51:28 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCHv1 1/2] drm/panel: simple: Add support for AUO G121EAN01.4
 panel
Message-ID: <20191130215128.GB29715@ravnborg.org>
References: <20191107172331.14362-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191107172331.14362-1-sebastian.reichel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QX4gbG5DAAAA:8
 a=mHQZmhpCeS4WpH_mRSAA:9 a=CjuIK1q_8ugA:10 a=AbAUZ8qAyYyZVLSsDulk:22
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2ViYXN0aWFuLgpPbiBUaHUsIE5vdiAwNywgMjAxOSBhdCAwNjoyMzozMFBNICswMTAwLCBT
ZWJhc3RpYW4gUmVpY2hlbCB3cm90ZToKPiBBZGQgdGltaW5ncyBmb3IgdGhlIEFVTyBHMTIxRUFO
MDEuNCBwYW5lbC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTZWJhc3RpYW4gUmVpY2hlbCA8c2ViYXN0
aWFuLnJlaWNoZWxAY29sbGFib3JhLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLXNpbXBsZS5jIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxl
IGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNp
bXBsZS5jCj4gaW5kZXggMjhmYTZiYTdiNzY3Li40NmNhNTlkYjY4MTkgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4gQEAgLTgwNiw2ICs4MDYsMjkgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBwYW5lbF9kZXNjIGF1b19nMTA0c24wMiA9IHsKPiAgCX0sCj4gIH07Cj4gIAo+
ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgYXVvX2cxMjFlYW4wMV9tb2Rl
ID0gewo+ICsJLmNsb2NrID0gNjY3MDAsCj4gKwkuaGRpc3BsYXkgPSAxMjgwLAo+ICsJLmhzeW5j
X3N0YXJ0ID0gMTI4MCArIDU4LAo+ICsJLmhzeW5jX2VuZCA9IDEyODAgKyA1OCArIDgsCj4gKwku
aHRvdGFsID0gMTI4MCArIDU4ICsgOCArIDcwLAo+ICsJLnZkaXNwbGF5ID0gODAwLAo+ICsJLnZz
eW5jX3N0YXJ0ID0gODAwICsgNiwKPiArCS52c3luY19lbmQgPSA4MDAgKyA2ICsgNCwKPiArCS52
dG90YWwgPSA4MDAgKyA2ICsgNCArIDEwLAo+ICsJLnZyZWZyZXNoID0gNjAsCj4gK307Cj4gKwo+
ICtzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2MgYXVvX2cxMjFlYW4wMSA9IHsKPiArCS5t
b2RlcyA9ICZhdW9fZzEyMWVhbjAxX21vZGUsCj4gKwkubnVtX21vZGVzID0gMSwKPiArCS5icGMg
PSA4LAo+ICsJLnNpemUgPSB7Cj4gKwkJLndpZHRoID0gMjYxLAo+ICsJCS5oZWlnaHQgPSAxNjMs
Cj4gKwl9LAo+ICt9Owo+ICsKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBkaXNwbGF5X3RpbWluZyBh
dW9fZzEzM2hhbjAxX3RpbWluZ3MgPSB7Cj4gIAkucGl4ZWxjbG9jayA9IHsgMTM0MDAwMDAwLCAx
NDEyMDAwMDAsIDE0OTAwMDAwMCB9LAo+ICAJLmhhY3RpdmUgPSB7IDE5MjAsIDE5MjAsIDE5MjAg
fSwKPiBAQCAtMzExNCw2ICszMTM3LDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2Vf
aWQgcGxhdGZvcm1fb2ZfbWF0Y2hbXSA9IHsKPiAgCX0sIHsKPiAgCQkuY29tcGF0aWJsZSA9ICJh
dW8sZzEwNHNuMDIiLAo+ICAJCS5kYXRhID0gJmF1b19nMTA0c24wMiwKPiArCX0sIHsKPiArCQku
Y29tcGF0aWJsZSA9ICJhdW8sZzEyMWVhbjAxLjQiLAo+ICsJCS5kYXRhID0gJmF1b19nMTIxZWFu
MDEsCgpJIGRpZCBub3QgZmluZCBhbnkgYmluZGluZyBkb2N1bWVudCBmb3IgdGhpcywKc28gSSBj
YW5ub3QgYXBwbHkuCklmIHlvdSBuZWVkIHRvIGNyZWF0ZSBhIG5ldyBiaW5kaW5nIHRoZW4gcGxl
YXNlCnVzZSB0aGUgbWV0YS1zY2hlbWEgZm9ybWF0ICgueWFtbCkuCgoJU2FtCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
