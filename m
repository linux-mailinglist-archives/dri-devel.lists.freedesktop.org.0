Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1584BFF931
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:46:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC9D26E46F;
	Sun, 17 Nov 2019 11:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6596E554;
 Fri, 15 Nov 2019 12:05:51 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id D4BEEE37816A92E3CAE0;
 Fri, 15 Nov 2019 20:05:46 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Fri, 15 Nov 2019
 20:05:37 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/6] drm/radeon: remove set but not used variable
 'dig_connector'
Date: Fri, 15 Nov 2019 20:12:57 +0800
Message-ID: <1573819980-54523-4-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573819980-54523-1-git-send-email-zhengbin13@huawei.com>
References: <1573819980-54523-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sun, 17 Nov 2019 11:44:18 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9hdG9tYmlvc19kcC5jOiBJbiBmdW5jdGlvbiByYWRlb25fZHBfZ2V0X3Bh
bmVsX21vZGU6CmRyaXZlcnMvZ3B1L2RybS9yYWRlb24vYXRvbWJpb3NfZHAuYzo0MTU6MzY6IHdh
cm5pbmc6IHZhcmlhYmxlIGRpZ19jb25uZWN0b3Igc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQt
YnV0LXNldC12YXJpYWJsZV0KCkl0IGlzIG5vdCB1c2VkIHNpbmNlIGNvbW1pdCAzNzlkZmMyNWUy
NTcgKCJkcm0vcmFkZW9uL2RwOgpzd2l0Y2ggdG8gdGhlIGNvbW1vbiBpMmMgb3ZlciBhdXggY29k
ZSIpCgpSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+ClNpZ25lZC1v
ZmYtYnk6IHpoZW5nYmluIDx6aGVuZ2JpbjEzQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9hdG9tYmlvc19kcC5jIHwgMyAtLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vYXRvbWJpb3NfZHAu
YyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vYXRvbWJpb3NfZHAuYwppbmRleCA2ZjM4Mzc1Li45
MTE3MzVmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2F0b21iaW9zX2RwLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9hdG9tYmlvc19kcC5jCkBAIC00MTIsNyArNDEy
LDYgQEAgaW50IHJhZGVvbl9kcF9nZXRfcGFuZWxfbW9kZShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVu
Y29kZXIsCiAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGVuY29kZXItPmRldjsKIAlzdHJ1Y3Qg
cmFkZW9uX2RldmljZSAqcmRldiA9IGRldi0+ZGV2X3ByaXZhdGU7CiAJc3RydWN0IHJhZGVvbl9j
b25uZWN0b3IgKnJhZGVvbl9jb25uZWN0b3IgPSB0b19yYWRlb25fY29ubmVjdG9yKGNvbm5lY3Rv
cik7Ci0Jc3RydWN0IHJhZGVvbl9jb25uZWN0b3JfYXRvbV9kaWcgKmRpZ19jb25uZWN0b3I7CiAJ
aW50IHBhbmVsX21vZGUgPSBEUF9QQU5FTF9NT0RFX0VYVEVSTkFMX0RQX01PREU7CiAJdTE2IGRw
X2JyaWRnZSA9IHJhZGVvbl9jb25uZWN0b3JfZW5jb2Rlcl9nZXRfZHBfYnJpZGdlX2VuY29kZXJf
aWQoY29ubmVjdG9yKTsKIAl1OCB0bXA7CkBAIC00MjMsOCArNDIyLDYgQEAgaW50IHJhZGVvbl9k
cF9nZXRfcGFuZWxfbW9kZShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsCiAJaWYgKCFyYWRl
b25fY29ubmVjdG9yLT5jb25fcHJpdikKIAkJcmV0dXJuIHBhbmVsX21vZGU7CgotCWRpZ19jb25u
ZWN0b3IgPSByYWRlb25fY29ubmVjdG9yLT5jb25fcHJpdjsKLQogCWlmIChkcF9icmlkZ2UgIT0g
RU5DT0RFUl9PQkpFQ1RfSURfTk9ORSkgewogCQkvKiBEUCBicmlkZ2UgY2hpcHMgKi8KIAkJaWYg
KGRybV9kcF9kcGNkX3JlYWRiKCZyYWRlb25fY29ubmVjdG9yLT5kZGNfYnVzLT5hdXgsCi0tCjIu
Ny40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
