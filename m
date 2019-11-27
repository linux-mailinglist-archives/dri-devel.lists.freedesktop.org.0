Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB0610C4F4
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 09:23:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1166E60C;
	Thu, 28 Nov 2019 08:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91DB6E4F4;
 Wed, 27 Nov 2019 09:26:32 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 6914290590D71F0B58B1;
 Wed, 27 Nov 2019 17:26:31 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Wed, 27 Nov 2019
 17:26:20 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <rex.zhu@amd.com>, <evan.quan@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/5] drm/amd/powerplay: Remove unneeded variable 'result' in
 vega12_hwmgr.c
Date: Wed, 27 Nov 2019 17:33:41 +0800
Message-ID: <1574847222-51515-5-git-send-email-zhengbin13@huawei.com>
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
aHdtZ3IvdmVnYTEyX2h3bWdyLmM6NTAyOjUtMTE6IFVubmVlZGVkIHZhcmlhYmxlOiAicmVzdWx0
Ii4gUmV0dXJuICIwIiBvbiBsaW5lIDUxNQoKUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtj
aUBodWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiB6aGVuZ2JpbiA8emhlbmdiaW4xM0BodWF3ZWku
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMl9od21n
ci5jIHwgNCArLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVn
YTEyX2h3bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTJf
aHdtZ3IuYwppbmRleCA3YWY5YWQ0Li5hY2E2MWQxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTJfaHdtZ3IuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTJfaHdtZ3IuYwpAQCAtNDk5LDggKzQ5OSw2IEBA
IHN0YXRpYyBpbnQgdmVnYTEyX2dldF9udW1iZXJfb2ZfZHBtX2xldmVsKHN0cnVjdCBwcF9od21n
ciAqaHdtZ3IsCiBzdGF0aWMgaW50IHZlZ2ExMl9nZXRfZHBtX2ZyZXF1ZW5jeV9ieV9pbmRleChz
dHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLAogCQlQUENMS19lIGNsa0lELCB1aW50MzJfdCBpbmRleCwg
dWludDMyX3QgKmNsb2NrKQogewotCWludCByZXN1bHQgPSAwOwotCiAJLyoKIAkgKlNNVSBleHBl
Y3RzIHRoZSBDbG9jayBJRCB0byBiZSBpbiB0aGUgdG9wIDE2IGJpdHMuCiAJICpMb3dlciAxNiBi
aXRzIHNwZWNpZnkgdGhlIGxldmVsCkBAIC01MTIsNyArNTEwLDcgQEAgc3RhdGljIGludCB2ZWdh
MTJfZ2V0X2RwbV9mcmVxdWVuY3lfYnlfaW5kZXgoc3RydWN0IHBwX2h3bWdyICpod21nciwKCiAJ
KmNsb2NrID0gc211bV9nZXRfYXJndW1lbnQoaHdtZ3IpOwoKLQlyZXR1cm4gcmVzdWx0OworCXJl
dHVybiAwOwogfQoKIHN0YXRpYyBpbnQgdmVnYTEyX3NldHVwX3NpbmdsZV9kcG1fdGFibGUoc3Ry
dWN0IHBwX2h3bWdyICpod21nciwKLS0KMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
