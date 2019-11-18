Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B53101B02
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAEAF6EBFA;
	Tue, 19 Nov 2019 08:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A31F89CF5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:27:33 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 7ECB9D59EE32EFE213E0;
 Mon, 18 Nov 2019 20:27:29 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Mon, 18 Nov 2019
 20:27:20 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <mripard@kernel.org>, <wens@csie.org>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 0/5] drm/sun4i: Use PTR_ERR_OR_ZERO() to simplify code
Date: Mon, 18 Nov 2019 20:34:39 +0800
Message-ID: <1574080484-48744-1-git-send-email-zhengbin13@huawei.com>
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

emhlbmdiaW4gKDUpOgogIGRybS9zdW40aTogVXNlIFBUUl9FUlJfT1JfWkVSTygpIHRvIHNpbXBs
aWZ5IGNvZGUgaW4KICAgIHN1bjRpX2hkbWlfaW5pdF9yZWdtYXBfZmllbGRzCiAgZHJtL3N1bjRp
OiBVc2UgUFRSX0VSUl9PUl9aRVJPKCkgdG8gc2ltcGxpZnkgY29kZSBpbiBzdW40aV90bWRzX2Ny
ZWF0ZQogIGRybS9zdW40aTogVXNlIFBUUl9FUlJfT1JfWkVSTygpIHRvIHNpbXBsaWZ5IGNvZGUg
aW4gc3VuNGlfZGNsa19jcmVhdGUKICBkcm0vc3VuNGk6IFVzZSBQVFJfRVJSX09SX1pFUk8oKSB0
byBzaW1wbGlmeSBjb2RlIGluIHN1bjRpX2RkY19jcmVhdGUKICBkcm0vc3VuNGk6IFVzZSBQVFJf
RVJSX09SX1pFUk8oKSB0byBzaW1wbGlmeSBjb2RlIGluCiAgICBzdW44aV9waHlfY2xrX2NyZWF0
ZQoKIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9kb3RjbG9jay5jICAgICAgfCA1ICstLS0t
CiBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfaGRtaV9kZGNfY2xrLmMgIHwgNSArLS0tLQog
ZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2hkbWlfaTJjLmMgICAgICB8IDUgKy0tLS0KIGRy
aXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9oZG1pX3RtZHNfY2xrLmMgfCA1ICstLS0tCiBkcml2
ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfaGRtaV9waHlfY2xrLmMgIHwgNSArLS0tLQogNSBmaWxl
cyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQoKLS0KMi43LjQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
