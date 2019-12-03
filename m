Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 663F010F9FC
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 09:38:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314176E430;
	Tue,  3 Dec 2019 08:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C55A6E430
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 08:38:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 27FAAAE53;
 Tue,  3 Dec 2019 08:38:24 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@linux.ie, z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com, sam@ravnborg.org,
 kraxel@redhat.com
Subject: [PATCH v3 5/5] drm/hisilicon/hibmc: Export VRAM MM information to
 debugfs
Date: Tue,  3 Dec 2019 09:38:19 +0100
Message-Id: <20191203083819.6643-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191203083819.6643-1-tzimmermann@suse.de>
References: <20191203083819.6643-1-tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBjaGFuZ2UgbWFrZXMgaW5mb3JtYXRpb24gYWJvdXQgVlJBTSBjb25zdW1wdGlvbiBhdmFp
bGFibGUgb24KZGVidWdmcy4gU2VlCgogIC9zeXMva2VybmVsL2RlYnVnL2RyaS8wL3ZyYW0tbW0K
CmZvciBhbiBvdmVydmlldyBvZiBob3cgVlJBTSBpcyBiZWluZyB1c2VkLgoKU2lnbmVkLW9mZi1i
eTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+ClJldmlld2VkLWJ5OiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpBY2tlZC1ieTogU2FtIFJhdm5i
b3JnIDxzYW1AcmF2bmJvcmcub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGli
bWMvaGlibWNfZHJtX2Rydi5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9k
cnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jCmlu
ZGV4IDExM2QyN2I4YThmMS4uMTFkMWIwNzYxYzlhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
aGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9kcnYuYwpAQCAtNTUsNiArNTUsNyBAQCBzdGF0aWMg
c3RydWN0IGRybV9kcml2ZXIgaGlibWNfZHJpdmVyID0gewogCS5kZXNjCQkJPSAiaGlibWMgZHJt
IGRyaXZlciIsCiAJLm1ham9yCQkJPSAxLAogCS5taW5vcgkJCT0gMCwKKwkuZGVidWdmc19pbml0
CQk9IGRybV92cmFtX21tX2RlYnVnZnNfaW5pdCwKIAkuZHVtYl9jcmVhdGUgICAgICAgICAgICA9
IGhpYm1jX2R1bWJfY3JlYXRlLAogCS5kdW1iX21hcF9vZmZzZXQgICAgICAgID0gZHJtX2dlbV92
cmFtX2RyaXZlcl9kdW1iX21tYXBfb2Zmc2V0LAogCS5nZW1fcHJpbWVfbW1hcAkJPSBkcm1fZ2Vt
X3ByaW1lX21tYXAsCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
