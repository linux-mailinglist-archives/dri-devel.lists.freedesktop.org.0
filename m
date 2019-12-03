Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F4410FB5A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 11:04:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011E76E453;
	Tue,  3 Dec 2019 10:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12106E457
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 10:04:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4E786B15F;
 Tue,  3 Dec 2019 10:04:13 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, airlied@linux.ie, daniel@ffwll.ch,
 alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com,
 kraxel@redhat.com, sam@ravnborg.org, laurent.pinchart@ideasonboard.com,
 chris@chris-wilson.co.uk, emil.velikov@collabora.com,
 dan.carpenter@oracle.com
Subject: [PATCH 11/12] drm/tdfx: Don't include <drm/drm_pci.h>
Date: Tue,  3 Dec 2019 11:04:05 +0100
Message-Id: <20191203100406.9674-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191203100406.9674-1-tzimmermann@suse.de>
References: <20191203100406.9674-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5jbHVkaW5nIDxkcm0vZHJtX3BjaS5oPiBpcyB1bm5lY2Vzc2FyeSBpbiBtb3N0IGNhc2VzLiBS
ZXBsYWNlCnRoZXNlIGluc3RhbmNlcy4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90ZGZ4L3RkZnhfZHJ2
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGRmeC90ZGZ4X2Rydi5jIGIvZHJpdmVycy9n
cHUvZHJtL3RkZngvdGRmeF9kcnYuYwppbmRleCBjMjQzYWYxNTZlZTcuLmFiNjk5YmYwYWM1YyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RkZngvdGRmeF9kcnYuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vdGRmeC90ZGZ4X2Rydi5jCkBAIC0zMSwxMiArMzEsMTIgQEAKICAqLwogCiAjaW5j
bHVkZSA8bGludXgvbW9kdWxlLmg+CisjaW5jbHVkZSA8bGludXgvcGNpLmg+CiAKICNpbmNsdWRl
IDxkcm0vZHJtX2Rydi5oPgogI2luY2x1ZGUgPGRybS9kcm1fZmlsZS5oPgogI2luY2x1ZGUgPGRy
bS9kcm1faW9jdGwuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2xlZ2FjeS5oPgotI2luY2x1ZGUgPGRy
bS9kcm1fcGNpLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9wY2lpZHMuaD4KIAogI2luY2x1ZGUgInRk
ZnhfZHJ2LmgiCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
