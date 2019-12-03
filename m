Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B36BF10FB57
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 11:04:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B29ED6E45E;
	Tue,  3 Dec 2019 10:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505A26E454
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 10:04:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 92097B1B8;
 Tue,  3 Dec 2019 10:04:11 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, airlied@linux.ie, daniel@ffwll.ch,
 alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com,
 kraxel@redhat.com, sam@ravnborg.org, laurent.pinchart@ideasonboard.com,
 chris@chris-wilson.co.uk, emil.velikov@collabora.com,
 dan.carpenter@oracle.com
Subject: [PATCH 07/12] drm/r128: Don't include <drm/drm_pci.h>
Date: Tue,  3 Dec 2019 11:04:01 +0100
Message-Id: <20191203100406.9674-8-tzimmermann@suse.de>
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
IDx0emltbWVybWFubkBzdXNlLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yMTI4L3IxMjhfZHJ2
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcjEyOC9yMTI4X2Rydi5jIGIvZHJpdmVycy9n
cHUvZHJtL3IxMjgvcjEyOF9kcnYuYwppbmRleCBmZDc0Zjc0NDYwNGYuLmI3YTVmMTYyZWJhZSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3IxMjgvcjEyOF9kcnYuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vcjEyOC9yMTI4X2Rydi5jCkBAIC0zMCwxMCArMzAsMTAgQEAKICAqLwogCiAjaW5j
bHVkZSA8bGludXgvbW9kdWxlLmg+CisjaW5jbHVkZSA8bGludXgvcGNpLmg+CiAKICNpbmNsdWRl
IDxkcm0vZHJtX2Rydi5oPgogI2luY2x1ZGUgPGRybS9kcm1fZmlsZS5oPgotI2luY2x1ZGUgPGRy
bS9kcm1fcGNpLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9wY2lpZHMuaD4KICNpbmNsdWRlIDxkcm0v
ZHJtX3ZibGFuay5oPgogI2luY2x1ZGUgPGRybS9yMTI4X2RybS5oPgotLSAKMi4yMy4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
