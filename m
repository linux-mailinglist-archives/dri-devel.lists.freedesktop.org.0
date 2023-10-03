Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8B57B5E7B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 03:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0067510E1F5;
	Tue,  3 Oct 2023 01:13:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3876810E1DA
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 01:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=CHSPuipCmNpy2ogfW/tDAVS/hQDi8Lu37X0Wm8Ngz7w=; b=hEUPAPl/tOzE1PYBBFgCT1PWyz
 D4IWdVLafWo4SyOJP9SFiU0nxktzZtvGLZ/YZLU8NFzZAzuZ8XJxew0xxj9ulabBdarMyG4iDi20J
 OJ1EZw75y+LNH4bVYmhkOUUWhh5GGHXRPdCYhMrEV2GqH0GPxSnhkgjpYvbNXXaAHoXSlbqXvJCo6
 Di39v4mzG55yoplKry9ue3F+zzaiE0KQbG+2naqwDEc101uXWojZL2LvGrx59toATGY/u2RU6spqx
 zwU5OFCZpOporBAFJRYUvbN7K0GgRbG6hmHt1mB20sFGFH9GWqbdKuF4SB3iGTmevERr+JjLkzctn
 hOSjJfWg==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qnTyw-00DcHx-2p; Tue, 03 Oct 2023 01:13:50 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] drm/uapi: drm_mode: fix doc typos
Date: Mon,  2 Oct 2023 18:13:47 -0700
Message-ID: <20231003011349.27593-1-rdunlap@infradead.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Randy Dunlap <rdunlap@infradead.org>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Correct grammar (add s for plural, insert "the").

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/uapi/drm/drm_mode.h |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff -- a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -36,10 +36,10 @@ extern "C" {
 /**
  * DOC: overview
  *
- * DRM exposes many UAPI and structure definition to have a consistent
- * and standardized interface with user.
+ * DRM exposes many UAPI and structure definitions to have a consistent
+ * and standardized interface with the user.
  * Userspace can refer to these structure definitions and UAPI formats
- * to communicate to driver
+ * to communicate to the driver.
  */
 
 #define DRM_CONNECTOR_NAME_LEN	32
