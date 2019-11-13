Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 898B2FC122
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E496E2B8;
	Thu, 14 Nov 2019 08:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7F3898EE;
 Wed, 13 Nov 2019 12:37:26 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id EC2AC50C19271275A005;
 Wed, 13 Nov 2019 20:37:20 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Wed, 13 Nov 2019
 20:37:11 +0800
From: yu kuai <yukuai3@huawei.com>
To: <alexander.deucher@amd.com>, <Felix.Kuehling@amd.com>,
 <christian.koenig@amd.com>, <David1.Zhou@amd.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <Rex.Zhu@amd.com>, <evan.quan@amd.com>
Subject: [PATCH 3/7] drm/amdgpu: remove set but not used variable 'count'
Date: Wed, 13 Nov 2019 20:44:30 +0800
Message-ID: <1573649074-72589-4-git-send-email-yukuai3@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573649074-72589-1-git-send-email-yukuai3@huawei.com>
References: <1573649074-72589-1-git-send-email-yukuai3@huawei.com>
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
Cc: yi.zhang@huawei.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, zhengbin13@huawei.com,
 dri-devel@lists.freedesktop.org, yukuai3@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jOiBJbiBmdW5jdGlvbgrigJhrZ2Qya2ZkX3Bv
c3RfcmVzZXTigJk6CmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYzo3NDU6
MTE6IHdhcm5pbmc6CnZhcmlhYmxlIOKAmGNvdW504oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51
c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgonY291bnQnIGlzIG5ldmVyIHVzZWQsIHNvIGNhbiBiZSBy
ZW1vdmVkLiBUaHVzICdhdG9taWNfZGVjX3JldHVybicKY2FuIGJlIHJlcGxhY2VkIGFzICdhdG9t
aWNfZGVjJwoKRml4ZXM6IGU0MjA1MWQyMTMzYiAoImRybS9hbWRrZmQ6IEltcGxlbWVudCBHUFUg
cmVzZXQgaGFuZGxlcnMgaW4gS0ZEIikKU2lnbmVkLW9mZi1ieTogeXUga3VhaSA8eXVrdWFpM0Bo
dWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYyB8
IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMKaW5kZXggNGZhODgzNC4uMjA5
YmZjOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYwpAQCAtNzQyLDcg
Kzc0Miw3IEBAIGludCBrZ2Qya2ZkX3ByZV9yZXNldChzdHJ1Y3Qga2ZkX2RldiAqa2ZkKQogCiBp
bnQga2dkMmtmZF9wb3N0X3Jlc2V0KHN0cnVjdCBrZmRfZGV2ICprZmQpCiB7Ci0JaW50IHJldCwg
Y291bnQ7CisJaW50IHJldDsKIAogCWlmICgha2ZkLT5pbml0X2NvbXBsZXRlKQogCQlyZXR1cm4g
MDsKQEAgLTc1MCw3ICs3NTAsNyBAQCBpbnQga2dkMmtmZF9wb3N0X3Jlc2V0KHN0cnVjdCBrZmRf
ZGV2ICprZmQpCiAJcmV0ID0ga2ZkX3Jlc3VtZShrZmQpOwogCWlmIChyZXQpCiAJCXJldHVybiBy
ZXQ7Ci0JY291bnQgPSBhdG9taWNfZGVjX3JldHVybigma2ZkX2xvY2tlZCk7CisJYXRvbWljX2Rl
Yygma2ZkX2xvY2tlZCk7CiAKIAlhdG9taWNfc2V0KCZrZmQtPnNyYW1fZWNjX2ZsYWcsIDApOwog
Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
