Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB77CFC13E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:09:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C0D6E34C;
	Thu, 14 Nov 2019 08:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97236E4CF;
 Thu, 14 Nov 2019 03:13:18 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id BE77FCEA41E3F5C906B3;
 Thu, 14 Nov 2019 11:13:13 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Thu, 14 Nov 2019
 11:13:04 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <Felix.Kuehling@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <David1.Zhou@amd.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/amdkfd: remove set but not used variable 'top_dev'
Date: Thu, 14 Nov 2019 11:20:25 +0800
Message-ID: <1573701625-120559-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 14 Nov 2019 08:07:50 +0000
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
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX2lvbW11LmM6IEluIGZ1bmN0aW9uIGtmZF9pb21tdV9kZXZp
Y2VfaW5pdDoKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2lvbW11LmM6NjU6MzA6IHdh
cm5pbmc6IHZhcmlhYmxlIHRvcF9kZXYgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNl
dC12YXJpYWJsZV0KClJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4K
Rml4ZXM6IDFhZTk5ZWFiMzRmOSAoImRybS9hbWRrZmQ6IEluaXRpYWxpemUgSFNBX0NBUF9BVFNf
UFJFU0VOVCBjYXBhYmlsaXR5IGluIHRvcG9sb2d5IGNvZGVzIikKU2lnbmVkLW9mZi1ieTogemhl
bmdiaW4gPHpoZW5nYmluMTNAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfaW9tbXUuYyB8IDMgLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfaW9tbXUuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9pb21tdS5jCmluZGV4IDE5M2UyODMuLjhkODcx
NTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9pb21tdS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9pb21tdS5jCkBAIC02Miw5ICs2Miw2
IEBAIGludCBrZmRfaW9tbXVfZGV2aWNlX2luaXQoc3RydWN0IGtmZF9kZXYgKmtmZCkKIAlzdHJ1
Y3QgYW1kX2lvbW11X2RldmljZV9pbmZvIGlvbW11X2luZm87CiAJdW5zaWduZWQgaW50IHBhc2lk
X2xpbWl0OwogCWludCBlcnI7Ci0Jc3RydWN0IGtmZF90b3BvbG9neV9kZXZpY2UgKnRvcF9kZXY7
Ci0KLQl0b3BfZGV2ID0ga2ZkX3RvcG9sb2d5X2RldmljZV9ieV9pZChrZmQtPmlkKTsKCiAJaWYg
KCFrZmQtPmRldmljZV9pbmZvLT5uZWVkc19pb21tdV9kZXZpY2UpCiAJCXJldHVybiAwOwotLQoy
LjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
