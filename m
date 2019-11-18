Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC647101ADE
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:04:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9B86EBA2;
	Tue, 19 Nov 2019 08:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339E06E4AA
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:00:21 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id EE2CAE68C762ABD94E18;
 Mon, 18 Nov 2019 20:00:17 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Mon, 18 Nov 2019
 20:00:11 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <sebastian.reichel@collabora.com>, <laurent.pinchart@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/4] drm/omap: dss: Use PTR_ERR_OR_ZERO() to simplify code in
 hdmi4_core_init
Date: Mon, 18 Nov 2019 20:07:31 +0800
Message-ID: <1574078853-69002-3-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574078853-69002-1-git-send-email-zhengbin13@huawei.com>
References: <1574078853-69002-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
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

Rml4ZXMgY29jY2ljaGVjayB3YXJuaW5nOgoKZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2hk
bWk0X2NvcmUuYzo5Mjc6MS0zOiBXQVJOSU5HOiBQVFJfRVJSX09SX1pFUk8gY2FuIGJlIHVzZWQK
ClJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KU2lnbmVkLW9mZi1i
eTogemhlbmdiaW4gPHpoZW5nYmluMTNAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
b21hcGRybS9kc3MvaGRtaTRfY29yZS5jIHwgNSArLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9v
bWFwZHJtL2Rzcy9oZG1pNF9jb3JlLmMgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRt
aTRfY29yZS5jCmluZGV4IGVhNWQ1YzIuLmJhNTEyZjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9vbWFwZHJtL2Rzcy9oZG1pNF9jb3JlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBk
cm0vZHNzL2hkbWk0X2NvcmUuYwpAQCAtOTI0LDggKzkyNCw1IEBAIGludCBoZG1pNF9jb3JlX2lu
aXQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwgc3RydWN0IGhkbWlfY29yZV9kYXRhICpj
b3JlKQoKIAlyZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2VfYnluYW1lKHBkZXYsIElPUkVTT1VS
Q0VfTUVNLCAiY29yZSIpOwogCWNvcmUtPmJhc2UgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoJnBk
ZXYtPmRldiwgcmVzKTsKLQlpZiAoSVNfRVJSKGNvcmUtPmJhc2UpKQotCQlyZXR1cm4gUFRSX0VS
Uihjb3JlLT5iYXNlKTsKLQotCXJldHVybiAwOworCXJldHVybiBQVFJfRVJSX09SX1pFUk8oY29y
ZS0+YmFzZSk7CiB9Ci0tCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
