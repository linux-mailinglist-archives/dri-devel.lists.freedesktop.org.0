Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D14882C041C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 12:20:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F04289EA6;
	Mon, 23 Nov 2020 11:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7672C89D4F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 11:19:51 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k2so18248181wrx.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 03:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5/zamWA9w0pOX2DctOX3yJEbpsZvbeKEF08oXx4R0JI=;
 b=OuMa9UaWIFPj86BbHXSs73Xo1Pusn+Lxmxt+3cAZmcGB5PQm7gFVsRy18MW3/CEdGv
 iiA7WZtPwOLtaRQDjnprrZephkR0OYEKOS7XhRvpvIUztFc15DlQ/HmBW27rHUvUGZ84
 xhQ13Jr83ctPTHNSZ2le8pTffof04hJ1dSgQKDsytfWNIgDhfi0BPTGwBEzBStmbG3Ia
 R0VKK2mdmfJ8jgYuljfIm3fX7cqTJkCg99LNM7I+2GAi5zHL7r+58DG3PHKZAxzEz//C
 TbiL/JlgCJ172UmD3iTorkzYwpyYtsN6u5GIdRGXQsxUYjYAfQjetzPTotyFYsdi71hQ
 9tww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5/zamWA9w0pOX2DctOX3yJEbpsZvbeKEF08oXx4R0JI=;
 b=iVqF6fIYtuDfJTJlNzSNHVqqnSFolpQiFSxaERuICQc0atAkVsf0HHhAeScqPXMGBF
 utUBiZupnjlsI8VNZh1oK2MuydEUMa3oAYUCeCnsjA2hLki77zI2Dn1OguSJzhqkB+/A
 I/ZWFjiI0KYfh6H7ALL5UW4iPIH4xL0rekKq4dbLFComfhG24r2lvrfkCQ7IIMz8B44S
 q6id9Kg1S7080SqX4arf5v4Dgdrs/s6I5DONp7uXWOa5uf28fFBlz+DYwCTUdb8ghAul
 1Mp5CQRfX3dgUmfVlJtGmAmIr/6ksHWgYjPeWCDOu8SZ9RYzucAYmRfGsH2iT1C7UGl+
 LWeA==
X-Gm-Message-State: AOAM533eNkeCakznRE0CP2caDpLPiHAOOdAMGS3iMHW1xT6Ee2NC5anB
 dQ+WDhhfIUyno6rrKf6/9VSI/A==
X-Google-Smtp-Source: ABdhPJygg5mGjWKEpUGK18y+BwQVZ6dGUYGr/KB94FrRZQtceWE1L+PTGjoAE/gZYYVeSTSbikPGAQ==
X-Received: by 2002:adf:fec6:: with SMTP id q6mr30804236wrs.168.1606130386916; 
 Mon, 23 Nov 2020 03:19:46 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:19:46 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 19/40] drm/msm/disp/dpu1/dpu_hw_lm: Fix misnaming of parameter
 'ctx'
Date: Mon, 23 Nov 2020 11:18:58 +0000
Message-Id: <20201123111919.233376-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c:55: warning: Function parameter or member 'ctx' not described in '_stage_offset'
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c:55: warning: Excess function parameter 'c' description in '_stage_offset'

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 4b8baf71423f2..6ac0b5a0e0573 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -48,7 +48,7 @@ static const struct dpu_lm_cfg *_lm_offset(enum dpu_lm mixer,
 /**
  * _stage_offset(): returns the relative offset of the blend registers
  * for the stage to be setup
- * @c:     mixer ctx contains the mixer to be programmed
+ * @ctx:     mixer ctx contains the mixer to be programmed
  * @stage: stage index to setup
  */
 static inline int _stage_offset(struct dpu_hw_mixer *ctx, enum dpu_stage stage)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
