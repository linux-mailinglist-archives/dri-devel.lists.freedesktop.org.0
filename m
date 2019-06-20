Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 770634E12F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 09:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049266E842;
	Fri, 21 Jun 2019 07:23:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21B96E588
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 14:56:07 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 2FB6ACB9187806D6D00C;
 Thu, 20 Jun 2019 22:56:02 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.439.0; Thu, 20 Jun 2019 22:55:53 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>,
	Vincent Abriou <vincent.abriou@st.com>,
	David Airlie <airlied@linux.ie>,
	=?UTF-8?q?Sam=20Ravnborg=20=EF=BC=8C=20Daniel=20Vetter?= <"sam@ravnborg.orgdaniel"@ffwll.ch>
Subject: [PATCH -next] drm/sti: Remove duplicated include from sti_drv.c
Date: Thu, 20 Jun 2019 15:03:06 +0000
Message-ID: <20190620150306.124839-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 21 Jun 2019 07:22:42 +0000
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
Cc: kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVtb3ZlIGR1cGxpY2F0ZWQgaW5jbHVkZS4KClNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1
ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9kcnYuYyB8
IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vc3RpL3N0aV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2Rydi5jCmlu
ZGV4IGJiNmFlNmRkNjZjOS4uMmVkZDY2NmZiNDRhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vc3RpL3N0aV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9kcnYuYwpAQCAt
MjMsNyArMjMsNiBAQAogCiAjaW5jbHVkZSAic3RpX2NydGMuaCIKICNpbmNsdWRlICJzdGlfZHJ2
LmgiCi0jaW5jbHVkZSAic3RpX2Rydi5oIgogI2luY2x1ZGUgInN0aV9wbGFuZS5oIgogCiAjZGVm
aW5lIERSSVZFUl9OQU1FCSJzdGkiCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
