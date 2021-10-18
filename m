Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA8A431267
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 10:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550266E998;
	Mon, 18 Oct 2021 08:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 702C86E998
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 08:46:31 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id j190so8666279pgd.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 01:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g7PZP2ISph9TQ4xw8dB7G00aXCC5/0VQZsDe3MDN8ZE=;
 b=P78sYk44DBNjIHNLAt4rwBJjCjmVPOLysvvJdmuHVotiJzsYuzVdBqU2Y+oXfuxCzi
 Q2teeTgd7CJ8JDixb5tmsFM0B3lHWqmRtrvXv2eYAdHzS9olJ3LPc4Eo2hh4Br/AWkgW
 p2PpLRc+5gnkqBLMd8JNnDqSSb5FAYVtOwndH+iBnngjJ+Whzjx6a/EyEpR0eb06wKX/
 euajazvBJ2zubG1svWkzVcIgPBeqvu2QVU9vTPDKn88Uo1EiX7L9i1GzF0FOjH8/T1lf
 KvfY69oveASkfWGhlQfWr2AabxIDRRtYK6k+234Ks66PBWJcqRGxiZJkWDOWrO62yQSB
 0Cjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g7PZP2ISph9TQ4xw8dB7G00aXCC5/0VQZsDe3MDN8ZE=;
 b=h/6LuONtmyukYI9+Xc42QVl3/NNd/KM3coP72Jn8aDwmybrs2IsgN+jnNPh/BxTfDh
 CfaN19SafmXRxy5MdEdWGe4heFosnxsKarFNncspTOLAOKuG2i3qGSfO7colbCoeujpY
 LqtTUJbAlmiAcmDWfrCw+8LwnikgH/4wZihQhe5ZMBYLoAMpvfBRuQFeffX2Y54x6wQq
 olzTSl+Zm2RYmbNHC/N+KDG9EiUntZQ4oT24Yfg8nPed6mAFZzaC+57mCVCOYt51NPqC
 nA7DuW6P6gsc656vZQF2cL1kxultBgPLAMBoGkndDVlVfcW5H4psI6xxIaJxHgpCuUsh
 LqQA==
X-Gm-Message-State: AOAM5330Yh/gX+aaILpB5OwVK1G8wYe84y30zTdcfzaaGFLJ0kK/Uvn8
 T1rjbrpjxm/hjDKcgCkkNibdXLV2Me0=
X-Google-Smtp-Source: ABdhPJwn4VzX/fLMC92QbpnUY1A5Gihe3g16vx7acyxaUHzD2HGDoydseq3EILrrlUgla9J4dB4zhA==
X-Received: by 2002:aa7:90d2:0:b0:44c:e078:d6fb with SMTP id
 k18-20020aa790d2000000b0044ce078d6fbmr27078896pfk.7.1634546791098; 
 Mon, 18 Oct 2021 01:46:31 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id kb10sm5249758pjb.18.2021.10.18.01.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 01:46:30 -0700 (PDT)
From: luo penghao <cgel.zte@gmail.com>
X-Google-Original-From: luo penghao <luo.penghao@zte.com.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: luo penghao <luo.penghao@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] drm: Remove unused variable and its assignment.
Date: Mon, 18 Oct 2021 08:46:25 +0000
Message-Id: <20211018084625.852598-1-luo.penghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The assignment in these two places is meaningless, so it should be deleted.

The clang_analyzer complains as follows:

drivers/gpu/drm/drm_crtc_helper.c:635:2 warning:
Value stored to 'count' is never read.

drivers/gpu/drm/drm_crtc_helper.c:681:2 warning:
Value stored to 'count' is never read.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: luo penghao <luo.penghao@zte.com.cn>
---
 drivers/gpu/drm/drm_crtc_helper.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index bff9175..0e97e0a 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -632,7 +632,6 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
 	}
 
 	/* a) traverse passed in connector list and get encoders for them */
-	count = 0;
 	drm_connector_list_iter_begin(dev, &conn_iter);
 	drm_for_each_connector_iter(connector, &conn_iter) {
 		const struct drm_connector_helper_funcs *connector_funcs =
@@ -678,7 +677,6 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
 		goto fail;
 	}
 
-	count = 0;
 	drm_connector_list_iter_begin(dev, &conn_iter);
 	drm_for_each_connector_iter(connector, &conn_iter) {
 		if (!connector->encoder)
-- 
2.15.2



