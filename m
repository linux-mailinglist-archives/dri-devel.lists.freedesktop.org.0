Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B33299A8CF
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 09:31:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA1B6EBC5;
	Fri, 23 Aug 2019 07:31:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67EB16EB6F;
 Thu, 22 Aug 2019 14:37:29 +0000 (UTC)
Received: from ins7386.localdomain (unknown [207.110.43.92])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 95D533E99E;
 Thu, 22 Aug 2019 14:37:27 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: agross@kernel.org, robdclark@gmail.com, sean@poorly.run,
 robh+dt@kernel.org, bjorn.andersson@linaro.org
Subject: [PATCH v6 2/7] dt-bindings: display: msm: gmu: add optional ocmem
 property
Date: Thu, 22 Aug 2019 07:36:58 -0700
Message-Id: <20190822143703.13030-3-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190822143703.13030-1-masneyb@onstation.org>
References: <20190822143703.13030-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 23 Aug 2019 07:30:43 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1566484648;
 bh=Aq4BpuNxY324r2hl6SoSoEp3suUXUAW+4xkCx7xFQqE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ayui5eYLmXme4OMchq1G+iaJuS0IHI1KuxTNuAl3acQ2n+LBEjAyaD2D/bHM4PuG+
 JApKyacgnyTMom9RxqQc5mcYpJJmMdxqzT9hLbJPz4VZaChNEhVVrMRj4hmTB2cElK
 pB1vZTqPbA44kGrQjltFiUFRmw0B2cPa4FwgFpsE=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jonathan@marek.ca,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29tZSBBM3h4IGFuZCBBNHh4IEFkcmVubyBHUFVzIGRvIG5vdCBoYXZlIEdNRU0gaW5zaWRlIHRo
ZSBHUFUgY29yZSBhbmQKbXVzdCB1c2UgdGhlIE9uIENoaXAgTUVNb3J5IChPQ01FTSkgaW4gb3Jk
ZXIgdG8gYmUgZnVuY3Rpb25hbC4gQWRkIHRoZQpvcHRpb25hbCBvY21lbSBwcm9wZXJ0eSB0byB0
aGUgQWRyZW5vIEdyYXBoaWNzIE1hbmFnZW1lbnQgVW5pdCBiaW5kaW5ncy4KClNpZ25lZC1vZmYt
Ynk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgotLS0KQ2hhbmdlcyBzaW5j
ZSB2NToKLSByZW5hbWUgb2NtZW0gcHJvcGVydHkgdG8gc3JhbSB0byBtYXRjaCB3aGF0IFRJIGN1
cnJlbnRseSBoYXMuCgpDaGFuZ2VzIHNpbmNlIHY0OgotIE5vbmUKCkNoYW5nZXMgc2luY2UgdjM6
Ci0gY29ycmVjdCBsaW5rIHRvIHFjb20sb2NtZW0ueWFtbAoKQ2hhbmdlcyBzaW5jZSB2MjoKLSBB
ZGQgYTN4eCBleGFtcGxlIHdpdGggT0NNRU0KCkNoYW5nZXMgc2luY2UgdjE6Ci0gTm9uZQoKIC4u
Li9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2dtdS50eHQgICB8IDUwICsrKysrKysr
KysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2dtdS50eHQg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZ211LnR4dApp
bmRleCA5MGFmNWIwYTU2YTkuLjIzMDVhMmFlZGU1YSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2dtdS50eHQKKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2dtdS50eHQKQEAgLTMxLDYgKzMx
LDEwIEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6CiAtIGlvbW11czogcGhhbmRsZSB0byB0aGUgYWRy
ZW5vIGlvbW11CiAtIG9wZXJhdGluZy1wb2ludHMtdjI6IHBoYW5kbGUgdG8gdGhlIE9QUCBvcGVy
YXRpbmcgcG9pbnRzCiAKK09wdGlvbmFsIHByb3BlcnRpZXM6CistIHNyYW06IHBoYW5kbGUgdG8g
dGhlIE9uIENoaXAgTWVtb3J5IChPQ01FTSkgdGhhdCdzIHByZXNlbnQgb24gc29tZSBTbmFwZHJh
Z29uCisgICAgICAgIFNvQ3MuIFNlZSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
c3JhbS9xY29tLG9jbWVtLnlhbWwuCisKIEV4YW1wbGU6CiAKIC8gewpAQCAtNjMsMyArNjcsNDkg
QEAgRXhhbXBsZToKIAkJb3BlcmF0aW5nLXBvaW50cy12MiA9IDwmZ211X29wcF90YWJsZT47CiAJ
fTsKIH07CisKK2EzeHggZXhhbXBsZSB3aXRoIE9DTUVNIHN1cHBvcnQ6CisKKy8geworCS4uLgor
CisJZ3B1OiBhZHJlbm9AZmRiMDAwMDAgeworCQljb21wYXRpYmxlID0gInFjb20sYWRyZW5vLTMz
MC4yIiwKKwkJICAgICAgICAgICAgICJxY29tLGFkcmVubyI7CisJCXJlZyA9IDwweGZkYjAwMDAw
IDB4MTAwMDA+OworCQlyZWctbmFtZXMgPSAia2dzbF8zZDBfcmVnX21lbW9yeSI7CisJCWludGVy
cnVwdHMgPSA8R0lDX1NQSSAzMyBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKwkJaW50ZXJydXB0LW5h
bWVzID0gImtnc2xfM2QwX2lycSI7CisJCWNsb2NrLW5hbWVzID0gImNvcmUiLAorCQkgICAgICAg
ICAgICAgICJpZmFjZSIsCisJCSAgICAgICAgICAgICAgIm1lbV9pZmFjZSI7CisJCWNsb2NrcyA9
IDwmbW1jYyBPWElMSV9HRlgzRF9DTEs+LAorCQkgICAgICAgICA8Jm1tY2MgT1hJTElDWF9BSEJf
Q0xLPiwKKwkJICAgICAgICAgPCZtbWNjIE9YSUxJQ1hfQVhJX0NMSz47CisJCXNyYW0gPSA8Jm9j
bWVtPjsKKwkJcG93ZXItZG9tYWlucyA9IDwmbW1jYyBPWElMSUNYX0dEU0M+OworCQlvcGVyYXRp
bmctcG9pbnRzLXYyID0gPCZncHVfb3BwX3RhYmxlPjsKKwkJaW9tbXVzID0gPCZncHVfaW9tbXUg
MD47CisJfTsKKworCW9jbWVtOiBvY21lbUBmZGQwMDAwMCB7CisJCWNvbXBhdGlibGUgPSAicWNv
bSxtc204OTc0LW9jbWVtIjsKKworCQlyZWcgPSA8MHhmZGQwMDAwMCAweDIwMDA+LAorCQkgICAg
ICA8MHhmZWMwMDAwMCAweDE4MDAwMD47CisJCXJlZy1uYW1lcyA9ICJjdHJsIiwKKwkJICAgICAg
ICAgICAgICJtZW0iOworCisJCWNsb2NrcyA9IDwmcnBtY2MgUlBNX1NNRF9PQ01FTUdYX0NMSz4s
CisJCSAgICAgICAgIDwmbW1jYyBPQ01FTUNYX09DTUVNTk9DX0NMSz47CisJCWNsb2NrLW5hbWVz
ID0gImNvcmUiLAorCQkgICAgICAgICAgICAgICJpZmFjZSI7CisKKwkJI2FkZHJlc3MtY2VsbHMg
PSA8MT47CisJCSNzaXplLWNlbGxzID0gPDE+OworCisJCWdtdS1zcmFtQDAgeworCQkJcmVnID0g
PDB4MCAweDEwMDAwMD47CisJCX07CisJfTsKK307Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
