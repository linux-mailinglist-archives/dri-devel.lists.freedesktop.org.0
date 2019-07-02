Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 996625CECE
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 13:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B995D89B0D;
	Tue,  2 Jul 2019 11:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E5B89B22
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 11:50:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 263CFB150;
 Tue,  2 Jul 2019 11:50:18 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
 sean@poorly.run, sam@ravnborg.org, z.liuxinliang@hisilicon.com,
 zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, hdegoede@redhat.com, emil.l.velikov@gmail.com
Subject: [PATCH v3 3/5] drm/hibmc: Update struct drm_driver for GEM object
 functions
Date: Tue,  2 Jul 2019 13:50:10 +0200
Message-Id: <20190702115012.4418-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190702115012.4418-1-tzimmermann@suse.de>
References: <20190702115012.4418-1-tzimmermann@suse.de>
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
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEdFTSBvYmplY3QncyBmcmVlIGZ1bmN0aW9uIGlzIG5vdyBjYWxsZWQgdGhyb3VnaCBzdHJ1
Y3QKZHJtX2dlbV9vYmplY3RfZnVuY3MuZnJlZS4gVGhlIGZ1bmN0aW9uIHN0cnVjdCBkcm1fZHJp
dmVyLmdlbV9wcmltZV9tbWFwCmlzIG5vdyByZXF1aXJlZCBmb3IgbW1hcCdpbmcgR0VNIG9iamVj
dHMgdG8gdXNlcnNwYWNlLgoKdjI6CgkqIHNldCBkcm1fZHJpdmVyLmdlbV9wcmltZV9tbWFwIHRv
IGRybV9nZW1fcHJpbWVfbW1hcCgpCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8
dHppbW1lcm1hbm5Ac3VzZS5kZT4KQWNrZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+ClJldmlld2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xs
YWJvcmEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJt
X2Rydi5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1j
X2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Ry
di5jCmluZGV4IGNlODllNTY5MzdiMC4uMmY2NmVjMDVmZWM0IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9kcnYuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9kcnYuYwpAQCAtNTEsMTAgKzUxLDkgQEAg
c3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGhpYm1jX2RyaXZlciA9IHsKIAkuZGVzYwkJCT0gImhp
Ym1jIGRybSBkcml2ZXIiLAogCS5tYWpvcgkJCT0gMSwKIAkubWlub3IJCQk9IDAsCi0JLmdlbV9m
cmVlX29iamVjdF91bmxvY2tlZCA9Ci0JCWRybV9nZW1fdnJhbV9kcml2ZXJfZ2VtX2ZyZWVfb2Jq
ZWN0X3VubG9ja2VkLAogCS5kdW1iX2NyZWF0ZSAgICAgICAgICAgID0gaGlibWNfZHVtYl9jcmVh
dGUsCiAJLmR1bWJfbWFwX29mZnNldCAgICAgICAgPSBkcm1fZ2VtX3ZyYW1fZHJpdmVyX2R1bWJf
bW1hcF9vZmZzZXQsCisJLmdlbV9wcmltZV9tbWFwCQk9IGRybV9nZW1fcHJpbWVfbW1hcCwKIAku
aXJxX2hhbmRsZXIJCT0gaGlibWNfZHJtX2ludGVycnVwdCwKIH07CiAKLS0gCjIuMjEuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
