Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 357EA225AB5
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 11:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632836E252;
	Mon, 20 Jul 2020 09:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6836E252
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 09:03:06 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id DE4C95C2657;
 Mon, 20 Jul 2020 11:03:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1595235784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZGN64Po53f3Pa0cff0t7HE/aei+YsCtVQ1Yq8k7+wZs=;
 b=lXnoT4FIexWZkT91juROAc/bi9uHHT9cZ/CcEw91QKSWzrNaESFylxO9Xgqnz7hu5nSW8a
 ajYx1IjFtwnw+sqoVnQ4Yx/2OWNDMLtCffchE5a9UjCjI/xuOf+YeYZ2n11z/qZDHrb56g
 ApH+eBJ5BshrQU6TCoNJEuqajZ1z+js=
MIME-Version: 1.0
Date: Mon, 20 Jul 2020 11:03:04 +0200
From: Stefan Agner <stefan@agner.ch>
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH] drm/mxsfb: Make supported modifiers explicit
In-Reply-To: <20200718171407.GA72952@bogon.m.sigxcpu.org>
References: <26877532e272c12a74c33188e2a72abafc9a2e1c.1584973664.git.agx@sigxcpu.org>
 <d39209a3664179f895a7dfabbd02d27a6adb9895.camel@pengutronix.de>
 <20200718171407.GA72952@bogon.m.sigxcpu.org>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <427ac44d83e9502afb5a809f28544d6c@agner.ch>
X-Sender: stefan@agner.ch
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Marek Vasut <marex@denx.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wNy0xOCAxOToxNCwgR3VpZG8gR8O8bnRoZXIgd3JvdGU6Cj4gSGksCj4gT24gTW9u
LCBNYXIgMjMsIDIwMjAgYXQgMDQ6NTE6MDVQTSArMDEwMCwgTHVjYXMgU3RhY2ggd3JvdGU6Cj4+
IEFtIE1vbnRhZywgZGVuIDIzLjAzLjIwMjAsIDE1OjUyICswMTAwIHNjaHJpZWIgR3VpZG8gR8O8
bnRoZXI6Cj4+ID4gSW4gY29udHJhc3QgdG8gb3RoZXIgZGlzcGxheSBjb250cm9sbGVycyBvbiBp
bXggbGlrZSBEQ1NTIGFuZCBpcHV2Mwo+PiA+IGxjZGlmL214c2ZiIGRvZXMgbm90IHN1cHBvcnQg
ZGV0aWxpbmcgZS5nLiB2aXZhbnRlIHRpbGVkIGxheW91dHMuCj4+ID4gU2luY2UgbWVzYSBtaWdo
dCBhc3N1bWUgb3RoZXJ3aXNlIG1ha2UgaXQgZXhwbGljaXQgdGhhdCBvbmx5Cj4+ID4gRFJNX0ZP
Uk1BVF9NT0RfTElORUFSIGlzIHN1cHBvcnRlZC4KPj4gPgo+PiA+IFNpZ25lZC1vZmYtYnk6IEd1
aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+Cj4+Cj4+IFJldmlld2VkLWJ5OiBMdWNhcyBT
dGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KPiAKPiBDYW4gaSBkbyBhbnl0aGluZyB0byBn
ZXQgdGhpcyBhcHBsaWVkPwo+IENoZWVycywKPiAgLS0gR3VpZG8KClNvcnJ5IGFib3V0IHRoZSBk
ZWxheSwgSSB3YXMgdGhpbmtpbmcgdG8gYXBwbHkgaXQgd2l0aCBhbm90aGVyIHBhdGNoc2V0Cndo
aWNoIGlzIG5vdCByZWFkeSB0aG91Z2guCgpQdXNoZWQgdGhpcyBwYXRjaCB0byBkcm0tbWlzYy1u
ZXh0IGp1c3Qgbm93LgoKLS0KU3RlZmFuCgo+IAo+Pgo+PiA+IC0tLQo+PiA+ICBkcml2ZXJzL2dw
dS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMgfCA5ICsrKysrKystLQo+PiA+ICAxIGZpbGUgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+PiA+Cj4+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9teHNm
Yi9teHNmYl9kcnYuYwo+PiA+IGluZGV4IDc2MjM3OTUzMDkyOC4uZmM3MWU3YTdhMDJlIDEwMDY0
NAo+PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9kcnYuYwo+PiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9kcnYuYwo+PiA+IEBAIC03Myw2ICs3MywxMSBA
QCBzdGF0aWMgY29uc3QgdWludDMyX3QgbXhzZmJfZm9ybWF0c1tdID0gewo+PiA+ICAJRFJNX0ZP
Uk1BVF9SR0I1NjUKPj4gPiAgfTsKPj4gPgo+PiA+ICtzdGF0aWMgY29uc3QgdWludDY0X3QgbXhz
ZmJfbW9kaWZpZXJzW10gPSB7Cj4+ID4gKwlEUk1fRk9STUFUX01PRF9MSU5FQVIsCj4+ID4gKwlE
Uk1fRk9STUFUX01PRF9JTlZBTElECj4+ID4gK307Cj4+ID4gKwo+PiA+ICBzdGF0aWMgc3RydWN0
IG14c2ZiX2RybV9wcml2YXRlICoKPj4gPiAgZHJtX3BpcGVfdG9fbXhzZmJfZHJtX3ByaXZhdGUo
c3RydWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlICpwaXBlKQo+PiA+ICB7Cj4+ID4gQEAgLTMz
NCw4ICszMzksOCBAQCBzdGF0aWMgaW50IG14c2ZiX2xvYWQoc3RydWN0IGRybV9kZXZpY2UgKmRy
bSwgdW5zaWduZWQgbG9uZyBmbGFncykKPj4gPiAgCX0KPj4gPgo+PiA+ICAJcmV0ID0gZHJtX3Np
bXBsZV9kaXNwbGF5X3BpcGVfaW5pdChkcm0sICZteHNmYi0+cGlwZSwgJm14c2ZiX2Z1bmNzLAo+
PiA+IC0JCQlteHNmYl9mb3JtYXRzLCBBUlJBWV9TSVpFKG14c2ZiX2Zvcm1hdHMpLCBOVUxMLAo+
PiA+IC0JCQlteHNmYi0+Y29ubmVjdG9yKTsKPj4gPiArCQkJbXhzZmJfZm9ybWF0cywgQVJSQVlf
U0laRShteHNmYl9mb3JtYXRzKSwKPj4gPiArCQkJbXhzZmJfbW9kaWZpZXJzLCBteHNmYi0+Y29u
bmVjdG9yKTsKPj4gPiAgCWlmIChyZXQgPCAwKSB7Cj4+ID4gIAkJZGV2X2Vycihkcm0tPmRldiwg
IkNhbm5vdCBzZXR1cCBzaW1wbGUgZGlzcGxheSBwaXBlXG4iKTsKPj4gPiAgCQlnb3RvIGVycl92
Ymxhbms7Cj4+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
