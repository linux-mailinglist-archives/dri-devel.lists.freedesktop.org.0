Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1533D1AEB42
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 11:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83A46EC7E;
	Sat, 18 Apr 2020 09:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1794D6E31A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 10:10:48 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 250A4528DE1752884006;
 Fri, 17 Apr 2020 18:10:47 +0800 (CST)
Received: from localhost (10.166.215.154) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Fri, 17 Apr 2020
 18:10:38 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <patrik.r.jakobsson@gmail.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH -next] drm/gma500: remove unused variable 'hdmi_ids'
Date: Fri, 17 Apr 2020 18:10:32 +0800
Message-ID: <20200417101032.8140-1-yuehaibing@huawei.com>
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

ZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9vYWt0cmFpbF9oZG1pLmM6Njc2OjM1OiB3YXJuaW5nOiDi
gJhoZG1pX2lkc+KAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFi
bGU9XQogc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkIGhkbWlfaWRzW10gPSB7CiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn4KCkl0IGlzIG5ldmVyIHVz
ZWQsIHJlbW92ZSBpdC4KClJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNv
bT4KU2lnbmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvb2FrdHJhaWxfaGRtaS5jIHwgNSAtLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2dt
YTUwMC9vYWt0cmFpbF9oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL29ha3RyYWlsX2hk
bWkuYwppbmRleCBiMjUwODZmMjUyYWUuLmEwOTdhNTlhOWVhZSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2dtYTUwMC9vYWt0cmFpbF9oZG1pLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2dt
YTUwMC9vYWt0cmFpbF9oZG1pLmMKQEAgLTY2MywxMSArNjYzLDYgQEAgdm9pZCBvYWt0cmFpbF9o
ZG1pX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAlrZnJlZShnbWFfZW5jb2Rlcik7CiB9
CiAKLXN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBoZG1pX2lkc1tdID0gewotCXsg
UENJX0RFVklDRShQQ0lfVkVORE9SX0lEX0lOVEVMLCAweDA4MGQpIH0sCi0JeyAwIH0KLX07Ci0K
IHZvaWQgb2FrdHJhaWxfaGRtaV9zZXR1cChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogewogCXN0
cnVjdCBkcm1fcHNiX3ByaXZhdGUgKmRldl9wcml2ID0gZGV2LT5kZXZfcHJpdmF0ZTsKLS0gCjIu
MTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
