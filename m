Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D204998D39
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 10:15:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8616EA79;
	Thu, 22 Aug 2019 08:15:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC07E6E2BE
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 10:16:24 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 95FB81A00C1;
 Wed, 21 Aug 2019 12:16:23 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 8A2DC1A007D;
 Wed, 21 Aug 2019 12:16:23 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id D170820612;
 Wed, 21 Aug 2019 12:16:22 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 10/15] dt-bindings: display: Add max-memory-bandwidth
 property for mxsfb
Date: Wed, 21 Aug 2019 13:15:50 +0300
Message-Id: <1566382555-12102-11-git-send-email-robert.chiras@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566382555-12102-1-git-send-email-robert.chiras@nxp.com>
References: <1566382555-12102-1-git-send-email-robert.chiras@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 22 Aug 2019 08:14:56 +0000
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

QWRkIG5ldyBvcHRpb25hbCBwcm9wZXJ0eSAnbWF4LW1lbW9yeS1iYW5kd2lkdGgnLCB0byBsaW1p
dCB0aGUgbWF4aW11bQpiYW5kd2lkdGggdXNlZCBieSB0aGUgTVhTRkJfRFJNIGRyaXZlci4KClNp
Z25lZC1vZmYtYnk6IFJvYmVydCBDaGlyYXMgPHJvYmVydC5jaGlyYXNAbnhwLmNvbT4KLS0tCiBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9teHNmYi50eHQgfCA1ICsr
KysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXhzZmIudHh0IGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXhzZmIudHh0CmluZGV4IDQ3MmUxZWEu
LmM4ZGNhNTAgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L214c2ZiLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9teHNmYi50eHQKQEAgLTE0LDYgKzE0LDExIEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6
CiAgICAgLSAicGl4IiBmb3IgdGhlIExDRElGIGJsb2NrIGNsb2NrCiAgICAgLSAoTVg2U1gtb25s
eSkgImF4aSIsICJkaXNwX2F4aSIgZm9yIHRoZSBidXMgaW50ZXJmYWNlIGNsb2NrCiAKK09wdGlv
bmFsIHByb3BlcnRpZXM6CistIG1heC1tZW1vcnktYmFuZHdpZHRoOiBtYXhpbXVtIGJhbmR3aWR0
aCBpbiBieXRlcyBwZXIgc2Vjb25kIHRoYXQgdGhlCisJY29udHJvbGxlciBjYW4gaGFuZGxlOyBp
ZiBub3QgcHJlc2VudCwgdGhlIG1lbW9yeQorCWludGVyZmFjZSBpcyBmYXN0IGVub3VnaCB0byBo
YW5kbGUgYWxsIHBvc3NpYmxlIHZpZGVvIG1vZGVzCisKIFJlcXVpcmVkIHN1Yi1ub2RlczoKICAg
LSBwb3J0OiBUaGUgY29ubmVjdGlvbiB0byBhbiBlbmNvZGVyIGNoaXAuCiAKLS0gCjIuNy40Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
