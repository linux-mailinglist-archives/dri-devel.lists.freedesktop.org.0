Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBF1F6CBC
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 03:30:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4689A6E833;
	Mon, 11 Nov 2019 02:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A20F46E5DB
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Nov 2019 10:58:25 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 8B782BC5F4735ABA30E0;
 Sun, 10 Nov 2019 18:58:21 +0800 (CST)
Received: from localhost.localdomain (10.175.104.82) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.439.0; Sun, 10 Nov 2019 18:58:15 +0800
From: Zheng Yongjun <zhengyongjun3@huawei.com>
To: <gregkh@linuxfoundation.org>, <dri-devel@lists.freedesktop.org>,
 <davem@davemloft.net>
Subject: [PATCH] staging: fbtft: Remove set but not used variable 'ret'
Date: Sun, 10 Nov 2019 18:57:07 +0800
Message-ID: <20191110105707.136956-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Originating-IP: [10.175.104.82]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 11 Nov 2019 02:29:25 +0000
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
Cc: zhengyongjun3@huawei.com, linux-kernel@vger.kernel.org,
 Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9z
dGFnaW5nL2ZidGZ0L2ZiX2lsaTkzMjAuYzogSW4gZnVuY3Rpb24gcmVhZF9kZXZpY2Vjb2RlOgpk
cml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJfaWxpOTMyMC5jOjI1OjY6IHdhcm5pbmc6IHZhcmlhYmxl
IHJldCBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKcmV0IGlz
IG5ldmVyIHVzZWQsIHNvIHJlbW92ZSBpdC4KClJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxr
Y2lAaHVhd2VpLmNvbT4KU2lnbmVkLW9mZi1ieTogWmhlbmcgWW9uZ2p1biA8emhlbmd5b25nanVu
M0BodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvc3RhZ2luZy9mYnRmdC9mYl9pbGk5MzIwLmMgfCAz
ICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9mYnRmdC9mYl9pbGk5MzIwLmMgYi9kcml2ZXJzL3N0
YWdpbmcvZmJ0ZnQvZmJfaWxpOTMyMC5jCmluZGV4IGYyZTcyZDE0NDMxZC4uZjBlYmM0MDg1N2Iz
IDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJfaWxpOTMyMC5jCisrKyBiL2Ry
aXZlcnMvc3RhZ2luZy9mYnRmdC9mYl9pbGk5MzIwLmMKQEAgLTIyLDExICsyMiwxMCBAQAogCiBz
dGF0aWMgdW5zaWduZWQgaW50IHJlYWRfZGV2aWNlY29kZShzdHJ1Y3QgZmJ0ZnRfcGFyICpwYXIp
CiB7Ci0JaW50IHJldDsKIAl1OCByeGJ1Zls4XSA9IHswLCB9OwogCiAJd3JpdGVfcmVnKHBhciwg
MHgwMDAwKTsKLQlyZXQgPSBwYXItPmZidGZ0b3BzLnJlYWQocGFyLCByeGJ1ZiwgNCk7CisJcGFy
LT5mYnRmdG9wcy5yZWFkKHBhciwgcnhidWYsIDQpOwogCXJldHVybiAocnhidWZbMl0gPDwgOCkg
fCByeGJ1ZlszXTsKIH0KIAotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
