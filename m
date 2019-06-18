Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 034E54A144
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 14:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC616E15F;
	Tue, 18 Jun 2019 12:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA356E15F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 12:58:52 +0000 (UTC)
Received: from aptenodytes (aaubervilliers-681-1-81-150.w90-88.abo.wanadoo.fr
 [90.88.23.150]) (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 551DF200008;
 Tue, 18 Jun 2019 12:58:48 +0000 (UTC)
Message-ID: <bee40295b2c6b489468d4e1fc12d7a1ac122cb9b.camel@bootlin.com>
Subject: Re: [PATCH] backlight: gpio-backlight: Set power state instead of
 brightness at probe
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Date: Tue, 18 Jun 2019 14:58:47 +0200
In-Reply-To: <20190517150546.4508-1-paul.kocialkowski@bootlin.com>
References: <20190517150546.4508-1-paul.kocialkowski@bootlin.com>
Organization: Bootlin
User-Agent: Evolution 3.32.2 
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBGcmksIDIwMTktMDUtMTcgYXQgMTc6MDUgKzAyMDAsIFBhdWwgS29jaWFsa293c2tp
IHdyb3RlOgo+IE9uIGEgdHJpdmlhbCBncGlvLWJhY2tsaWdodCBzZXR1cCB3aXRoIGEgcGFuZWwg
dXNpbmcgdGhlIGJhY2tsaWdodCBidXQKPiBubyBib290IHNvZnR3YXJlIHRvIGVuYWJsZSBpdCBi
ZWZvcmVoYW5kLCB3ZSBmYWxsIGluIGEgY2FzZSB3aGVyZSB0aGUKPiBiYWNrbGlnaHQgaXMgZGlz
YWJsZWQgKG5vdCBqdXN0IGJsYW5rZWQpIGFuZCB0aHVzIHJlbWFpbnMgZGlzYWJsZWQgd2hlbgo+
IHRoZSBwYW5lbCBnZXRzIGVuYWJsZWQuCj4gCj4gU2V0dGluZyBnYmwtPmRlZl92YWx1ZSB2aWEg
dGhlIGRldmljZS10cmVlIHByb3AgYWxsb3dzIGVuYWJsaW5nIHRoZQo+IGJhY2tsaWdodCBpbiB0
aGlzIHNpdHVhdGlvbiwgYnV0IGl0IHdpbGwgYmUgdW5ibGFua2VkIHN0cmFpZ2h0IGF3YXksCj4g
aW4gY29tcGxpYW5jZSB3aXRoIHRoZSBiaW5kaW5nLiBUaGlzIGRvZXMgbm90IHdvcmsgd2VsbCB3
aGVuIHRoZXJlIHdhcyBubwo+IGJvb3Qgc29mdHdhcmUgdG8gZGlzcGxheSBzb21ldGhpbmcgYmVm
b3JlLCBzaW5jZSB3ZSByZWFsbHkgbmVlZCB0byB1bmJsYW5rCj4gYnkgdGhlIHRpbWUgdGhlIHBh
bmVsIGlzIGVuYWJsZWQsIG5vdCBiZWZvcmUuCj4gCj4gUmVzb2x2ZSB0aGUgc2l0dWF0aW9uIGJ5
IHNldHRpbmcgdGhlIGJyaWdodG5lc3MgdG8gMSBhdCBwcm9iZSBhbmQKPiBtYW5hZ2luZyB0aGUg
cG93ZXIgc3RhdGUgYWNjb3JkaW5nbHksIGEgYml0IGxpa2UgaXQncyBkb25lIGluCj4gcHdtLWJh
Y2tsaWdodC4KCkFueSBmZWVkYmFjayBvbiB0aGlzPyBJIHdhcyB1bmRlciB0aGUgaW1wcmVzc2lv
biB0aGF0IGl0IGNvdWxkIGJlIHF1aXRlCmNvbnRyb3ZlcnNpYWwsIGFzIGl0IGltcGxpZXMgdGhh
dCB0aGUgYmFja2xpZ2h0IGNhbiBubyBsb25nZXIgYmUKZW5hYmxlZCB3aXRob3V0IGEgYm91bmQg
cGFuZWwgKHdoaWNoIElNTyBtYWtlcyBnb29kIHNlbnNlIGJ1dCBjb3VsZCBiZQphIG1hdHRlciB0
byBkZWJhdGUpLgoKQ2hlZXJzLAoKUGF1bAoKPiBGaXhlczogOGI3NzBlM2M5ODI0ICgiYmFja2xp
Z2h0OiBBZGQgR1BJTy1iYXNlZCBiYWNrbGlnaHQgZHJpdmVyIikKPiBTaWduZWQtb2ZmLWJ5OiBQ
YXVsIEtvY2lhbGtvd3NraSA8cGF1bC5rb2NpYWxrb3dza2lAYm9vdGxpbi5jb20+Cj4gLS0tCj4g
IGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMgfCAxOSArKysrKysrKysr
KysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xp
Z2h0LmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jCj4gaW5kZXgg
ZTQ3MGRhOTVkODA2Li5jOWNiOTdmYTEzZDAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9i
YWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0
L2dwaW9fYmFja2xpZ2h0LmMKPiBAQCAtNTcsNiArNTcsMjEgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBiYWNrbGlnaHRfb3BzIGdwaW9fYmFja2xpZ2h0X29wcyA9IHsKPiAgCS5jaGVja19mYgk9IGdw
aW9fYmFja2xpZ2h0X2NoZWNrX2ZiLAo+ICB9Owo+ICAKPiArc3RhdGljIGludCBncGlvX2JhY2ts
aWdodF9pbml0aWFsX3Bvd2VyX3N0YXRlKHN0cnVjdCBncGlvX2JhY2tsaWdodCAqZ2JsKQo+ICt7
Cj4gKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUgPSBnYmwtPmRldi0+b2Zfbm9kZTsKPiArCj4g
KwkvKiBJZiB3ZSBhYnNvbHV0ZWx5IHdhbnQgdGhlIGJhY2tsaWdodCBlbmFibGVkIGF0IGJvb3Qu
ICovCj4gKwlpZiAoZ2JsLT5kZWZfdmFsdWUpCj4gKwkJcmV0dXJuIEZCX0JMQU5LX1VOQkxBTks7
Cj4gKwo+ICsJLyogSWYgdGhlcmUncyBubyBwYW5lbCB0byB1bmJsYW5rIHRoZSBiYWNrbGlnaHQg
bGF0ZXIuICovCj4gKwlpZiAoIW5vZGUgfHwgIW5vZGUtPnBoYW5kbGUpCj4gKwkJcmV0dXJuIEZC
X0JMQU5LX1VOQkxBTks7Cj4gKwo+ICsJcmV0dXJuIEZCX0JMQU5LX1BPV0VSRE9XTjsKPiArfQo+
ICsKPiAgc3RhdGljIGludCBncGlvX2JhY2tsaWdodF9wcm9iZV9kdChzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2LAo+ICAJCQkJICAgc3RydWN0IGdwaW9fYmFja2xpZ2h0ICpnYmwpCj4gIHsK
PiBAQCAtMTQyLDcgKzE1Nyw5IEBAIHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCQlyZXR1cm4gUFRSX0VSUihibCk7Cj4gIAl9
Cj4gIAo+IC0JYmwtPnByb3BzLmJyaWdodG5lc3MgPSBnYmwtPmRlZl92YWx1ZTsKPiArCWJsLT5w
cm9wcy5icmlnaHRuZXNzID0gMTsKPiArCWJsLT5wcm9wcy5wb3dlciA9IGdwaW9fYmFja2xpZ2h0
X2luaXRpYWxfcG93ZXJfc3RhdGUoZ2JsKTsKPiArCj4gIAliYWNrbGlnaHRfdXBkYXRlX3N0YXR1
cyhibCk7Cj4gIAo+ICAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgYmwpOwotLSAKUGF1bCBL
b2NpYWxrb3dza2ksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIGtlcm5lbCBlbmdpbmVlcmlu
ZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
