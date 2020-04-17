Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF611AEB31
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 11:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D091D6E3F0;
	Sat, 18 Apr 2020 09:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0CA6E31A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 10:14:18 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id DD42584B1FB252337D38;
 Fri, 17 Apr 2020 18:14:16 +0800 (CST)
Received: from localhost (10.166.215.154) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Fri, 17 Apr 2020
 18:14:09 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <thierry.reding@gmail.com>, <sam@ravnborg.org>, <airlied@linux.ie>,
 <daniel@ffwll.ch>
Subject: [PATCH -next] drm/panel: remove set but not used variable 'config'
Date: Fri, 17 Apr 2020 18:14:01 +0800
Message-ID: <20200417101401.19388-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.166.215.154]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 18 Apr 2020 09:26:15 +0000
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
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXRydWx5LW50MzU1OTcuYzo0OTM6MzE6IHdhcm5p
bmc6IHZhcmlhYmxlIOKAmGNvbmZpZ+KAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQt
c2V0LXZhcmlhYmxlXQogIGNvbnN0IHN0cnVjdCBudDM1NTk3X2NvbmZpZyAqY29uZmlnOwogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+CgpTaWduZWQtb2ZmLWJ5OiBZdWVIYWli
aW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3Bh
bmVsLXRydWx5LW50MzU1OTcuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC10cnVseS1udDM1NTk3
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdHJ1bHktbnQzNTU5Ny5jCmluZGV4IDAx
MmNhNjJiZjMwZS4uZjBhZDYwODE1NzBmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvcGFuZWwtdHJ1bHktbnQzNTU5Ny5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC10cnVseS1udDM1NTk3LmMKQEAgLTQ5MCw5ICs0OTAsNyBAQCBzdGF0aWMgaW50IHRydWx5X250
MzU1OTdfcGFuZWxfYWRkKHN0cnVjdCB0cnVseV9udDM1NTk3ICpjdHgpCiB7CiAJc3RydWN0IGRl
dmljZSAqZGV2ID0gY3R4LT5kZXY7CiAJaW50IHJldCwgaTsKLQljb25zdCBzdHJ1Y3QgbnQzNTU5
N19jb25maWcgKmNvbmZpZzsKIAotCWNvbmZpZyA9IGN0eC0+Y29uZmlnOwogCWZvciAoaSA9IDA7
IGkgPCBBUlJBWV9TSVpFKGN0eC0+c3VwcGxpZXMpOyBpKyspCiAJCWN0eC0+c3VwcGxpZXNbaV0u
c3VwcGx5ID0gcmVndWxhdG9yX25hbWVzW2ldOwogCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
