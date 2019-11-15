Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49721FF90B
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:45:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5755C6E2CF;
	Sun, 17 Nov 2019 11:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB166E512;
 Fri, 15 Nov 2019 12:05:52 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id DEE585C174A393457A08;
 Fri, 15 Nov 2019 20:05:46 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Fri, 15 Nov 2019
 20:05:38 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 5/6] drm/radeon: remove set but not used variable 'blocks'
Date: Fri, 15 Nov 2019 20:12:59 +0800
Message-ID: <1573819980-54523-6-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573819980-54523-1-git-send-email-zhengbin13@huawei.com>
References: <1573819980-54523-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sun, 17 Nov 2019 11:44:18 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9yYWRlb25fY29tYmlvcy5jOiBJbiBmdW5jdGlvbiByYWRlb25fY29tYmlv
c19nZXRfcG93ZXJfbW9kZXM6CmRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2NvbWJpb3Mu
YzoyNjM4OjEwOiB3YXJuaW5nOiB2YXJpYWJsZSBibG9ja3Mgc2V0IGJ1dCBub3QgdXNlZCBbLVd1
bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KCkl0IGlzIGludHJvZHVjZWQgYnkgY29tbWl0IDU2Mjc4
YThlZGFjZSAoImRybS9yYWRlb24va21zOgpwdWxsIHBvd2VyIG1vZGUgaW5mbyBmcm9tIGJpb3Mg
dGFibGVzICh2MykiKSwgYnV0IG5ldmVyIHVzZWQsCnNvIHJlbW92ZSBpdC4KClJlcG9ydGVkLWJ5
OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KU2lnbmVkLW9mZi1ieTogemhlbmdiaW4g
PHpoZW5nYmluMTNAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl9jb21iaW9zLmMgfCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Nv
bWJpb3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2NvbWJpb3MuYwppbmRleCBj
MThhZTE1Li44Nzc5NDEyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl9jb21iaW9zLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fY29tYmlvcy5j
CkBAIC0yNjM4LDcgKzI2MzgsNyBAQCB2b2lkIHJhZGVvbl9jb21iaW9zX2dldF9wb3dlcl9tb2Rl
cyhzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldikKIHsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
ID0gcmRldi0+ZGRldjsKIAl1MTYgb2Zmc2V0LCBtaXNjLCBtaXNjMiA9IDA7Ci0JdTggcmV2LCBi
bG9ja3MsIHRtcDsKKwl1OCByZXYsIHRtcDsKIAlpbnQgc3RhdGVfaW5kZXggPSAwOwogCXN0cnVj
dCByYWRlb25faTJjX2J1c19yZWMgaTJjX2J1czsKCkBAIC0yNzMxLDcgKzI3MzEsNiBAQCB2b2lk
IHJhZGVvbl9jb21iaW9zX2dldF9wb3dlcl9tb2RlcyhzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRl
dikKIAkJb2Zmc2V0ID0gY29tYmlvc19nZXRfdGFibGVfb2Zmc2V0KGRldiwgQ09NQklPU19QT1dF
UlBMQVlfSU5GT19UQUJMRSk7CiAJCWlmIChvZmZzZXQpIHsKIAkJCXJldiA9IFJCSU9TOChvZmZz
ZXQpOwotCQkJYmxvY2tzID0gUkJJT1M4KG9mZnNldCArIDB4Mik7CiAJCQkvKiBwb3dlciBtb2Rl
IDAgdGVuZHMgdG8gYmUgdGhlIG9ubHkgdmFsaWQgb25lICovCiAJCQlyZGV2LT5wbS5wb3dlcl9z
dGF0ZVtzdGF0ZV9pbmRleF0ubnVtX2Nsb2NrX21vZGVzID0gMTsKIAkJCXJkZXYtPnBtLnBvd2Vy
X3N0YXRlW3N0YXRlX2luZGV4XS5jbG9ja19pbmZvWzBdLm1jbGsgPSBSQklPUzMyKG9mZnNldCAr
IDB4NSArIDB4Mik7Ci0tCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
