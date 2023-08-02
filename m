Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD8376D077
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 16:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3401810E160;
	Wed,  2 Aug 2023 14:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B19210E160
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 14:47:59 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1bc34b32785so4717055ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 07:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1690987678; x=1691592478;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=34jvrY9iaBvcRp6RfXdi/NZwehC55dKloV135LCo6Q4=;
 b=ApOIy6Oof+Qo/7c+FEtdZW+BbrbkSOoTTUlpREhL52s9a/El38htUsBtKsr3weJLV2
 +dXMUNVFK2+BE/xrnKRHAvNi9FIBpWXkaWXaTtXCl42zHmAoBHaN6lSMr9nZMOEIOlD5
 3y/xyRf8LbatSRznjLxKSft9jkvkndOkzb/hc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690987678; x=1691592478;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=34jvrY9iaBvcRp6RfXdi/NZwehC55dKloV135LCo6Q4=;
 b=NmOZhmZonTCte3CWkZR03vScwLYuWL6tfAUj1RPhV/X3h6RUDrGkpKaDZ39xzrpT1X
 xMVvbYgeSoB1vbuK+/dkia7CAJnjk+ntRQ0sCcyc6Eig+/QYxtxL+0QK563znNR3C9Uy
 l21GBo0L/AOo7BJON4gFKyTXWh8HB1KFL39d6zQS/VK6ooxf1Py5eLULc36dgqTvCElD
 ZRZiWxVVMRLKBeqQt9137RK+6v3QodjU5hW9Wo+dqzOv9JqZ3GCP6MMKyhmxRjMrEtYn
 EvtjkGM4yzLIvV+5xerDp03HyfqvSGZtHA/TVME5qTC/yzQLEu5pLcVOHriy02HuEPls
 +KLw==
X-Gm-Message-State: ABy/qLbwAto43w7Gkyt4IaNAARNhcv5Jb3GWrdSndcflC+GgNFw4l25A
 gjP/GNGeLVJGBZ4TnfLW975I/vPy4taJF0DZKkJ6oJSy
X-Google-Smtp-Source: APBJJlFPjUDZubqVQL75MLrA9AfOwS26wqtyyCObOSfWkCHMjUe1pBsewbKiHvHWQOXGvHbT0dlkoQ==
X-Received: by 2002:a17:902:ed8c:b0:1b8:28f6:20e6 with SMTP id
 e12-20020a170902ed8c00b001b828f620e6mr13850468plj.34.1690987678407; 
 Wed, 02 Aug 2023 07:47:58 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:6fae:ec4e:7f84:d593])
 by smtp.gmail.com with ESMTPSA id
 b21-20020a170902d31500b001b89891bfc4sm12524139plc.199.2023.08.02.07.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 07:47:57 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 1/2] drm/panel: Fix kernel-doc typo for `follower_lock`
Date: Wed,  2 Aug 2023 07:47:27 -0700
Message-ID: <20230802074727.1.I4036706ad5e7f45e80d41b777164258e52079cd8@changeid>
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the kernel doc for the `follower_lock` member of `struct drm_panel`
there was a typo where it was called `followers_lock`. This resulted
in a warning when making "htmldocs":

  ./include/drm/drm_panel.h:270: warning:
  Function parameter or member 'follower_lock' not described in 'drm_panel'

Fix the typo.

Fixes: de0874165b83 ("drm/panel: Add a way for other devices to follow panel state")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/r/20230802142136.0f67b762@canb.auug.org.au
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 include/drm/drm_panel.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index d6c73f79c131..10015891b056 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -238,7 +238,7 @@ struct drm_panel {
 	struct list_head followers;
 
 	/**
-	 * @followers_lock:
+	 * @follower_lock:
 	 *
 	 * Lock for followers list.
 	 */
-- 
2.41.0.585.gd2178a4bd4-goog

