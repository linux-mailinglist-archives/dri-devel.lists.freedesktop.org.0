Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D85AD99A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 15:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2568954A;
	Mon,  9 Sep 2019 13:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B098954A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 13:04:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C4625ABCB;
 Mon,  9 Sep 2019 13:04:56 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, kraxel@redhat.com, airlied@linux.ie, corbet@lwn.net,
 z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 hdegoede@redhat.com, sam@ravnborg.org, yc_chen@aspeedtech.com
Subject: [PATCH 0/4] Merge VRAM MM and GEM VRAM source files
Date: Mon,  9 Sep 2019 15:04:49 +0200
Message-Id: <20190909130453.6718-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
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
Cc: virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VlJBTSBNTSBhbmQgR0VNIFZSQU0gYXJlIG9ubHkgdXNlZCB3aXRoIGVhY2ggb3RoZXIuIFRoaXMg
cGF0Y2ggc2V0Cm1vdmVzIFZSQU0gTU0gaW50byBHRU0gVlJBTSBzb3VyY2UgZmlsZXMgYW5kIGNs
ZWFucyB1cCB0aGUgaGVscGVyJ3MKcHVibGljIGludGVyZmFjZS4KClRob21hcyBaaW1tZXJtYW5u
ICg0KToKICBkcm0vdnJhbTogTW92ZSBWUkFNIG1lbW9yeSBtYW5hZ2VyIHRvIEdFTSBWUkFNIGlt
cGxlbWVudGF0aW9uCiAgZHJtL3ZyYW06IEhhdmUgVlJBTSBNTSBjYWxsIEdFTSBWUkFNIGZ1bmN0
aW9ucyBkaXJlY3RseQogIGRybS92cmFtOiBVbmV4cG9ydCBpbnRlcm5hbCBmdW5jdGlvbnMgb2Yg
VlJBTSBNTQogIGRybS92cmFtOiBVbmNvbmRpdG9uYWxseSBzZXQgQk8gY2FsbC1iYWNrIGZ1bmN0
aW9ucwoKIERvY3VtZW50YXRpb24vZ3B1L2RybS1tbS5yc3QgICAgICAgICAgICAgICAgICB8ICAx
MiAtCiBkcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgfCAgIDMg
Ky0KIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5jICAgICAgICAgICAgICAgICB8ICAgMSAt
CiBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMgICAgICAgICAgICAgICAgfCAgIDEgLQog
ZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfdHRtLmMgICAgICAgICAgICAgICAgIHwgICAzICstCiBk
cml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHMuaCAgICAgICAgICAgICAgICAgfCAgIDEgLQogZHJp
dmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX21tLmMgICAgICAgICAgICAgIHwgICAzICstCiBkcml2
ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jICAgICAgICAgfCAzNjEgKysrKysrKysr
KysrKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3ZyYW1faGVscGVyX2NvbW1vbi5jICAgICAg
fCAgIDggKy0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fdnJhbV9tbV9oZWxwZXIuYyAgICAgICAgICB8
IDMwOSAtLS0tLS0tLS0tLS0tLS0KIC4uLi9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19k
cm1fZHJ2LmMgICB8ICAgMSAtCiBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1j
X3R0bS5jICAgfCAgIDMgKy0KIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2Lmgg
ICAgICAgICB8ICAgMSAtCiBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX3R0bS5jICAg
ICAgICAgfCAgIDMgKy0KIGRyaXZlcnMvZ3B1L2RybS92Ym94dmlkZW8vdmJveF9kcnYuaCAgICAg
ICAgICB8ICAgMiAtCiBkcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfdHRtLmMgICAgICAg
ICAgfCAgIDMgKy0KIGluY2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaCAgICAgICAgICAg
ICB8ICA5MCArKysrLQogaW5jbHVkZS9kcm0vZHJtX3ZyYW1fbW1faGVscGVyLmggICAgICAgICAg
ICAgIHwgMTA4IC0tLS0tLQogMTggZmlsZXMgY2hhbmdlZCwgMzc1IGluc2VydGlvbnMoKyksIDUz
OCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vZHJtX3Zy
YW1fbW1faGVscGVyLmMKIGRlbGV0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2RybS9kcm1fdnJhbV9t
bV9oZWxwZXIuaAoKLS0KMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
