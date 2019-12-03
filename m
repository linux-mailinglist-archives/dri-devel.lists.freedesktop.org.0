Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 794C510FB5E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 11:04:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47EE86E45C;
	Tue,  3 Dec 2019 10:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D286E451
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 10:04:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2BCD4B1AB;
 Tue,  3 Dec 2019 10:04:11 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, airlied@linux.ie, daniel@ffwll.ch,
 alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com,
 kraxel@redhat.com, sam@ravnborg.org, laurent.pinchart@ideasonboard.com,
 chris@chris-wilson.co.uk, emil.velikov@collabora.com,
 dan.carpenter@oracle.com
Subject: [PATCH 06/12] drm/mgag200: Don't include <drm/drm_pci.h>
Date: Tue,  3 Dec 2019 11:04:00 +0100
Message-Id: <20191203100406.9674-7-tzimmermann@suse.de>
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
IDx0emltbWVybWFubkBzdXNlLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcy
MDBfY3Vyc29yLmMgfCAyICstCiBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2kyYy5j
ICAgIHwgMyArLS0KIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbWFpbi5jICAgfCAz
ICsrLQogZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMgICB8IDIgKy0KIGRy
aXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfdHRtLmMgICAgfCAyICstCiA1IGZpbGVzIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2N1cnNvci5jIGIvZHJpdmVycy9ncHUvZHJtL21n
YWcyMDAvbWdhZzIwMF9jdXJzb3IuYwppbmRleCA3OTcxMWRiYjViMDMuLjU0NDRjZjE1NzNhMyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9jdXJzb3IuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2N1cnNvci5jCkBAIC01LDcgKzUsNyBA
QAogICogQXV0aG9yOiBDaHJpc3RvcGhlciBIYXJ2ZXkgPGNoYXJ2ZXlAbWF0cm94LmNvbT4KICAq
LwogCi0jaW5jbHVkZSA8ZHJtL2RybV9wY2kuaD4KKyNpbmNsdWRlIDxsaW51eC9wY2kuaD4KIAog
I2luY2x1ZGUgIm1nYWcyMDBfZHJ2LmgiCiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
Z2FnMjAwL21nYWcyMDBfaTJjLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2ky
Yy5jCmluZGV4IDUxZDQwMzdmMDBkNC4uOWY0NjM1OTE2ZDMyIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2kyYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2Fn
MjAwL21nYWcyMDBfaTJjLmMKQEAgLTI5LDggKzI5LDcgQEAKICNpbmNsdWRlIDxsaW51eC9leHBv
cnQuaD4KICNpbmNsdWRlIDxsaW51eC9pMmMtYWxnby1iaXQuaD4KICNpbmNsdWRlIDxsaW51eC9p
MmMuaD4KLQotI2luY2x1ZGUgPGRybS9kcm1fcGNpLmg+CisjaW5jbHVkZSA8bGludXgvcGNpLmg+
CiAKICNpbmNsdWRlICJtZ2FnMjAwX2Rydi5oIgogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbWdhZzIwMC9tZ2FnMjAwX21haW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcy
MDBfbWFpbi5jCmluZGV4IGUxYmM1YjBhYTc3NC4uYjFkZDU2OWI4YzgwIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21haW4uYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vbWdhZzIwMC9tZ2FnMjAwX21haW4uYwpAQCAtOCw5ICs4LDEwIEBACiAgKiAgICAgICAgICBE
YXZlIEFpcmxpZQogICovCiAKKyNpbmNsdWRlIDxsaW51eC9wY2kuaD4KKwogI2luY2x1ZGUgPGRy
bS9kcm1fY3J0Y19oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9o
ZWxwZXIuaD4KLSNpbmNsdWRlIDxkcm0vZHJtX3BjaS5oPgogCiAjaW5jbHVkZSAibWdhZzIwMF9k
cnYuaCIKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2Rl
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYwppbmRleCA1ZWM2OTcx
NDhmYzEuLjYyYThlOWNjYjE2ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAv
bWdhZzIwMF9tb2RlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2Rl
LmMKQEAgLTksMTAgKzksMTAgQEAKICAqLwogCiAjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4KKyNp
bmNsdWRlIDxsaW51eC9wY2kuaD4KIAogI2luY2x1ZGUgPGRybS9kcm1fY3J0Y19oZWxwZXIuaD4K
ICNpbmNsdWRlIDxkcm0vZHJtX2ZvdXJjYy5oPgotI2luY2x1ZGUgPGRybS9kcm1fcGNpLmg+CiAj
aW5jbHVkZSA8ZHJtL2RybV9wbGFuZV9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3Byb2Jl
X2hlbHBlci5oPgogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAw
X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF90dG0uYwppbmRleCA5OTk5
N2Q3MzczNjIuLmU4OTY1NzYzMGVhNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21nYWcy
MDAvbWdhZzIwMF90dG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX3R0
bS5jCkBAIC0yNiw3ICsyNiw3IEBACiAgKiBBdXRob3JzOiBEYXZlIEFpcmxpZSA8YWlybGllZEBy
ZWRoYXQuY29tPgogICovCiAKLSNpbmNsdWRlIDxkcm0vZHJtX3BjaS5oPgorI2luY2x1ZGUgPGxp
bnV4L3BjaS5oPgogCiAjaW5jbHVkZSAibWdhZzIwMF9kcnYuaCIKIAotLSAKMi4yMy4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
