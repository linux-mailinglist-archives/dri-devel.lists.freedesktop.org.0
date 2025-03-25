Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 015EFA70C50
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 22:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B2110E602;
	Tue, 25 Mar 2025 21:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KzVbj+fk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2DF910E028;
 Tue, 25 Mar 2025 21:05:58 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-476a1acf61eso56463781cf.1; 
 Tue, 25 Mar 2025 14:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742936756; x=1743541556; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FsZUEX6wOy6oNbIIbrt2jTVI/9CJN/g654c1cd4p7VQ=;
 b=KzVbj+fk0bfEytMeRmu83mzoqHw2nAhJkz0fVNqCnCmCGXTT14eFE/8wQTXGrRczr/
 pPoLCMu26SqeIgw1TFfxp7THtPuKuNpkC9j28Q8xww/jBbSy2HE5aq3GGDpXaME2ZKX0
 hrgkjp0AdDWEFL8ndswy2vZ/2um4VAgHhWcHvdA0xUB67uRi79ZptGNnVheOaTdYGgoG
 k/mYEzSFCcA83tudKAttgtG2qiuKsKWWaIIjl4eIf2BBuuVLsa483Bkwp2QgeWOIYEt1
 vtuOa+Lx7BL/0WYSuAzHpHtPWEhYAFALU9pdvmaywVYANm8qov7OpqluF0VYKy/3etV6
 cReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742936756; x=1743541556;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FsZUEX6wOy6oNbIIbrt2jTVI/9CJN/g654c1cd4p7VQ=;
 b=GVfEAlC6BQpBGpX0BhNQV0znx/PQNfLG4AinHiIBR3K8o+nUHa2zepXZPU78JlNTcd
 fOhXmzF+U15bNc0F09wFuCr/5CAYQaFOrFY0zO3AfIxFlzY8nvR19VT4Ba038K5ncVCf
 2CLSNXUKVEYFYfFZiALYiDrXRKOyg199NVOuMy9v13dNuORpImBiFt6qM4JWiTECFmhd
 nIgg0fZ0slGDZ+VDFrgR6kFbmdpBOXQo8sToPoIquPEZ6BzyWbPE0kXpHAuDstF7TMqE
 rtAl4p+PxNwOCbr0pG0fuJqyD60lLguIQt40SNVhlIRaHivRLDVnA1CdwWWjwvIINilF
 O50Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2N1m0ly+jgBXyouI6mDR5cHjVOKP03yjUuqpbq62MxQmTkfm3Ds8k1EyZ/jgFZ/sUSZnAYo+G@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzjuwQv6qim4DBBHh4i2KuGofxo3rYcaGNod4zH7BgJ0CDHf7F
 1w96dspofuJ1XBVeLX3L8Ar2x6G9yJK04TTOKtWJyrHmiEltibG04fPYauEFBEo=
X-Gm-Gg: ASbGncu5kEf/MotIYQjPGbJvwPYJJ5/qUrWCnO93ilqyf5X+0en0CWmUEovmOrXGUsw
 azUZrZpnliTTT+7TS8YUivMlyDtxwscKIesJrsTs8xnsOo4vLMjsidX5/WxFxAKTlT5x2+7a3zf
 C8/9tquh21WQwRxuazYgTsQY2Q6sTWICrig0ZBKov+3YTg222/idTs6X+cRqyIu6e03dxv30I8j
 LkawzHrP6yK7HdszqRCwSJSpZCYERn/Hh6dBw1EQ66U0SKVDcmhbH/p15JT99IBCMQmro+kKLWh
 65N8kuPS/bP+ecXasAcTn7dSGX4m9T1s0C9yLYmvv6gOIFm8gBdk0oCWinH5gm2gAQ9WHSgnGKu
 Fhp1N3anSIFjsFubp548=
X-Google-Smtp-Source: AGHT+IFpyLimJwylrCJjqs6ZcD29FiNH3Oc74veEai7LzC7yBUf1JyPuGEmZ9XzojoxaLSq9jn8TIw==
X-Received: by 2002:a05:622a:4c8a:b0:476:838c:b0ce with SMTP id
 d75a77b69052e-4771dd779eemr396540701cf.13.1742936755874; 
 Tue, 25 Mar 2025 14:05:55 -0700 (PDT)
Received: from localhost.localdomain (c-68-55-107-1.hsd1.mi.comcast.net.
 [68.55.107.1]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4771d51ffb4sm63484481cf.53.2025.03.25.14.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 14:05:55 -0700 (PDT)
From: Brady Norander <bradynorander@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, sunil.khatri@amd.com, boyuan.zhang@amd.com,
 Brady Norander <bradynorander@gmail.com>
Subject: [PATCH] drm/amdgpu: use static ids for ACP platform devs
Date: Tue, 25 Mar 2025 17:05:17 -0400
Message-ID: <20250325210517.2097188-1-bradynorander@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 25 Mar 2025 21:44:45 +0000
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

mfd_add_hotplug_devices() assigns child platform devices with
PLATFORM_DEVID_AUTO, but the ACP machine drivers expect the platform
device names to never change. Use mfd_add_devices() instead and give
each cell a unique id.

Signed-off-by: Brady Norander <bradynorander@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
index deb0785350e8..9c657637d317 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
@@ -302,17 +302,19 @@ static int acp_hw_init(struct amdgpu_ip_block *ip_block)
 		adev->acp.acp_res[2].end = adev->acp.acp_res[2].start;
 
 		adev->acp.acp_cell[0].name = "acp_audio_dma";
+		adev->acp.acp_cell[0].id = 0;
 		adev->acp.acp_cell[0].num_resources = 3;
 		adev->acp.acp_cell[0].resources = &adev->acp.acp_res[0];
 		adev->acp.acp_cell[0].platform_data = &adev->asic_type;
 		adev->acp.acp_cell[0].pdata_size = sizeof(adev->asic_type);
 
 		adev->acp.acp_cell[1].name = "designware-i2s";
+		adev->acp.acp_cell[1].id = 1;
 		adev->acp.acp_cell[1].num_resources = 1;
 		adev->acp.acp_cell[1].resources = &adev->acp.acp_res[1];
 		adev->acp.acp_cell[1].platform_data = &i2s_pdata[0];
 		adev->acp.acp_cell[1].pdata_size = sizeof(struct i2s_platform_data);
-		r = mfd_add_hotplug_devices(adev->acp.parent, adev->acp.acp_cell, 2);
+		r = mfd_add_devices(adev->acp.parent, 0, adev->acp.acp_cell, 2, NULL, 0, NULL);
 		if (r)
 			goto failure;
 		r = device_for_each_child(adev->acp.parent, &adev->acp.acp_genpd->gpd,
@@ -410,30 +412,34 @@ static int acp_hw_init(struct amdgpu_ip_block *ip_block)
 		adev->acp.acp_res[4].end = adev->acp.acp_res[4].start;
 
 		adev->acp.acp_cell[0].name = "acp_audio_dma";
+		adev->acp.acp_cell[0].id = 0;
 		adev->acp.acp_cell[0].num_resources = 5;
 		adev->acp.acp_cell[0].resources = &adev->acp.acp_res[0];
 		adev->acp.acp_cell[0].platform_data = &adev->asic_type;
 		adev->acp.acp_cell[0].pdata_size = sizeof(adev->asic_type);
 
 		adev->acp.acp_cell[1].name = "designware-i2s";
+		adev->acp.acp_cell[1].id = 1;
 		adev->acp.acp_cell[1].num_resources = 1;
 		adev->acp.acp_cell[1].resources = &adev->acp.acp_res[1];
 		adev->acp.acp_cell[1].platform_data = &i2s_pdata[0];
 		adev->acp.acp_cell[1].pdata_size = sizeof(struct i2s_platform_data);
 
 		adev->acp.acp_cell[2].name = "designware-i2s";
+		adev->acp.acp_cell[2].id = 2;
 		adev->acp.acp_cell[2].num_resources = 1;
 		adev->acp.acp_cell[2].resources = &adev->acp.acp_res[2];
 		adev->acp.acp_cell[2].platform_data = &i2s_pdata[1];
 		adev->acp.acp_cell[2].pdata_size = sizeof(struct i2s_platform_data);
 
 		adev->acp.acp_cell[3].name = "designware-i2s";
+		adev->acp.acp_cell[3].id = 3;
 		adev->acp.acp_cell[3].num_resources = 1;
 		adev->acp.acp_cell[3].resources = &adev->acp.acp_res[3];
 		adev->acp.acp_cell[3].platform_data = &i2s_pdata[2];
 		adev->acp.acp_cell[3].pdata_size = sizeof(struct i2s_platform_data);
 
-		r = mfd_add_hotplug_devices(adev->acp.parent, adev->acp.acp_cell, ACP_DEVS);
+		r = mfd_add_devices(adev->acp.parent, 0, adev->acp.acp_cell, ACP_DEVS, NULL, 0, NULL);
 		if (r)
 			goto failure;
 
-- 
2.48.1

