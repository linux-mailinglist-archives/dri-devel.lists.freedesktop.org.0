Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED973912B5
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4972E6EC33;
	Wed, 26 May 2021 08:47:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC216EC32
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:47:34 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id q5so214169wrs.4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h62MLZglSk0AGZD9SfFQbGL1zDMVzymMNWcO9Y1i7ro=;
 b=c+dra2tqymbByrR6z2HiTHLfe9C2WgmOkQAwerg+mh5Ku0VofhpS6ze9r0mRMdT1pk
 YPNN+MYXY5re7Ot54h7F2ty2q32Sv75cj5GX/2/udd1GJAjJTOgt+3/dSe/MLXPMWPl2
 79kgXxCnDF5ZKW1dH0L/lEg9OFx06n3g+u+YjgGfwVTnYE5aIkCM/BJekPtCJwt7TJFf
 UKK+hgv0O3YfuIdIFq4/zxCy+xAxUwKGRUNce7rYim6Bq3v5nE5e594ckrg9YD4zogQb
 8pFVbMQwj1XN42ZhS9sIPolY4RYcrLfJBsZ5HNutOaZhToK4wA5Gj/BH3hoTn+nGoQcd
 g6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h62MLZglSk0AGZD9SfFQbGL1zDMVzymMNWcO9Y1i7ro=;
 b=JcBe8m7/XYSULPs0WNm6Q8yNVUEHs1pXKdpFoOlQzZ9WEkEyctS2AiRE4G1gWN5KCP
 G9iP5iAmVFNiAT46hfRMieMW3vsWJeIL+URdM2m9tNT/r5g8XKvv/pxmOr2KUATpQ0Xe
 aIqTRSj6IvwgeMZnKx/2q1U2wAewMZkq3r8ME62CfxzMYKore6sIt203CY8eP2xWY8YE
 l4f5PjheqPTBsfSL6MUK6/J6fHHQMlAqM8GeiQ2XRgdQjO6wkVbYOOzaKM19BkaqNOxI
 QSlSaGS0Dh5XjJCHlVl7mas/GkjGwS/5GKLW91ktao2h/RmFd+dtK6jpo3DhVIYHh9Vv
 NmVA==
X-Gm-Message-State: AOAM532/OvZOfw931b63o0W05TXfzcjH8KPl24ZNl9o/QNBMqTlNfELd
 fehcTBnpj076Al+XLiXSe/JglQ==
X-Google-Smtp-Source: ABdhPJw+uQTXVXFfDBd2HbpSytC1GfBuCnOmnN40kPlHJDAiFY1wY/yMqneN9R+wdvUhT7IzjT+Vfg==
X-Received: by 2002:a5d:4ccc:: with SMTP id c12mr31780393wrt.137.1622018852634; 
 Wed, 26 May 2021 01:47:32 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:47:32 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 02/34] drm/amd/pm/swsmu/smu13/aldebaran_ppt: Remove unused
 variable 'ret'
Date: Wed, 26 May 2021 09:46:54 +0100
Message-Id: <20210526084726.552052-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526084726.552052-1-lee.jones@linaro.org>
References: <20210526084726.552052-1-lee.jones@linaro.org>
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/aldebaran_ppt.c: In function ‘aldebaran_is_dpm_running’:
 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/aldebaran_ppt.c:1260:6: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
index d6ce665baaf3b..d077e211017a9 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
@@ -1368,10 +1368,9 @@ static int aldebaran_usr_edit_dpm_table(struct smu_context *smu, enum PP_OD_DPM_
 
 static bool aldebaran_is_dpm_running(struct smu_context *smu)
 {
-	int ret = 0;
 	uint32_t feature_mask[2];
 	unsigned long feature_enabled;
-	ret = smu_cmn_get_enabled_mask(smu, feature_mask, 2);
+	smu_cmn_get_enabled_mask(smu, feature_mask, 2);
 	feature_enabled = (unsigned long)((uint64_t)feature_mask[0] |
 					  ((uint64_t)feature_mask[1] << 32));
 	return !!(feature_enabled & SMC_DPM_FEATURE);
-- 
2.31.1

