Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10ACB101B08
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:06:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 189676EC0A;
	Tue, 19 Nov 2019 08:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A526E4A5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:00:21 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id F3646CCDB18C9E7E0ECF;
 Mon, 18 Nov 2019 20:00:17 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Mon, 18 Nov 2019
 20:00:10 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <sebastian.reichel@collabora.com>, <laurent.pinchart@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/4] drm/omap: dss: Use PTR_ERR_OR_ZERO() to simplify code
Date: Mon, 18 Nov 2019 20:07:29 +0800
Message-ID: <1574078853-69002-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
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

emhlbmdiaW4gKDQpOgogIGRybS9vbWFwOiBkc3M6IFVzZSBQVFJfRVJSX09SX1pFUk8oKSB0byBz
aW1wbGlmeSBjb2RlIGluCiAgICBoZG1pX2F1ZGlvX3JlZ2lzdGVyCiAgZHJtL29tYXA6IGRzczog
VXNlIFBUUl9FUlJfT1JfWkVSTygpIHRvIHNpbXBsaWZ5IGNvZGUgaW4KICAgIGhkbWk0X2NvcmVf
aW5pdAogIGRybS9vbWFwOiBkc3M6IFVzZSBQVFJfRVJSX09SX1pFUk8oKSB0byBzaW1wbGlmeSBj
b2RlIGluCiAgICBoZG1pNV9jb3JlX2luaXQKICBkcm0vb21hcDogZHNzOiBVc2UgUFRSX0VSUl9P
Ul9aRVJPKCkgdG8gc2ltcGxpZnkgY29kZSBpbiBoZG1pX3BoeV9pbml0CgogZHJpdmVycy9ncHUv
ZHJtL29tYXBkcm0vZHNzL2hkbWk0LmMgICAgICB8IDUgKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9v
bWFwZHJtL2Rzcy9oZG1pNF9jb3JlLmMgfCA1ICstLS0tCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRy
bS9kc3MvaGRtaTVfY29yZS5jIHwgNSArLS0tLQogZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNz
L2hkbWlfcGh5LmMgICB8IDUgKy0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCAxNiBkZWxldGlvbnMoLSkKCi0tCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
