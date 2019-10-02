Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBF4C8A7F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 16:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A187289E1A;
	Wed,  2 Oct 2019 14:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D5489E1A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 14:05:48 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 71E701A0AD9;
 Wed,  2 Oct 2019 16:05:47 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 657BE1A02D1;
 Wed,  2 Oct 2019 16:05:47 +0200 (CEST)
Received: from fsr-ub1664-121.ea.freescale.net
 (fsr-ub1664-121.ea.freescale.net [10.171.82.171])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id D13B62060C;
 Wed,  2 Oct 2019 16:05:46 +0200 (CEST)
From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH v2 4/5] dt-bindings: display: imx: add bindings for DCSS
Date: Wed,  2 Oct 2019 17:04:56 +0300
Message-Id: <1570025100-5634-5-git-send-email-laurentiu.palcu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570025100-5634-1-git-send-email-laurentiu.palcu@nxp.com>
References: <1570025100-5634-1-git-send-email-laurentiu.palcu@nxp.com>
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
LWRjc3MueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMC4uZWZkMjQ5NAot
LS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L2lteC9ueHAsaW14OG1xLWRjc3MueWFtbApAQCAtMCwwICsxLDg2IEBACisjIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1c2UpCisjIENvcHlyaWdodCAy
MDE5IE5YUAorJVlBTUwgMS4yCistLS0KKyRpZDogImh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hl
bWFzL2Rpc3BsYXkvaW14L254cCxpbXg4bXEtZGNzcy55YW1sIyIKKyRzY2hlbWE6ICJodHRwOi8v
ZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMiCisKK3RpdGxlOiBpTVg4TVEg
RGlzcGxheSBDb250cm9sbGVyIFN1YnN5c3RlbSAoRENTUykKKworbWFpbnRhaW5lcnM6CisgIC0g
TGF1cmVudGl1IFBhbGN1IDxsYXVyZW50aXUucGFsY3VAbnhwLmNvbT4KKworZGVzY3JpcHRpb246
CisKKyAgVGhlIERDU1MgKGRpc3BsYXkgY29udHJvbGxlciBzdWIgc3lzdGVtKSBpcyB1c2VkIHRv
IHNvdXJjZSB1cCB0byB0aHJlZQorICBkaXNwbGF5IGJ1ZmZlcnMsIGNvbXBvc2UgdGhlbSwgYW5k
IGRyaXZlIGEgZGlzcGxheSB1c2luZyBIRE1JIDIuMGEod2l0aCBIRENQCisgIDIuMikgb3IgTUlQ
SS1EU0kuIFRoZSBEQ1NTIGlzIGludGVuZGVkIHRvIHN1cHBvcnQgdXAgdG8gNGtwNjAgZGlzcGxh
eXMuIEhEUjEwCisgIGltYWdlIHByb2Nlc3NpbmcgY2FwYWJpbGl0aWVzIGFyZSBpbmNsdWRlZCB0
byBwcm92aWRlIGEgc29sdXRpb24gY2FwYWJsZSBvZgorICBkcml2aW5nIG5leHQgZ2VuZXJhdGlv
biBoaWdoIGR5bmFtaWMgcmFuZ2UgZGlzcGxheXMuCisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGli
bGU6CisgICAgY29uc3Q6IG54cCxpbXg4bXEtZGNzcworCisgIHJlZzoKKyAgICBtYXhJdGVtczog
MgorCisgIGludGVycnVwdHM6CisgICAgbWF4SXRlbXM6IDMKKyAgICBpdGVtczoKKyAgICAgIC0g
ZGVzY3JpcHRpb246IENvbnRleHQgbG9hZGVyIGNvbXBsZXRpb24gYW5kIGVycm9yIGludGVycnVw
dAorICAgICAgLSBkZXNjcmlwdGlvbjogRFRHIGludGVycnVwdCB1c2VkIHRvIHNpZ25hbCBjb250
ZXh0IGxvYWRlciB0cmlnZ2VyIHRpbWUKKyAgICAgIC0gZGVzY3JpcHRpb246IERURyBpbnRlcnJ1
cHQgZm9yIFZibGFuaworCisgIGludGVycnVwdC1uYW1lczoKKyAgICBtYXhJdGVtczogMworICAg
IGl0ZW1zOgorICAgICAgLSBjb25zdDogY3R4X2xkCisgICAgICAtIGNvbnN0OiBjdHhsZF9raWNr
CisgICAgICAtIGNvbnN0OiB2YmxhbmsKKworICBjbG9ja3M6CisgICAgbWF4SXRlbXM6IDUKKyAg
ICBpdGVtczoKKyAgICAgIC0gZGVzY3JpcHRpb246IERpc3BsYXkgQVBCIGNsb2NrIGZvciBhbGwg
cGVyaXBoZXJhbCBQSU8gYWNjZXNzIGludGVyZmFjZXMKKyAgICAgIC0gZGVzY3JpcHRpb246IERp
c3BsYXkgQVhJIGNsb2NrIG5lZWRlZCBieSBEUFIsIFNjYWxlciwgUlRSQU1fQ1RSTAorICAgICAg
LSBkZXNjcmlwdGlvbjogUlRSQU0gY2xvY2sKKyAgICAgIC0gZGVzY3JpcHRpb246IFBpeGVsIGNs
b2NrLCBjYW4gYmUgZHJpdmVyIGVpdGhlciBieSBIRE1JIHBoeSBjbG9jayBvciBNSVBJCisgICAg
ICAtIGRlc2NyaXB0aW9uOiBEVFJDIGNsb2NrLCBuZWVkZWQgYnkgdmlkZW8gZGVjb21wcmVzc29y
CisKKyAgY2xvY2stbmFtZXM6CisgICAgaXRlbXM6CisgICAgICAtIGNvbnN0OiBhcGIKKyAgICAg
IC0gY29uc3Q6IGF4aQorICAgICAgLSBjb25zdDogcnRybQorICAgICAgLSBjb25zdDogcGl4Cisg
ICAgICAtIGNvbnN0OiBkdHJjCisKKyAgcG9ydEAwOgorICAgIHR5cGU6IG9iamVjdAorICAgIGRl
c2NyaXB0aW9uOiBBIHBvcnQgbm9kZSBwb2ludGluZyB0byBhIGhkbWlfaW4gb3IgbWlwaV9pbiBw
b3J0IG5vZGUuCisKK2V4YW1wbGVzOgorICAtIHwKKyAgICBkY3NzOiBkaXNwbGF5LWNvbnRyb2xs
ZXJAMzJlMDAwMDAgeworICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKKyAgICAgICAgI3Np
emUtY2VsbHMgPSA8MD47CisgICAgICAgIGNvbXBhdGlibGUgPSAibnhwLGlteDhtcS1kY3NzIjsK
KyAgICAgICAgcmVnID0gPDB4MzJlMDAwMDAgMHgyZDAwMD4sIDwweDMyZTJmMDAwIDB4MTAwMD47
CisgICAgICAgIGludGVycnVwdHMgPSA8Nj4sIDw4PiwgPDk+OworICAgICAgICBpbnRlcnJ1cHQt
bmFtZXMgPSAiY3R4X2xkIiwgImN0eGxkX2tpY2siLCAidmJsYW5rIjsKKyAgICAgICAgaW50ZXJy
dXB0LXBhcmVudCA9IDwmaXJxc3RlZXI+OworICAgICAgICBjbG9ja3MgPSA8JmNsayAyNDg+LCA8
JmNsayAyNDc+LCA8JmNsayAyNDk+LAorICAgICAgICAgICAgICAgICA8JmNsayAyNTQ+LDwmY2xr
IDEyMj47CisgICAgICAgIGNsb2NrLW5hbWVzID0gImFwYiIsICJheGkiLCAicnRybSIsICJwaXgi
LCAiZHRyYyI7CisgICAgICAgIGFzc2lnbmVkLWNsb2NrcyA9IDwmY2xrIDEwNz4sIDwmY2xrIDEw
OT4sIDwmY2xrIDI2Nj47CisgICAgICAgIGFzc2lnbmVkLWNsb2NrLXBhcmVudHMgPSA8JmNsayA3
OD4sIDwmY2xrIDc4PiwgPCZjbGsgMz47CisgICAgICAgIGFzc2lnbmVkLWNsb2NrLXJhdGVzID0g
PDgwMDAwMDAwMD4sCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPDQwMDAwMDAwMD47
CisgICAgICAgIHBvcnRAMCB7CisgICAgICAgICAgICBkY3NzX291dDogZW5kcG9pbnQgeworICAg
ICAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmaGRtaV9pbj47CisgICAgICAgICAgICB9
OworICAgICAgICB9OworICAgIH07CisKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
