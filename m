Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6200CBDA4
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 16:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA6926EBBD;
	Fri,  4 Oct 2019 14:44:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 102486EBBD
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 14:44:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46C1E1597;
 Fri,  4 Oct 2019 07:44:20 -0700 (PDT)
Received: from e112269-lin.arm.com (e112269-lin.cambridge.arm.com
 [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27B823F68E;
 Fri,  4 Oct 2019 07:44:19 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH] drm/panfrost: Remove NULL check for regulator
Date: Fri,  4 Oct 2019 15:44:13 +0100
Message-Id: <20191004144413.42586-1-steven.price@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZGV2bV9yZWd1bGF0b3JfZ2V0KCkgaXMgdXNlZCB0byBwb3B1bGF0ZSBwZmRldi0+cmVndWxhdG9y
IHdoaWNoIGVuc3VyZXMKdGhhdCB0aGlzIGNhbm5vdCBiZSBOVUxMIChhIGR1bW15IHJlZ3VsYXRv
ciB3aWxsIGJlIHJldHVybmVkIGlmCm5lY2Vzc2FyeSkuIFNvIHJlbW92ZSB0aGUgY2hlY2sgaW4g
cGFuZnJvc3RfZGV2ZnJlcV90YXJnZXQoKS4KClNpZ25lZC1vZmYtYnk6IFN0ZXZlbiBQcmljZSA8
c3RldmVuLnByaWNlQGFybS5jb20+Ci0tLQpUaGlzIGxvb2tzIGxpa2UgaXQgd2FzIGFjY2lkZW50
YWxseSByZWludHJvZHVjZWQgYnkgdGhlIG1lcmdlIGZyb20KZHJtLW5leHQgaW50byBkcm0tbWlz
Yy1uZXh0IGR1ZSB0byB0aGUgZHVwbGljYXRpb24gb2YgImRybS9wYW5mcm9zdDogQWRkCm1pc3Np
bmcgY2hlY2sgZm9yIHBmZGV2LXJlZ3VsYXRvciIgKGNvbW1pdHMgYzkwZjMwODEyYTc5IGFuZAo1
MjI4MjE2M2RmYTYpLgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZm
cmVxLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rf
ZGV2ZnJlcS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYwpp
bmRleCBjMWViOGNmZTZhZWIuLjEyZmY3N2RhY2M5NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFu
ZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jCkBAIC01MywxMCArNTMsOCBAQCBzdGF0aWMgaW50IHBh
bmZyb3N0X2RldmZyZXFfdGFyZ2V0KHN0cnVjdCBkZXZpY2UgKmRldiwgdW5zaWduZWQgbG9uZyAq
ZnJlcSwKIAlpZiAoZXJyKSB7CiAJCWRldl9lcnIoZGV2LCAiQ2Fubm90IHNldCBmcmVxdWVuY3kg
JWx1ICglZClcbiIsIHRhcmdldF9yYXRlLAogCQkJZXJyKTsKLQkJaWYgKHBmZGV2LT5yZWd1bGF0
b3IpCi0JCQlyZWd1bGF0b3Jfc2V0X3ZvbHRhZ2UocGZkZXYtPnJlZ3VsYXRvciwKLQkJCQkJICAg
ICAgcGZkZXYtPmRldmZyZXEuY3VyX3ZvbHQsCi0JCQkJCSAgICAgIHBmZGV2LT5kZXZmcmVxLmN1
cl92b2x0KTsKKwkJcmVndWxhdG9yX3NldF92b2x0YWdlKHBmZGV2LT5yZWd1bGF0b3IsIHBmZGV2
LT5kZXZmcmVxLmN1cl92b2x0LAorCQkJCSAgICAgIHBmZGV2LT5kZXZmcmVxLmN1cl92b2x0KTsK
IAkJcmV0dXJuIGVycjsKIAl9CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
