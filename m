Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB4B9A8D1
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 09:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639176EBC9;
	Fri, 23 Aug 2019 07:31:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9AE5A6EAD3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 09:32:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 468881596;
 Thu, 22 Aug 2019 02:32:41 -0700 (PDT)
Received: from e112269-lin.arm.com (e112269-lin.cambridge.arm.com
 [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27C703F246;
 Thu, 22 Aug 2019 02:32:40 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH] drm/panfrost: Add missing check for pfdev->regulator
Date: Thu, 22 Aug 2019 10:32:18 +0100
Message-Id: <20190822093218.26014-1-steven.price@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190822091512.GA32661@mwanda>
References: <20190822091512.GA32661@mwanda>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 23 Aug 2019 07:30:43 +0000
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
Cc: Dan Carpenter <dan.carpenter@oracle.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBtb2RpZnlpbmcgcGFuZnJvc3RfZGV2ZnJlcV90YXJnZXQoKSB0byBzdXBwb3J0IGEgZGV2
aWNlIHdpdGhvdXQgYQpyZWd1bGF0b3IgZGVmaW5lZCBJIG1pc3NlZCB0aGUgY2hlY2sgb24gdGhl
IGVycm9yIHBhdGguIExldCdzIGFkZCBpdC4KClJlcG9ydGVkLWJ5OiBEYW4gQ2FycGVudGVyIDxk
YW4uY2FycGVudGVyQG9yYWNsZS5jb20+CkZpeGVzOiBlMjFkZDI5MDg4MWIgKCJkcm0vcGFuZnJv
c3Q6IEVuYWJsZSBkZXZmcmVxIHRvIHdvcmsgd2l0aG91dCByZWd1bGF0b3IiKQpTaWduZWQtb2Zm
LWJ5OiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMgfCA2ICsrKystLQogMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jIGIvZHJpdmVycy9ncHUvZHJtL3Bh
bmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYwppbmRleCA3MTBkOTAzZjhlMGQuLmExZjVmYTZhNzQy
YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jCkBAIC01
Myw4ICs1MywxMCBAQCBzdGF0aWMgaW50IHBhbmZyb3N0X2RldmZyZXFfdGFyZ2V0KHN0cnVjdCBk
ZXZpY2UgKmRldiwgdW5zaWduZWQgbG9uZyAqZnJlcSwKIAlpZiAoZXJyKSB7CiAJCWRldl9lcnIo
ZGV2LCAiQ2Fubm90IHNldCBmcmVxdWVuY3kgJWx1ICglZClcbiIsIHRhcmdldF9yYXRlLAogCQkJ
ZXJyKTsKLQkJcmVndWxhdG9yX3NldF92b2x0YWdlKHBmZGV2LT5yZWd1bGF0b3IsIHBmZGV2LT5k
ZXZmcmVxLmN1cl92b2x0LAotCQkJCSAgICAgIHBmZGV2LT5kZXZmcmVxLmN1cl92b2x0KTsKKwkJ
aWYgKHBmZGV2LT5yZWd1bGF0b3IpCisJCQlyZWd1bGF0b3Jfc2V0X3ZvbHRhZ2UocGZkZXYtPnJl
Z3VsYXRvciwKKwkJCQkJICAgICAgcGZkZXYtPmRldmZyZXEuY3VyX3ZvbHQsCisJCQkJCSAgICAg
IHBmZGV2LT5kZXZmcmVxLmN1cl92b2x0KTsKIAkJcmV0dXJuIGVycjsKIAl9CiAKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
