Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2945272F4F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 18:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815ED6E4E3;
	Mon, 21 Sep 2020 16:56:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12A36E27F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 16:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 1C5B3FB02;
 Mon, 21 Sep 2020 18:55:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LDczi--xHyzy; Mon, 21 Sep 2020 18:55:55 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 11CD7457CD; Mon, 21 Sep 2020 18:55:53 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 3/3] dt-binding: display: Require two rests on mantix
 panel
Date: Mon, 21 Sep 2020 18:55:52 +0200
Message-Id: <71a9108f3472ba9af4bead01b1b770d1e73eb08e.1600707235.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1600707235.git.agx@sigxcpu.org>
References: <cover.1600707235.git.agx@sigxcpu.org>
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

V2UgbmVlZCB0byByZXNldCBib3RoIGZvciB0aGUgcGFuZWwgdG8gc2hvdyBhbiBpbWFnZS4KClNp
Z25lZC1vZmYtYnk6IEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+Ci0tLQogLi4uL2Jp
bmRpbmdzL2Rpc3BsYXkvcGFuZWwvbWFudGl4LG1sYWYwNTd3ZTUxLXgueWFtbCAgICAgICB8IDcg
KysrKystLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9w
YW5lbC9tYW50aXgsbWxhZjA1N3dlNTEteC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvbWFudGl4LG1sYWYwNTd3ZTUxLXgueWFtbAppbmRleCA5
MzczMjNjYzlhYWEuLmJhNWExOGZhYzlmOSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvbWFudGl4LG1sYWYwNTd3ZTUxLXgueWFtbAor
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9tYW50
aXgsbWxhZjA1N3dlNTEteC55YW1sCkBAIC0zNSw3ICszNSw5IEBAIHByb3BlcnRpZXM6CiAgIHZk
ZGktc3VwcGx5OgogICAgIGRlc2NyaXB0aW9uOiAxLjhWIEkvTyB2b2x0YWdlIHN1cHBseQogCi0g
IHJlc2V0LWdwaW9zOiB0cnVlCisgIHJlc2V0LWdwaW9zOgorICAgIG1pbkl0ZW1zOiAyCisgICAg
bWF4SXRlbXM6IDIKIAogICBiYWNrbGlnaHQ6IHRydWUKIApAQCAtNjIsNyArNjQsOCBAQCBleGFt
cGxlczoKICAgICAgICAgICAgIGF2ZGQtc3VwcGx5ID0gPCZyZWdfYXZkZD47CiAgICAgICAgICAg
ICBhdmVlLXN1cHBseSA9IDwmcmVnX2F2ZWU+OwogICAgICAgICAgICAgdmRkaS1zdXBwbHkgPSA8
JnJlZ18xdjhfcD47Ci0gICAgICAgICAgICByZXNldC1ncGlvcyA9IDwmZ3BpbzEgMjkgR1BJT19B
Q1RJVkVfTE9XPjsKKyAgICAgICAgICAgIHJlc2V0LWdwaW9zID0gPCZncGlvMSAyOSBHUElPX0FD
VElWRV9MT1c+LAorICAgICAgICAgICAgICAgICAgICAgICAgICA8JmdwaW8xIDI0IEdQSU9fQUNU
SVZFX0xPVz47CiAgICAgICAgICAgICBiYWNrbGlnaHQgPSA8JmJhY2tsaWdodD47CiAgICAgICAg
IH07CiAgICAgfTsKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
