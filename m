Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E5E5CECB
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 13:50:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498B489B42;
	Tue,  2 Jul 2019 11:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542D289AA2
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 11:50:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9F280B14F;
 Tue,  2 Jul 2019 11:50:17 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
 sean@poorly.run, sam@ravnborg.org, z.liuxinliang@hisilicon.com,
 zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, hdegoede@redhat.com, emil.l.velikov@gmail.com
Subject: [PATCH v3 2/5] drm/bochs: Remove PRIME helpers from driver structure
Date: Tue,  2 Jul 2019 13:50:09 +0200
Message-Id: <20190702115012.4418-3-tzimmermann@suse.de>
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

VlJBTSBQUklNRSBoZWxwZXJzIGFyZSBub3cgY2FsbGVkIHRocm91Z2ggR0VNIG9iamVjdCBmdW5j
dGlvbnMuIFRoZQpkcml2ZXIgY2FsbGJhY2sgZnVuY3Rpb25zIGFyZSBvYnNvbGV0ZS4KClNpZ25l
ZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpBY2tlZC1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KUmV2aWV3ZWQtYnk6IEVt
aWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2JvY2hzL2JvY2hzX2Rydi5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19kcnYuYyBiL2RyaXZl
cnMvZ3B1L2RybS9ib2Nocy9ib2Noc19kcnYuYwppbmRleCA3OGFkNmM5ODg2MWQuLmY0OGIyMTJh
MjUzNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2Rydi5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19kcnYuYwpAQCAtNzMsNyArNzMsNiBAQCBzdGF0
aWMgc3RydWN0IGRybV9kcml2ZXIgYm9jaHNfZHJpdmVyID0gewogCS5tYWpvcgkJCT0gMSwKIAku
bWlub3IJCQk9IDAsCiAJRFJNX0dFTV9WUkFNX0RSSVZFUiwKLQlEUk1fR0VNX1ZSQU1fRFJJVkVS
X1BSSU1FLAogfTsKIAogLyogLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAqLwotLSAKMi4yMS4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
