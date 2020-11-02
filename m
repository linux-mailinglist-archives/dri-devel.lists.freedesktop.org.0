Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7BD2A3E9B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:16:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB256EC36;
	Tue,  3 Nov 2020 08:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABED96E575;
 Mon,  2 Nov 2020 19:34:56 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id u2so1398340pls.10;
 Mon, 02 Nov 2020 11:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=W2TZBx79MZY2MxND9q++iA+/ACw6KEnI7V5Qbdkg/uM=;
 b=doVb0hJkNrB+/a8ihwLG+uAZ2h+jk9iV3Gii8+ElShEy63Mso1mM7ZkUYWc9XFc/cG
 WVncfo7XJiFGPK71/61MNkWKY3wb7vNhCkUmftc4UewUYcHRhkfCQ+ax8gnWRfFQnTbp
 h3qHcVkCZBbPGhAhXgOmsQT/+nVm8V4zgmGcnpP1rK9wStIDd3vJj64NCtpUeiEgUj8B
 MzOtoPXrNeIeRRd5gR9sSHuVvwhTNEOCSDDSvDCKlD7Mn1yBrHOsRpqsVLo06wjwbSQU
 6fcGVi4HILS7EFs2aIKhSn3qBCj+KbAwln+gB8oLRFcQQ2qlCjuAUcXwaAbrGHVxL+sH
 3K2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=W2TZBx79MZY2MxND9q++iA+/ACw6KEnI7V5Qbdkg/uM=;
 b=Wm4LEtcvTKGlTl51PHdxxZENjhr+jaNYKYoKiUpQ42ZegNCM2HoDsHzA4dBURCTBS7
 X8C1jtpzxAg6AbX9TIZVGo4Nns9Yco1mkwqwfnEyA89TvY1fk6Xy/dBJzG8ztOPrtxFV
 tvDGIHrONpa+2/1gDzHV3fa8J3yF7dKW/89PRXohB/8n52xWyeYAjZ9DJy7hEwLisuHS
 HUFlpnV4BVxab8zkXBPFAiWd036xHEb87Ogq7Z2AiawJIs2OkNoyvtGiLaxbDJ+1tz96
 yY2KgofayGRYOzjjgquNOn/2Vjj3IHIfypdMOwVJVuHDhf9elVXi2/J9m5HdH1c69aao
 Ku6A==
X-Gm-Message-State: AOAM533XX4MUSKFsjz9A+Q1PR3OBtrvWv3akD++lXwcm53SeCFpLPV/q
 5HNf3Bi3DqTrJDUT+/lg/0QEWPZdmME=
X-Google-Smtp-Source: ABdhPJzYmHpFiayucqtEFpK2gHFprs7BMo+PHnOhUcbhfS1waqq3rwzS2FRCnIeEF7o9VucN35Uz9g==
X-Received: by 2002:a17:902:b696:b029:d5:cb0b:976f with SMTP id
 c22-20020a170902b696b02900d5cb0b976fmr23250643pls.26.1604345696344; 
 Mon, 02 Nov 2020 11:34:56 -0800 (PST)
Received: from localhost ([160.202.157.3])
 by smtp.gmail.com with ESMTPSA id e5sm293375pjd.0.2020.11.02.11.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 11:34:55 -0800 (PST)
Date: Tue, 3 Nov 2020 01:04:50 +0530
From: Deepak R Varma <mh12gx2825@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] drm/amdgpu/vcn: use "*" adjacent to data name
Message-ID: <6ad41a97d7805124d2e31c70d96c846cf0d21524.1604345594.git.mh12gx2825@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:25 +0000
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
Cc: melissa.srw@gmail.com, gregkh@linuxfoundation.org, mh12gx2825@gmail.com,
 daniel.vetter@ffwll.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When declaring pointer data, the "*" symbol should be used adjacent to
the data name as per the coding style standards. This resolves following
issues reported by checkpatch script:
	ERROR: "foo *   bar" should be "foo *bar"
	ERROR: "foo * bar" should be "foo *bar"
	ERROR: "foo*            bar" should be "foo *bar"
	ERROR: "(foo*)" should be "(foo *)"

Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
index 136270e4af7b..e285f9c9d460 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
@@ -800,7 +800,7 @@ static int vcn_v2_0_start_dpg_mode(struct amdgpu_device *adev, bool indirect)
 	WREG32_SOC15(UVD, 0, mmUVD_POWER_STATUS, tmp);
 
 	if (indirect)
-		adev->vcn.inst->dpg_sram_curr_addr = (uint32_t*)adev->vcn.inst->dpg_sram_cpu_addr;
+		adev->vcn.inst->dpg_sram_curr_addr = (uint32_t *)adev->vcn.inst->dpg_sram_cpu_addr;
 
 	/* enable clock gating */
 	vcn_v2_0_clock_gating_dpg_mode(adev, 0, indirect);
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
index 4094718ae27a..b6e0f4ba6272 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
@@ -777,7 +777,7 @@ static int vcn_v2_5_start_dpg_mode(struct amdgpu_device *adev, int inst_idx, boo
 	WREG32_SOC15(VCN, inst_idx, mmUVD_POWER_STATUS, tmp);
 
 	if (indirect)
-		adev->vcn.inst[inst_idx].dpg_sram_curr_addr = (uint32_t*)adev->vcn.inst[inst_idx].dpg_sram_cpu_addr;
+		adev->vcn.inst[inst_idx].dpg_sram_curr_addr = (uint32_t *)adev->vcn.inst[inst_idx].dpg_sram_cpu_addr;
 
 	/* enable clock gating */
 	vcn_v2_5_clock_gating_dpg_mode(adev, 0, inst_idx, indirect);
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
index 13e511d77bb1..749bf9503470 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
@@ -915,7 +915,7 @@ static int vcn_v3_0_start_dpg_mode(struct amdgpu_device *adev, int inst_idx, boo
 	WREG32_SOC15(VCN, inst_idx, mmUVD_POWER_STATUS, tmp);
 
 	if (indirect)
-		adev->vcn.inst[inst_idx].dpg_sram_curr_addr = (uint32_t*)adev->vcn.inst[inst_idx].dpg_sram_cpu_addr;
+		adev->vcn.inst[inst_idx].dpg_sram_curr_addr = (uint32_t *)adev->vcn.inst[inst_idx].dpg_sram_cpu_addr;
 
 	/* enable clock gating */
 	vcn_v3_0_clock_gating_dpg_mode(adev, 0, inst_idx, indirect);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
