Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F9B7E9AE8
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 12:24:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945DA10E347;
	Mon, 13 Nov 2023 11:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5DB10E08A;
 Mon, 13 Nov 2023 11:24:05 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2c72e275d96so58624311fa.2; 
 Mon, 13 Nov 2023 03:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699874644; x=1700479444; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3o3s7Gg19og8FHPmLJsossp9CoxmOk03jVqJSNlvYEE=;
 b=IZrU5OVhXfKJFXAOnk970ALcy+jkE1mU16CREasU4tdtcbYcbmJZ+egUn2cIms/8AK
 tGCik8l/gFb+BTEVEAXQLQXdorAGKfaWU4j0Vo4X1EZ6kZb/ZdikRf4J9rBE56WSgCmz
 OeF0XAGPc0eGs7mEfzGGN8dAlGdabGr/K23HsLMsJF39PZy0/983AThq2s0pmKTxZXrz
 2W4zzlCvBoDckLcFMH4yCdgBltdFAyfKDGR6zpPrLDWjwNhzDr1CKPoZLOgfEPmeJObV
 DMvIaNsFGrcl9cYCULut3HIiC+xpBCLh9mhTZWyq02Y6ET7ULkHaCXgvHStIX/f0Ibpq
 cbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699874644; x=1700479444;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3o3s7Gg19og8FHPmLJsossp9CoxmOk03jVqJSNlvYEE=;
 b=qMi/kHErPh4AToCwAGf8ygRka4S7d29FUz6M8OF7FVqwN2w+HNX7MUUXbkP/ajpDv+
 fJ7Wr5wWIJOWnE4gOM2hXwf6jUe3P7T5UqdcZxi1awZJLudhbFi3Q7TfP4bB+Kl28UvU
 e4L0tyONEe2tYh0BWPzNtMw2zfZGrdO2uNjqcWHsWWblxUx3QLI+CoOSdmiWpo1708pK
 Wmljpq2ySnn0ySqXLwCBGtn20WoKl+zw9pIaUgnLUnM+IoupMx9SuQu5QOsTB5sJsYGt
 FZUjTLPZVINz6Iz6NVZMyM0ZCVxDSQm8zuGJCs1EBAbeJ80z6qWCBGyH5VA2SKTtrENw
 KRIQ==
X-Gm-Message-State: AOJu0Yz+qaahqxy+yagL6X0h40rPHZy8VNjv/M8hjfXTLQpbf2a8KpiR
 tU0ANeySjVK3NfTqP6nsMy0=
X-Google-Smtp-Source: AGHT+IH61A5pPCfNwMBXGGsskBdp/S7K92gc20LeFda5wnWDvVisuAv0N9mZOP0o4Cx1RRVOFVPMyQ==
X-Received: by 2002:a05:651c:102a:b0:2c8:323b:9207 with SMTP id
 w10-20020a05651c102a00b002c8323b9207mr4450710ljm.11.1699874643357; 
 Mon, 13 Nov 2023 03:24:03 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c22-6e16-fe00-2223-08ff-fe18-0310.c22.pool.telefonica.de.
 [2a01:c22:6e16:fe00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a05600c4f1300b0040772138bb7sm13565787wmq.2.2023.11.13.03.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 03:24:03 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH 03/20] drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:
 remove I2C_CLASS_DDC support
Date: Mon, 13 Nov 2023 12:23:27 +0100
Message-ID: <20231113112344.719-4-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231113112344.719-1-hkallweit1@gmail.com>
References: <20231113112344.719-1-hkallweit1@gmail.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 6f99f6754..ae1edc6ab 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7529,7 +7529,6 @@ create_i2c(struct ddc_service *ddc_service,
 	if (!i2c)
 		return NULL;
 	i2c->base.owner = THIS_MODULE;
-	i2c->base.class = I2C_CLASS_DDC;
 	i2c->base.dev.parent = &adev->pdev->dev;
 	i2c->base.algo = &amdgpu_dm_i2c_algo;
 	snprintf(i2c->base.name, sizeof(i2c->base.name), "AMDGPU DM i2c hw bus %d", link_index);

