Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB4038AD79
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA44B6F447;
	Thu, 20 May 2021 12:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746F66F405
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:03:42 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso5254868wmh.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6mgshcP2pz5KQTmITqtWPb+8Vos4vgRG6+nB+UjzMjU=;
 b=tUt9PCzCAgYSzeHm+P1Ghip4HpN8YnHaAQec9JZBmLu/UiSm3dqz+0Eq4AUl1JeewR
 GPJihct9FOVQk7MB2BFf56q8fgx85aYR1AVv4Qb6uC8h6Ig9DVcUY7MNDzmrmoDmnIVb
 b/aDxqtCCaItHxQN4Vue6SffHLJ7GJRadEFaztJ5Q8avyChaDNrAD+Ve16oA+kOl3BzC
 I4cIFXOmH4nMVxIsG+Ishev7ik97tI0aY9qluBFyK3K2uGqRy9bxMoPdkvr2l4hkolMs
 M8aDaXX0uZ1vnu1y9mtQxAFhZKb3Dmtkr/iNiF1oT3caN0gj4X66CvQgpZcatQCGQTDQ
 Ig2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6mgshcP2pz5KQTmITqtWPb+8Vos4vgRG6+nB+UjzMjU=;
 b=JOBpjW501ewAQcuAWfPtrAyIh74lCUT9vudi3ZzFf60lBXDlcw+EShhqm/Oj9qCTRd
 UPJAOg0kmkyelIzK/cliSvJTctsAxaLP4ezDMtEieoIUa6kRzzlHQ6KH+fPuZrT+hJ58
 O8mtTyB26bmpUnxmAmrWJyN9mrL5gXDKExHpGtn11n5Pxhu2r7UU1SKuucJXx6cyGTqf
 aIgNwmTaVYTq10iZCs4a44rDshvWx8YGCuh5CxMJLNWHNBhMrBxXPdKkv9qpOjdSU7+J
 9cJtihvEEEnaazHbrWBJ/caDGCHuGIUUUR7GIrNFLxKTjHcetTTIZXYoGrB3QKZPM96I
 vFpw==
X-Gm-Message-State: AOAM530xBcdUuYxj8/XSdtRftcz6u2zIiQfce1TwVc/UaKdEB6zBgo7M
 T4OA/DtoqR+pupL+/jw+1DV+Sw==
X-Google-Smtp-Source: ABdhPJy7Digd+9bRZbHP/CdiStM7jlSFRh4jCbRvATVAcPCDbZlUSdF/nEVi4DaSTU2nAfXjcoZCBQ==
X-Received: by 2002:a05:600c:2054:: with SMTP id
 p20mr3758231wmg.165.1621512221171; 
 Thu, 20 May 2021 05:03:41 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:03:40 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 38/38] drm/amd/amdgpu/smuio_v13_0: Realign
 'smuio_v13_0_is_host_gpu_xgmi_supported()' header
Date: Thu, 20 May 2021 13:02:48 +0100
Message-Id: <20210520120248.3464013-39-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/smuio_v13_0.c:99: warning: expecting prototype for smuio_v13_0_supports_host_gpu_xgmi(). Prototype was for smuio_v13_0_is_host_gpu_xgmi_supported() instead

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/smuio_v13_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/smuio_v13_0.c b/drivers/gpu/drm/amd/amdgpu/smuio_v13_0.c
index 3c47c94846d6d..39b7c206770f6 100644
--- a/drivers/gpu/drm/amd/amdgpu/smuio_v13_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/smuio_v13_0.c
@@ -106,7 +106,7 @@ static u32 smuio_v13_0_get_socket_id(struct amdgpu_device *adev)
 }
 
 /**
- * smuio_v13_0_supports_host_gpu_xgmi - detect xgmi interface between cpu and gpu/s.
+ * smuio_v13_0_is_host_gpu_xgmi_supported - detect xgmi interface between cpu and gpu/s.
  *
  * @adev: amdgpu device pointer
  *
-- 
2.31.1

