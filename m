Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA8F244A7C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 15:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC0E86EB49;
	Fri, 14 Aug 2020 13:36:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ABC06EB45
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 13:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 1E861FB07;
 Fri, 14 Aug 2020 15:36:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q6Zfzkg2jRDO; Fri, 14 Aug 2020 15:36:24 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id EC786457CC; Fri, 14 Aug 2020 15:36:23 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Daniel Palmer <daniel@0x0f.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 allen <allen.chen@ite.com.tw>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] drm/panel: Add panel driver for the Mantix MLAF057WE51-X
 DSI panel
Date: Fri, 14 Aug 2020 15:36:20 +0200
Message-Id: <cover.1597412076.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.26.2
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

VGhlIHBhbmVsIHVzZXMgYSBGb2NhbHRlY2ggRlQ4MDA2cCwgdGhlIHRvdWNoIHBhcnQgaXMgaGFu
ZGxlZCBieSB0aGUgYWxyZWFkeQpleGlzdGluZyBlZHQtZnQ1eDA2LiBJdCBjYW4gYmUgZm91bmQg
aW4gZS5nLiB0aGUgTGlicmVtIDUuCgpUaGlzIHNlcmllcyBpcyBhZ2FpbnN0IG5leHQtMjAyMDA4
MTQuCgpHdWlkbyBHw7xudGhlciAoMyk6CiAgZHQtYmluZGluZ3M6IHZlbmRvci1wcmVmaXhlczog
QWRkIG1hbnRpeCB2ZW5kb3IgcHJlZml4CiAgZHQtYmluZGluZ3M6IEFkZCBNYW50aXggTUxBRjA1
N1dFNTEtWCBwYW5lbCBiaW5kaW5ncwogIGRybS9wYW5lbDogQWRkIHBhbmVsIGRyaXZlciBmb3Ig
dGhlIE1hbnRpeCBNTEFGMDU3V0U1MS1YIERTSSBwYW5lbAoKIC4uLi9kaXNwbGF5L3BhbmVsL21h
bnRpeCxtbGFmMDU3d2U1MS14LnlhbWwgICB8ICA3MyArKysrCiAuLi4vZGV2aWNldHJlZS9iaW5k
aW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbCAgfCAgIDIgKwogTUFJTlRBSU5FUlMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA3ICsKIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9L
Y29uZmlnICAgICAgICAgICAgICAgICB8ICAxMSArCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvTWFr
ZWZpbGUgICAgICAgICAgICAgICAgfCAgIDEgKwogLi4uL2dwdS9kcm0vcGFuZWwvcGFuZWwtbWFu
dGl4LW1sYWYwNTd3ZTUxLmMgIHwgMzYyICsrKysrKysrKysrKysrKysrKwogNiBmaWxlcyBjaGFu
Z2VkLCA0NTYgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL21hbnRpeCxtbGFmMDU3d2U1MS14Lnlh
bWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtbWFudGl4
LW1sYWYwNTd3ZTUxLmMKCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
