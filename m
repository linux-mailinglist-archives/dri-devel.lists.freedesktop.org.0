Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E30F7BC36C
	for <lists+dri-devel@lfdr.de>; Sat,  7 Oct 2023 02:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E7710E057;
	Sat,  7 Oct 2023 00:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD77910E057;
 Sat,  7 Oct 2023 00:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=BT8tYl9kyCovYjvFEVeXbXj4P8U+VUi2Ywgg+MiH7SA=; b=2THIlO9aNRYwd5NkbeiK3pMNqH
 NVJFXMVfMrgYpaKmo+HvRdCyUG4hGIbVtdiNDP3LJWwpJcze8rqWWoMrlF6HpzEplrjlo2L3uEqoO
 2akY3DOGppEY+2MAdVQBJzxXvNtA3FZDkbea43kc4zQGt7IB/EzjwJoZWWMwcmJAuJGa2n4GccFH3
 YLAiWQ91KBaxJEnWONEpkXb+XBptKQgXxOypuZz4euLfM5GTKTD68/Cgatlag5YEMqH5BvwS7sONk
 Qvk+boo4Hqr8MMDr9aeYTlMrnquP6ZF82521NciqUNbTCyFqov2Oz1IKQtiSpg2qbAbaRAvJzHEvA
 GdWZ/vVw==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qovbD-006j2J-0g; Sat, 07 Oct 2023 00:55:19 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau: exec: fix ioctl kernel-doc warning
Date: Fri,  6 Oct 2023 17:55:18 -0700
Message-ID: <20231007005518.32015-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

include/uapi/drm/nouveau_drm.h:49: warning: Cannot understand  * @NOUVEAU_GETPARAM_EXEC_PUSH_MAX
 on line 49 - I thought it was a doc line

Fixes: d59e75eef52d ("drm/nouveau: exec: report max pushs through getparam")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
---
 include/uapi/drm/nouveau_drm.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -- a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
--- a/include/uapi/drm/nouveau_drm.h
+++ b/include/uapi/drm/nouveau_drm.h
@@ -45,8 +45,8 @@ extern "C" {
 #define NOUVEAU_GETPARAM_HAS_BO_USAGE    15
 #define NOUVEAU_GETPARAM_HAS_PAGEFLIP    16
 
-/**
- * @NOUVEAU_GETPARAM_EXEC_PUSH_MAX
+/*
+ * NOUVEAU_GETPARAM_EXEC_PUSH_MAX - query max pushes through getparam
  *
  * Query the maximum amount of IBs that can be pushed through a single
  * &drm_nouveau_exec structure and hence a single &DRM_IOCTL_NOUVEAU_EXEC
