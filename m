Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECC07DACF3
	for <lists+dri-devel@lfdr.de>; Sun, 29 Oct 2023 16:08:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE52B10E177;
	Sun, 29 Oct 2023 15:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA2510E177;
 Sun, 29 Oct 2023 15:07:52 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6b6f4c118b7so3319438b3a.0; 
 Sun, 29 Oct 2023 08:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698592071; x=1699196871; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lt1yPiSudbjGWZyU7fD8DRkiWRaUYJwJXas2ZsoVM40=;
 b=irgRpxfhkWr4psPOn9PGYjdbsJXvBG5zUf/3S1Q7zmPDo1/3vkhBiVS0TbvAVGj6hR
 wVEN31JRlsffoHfTFon8PfQSERcbk5ak8dOAtQ9CO377FFj0dp+cGY2/k0RloyFmRhoM
 g8CtzdnfrcdShsjXGGNBbMvUJeDLA0SJ1xLMiCKeArTg3jsjYe7966TpwUb4OOjSMu03
 voPgFaFlrfl7eHU0spwiTQ4n0C2kXb/TxfeJwvIiu0llKL+c3NT1QiJyY466hWPAgCE7
 fSB55WvF1N8uGntJO4nS1PfF5FFw0B74jry4BbKVpWnQMGYXyjReOVlOAP6LbMUvDSd+
 8bpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698592071; x=1699196871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lt1yPiSudbjGWZyU7fD8DRkiWRaUYJwJXas2ZsoVM40=;
 b=DcTAMAIofTuP5VfiaBW1efdNA0O2ZT0H7gcs+5Tf1+fAyGmSCFovmmmhljcBQSjEKC
 KexkjqWKB676Li7mqWG8Ldepbhy0XA01oVfK4vNarx+p0ctfZV3ITDvmqBilI4ASGR3b
 ekTXattCeeac5qBRoBBl9kQCuFru9qcFqqnjHC/NhE1bGVQrvK5K8qHylqV9pXZdsUP7
 0F+o+2nqx+S+wxWv5BTGw1SClhCbsLi+ubkTkCvef3m5wvOzrIBcCF3Im4bnuZSCWzEJ
 YqsWAap5N2qs+/AcIZWw8lmGM8B6iN/UfCCesI2HeXsS22Dlg7GQe1PRYLDe1o6pBjHq
 wSjg==
X-Gm-Message-State: AOJu0YxzOammMYvspJHY9LY08HkxpCROGRUW04HY2fMOWHJMg/Soxlx/
 lMJVh7tCZk4MEoyfjUUEXDN8Vwdaw1g=
X-Google-Smtp-Source: AGHT+IGCMUKh34gT5nl8CUjZ566Kd2FRN3OEZw5HRLc+unyF38DiiGuQSIWjSbXNTAFuqoOsPqb+tA==
X-Received: by 2002:a05:6a21:7985:b0:159:b7ba:74bd with SMTP id
 bh5-20020a056a21798500b00159b7ba74bdmr5750825pzc.50.1698592071558; 
 Sun, 29 Oct 2023 08:07:51 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a637f56000000b005b8ea15c338sm3466302pgn.62.2023.10.29.08.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Oct 2023 08:07:50 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/msm: Small uabi fixes
Date: Sun, 29 Oct 2023 08:07:37 -0700
Message-ID: <20231029150740.6434-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027194537.408922-1-robdclark@gmail.com>
References: <20231027194537.408922-1-robdclark@gmail.com>
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

