Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B98DF57CCA
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 09:11:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21B56E5BB;
	Thu, 27 Jun 2019 07:11:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E7A6E3A6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 12:08:30 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C18991A0A11;
 Wed, 26 Jun 2019 14:08:28 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B3BCC1A0A0E;
 Wed, 26 Jun 2019 14:08:28 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 3BCA0205DB;
 Wed, 26 Jun 2019 14:08:28 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v6 0/2] Add DSI panel driver for Raydium RM67191
Date: Wed, 26 Jun 2019 15:08:25 +0300
Message-Id: <1561550907-9733-1-git-send-email-robert.chiras@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 27 Jun 2019 07:11:26 +0000
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
OTEuCgp2NjoKLSBDb2xsZWN0ZWQgUmV2aWV3ZWQtYnkgZnJvbSBGYWJpbwotIFJlbW92ZWQgdW51
c2VkIHZhcmlhYmxlcyAoc2FtKQoKdjU6Ci0gUmVtb3ZlZCB1bm5lY2Vzc2FyeSBkZWJ1ZyBtZXNz
YWdlcyAoZmFiaW8pCi0gSGFuZGxlZCBlcnJvciBjYXNlIGZvciBncGlvIHBpbiAoZmFiaW8pCgp2
NDoKLSBDaGFuZ2VkIGRlZmF1bHRfdGltaW5nIHN0cnVjdHVyZSB0eXBlIGZyb20gJ3N0cnVjdCBk
aXNwbGF5X3RpbWluZycgdG8KICAnc3RydWN0IGRybV9kaXNwbGF5X21vZGUnIChmYWJpbykKLSBS
ZXBsYWNlZCBkZXZtX2dwaW9kX2dldCB3aXRoIGRldm1fZ3Bpb2RfZ2V0X29wdGlvbmFsIChmYWJp
bykKLSBBZGRlZCBwb3dlciByZWd1bGF0b3JzIChmYWJpbykKLSBSZW1vdmVkIHBtX29wcyAoZmFi
aW8pCgp2MzoKLSBBZGRlZCBteXNlbGYgdG8gTUFJTlRBSU5FUlMgZm9yIHRoaXMgZHJpdmVyIChz
YW0pCi0gUmVtb3ZlZCBkaXNwbGF5LXRpbWluZ3MgcHJvcGVydHkgKGZhYmlvKQotIEZpeGVkIGR0
IGRlc2NyaXB0aW9uIChzYW0pCi0gUmUtYXJyYW5nZWQgY2FsbHMgaW5zaWRlIGdldF9tb2RlcyBm
dW5jdGlvbiAoc2FtKQotIENoYW5nZWQgaWZkZWZzIHdpdGggX21heWJlX3VudXNlZCBmb3Igc3Vz
cGVuZC9yZXN1bWUgZnVuY3Rpb25zIChzYW0pCi0gQ29sbGVjdGVkIFJldmlld2VkLWJ5IGZyb20g
U2FtCgp2MjoKLSBGaXhlZCAncmVzZXQtZ3BpbycgdG8gJ3Jlc2V0LWdwaW9zJyBwcm9wZXJ0eSBu
YW1pbmcgKGZhYmlvKQotIENoYW5nZWQgdGhlIHN0YXRlIG9mIHRoZSByZXNldCBncGlvIHRvIGFj
dGl2ZSBsb3cgYW5kIGZpeGVkIGhvdyBpdCBpcwogIGhhbmRsZWQgaW4gZHJpdmVyIChmYWJpbykK
LSBGaXhlZCBjb3B5cmlnaHQgc3RhdGVtZW50IChkYW5pZWwpCi0gUmVvcmRlcmVkIGluY2x1ZGVz
IChzYW0pCi0gQWRkZWQgZGVmaW5lcyBmb3IgcGFuZWwgc3BlY2lmaWMgY29sb3IgZm9ybWF0cyAo
ZmFiaW8pCi0gUmVtb3ZlZCB1bm5lY2Vzc2FyeSB0ZXN0cyBpbiBlbmFibGUgYW5kIHVucHJlcGFy
ZSAoc2FtKQotIFJlbW92ZWQgdGhlIHVubmVjZXNzYXJ5IGJhY2tsaWdodCB3cml0ZSBpbiBlbmFi
bGUgKHNhbSkKKioqIFNVQkpFQ1QgSEVSRSAqKioKCioqKiBCTFVSQiBIRVJFICoqKgoKUm9iZXJ0
IENoaXJhcyAoMik6CiAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IHBhbmVsOiBBZGQgc3VwcG9ydCBm
b3IgUmF5ZGl1bSBSTTY3MTkxIHBhbmVsCiAgZHJtL3BhbmVsOiBBZGQgc3VwcG9ydCBmb3IgUmF5
ZGl1bSBSTTY3MTkxIHBhbmVsIGRyaXZlcgoKIC4uLi9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3Jh
eWRpdW0scm02NzE5MS50eHQgICAgIHwgIDQxICsrCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNiArCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwv
S2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICB8ICAgOSArCiBkcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0v
cGFuZWwvcGFuZWwtcmF5ZGl1bS1ybTY3MTkxLmMgICAgICB8IDY2OCArKysrKysrKysrKysrKysr
KysrKysKIDUgZmlsZXMgY2hhbmdlZCwgNzI1IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9yYXlk
aXVtLHJtNjcxOTEudHh0CiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLXJheWRpdW0tcm02NzE5MS5jCgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
