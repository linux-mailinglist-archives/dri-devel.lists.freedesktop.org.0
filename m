Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AF0DCE67
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF316EBC1;
	Fri, 18 Oct 2019 18:39:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AADD6E448;
 Thu, 17 Oct 2019 06:13:23 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E60147DF292684E267BE;
 Thu, 17 Oct 2019 14:13:18 +0800 (CST)
Received: from RH5885H-V3.huawei.com (10.90.53.225) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.439.0; Thu, 17 Oct 2019 14:13:11 +0800
From: Chen Wandun <chenwandun@huawei.com>
To: <harry.wentland@amd.com>, <alexander.deucher@amd.com>,
 <sunpeng.li@amd.com>, <christian.koenig@amd.com>, <David1.Zhou@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/amdgpu/display: fix compile error
Date: Thu, 17 Oct 2019 14:19:32 +0800
Message-ID: <1571293172-116998-1-git-send-email-chenwandun@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 18 Oct 2019 18:37:46 +0000
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
Cc: chenwandun@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2hlbndhbmR1biA8Y2hlbndhbmR1bkBodWF3ZWkuY29tPgoKZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jOjE5MTM6NDg6
IGVycm9yOiBzdHJ1Y3QgZGNfY3J0Y190aW1pbmdfZmxhZ3MgaGFzIG5vIG1lbWJlciBuYW1lZCBE
U0MKICAgaWYgKHJlc19jdHgtPnBpcGVfY3R4W2ldLnN0cmVhbS0+dGltaW5nLmZsYWdzLkRTQykK
CQkJCQkJXgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjbjIwL2Rj
bjIwX3Jlc291cmNlLmM6MTkxNDo3MzogZXJyb3I6IHN0cnVjdCBkY19jcnRjX3RpbWluZyBoYXMg
bm8gbWVtYmVyIG5hbWVkIGRzY19jZmcKICAgcGlwZXNbcGlwZV9jbnRdLmRvdXQub3V0cHV0X2Jw
cCA9IHJlc19jdHgtPnBpcGVfY3R4W2ldLnN0cmVhbS0+dGltaW5nLmRzY19jZmcuYml0c19wZXJf
cGl4ZWwgLyAxNi4wOwoJCQkJCQkJCQleClNpZ25lZC1vZmYtYnk6IENoZW53YW5kdW4gPGNoZW53
YW5kdW5AaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MjAvZGNuMjBfcmVzb3VyY2UuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNu
MjBfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24y
MF9yZXNvdXJjZS5jCmluZGV4IDkxNGUzNzguLjRmMDMzMTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCkBAIC0xOTEw
LDggKzE5MTAsMTAgQEAgaW50IGRjbjIwX3BvcHVsYXRlX2RtbF9waXBlc19mcm9tX2NvbnRleHQo
CiAJCQlwaXBlc1twaXBlX2NudF0uZG91dC5vdXRwdXRfYnBwID0gb3V0cHV0X2JwYyAqIDM7CiAJ
CX0KIAorI2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0RTQ19TVVBQT1JUCiAJCWlmIChyZXNfY3R4
LT5waXBlX2N0eFtpXS5zdHJlYW0tPnRpbWluZy5mbGFncy5EU0MpCiAJCQlwaXBlc1twaXBlX2Nu
dF0uZG91dC5vdXRwdXRfYnBwID0gcmVzX2N0eC0+cGlwZV9jdHhbaV0uc3RyZWFtLT50aW1pbmcu
ZHNjX2NmZy5iaXRzX3Blcl9waXhlbCAvIDE2LjA7CisjZW5kaWYKIAogCQkvKiB0b2RvOiBkZWZh
dWx0IG1heCBmb3Igbm93LCB1bnRpbCB0aGVyZSBpcyBsb2dpYyByZWZsZWN0aW5nIHRoaXMgaW4g
ZGMqLwogCQlwaXBlc1twaXBlX2NudF0uZG91dC5vdXRwdXRfYnBjID0gMTI7Ci0tIAoyLjcuNAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
