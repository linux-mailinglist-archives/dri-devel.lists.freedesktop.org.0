Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6F82B6C44
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 18:49:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A237F89C25;
	Tue, 17 Nov 2020 17:49:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BAEB89C18
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 17:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 0DA99FB09;
 Tue, 17 Nov 2020 18:49:40 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BQydNYeGOYsT; Tue, 17 Nov 2020 18:49:38 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 016CC43F6E; Tue, 17 Nov 2020 18:49:37 +0100 (CET)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Ondrej Jirman <megous@megous.com>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzk@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 allen <allen.chen@ite.com.tw>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/6] drm/panel: mantix and st7703 fixes and additions
Date: Tue, 17 Nov 2020 18:49:31 +0100
Message-Id: <cover.1605635248.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhZGRzIG5ldyBwYW5lbCB0eXBlIHRvIHRoZSBtYW50aXggZHJpdmVyIGFzIGZvdW5kIG9u
IHRoZSBMaWJyZW0gNSBhbmQKZml4ZXMgYSBnbGl0Y2ggaW4gdGhlIGluaXQgc2VxdWVuY2UgKGFm
ZmVjdGluZyBib3RoIHBhbmVscykuIFRoZSBmaXggaXMgYXQgdGhlCnN0YXJ0IG9mIHRoZSBzZXJp
ZXMgdG8gbWFrZSBiYWNrcG9ydGluZyBzaW1wbGVyLgpJdCBhbHNvIGFkZHMgYSBwYXRjaCB0byBt
YWtlIHN0NzcwMyB1c2UgZGV2X2Vycl9wcm9iZSgpLgoKR3VpZG8gR8O8bnRoZXIgKDYpOgogIGRy
bS9wYW5lbDogc3Q3NzAzOiBVc2UgZGV2X2Vycl9wcm9iZQogIGRybS9wYW5lbDogbWFudGl4OiBU
d2VhayBpbml0IHNlcXVlbmNlCiAgZHJtL3BhbmVsOiBtYW50aXg6IEFsbG93IHRvIHNwZWNpZnkg
ZGVmYXVsdCBtb2RlIGZvciBkaWZmZXJlbnQgcGFuZWxzCiAgZHJtL3BhbmVsOiBtYW50aXg6IFN1
cHBvcnQgcGFuZWwgZnJvbSBTaGVuemhlbiBZYXNoaSBDaGFuZ2h1YQogICAgSW50ZWxsaWdlbnQg
VGVjaG5vbG9neSBDbwogIGR0LWJpbmRpbmdzOiB2ZW5kb3ItcHJlZml4ZXM6IEFkZCB5cyB2ZW5k
b3IgcHJlZml4CiAgZHQtYmluZGluZzogZGlzcGxheTogbWFudGl4OiBBZGQgY29tcGF0aWJsZSBm
b3IgcGFuZWwgZnJvbSBZUwoKIC4uLi9kaXNwbGF5L3BhbmVsL21hbnRpeCxtbGFmMDU3d2U1MS14
LnlhbWwgICB8ICAxICsKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55
YW1sICB8ICAyICsKIC4uLi9ncHUvZHJtL3BhbmVsL3BhbmVsLW1hbnRpeC1tbGFmMDU3d2U1MS5j
ICB8IDM5ICsrKysrKysrKysrKysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1z
aXRyb25peC1zdDc3MDMuYyB8IDI0ICsrKystLS0tLS0tLQogNCBmaWxlcyBjaGFuZ2VkLCA0MyBp
bnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkKCi0tIAoyLjI5LjIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
