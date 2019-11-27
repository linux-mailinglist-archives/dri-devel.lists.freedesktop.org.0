Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD19010C4ED
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 09:22:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B77586E5F6;
	Thu, 28 Nov 2019 08:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7146E4F4;
 Wed, 27 Nov 2019 09:26:31 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id A431735BFFAD60BF6799;
 Wed, 27 Nov 2019 17:26:26 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Wed, 27 Nov 2019
 17:26:19 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <rex.zhu@amd.com>, <evan.quan@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/5] drm/amd/powerplay: Remove unneeded variable 'result' in
 smu10_hwmgr.c
Date: Wed, 27 Nov 2019 17:33:38 +0800
Message-ID: <1574847222-51515-2-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574847222-51515-1-git-send-email-zhengbin13@huawei.com>
References: <1574847222-51515-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 28 Nov 2019 08:22:47 +0000
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

Rml4ZXMgY29jY2ljaGVjayB3YXJuaW5nOgoKZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
aHdtZ3Ivc211MTBfaHdtZ3IuYzoxMTU0OjUtMTE6IFVubmVlZGVkIHZhcmlhYmxlOiAicmVzdWx0
Ii4gUmV0dXJuICIwIiBvbiBsaW5lIDExNTkKClJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxr
Y2lAaHVhd2VpLmNvbT4KU2lnbmVkLW9mZi1ieTogemhlbmdiaW4gPHpoZW5nYmluMTNAaHVhd2Vp
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9zbXUxMF9od21n
ci5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9zbXUx
MF9od21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Ivc211MTBfaHdt
Z3IuYwppbmRleCAxMTE1NzYxLi40ZThhYjEzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9od21nci9zbXUxMF9od21nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2h3bWdyL3NtdTEwX2h3bWdyLmMKQEAgLTExNTEsMTIgKzExNTEsMTEgQEAg
c3RhdGljIGludCBzbXUxMF9zZXRfd2F0ZXJtYXJrc19mb3JfY2xvY2tzX3JhbmdlcyhzdHJ1Y3Qg
cHBfaHdtZ3IgKmh3bWdyLAogCXN0cnVjdCBzbXUxMF9od21nciAqZGF0YSA9IGh3bWdyLT5iYWNr
ZW5kOwogCXN0cnVjdCBkbV9wcF93bV9zZXRzX3dpdGhfY2xvY2tfcmFuZ2VzX3NvYzE1ICp3bV93
aXRoX2Nsb2NrX3JhbmdlcyA9IGNsb2NrX3JhbmdlczsKIAlXYXRlcm1hcmtzX3QgKnRhYmxlID0g
JihkYXRhLT53YXRlcl9tYXJrc190YWJsZSk7Ci0JaW50IHJlc3VsdCA9IDA7CgogCXNtdV9zZXRf
d2F0ZXJtYXJrc19mb3JfY2xvY2tzX3Jhbmdlcyh0YWJsZSx3bV93aXRoX2Nsb2NrX3Jhbmdlcyk7
CiAJc211bV9zbWNfdGFibGVfbWFuYWdlcihod21nciwgKHVpbnQ4X3QgKil0YWJsZSwgKHVpbnQx
Nl90KVNNVTEwX1dNVEFCTEUsIGZhbHNlKTsKIAlkYXRhLT53YXRlcl9tYXJrc19leGlzdCA9IHRy
dWU7Ci0JcmV0dXJuIHJlc3VsdDsKKwlyZXR1cm4gMDsKIH0KCiBzdGF0aWMgaW50IHNtdTEwX3Nt
dXNfbm90aWZ5X3B3ZShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQotLQoyLjcuNAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
