Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 789657BA60
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 09:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6646E697;
	Wed, 31 Jul 2019 07:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 998FF6E46F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 15:01:44 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 5BCF0B6BBD93E861E398;
 Tue, 30 Jul 2019 23:01:39 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Tue, 30 Jul 2019
 23:01:32 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@siol.net>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <seanpaul@chromium.org>, <heiko@sntech.de>
Subject: [PATCH -next] drm/rockchip: Make analogix_dp_atomic_check static
Date: Tue, 30 Jul 2019 23:00:57 +0800
Message-ID: <20190730150057.57388-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 31 Jul 2019 07:13:21 +0000
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
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHNwYXJzZSB3YXJuaW5nOgoKZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFs
b2dpeF9kcF9jb3JlLmM6MTE1MTo1OiB3YXJuaW5nOgogc3ltYm9sICdhbmFsb2dpeF9kcF9hdG9t
aWNfY2hlY2snIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/CgpSZXBvcnRl
ZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IFl1ZUhh
aWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX2NvcmUuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX2NvcmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBfY29yZS5jCmluZGV4IGM4MmM3ZDUuLmYyZjdmNjkg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBf
Y29yZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBf
Y29yZS5jCkBAIC0xMTQ4LDggKzExNDgsOCBAQCBhbmFsb2dpeF9kcF9iZXN0X2VuY29kZXIoc3Ry
dWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIH0KIAogCi1pbnQgYW5hbG9naXhfZHBfYXRv
bWljX2NoZWNrKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCi0JCQkgICAgIHN0cnVj
dCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSkKK3N0YXRpYyBpbnQgYW5hbG9naXhfZHBfYXRvbWlj
X2NoZWNrKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCisJCQkJICAgIHN0cnVjdCBk
cm1fYXRvbWljX3N0YXRlICpzdGF0ZSkKIHsKIAlzdHJ1Y3QgYW5hbG9naXhfZHBfZGV2aWNlICpk
cCA9IHRvX2RwKGNvbm5lY3Rvcik7CiAJc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5f
c3RhdGU7Ci0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
