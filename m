Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB1328CBB9
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 12:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B7186E12E;
	Tue, 13 Oct 2020 10:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213866E0F5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 10:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 17B76FB03;
 Tue, 13 Oct 2020 12:32:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0HSCc21tTcpC; Tue, 13 Oct 2020 12:32:51 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 9A9CF40309; Tue, 13 Oct 2020 12:32:48 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] dt-binding: display: Require two resets on mantix panel
Date: Tue, 13 Oct 2020 12:32:48 +0200
Message-Id: <15d3dc7eb4e031f380be1298ed3ac9085626f26b.1602584953.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1602584953.git.agx@sigxcpu.org>
References: <cover.1602584953.git.agx@sigxcpu.org>
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
bmRpbmdzL2Rpc3BsYXkvcGFuZWwvbWFudGl4LG1sYWYwNTd3ZTUxLXgueWFtbCAgICAgICAgICB8
IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL21hbnRpeCxtbGFm
MDU3d2U1MS14LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9wYW5lbC9tYW50aXgsbWxhZjA1N3dlNTEteC55YW1sCmluZGV4IDkzNzMyM2NjOWFhYS4uNTFm
NDIzMjk3ZWM4IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9wYW5lbC9tYW50aXgsbWxhZjA1N3dlNTEteC55YW1sCisrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL21hbnRpeCxtbGFmMDU3d2U1MS14
LnlhbWwKQEAgLTM3LDYgKzM3LDkgQEAgcHJvcGVydGllczoKIAogICByZXNldC1ncGlvczogdHJ1
ZQogCisgICdtYW50aXgsdHAtcnN0bi1ncGlvcyc6CisgICAgZGVzY3JpcHRpb246IHNlY29uZCBy
ZXNldCBsaW5lIHRoYXQgdHJpZ2dlcnMgRFNJIGNvbmZpZyBsb2FkCisKICAgYmFja2xpZ2h0OiB0
cnVlCiAKIHJlcXVpcmVkOgpAQCAtNjMsNiArNjYsNyBAQCBleGFtcGxlczoKICAgICAgICAgICAg
IGF2ZWUtc3VwcGx5ID0gPCZyZWdfYXZlZT47CiAgICAgICAgICAgICB2ZGRpLXN1cHBseSA9IDwm
cmVnXzF2OF9wPjsKICAgICAgICAgICAgIHJlc2V0LWdwaW9zID0gPCZncGlvMSAyOSBHUElPX0FD
VElWRV9MT1c+OworICAgICAgICAgICAgbWFudGl4LHRwLXJzdG4tZ3Bpb3MgPSA8JmdwaW8xIDI0
IEdQSU9fQUNUSVZFX0xPVz47CiAgICAgICAgICAgICBiYWNrbGlnaHQgPSA8JmJhY2tsaWdodD47
CiAgICAgICAgIH07CiAgICAgfTsKLS0gCjIuMjguMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
