Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0C176401
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 13:00:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492836ED1C;
	Fri, 26 Jul 2019 11:00:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032576ED1C
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 11:00:39 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 0FABA5C02B3;
 Fri, 26 Jul 2019 13:00:37 +0200 (CEST)
MIME-Version: 1.0
Date: Fri, 26 Jul 2019 13:00:37 +0200
From: Stefan Agner <stefan@agner.ch>
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH 1/1] drm/mxsfb: Read bus flags from bridge if present
In-Reply-To: <9390060f65f94722cb13101d4835d9048037f7a0.1564134488.git.agx@sigxcpu.org>
References: <cover.1564134488.git.agx@sigxcpu.org>
 <9390060f65f94722cb13101d4835d9048037f7a0.1564134488.git.agx@sigxcpu.org>
Message-ID: <cdf94095134f91656752d4872fea9d3c@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1564138837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EYDHF2viGAO7INulhQjnGn1wMlyhHlC54xWBdg+6oIw=;
 b=Abl1Av9XYNIGg7/KWzSis/iAAeoLSkkVbDapmS9iSmxuO/x9+keLZx4mhaq96DkqPNeAE1
 Lg0y2TsF9fLpyY4ZCna4GxpQulihTPQ61oUSrDCCx06gBltqE5dOSXM04sqDOCi6Ses1+u
 MeuI7kqT2SLCl26GU59MynKLg9ZyZuM=
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
Cc: Marek Vasut <marex@denx.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Robert Chiras <robert.chiras@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0yNiAxMTo0OSwgR3VpZG8gR8O8bnRoZXIgd3JvdGU6Cj4gVGhlIGJyaWRnZSBt
aWdodCBoYXZlIHNwZWNpYWwgcmVxdWlybWVudGVzIG9uIHRoZSBpbnB1dCBidXMuIFRoaXMKPiBp
cyBlLmcuIHVzZWQgYnkgdGhlIGlteC1ud2wgYnJpZGdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEd1
aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+CgpMb29rcyBnb29kIHRvIG1lLgoKUmV2aWV3
ZWQtYnk6IFN0ZWZhbiBBZ25lciA8c3RlZmFuQGFnbmVyLmNoPgoKClRoYXQgaXMgc2ltaWxhciB0
byB3aGF0IEkgc2VudCBmb3IgdGhlIGlteCBEUk0gZHJpdmVyOgoKaHR0cHM6Ly9sa21sLm9yZy9s
a21sLzIwMTgvOS8xMi85MTMKCkkgcHJvYmFibHkgc2hvdWxkIGZvbGxvdyB1cCBvbiB0aGF0IHBh
dGNoc2V0LgoKLS0KU3RlZmFuCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJf
Y3J0Yy5jIHwgNSArKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9j
cnRjLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9jcnRjLmMKPiBpbmRleCBlODRi
YWMzYTU0MWQuLjNiOGViM2FjMTNiNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXhz
ZmIvbXhzZmJfY3J0Yy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2NydGMu
Ywo+IEBAIC0yMTUsNyArMjE1LDcgQEAgc3RhdGljIHZvaWQgbXhzZmJfY3J0Y19tb2RlX3NldF9u
b2ZiKHN0cnVjdAo+IG14c2ZiX2RybV9wcml2YXRlICpteHNmYikKPiAgewo+ICAJc3RydWN0IGRy
bV9kZXZpY2UgKmRybSA9IG14c2ZiLT5waXBlLmNydGMuZGV2Owo+ICAJc3RydWN0IGRybV9kaXNw
bGF5X21vZGUgKm0gPSAmbXhzZmItPnBpcGUuY3J0Yy5zdGF0ZS0+YWRqdXN0ZWRfbW9kZTsKPiAt
CWNvbnN0IHUzMiBidXNfZmxhZ3MgPSBteHNmYi0+Y29ubmVjdG9yLT5kaXNwbGF5X2luZm8uYnVz
X2ZsYWdzOwo+ICsJdTMyIGJ1c19mbGFncyA9IG14c2ZiLT5jb25uZWN0b3ItPmRpc3BsYXlfaW5m
by5idXNfZmxhZ3M7Cj4gIAl1MzIgdmRjdHJsMCwgdnN5bmNfcHVsc2VfbGVuLCBoc3luY19wdWxz
ZV9sZW47Cj4gIAlpbnQgZXJyOwo+ICAKPiBAQCAtMjM5LDYgKzIzOSw5IEBAIHN0YXRpYyB2b2lk
IG14c2ZiX2NydGNfbW9kZV9zZXRfbm9mYihzdHJ1Y3QKPiBteHNmYl9kcm1fcHJpdmF0ZSAqbXhz
ZmIpCj4gIAo+ICAJY2xrX3NldF9yYXRlKG14c2ZiLT5jbGssIG0tPmNydGNfY2xvY2sgKiAxMDAw
KTsKPiAgCj4gKwlpZiAobXhzZmItPmJyaWRnZSAmJiBteHNmYi0+YnJpZGdlLT50aW1pbmdzKQo+
ICsJCWJ1c19mbGFncyA9IG14c2ZiLT5icmlkZ2UtPnRpbWluZ3MtPmlucHV0X2J1c19mbGFnczsK
PiArCj4gIAlEUk1fREVWX0RFQlVHX0RSSVZFUihkcm0tPmRldiwgIlBpeGVsIGNsb2NrOiAlZGtI
eiAoYWN0dWFsOiAlZGtIeilcbiIsCj4gIAkJCSAgICAgbS0+Y3J0Y19jbG9jaywKPiAgCQkJICAg
ICAoaW50KShjbGtfZ2V0X3JhdGUobXhzZmItPmNsaykgLyAxMDAwKSk7Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
