Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D51518C88C
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 09:02:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 833056EAE5;
	Fri, 20 Mar 2020 08:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C74189CCB
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 21:06:40 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id i9so2561737qtw.7
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 14:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CMx/8ME+t+O+uhtTdD3/2ZcadFzug6abUR8O/iR4eO8=;
 b=mq9lPlw96H/fgSMpVqJWQXAEQkV4H5luc9q0/aHega6+T+reaLIDnsQoWbCqsK8yBh
 DbBjRyctHUNxn5SG3dnd3+FbY2yitl0d3ooWC7z+h3vFnSwyfKwEKkLw2NHQu9O2fD46
 LZFWUSgngNvVz5TBWV83HiQspYb+L28azXwIkwmL907pS2ewtTKMSzRojP6xQibpkTj6
 54ASnyKKX3huNPhP/xuuWajQ1XdaezLacPfrtAg+mnka0C0NDWcO0vPhyf7haax88jEp
 sGGJRAKqAs6iyJxvCnDY6qe8yDmLRjSYqpTz0HgHMGGMYnI5YfsidRQCauAMgDZdWgEG
 KCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CMx/8ME+t+O+uhtTdD3/2ZcadFzug6abUR8O/iR4eO8=;
 b=YG58SDWOcW8JbarU+E1Imbz814ydOQysoNZHPACSr/OYQ5K55e0zdkSzzuM+6S9NxL
 Mru5ASzuFAHmk+y1KWt8Z1YalUwQ+oHMU7m0px7NyZkrkZaj2D3AH9xIf1c86ymsR+Qb
 HJytMR3oYDOhceUUOynKcEtqAOsDhWu0bVWn0+Ee7pBBEqwR3gXrowVL7dINNqMZ1aKR
 bPzg0PIAxjQ5xu5+a/SvaBBtyM1xsZGfB4ChgC/ZvGI+2b7wwn3iDQzEX05dBhE8R46p
 HsC4dB/SRp1I54yJPexw10W4F0qnbWWab3TLBGhZVLOJ9Qd8PltOKvtlXLtpuccL9gIF
 yWdQ==
X-Gm-Message-State: ANhLgQ3ttfecg92pxaf1XpRgVhcTezI/PIE8DzdPiZDdaSZ6lngbj4jB
 6TbfMP1DSgqAWTEpNl/E4BBSp/Y4Uw8=
X-Google-Smtp-Source: ADFU+vsrS0+i9NYd7Ohr9xYe3PUws4AQGLSvj8ovYFCTgMTJF0RiULIyrAQQODniZSoHvLiuqqc7Iw==
X-Received: by 2002:ac8:46d5:: with SMTP id h21mr4985343qto.59.1584651999269; 
 Thu, 19 Mar 2020 14:06:39 -0700 (PDT)
Received: from localhost.localdomain ([179.159.236.147])
 by smtp.googlemail.com with ESMTPSA id 31sm2582388qta.56.2020.03.19.14.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 14:06:38 -0700 (PDT)
From: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm: Align a comment block
Date: Thu, 19 Mar 2020 18:06:00 -0300
Message-Id: <20200319210600.1170-1-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 20 Mar 2020 08:01:25 +0000
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
Cc: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 Rodrigo.Siqueira@amd.com, rodrigosiqueiramelo@gmail.com,
 andrealmeid@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix a checkpatch warning caused by a misaligned comment block.

Signed-off-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>

---
Changes in v2:
- Change subject text

Changes in V3
- Fix a typo in the commit message

drivers/gpu/drm/drm_gem.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index a9e4a610445a..564acc1f4030 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -222,10 +222,10 @@ drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
 		return;
 
 	/*
-	* Must bump handle count first as this may be the last
-	* ref, in which case the object would disappear before we
-	* checked for a name
-	*/
+	 * Must bump handle count first as this may be the last
+	 * ref, in which case the object would disappear before we
+	 * checked for a name
+	 */
 
 	mutex_lock(&dev->object_name_lock);
 	if (--obj->handle_count == 0) {
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
