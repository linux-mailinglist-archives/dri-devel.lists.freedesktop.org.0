Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B14FC10FB52
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 11:04:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495286E452;
	Tue,  3 Dec 2019 10:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29326E451
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 10:04:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 59089B19C;
 Tue,  3 Dec 2019 10:04:10 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, airlied@linux.ie, daniel@ffwll.ch,
 alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com,
 kraxel@redhat.com, sam@ravnborg.org, laurent.pinchart@ideasonboard.com,
 chris@chris-wilson.co.uk, emil.velikov@collabora.com,
 dan.carpenter@oracle.com
Subject: [PATCH 04/12] drm/i810: Don't include <drm/drm_pci.h>
Date: Tue,  3 Dec 2019 11:03:58 +0100
Message-Id: <20191203100406.9674-5-tzimmermann@suse.de>
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
IDx0emltbWVybWFubkBzdXNlLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pODEwL2k4MTBfZG1h
LmMgfCAyICstCiBkcml2ZXJzL2dwdS9kcm0vaTgxMC9pODEwX2Rydi5jIHwgMyArKy0KIDIgZmls
ZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pODEwL2k4MTBfZG1hLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTgxMC9p
ODEwX2RtYS5jCmluZGV4IGU2NmMzODMzMmRmNC4uYjg4YzNkNWY5MmI0IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTgxMC9pODEwX2RtYS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pODEw
L2k4MTBfZG1hLmMKQEAgLTMyLDYgKzMyLDcgQEAKIAogI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+
CiAjaW5jbHVkZSA8bGludXgvbW1hbi5oPgorI2luY2x1ZGUgPGxpbnV4L3BjaS5oPgogCiAjaW5j
bHVkZSA8ZHJtL2RybV9hZ3BzdXBwb3J0Lmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9kZXZpY2UuaD4K
QEAgLTM5LDcgKzQwLDYgQEAKICNpbmNsdWRlIDxkcm0vZHJtX2ZpbGUuaD4KICNpbmNsdWRlIDxk
cm0vZHJtX2lvY3RsLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9pcnEuaD4KLSNpbmNsdWRlIDxkcm0v
ZHJtX3BjaS5oPgogI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4KICNpbmNsdWRlIDxkcm0vaTgx
MF9kcm0uaD4KIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k4MTAvaTgxMF9kcnYuYyBi
L2RyaXZlcnMvZ3B1L2RybS9pODEwL2k4MTBfZHJ2LmMKaW5kZXggNWRkMjZhMDZlZTBlLi4wZTUz
YTA2NmQ0ZGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pODEwL2k4MTBfZHJ2LmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2k4MTAvaTgxMF9kcnYuYwpAQCAtMzEsMTEgKzMxLDEyIEBACiAg
Ki8KIAogI2luY2x1ZGUgImk4MTBfZHJ2LmgiCisKICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4K
KyNpbmNsdWRlIDxsaW51eC9wY2kuaD4KIAogI2luY2x1ZGUgPGRybS9kcm1fZHJ2Lmg+CiAjaW5j
bHVkZSA8ZHJtL2RybV9maWxlLmg+Ci0jaW5jbHVkZSA8ZHJtL2RybV9wY2kuaD4KICNpbmNsdWRl
IDxkcm0vZHJtX3BjaWlkcy5oPgogI2luY2x1ZGUgPGRybS9pODEwX2RybS5oPgogCi0tIAoyLjIz
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
