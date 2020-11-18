Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7232B78AB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 09:30:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D09489D1D;
	Wed, 18 Nov 2020 08:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C5489D1D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 08:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id B6EB0FB09;
 Wed, 18 Nov 2020 09:29:55 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I99od-13bLvc; Wed, 18 Nov 2020 09:29:54 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 75E7943F6F; Wed, 18 Nov 2020 09:29:53 +0100 (CET)
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
Subject: [PATCH v2 0/6] drm/panel: mantix and st7703 fixes and additions
Date: Wed, 18 Nov 2020 09:29:47 +0100
Message-Id: <cover.1605688147.git.agx@sigxcpu.org>
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
YWtlIHN0NzcwMyB1c2UgZGV2X2Vycl9wcm9iZSgpLgoKY2hhbmdlcyBmcm9tIHYxCi0gYXMgcGVy
IHJldmlldyBjb21tZW50cyBieSBMaW51cyBXYWxsZWlqCiAgLSBmaXggYWxwaGFiZXRpY2FsIG9y
ZGVyaW5nIGluIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4
ZXMueWFtbAogICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvZHJpLWRldmVsL0NBQ1Jwa2Rhb19U
TWNwUnNkSz03SzVmTktKc2UwQnF3azU4aVd1MHhzWGRETmRjZmZWQUBtYWlsLmdtYWlsLmNvbS8K
ICAtIGFkZCByZXZpZXdlZCBieSB0byBhbGwgZXhjZXB0IDUvNiwgdGhhbmtzCgpHdWlkbyBHw7xu
dGhlciAoNik6CiAgZHJtL3BhbmVsOiBzdDc3MDM6IFVzZSBkZXZfZXJyX3Byb2JlCiAgZHJtL3Bh
bmVsOiBtYW50aXg6IFR3ZWFrIGluaXQgc2VxdWVuY2UKICBkcm0vcGFuZWw6IG1hbnRpeDogQWxs
b3cgdG8gc3BlY2lmeSBkZWZhdWx0IG1vZGUgZm9yIGRpZmZlcmVudCBwYW5lbHMKICBkcm0vcGFu
ZWw6IG1hbnRpeDogU3VwcG9ydCBwYW5lbCBmcm9tIFNoZW56aGVuIFlhc2hpIENoYW5naHVhCiAg
ICBJbnRlbGxpZ2VudCBUZWNobm9sb2d5IENvCiAgZHQtYmluZGluZ3M6IHZlbmRvci1wcmVmaXhl
czogQWRkIHlzIHZlbmRvciBwcmVmaXgKICBkdC1iaW5kaW5nOiBkaXNwbGF5OiBtYW50aXg6IEFk
ZCBjb21wYXRpYmxlIGZvciBwYW5lbCBmcm9tIFlTCgogLi4uL2Rpc3BsYXkvcGFuZWwvbWFudGl4
LG1sYWYwNTd3ZTUxLXgueWFtbCAgIHwgIDEgKwogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvdmVu
ZG9yLXByZWZpeGVzLnlhbWwgIHwgIDIgKwogLi4uL2dwdS9kcm0vcGFuZWwvcGFuZWwtbWFudGl4
LW1sYWYwNTd3ZTUxLmMgIHwgMzkgKysrKysrKysrKysrKysrLS0tLQogZHJpdmVycy9ncHUvZHJt
L3BhbmVsL3BhbmVsLXNpdHJvbml4LXN0NzcwMy5jIHwgMjQgKysrKy0tLS0tLS0tCiA0IGZpbGVz
IGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQoKLS0gCjIuMjkuMgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
