Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AF09DEBF
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 09:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E1E897F5;
	Tue, 27 Aug 2019 07:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 893E26E20C;
 Mon, 26 Aug 2019 08:58:26 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 28C44AA3DF56951A2E70;
 Mon, 26 Aug 2019 16:58:22 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Mon, 26 Aug 2019
 16:58:12 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <Jun.Lei@amd.com>, <Dmytro.Laktyushkin@amd.com>, <Bhawanpreet.Lakha@amd.com>, 
 <joshua.aberback@amd.com>, <Wenjing.Liu@amd.com>, <charlene.liu@amd.com>,
 <martin.leung@amd.com>
Subject: [PATCH -next] drm/amdgpu/display: fix build error without
 CONFIG_DRM_AMD_DC_DSC_SUPPORT
Date: Mon, 26 Aug 2019 16:57:07 +0800
Message-ID: <20190826085707.12504-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 27 Aug 2019 07:29:19 +0000
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
Cc: YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgQ09ORklHX0RSTV9BTURfRENfRFNDX1NVUFBPUlQgaXMgbm90IHNldCwgYnVpbGQgZmFpbHM6
Cgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3
c2VxLmM6IEluIGZ1bmN0aW9uIGRjbjIwX2h3X3NlcXVlbmNlcl9jb25zdHJ1Y3Q6CmRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYzoyMDk5
OjI4OgogZXJyb3I6IGRjbjIwX2RzY19wZ19jb250cm9sIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBp
biB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIGRjbjIwX2RwcF9wZ19jb250cm9sPwogIGRj
LT5od3NzLmRzY19wZ19jb250cm9sID0gZGNuMjBfZHNjX3BnX2NvbnRyb2w7CiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fgogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZGNuMjBfZHBwX3BnX2NvbnRyb2wKClVzZSBDT05GSUdfRFJNX0FNRF9EQ19EU0Nf
U1VQUE9SVCB0byBndWFyZCB0aGlzLgoKUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBo
dWF3ZWkuY29tPgpGaXhlczogOGEzMTgyMGIxMjE4ICgiZHJtL2FtZC9kaXNwbGF5OiBNYWtlIGlu
aXRfaHcgYW5kIGluaXRfcGlwZXMgZ2VuZXJpYyBmb3Igc2VhbWxlc3MgYm9vdCIpClNpZ25lZC1v
ZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYyB8IDQgKysrKwogMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMKaW5kZXggZTE0NmQxZC4uNTRkNjdmNiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2Vx
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2Vx
LmMKQEAgLTIwOTIsNyArMjA5MiwxMSBAQCB2b2lkIGRjbjIwX2h3X3NlcXVlbmNlcl9jb25zdHJ1
Y3Qoc3RydWN0IGRjICpkYykKIAlkYy0+aHdzcy5lbmFibGVfcG93ZXJfZ2F0aW5nX3BsYW5lID0g
ZGNuMjBfZW5hYmxlX3Bvd2VyX2dhdGluZ19wbGFuZTsKIAlkYy0+aHdzcy5kcHBfcGdfY29udHJv
bCA9IGRjbjIwX2RwcF9wZ19jb250cm9sOwogCWRjLT5od3NzLmh1YnBfcGdfY29udHJvbCA9IGRj
bjIwX2h1YnBfcGdfY29udHJvbDsKKyNpZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19EU0NfU1VQUE9S
VAogCWRjLT5od3NzLmRzY19wZ19jb250cm9sID0gZGNuMjBfZHNjX3BnX2NvbnRyb2w7CisjZWxz
ZQorCWRjLT5od3NzLmRzY19wZ19jb250cm9sID0gTlVMTDsKKyNlbmRpZgogCWRjLT5od3NzLmRp
c2FibGVfdmdhID0gZGNuMjBfZGlzYWJsZV92Z2E7CiAKIAlpZiAoSVNfRlBHQV9NQVhJTVVTX0RD
KGRjLT5jdHgtPmRjZV9lbnZpcm9ubWVudCkpIHsKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
