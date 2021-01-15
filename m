Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F8C2F885B
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 23:23:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275FE6E4C5;
	Fri, 15 Jan 2021 22:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB266E4A5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 22:23:30 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC1071447;
 Fri, 15 Jan 2021 23:23:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1610749407;
 bh=CZjGFn9zRi3w0j2vaTMy0PpVIklwGSimHgqAUL36SNY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I40JJ8jAhZvASjVzxzeKj0rGaHKyec3DwwlQGCq7Qs1E86dQBXIJJLxA6B1AnuYEk
 pF7ok1pukG7b083xq69qqeX6IBranrOmemCQ5JYUQoyHthM+py3DcQ+TR2kosT1D8o
 zD1E2e/OE96xQo+9G60P2z3p09og/+c2BoBueWNQ=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/3] dt-bindings: display: mxsfb: Add compatible for i.MX8MM
Date: Sat, 16 Jan 2021 00:23:04 +0200
Message-Id: <20210115222304.5427-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210115222304.5427-1-laurent.pinchart@ideasonboard.com>
References: <20210115222304.5427-1-laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Martin Kepplinger <martin.kepplinger@puri.sm>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+CgpOWFAncyBpLk1YOE1NIGhhcyBhbiBM
Q0RJRiBhcyB3ZWxsLgoKU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+
ClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25i
b2FyZC5jb20+ClNpZ25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hh
cnRAaWRlYXNvbmJvYXJkLmNvbT4KLS0tCkNoYW5nZXMgc2luY2UgdjE6CgotIFJlYmFzZWQgb24g
dG9wIG9mIHRoZSBZQU1MIGNvbnZlcnNpb24KCkNjOiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBn
bWFpbC5jb20+CkNjOiBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hjcHUub3JnPgpDYzogTHVjYXMg
U3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+CkNjOiBOWFAgTGludXggVGVhbSA8bGludXgt
aW14QG54cC5jb20+CkNjOiBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPgpDYzogU2hh
d24gR3VvIDxzaGF3bmd1b0BrZXJuZWwub3JnPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L2ZzbCxsY2RpZi55YW1sIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9mc2wsbGNkaWYueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L2ZzbCxsY2RpZi55YW1sCmluZGV4IDRmYzI0ZDQ4MmIxYy4uYTRjMzA2
NGM3NzhjIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9mc2wsbGNkaWYueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9mc2wsbGNkaWYueWFtbApAQCAtMjYsNiArMjYsNyBAQCBwcm9wZXJ0aWVzOgog
ICAgICAgICAgICAgICAtIGZzbCxpbXg2c2xsLWxjZGlmCiAgICAgICAgICAgICAgIC0gZnNsLGlt
eDZ1bC1sY2RpZgogICAgICAgICAgICAgICAtIGZzbCxpbXg3ZC1sY2RpZgorICAgICAgICAgICAg
ICAtIGZzbCxpbXg4bW0tbGNkaWYKICAgICAgICAgICAgICAgLSBmc2wsaW14OG1xLWxjZGlmCiAg
ICAgICAgICAgLSBjb25zdDogZnNsLGlteDZzeC1sY2RpZgogCi0tIApSZWdhcmRzLAoKTGF1cmVu
dCBQaW5jaGFydAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
