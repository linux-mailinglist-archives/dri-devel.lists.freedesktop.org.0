Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E58A8CEAB0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 19:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423146E620;
	Mon,  7 Oct 2019 17:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA606E620;
 Mon,  7 Oct 2019 17:33:32 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 574DC206BB;
 Mon,  7 Oct 2019 17:33:27 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH v3] drm/amd: Fix Kconfig indentation
Date: Mon,  7 Oct 2019 19:33:22 +0200
Message-Id: <20191007173322.9306-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570469612;
 bh=89Dgdcnx+TZFIqd6fwq18cEG+oms2xjy64qSLbTDVXA=;
 h=From:To:Cc:Subject:Date:From;
 b=j/nSOY2CLSaY6ykV7MPW0ZITidtvOocSQkjkkdODAci1fsN3tiruPdaOAKITrI4Ml
 ncaMCUiUScL9Ybo60bA5L/7thaGYctYs0zCISt34bZq1WwG91JmX3W6hB4OTq7kZ4i
 SXGqbbPo3GWtooR229ICb41mvhcyQTAmcqgPrUzc=
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRqdXN0IGluZGVudGF0aW9uIGZyb20gc3BhY2VzIHRvIHRhYiAoK29wdGlvbmFsIHR3byBzcGFj
ZXMpIGFzIGluCmNvZGluZyBzdHlsZSB3aXRoIGNvbW1hbmQgbGlrZToKICAgICQgc2VkIC1lICdz
L14gICAgICAgIC9cdC8nIC1pICovS2NvbmZpZwoKU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtv
emxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgoKLS0tCgpDaGFuZ2VzIHNpbmNlIHYyOgoxLiBTcGxp
dCBBTUQgYW5kIGk5MTUgdG8gc2VwYXJhdGUgcGF0Y2hlcy4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
S2NvbmZpZyAgICAgICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9LY29uZmlnIHwgMzIgKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hh
bmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZwppbmRleCAxMDhl
MWI3ZjQ1NjQuLjdjYjZlNGViOTllOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL0tjb25m
aWcKKysrIGIvZHJpdmVycy9ncHUvZHJtL0tjb25maWcKQEAgLTIyNiw5ICsyMjYsOSBAQCBjb25m
aWcgRFJNX0FNREdQVQogCXRyaXN0YXRlICJBTUQgR1BVIgogCWRlcGVuZHMgb24gRFJNICYmIFBD
SSAmJiBNTVUKIAlzZWxlY3QgRldfTE9BREVSCi0gICAgICAgIHNlbGVjdCBEUk1fS01TX0hFTFBF
UgorCXNlbGVjdCBEUk1fS01TX0hFTFBFUgogCXNlbGVjdCBEUk1fU0NIRUQKLSAgICAgICAgc2Vs
ZWN0IERSTV9UVE0KKwlzZWxlY3QgRFJNX1RUTQogCXNlbGVjdCBQT1dFUl9TVVBQTFkKIAlzZWxl
Y3QgSFdNT04KIAlzZWxlY3QgQkFDS0xJR0hUX0NMQVNTX0RFVklDRQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvS2NvbmZpZwppbmRleCAxYmJlNzYyZWU2YmEuLjMxMzE4M2I4MDAzMiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L0tjb25maWcKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L0tjb25maWcKQEAgLTIzLDE2ICsyMywxNiBAQCBjb25maWcgRFJNX0FN
RF9EQ19EQ04yXzAKIAlkZXBlbmRzIG9uIERSTV9BTURfREMgJiYgWDg2CiAJZGVwZW5kcyBvbiBE
Uk1fQU1EX0RDX0RDTjFfMAogCWhlbHAKLQkgICAgQ2hvb3NlIHRoaXMgb3B0aW9uIGlmIHlvdSB3
YW50IHRvIGhhdmUKLQkgICAgTmF2aSBzdXBwb3J0IGZvciBkaXNwbGF5IGVuZ2luZQorCSAgQ2hv
b3NlIHRoaXMgb3B0aW9uIGlmIHlvdSB3YW50IHRvIGhhdmUKKwkgIE5hdmkgc3VwcG9ydCBmb3Ig
ZGlzcGxheSBlbmdpbmUKIAogY29uZmlnIERSTV9BTURfRENfRENOMl8xCi0gICAgICAgIGJvb2wg
IkRDTiAyLjEgZmFtaWx5IgotICAgICAgICBkZXBlbmRzIG9uIERSTV9BTURfREMgJiYgWDg2Ci0g
ICAgICAgIGRlcGVuZHMgb24gRFJNX0FNRF9EQ19EQ04yXzAKLSAgICAgICAgaGVscAotICAgICAg
ICAgICAgQ2hvb3NlIHRoaXMgb3B0aW9uIGlmIHlvdSB3YW50IHRvIGhhdmUKLSAgICAgICAgICAg
IFJlbm9pciBzdXBwb3J0IGZvciBkaXNwbGF5IGVuZ2luZQorCWJvb2wgIkRDTiAyLjEgZmFtaWx5
IgorCWRlcGVuZHMgb24gRFJNX0FNRF9EQyAmJiBYODYKKwlkZXBlbmRzIG9uIERSTV9BTURfRENf
RENOMl8wCisJaGVscAorCSAgQ2hvb3NlIHRoaXMgb3B0aW9uIGlmIHlvdSB3YW50IHRvIGhhdmUK
KwkgIFJlbm9pciBzdXBwb3J0IGZvciBkaXNwbGF5IGVuZ2luZQogCiBjb25maWcgRFJNX0FNRF9E
Q19EU0NfU1VQUE9SVAogCWJvb2wgIkRTQyBzdXBwb3J0IgpAQCAtNDEsMTYgKzQxLDE2IEBAIGNv
bmZpZyBEUk1fQU1EX0RDX0RTQ19TVVBQT1JUCiAJZGVwZW5kcyBvbiBEUk1fQU1EX0RDX0RDTjFf
MAogCWRlcGVuZHMgb24gRFJNX0FNRF9EQ19EQ04yXzAKIAloZWxwCi0JICAgIENob29zZSB0aGlz
IG9wdGlvbiBpZiB5b3Ugd2FudCB0byBoYXZlCi0JICAgIER5bmFtaWMgU3RyZWFtIENvbXByZXNz
aW9uIHN1cHBvcnQKKwkgIENob29zZSB0aGlzIG9wdGlvbiBpZiB5b3Ugd2FudCB0byBoYXZlCisJ
ICBEeW5hbWljIFN0cmVhbSBDb21wcmVzc2lvbiBzdXBwb3J0CiAKIGNvbmZpZyBEUk1fQU1EX0RD
X0hEQ1AKLSAgICAgICAgYm9vbCAiRW5hYmxlIEhEQ1Agc3VwcG9ydCBpbiBEQyIKLSAgICAgICAg
ZGVwZW5kcyBvbiBEUk1fQU1EX0RDCi0gICAgICAgIGhlbHAKLSAgICAgICAgIENob29zZSB0aGlz
IG9wdGlvbgotICAgICAgICAgaWYgeW91IHdhbnQgdG8gc3VwcG9ydAotICAgICAgICAgSERDUCBh
dXRoZW50aWNhdGlvbgorCWJvb2wgIkVuYWJsZSBIRENQIHN1cHBvcnQgaW4gREMiCisJZGVwZW5k
cyBvbiBEUk1fQU1EX0RDCisJaGVscAorCSBDaG9vc2UgdGhpcyBvcHRpb24KKwkgaWYgeW91IHdh
bnQgdG8gc3VwcG9ydAorCSBIRENQIGF1dGhlbnRpY2F0aW9uCiAKIGNvbmZpZyBERUJVR19LRVJO
RUxfREMKIAlib29sICJFbmFibGUga2dkYiBicmVhayBpbiBEQyIKLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
