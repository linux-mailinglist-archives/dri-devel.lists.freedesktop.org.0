Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A4F61B0F
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:12:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C39689AD2;
	Mon,  8 Jul 2019 07:12:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B424F6E486
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 11:25:24 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 1E009F0A5E052BED9DA3;
 Fri,  5 Jul 2019 19:25:20 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.439.0; Fri, 5 Jul 2019 19:25:13 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <lucas.demarchi@intel.com>, <ville.syrjala@linux.intel.com>,
 <imre.deak@intel.com>, <jose.souza@intel.com>
Subject: [PATCH -next] drm/i915: Remove set but not used variable
 'intel_dig_port'
Date: Fri, 5 Jul 2019 11:31:38 +0000
Message-ID: <20190705113138.65880-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 08 Jul 2019 07:11:53 +0000
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
Cc: kernel-janitors@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYzogSW4gZnVuY3Rpb24gJ2ludGVsX2RkaV9n
ZXRfY29uZmlnJzoKZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYzozNzc0
OjI5OiB3YXJuaW5nOgogdmFyaWFibGUgJ2ludGVsX2RpZ19wb3J0JyBzZXQgYnV0IG5vdCB1c2Vk
IFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQogIHN0cnVjdCBpbnRlbF9kaWdpdGFsX3BvcnQg
KmludGVsX2RpZ19wb3J0OwoKSXQgaXMgbmV2ZXIgdXNlZCwgc28gY2FuIGJlIHJlbW92ZWQuCgpT
aWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYyB8IDIgLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZGRpLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rk
aS5jCmluZGV4IGE0MTcyNTk1YzhkOC4uMzBlNDg2MDlkYjFkIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMKQEAgLTM3NzEsNyArMzc3MSw2IEBAIHZvaWQgaW50ZWxf
ZGRpX2dldF9jb25maWcoc3RydWN0IGludGVsX2VuY29kZXIgKmVuY29kZXIsCiAJc3RydWN0IGRy
bV9pOTE1X3ByaXZhdGUgKmRldl9wcml2ID0gdG9faTkxNShlbmNvZGVyLT5iYXNlLmRldik7CiAJ
c3RydWN0IGludGVsX2NydGMgKmludGVsX2NydGMgPSB0b19pbnRlbF9jcnRjKHBpcGVfY29uZmln
LT5iYXNlLmNydGMpOwogCWVudW0gdHJhbnNjb2RlciBjcHVfdHJhbnNjb2RlciA9IHBpcGVfY29u
ZmlnLT5jcHVfdHJhbnNjb2RlcjsKLQlzdHJ1Y3QgaW50ZWxfZGlnaXRhbF9wb3J0ICppbnRlbF9k
aWdfcG9ydDsKIAl1MzIgdGVtcCwgZmxhZ3MgPSAwOwogCiAJLyogWFhYOiBEU0kgdHJhbnNjb2Rl
ciBwYXJhbm9pYSAqLwpAQCAtMzgxMCw3ICszODA5LDYgQEAgdm9pZCBpbnRlbF9kZGlfZ2V0X2Nv
bmZpZyhzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqZW5jb2RlciwKIAlzd2l0Y2ggKHRlbXAgJiBUUkFO
U19ERElfTU9ERV9TRUxFQ1RfTUFTSykgewogCWNhc2UgVFJBTlNfRERJX01PREVfU0VMRUNUX0hE
TUk6CiAJCXBpcGVfY29uZmlnLT5oYXNfaGRtaV9zaW5rID0gdHJ1ZTsKLQkJaW50ZWxfZGlnX3Bv
cnQgPSBlbmNfdG9fZGlnX3BvcnQoJmVuY29kZXItPmJhc2UpOwogCiAJCXBpcGVfY29uZmlnLT5p
bmZvZnJhbWVzLmVuYWJsZSB8PQogCQkJaW50ZWxfaGRtaV9pbmZvZnJhbWVzX2VuYWJsZWQoZW5j
b2RlciwgcGlwZV9jb25maWcpOwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
