Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C811BF173
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 09:32:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B456EB5B;
	Thu, 30 Apr 2020 07:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C35166E445;
 Thu, 30 Apr 2020 02:19:59 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 891D946E08F4BC3E21C7;
 Thu, 30 Apr 2020 10:19:54 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Thu, 30 Apr 2020
 10:19:45 +0800
From: Zheng Bin <zhengbin13@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/amdgpu: remove set but not used variable
 'direct_poll' in vcn_v2_5.c
Date: Thu, 30 Apr 2020 10:26:53 +0800
Message-ID: <20200430022653.46365-4-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
In-Reply-To: <20200430022653.46365-1-zhengbin13@huawei.com>
References: <20200430022653.46365-1-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 30 Apr 2020 07:31:56 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzUuYzoxMTcwOjM5OiB3YXJuaW5nOiB2YXJpYWJsZSDi
gJhkaXJlY3RfcG9sbOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlh
YmxlXQoKSXQgaXMgaW50cm9kdWNlZCBieSBjb21taXQgN2RhYWViZmVhNWU1ICgiZHJtL2FtZGdw
dToKYWRkIFZDTjIuNSBzcmlvdiBzdGFydCBmb3IgQXJjdHJ1cyIpLCBidXQgbmV2ZXIgdXNlZCwK
c28gcmVtb3ZlIGl0LgoKUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29t
PgpTaWduZWQtb2ZmLWJ5OiBaaGVuZyBCaW4gPHpoZW5nYmluMTNAaHVhd2VpLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jIHwgMiAtLQogMSBmaWxlIGNoYW5n
ZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvdmNuX3YyXzUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml81LmMKaW5k
ZXggMzhjYTRhNzEyZjEyLi41YzFiOWVkNzY1MzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3Zjbl92Ml81LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
dmNuX3YyXzUuYwpAQCAtMTE2NywxNCArMTE2NywxMiBAQCBzdGF0aWMgaW50IHZjbl92Ml81X3Ny
aW92X3N0YXJ0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXVpbnQzMl90IHRhYmxlX3Np
emUgPSAwOwogCXN0cnVjdCBtbXNjaF92MV8wX2NtZF9kaXJlY3Rfd3JpdGUgZGlyZWN0X3d0ID0g
eyB7IDAgfSB9OwogCXN0cnVjdCBtbXNjaF92MV8wX2NtZF9kaXJlY3RfcmVhZF9tb2RpZnlfd3Jp
dGUgZGlyZWN0X3JkX21vZF93dCA9IHsgeyAwIH0gfTsKLQlzdHJ1Y3QgbW1zY2hfdjFfMF9jbWRf
ZGlyZWN0X3BvbGxpbmcgZGlyZWN0X3BvbGwgPSB7IHsgMCB9IH07CiAJc3RydWN0IG1tc2NoX3Yx
XzBfY21kX2VuZCBlbmQgPSB7IHsgMCB9IH07CiAJdWludDMyX3QgKmluaXRfdGFibGUgPSBhZGV2
LT52aXJ0Lm1tX3RhYmxlLmNwdV9hZGRyOwogCXN0cnVjdCBtbXNjaF92MV8xX2luaXRfaGVhZGVy
ICpoZWFkZXIgPSAoc3RydWN0IG1tc2NoX3YxXzFfaW5pdF9oZWFkZXIgKilpbml0X3RhYmxlOwoK
IAlkaXJlY3Rfd3QuY21kX2hlYWRlci5jb21tYW5kX3R5cGUgPSBNTVNDSF9DT01NQU5EX19ESVJF
Q1RfUkVHX1dSSVRFOwogCWRpcmVjdF9yZF9tb2Rfd3QuY21kX2hlYWRlci5jb21tYW5kX3R5cGUg
PSBNTVNDSF9DT01NQU5EX19ESVJFQ1RfUkVHX1JFQURfTU9ESUZZX1dSSVRFOwotCWRpcmVjdF9w
b2xsLmNtZF9oZWFkZXIuY29tbWFuZF90eXBlID0gTU1TQ0hfQ09NTUFORF9fRElSRUNUX1JFR19Q
T0xMSU5HOwogCWVuZC5jbWRfaGVhZGVyLmNvbW1hbmRfdHlwZSA9IE1NU0NIX0NPTU1BTkRfX0VO
RDsKCiAJaGVhZGVyLT52ZXJzaW9uID0gTU1TQ0hfVkVSU0lPTjsKLS0KMi4yNi4wLjEwNi5nOWZh
ZGVkZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
