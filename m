Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F05E114E87
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 10:59:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36D16F99F;
	Fri,  6 Dec 2019 09:59:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9DF6F9A0
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 09:59:35 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4F905200995;
 Fri,  6 Dec 2019 10:53:24 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 41B46201668;
 Fri,  6 Dec 2019 10:53:24 +0100 (CET)
Received: from fsr-ub1664-121.ea.freescale.net
 (fsr-ub1664-121.ea.freescale.net [10.171.82.171])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 8890720395;
 Fri,  6 Dec 2019 10:53:23 +0100 (CET)
From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH v3 3/4] dt-bindings: display: imx: add bindings for DCSS
Date: Fri,  6 Dec 2019 11:52:40 +0200
Message-Id: <1575625964-27102-4-git-send-email-laurentiu.palcu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575625964-27102-1-git-send-email-laurentiu.palcu@nxp.com>
References: <1575625964-27102-1-git-send-email-laurentiu.palcu@nxp.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: devicetree@vger.kernel.org, agx@sigxcpu.org, lukas@mntmn.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGJpbmRpbmdzIGZvciBpTVg4TVEgRGlzcGxheSBDb250cm9sbGVyIFN1YnN5c3RlbS4KClNp
Z25lZC1vZmYtYnk6IExhdXJlbnRpdSBQYWxjdSA8bGF1cmVudGl1LnBhbGN1QG54cC5jb20+ClJl
dmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgotLS0KIC4uLi9iaW5kaW5n
cy9kaXNwbGF5L2lteC9ueHAsaW14OG1xLWRjc3MueWFtbCAgICAgIHwgODYgKysrKysrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDg2IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9pbXgvbnhw
LGlteDhtcS1kY3NzLnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9pbXgvbnhwLGlteDhtcS1kY3NzLnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9pbXgvbnhwLGlteDhtcS1kY3NzLnlhbWwKbmV3
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAuLmVmZDI0OTQKLS0tIC9kZXYvbnVsbAor
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9pbXgvbnhwLGlt
eDhtcS1kY3NzLnlhbWwKQEAgLTAsMCArMSw4NiBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKQorIyBDb3B5cmlnaHQgMjAxOSBOWFAKKyVZQU1M
IDEuMgorLS0tCiskaWQ6ICJodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L2lt
eC9ueHAsaW14OG1xLWRjc3MueWFtbCMiCiskc2NoZW1hOiAiaHR0cDovL2RldmljZXRyZWUub3Jn
L21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjIgorCit0aXRsZTogaU1YOE1RIERpc3BsYXkgQ29udHJv
bGxlciBTdWJzeXN0ZW0gKERDU1MpCisKK21haW50YWluZXJzOgorICAtIExhdXJlbnRpdSBQYWxj
dSA8bGF1cmVudGl1LnBhbGN1QG54cC5jb20+CisKK2Rlc2NyaXB0aW9uOgorCisgIFRoZSBEQ1NT
IChkaXNwbGF5IGNvbnRyb2xsZXIgc3ViIHN5c3RlbSkgaXMgdXNlZCB0byBzb3VyY2UgdXAgdG8g
dGhyZWUKKyAgZGlzcGxheSBidWZmZXJzLCBjb21wb3NlIHRoZW0sIGFuZCBkcml2ZSBhIGRpc3Bs
YXkgdXNpbmcgSERNSSAyLjBhKHdpdGggSERDUAorICAyLjIpIG9yIE1JUEktRFNJLiBUaGUgRENT
UyBpcyBpbnRlbmRlZCB0byBzdXBwb3J0IHVwIHRvIDRrcDYwIGRpc3BsYXlzLiBIRFIxMAorICBp
bWFnZSBwcm9jZXNzaW5nIGNhcGFiaWxpdGllcyBhcmUgaW5jbHVkZWQgdG8gcHJvdmlkZSBhIHNv
bHV0aW9uIGNhcGFibGUgb2YKKyAgZHJpdmluZyBuZXh0IGdlbmVyYXRpb24gaGlnaCBkeW5hbWlj
IHJhbmdlIGRpc3BsYXlzLgorCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgIGNvbnN0
OiBueHAsaW14OG1xLWRjc3MKKworICByZWc6CisgICAgbWF4SXRlbXM6IDIKKworICBpbnRlcnJ1
cHRzOgorICAgIG1heEl0ZW1zOiAzCisgICAgaXRlbXM6CisgICAgICAtIGRlc2NyaXB0aW9uOiBD
b250ZXh0IGxvYWRlciBjb21wbGV0aW9uIGFuZCBlcnJvciBpbnRlcnJ1cHQKKyAgICAgIC0gZGVz
Y3JpcHRpb246IERURyBpbnRlcnJ1cHQgdXNlZCB0byBzaWduYWwgY29udGV4dCBsb2FkZXIgdHJp
Z2dlciB0aW1lCisgICAgICAtIGRlc2NyaXB0aW9uOiBEVEcgaW50ZXJydXB0IGZvciBWYmxhbmsK
KworICBpbnRlcnJ1cHQtbmFtZXM6CisgICAgbWF4SXRlbXM6IDMKKyAgICBpdGVtczoKKyAgICAg
IC0gY29uc3Q6IGN0eF9sZAorICAgICAgLSBjb25zdDogY3R4bGRfa2ljaworICAgICAgLSBjb25z
dDogdmJsYW5rCisKKyAgY2xvY2tzOgorICAgIG1heEl0ZW1zOiA1CisgICAgaXRlbXM6CisgICAg
ICAtIGRlc2NyaXB0aW9uOiBEaXNwbGF5IEFQQiBjbG9jayBmb3IgYWxsIHBlcmlwaGVyYWwgUElP
IGFjY2VzcyBpbnRlcmZhY2VzCisgICAgICAtIGRlc2NyaXB0aW9uOiBEaXNwbGF5IEFYSSBjbG9j
ayBuZWVkZWQgYnkgRFBSLCBTY2FsZXIsIFJUUkFNX0NUUkwKKyAgICAgIC0gZGVzY3JpcHRpb246
IFJUUkFNIGNsb2NrCisgICAgICAtIGRlc2NyaXB0aW9uOiBQaXhlbCBjbG9jaywgY2FuIGJlIGRy
aXZlciBlaXRoZXIgYnkgSERNSSBwaHkgY2xvY2sgb3IgTUlQSQorICAgICAgLSBkZXNjcmlwdGlv
bjogRFRSQyBjbG9jaywgbmVlZGVkIGJ5IHZpZGVvIGRlY29tcHJlc3NvcgorCisgIGNsb2NrLW5h
bWVzOgorICAgIGl0ZW1zOgorICAgICAgLSBjb25zdDogYXBiCisgICAgICAtIGNvbnN0OiBheGkK
KyAgICAgIC0gY29uc3Q6IHJ0cm0KKyAgICAgIC0gY29uc3Q6IHBpeAorICAgICAgLSBjb25zdDog
ZHRyYworCisgIHBvcnRAMDoKKyAgICB0eXBlOiBvYmplY3QKKyAgICBkZXNjcmlwdGlvbjogQSBw
b3J0IG5vZGUgcG9pbnRpbmcgdG8gYSBoZG1pX2luIG9yIG1pcGlfaW4gcG9ydCBub2RlLgorCitl
eGFtcGxlczoKKyAgLSB8CisgICAgZGNzczogZGlzcGxheS1jb250cm9sbGVyQDMyZTAwMDAwIHsK
KyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47CisgICAgICAgICNzaXplLWNlbGxzID0gPDA+
OworICAgICAgICBjb21wYXRpYmxlID0gIm54cCxpbXg4bXEtZGNzcyI7CisgICAgICAgIHJlZyA9
IDwweDMyZTAwMDAwIDB4MmQwMDA+LCA8MHgzMmUyZjAwMCAweDEwMDA+OworICAgICAgICBpbnRl
cnJ1cHRzID0gPDY+LCA8OD4sIDw5PjsKKyAgICAgICAgaW50ZXJydXB0LW5hbWVzID0gImN0eF9s
ZCIsICJjdHhsZF9raWNrIiwgInZibGFuayI7CisgICAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8
JmlycXN0ZWVyPjsKKyAgICAgICAgY2xvY2tzID0gPCZjbGsgMjQ4PiwgPCZjbGsgMjQ3PiwgPCZj
bGsgMjQ5PiwKKyAgICAgICAgICAgICAgICAgPCZjbGsgMjU0Piw8JmNsayAxMjI+OworICAgICAg
ICBjbG9jay1uYW1lcyA9ICJhcGIiLCAiYXhpIiwgInJ0cm0iLCAicGl4IiwgImR0cmMiOworICAg
ICAgICBhc3NpZ25lZC1jbG9ja3MgPSA8JmNsayAxMDc+LCA8JmNsayAxMDk+LCA8JmNsayAyNjY+
OworICAgICAgICBhc3NpZ25lZC1jbG9jay1wYXJlbnRzID0gPCZjbGsgNzg+LCA8JmNsayA3OD4s
IDwmY2xrIDM+OworICAgICAgICBhc3NpZ25lZC1jbG9jay1yYXRlcyA9IDw4MDAwMDAwMDA+LAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDw0MDAwMDAwMDA+OworICAgICAgICBwb3J0
QDAgeworICAgICAgICAgICAgZGNzc19vdXQ6IGVuZHBvaW50IHsKKyAgICAgICAgICAgICAgICBy
ZW1vdGUtZW5kcG9pbnQgPSA8JmhkbWlfaW4+OworICAgICAgICAgICAgfTsKKyAgICAgICAgfTsK
KyAgICB9OworCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
