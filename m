Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC103566B6
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 10:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C10F89B3C;
	Wed,  7 Apr 2021 08:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7CF89B3C;
 Wed,  7 Apr 2021 08:23:54 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FFcn01nJPz7tPj;
 Wed,  7 Apr 2021 16:21:40 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.179.202) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Wed, 7 Apr 2021 16:23:42 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm
 <linux-arm-msm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/1] drm/msm/dp: remove unused local variable 'hpd'
Date: Wed, 7 Apr 2021 16:23:15 +0800
Message-ID: <20210407082315.2703-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.179.202]
X-CFilter-Loop: Reflected
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmc6Cgpkcml2ZXJzL2dw
dS9kcm0vbXNtL2RwL2RwX2Rpc3BsYXkuYzogSW4gZnVuY3Rpb24g4oCYZHBfZGlzcGxheV91c2Jw
ZF9hdHRlbnRpb25fY2LigJk6CmRyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfZGlzcGxheS5jOjQ5
NjoxOTogd2FybmluZzogdmFyaWFibGUg4oCYaHBk4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51
c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpGaXhlczogYzU4ZWIxYjU0ZmVlICgiZHJtL21zbS9kcDog
Zml4IGNvbm5lY3QvZGlzY29ubmVjdCBoYW5kbGVkIGF0IGlycV9ocGQiKQpSZXBvcnRlZC1ieTog
SHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IFpoZW4gTGVpIDx0
aHVuZGVyLmxlaXpoZW5AaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2Rw
X2Rpc3BsYXkuYyB8IDMgLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1
L2RybS9tc20vZHAvZHBfZGlzcGxheS5jCmluZGV4IDVhMzlkYTZlMWVhZjI3Ny4uMzFiZjJhNDBh
OWViMmM5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2Rpc3BsYXkuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2Rpc3BsYXkuYwpAQCAtNDkzLDcgKzQ5Myw2
IEBAIHN0YXRpYyBpbnQgZHBfZGlzcGxheV91c2JwZF9hdHRlbnRpb25fY2Ioc3RydWN0IGRldmlj
ZSAqZGV2KQogCWludCByYyA9IDA7CiAJdTMyIHNpbmtfcmVxdWVzdDsKIAlzdHJ1Y3QgZHBfZGlz
cGxheV9wcml2YXRlICpkcDsKLQlzdHJ1Y3QgZHBfdXNicGQgKmhwZDsKIAogCWlmICghZGV2KSB7
CiAJCURSTV9FUlJPUigiaW52YWxpZCBkZXZcbiIpOwpAQCAtNTA3LDggKzUwNiw2IEBAIHN0YXRp
YyBpbnQgZHBfZGlzcGxheV91c2JwZF9hdHRlbnRpb25fY2Ioc3RydWN0IGRldmljZSAqZGV2KQog
CQlyZXR1cm4gLUVOT0RFVjsKIAl9CiAKLQlocGQgPSBkcC0+dXNicGQ7Ci0KIAkvKiBjaGVjayBm
b3IgYW55IHRlc3QgcmVxdWVzdCBpc3N1ZWQgYnkgc2luayAqLwogCXJjID0gZHBfbGlua19wcm9j
ZXNzX3JlcXVlc3QoZHAtPmxpbmspOwogCWlmICghcmMpIHsKLS0gCjEuOC4zCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
