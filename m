Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 034C4357DD4
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 10:11:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECEF86EA1D;
	Thu,  8 Apr 2021 08:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-44.freemail.mail.aliyun.com
 (out30-44.freemail.mail.aliyun.com [115.124.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D906EA1D
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 08:11:36 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R391e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0UUsktmf_1617869484; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0UUsktmf_1617869484) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 08 Apr 2021 16:11:33 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: linux-graphics-maintainer@vmware.com
Subject: [PATCH] drm/vmwgfx: Remove useless variable
Date: Thu,  8 Apr 2021 16:11:22 +0800
Message-Id: <1617869482-49962-1-git-send-email-jiapeng.chong@linux.alibaba.com>
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
d2dmeF9jbWRidWZfcmVzLmM6MTYzOjY6IHdhcm5pbmc6IHZhcmlhYmxlCuKAmHJldOKAmSBzZXQg
YnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXS4KClJlcG9ydGVkLWJ5OiBB
YmFjaSBSb2JvdCA8YWJhY2lAbGludXguYWxpYmFiYS5jb20+ClNpZ25lZC1vZmYtYnk6IEppYXBl
bmcgQ2hvbmcgPGppYXBlbmcuY2hvbmdAbGludXguYWxpYmFiYS5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL3Ztd2dmeC92bXdnZnhfY21kYnVmX3Jlcy5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdm13Z2Z4L3Ztd2dmeF9jbWRidWZfcmVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4
L3Ztd2dmeF9jbWRidWZfcmVzLmMKaW5kZXggNDRkODU4Yy4uMGQyMTBmOCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfY21kYnVmX3Jlcy5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS92bXdnZngvdm13Z2Z4X2NtZGJ1Zl9yZXMuYwpAQCAtMTYwLDcgKzE2MCw2IEBAIHZv
aWQgdm13X2NtZGJ1Zl9yZXNfY29tbWl0KHN0cnVjdCBsaXN0X2hlYWQgKmxpc3QpCiB2b2lkIHZt
d19jbWRidWZfcmVzX3JldmVydChzdHJ1Y3QgbGlzdF9oZWFkICpsaXN0KQogewogCXN0cnVjdCB2
bXdfY21kYnVmX3JlcyAqZW50cnksICpuZXh0OwotCWludCByZXQ7CiAKIAlsaXN0X2Zvcl9lYWNo
X2VudHJ5X3NhZmUoZW50cnksIG5leHQsIGxpc3QsIGhlYWQpIHsKIAkJc3dpdGNoIChlbnRyeS0+
c3RhdGUpIHsKQEAgLTE2OCw3ICsxNjcsNyBAQCB2b2lkIHZtd19jbWRidWZfcmVzX3JldmVydChz
dHJ1Y3QgbGlzdF9oZWFkICpsaXN0KQogCQkJdm13X2NtZGJ1Zl9yZXNfZnJlZShlbnRyeS0+bWFu
LCBlbnRyeSk7CiAJCQlicmVhazsKIAkJY2FzZSBWTVdfQ01EQlVGX1JFU19ERUw6Ci0JCQlyZXQg
PSBkcm1faHRfaW5zZXJ0X2l0ZW0oJmVudHJ5LT5tYW4tPnJlc291cmNlcywKKwkJCWRybV9odF9p
bnNlcnRfaXRlbSgmZW50cnktPm1hbi0+cmVzb3VyY2VzLAogCQkJCQkJICZlbnRyeS0+aGFzaCk7
CiAJCQlsaXN0X2RlbCgmZW50cnktPmhlYWQpOwogCQkJbGlzdF9hZGRfdGFpbCgmZW50cnktPmhl
YWQsICZlbnRyeS0+bWFuLT5saXN0KTsKLS0gCjEuOC4zLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
