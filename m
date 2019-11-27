Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA0110C4F7
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 09:23:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74606E605;
	Thu, 28 Nov 2019 08:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18446E4F4;
 Wed, 27 Nov 2019 09:26:30 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 9361E868284E57F746E2;
 Wed, 27 Nov 2019 17:26:26 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Wed, 27 Nov 2019
 17:26:20 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <rex.zhu@amd.com>, <evan.quan@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/5] drm/amd/powerplay: Remove unneeded variable 'result' in
 vega10_hwmgr.c
Date: Wed, 27 Nov 2019 17:33:39 +0800
Message-ID: <1574847222-51515-3-git-send-email-zhengbin13@huawei.com>
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
aHdtZ3IvdmVnYTEwX2h3bWdyLmM6NDM2Mzo1LTExOiBVbm5lZWRlZCB2YXJpYWJsZTogInJlc3Vs
dCIuIFJldHVybiAiMCIgb24gbGluZSA0MzcwCgpSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVs
a2NpQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IHpoZW5nYmluIDx6aGVuZ2JpbjEzQGh1YXdl
aS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX2h3
bWdyLmMgfCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3Zl
Z2ExMF9od21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEw
X2h3bWdyLmMKaW5kZXggYjI5ZTk5Ni4uNDY4NTE5MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdyLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdyLmMKQEAgLTQzNjAsMTQgKzQzNjAs
MTMgQEAgc3RhdGljIGludCB2ZWdhMTBfc2V0X3dhdGVybWFya3NfZm9yX2Nsb2Nrc19yYW5nZXMo
c3RydWN0IHBwX2h3bWdyICpod21nciwKIAlzdHJ1Y3QgdmVnYTEwX2h3bWdyICpkYXRhID0gaHdt
Z3ItPmJhY2tlbmQ7CiAJc3RydWN0IGRtX3BwX3dtX3NldHNfd2l0aF9jbG9ja19yYW5nZXNfc29j
MTUgKndtX3dpdGhfY2xvY2tfcmFuZ2VzID0gY2xvY2tfcmFuZ2U7CiAJV2F0ZXJtYXJrc190ICp0
YWJsZSA9ICYoZGF0YS0+c21jX3N0YXRlX3RhYmxlLndhdGVyX21hcmtzX3RhYmxlKTsKLQlpbnQg
cmVzdWx0ID0gMDsKCiAJaWYgKCFkYXRhLT5yZWdpc3RyeV9kYXRhLmRpc2FibGVfd2F0ZXJfbWFy
aykgewogCQlzbXVfc2V0X3dhdGVybWFya3NfZm9yX2Nsb2Nrc19yYW5nZXModGFibGUsIHdtX3dp
dGhfY2xvY2tfcmFuZ2VzKTsKIAkJZGF0YS0+d2F0ZXJfbWFya3NfYml0bWFwID0gV2F0ZXJNYXJr
c0V4aXN0OwogCX0KCi0JcmV0dXJuIHJlc3VsdDsKKwlyZXR1cm4gMDsKIH0KCiBzdGF0aWMgaW50
IHZlZ2ExMF9nZXRfcHBmZWF0dXJlX3N0YXR1cyhzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLCBjaGFy
ICpidWYpCi0tCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
