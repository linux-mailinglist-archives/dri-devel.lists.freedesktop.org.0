Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F4ACDC10
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 09:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA7C6E45C;
	Mon,  7 Oct 2019 07:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1461889C88;
 Mon,  7 Oct 2019 01:45:24 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 24DC03F23D;
 Mon,  7 Oct 2019 01:45:23 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: robdclark@gmail.com,
	sean@poorly.run
Subject: [PATCH RFC v2 4/5] ARM: dts: qcom: msm8974: add HDMI nodes
Date: Sun,  6 Oct 2019 21:45:08 -0400
Message-Id: <20191007014509.25180-5-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191007014509.25180-1-masneyb@onstation.org>
References: <20191007014509.25180-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Oct 2019 07:01:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1570412723;
 bh=qSF7JxG0bFyn3cQPR8q7gVg5cnvbx8ozSyPIX8JTT9c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MQ17mbX0Vsr/tmary8b/IbFnHUF9g4q96V0QWEe7CEGCSGnd62+BzOTpbjTDrNxcM
 h3cVvNbZ5/DGjMCi0EqY2j1hg/9qki3fxibtvEGECG3dFENvMewbniGUGU6iVAAQdH
 xoahdq/riTIuaqz+bBsU9JvI/+/CyJbneBdyaGYA=
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
Cc: jonathan@marek.ca, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, Laurent.pinchart@ideasonboard.com,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIEhETUkgdHggYW5kIHBoeSBub2RlcyB0byBzdXBwb3J0IGFuIGV4dGVybmFsIGRpc3BsYXkg
dGhhdCBjYW4gYmUKY29ubmVjdGVkIG92ZXIgdGhlIFNsaW1Qb3J0LiBUaGlzIGlzIGJhc2VkIG9u
IHdvcmsgZnJvbSBKb25hdGhhbiBNYXJlay4KClNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8
bWFzbmV5YkBvbnN0YXRpb24ub3JnPgpSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMu
d2FsbGVpakBsaW5hcm8ub3JnPgotLS0KQ2hhbmdlcyBzaW5jZSB2MToKLSBBZGQgaGRtaV9wbGwg
dG8gaGRtaS1waHkgbm9kZQotIGFkZCBwb3dlci1kb21haW4gdG8gaGRtaS1waHkgcGVyIGJpbmRp
bmcgc3BlY2lmaWNhdGlvbgotIFJlbW92ZSBGSVhNRSBjb21tZW50IHJlZ2FyZGluZyB0aGUgaHBk
LWdkc2Mtc3VwcGx5LiBJIHNhdyBhIHJlY2VudAogIHBvc3Qgb24gbGludXgtYXJtLW1zbSB0aGF0
IHRoaXMgaXMgcHJlc2VudCBmb3IgcnVubmluZyB0aGUgdXBzdHJlYW0KICBNU00gZGlzcGxheSBk
cml2ZXIgb24gdGhlIGRvd25zdHJlYW0ga2VybmVsLgoKIGFyY2gvYXJtL2Jvb3QvZHRzL3Fjb20t
bXNtODk3NC5kdHNpIHwgNzggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCA3OCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMv
cWNvbS1tc204OTc0LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9xY29tLW1zbTg5NzQuZHRzaQpp
bmRleCA3ZmMyM2U0MjJjYzUuLmFmMDJlYWNlMTRlMiAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9v
dC9kdHMvcWNvbS1tc204OTc0LmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvcWNvbS1tc204
OTc0LmR0c2kKQEAgLTEyNTgsNiArMTI1OCwxMyBAQAogCiAJCQkJCXBvcnRAMCB7CiAJCQkJCQly
ZWcgPSA8MD47CisJCQkJCQltZHA1X2ludGYzX291dDogZW5kcG9pbnQgeworCQkJCQkJCXJlbW90
ZS1lbmRwb2ludCA9IDwmaGRtaV9pbj47CisJCQkJCQl9OworCQkJCQl9OworCisJCQkJCXBvcnRA
MSB7CisJCQkJCQlyZWcgPSA8MT47CiAJCQkJCQltZHA1X2ludGYxX291dDogZW5kcG9pbnQgewog
CQkJCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZHNpMF9pbj47CiAJCQkJCQl9OwpAQCAtMTMzNSw2
ICsxMzQyLDc3IEBACiAJCQkJY2xvY2tzID0gPCZtbWNjIE1EU1NfQUhCX0NMSz47CiAJCQkJY2xv
Y2stbmFtZXMgPSAiaWZhY2UiOwogCQkJfTsKKworCQkJaGRtaTogaGRtaS10eEBmZDkyMjEwMCB7
CisJCQkJc3RhdHVzID0gImRpc2FibGVkIjsKKworCQkJCWNvbXBhdGlibGUgPSAicWNvbSxoZG1p
LXR4LTg5NzQiOworCQkJCXJlZyA9IDwweGZkOTIyMTAwIDB4MzVjPiwKKwkJCQkgICAgICA8MHhm
YzRiODAwMCAweDYwZjA+OworCQkJCXJlZy1uYW1lcyA9ICJjb3JlX3BoeXNpY2FsIiwKKwkJCQkg
ICAgICAgICAgICAicWZwcm9tX3BoeXNpY2FsIjsKKworCQkJCWludGVycnVwdC1wYXJlbnQgPSA8
Jm1kc3M+OworCQkJCWludGVycnVwdHMgPSA8OCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKworCQkJ
CXBvd2VyLWRvbWFpbnMgPSA8Jm1tY2MgTURTU19HRFNDPjsKKworCQkJCWNsb2NrcyA9IDwmbW1j
YyBNRFNTX01EUF9DTEs+LAorCQkJCSAgICAgICAgIDwmbW1jYyBNRFNTX0FIQl9DTEs+LAorCQkJ
CSAgICAgICAgIDwmbW1jYyBNRFNTX0hETUlfQ0xLPiwKKwkJCQkgICAgICAgICA8Jm1tY2MgTURT
U19IRE1JX0FIQl9DTEs+LAorCQkJCSAgICAgICAgIDwmbW1jYyBNRFNTX0VYVFBDTEtfQ0xLPjsK
KwkJCQljbG9jay1uYW1lcyA9ICJtZHBfY29yZSIsCisJCQkJICAgICAgICAgICAgICAiaWZhY2Ui
LAorCQkJCSAgICAgICAgICAgICAgImNvcmUiLAorCQkJCSAgICAgICAgICAgICAgImFsdF9pZmFj
ZSIsCisJCQkJICAgICAgICAgICAgICAiZXh0cCI7CisKKwkJCQlocGQtNXYtc3VwcGx5ID0gPCZw
bTg5NDFfNXZzMj47CisJCQkJY29yZS12ZGRhLXN1cHBseSA9IDwmcG04OTQxX2wxMj47CisJCQkJ
Y29yZS12Y2Mtc3VwcGx5ID0gPCZwbTg5NDFfczM+OworCisJCQkJcGh5cyA9IDwmaGRtaV9waHk+
OworCQkJCXBoeS1uYW1lcyA9ICJoZG1pX3BoeSI7CisKKwkJCQlwb3J0cyB7CisJCQkJCSNhZGRy
ZXNzLWNlbGxzID0gPDE+OworCQkJCQkjc2l6ZS1jZWxscyA9IDwwPjsKKworCQkJCQlwb3J0QDAg
eworCQkJCQkJcmVnID0gPDA+OworCQkJCQkJaGRtaV9pbjogZW5kcG9pbnQgeworCQkJCQkJCXJl
bW90ZS1lbmRwb2ludCA9IDwmbWRwNV9pbnRmM19vdXQ+OworCQkJCQkJfTsKKwkJCQkJfTsKKwor
CQkJCQlwb3J0QDEgeworCQkJCQkJcmVnID0gPDE+OworCQkJCQl9OworCQkJCX07CisJCQl9Owor
CisJCQloZG1pX3BoeTogaGRtaS1waHlAZmQ5MjI1MDAgeworCQkJCXN0YXR1cyA9ICJkaXNhYmxl
ZCI7CisKKwkJCQljb21wYXRpYmxlID0gInFjb20saGRtaS1waHktODk3NCI7CisJCQkJcmVnID0g
PDB4ZmQ5MjI1MDAgMHg3Yz4sCisJCQkJICAgICAgPDB4ZmQ5MjI3MDAgMHhkND47CisJCQkJcmVn
LW5hbWVzID0gImhkbWlfcGh5IiwKKwkJCQkgICAgICAgICAgICAiaGRtaV9wbGwiOworCisJCQkJ
Y2xvY2tzID0gPCZtbWNjIE1EU1NfQUhCX0NMSz4sCisJCQkJICAgICAgICAgPCZtbWNjIE1EU1Nf
SERNSV9BSEJfQ0xLPjsKKwkJCQljbG9jay1uYW1lcyA9ICJpZmFjZSIsCisJCQkJICAgICAgICAg
ICAgICAiYWx0X2lmYWNlIjsKKworCQkJCWNvcmUtdmRkYS1zdXBwbHkgPSA8JnBtODk0MV9sMTI+
OworCQkJCXZkZGlvLXN1cHBseSA9IDwmcG04OTQxX3MzPjsKKworCQkJCXBvd2VyLWRvbWFpbnMg
PSA8Jm1tY2MgTURTU19HRFNDPjsKKworCQkJCSNwaHktY2VsbHMgPSA8MD47CisJCQl9OwogCQl9
OwogCX07CiAKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
