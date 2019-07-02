Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C81535CA44
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 10:01:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BA589A5E;
	Tue,  2 Jul 2019 08:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4675889A5D
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 08:01:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C6A4AB0BA;
 Tue,  2 Jul 2019 08:01:47 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
 sean@poorly.run, sam@ravnborg.org, z.liuxinliang@hisilicon.com,
 zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, hdegoede@redhat.com
Subject: [PATCH v2 2/5] drm/bochs: Remove PRIME helpers from driver structure
Date: Tue,  2 Jul 2019 10:01:36 +0200
Message-Id: <20190702080139.21814-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190702080139.21814-1-tzimmermann@suse.de>
References: <20190702080139.21814-1-tzimmermann@suse.de>
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

VlJBTSBQUklNRSBoZWxwZXJzIGFyZSBub3cgY2FsbGVkIHRocm91Z2ggR0VNIG9iamVjdCBmdW5j
dGlvbnMuIFRoZQpkcml2ZXIgY2FsbGJhY2sgZnVuY3Rpb25zIGFyZSBvYnNvbGV0ZS4KClNpZ25l
ZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpBY2tlZC1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYm9jaHMvYm9jaHNfZHJ2LmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2Rydi5jIGIvZHJp
dmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2Rydi5jCmluZGV4IDc4YWQ2Yzk4ODYxZC4uZjQ4YjIx
MmEyNTM1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfZHJ2LmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2Rydi5jCkBAIC03Myw3ICs3Myw2IEBAIHN0
YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBib2Noc19kcml2ZXIgPSB7CiAJLm1ham9yCQkJPSAxLAog
CS5taW5vcgkJCT0gMCwKIAlEUk1fR0VNX1ZSQU1fRFJJVkVSLAotCURSTV9HRU1fVlJBTV9EUklW
RVJfUFJJTUUsCiB9OwogCiAvKiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tICovCi0tIAoyLjIxLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
