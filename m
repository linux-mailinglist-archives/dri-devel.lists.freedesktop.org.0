Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2014C35ECF2
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 08:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DBF6E442;
	Wed, 14 Apr 2021 06:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
 [47.88.44.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876CE6E442
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 06:11:04 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R531e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0UVWVtYW_1618380657; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0UVWVtYW_1618380657) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 14 Apr 2021 14:11:01 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: linux-graphics-maintainer@vmware.com
Subject: [PATCH] drm/vmwgfx: remove unused variable
Date: Wed, 14 Apr 2021 14:10:51 +0800
Message-Id: <1618380651-112672-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, airlied@linux.ie,
 sroland@vmware.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHRoZSBmb2xsb3dpbmcgZ2NjIHdhcm5pbmc6Cgpkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Zt
d2dmeF9rbXMuYzo0NTY6MzE6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmHZjc+KAmSBzZXQKYnV0IG5v
dCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXS4KClJlcG9ydGVkLWJ5OiBBYmFjaSBS
b2JvdCA8YWJhY2lAbGludXguYWxpYmFiYS5jb20+ClNpZ25lZC1vZmYtYnk6IEppYXBlbmcgQ2hv
bmcgPGppYXBlbmcuY2hvbmdAbGludXguYWxpYmFiYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L3Ztd2dmeC92bXdnZnhfa21zLmMgfCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngv
dm13Z2Z4X2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfa21zLmMKaW5kZXgg
OWE4OWY2NS4uOTI5M2RjMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdn
Znhfa21zLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfa21zLmMKQEAgLTQ1
MywxMCArNDUzLDkgQEAgaW50IHZtd19kdV9wcmltYXJ5X3BsYW5lX2F0b21pY19jaGVjayhzdHJ1
Y3QgZHJtX3BsYW5lICpwbGFuZSwKIAogCWlmICghcmV0ICYmIG5ld19mYikgewogCQlzdHJ1Y3Qg
ZHJtX2NydGMgKmNydGMgPSBzdGF0ZS0+Y3J0YzsKLQkJc3RydWN0IHZtd19jb25uZWN0b3Jfc3Rh
dGUgKnZjczsKIAkJc3RydWN0IHZtd19kaXNwbGF5X3VuaXQgKmR1ID0gdm13X2NydGNfdG9fZHUo
Y3J0Yyk7CiAKLQkJdmNzID0gdm13X2Nvbm5lY3Rvcl9zdGF0ZV90b192Y3MoZHUtPmNvbm5lY3Rv
ci5zdGF0ZSk7CisJCXZtd19jb25uZWN0b3Jfc3RhdGVfdG9fdmNzKGR1LT5jb25uZWN0b3Iuc3Rh
dGUpOwogCX0KIAogCi0tIAoxLjguMy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
