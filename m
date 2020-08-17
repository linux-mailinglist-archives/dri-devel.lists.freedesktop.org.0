Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 760C6245EFD
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 10:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49EEA6E504;
	Mon, 17 Aug 2020 08:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762716E505
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 08:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 2D24CFB03;
 Mon, 17 Aug 2020 10:14:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zYzW_pnXzwo0; Mon, 17 Aug 2020 10:14:37 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 368D94576F; Mon, 17 Aug 2020 10:14:36 +0200 (CEST)
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
Subject: [PATCH v3 0/3] drm/panel: Add panel driver for the Mantix
 MLAF057WE51-X DSI panel
Date: Mon, 17 Aug 2020 10:14:33 +0200
Message-Id: <cover.1597652012.git.agx@sigxcpu.org>
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

ClRoZSBwYW5lbCB1c2VzIGEgRm9jYWx0ZWNoIEZUODAwNnAsIHRoZSB0b3VjaCBwYXJ0IGlzIGhh
bmRsZWQgYnkgdGhlIGFscmVhZHkKZXhpc3RpbmcgZWR0LWZ0NXgwNi4gSXQgY2FuIGJlIGZvdW5k
IGluIGUuZy4gdGhlIExpYnJlbSA1LgoKQ2hhbmdlcyBmcm9tIHYyOgotIER1ZSB0byByZXZpZXcg
Y29tbWVudHMgYnkgU2FtIFJhdm5ib3JnLCB0aGFua3MhCiAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGttbC8yMDIwMDgxNTIxMjcyNy5HQTEyNDQ5MjNAcmF2bmJvcmcub3JnLwogIC0gRHJvcCB1
bnVzZWQgaGVhZGVyCiAgLSBVc2UgbmV3bGluZSBiZWZvcmUgY29tbWVudAotIEFkZCBSZXZpZXdl
ZC9BY2tlZC1ieSBieSBTYW0gUmF2bmJvcmcsIHRoYW5rcyEKICBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9sa21sLzIwMjAwODE1MjEyNzI3LkdBMTI0NDkyM0ByYXZuYm9yZy5vcmcvCiAgaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIwMDgxNTIxMjc1MC5HQjEyNDQ5MjNAcmF2bmJvcmcu
b3JnLwogIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMDA4MTUyMTI4NDAuR0MxMjQ0
OTIzQHJhdm5ib3JnLm9yZy8KCkNoYW5nZXMgZnJvbSB2MToKLSBEdWUgdG8gcmV2aWV3IGNvbW1l
bnRzIGJ5IFNhbSBSYXZuYm9yZywgdGhhbmtzIQogIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Ry
aS1kZXZlbC8yMDIwMDgxNTA4MzkxNy5HQTk5MzExM0ByYXZuYm9yZy5vcmcvCiAgLSBEb24ndCBw
cmVzZXJ2ZSBuZXdsaW5lcyB3aXRoICd8JyBpbiBkZXNjcmlwdGlvbgogIC0gVXNlIHJlc2V0LWdw
aW9zIGFuZCBiYWNrbGlnaHQgZnJvbSBwYW5lbC1jb21tb24ueWFtbAogIC0gUmVpbmRlbnQgZXhh
bXBsZQogIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC8yMDIwMDgxNTA5MzIyNi5H
Qjk5MzExM0ByYXZuYm9yZy5vcmcvCiAgLSBEcm9wIHVudXNlZCBpbmNsdWRlcwogIC0gVXNlIGRl
dl8qIGluc3RlYWQgb2YgRFJNXyogZm9yIHByaW50aW5nCiAgLSBUdXJuIG9mZiByZWd1bGF0b3Jz
IGluIHJldmVyc2Ugb3JkZXIgZnJvbSBlbmFibGUKICAtIFNpbGVuY2UgZXJyb3JzIGluIG1hbnRp
eF97c2h1dGRvd24scmVtb3ZlfQogIC0gRHJvcCBkdXBsaWNhdGUgbWlwaV9kc2lfZGNzX2VudGVy
X3NsZWVwX21vZGUoKQogIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC8yMDIwMDgx
NTEwMDIzMC5HQTEwMDIzNzRAcmF2bmJvcmcub3JnLwogIC0gVXNlIGRldl9lcnJfcHJvYmUoKQot
IEFkZCBkZWxheXMgd2hlbiB0dXJuaW5nIG9mZiBwYW5lbCBhcyBzdWdnZXN0ZWQgYnkgdGhlIGRh
dGEgc2hlZXQKClRoaXMgc2VyaWVzIGlzIGFnYWluc3QgbmV4dC0yMDIwMDgxNC4KCkd1aWRvIEfD
vG50aGVyICgzKToKICBkdC1iaW5kaW5nczogdmVuZG9yLXByZWZpeGVzOiBBZGQgbWFudGl4IHZl
bmRvciBwcmVmaXgKICBkdC1iaW5kaW5nczogQWRkIE1hbnRpeCBNTEFGMDU3V0U1MS1YIHBhbmVs
IGJpbmRpbmdzCiAgZHJtL3BhbmVsOiBBZGQgcGFuZWwgZHJpdmVyIGZvciB0aGUgTWFudGl4IE1M
QUYwNTdXRTUxLVggRFNJIHBhbmVsCgogLi4uL2Rpc3BsYXkvcGFuZWwvbWFudGl4LG1sYWYwNTd3
ZTUxLXgueWFtbCAgIHwgIDcwICsrKysKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1w
cmVmaXhlcy55YW1sICB8ICAgMiArCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgIDcgKwogZHJpdmVycy9ncHUvZHJtL3BhbmVsL0tjb25maWcgICAgICAg
ICAgICAgICAgIHwgIDExICsKIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9NYWtlZmlsZSAgICAgICAg
ICAgICAgICB8ICAgMSArCiAuLi4vZ3B1L2RybS9wYW5lbC9wYW5lbC1tYW50aXgtbWxhZjA1N3dl
NTEuYyAgfCAzMjggKysrKysrKysrKysrKysrKysrCiA2IGZpbGVzIGNoYW5nZWQsIDQxOSBpbnNl
cnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvcGFuZWwvbWFudGl4LG1sYWYwNTd3ZTUxLXgueWFtbAogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1tYW50aXgtbWxhZjA1N3dlNTEu
YwoKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
