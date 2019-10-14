Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A942D6FF9
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 09:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F946E614;
	Tue, 15 Oct 2019 07:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B48A89DDF
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 07:56:25 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 57BF6ACD45CF9E625619;
 Mon, 14 Oct 2019 15:56:21 +0800 (CST)
Received: from localhost.localdomain (10.67.212.132) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.439.0; Mon, 14 Oct 2019 15:56:15 +0800
From: Shaokun Zhang <zhangshaokun@hisilicon.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RESEND][PATCH -next] drm/dp-mst: Fix unused variable warning
Date: Mon, 14 Oct 2019 15:53:34 +0800
Message-ID: <1571039614-22464-1-git-send-email-zhangshaokun@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.67.212.132]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 15 Oct 2019 07:12:31 +0000
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
Cc: Shaokun Zhang <zhangshaokun@hisilicon.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYzogSW4gZnVuY3Rpb24g4oCYZHJt
X2F0b21pY19nZXRfbXN0X3RvcG9sb2d5X3N0YXRl4oCZOgpkcml2ZXJzL2dwdS9kcm0vZHJtX2Rw
X21zdF90b3BvbG9neS5jOjQxODc6MjE6IHdhcm5pbmc6IHVudXNlZCB2YXJpYWJsZSDigJhkZXbi
gJkgWy1XdW51c2VkLXZhcmlhYmxlXQogIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBtZ3ItPmRl
djsKICAgICAgICAgICAgICAgICAgICAgXgpGaXhlczogODNmYTk4NDJhZmU3ICgiZHJtL2RwLW1z
dDogRHJvcCBjb25uZWN0aW9uX211dGV4IGNoZWNrIikKQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAZmZ3bGwuY2g+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IEx5
dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IFNoYW9rdW4gWmhhbmcg
PHpoYW5nc2hhb2t1bkBoaXNpbGljb24uY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBf
bXN0X3RvcG9sb2d5LmMgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwppbmRleCA5MzY0ZTRmNDI5NzUuLjljY2Nj
NWU2MzMwOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3ku
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCkBAIC00MTg0LDgg
KzQxODQsNiBAQCBFWFBPUlRfU1lNQk9MKGRybV9kcF9tc3RfdG9wb2xvZ3lfc3RhdGVfZnVuY3Mp
Owogc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfc3RhdGUgKmRybV9hdG9taWNfZ2V0X21zdF90
b3BvbG9neV9zdGF0ZShzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUsCiAJCQkJCQkJCSAg
ICBzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1ncikKIHsKLQlzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2ID0gbWdyLT5kZXY7Ci0KIAlyZXR1cm4gdG9fZHBfbXN0X3RvcG9sb2d5X3N0YXRl
KGRybV9hdG9taWNfZ2V0X3ByaXZhdGVfb2JqX3N0YXRlKHN0YXRlLCAmbWdyLT5iYXNlKSk7CiB9
CiBFWFBPUlRfU1lNQk9MKGRybV9hdG9taWNfZ2V0X21zdF90b3BvbG9neV9zdGF0ZSk7Ci0tIAoy
LjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
