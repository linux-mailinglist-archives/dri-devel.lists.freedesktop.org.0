Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B73BB68E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 16:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04016E924;
	Mon, 23 Sep 2019 14:22:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9876E92A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 14:22:03 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6BD9A1A02F2;
 Mon, 23 Sep 2019 16:14:25 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 553B71A0262;
 Mon, 23 Sep 2019 16:14:25 +0200 (CEST)
Received: from fsr-ub1664-121.ea.freescale.net
 (fsr-ub1664-121.ea.freescale.net [10.171.82.171])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id C0AE120613;
 Mon, 23 Sep 2019 16:14:24 +0200 (CEST)
From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH 4/5] dt-bindings: display: imx: add bindings for DCSS
Date: Mon, 23 Sep 2019 17:13:18 +0300
Message-Id: <1569248002-2485-5-git-send-email-laurentiu.palcu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569248002-2485-1-git-send-email-laurentiu.palcu@nxp.com>
References: <1569248002-2485-1-git-send-email-laurentiu.palcu@nxp.com>
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
Cc: devicetree@vger.kernel.org, agx@sigxcpu.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGJpbmRpbmdzIGZvciBpTVg4TVEgRGlzcGxheSBDb250cm9sbGVyIFN1YnN5c3RlbS4KClNp
Z25lZC1vZmYtYnk6IExhdXJlbnRpdSBQYWxjdSA8bGF1cmVudGl1LnBhbGN1QG54cC5jb20+Ci0t
LQogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvaW14L254cCxpbXg4bXEtZGNzcy55YW1sICAgICAgfCA4
NiArKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgODYgaW5zZXJ0aW9ucygr
KQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L2lteC9ueHAsaW14OG1xLWRjc3MueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2lteC9ueHAsaW14OG1xLWRjc3MueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2lteC9ueHAsaW14OG1x
LWRjc3MueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMC4uZWI2ZDBkODEK
LS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9pbXgvbnhwLGlteDhtcS1kY3NzLnlhbWwKQEAgLTAsMCArMSw4NiBAQAorIyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKQorIyBDb3B5cmlnaHQg
MjAxOSBOWFAKKyVZQU1MIDEuMgorLS0tCiskaWQ6ICJodHRwOi8vZGV2aWNldHJlZS5vcmcvc2No
ZW1hcy9kaXNwbGF5L2lteC9ueHAsaW14OG1xLWRjc3MueWFtbCMiCiskc2NoZW1hOiAiaHR0cDov
L2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjIgorCit0aXRsZTogaU1YOE1R
IERpc3BsYXkgQ29udHJvbGxlciBTdWJzeXN0ZW0gKERDU1MpCisKK21haW50YWluZXJzOgorICAt
IExhdXJlbnRpdSBQYWxjdSA8bGF1cmVudGl1LnBhbGN1QG54cC5jb20+CisKK2Rlc2NyaXB0aW9u
OgorCisgIFRoZSBEQ1NTIChkaXNwbGF5IGNvbnRyb2xsZXIgc3ViIHN5c3RlbSkgaXMgdXNlZCB0
byBzb3VyY2UgdXAgdG8gdGhyZWUKKyAgZGlzcGxheSBidWZmZXJzLCBjb21wb3NlIHRoZW0sIGFu
ZCBkcml2ZSBhIGRpc3BsYXkgdXNpbmcgSERNSSAyLjBhKHdpdGggSERDUAorICAyLjIpIG9yIE1J
UEktRFNJLiBUaGUgRENTUyBpcyBpbnRlbmRlZCB0byBzdXBwb3J0IHVwIHRvIDRrcDYwIGRpc3Bs
YXlzLiBIRFIxMAorICBpbWFnZSBwcm9jZXNzaW5nIGNhcGFiaWxpdGllcyBhcmUgaW5jbHVkZWQg
dG8gcHJvdmlkZSBhIHNvbHV0aW9uIGNhcGFibGUgb2YKKyAgZHJpdmluZyBuZXh0IGdlbmVyYXRp
b24gaGlnaCBkeW5hbWljIHJhbmdlIGRpc3BsYXlzLgorCitwcm9wZXJ0aWVzOgorICBjb21wYXRp
YmxlOgorICAgIGNvbnN0OiBueHAsaW14OG1xLWRjc3MKKworICByZWc6CisgICAgbWF4SXRlbXM6
IDIKKworICBpbnRlcnJ1cHRzOgorICAgIG1heEl0ZW1zOiAzCisgICAgaXRlbXM6CisgICAgICAt
IGRlc2NyaXB0aW9uOiBDb250ZXh0IGxvYWRlciBjb21wbGV0aW9uIGFuZCBlcnJvciBpbnRlcnJ1
cHQKKyAgICAgIC0gZGVzY3JpcHRpb246IERURyBpbnRlcnJ1cHQgdXNlZCB0byBzaWduYWwgY29u
dGV4dCBsb2FkZXIgdHJpZ2dlciB0aW1lCisgICAgICAtIGRlc2NyaXB0aW9uOiBEVEcgaW50ZXJy
dXB0IGZvciBWYmxhbmsKKworICBpbnRlcnJ1cHQtbmFtZXM6CisgICAgbWF4SXRlbXM6IDMKKyAg
ICBpdGVtczoKKyAgICAgIC0gY29uc3Q6IGN0eF9sZAorICAgICAgLSBjb25zdDogY3R4bGRfa2lj
aworICAgICAgLSBjb25zdDogdmJsYW5rCisKKyAgY2xvY2tzOgorICAgIG1heEl0ZW1zOiA1Cisg
ICAgaXRlbXM6CisgICAgICAtIGRlc2NyaXB0aW9uOiBEaXNwbGF5IEFQQiBjbG9jayBmb3IgYWxs
IHBlcmlwaGVyYWwgUElPIGFjY2VzcyBpbnRlcmZhY2VzCisgICAgICAtIGRlc2NyaXB0aW9uOiBE
aXNwbGF5IEFYSSBjbG9jayBuZWVkZWQgYnkgRFBSLCBTY2FsZXIsIFJUUkFNX0NUUkwKKyAgICAg
IC0gZGVzY3JpcHRpb246IFJUUkFNIGNsb2NrCisgICAgICAtIGRlc2NyaXB0aW9uOiBQaXhlbCBj
bG9jaywgY2FuIGJlIGRyaXZlciBlaXRoZXIgYnkgSERNSSBwaHkgY2xvY2sgb3IgTUlQSQorICAg
ICAgLSBkZXNjcmlwdGlvbjogRFRSQyBjbG9jaywgbmVlZGVkIGJ5IHZpZGVvIGRlY29tcHJlc3Nv
cgorCisgIGNsb2NrLW5hbWVzOgorICAgIGl0ZW1zOgorICAgICAgLSBjb25zdDogYXBiCisgICAg
ICAtIGNvbnN0OiBheGkKKyAgICAgIC0gY29uc3Q6IHJ0cm0KKyAgICAgIC0gY29uc3Q6IHBpeAor
ICAgICAgLSBjb25zdDogZHRyYworCisgIHBvcnRAMDoKKyAgICB0eXBlOiBvYmplY3QKKyAgICBk
ZXNjcmlwdGlvbjogQSBwb3J0IG5vZGUgcG9pbnRpbmcgdG8gYSBoZG1pX2luIG9yIG1pcGlfaW4g
cG9ydCBub2RlLgorCitleGFtcGxlczoKKyAgLSB8CisgICAgZGNzczogZGNzc0AweDMyZTAwMDAw
IHsKKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47CisgICAgICAgICNzaXplLWNlbGxzID0g
PDA+OworICAgICAgICBjb21wYXRpYmxlID0gIm54cCxpbXg4bXEtZGNzcyI7CisgICAgICAgIHJl
ZyA9IDwweDMyZTAwMDAwIDB4MkQwMDA+LCA8MHgzMmUyZjAwMCAweDEwMDA+OworICAgICAgICBp
bnRlcnJ1cHRzID0gPDY+LCA8OD4sIDw5PjsKKyAgICAgICAgaW50ZXJydXB0LW5hbWVzID0gImN0
eF9sZCIsICJjdHhsZF9raWNrIiwgInZibGFuayI7CisgICAgICAgIGludGVycnVwdC1wYXJlbnQg
PSA8JmlycXN0ZWVyPjsKKyAgICAgICAgY2xvY2tzID0gPCZjbGsgMjQ4PiwgPCZjbGsgMjQ3Piwg
PCZjbGsgMjQ5PiwKKyAgICAgICAgICAgICAgICAgPCZjbGsgMjU0Piw8JmNsayAxMjI+OworICAg
ICAgICBjbG9jay1uYW1lcyA9ICJhcGIiLCAiYXhpIiwgInJ0cm0iLCAicGl4IiwgImR0cmMiOwor
ICAgICAgICBhc3NpZ25lZC1jbG9ja3MgPSA8JmNsayAxMDc+LCA8JmNsayAxMDk+LCA8JmNsayAy
NjY+OworICAgICAgICBhc3NpZ25lZC1jbG9jay1wYXJlbnRzID0gPCZjbGsgNzg+LCA8JmNsayA3
OD4sIDwmY2xrIDM+OworICAgICAgICBhc3NpZ25lZC1jbG9jay1yYXRlcyA9IDw4MDAwMDAwMDA+
LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDw0MDAwMDAwMDA+OworICAgICAgICBw
b3J0QDAgeworICAgICAgICAgICAgZGNzc19vdXQ6IGVuZHBvaW50IHsKKyAgICAgICAgICAgICAg
ICByZW1vdGUtZW5kcG9pbnQgPSA8JmhkbWlfaW4+OworICAgICAgICAgICAgfTsKKyAgICAgICAg
fTsKKyAgICB9OworCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
