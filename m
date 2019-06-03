Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 036EF33FB0
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 09:15:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB53896C7;
	Tue,  4 Jun 2019 07:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B1A89291
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 15:23:52 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH v5 1/2] dt-bindings: Add doc for the Ingenic JZ47xx LCD
 controller driver
Date: Mon,  3 Jun 2019 17:23:30 +0200
Message-Id: <20190603152331.23160-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 04 Jun 2019 07:14:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1559575431; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=rEM7uFRBofy0jSEvYX92cgcANNvP4RB/CXYuPIY+nu4=;
 b=trPL41iTv6Ea33wmCa3q4NAYuQyVVrKTE2r1DIcnYeqd6biw5yZhFizqumpF8moEeaxuKk
 RkehIoWBRSkrmnpc4+bvCMd4ZxqGU61kvYBvV5hNbZviLpEqP1JAvdWkM70d9cwz5hUXzy
 RSBkCNDmvZ+YI3eztwhi1df9hcAMU9A=
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
Cc: devicetree@vger.kernel.org, Artur Rojek <contact@artur-rojek.eu>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>, od@zcrc.me
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGRvY3VtZW50YXRpb24gZm9yIHRoZSBkZXZpY2V0cmVlIGJpbmRpbmdzIG9mIHRoZSBMQ0Qg
Y29udHJvbGxlciBwcmVzZW50IGluCnRoZSBKWjQ3eHggZmFtaWx5IG9mIFNvQ3MgZnJvbSBJbmdl
bmljLgoKU2lnbmVkLW9mZi1ieTogUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+
ClRlc3RlZC1ieTogQXJ0dXIgUm9qZWsgPGNvbnRhY3RAYXJ0dXItcm9qZWsuZXU+Ci0tLQoKTm90
ZXM6CiAgICB2MjogUmVtb3ZlIGluZ2VuaWMscGFuZWwgcHJvcGVydHkuCiAgICAKICAgIHYzOiAt
IFJlbmFtZSBjb21wYXRpYmxlIHN0cmluZ3MgZnJvbSBpbmdlbmljLGp6NDdYWC1kcm0gdG8gaW5n
ZW5pYyxqejQ3WFgtbGNkCiAgICAgICAgLSBUaGUgaW5nZW5pYyxsY2QtbW9kZSBwcm9wZXJ0eSBp
cyBub3cgcmVhZCBmcm9tIHRoZSBwYW5lbCBub2RlIGluc3RlYWQKICAgIAkgIG9mIGZyb20gdGhl
IGRyaXZlciBub2RlCiAgICAKICAgIHY0OiBSZW1vdmUgaW5nZW5pYyxsY2QtbW9kZSBwcm9wZXJ0
eSBjb21wbGV0ZWx5LgogICAgCiAgICB2NTogTm8gY2hhbmdlCgogLi4uL2JpbmRpbmdzL2Rpc3Bs
YXkvaW5nZW5pYyxsY2QudHh0ICAgICAgICAgIHwgNDQgKysrKysrKysrKysrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9pbmdlbmljLGxjZC50eHQKCmRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9pbmdlbmlj
LGxjZC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9pbmdl
bmljLGxjZC50eHQKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi43YjUz
NmM4YzZkZGUKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9pbmdlbmljLGxjZC50eHQKQEAgLTAsMCArMSw0NCBAQAorSW5nZW5pYyBK
WjQ3eHggTENEIGRyaXZlcgorCitSZXF1aXJlZCBwcm9wZXJ0aWVzOgorLSBjb21wYXRpYmxlOiBv
bmUgb2Y6CisgICogaW5nZW5pYyxqejQ3NDAtbGNkCisgICogaW5nZW5pYyxqejQ3MjViLWxjZAor
LSByZWc6IExDRCByZWdpc3RlcnMgbG9jYXRpb24gYW5kIGxlbmd0aAorLSBjbG9ja3M6IExDRCBw
aXhjbG9jayBhbmQgZGV2aWNlIGNsb2NrIHNwZWNpZmllcnMuCisJICAgVGhlIGRldmljZSBjbG9j
ayBpcyBvbmx5IHJlcXVpcmVkIG9uIHRoZSBKWjQ3NDAuCistIGNsb2NrLW5hbWVzOiAibGNkX3Bj
bGsiIGFuZCAibGNkIgorLSBpbnRlcnJ1cHRzOiBTcGVjaWZpZXMgdGhlIGludGVycnVwdCBsaW5l
IHRoZSBMQ0QgY29udHJvbGxlciBpcyBjb25uZWN0ZWQgdG8uCisKK0V4YW1wbGU6CisKK3BhbmVs
IHsKKwljb21wYXRpYmxlID0gInNoYXJwLGxzMDIwYjFkZDAxZCI7CisKKwliYWNrbGlnaHQgPSA8
JmJhY2tsaWdodD47CisJcG93ZXItc3VwcGx5ID0gPCZ2Y2M+OworCisJcG9ydCB7CisJCXBhbmVs
X2lucHV0OiBlbmRwb2ludCB7CisJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JnBhbmVsX291dHB1dD47
CisJCX07CisJfTsKK307CisKKworbGNkOiBsY2QtY29udHJvbGxlckAxMzA1MDAwMCB7CisJY29t
cGF0aWJsZSA9ICJpbmdlbmljLGp6NDcyNWItbGNkIjsKKwlyZWcgPSA8MHgxMzA1MDAwMCAweDEw
MDA+OworCisJaW50ZXJydXB0LXBhcmVudCA9IDwmaW50Yz47CisJaW50ZXJydXB0cyA9IDwzMT47
CisKKwljbG9ja3MgPSA8JmNndSBKWjQ3MjVCX0NMS19MQ0Q+OworCWNsb2NrLW5hbWVzID0gImxj
ZCI7CisKKwlwb3J0IHsKKwkJcGFuZWxfb3V0cHV0OiBlbmRwb2ludCB7CisJCQlyZW1vdGUtZW5k
cG9pbnQgPSA8JnBhbmVsX2lucHV0PjsKKwkJfTsKKwl9OworfTsKLS0gCjIuMjEuMC41OTMuZzUx
MWVjMzQ1ZTE4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
