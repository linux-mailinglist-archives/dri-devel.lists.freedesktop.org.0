Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8962F6EF66
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2019 14:52:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9468C6E8A1;
	Sat, 20 Jul 2019 12:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478DB6E7FD
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 10:27:10 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0334E2000C9;
 Fri, 19 Jul 2019 12:27:09 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8658A20000A;
 Fri, 19 Jul 2019 12:27:05 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id EB33A402B5;
 Fri, 19 Jul 2019 18:27:00 +0800 (SGT)
From: Wen He <wen.he_1@nxp.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 p.zabel@pengutronix.de
Subject: [v2] gpu: ipu-v3: allow to build with ARCH_LAYERSCAPE
Date: Fri, 19 Jul 2019 18:17:51 +0800
Message-Id: <20190719101751.12315-1-wen.he_1@nxp.com>
X-Mailer: git-send-email 2.9.5
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Sat, 20 Jul 2019 12:51:43 +0000
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
Cc: Wen He <wen.he_1@nxp.com>, linux-imx@nxp.com, leoyang.li@nxp.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG5ldyBMUzEwMjhBIERQIGRyaXZlciBjb2RlIGNhdXNlcyBhIGxpbmsgZmFpbHVyZSB3aGVu
IERSTV9JTVggYnVpbHQtaW4sCmJ1dCBwbGF0Zm9ybSBpcyBBUkNIX0xBWUVSU0NBUEU6Cgpkcml2
ZXJzL2dwdS9kcm0vaW14L2lwdXYzLWNydGMuYzo1MTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBg
aXB1X3ByZ19lbmFibGUnCmRyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMtY3J0Yy5jOjUyOiB1bmRl
ZmluZWQgcmVmZXJlbmNlIHRvIGBpcHVfZGNfZW5hYmxlJwpkcml2ZXJzL2dwdS9kcm0vaW14L2lw
dXYzLWNydGMuYzo1MzogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgaXB1X2RjX2VuYWJsZV9jaGFu
bmVsJwpkcml2ZXJzL2dwdS9kcm0vaW14L2lwdXYzLWNydGMuYzo1NDogdW5kZWZpbmVkIHJlZmVy
ZW5jZSB0byBgaXB1X2RpX2VuYWJsZScKZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2My1jcnRjLm86
IEluIGZ1bmN0aW9uIGBpcHVfY3J0Y19tb2RlX3NldF9ub2ZiCgpBZGRpbmcgYSBLY29uZmlnIGRl
cGVuZGVuY3kgYWxsb3cgdG8gYnVpbGQgaWYgQVJDSF9MQVlFUlNDQVBFIGlzIGVuYWJsZS4KClNp
Z25lZC1vZmYtYnk6IFdlbiBIZSA8d2VuLmhlXzFAbnhwLmNvbT4KLS0tCmNoYW5nZSBpbiB2MjoK
ICAgICAgICAtIGZpeCBLY29uZmlnIGNvbmZsaXQgaXNzdWUgYWZ0ZXIgcmViYXNlZCB0byBrZXJu
ZWwgNS4yCgogZHJpdmVycy9ncHUvaXB1LXYzL0tjb25maWcgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9pcHUtdjMvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2lwdS12My9LY29uZmlnCmluZGV4IDA2MWZi
OTkwYzEyMC4uYmU1MTVkZDk1YzJjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9pcHUtdjMvS2Nv
bmZpZworKysgYi9kcml2ZXJzL2dwdS9pcHUtdjMvS2NvbmZpZwpAQCAtMSw3ICsxLDcgQEAKICMg
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogY29uZmlnIElNWF9JUFVWM19D
T1JFCiAJdHJpc3RhdGUgIklQVXYzIGNvcmUgc3VwcG9ydCIKLQlkZXBlbmRzIG9uIFNPQ19JTVg1
IHx8IFNPQ19JTVg2USB8fCBBUkNIX01VTFRJUExBVEZPUk0gfHwgQ09NUElMRV9URVNUCisJZGVw
ZW5kcyBvbiBTT0NfSU1YNSB8fCBTT0NfSU1YNlEgfHwgQVJDSF9NVUxUSVBMQVRGT1JNIHx8IENP
TVBJTEVfVEVTVCB8fCBBUkNIX0xBWUVSU0NBUEUKIAlkZXBlbmRzIG9uIERSTSB8fCAhRFJNICMg
aWYgRFJNPW0sIHRoaXMgY2FuJ3QgYmUgJ3knCiAJc2VsZWN0IEJJVFJFVkVSU0UKIAlzZWxlY3Qg
R0VORVJJQ19BTExPQ0FUT1IgaWYgRFJNCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
