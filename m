Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D5357CDD
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 09:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66EF06E5CF;
	Thu, 27 Jun 2019 07:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D196E366
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 10:20:49 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B58C91A09DC;
 Wed, 26 Jun 2019 12:20:47 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A89161A0011;
 Wed, 26 Jun 2019 12:20:47 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 31862205DB;
 Wed, 26 Jun 2019 12:20:47 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v5 0/2] Add DSI panel driver for Raydium RM67191
Date: Wed, 26 Jun 2019 13:20:18 +0300
Message-Id: <1561544420-15572-1-git-send-email-robert.chiras@nxp.com>
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
OTEuCgp2NToKLSBSZW1vdmVkIHVubmVjZXNzYXJ5IGRlYnVnIG1lc3NhZ2VzIChmYWJpbykKLSBI
YW5kbGVkIGVycm9yIGNhc2UgZm9yIGdwaW8gcGluIChmYWJpbykKCnY0OgotIENoYW5nZWQgZGVm
YXVsdF90aW1pbmcgc3RydWN0dXJlIHR5cGUgZnJvbSAnc3RydWN0IGRpc3BsYXlfdGltaW5nJyB0
bwogICdzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZScgKGZhYmlvKQotIFJlcGxhY2VkIGRldm1fZ3Bp
b2RfZ2V0IHdpdGggZGV2bV9ncGlvZF9nZXRfb3B0aW9uYWwgKGZhYmlvKQotIEFkZGVkIHBvd2Vy
IHJlZ3VsYXRvcnMgKGZhYmlvKQotIFJlbW92ZWQgcG1fb3BzIChmYWJpbykKCnYzOgotIEFkZGVk
IG15c2VsZiB0byBNQUlOVEFJTkVSUyBmb3IgdGhpcyBkcml2ZXIgKHNhbSkKLSBSZW1vdmVkIGRp
c3BsYXktdGltaW5ncyBwcm9wZXJ0eSAoZmFiaW8pCi0gRml4ZWQgZHQgZGVzY3JpcHRpb24gKHNh
bSkKLSBSZS1hcnJhbmdlZCBjYWxscyBpbnNpZGUgZ2V0X21vZGVzIGZ1bmN0aW9uIChzYW0pCi0g
Q2hhbmdlZCBpZmRlZnMgd2l0aCBfbWF5YmVfdW51c2VkIGZvciBzdXNwZW5kL3Jlc3VtZSBmdW5j
dGlvbnMgKHNhbSkKLSBDb2xsZWN0ZWQgUmV2aWV3ZWQtYnkgZnJvbSBTYW0KCnYyOgotIEZpeGVk
ICdyZXNldC1ncGlvJyB0byAncmVzZXQtZ3Bpb3MnIHByb3BlcnR5IG5hbWluZyAoZmFiaW8pCi0g
Q2hhbmdlZCB0aGUgc3RhdGUgb2YgdGhlIHJlc2V0IGdwaW8gdG8gYWN0aXZlIGxvdyBhbmQgZml4
ZWQgaG93IGl0IGlzCiAgaGFuZGxlZCBpbiBkcml2ZXIgKGZhYmlvKQotIEZpeGVkIGNvcHlyaWdo
dCBzdGF0ZW1lbnQgKGRhbmllbCkKLSBSZW9yZGVyZWQgaW5jbHVkZXMgKHNhbSkKLSBBZGRlZCBk
ZWZpbmVzIGZvciBwYW5lbCBzcGVjaWZpYyBjb2xvciBmb3JtYXRzIChmYWJpbykKLSBSZW1vdmVk
IHVubmVjZXNzYXJ5IHRlc3RzIGluIGVuYWJsZSBhbmQgdW5wcmVwYXJlIChzYW0pCi0gUmVtb3Zl
ZCB0aGUgdW5uZWNlc3NhcnkgYmFja2xpZ2h0IHdyaXRlIGluIGVuYWJsZSAoc2FtKQoKUm9iZXJ0
IENoaXJhcyAoMik6CiAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IHBhbmVsOiBBZGQgc3VwcG9ydCBm
b3IgUmF5ZGl1bSBSTTY3MTkxIHBhbmVsCiAgZHJtL3BhbmVsOiBBZGQgc3VwcG9ydCBmb3IgUmF5
ZGl1bSBSTTY3MTkxIHBhbmVsIGRyaXZlcgoKIC4uLi9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3Jh
eWRpdW0scm02NzE5MS50eHQgICAgIHwgIDQxICsrCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNiArCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwv
S2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICB8ICAgOSArCiBkcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0v
cGFuZWwvcGFuZWwtcmF5ZGl1bS1ybTY3MTkxLmMgICAgICB8IDY3MCArKysrKysrKysrKysrKysr
KysrKysKIDUgZmlsZXMgY2hhbmdlZCwgNzI3IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9yYXlk
aXVtLHJtNjcxOTEudHh0CiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLXJheWRpdW0tcm02NzE5MS5jCgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
