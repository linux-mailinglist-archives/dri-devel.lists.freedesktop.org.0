Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E790E59AF1
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 14:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C186E913;
	Fri, 28 Jun 2019 12:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8166E915
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 12:27:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 468C3B62D;
 Fri, 28 Jun 2019 12:27:04 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
 sean@poorly.run, sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com
Subject: [PATCH 2/4] drm/bochs: Remove PRIME helpers from driver structure
Date: Fri, 28 Jun 2019 14:26:57 +0200
Message-Id: <20190628122659.31887-3-tzimmermann@suse.de>
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

VlJBTSBQUklNRSBoZWxwZXJzIGFyZSBub3cgY2FsbGVkIHRocm91Z2ggR0VNIG9iamVjdCBmdW5j
dGlvbnMuIFRoZQpkcml2ZXIgY2FsbGJhY2sgZnVuY3Rpb25zIGFyZSBvYnNvbGV0ZS4KClNpZ25l
ZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19kcnYuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfZHJ2
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfZHJ2LmMKaW5kZXggNzhhZDZjOTg4NjFk
Li5mNDhiMjEyYTI1MzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19k
cnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfZHJ2LmMKQEAgLTczLDcgKzcz
LDYgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGJvY2hzX2RyaXZlciA9IHsKIAkubWFqb3IJ
CQk9IDEsCiAJLm1pbm9yCQkJPSAwLAogCURSTV9HRU1fVlJBTV9EUklWRVIsCi0JRFJNX0dFTV9W
UkFNX0RSSVZFUl9QUklNRSwKIH07CiAKIC8qIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gKi8KLS0gCjIuMjEuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
