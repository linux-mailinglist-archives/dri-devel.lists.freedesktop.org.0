Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF056EF67
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2019 14:52:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8433C6E89A;
	Sat, 20 Jul 2019 12:51:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68AB76E7FA
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 10:19:06 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3C63F1A0046;
 Fri, 19 Jul 2019 12:19:05 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D6A881A0243;
 Fri, 19 Jul 2019 12:19:00 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 396D1402D5;
 Fri, 19 Jul 2019 18:18:55 +0800 (SGT)
From: Wen He <wen.he_1@nxp.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
 robh+dt@kernel.org
Subject: [v2 2/4] arm64: dts: ls1028a: Add properties for HDP Controller.
Date: Fri, 19 Jul 2019 18:09:40 +0800
Message-Id: <20190719100942.12016-2-wen.he_1@nxp.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20190719100942.12016-1-wen.he_1@nxp.com>
References: <20190719100942.12016-1-wen.he_1@nxp.com>
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
Cc: Wen He <wen.he_1@nxp.com>, leoyang.li@nxp.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBlbmFibGVzIHRoZSBIRFAgY29udHJvbGxlciBkcml2ZXIgb24gdGhlIExTMTAy
OEEuCgpTaWduZWQtb2ZmLWJ5OiBBbGlzb24gV2FuZyA8YXNsaW9uLndhbmdAbnhwLmNvbT4KU2ln
bmVkLW9mZi1ieTogV2VuIEhlIDx3ZW4uaGVfMUBueHAuY29tPgotLS0KIC4uLi9hcm02NC9ib290
L2R0cy9mcmVlc2NhbGUvZnNsLWxzMTAyOGEuZHRzaSB8IDI1ICsrKysrKysrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02
NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWxzMTAyOGEuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvZnJlZXNjYWxlL2ZzbC1sczEwMjhhLmR0c2kKaW5kZXggYWVmNWIwNmE5OGQ1Li4xOTYxMmFk
OWE0YTEgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1sczEw
MjhhLmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWxzMTAyOGEu
ZHRzaQpAQCAtOTEsNiArOTEsMTMgQEAKIAkJY2xvY2stb3V0cHV0LW5hbWVzPSAicGNsayI7CiAJ
fTsKIAorCWhkcGNsazogY2xvY2staGRwY29yZSB7CisJCWNvbXBhdGlibGUgPSAiZml4ZWQtY2xv
Y2siOworCQkjY2xvY2stY2VsbHMgPSA8MD47CisJCWNsb2NrLWZyZXF1ZW5jeSA9IDwxNjI1MDAw
MDA+OworCQljbG9jay1vdXRwdXQtbmFtZXM9ICJoZHBjbGsiOworCX07CisKIAlyZWJvb3Qgewog
CQljb21wYXRpYmxlID0ic3lzY29uLXJlYm9vdCI7CiAJCXJlZ21hcCA9IDwmZGNmZz47CkBAIC01
NTgsNyArNTY1LDI1IEBACiAKIAkJcG9ydCB7CiAJCQlkcDBfb3V0OiBlbmRwb2ludCB7CisJCQkJ
cmVtb3RlLWVuZHBvaW50ID0gPCZkcDFfb3V0PjsKKwkJCX07CisJCX07CisJfTsKIAorCWhkcHR4
MDogZGlzcGxheUBmMjAwMDAwIHsKKwkJY29tcGF0aWJsZSA9ICJmc2wsbHMxMDI4YS1kcCI7CisJ
CXJlZyA9IDwweDAgMHhmMWYwMDAwIDB4MCAweGZmZmY+LAorCQkgICAgPDB4MCAweGYyMDAwMDAg
MHgwIDB4ZmZmZmY+OworCQlpbnRlcnJ1cHRzID0gPDAgMjIxIElSUV9UWVBFX0xFVkVMX0hJR0g+
OworCQljbG9ja3MgPSA8JnN5c2Nsaz4sIDwmaGRwY2xrPiwgPCZkcGNsaz4sCisJCQkgPCZkcGNs
az4sIDwmZHBjbGs+LCA8JnBjbGs+LCA8JmRwY2xrPjsKKwkJY2xvY2stbmFtZXMgPSAiY2xrX2lw
ZyIsICJjbGtfY29yZSIsICJjbGtfcHhsIiwKKwkJCSAgICAgICJjbGtfcHhsX211eCIsICJjbGtf
cHhsX2xpbmsiLCAiY2xrX2FwYiIsCisJCQkgICAgICAiY2xrX3ZpZiI7CisKKwkJcG9ydCB7CisJ
CQlkcDFfb3V0OiBlbmRwb2ludCB7CisJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZkcDBfb3V0PjsK
IAkJCX07CiAJCX07CiAJfTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
