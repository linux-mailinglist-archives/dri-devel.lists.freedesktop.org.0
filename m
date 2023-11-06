Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3867E2C54
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 19:50:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2776C10E3C7;
	Mon,  6 Nov 2023 18:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76BD010E3C6;
 Mon,  6 Nov 2023 18:50:35 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-5bd5809f63aso1492287a12.3; 
 Mon, 06 Nov 2023 10:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699296634; x=1699901434; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BbZHoFm5w89rbvcHzOI1Y29sJ52jYRELVKrydv1YshI=;
 b=T2aQn+/Jnbsm8WeXCSWOZry+1UzmYD+QgoqYgI1rZjs0vLIjUGhybHDcJCBe1PIzkC
 6vakm4mW7/1rfEGZv35HYxg48tU/TyxsTk6b7mo+XYpb+oxlt2CPnodd+hOyb53dzpil
 MmOXnouRxUIYdKeesyUk+qne/IHQPU9VP9KrjdZL5rFZTl4oAaSWmQ+vPAZVWRvbkjNQ
 yr0iLsRP8aRxz7d7W168mGWjPqZH8BKPWj0JP8q6QWsj/fmFtQzhSZEwog0eq0eilohn
 NphoHFK76Wh4V3tNe7m9UhIJzjWXnpe9lKqOqBI73mFIjpDrisRU6EPN/dy7NOu7SRHe
 8Haw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699296634; x=1699901434;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BbZHoFm5w89rbvcHzOI1Y29sJ52jYRELVKrydv1YshI=;
 b=Tg+vlntEU69lDao0VCKJm6xIYUx29xipTui2G1/btCT2IxlNVl5VoRHuzrpRGwW9Hb
 RCLniBxmgIkxxhbUXTOuQIFDAk0W1D5zxrvXruYVKbHsOp6Xuf14SHX3zfdSKNI36TRC
 7OxRiX+JWPLPVT/S0UkTIYVfkrMQJjvlkMhKM9KJL0DkLDU/29kxQ28XHghmfjQgpZ+9
 CPRTwHvg+mZ1X7KlFyNl1EvQx3y0pE/OELtpZ4nibgan2BmqoHn3Y2n1wdRGiSy5yrIM
 nBtAOYncDzrcOnTuR9V5efypRpNj4EF2hUYr1Cz1sWEMP7ylv/ijNHAtpw+8lzSS/MCi
 AIig==
X-Gm-Message-State: AOJu0YxDeWn9t7bknqVoxg0eO+Z1vOCMraWex766ay/RDBmFTEEv+W68
 fL3L6FCZsEO0AuGAqSA6309vCOx/Z5w=
X-Google-Smtp-Source: AGHT+IGhsd7dKnKkuP0PyCYSzmh3qYPVdS4aj7RxgdNyj2BgmC5mHgkGjpDmgh5vEvP9lnB6WmWyGQ==
X-Received: by 2002:a05:6a20:938b:b0:15a:bf8:7dfc with SMTP id
 x11-20020a056a20938b00b0015a0bf87dfcmr28118461pzh.15.1699296633944; 
 Mon, 06 Nov 2023 10:50:33 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 v28-20020a63465c000000b0059cc2f1b7basm107405pgk.11.2023.11.06.10.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 10:50:33 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/2] drm/msm: Small uabi fixes
Date: Mon,  6 Nov 2023 10:50:25 -0800
Message-ID: <20231106185028.209462-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106185028.209462-1-robdclark@gmail.com>
References: <20231106185028.209462-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Correct the minor version exposed and error return value for
MSM_INFO_GET_NAME.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 4bd028fa7500..781db689fb16 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -51,7 +51,7 @@
  * - 1.11.0 - Add wait boost (MSM_WAIT_FENCE_BOOST, MSM_PREP_BOOST)
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	10
+#define MSM_VERSION_MINOR	11
 #define MSM_VERSION_PATCHLEVEL	0
 
 static void msm_deinit_vram(struct drm_device *ddev);
@@ -896,7 +896,7 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
 		break;
 	case MSM_INFO_GET_NAME:
 		if (args->value && (args->len < strlen(msm_obj->name))) {
-			ret = -EINVAL;
+			ret = -ETOOSMALL;
 			break;
 		}
 		args->len = strlen(msm_obj->name);
-- 
2.41.0

