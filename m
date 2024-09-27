Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E530987F8B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 09:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544EC10EC35;
	Fri, 27 Sep 2024 07:38:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mm+Xm1jp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB0C10E03B;
 Fri, 27 Sep 2024 00:01:53 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a8d29b7edc2so192119766b.1; 
 Thu, 26 Sep 2024 17:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727395312; x=1728000112; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U4DmHwZhZIQSDJ1IAkiV7HNtDx5RPl1Sb5duaMbxKCs=;
 b=mm+Xm1jplZ6F5ysHMOcpx6D08hbhqGsSHlVH9CM/QODFvbyS1lLMrlrCY8z3+2DhtH
 CLFleft9VXeMLfh8ARcmjVRzGS7iDnQVNJQqJqmb7/aqW7c6GMQki9596k9QfENeTzRo
 Eg9Rs7F9gv26P6ksnKVgrPfTiKoeZ8P/vfsTu/CnocKYga0hbYepWdBd8PpVE+VOBotK
 ZLcaG1Fk2/OAFqlDKHM4m5mxA2M7UlV4ttd5WsEXmpT1p3mchjOVZoogoKAjJMmZmegz
 ybjA1uCNzuybkSFXPYjL+RiaQBbJwYztnl6pDwGU0rOYapZsbn33GvXIxJghy7yMuTl1
 clKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727395312; x=1728000112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U4DmHwZhZIQSDJ1IAkiV7HNtDx5RPl1Sb5duaMbxKCs=;
 b=OLMU2d1MZr5hOvw/ciPXckNWSH51XBpwIqeAa8Wv7xvOeJzpBzBvPfVpnw6AtCr/26
 APEBjG/iYfrs2/gwVBaqOVljCgr0pydh+rlX8qV+6sxeC0j/2EVX6cRwALxB/CvfF1kc
 CUR7slIBNtsPbD+5DGukl6pwTLhKF1iii4mPXyJ3bMTwh9KyXngIKcuEpOiV/2T3T7/0
 Ekp2dcwTnQcBv1tgJ3/Jvaua+/82STUgN6lGCI4CatZgrcjJ+yXWG/N/bdh/2zm84Yzo
 iy7t8jCIPwoijeBtBcYoc03HlzXtjbRLvvKvRPkRpQZQWV2I0gwXJfhRroWz6Q4UWGoH
 jZQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp6ozfFyIQ4p1AaP57f/72PAHKvfJDXl/nxtRGgyKuCvnLhL5O1RQqUanCisgJaAEsSv8ZrmYlUeM=@lists.freedesktop.org,
 AJvYcCWnvu9wpZgI4t4htylpJFsxVN2jpjUXRcjJce26PFtHyohSiqEDs8iDCkXsY9DOIvZV1sH8xoSrhl0=@lists.freedesktop.org,
 AJvYcCX+b+h7FGHKK/GjMnnfz1meeu4zA0r9zD8TDavd0GELyGj9gOeoE3/rUzZPEZCiLmUOtGETfMhIk9x2@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAzZSw5M6HR01qI8TLC91jB7uCxBb26iaRaEda2A9KIDTMePDu
 qtkVz7Qrwqm3KCdzHYU5knrmveARPtKZPIaYQmW9WzHeZjP4wqna
X-Google-Smtp-Source: AGHT+IEe+4qv/gH8mKQLQOBF/U3++C2ZiNBlIGNXsVrwjBIzuzBkLAg83454FCfI+dydv3Tdevl6sg==
X-Received: by 2002:a17:907:9492:b0:a7a:8da1:eb00 with SMTP id
 a640c23a62f3a-a93c48f6ea4mr88816366b.7.1727395311367; 
 Thu, 26 Sep 2024 17:01:51 -0700 (PDT)
Received: from alessandro-pc.station (net-37-119-37-200.cust.vodafonedsl.it.
 [37.119.37.200]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2979d88sm52566666b.156.2024.09.26.17.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 17:01:50 -0700 (PDT)
From: Alessandro Zanni <alessandro.zanni87@gmail.com>
To: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch
Cc: Alessandro Zanni <alessandro.zanni87@gmail.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, anupnewsmail@gmail.com
Subject: [PATCH] gpu: drm: i915: display: Avoid null values
 intel_plane_atomic_check_with_state
Date: Fri, 27 Sep 2024 02:01:44 +0200
Message-ID: <20240927000146.50830-1-alessandro.zanni87@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 27 Sep 2024 07:38:26 +0000
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

This fix solves multiple Smatch errors:

drivers/gpu/drm/i915/display/intel_atomic_plane.c:660
intel_plane_atomic_check_with_state() error:
we previously assumed 'fb' could be null (see line 648)

drivers/gpu/drm/i915/display/intel_atomic_plane.c:664
intel_plane_atomic_check_with_state()
error: we previously assumed 'fb' could be null (see line 659)

drivers/gpu/drm/i915/display/intel_atomic_plane.c:671
intel_plane_atomic_check_with_state()
error: we previously assumed 'fb' could be null (see line 663)

We should check first if fb is not null before to access its properties.

Signed-off-by: Alessandro Zanni <alessandro.zanni87@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_atomic_plane.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index e979786aa5cf..1606f79b39e6 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -656,18 +656,18 @@ int intel_plane_atomic_check_with_state(const struct intel_crtc_state *old_crtc_
 	    intel_plane_is_scaled(new_plane_state))
 		new_crtc_state->scaled_planes |= BIT(plane->id);
 
-	if (new_plane_state->uapi.visible &&
+	if (new_plane_state->uapi.visible && fb &&
 	    intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier))
 		new_crtc_state->nv12_planes |= BIT(plane->id);
 
-	if (new_plane_state->uapi.visible &&
+	if (new_plane_state->uapi.visible && fb &&
 	    fb->format->format == DRM_FORMAT_C8)
 		new_crtc_state->c8_planes |= BIT(plane->id);
 
 	if (new_plane_state->uapi.visible || old_plane_state->uapi.visible)
 		new_crtc_state->update_planes |= BIT(plane->id);
 
-	if (new_plane_state->uapi.visible &&
+	if (new_plane_state->uapi.visible && fb &&
 	    intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier)) {
 		new_crtc_state->data_rate_y[plane->id] =
 			intel_plane_data_rate(new_crtc_state, new_plane_state, 0);
-- 
2.43.0

