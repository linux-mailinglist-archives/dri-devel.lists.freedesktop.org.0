Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA01923A8F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 11:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087F710E599;
	Tue,  2 Jul 2024 09:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Bjih1vuk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7AB10E591
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 09:48:56 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2ebed33cb65so43037651fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2024 02:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719913735; x=1720518535; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=grKYh+BySNj5dd16DxXRdwU80BL8FOK+kLgksXgznTg=;
 b=Bjih1vukAyVx50HcJBIJLW/wzZMdUi7HVC1AdK89rpW96FNMgPpBGx0S8QU+Km+N89
 7zRESZ9gYmegGv49a8+LsBSbqb91v5ZRzzLe3Ys3Rw2AbmUes+nhNHv1YwjDGfsUe+3+
 OdUenIlzdU4uGQYSUjUJ5+4VMY0xuOchb+c5rT0hrksAsm4zgmNbeC872LaMIp/sm1bc
 AXm8/f2tsDX1gnQpsJChb+otAeWgVOonBKOu9U/Co1U8uNGaJftir7zTFPBhVyQJ7AAO
 uh7Vak9EVuCRys5VFkVlXr7aOw7VlJKD3Rlr07eXfKv7J0epJQBtamUhvTzn/Uzis3Hm
 3F3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719913735; x=1720518535;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=grKYh+BySNj5dd16DxXRdwU80BL8FOK+kLgksXgznTg=;
 b=cGR8YolrgFBXx7jOkaz0gYP2k7eKE7h/8yCZFA3yIT+rhcR71x7NUYowQLOiC6m+EU
 sqeRq47FKNnjztYEO06sL7cSRYQ19SvK+dX4G5Dz4Hxy/McVSon3zDzM+JWAokDVOtdN
 y7szVfaPP5TNAd8icaJdeB7k/blzQwYeSZgn5hTGrnjOvSaLqbMiyQHCnF9bRiSRwdWi
 qT/mF3uDQPVdiwdGnMW39h2SCELfyQnnWuCm1YX2uVDvT6CH8VJ5lH3esXNy16lOyecB
 s1TQCPiqqR1O+xQWr7J3IpIxMgKttx2JY+Afjxyk5qkbAQ9UEz11BckzbUVQxiBuwWQJ
 AH3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXi2NNuBGQsgqVrCrzYGybjNR3dho8VHWvxnHnVXY5AGQCuDLkTAyWSwTDpmcI1UZ7J5LGGSrWdfzR2vAMByzHgPctjJlPemJy9zynB98iQ
X-Gm-Message-State: AOJu0YzDTsF7Ts7DzU/+epCAEr2sTkqGuGY33dbhbrxai8zvmB47J8/v
 Z5mN5pdB16abHgZapa3zimQUNl3rF36DR1BJSDbb08GlDM3+h4tJr2UoVMUGT1Y=
X-Google-Smtp-Source: AGHT+IEHYPqBRlSa4/s9XNTLhrSpJ2d7hL4YRvX3igF6c2N0POyPLUNHv3ogsHuGow9fTT7WHEO5lg==
X-Received: by 2002:a2e:a9a8:0:b0:2ee:4c66:6828 with SMTP id
 38308e7fff4ca-2ee5e4bb786mr66677251fa.24.1719913734882; 
 Tue, 02 Jul 2024 02:48:54 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee5160e333sm16231161fa.5.2024.07.02.02.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 02:48:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 02 Jul 2024 12:48:52 +0300
Subject: [PATCH v3 1/4] drm/drm_property: require DRM_MODE_PROP_IMMUTABLE
 for single-value props
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240702-drm-bridge-connector-fix-hdmi-reset-v3-1-12b0e3124ca4@linaro.org>
References: <20240702-drm-bridge-connector-fix-hdmi-reset-v3-0-12b0e3124ca4@linaro.org>
In-Reply-To: <20240702-drm-bridge-connector-fix-hdmi-reset-v3-0-12b0e3124ca4@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1072;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ZHzhL2qDJx6VCsIqQPH6DPvSD0dOn8r7tcbnzboUaz4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmg80EWZj1pah8UzMX2/G4UNqFRNqb0JlRO93Ms
 RRkSO6Hv/KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZoPNBAAKCRCLPIo+Aiko
 1Q1+CACxdDwVSgOIcrD5yaAYfHuWsZQlYwFDxYyvGJAOp18OWx0WYgryw6qDB4Kv6Am94YL8chA
 rzWgZDP7Fh4hmHGMQfPYqu5jd3h2jA45NJamjWWdXMWmVzFsrHBIlr/MqN4K+c1mcW8qAPM4Aut
 LQkdGUHQ936Kwhec384brroKfge+MO1h9dgB7wxbVvnPQapQTOibV0b3aISdjN8fkI/SBR5WEKE
 61amWsXJ1hCW3zNZuGyFOepos7d/6vkL4gaCQ3svBPeNQPYHOxjH2EpaiW3Nmeh+x2C0+GhnVEV
 a/WFgjPVG7wSHgFk78J3uoewD+jjE5VNy14bP8PoznvUJzhS
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Document that DRM_MODE_PROP_IMMUTABLE must be set for the properties
that are immutable by definition - e.g. ranges with min == max or enums
with a single value. This matches the behaviour of the IGT tests, see
kms_properties.c / validate_range_prop(), validate_enum_prop(),
validate_bitmask_prop().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/drm/drm_property.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm/drm_property.h b/include/drm/drm_property.h
index 082f29156b3e..7d0f793f50ca 100644
--- a/include/drm/drm_property.h
+++ b/include/drm/drm_property.h
@@ -162,6 +162,9 @@ struct drm_property {
 	 *     userspace, e.g. the EDID, or the connector path property on DP
 	 *     MST sinks. Kernel can update the value of an immutable property
 	 *     by calling drm_object_property_set_value().
+	 *     This flag should be set for all properties that have only a
+	 *     single value (e.g. min == max or if enum has only a single
+	 *     value).
 	 */
 	uint32_t flags;
 

-- 
2.39.2

