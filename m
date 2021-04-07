Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC8A35673A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 10:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA0F6E17E;
	Wed,  7 Apr 2021 08:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E816E17E;
 Wed,  7 Apr 2021 08:53:13 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FFdQn4KwKz19L60;
 Wed,  7 Apr 2021 16:50:57 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.179.202) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Wed, 7 Apr 2021 16:52:58 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm
 <linux-arm-msm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/1] drm/msm/dpu: remove unused local variable 'cmd_enc'
Date: Wed, 7 Apr 2021 16:33:34 +0800
Message-ID: <20210407083334.2762-1-thunder.leizhen@huawei.com>
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
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Zhen Lei <thunder.leizhen@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmc6Cgpkcml2ZXJzL2dw
dS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlcl9waHlzX2NtZC5jOiBJbiBmdW5jdGlvbiDi
gJhkcHVfZW5jb2Rlcl9waHlzX2NtZF93YWl0X2Zvcl9jb21taXRfZG9uZeKAmToKZHJpdmVycy9n
cHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXJfcGh5c19jbWQuYzo2ODg6MzE6IHdhcm5p
bmc6IHZhcmlhYmxlIOKAmGNtZF9lbmPigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0
LXNldC12YXJpYWJsZV0KCkZpeGVzOiBmZTI4Njg5M2VkMzQgKCJkcm0vbXNtL2RwdTogUmVtb3Zl
IHVudXNlZCBjYWxsIGluIHdhaXRfZm9yX2NvbW1pdF9kb25lIikKUmVwb3J0ZWQtYnk6IEh1bGsg
Um9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiBaaGVuIExlaSA8dGh1bmRl
ci5sZWl6aGVuQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEv
ZHB1X2VuY29kZXJfcGh5c19jbWQuYyB8IDQgLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2Vu
Y29kZXJfcGh5c19jbWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNv
ZGVyX3BoeXNfY21kLmMKaW5kZXggYjJiZTM5YjkxNDRlNDQ5Li4wODg5MDA4NDFiZjhiYWEgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyX3BoeXNf
Y21kLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXJfcGh5
c19jbWQuYwpAQCAtNjg1LDEwICs2ODUsNiBAQCBzdGF0aWMgaW50IGRwdV9lbmNvZGVyX3BoeXNf
Y21kX3dhaXRfZm9yX3R4X2NvbXBsZXRlKAogc3RhdGljIGludCBkcHVfZW5jb2Rlcl9waHlzX2Nt
ZF93YWl0X2Zvcl9jb21taXRfZG9uZSgKIAkJc3RydWN0IGRwdV9lbmNvZGVyX3BoeXMgKnBoeXNf
ZW5jKQogewotCXN0cnVjdCBkcHVfZW5jb2Rlcl9waHlzX2NtZCAqY21kX2VuYzsKLQotCWNtZF9l
bmMgPSB0b19kcHVfZW5jb2Rlcl9waHlzX2NtZChwaHlzX2VuYyk7Ci0KIAkvKiBvbmx5IHJlcXVp
cmVkIGZvciBtYXN0ZXIgY29udHJvbGxlciAqLwogCWlmICghZHB1X2VuY29kZXJfcGh5c19jbWRf
aXNfbWFzdGVyKHBoeXNfZW5jKSkKIAkJcmV0dXJuIDA7Ci0tIAoxLjguMwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
