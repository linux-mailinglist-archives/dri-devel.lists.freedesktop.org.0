Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75667278126
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 09:09:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A3636EC0F;
	Fri, 25 Sep 2020 07:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8A86E090
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 03:06:30 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id C1D50302F0DD55A25566;
 Fri, 25 Sep 2020 11:06:26 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Fri, 25 Sep 2020 11:06:23 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <eric@anholt.net>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <p.zabel@pengutronix.de>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/vc4: hdmi: Fix variable ret not used
Date: Fri, 25 Sep 2020 11:03:55 +0800
Message-ID: <1601003035-31179-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 25 Sep 2020 07:09:24 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jOiBJbiBmdW5jdGlvbiDigJh2YzRfaGRtaV9z
ZXRfYXVkaW9faW5mb2ZyYW1l4oCZOgpkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmM6MzM0
OjY6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmHJldOKAmSBzZXQgYnV0IG5vdAp1c2VkIFstV3VudXNl
ZC1idXQtc2V0LXZhcmlhYmxlXQoKU2lnbmVkLW9mZi1ieTogVGlhbiBUYW8gPHRpYW50YW82QGhp
c2lsaWNvbi5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jIHwgNCArKysr
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3ZjNC92YzRfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jCmlu
ZGV4IGU4Zjk5ZTIuLjVjM2RkZWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0
X2hkbWkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMKQEAgLTMzNCw2ICsz
MzQsMTAgQEAgc3RhdGljIHZvaWQgdmM0X2hkbWlfc2V0X2F1ZGlvX2luZm9mcmFtZShzdHJ1Y3Qg
ZHJtX2VuY29kZXIgKmVuY29kZXIpCiAJaW50IHJldDsKIAogCXJldCA9IGhkbWlfYXVkaW9faW5m
b2ZyYW1lX2luaXQoJmZyYW1lLmF1ZGlvKTsKKwlpZiAocmV0IDwgMCkgeworCQlEUk1fRVJST1Io
ImZhaWxlZCB0byBzZXR1cCBhdWRpbyBpbmZvZnJhbWUiKTsKKwkJcmV0dXJuOworCX0KIAogCWZy
YW1lLmF1ZGlvLmNvZGluZ190eXBlID0gSERNSV9BVURJT19DT0RJTkdfVFlQRV9TVFJFQU07CiAJ
ZnJhbWUuYXVkaW8uc2FtcGxlX2ZyZXF1ZW5jeSA9IEhETUlfQVVESU9fU0FNUExFX0ZSRVFVRU5D
WV9TVFJFQU07Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
