Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6852A3E6A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:14:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D85446EBB7;
	Tue,  3 Nov 2020 08:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D019D6E0DC;
 Mon,  2 Nov 2020 17:19:16 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id x23so7154792plr.6;
 Mon, 02 Nov 2020 09:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Gu7OzJg5YsHyAw9OdlR1gRKaz6bYEZ9rCRmoN2YqcRs=;
 b=tbS/ciRMaM0ywq7S9pBwsax3DG+avVuW1tjS5cu/eUgRRdJh4dbo4UPLChadxR1m8t
 4dvTLuoC4ZgtBcLTZvIzJQW1Bt+3gXbIFSSS3lqbylisp9GNlo9DiZOJJtqphxAh3fS2
 LlPksIINDJk2JjmLJkTgGGyCfsZsuQrk1YR997yzujP1fUHsxplRDEqxR0MeX9pUZkHW
 TOCEL9dSotXYRPJXksmybG6kHIyMny+Pxgtu//YreT+YKNU1q9ACXzjO2g+XX09hhFae
 umKdVEEcXJaIeExLuOB6MeyGYrEmF3UT7HZb7u28CauIeMMcrSZ9gty5bQmuoGCxkeIW
 8PnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Gu7OzJg5YsHyAw9OdlR1gRKaz6bYEZ9rCRmoN2YqcRs=;
 b=OGB5qV/P5qZ2HOF3mwCVoLXAvnleL1HpZFjdvzzFNbE7sYpk83D+jDENRyzMSXTJWD
 ZH8sXiHzr7AClLtp8Pc6BxnTRsfJROGNGESuVu1Zme3vnEpQI1PqA5YBEZ45HDJFit+R
 1r4pQ01vG5R/QiiemopXF1xoUqf2x2lmkpBxRnOlADfGhgvhAQNGoq7czYSmqpLf3oeK
 2fkTPeH+ZXt7tSxuFgHZvSfM34EGP1NqOjw7y8+optdmVr6Foddp/B1j1gR6mn6bj1F2
 ltwewgylD3unv5x3epdSkFiYlRjfimj1GZYxwUXpHPggrALwk6K6dgfa9D4fVOTWdZEQ
 hoSw==
X-Gm-Message-State: AOAM531UWG4gxe+YJKF/8qSdjxrKYBckrdMr+nhKx4AvY9T/dUPOLKOo
 x2PDv3Az61xhg5aCrLqurk8=
X-Google-Smtp-Source: ABdhPJw1/N+zCVEA2pWu+bXYevC4BP3Wxp6QkseKL6Ms7RpGDvbR+NhQ3y3BsLzDW89oVemL7opmCA==
X-Received: by 2002:a17:902:a503:b029:d6:d9d:f901 with SMTP id
 s3-20020a170902a503b02900d60d9df901mr22556442plq.54.1604337556537; 
 Mon, 02 Nov 2020 09:19:16 -0800 (PST)
Received: from localhost ([160.202.157.3])
 by smtp.gmail.com with ESMTPSA id j184sm3770129pfg.207.2020.11.02.09.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 09:19:16 -0800 (PST)
Date: Mon, 2 Nov 2020 22:49:10 +0530
From: Deepak R Varma <mh12gx2825@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, gregkh@linuxfoundation.org,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] drm/amdgpu/nbio: improve code indentation and alignment
Message-ID: <dccb007e6969300fc3dabad4887c4c589484e405.1604336791.git.mh12gx2825@gmail.com>
References: <d644879c4cac32a7cbdbbeebc97c98efd421e17f.1604336791.git.mh12gx2825@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d644879c4cac32a7cbdbbeebc97c98efd421e17f.1604336791.git.mh12gx2825@gmail.com>
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
Cc: melissa.srw@gmail.com, daniel.vetter@ffwll.ch, mh12gx2825@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

General code indentation and alignment changes such as replace spaces
by tabs or align function arguments as per the coding style
guidelines. Issue reported by checkpatch script.

Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c | 4 ++--
 drivers/gpu/drm/amd/amdgpu/nbio_v7_0.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c b/drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c
index 7b2fb050407d..d2f1fe55d388 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c
@@ -32,7 +32,7 @@
 
 static u32 nbio_v6_1_get_rev_id(struct amdgpu_device *adev)
 {
-        u32 tmp = RREG32_SOC15(NBIO, 0, mmRCC_DEV0_EPF0_STRAP0);
+	u32 tmp = RREG32_SOC15(NBIO, 0, mmRCC_DEV0_EPF0_STRAP0);
 
 	tmp &= RCC_DEV0_EPF0_STRAP0__STRAP_ATI_REV_ID_DEV0_F0_MASK;
 	tmp >>= RCC_DEV0_EPF0_STRAP0__STRAP_ATI_REV_ID_DEV0_F0__SHIFT;
@@ -114,7 +114,7 @@ static void nbio_v6_1_enable_doorbell_selfring_aperture(struct amdgpu_device *ad
 static void nbio_v6_1_ih_doorbell_range(struct amdgpu_device *adev,
 					bool use_doorbell, int doorbell_index)
 {
-	u32 ih_doorbell_range = RREG32_SOC15(NBIO, 0 , mmBIF_IH_DOORBELL_RANGE);
+	u32 ih_doorbell_range = RREG32_SOC15(NBIO, 0, mmBIF_IH_DOORBELL_RANGE);
 
 	if (use_doorbell) {
 		ih_doorbell_range = REG_SET_FIELD(ih_doorbell_range, BIF_IH_DOORBELL_RANGE, OFFSET, doorbell_index);
diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v7_0.c b/drivers/gpu/drm/amd/amdgpu/nbio_v7_0.c
index d34628e113fc..ae685813c419 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbio_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbio_v7_0.c
@@ -43,7 +43,7 @@ static void nbio_v7_0_remap_hdp_registers(struct amdgpu_device *adev)
 
 static u32 nbio_v7_0_get_rev_id(struct amdgpu_device *adev)
 {
-        u32 tmp = RREG32_SOC15(NBIO, 0, mmRCC_DEV0_EPF0_STRAP0);
+	u32 tmp = RREG32_SOC15(NBIO, 0, mmRCC_DEV0_EPF0_STRAP0);
 
 	tmp &= RCC_DEV0_EPF0_STRAP0__STRAP_ATI_REV_ID_DEV0_F0_MASK;
 	tmp >>= RCC_DEV0_EPF0_STRAP0__STRAP_ATI_REV_ID_DEV0_F0__SHIFT;
@@ -126,7 +126,7 @@ static void nbio_v7_0_enable_doorbell_selfring_aperture(struct amdgpu_device *ad
 static void nbio_v7_0_ih_doorbell_range(struct amdgpu_device *adev,
 					bool use_doorbell, int doorbell_index)
 {
-	u32 ih_doorbell_range = RREG32_SOC15(NBIO, 0 , mmBIF_IH_DOORBELL_RANGE);
+	u32 ih_doorbell_range = RREG32_SOC15(NBIO, 0, mmBIF_IH_DOORBELL_RANGE);
 
 	if (use_doorbell) {
 		ih_doorbell_range = REG_SET_FIELD(ih_doorbell_range, BIF_IH_DOORBELL_RANGE, OFFSET, doorbell_index);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
