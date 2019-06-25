Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D69455573
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 19:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 542F56E1BC;
	Tue, 25 Jun 2019 17:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6936E1B4
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 17:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 851FBFB04;
 Tue, 25 Jun 2019 19:05:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sMzfIiTSGQss; Tue, 25 Jun 2019 19:05:21 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 624F748E35; Tue, 25 Jun 2019 19:05:19 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Purism Kernel Team <kernel@puri.sm>
Subject: [PATCH 3/4] dt-bindings: display/panel: jh057n0090: Document power
 supply properties
Date: Tue, 25 Jun 2019 19:05:18 +0200
Message-Id: <5ebbc0cf3fc8fcfd0300fb4d81be5acae156a4d4.1561482165.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1561482165.git.agx@sigxcpu.org>
References: <cover.1561482165.git.agx@sigxcpu.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG9jdW1lbnQgdGhlIHZjYy1zdXBwbHkgYW5kIGlvdmNjLXN1cHBseSBwcm9wZXJ0ZXMgb2YgdGhl
IFJvY2t0ZWNoCmpoMDU3bjAwOTAgcGFuZWwuCgpTaWduZWQtb2ZmLWJ5OiBHdWlkbyBHw7xudGhl
ciA8YWd4QHNpZ3hjcHUub3JnPgotLS0KIC4uLi9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3JvY2t0
ZWNoLGpoMDU3bjAwOTAwLnR4dCAgICAgICAgICB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9wYW5lbC9yb2NrdGVjaCxqaDA1N24wMDkwMC50eHQgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9yb2NrdGVjaCxqaDA1N24wMDkw
MC50eHQKaW5kZXggMWI1NzYzMjAwY2Y2Li5hMzcyYzVkODQ2OTUgMTAwNjQ0Ci0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3JvY2t0ZWNoLGpoMDU3
bjAwOTAwLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9wYW5lbC9yb2NrdGVjaCxqaDA1N24wMDkwMC50eHQKQEAgLTUsNiArNSw5IEBAIFJlcXVpcmVk
IHByb3BlcnRpZXM6CiAtIHJlZzogRFNJIHZpcnR1YWwgY2hhbm5lbCBvZiB0aGUgcGVyaXBoZXJh
bAogLSByZXNldC1ncGlvczogcGFuZWwgcmVzZXQgZ3BpbwogLSBiYWNrbGlnaHQ6IHBoYW5kbGUg
b2YgdGhlIGJhY2tsaWdodCBkZXZpY2UgYXR0YWNoZWQgdG8gdGhlIHBhbmVsCistIHZjYy1zdXBw
bHk6IHBoYW5kbGUgb2YgdGhlIHJlZ3VsYXRvciB0aGF0IHByb3ZpZGVzIHRoZSB2Y2Mgc3VwcGx5
IHZvbHRhZ2UuCistIGlvdmNjLXN1cHBseTogcGhhbmRsZSBvZiB0aGUgcmVndWxhdG9yIHRoYXQg
cHJvdmlkZXMgdGhlIGlvdmNjIHN1cHBseQorICB2b2x0YWdlLgogCiBFeGFtcGxlOgogCkBAIC0x
NCw1ICsxNyw3IEBAIEV4YW1wbGU6CiAJCQlyZWcgPSA8MD47CiAJCQliYWNrbGlnaHQgPSA8JmJh
Y2tsaWdodD47CiAJCQlyZXNldC1ncGlvcyA9IDwmZ3BpbzMgMTMgR1BJT19BQ1RJVkVfTE9XPjsK
KwkJCXZjYy1zdXBwbHkgPSA8JnJlZ18ydjhfcD47CisJCQlpb3ZjYy1zdXBwbHkgPSA8JnJlZ18x
djhfcD47CiAJCX07CiAJfTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
