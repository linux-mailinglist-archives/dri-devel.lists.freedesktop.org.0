Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C8268215A
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 02:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3144110E124;
	Tue, 31 Jan 2023 01:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE4510E124
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 01:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=XwacVAoDlSbhvdOZfOteaBXk54tWeyXApMz+z+NJOP8=; b=S7YpfgA9tRx/yCrjFvVnTUdkaq
 7fd9YB2tGyuYg39ZO5DFdQRLD4Ou1hGkwFM2Eq7C+l6B4EaVTCtrCoQDgJZ+WUeJyvT2cYsK+vlH5
 E5olaslqFU49EEFSlhmPkNAvLKYFzAb5xQ3Tqne+jAgVRn2o9LKWESJeBKPuwoR18mjmRKPNkhEd/
 bgZgTvNyuF82ZeAmrqO3fozLEY6kN5xQaxb0RYUHxT4HDIDXRpC1RhqLuQuiXtoFAvJbzTd9htorE
 PtLW/OB0rdr+mHu6hOo7W+sIRN8uCfj6Dbu3hCEv2E82KVpkn5oJBDLZKvzkGoImLw63P/YYTfq1U
 X1EdmorQ==;
Received: from [2601:1c2:d00:6a60::9526] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pMfKg-005zG6-D6; Tue, 31 Jan 2023 01:21:10 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH -next] drm/client: fix kernel-doc warning in drm_client.h
Date: Mon, 30 Jan 2023 17:21:07 -0800
Message-Id: <20230131012107.20943-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.39.1
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
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

scripts/kernel-doc complains about the comment for hotplug_failed,
so fix it:

include/drm/drm_client.h:111: warning: Incorrect use of kernel-doc format:          * @hotplug failed:

Fixes: 6a9d5ad3af65 ("drm/client: Add hotplug_failed flag")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 include/drm/drm_client.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -- a/include/drm/drm_client.h b/include/drm/drm_client.h
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -108,7 +108,7 @@ struct drm_client_dev {
 	struct drm_mode_set *modesets;
 
 	/**
-	 * @hotplug failed:
+	 * @hotplug_failed:
 	 *
 	 * Set by client hotplug helpers if the hotplugging failed
 	 * before. It is usually not tried again.
