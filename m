Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A92A3261
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D6B6E29D;
	Fri, 30 Aug 2019 08:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00876E0A0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 11:30:26 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5BA381A00B9;
 Thu, 29 Aug 2019 13:30:25 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4C47F1A015C;
 Thu, 29 Aug 2019 13:30:25 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 93EAC20613;
 Thu, 29 Aug 2019 13:30:24 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v4 09/14] dt-bindings: display: Add max-memory-bandwidth
 property for mxsfb
Date: Thu, 29 Aug 2019 14:30:10 +0300
Message-Id: <1567078215-31601-10-git-send-email-robert.chiras@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567078215-31601-1-git-send-email-robert.chiras@nxp.com>
References: <1567078215-31601-1-git-send-email-robert.chiras@nxp.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Fri, 30 Aug 2019 08:29:17 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIG5ldyBvcHRpb25hbCBwcm9wZXJ0eSAnbWF4LW1lbW9yeS1iYW5kd2lkdGgnLCB0byBsaW1p
dCB0aGUgbWF4aW11bQpiYW5kd2lkdGggdXNlZCBieSB0aGUgTVhTRkJfRFJNIGRyaXZlci4KClNp
Z25lZC1vZmYtYnk6IFJvYmVydCBDaGlyYXMgPHJvYmVydC5jaGlyYXNAbnhwLmNvbT4KVGVzdGVk
LWJ5OiBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hjcHUub3JnPgpSZXZpZXdlZC1ieTogUm9iIEhl
cnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9teHNmYi50eHQgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvbXhzZmIudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvbXhzZmIudHh0CmluZGV4IDQ3MmUxZWEuLmM4ZGNhNTAgMTAwNjQ0Ci0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L214c2ZiLnR4dAorKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9teHNmYi50eHQKQEAgLTE0LDYg
KzE0LDExIEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6CiAgICAgLSAicGl4IiBmb3IgdGhlIExDRElG
IGJsb2NrIGNsb2NrCiAgICAgLSAoTVg2U1gtb25seSkgImF4aSIsICJkaXNwX2F4aSIgZm9yIHRo
ZSBidXMgaW50ZXJmYWNlIGNsb2NrCiAKK09wdGlvbmFsIHByb3BlcnRpZXM6CistIG1heC1tZW1v
cnktYmFuZHdpZHRoOiBtYXhpbXVtIGJhbmR3aWR0aCBpbiBieXRlcyBwZXIgc2Vjb25kIHRoYXQg
dGhlCisJY29udHJvbGxlciBjYW4gaGFuZGxlOyBpZiBub3QgcHJlc2VudCwgdGhlIG1lbW9yeQor
CWludGVyZmFjZSBpcyBmYXN0IGVub3VnaCB0byBoYW5kbGUgYWxsIHBvc3NpYmxlIHZpZGVvIG1v
ZGVzCisKIFJlcXVpcmVkIHN1Yi1ub2RlczoKICAgLSBwb3J0OiBUaGUgY29ubmVjdGlvbiB0byBh
biBlbmNvZGVyIGNoaXAuCiAKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
