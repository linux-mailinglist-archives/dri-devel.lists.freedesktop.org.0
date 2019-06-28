Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EDC59AF2
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 14:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250A46E914;
	Fri, 28 Jun 2019 12:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB276E913
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 12:27:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A7380B632;
 Fri, 28 Jun 2019 12:27:04 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
 sean@poorly.run, sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com
Subject: [PATCH 3/4] drm/hibmc: Leave struct
 drm_driver.gem_free_object_unlocked to NULL
Date: Fri, 28 Jun 2019 14:26:58 +0200
Message-Id: <20190628122659.31887-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190628122659.31887-1-tzimmermann@suse.de>
References: <20190628122659.31887-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEdFTSBvYmplY3QncyBmcmVlIGZ1bmN0aW9uIGlzIG5vdyBjYWxsZWQgdGhyb3VnaApzdHJ1
Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3MuZnJlZS4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9oaXNpbGlj
b24vaGlibWMvaGlibWNfZHJtX2Rydi5jIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJt
Y19kcm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9k
cnYuYwppbmRleCBjZTg5ZTU2OTM3YjAuLjBlZmNjZjM2NTEwMSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMKQEAgLTUxLDggKzUxLDYgQEAg
c3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGhpYm1jX2RyaXZlciA9IHsKIAkuZGVzYwkJCT0gImhp
Ym1jIGRybSBkcml2ZXIiLAogCS5tYWpvcgkJCT0gMSwKIAkubWlub3IJCQk9IDAsCi0JLmdlbV9m
cmVlX29iamVjdF91bmxvY2tlZCA9Ci0JCWRybV9nZW1fdnJhbV9kcml2ZXJfZ2VtX2ZyZWVfb2Jq
ZWN0X3VubG9ja2VkLAogCS5kdW1iX2NyZWF0ZSAgICAgICAgICAgID0gaGlibWNfZHVtYl9jcmVh
dGUsCiAJLmR1bWJfbWFwX29mZnNldCAgICAgICAgPSBkcm1fZ2VtX3ZyYW1fZHJpdmVyX2R1bWJf
bW1hcF9vZmZzZXQsCiAJLmlycV9oYW5kbGVyCQk9IGhpYm1jX2RybV9pbnRlcnJ1cHQsCi0tIAoy
LjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
