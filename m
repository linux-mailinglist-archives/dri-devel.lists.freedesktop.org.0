Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F052F5247C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:28:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED8886E045;
	Tue, 25 Jun 2019 07:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB1889DED
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 07:11:44 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 372331A0F3D;
 Tue, 25 Jun 2019 09:11:43 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 34E831A0F32;
 Tue, 25 Jun 2019 09:11:43 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id B23F4205E5;
 Tue, 25 Jun 2019 09:11:42 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v4 0/2] Add DSI panel driver for Raydium RM67191
Date: Tue, 25 Jun 2019 10:11:12 +0300
Message-Id: <1561446674-25084-1-git-send-email-robert.chiras@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
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
Cc: Robert Chiras <robert.chiras@nxp.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-imx@nxp.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaC1zZXQgY29udGFpbnMgdGhlIERSTSBwYW5lbCBkcml2ZXIgYW5kIGR0LWJpbmRp
bmdzIGRvY3VtZW50YXRpb24KZm9yIHRoZSBEU0kgZHJpdmVuIHBhbmVsOiBSYXlkaXVtIFJNNjcx
OTEuCgp2NDoKLSBDaGFuZ2VkIGRlZmF1bHRfdGltaW5nIHN0cnVjdHVyZSB0eXBlIGZyb20gJ3N0
cnVjdCBkaXNwbGF5X3RpbWluZycgdG8KICAnc3RydWN0IGRybV9kaXNwbGF5X21vZGUnIChmYWJp
bykKLSBSZXBsYWNlZCBkZXZtX2dwaW9kX2dldCB3aXRoIGRldm1fZ3Bpb2RfZ2V0X29wdGlvbmFs
IChmYWJpbykKLSBBZGRlZCBwb3dlciByZWd1bGF0b3JzIChmYWJpbykKLSBSZW1vdmVkIHBtX29w
cyAoZmFiaW8pCgp2MzoKLSBBZGRlZCBteXNlbGYgdG8gTUFJTlRBSU5FUlMgZm9yIHRoaXMgZHJp
dmVyIChzYW0pCi0gUmVtb3ZlZCBkaXNwbGF5LXRpbWluZ3MgcHJvcGVydHkgKGZhYmlvKQotIEZp
eGVkIGR0IGRlc2NyaXB0aW9uIChzYW0pCi0gUmUtYXJyYW5nZWQgY2FsbHMgaW5zaWRlIGdldF9t
b2RlcyBmdW5jdGlvbiAoc2FtKQotIENoYW5nZWQgaWZkZWZzIHdpdGggX21heWJlX3VudXNlZCBm
b3Igc3VzcGVuZC9yZXN1bWUgZnVuY3Rpb25zIChzYW0pCi0gQ29sbGVjdGVkIFJldmlld2VkLWJ5
IGZyb20gU2FtCgp2MjoKLSBGaXhlZCAncmVzZXQtZ3BpbycgdG8gJ3Jlc2V0LWdwaW9zJyBwcm9w
ZXJ0eSBuYW1pbmcgKGZhYmlvKQotIENoYW5nZWQgdGhlIHN0YXRlIG9mIHRoZSByZXNldCBncGlv
IHRvIGFjdGl2ZSBsb3cgYW5kIGZpeGVkIGhvdyBpdCBpcwogIGhhbmRsZWQgaW4gZHJpdmVyIChm
YWJpbykKLSBGaXhlZCBjb3B5cmlnaHQgc3RhdGVtZW50IChkYW5pZWwpCi0gUmVvcmRlcmVkIGlu
Y2x1ZGVzIChzYW0pCi0gQWRkZWQgZGVmaW5lcyBmb3IgcGFuZWwgc3BlY2lmaWMgY29sb3IgZm9y
bWF0cyAoZmFiaW8pCi0gUmVtb3ZlZCB1bm5lY2Vzc2FyeSB0ZXN0cyBpbiBlbmFibGUgYW5kIHVu
cHJlcGFyZSAoc2FtKQotIFJlbW92ZWQgdGhlIHVubmVjZXNzYXJ5IGJhY2tsaWdodCB3cml0ZSBp
biBlbmFibGUgKHNhbSkKClJvYmVydCBDaGlyYXMgKDIpOgogIGR0LWJpbmRpbmdzOiBkaXNwbGF5
OiBwYW5lbDogQWRkIHN1cHBvcnQgZm9yIFJheWRpdW0gUk02NzE5MSBwYW5lbAogIGRybS9wYW5l
bDogQWRkIHN1cHBvcnQgZm9yIFJheWRpdW0gUk02NzE5MSBwYW5lbCBkcml2ZXIKCiAuLi4vYmlu
ZGluZ3MvZGlzcGxheS9wYW5lbC9yYXlkaXVtLHJtNjcxOTEudHh0ICAgICB8ICA0MSArKwogTUFJ
TlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDYgKwog
ZHJpdmVycy9ncHUvZHJtL3BhbmVsL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgfCAgIDkg
KwogZHJpdmVycy9ncHUvZHJtL3BhbmVsL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgfCAg
IDEgKwogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJheWRpdW0tcm02NzE5MS5jICAgICAg
fCA2NzMgKysrKysrKysrKysrKysrKysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDczMCBpbnNlcnRp
b25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvcGFuZWwvcmF5ZGl1bSxybTY3MTkxLnR4dAogY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yYXlkaXVtLXJtNjcxOTEuYwoKLS0gCjIuNy40
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
