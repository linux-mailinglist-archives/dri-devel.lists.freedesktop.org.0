Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2B1FF901
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:44:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4736E2D5;
	Sun, 17 Nov 2019 11:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C4716E512;
 Fri, 15 Nov 2019 12:05:50 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id D9FAF86D67F04411A9C3;
 Fri, 15 Nov 2019 20:05:46 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Fri, 15 Nov 2019
 20:05:36 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/6]  drm/radeon: remove some set but not used variables
Date: Fri, 15 Nov 2019 20:12:54 +0800
Message-ID: <1573819980-54523-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
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

emhlbmdiaW4gKDYpOgogIGRybS9yYWRlb246IHJlbW92ZSBzZXQgYnV0IG5vdCB1c2VkIHZhcmlh
YmxlICdzaXplJywncmVsb2NzX2NodW5rJwogIGRybS9yYWRlb246IHJlbW92ZSBzZXQgYnV0IG5v
dCB1c2VkIHZhcmlhYmxlICdiYWNrYmlhc19yZXNwb25zZV90aW1lJwogIGRybS9yYWRlb246IHJl
bW92ZSBzZXQgYnV0IG5vdCB1c2VkIHZhcmlhYmxlICdkaWdfY29ubmVjdG9yJwogIGRybS9yYWRl
b246IHJlbW92ZSBzZXQgYnV0IG5vdCB1c2VkIHZhcmlhYmxlICdyYWRlb25fY29ubmVjdG9yJwog
IGRybS9yYWRlb246IHJlbW92ZSBzZXQgYnV0IG5vdCB1c2VkIHZhcmlhYmxlICdibG9ja3MnCiAg
ZHJtL3JhZGVvbjogcmVtb3ZlIHNldCBidXQgbm90IHVzZWQgdmFyaWFibGUgJ3R2X3BsbF9jbnRs
MScKCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2F0b21iaW9zX2RwLmMgICAgICB8IDMgLS0tCiBk
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3I2MDBfY3MuYyAgICAgICAgICB8IDggKystLS0tLS0KIGRy
aXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2NvbWJpb3MuYyAgIHwgMyArLS0KIGRyaXZlcnMv
Z3B1L2RybS9yYWRlb24vcmFkZW9uX2Rpc3BsYXkuYyAgIHwgMiAtLQogZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb25fbGVnYWN5X3R2LmMgfCA4ICstLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3NpX2RwbS5jICAgICAgICAgICB8IDMgKy0tCiA2IGZpbGVzIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCgotLQoyLjcuNAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
