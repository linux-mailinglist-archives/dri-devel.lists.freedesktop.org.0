Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E7276731
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 15:19:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 684516ED52;
	Fri, 26 Jul 2019 13:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E076ED52
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 13:19:50 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 403945C02B3;
 Fri, 26 Jul 2019 15:19:48 +0200 (CEST)
MIME-Version: 1.0
Date: Fri, 26 Jul 2019 15:19:47 +0200
From: Stefan Agner <stefan@agner.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 06/60] drm/bridge: simple-bridge: Add support for enable
 GPIO
In-Reply-To: <20190707181937.6250-3-laurent.pinchart@ideasonboard.com>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-3-laurent.pinchart@ideasonboard.com>
Message-ID: <55785e7b132d343d59e52b4a36168e72@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1564147188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=foNJwAWS3Zuf0fupbdl9exJR4mrM3RJBZIEnBfUNyu8=;
 b=jLLRoM5TnhKRGJaA06SPiHHx074Za5zvb8i2KT10n6quejaTET7eW4JkXTmWPM7GmhZ+m8
 o1xLfqCow8m5cXT1Ncii3SRVjPoW5vn1F8wopxmdb2cPiXtd7ZPgB97FDKRTa+Oy1Z4OD6
 8cRYbXp5NnrL44Qej6ggTYbFmA1p4iM=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0wNyAyMDoxOCwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBJZiBhbiBlbmFi
bGUgR1BJTyBpcyBkZWNsYXJlZCBpbiB0aGUgZmlybXdhcmUsIGFzc2VydCBpdCB3aGVuIGVuYWJs
aW5nCj4gdGhlIGJyaWRnZSBhbmQgZGVhc3NlcnQgaXQgd2hlbiBkaXNhYmxpbmcgaXQuCj4gCj4g
U2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29u
Ym9hcmQuY29tPgoKVGhpcyBhbHNvIGNvbWVzIGluIGhhbmR5IGZvciB0aGUgQURWNzEyMywgd2hp
Y2ggaGFzIGEgcG93ZXIgc2F2ZSBwaW4uCgpMb29rcyBnb29kIHRvIG1lLgoKUmV2aWV3ZWQtYnk6
IFN0ZWZhbiBBZ25lciA8c3RlZmFuQGFnbmVyLmNoPgoKLS0KU3RlZmFuCgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3NpbXBsZS1icmlkZ2UuYyB8IDIyICsrKysrKysrKysrKysrKysr
Ky0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2ltcGxlLWJyaWRnZS5j
Cj4gYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpbXBsZS1icmlkZ2UuYwo+IGluZGV4IGJmZjI0
MGNmMjgzZC4uYTdlZGYzYzM5NjI3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc2ltcGxlLWJyaWRnZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaW1wbGUt
YnJpZGdlLmMKPiBAQCAtNiw2ICs2LDcgQEAKPiAgICogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJp
cGFyZEBmcmVlLWVsZWN0cm9ucy5jb20+Cj4gICAqLwo+ICAKPiArI2luY2x1ZGUgPGxpbnV4L2dw
aW8vY29uc3VtZXIuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ICAjaW5jbHVkZSA8
bGludXgvb2ZfZGV2aWNlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9vZl9ncmFwaC5oPgo+IEBAIC0y
OSw2ICszMCw3IEBAIHN0cnVjdCBzaW1wbGVfYnJpZGdlIHsKPiAgCj4gIAlzdHJ1Y3QgaTJjX2Fk
YXB0ZXIJKmRkYzsKPiAgCXN0cnVjdCByZWd1bGF0b3IJKnZkZDsKPiArCXN0cnVjdCBncGlvX2Rl
c2MJKmVuYWJsZTsKPiAgfTsKPiAgCj4gIHN0YXRpYyBpbmxpbmUgc3RydWN0IHNpbXBsZV9icmlk
Z2UgKgo+IEBAIC0xMzUsMTkgKzEzNywyMyBAQCBzdGF0aWMgaW50IHNpbXBsZV9icmlkZ2VfYXR0
YWNoKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCj4gIHN0YXRpYyB2b2lkIHNpbXBsZV9icmlk
Z2VfZW5hYmxlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCj4gIHsKPiAgCXN0cnVjdCBzaW1w
bGVfYnJpZGdlICpzYnJpZGdlID0gZHJtX2JyaWRnZV90b19zaW1wbGVfYnJpZGdlKGJyaWRnZSk7
Cj4gLQlpbnQgcmV0ID0gMDsKPiArCWludCByZXQ7Cj4gIAo+IC0JaWYgKHNicmlkZ2UtPnZkZCkK
PiArCWlmIChzYnJpZGdlLT52ZGQpIHsKPiAgCQlyZXQgPSByZWd1bGF0b3JfZW5hYmxlKHNicmlk
Z2UtPnZkZCk7Cj4gKwkJaWYgKHJldCkKPiArCQkJRFJNX0VSUk9SKCJGYWlsZWQgdG8gZW5hYmxl
IHZkZCByZWd1bGF0b3I6ICVkXG4iLCByZXQpOwo+ICsJfQo+ICAKPiAtCWlmIChyZXQpCj4gLQkJ
RFJNX0VSUk9SKCJGYWlsZWQgdG8gZW5hYmxlIHZkZCByZWd1bGF0b3I6ICVkXG4iLCByZXQpOwo+
ICsJZ3Bpb2Rfc2V0X3ZhbHVlX2NhbnNsZWVwKHNicmlkZ2UtPmVuYWJsZSwgMSk7Cj4gIH0KPiAg
Cj4gIHN0YXRpYyB2b2lkIHNpbXBsZV9icmlkZ2VfZGlzYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAq
YnJpZGdlKQo+ICB7Cj4gIAlzdHJ1Y3Qgc2ltcGxlX2JyaWRnZSAqc2JyaWRnZSA9IGRybV9icmlk
Z2VfdG9fc2ltcGxlX2JyaWRnZShicmlkZ2UpOwo+ICAKPiArCWdwaW9kX3NldF92YWx1ZV9jYW5z
bGVlcChzYnJpZGdlLT5lbmFibGUsIDApOwo+ICsKPiAgCWlmIChzYnJpZGdlLT52ZGQpCj4gIAkJ
cmVndWxhdG9yX2Rpc2FibGUoc2JyaWRnZS0+dmRkKTsKPiAgfQo+IEBAIC0yMDAsNiArMjA2LDE0
IEBAIHN0YXRpYyBpbnQgc2ltcGxlX2JyaWRnZV9wcm9iZShzdHJ1Y3QKPiBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCj4gIAkJZGV2X2RiZygmcGRldi0+ZGV2LCAiTm8gdmRkIHJlZ3VsYXRvciBmb3Vu
ZDogJWRcbiIsIHJldCk7Cj4gIAl9Cj4gIAo+ICsJc2JyaWRnZS0+ZW5hYmxlID0gZGV2bV9ncGlv
ZF9nZXRfb3B0aW9uYWwoJnBkZXYtPmRldiwgImVuYWJsZSIsCj4gKwkJCQkJCSAgR1BJT0RfT1VU
X0xPVyk7Cj4gKwlpZiAoSVNfRVJSKHNicmlkZ2UtPmVuYWJsZSkpIHsKPiArCQlpZiAoUFRSX0VS
UihzYnJpZGdlLT5lbmFibGUpICE9IC1FUFJPQkVfREVGRVIpCj4gKwkJCWRldl9lcnIoJnBkZXYt
PmRldiwgIlVuYWJsZSB0byByZXRyaWV2ZSBlbmFibGUgR1BJT1xuIik7Cj4gKwkJcmV0dXJuIFBU
Ul9FUlIoc2JyaWRnZS0+ZW5hYmxlKTsKPiArCX0KPiArCj4gIAlzYnJpZGdlLT5kZGMgPSBzaW1w
bGVfYnJpZGdlX3JldHJpZXZlX2RkYygmcGRldi0+ZGV2KTsKPiAgCWlmIChJU19FUlIoc2JyaWRn
ZS0+ZGRjKSkgewo+ICAJCWlmIChQVFJfRVJSKHNicmlkZ2UtPmRkYykgPT0gLUVOT0RFVikgewpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
