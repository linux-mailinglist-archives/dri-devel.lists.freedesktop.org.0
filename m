Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 600407688AC
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 23:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8BD10E1D0;
	Sun, 30 Jul 2023 21:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09BCE10E148;
 Sun, 30 Jul 2023 21:58:23 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3490920531cso13723025ab.1; 
 Sun, 30 Jul 2023 14:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690754302; x=1691359102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dzT1NtmhVPgMEzc8/Vu/DYGCtAi6F3prLfzQtzunD4A=;
 b=i0VV1Pxf7fG96sx0/4My6LgaDnMdoakFvgPb0GqVsaBE0OE88LPAs1C1z/LFiLzGY5
 tK1P659w0nu2hKiaVoiKdy0SSV51ZlEFs7/CvGJkv6PZFbBdo/R3QRsLeXdRm7XDC7O9
 wdfHH3f0+y2lP3D4FCSXCk8XG7edQ5vLizkTzo3oJESZdEuVmPQAuLS37O0S5Smj3X5w
 7omb+y63UjShSSAZwWtxVTQuLG+fBkZSNtQrEhVlp8snane6OWnw89sObWaAS8FCbao2
 fVuSfXU/JV8oMmCqhR0azQwVHqLzvgLTHx2O7JPpxlBqAO6ok++yOGD8Jat+Qlr4jLNA
 /YNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690754302; x=1691359102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dzT1NtmhVPgMEzc8/Vu/DYGCtAi6F3prLfzQtzunD4A=;
 b=PjF19upaFUQ5vNGFZJxjre7OzStfqhn1eXz+64rV4d+d4Sfn09T1Z793Roc8ZDetK0
 ostg2klGDoJwb5pDvu3UxnhcgEuH8bGQtG4pTcqNKFUfGDKbVar6qOwko6iyWcK9k7bz
 uYIF7CO1Qm9/Ky40Hjk7GI6rip7fc/OVQg+XdJROVUHFRzR9WEJxdNDzz8YTeqh48a+j
 8ovseDir/SWphghuHyVD+hRU7XksLMqt2b9+j4jxR0LCADt9mz069Cva8NJtejSAD3Fc
 rVV2oCyUVm8yc7k+Z3BYg3aUfUUvtaX2aL7b8VfoXfjrMOmn7fwumTULULavEDlXUQrC
 mVDw==
X-Gm-Message-State: ABy/qLZtOsfP1Mu7HP+D2wnf8IyTCJdhcsFq5DzumeZ91s+QcP7aH1FJ
 baLO2EfZlyL7J/33iUMUJxA=
X-Google-Smtp-Source: APBJJlH4diQF/gKGaFZFV2noWGnmxyr7j4k1TEOXzKb7Z048RyRdykHNxKRIZVn7OfF540vKITQnhg==
X-Received: by 2002:a05:6e02:218d:b0:346:d51:9922 with SMTP id
 j13-20020a056e02218d00b003460d519922mr8975282ila.13.1690754302289; 
 Sun, 30 Jul 2023 14:58:22 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e18-20020a92de52000000b003424b3d6d37sm2747520ilr.24.2023.07.30.14.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jul 2023 14:58:21 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/5] drm_dbg: add trailing newlines
Date: Sun, 30 Jul 2023 15:57:52 -0600
Message-ID: <20230730215758.54010-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230730215758.54010-1-jim.cromie@gmail.com>
References: <20230730215758.54010-1-jim.cromie@gmail.com>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/msm/msm_fb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index e3f61c39df69..80166f702a0d 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -89,7 +89,7 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb,
 
 	for (i = 0; i < n; i++) {
 		ret = msm_gem_get_and_pin_iova(fb->obj[i], aspace, &msm_fb->iova[i]);
-		drm_dbg_state(fb->dev, "FB[%u]: iova[%d]: %08llx (%d)",
+		drm_dbg_state(fb->dev, "FB[%u]: iova[%d]: %08llx (%d)\n",
 			      fb->base.id, i, msm_fb->iova[i], ret);
 		if (ret)
 			return ret;
@@ -176,7 +176,7 @@ static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
 	const struct msm_format *format;
 	int ret, i, n;
 
-	drm_dbg_state(dev, "create framebuffer: mode_cmd=%p (%dx%d@%4.4s)",
+	drm_dbg_state(dev, "create framebuffer: mode_cmd=%p (%dx%d@%4.4s)\n",
 			mode_cmd, mode_cmd->width, mode_cmd->height,
 			(char *)&mode_cmd->pixel_format);
 
@@ -232,7 +232,7 @@ static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
 
 	refcount_set(&msm_fb->dirtyfb, 1);
 
-	drm_dbg_state(dev, "create: FB ID: %d (%p)", fb->base.id, fb);
+	drm_dbg_state(dev, "create: FB ID: %d (%p)\n", fb->base.id, fb);
 
 	return fb;
 
-- 
2.41.0

