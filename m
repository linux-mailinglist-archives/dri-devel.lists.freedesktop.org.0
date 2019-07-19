Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF026EF6A
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2019 14:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3310E6E8AF;
	Sat, 20 Jul 2019 12:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEA06E7FA
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 10:19:05 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 54E871A0144;
 Fri, 19 Jul 2019 12:19:04 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id EE9E51A0046;
 Fri, 19 Jul 2019 12:18:59 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 51F78402CF;
 Fri, 19 Jul 2019 18:18:54 +0800 (SGT)
From: Wen He <wen.he_1@nxp.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
 robh+dt@kernel.org
Subject: [v2 1/4] dt-bindings: display: Add DT bindings for LS1028A HDP-TX PHY.
Date: Fri, 19 Jul 2019 18:09:39 +0800
Message-Id: <20190719100942.12016-1-wen.he_1@nxp.com>
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
Cc: Wen He <wen.he_1@nxp.com>, leoyang.li@nxp.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIERUIGJpbmRpbmdzIGRvY3VtZW50bWF0aW9uIGZvciB0aGUgSERQLVRYIFBIWSBjb250cm9s
bGVyLiBUaGUgZGVzY3JpYmVzCndoaWNoIGNvdWxkIGJlIGZvdW5kIG9uIE5YUCBMYXllcnNjYXBl
IGxzMTAyOGEgcGxhdGZvcm0uCgpTaWduZWQtb2ZmLWJ5OiBXZW4gSGUgPHdlbi5oZV8xQG54cC5j
b20+Ci0tLQpjaGFuZ2UgaW4gdjI6CiAgICAgICAgLSBjb3JyZWN0aW9uIHRoZSBub2RlIG5hbWUu
CgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9mc2wsaGRwLnR4dCAgIHwgNTYgKysr
KysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDU2IGluc2VydGlvbnMoKykKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9m
c2wsaGRwLnR4dAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L2ZzbCxoZHAudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvZnNsLGhkcC50eHQKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAw
MDAwLi41M2NhMDgzMzc1ODcKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9mc2wsaGRwLnR4dApAQCAtMCwwICsxLDU2IEBACitOWFAg
TGF5ZXJzY3BhZSBsczEwMjhhIEhEUC1UWCBQSFkgQ29udHJvbGxlcgorPT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KKworVGhlIGZvbGxvd2luZyBiaW5kaW5ncyBk
ZXNjcmliZSB0aGUgQ2FkZW5jZSBIRFAgVFggUEhZIG9uIGxzMTAyOGEgdGhhdAorb2ZmZXIgbXVs
dGktcHJvdG9jb2wgc3VwcG9ydCBvZiBzdGFuZGFycyBzdWNoIGFzIGVEUCBhbmQgRGlzcGxheXBv
cnQsCitzdXBwb3J0cyBmb3IgMjUtNjAwTUh6IHBpeGVsIGNsb2NrIGFuZCB1cCB0byA0azJrIGF0
IDYwTUh6IHJlc29sdXRpb24uCitUaGUgSERQIHRyYW5zbWl0dGVyIGlzIGEgQ2FkZW5jZSBIRFAg
VFggY29udHJvbGxlciBJUCB3aXRoIGEgY29tcGFuaW9uCitQSFkgSVAuCisKK1JlcXVpcmVkIHBy
b3BlcnRpZXM6CisgIC0gY29tcGF0aWJsZTogICBTaG91bGQgYmUgImZzbCxsczEwMjhhLWRwIiBm
b3IgbHMxMDI4YS4KKyAgLSByZWc6ICAgICAgICAgIFBoeXNpY2FsIGJhc2UgYWRkcmVzcyBhbmQg
c2l6ZSBvZiB0aGUgYmxvY2sgb2YgcmVnaXN0ZXJzIHVzZWQKKyAgYnkgdGhlIHByb2Nlc3Nvci4K
KyAgLSBpbnRlcnJ1cHRzOiAgIEhEUCBob3RwbHVnIGluL291dCBkZXRlY3QgaW50ZXJydXB0IG51
bWJlcgorICAtIGNsb2NrczogICAgICAgQSBsaXN0IG9mIHBoYW5kbGUgKyBjbG9jay1zcGVjaWZp
ZXIgcGFpcnMsIG9uZSBmb3IgZWFjaCBlbnRyeQorICBpbiAnY2xvY2stbmFtZXMnCisgIC0gY2xv
Y2stbmFtZXM6ICBBIGxpc3Qgb2YgY2xvY2sgbmFtZXMuIEl0IHNob3VsZCBjb250YWluOgorICAg
ICAgLSAiY2xrX2lwZyI6IGludGVyLUludGVncmF0ZWQgY2lyY3VpdCBjbG9jaworICAgICAgLSAi
Y2xrX2NvcmUiOiBmb3IgdGhlIE1haW4gRGlzcGxheSBUWCBjb250cm9sbGVyIGNsb2NrCisgICAg
ICAtICJjbGtfcHhsIjogZm9yIHRoZSBwaXhlbCBjbG9jayBmZWVkaW5nIHRoZSBvdXRwdXQgUExM
IG9mIHRoZSBwcm9jZXNzb3IKKyAgICAgIC0gImNsa19weGxfbXV4IjogZm9yIHRoZSBoaWdoIFBl
cmZQTEwgYnlwYXNzIGNsb2NrCisgICAgICAtICJjbGtfcHhsX2xpbmsiOiBmb3IgdGhlIGxpbmsg
cmF0ZSBwaXhlbCBjbG9jaworICAgICAgLSAiY2xrX2FwYiI6IGZvciB0aGUgQVBCIGludGVyZmFj
ZSBjbG9jaworICAgICAgLSAiY2xrX3ZpZiI6IGZvciB0aGUgVmlkZW8gcGl4ZWwgY2xvY2sKKwor
UmVxdWlyZWQgc3ViLW5vZGVzOgorICAtIHBvcnQ6IFRoZSBIRFAgY29ubmVjdGlvbiB0byBhbiBl
bmNvZGVyIG91dHB1dCBwb3J0LiBUaGUgY29ubmVjdGlvbgorICAgIGlzIG1vZGVsbGVkIHVzaW5n
IHRoZSBPRiBncmFwaCBiaW5kaW5ncyBzcGVjaWZpZWQgaW4KKyAgICBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZ3JhcGgudHh0CisKKworRXhhbXBsZToKKworLyB7CisgICAgICAg
IC4uLgorCisgICAgICAgIGhkcHR4MDogZGlzcGxheUBmMjAwMDAwIHsKKyAgICAgICAgICAgICAg
ICBjb21wYXRpYmxlID0gImZzbCxsczEwMjhhLWRwIjsKKwkJcmVnID0gPDB4MCAweGYxZjAwMDAg
MHgwIDB4ZmZmZj4sCisJCSAgICA8MHgwIDB4ZjIwMDAwMCAweDAgMHhmZmZmZj47CisgICAgICAg
ICAgICAgICAgaW50ZXJydXB0cyA9IDwwIDIyMSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKwkJY2xv
Y2tzID0gPCZzeXNjbGs+LCA8JmhkcGNsaz4sIDwmZHBjbGs+LAorICAgICAgICAgICAgICAgICAg
ICAgICAgIDwmZHBjbGs+LCA8JmRwY2xrPiwgPCZwY2xrPiwgPCZkcGNsaz47CisJCWNsb2NrLW5h
bWVzID0gImNsa19pcGciLCAiY2xrX2NvcmUiLCAiY2xrX3B4bCIsCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAiY2xrX3B4bF9tdXgiLCAiY2xrX3B4bF9saW5rIiwgImNsa19hcGIiLAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImNsa192aWYiOworCisJCXBvcnQgeworCQkJ
ZHAxX291dHB1dDogZW5kcG9pbnQgeworCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZHAwX2lucHV0
PjsKKwkJCX07CisJCX07CisgICAgICAgIH07CisKKyAgICAgICAgLi4uCit9OwotLSAKMi4xNy4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
