Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 512F6790D86
	for <lists+dri-devel@lfdr.de>; Sun,  3 Sep 2023 20:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F7B10E1D6;
	Sun,  3 Sep 2023 18:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F2510E008;
 Sun,  3 Sep 2023 18:46:20 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-792623074edso32724039f.1; 
 Sun, 03 Sep 2023 11:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693766779; x=1694371579; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VQ/W1vAuvct0eQaNfV42dDs6Is2Bz/K+5cHGfVn4Nlg=;
 b=MNEL8PWtVnTFfXGWQnjgJ8oYdsYcbHT3eg6KZg/PG6PM/uNg3Z/D8s5yvxKvCtpeVp
 kIUa2J0191+tPntP/bXNg31kfYU8ynX0Q0r21h9EHEAi46PVs8yY4oyxK6XRKaeVK8kT
 RU8XXmyyUXAh9XfKqzN9MhVURXma68yjKr3vKAEGHmq7LC+dunUeST3RDAdOtOnXQHXC
 C6o0JDsW9NekeKrJMDKrP+Ko2YFXy33wZlg5KJ47wckgTu6gIyy4/ysRTnxbBDKQaSEt
 sE6BIoGrPu4c1hF9ee3AGG5JI8FsYqOqOkKROzO59+3509R1ReFbWlsxjfrOccWZ6cA4
 XhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693766779; x=1694371579;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VQ/W1vAuvct0eQaNfV42dDs6Is2Bz/K+5cHGfVn4Nlg=;
 b=UcJ8feBDIBxbZsbwb8N1rWXkKV/sWVBymOSAXQggo3h/m13qW1jDpJBtJlTSJsyPOD
 UPS9cLHkI8pusk1OHqvM525a7ctBRvtGhijGd7/eC70i/6/Jkswi9tIBv4Bxo53f1R+C
 NPodn1+ztIFqbk01Brhsmp0o9+CM4JXnJNXdTe7yORn6ItmZBackov06uL/exDIWXB8s
 vRvAk0J0ltCO6f54LM1tcOZLKi77RODrgGfs8sodAo1BhK3ROdnoy2ExW6U4vvdRVYzG
 UZ/NHzssqJWj4qcedhX6pS+A+q1OwQgvITdJuyDB27XzVESngxt7K3Gbj0TyufZRanWs
 j1Pw==
X-Gm-Message-State: AOJu0YybP5G9P/m501qzML4kbdKD3NFh3MimyWznggXPbriBj3WSSoCD
 36VWrZGeBx1u+/yJUgx8734=
X-Google-Smtp-Source: AGHT+IG0oYogHO+wAh1Qc2b0RpBbRi8d3sGxNY89NwIzDxZvPXy3apKKIsYkF1LHmvM+09NoaEvKYw==
X-Received: by 2002:a05:6e02:184e:b0:34d:ecbb:9cc4 with SMTP id
 b14-20020a056e02184e00b0034decbb9cc4mr10979635ilv.3.1693766779453; 
 Sun, 03 Sep 2023 11:46:19 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 u9-20020a02cb89000000b0042b37dda71asm2519968jap.136.2023.09.03.11.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 11:46:19 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 4/6] drm_dbg: add trailing newlines to msgs
Date: Sun,  3 Sep 2023 12:46:01 -0600
Message-ID: <20230903184607.272198-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230903184607.272198-1-jim.cromie@gmail.com>
References: <20230903184607.272198-1-jim.cromie@gmail.com>
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
Cc: freedreno@lists.freedesktop.org, jani.nikula@intel.com,
 daniel.vetter@ffwll.ch, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 seanpaul@chromium.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

By at least strong convention, a print-buffer's trailing newline says
"message complete, send it".  The exception (no TNL, followed by a call
to pr_cont) proves the general rule.

Most DRM.debug calls already comport with this: 207 DRM_DEV_DEBUG,
1288 drm_dbg.  Clean up the remainders, in maintainer sized chunks.

No functional changes.

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

