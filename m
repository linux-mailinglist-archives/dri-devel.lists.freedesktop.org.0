Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1128E707
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A95B6E90F;
	Thu, 15 Aug 2019 08:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3886E5EE
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 10:57:59 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id F080F200352;
 Wed, 14 Aug 2019 12:49:05 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id EE0D02007FC;
 Wed, 14 Aug 2019 12:49:05 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id D782D2060E;
 Wed, 14 Aug 2019 12:49:04 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 09/15] dt-bindings: display: Add max-res property for mxsfb
Date: Wed, 14 Aug 2019 13:48:45 +0300
Message-Id: <1565779731-1300-10-git-send-email-robert.chiras@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565779731-1300-1-git-send-email-robert.chiras@nxp.com>
References: <1565779731-1300-1-git-send-email-robert.chiras@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIG5ldyBvcHRpb25hbCBwcm9wZXJ0eSAnbWF4LXJlcycsIHRvIGxpbWl0IHRoZSBtYXhpbXVt
IHN1cHBvcnRlZApyZXNvbHV0aW9uIGJ5IHRoZSBNWFNGQl9EUk0gZHJpdmVyLgoKU2lnbmVkLW9m
Zi1ieTogUm9iZXJ0IENoaXJhcyA8cm9iZXJ0LmNoaXJhc0BueHAuY29tPgotLS0KIERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L214c2ZiLnR4dCB8IDYgKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXhzZmIudHh0IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXhzZmIudHh0CmluZGV4IDQ3MmUxZWEuLjU1ZTIy
ZWQgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L214c2ZiLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9teHNmYi50eHQKQEAgLTE3LDYgKzE3LDEyIEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6CiBSZXF1
aXJlZCBzdWItbm9kZXM6CiAgIC0gcG9ydDogVGhlIGNvbm5lY3Rpb24gdG8gYW4gZW5jb2RlciBj
aGlwLgogCitPcHRpb25hbCBwcm9wZXJ0aWVzOgorLSBtYXgtcmVzOglhbiBhcnJheSB3aXRoIGEg
bWF4aW11bSBvZiB0d28gaW50ZWdlcnMsIHJlcHJlc2VudGluZyB0aGUKKwkJbWF4aW11bSBzdXBw
b3J0ZWQgcmVzb2x1dGlvbiwgaW4gdGhlIGZvcm0gb2YKKwkJPG1heFg+LCA8bWF4WT47IGlmIG9u
ZSBvZiB0aGUgaXRlbSBpcyA8MD4sIHRoZSBkZWZhdWx0CisJCWRyaXZlci1kZWZpbmVkIG1heGlt
dW0gcmVzb2x1dGlvbiBmb3IgdGhhdCBheGlzIGlzIHVzZWQKKwogRXhhbXBsZToKIAogCWxjZGlm
MTogZGlzcGxheS1jb250cm9sbGVyQDIyMjAwMDAgewotLSAKMi43LjQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
