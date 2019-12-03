Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E09E610FB59
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 11:04:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0946E02A;
	Tue,  3 Dec 2019 10:04:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3685C6E45C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 10:04:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B3CD8B14A;
 Tue,  3 Dec 2019 10:04:13 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, airlied@linux.ie, daniel@ffwll.ch,
 alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com,
 kraxel@redhat.com, sam@ravnborg.org, laurent.pinchart@ideasonboard.com,
 chris@chris-wilson.co.uk, emil.velikov@collabora.com,
 dan.carpenter@oracle.com
Subject: [PATCH 12/12] drm/via: Don't include <drm/drm_pci.h>
Date: Tue,  3 Dec 2019 11:04:06 +0100
Message-Id: <20191203100406.9674-13-tzimmermann@suse.de>
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
IDx0emltbWVybWFubkBzdXNlLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2RtYWJs
aXQuYyB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2Rydi5jICAgICB8IDIgKy0KIGRy
aXZlcnMvZ3B1L2RybS92aWEvdmlhX21hcC5jICAgICB8IDMgKystCiAzIGZpbGVzIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdmlhL3ZpYV9kbWFibGl0LmMgYi9kcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kbWFibGl0
LmMKaW5kZXggM2RiMDAwYWFjZDI2Li5kMTNhMzg5NzUwNmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS92aWEvdmlhX2RtYWJsaXQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9k
bWFibGl0LmMKQEAgLTM1LDExICszNSwxMSBAQAogICovCiAKICNpbmNsdWRlIDxsaW51eC9wYWdl
bWFwLmg+CisjaW5jbHVkZSA8bGludXgvcGNpLmg+CiAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgog
I2luY2x1ZGUgPGxpbnV4L3ZtYWxsb2MuaD4KIAogI2luY2x1ZGUgPGRybS9kcm1fZGV2aWNlLmg+
Ci0jaW5jbHVkZSA8ZHJtL2RybV9wY2kuaD4KICNpbmNsdWRlIDxkcm0vdmlhX2RybS5oPgogCiAj
aW5jbHVkZSAidmlhX2RtYWJsaXQuaCIKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aWEv
dmlhX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFfZHJ2LmMKaW5kZXggNjY2YTE2ZGU4
NGY5Li41ZGEzODA4MjgyMWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2Ry
di5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2Rydi5jCkBAIC0yMywxMCArMjMsMTAg
QEAKICAqLwogCiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CisjaW5jbHVkZSA8bGludXgvcGNp
Lmg+CiAKICNpbmNsdWRlIDxkcm0vZHJtX2Rydi5oPgogI2luY2x1ZGUgPGRybS9kcm1fZmlsZS5o
PgotI2luY2x1ZGUgPGRybS9kcm1fcGNpLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9wY2lpZHMuaD4K
ICNpbmNsdWRlIDxkcm0vdmlhX2RybS5oPgogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dmlhL3ZpYV9tYXAuYyBiL2RyaXZlcnMvZ3B1L2RybS92aWEvdmlhX21hcC5jCmluZGV4IDQzMWMx
NTBkZjAxNC4uMjU1YzUwNjZhOTM5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlhL3Zp
YV9tYXAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9tYXAuYwpAQCAtMjIsOCArMjIs
OSBAQAogICogREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLgogICovCiAKKyNpbmNsdWRlIDxsaW51
eC9wY2kuaD4KKwogI2luY2x1ZGUgPGRybS9kcm1fZGV2aWNlLmg+Ci0jaW5jbHVkZSA8ZHJtL2Ry
bV9wY2kuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3ZibGFuay5oPgogI2luY2x1ZGUgPGRybS92aWFf
ZHJtLmg+CiAKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
