Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E72D65FC
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 17:15:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C31589D44;
	Mon, 14 Oct 2019 15:15:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C38AA89D44
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 15:15:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3FFA28;
 Mon, 14 Oct 2019 08:15:45 -0700 (PDT)
Received: from e112269-lin.cambridge.arm.com (e112269-lin.cambridge.arm.com
 [10.1.194.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C2B143F68E;
 Mon, 14 Oct 2019 08:15:44 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH] drm/panfrost: Add missing GPU feature registers
Date: Mon, 14 Oct 2019 16:15:15 +0100
Message-Id: <20191014151515.13839-1-steven.price@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhyZWUgZmVhdHVyZSByZWdpc3RlcnMgd2VyZSBkZWNsYXJlZCBidXQgbmV2ZXIgYWN0dWFsbHkg
cmVhZCBmcm9tIHRoZQpHUFUuIEFkZCBUSFJFQURfTUFYX1RIUkVBRFMsIFRIUkVBRF9NQVhfV09S
S0dST1VQX1NJWkUgYW5kClRIUkVBRF9NQVhfQkFSUklFUl9TSVpFIHNvIHRoYXQgdGhlIGNvbXBs
ZXRlIHNldCBhcmUgYXZhaWxhYmxlLgoKRml4ZXM6IDRiY2VkOGJlYTA5NCAoImRybS9wYW5mcm9z
dDogRXhwb3J0IGFsbCBHUFUgZmVhdHVyZSByZWdpc3RlcnMiKQpTaWduZWQtb2ZmLWJ5OiBTdGV2
ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5m
cm9zdC9wYW5mcm9zdF9ncHUuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dwdS5j
IGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dwdS5jCmluZGV4IGY2N2VkOTI1
YzBlZi4uODgyMmVjMTNhMGQ2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3Qv
cGFuZnJvc3RfZ3B1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dw
dS5jCkBAIC0yMDgsNiArMjA4LDkgQEAgc3RhdGljIHZvaWQgcGFuZnJvc3RfZ3B1X2luaXRfZmVh
dHVyZXMoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCiAJcGZkZXYtPmZlYXR1cmVzLm1l
bV9mZWF0dXJlcyA9IGdwdV9yZWFkKHBmZGV2LCBHUFVfTUVNX0ZFQVRVUkVTKTsKIAlwZmRldi0+
ZmVhdHVyZXMubW11X2ZlYXR1cmVzID0gZ3B1X3JlYWQocGZkZXYsIEdQVV9NTVVfRkVBVFVSRVMp
OwogCXBmZGV2LT5mZWF0dXJlcy50aHJlYWRfZmVhdHVyZXMgPSBncHVfcmVhZChwZmRldiwgR1BV
X1RIUkVBRF9GRUFUVVJFUyk7CisJcGZkZXYtPmZlYXR1cmVzLm1heF90aHJlYWRzID0gZ3B1X3Jl
YWQocGZkZXYsIEdQVV9USFJFQURfTUFYX1RIUkVBRFMpOworCXBmZGV2LT5mZWF0dXJlcy50aHJl
YWRfbWF4X3dvcmtncm91cF9zeiA9IGdwdV9yZWFkKHBmZGV2LCBHUFVfVEhSRUFEX01BWF9XT1JL
R1JPVVBfU0laRSk7CisJcGZkZXYtPmZlYXR1cmVzLnRocmVhZF9tYXhfYmFycmllcl9zeiA9IGdw
dV9yZWFkKHBmZGV2LCBHUFVfVEhSRUFEX01BWF9CQVJSSUVSX1NJWkUpOwogCXBmZGV2LT5mZWF0
dXJlcy5jb2hlcmVuY3lfZmVhdHVyZXMgPSBncHVfcmVhZChwZmRldiwgR1BVX0NPSEVSRU5DWV9G
RUFUVVJFUyk7CiAJZm9yIChpID0gMDsgaSA8IDQ7IGkrKykKIAkJcGZkZXYtPmZlYXR1cmVzLnRl
eHR1cmVfZmVhdHVyZXNbaV0gPSBncHVfcmVhZChwZmRldiwgR1BVX1RFWFRVUkVfRkVBVFVSRVMo
aSkpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
