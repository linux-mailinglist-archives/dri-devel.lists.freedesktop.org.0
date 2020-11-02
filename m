Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 351ED2A3E80
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:15:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDDE86EC31;
	Tue,  3 Nov 2020 08:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C0E6E0DC;
 Mon,  2 Nov 2020 17:17:05 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id b19so7151234pld.0;
 Mon, 02 Nov 2020 09:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=a0jYTmrFpdw95OyIRLlDuQeZ5xit+fHnq5W5rVj7juA=;
 b=VpLkXv3FGasnw6RWFjbzBHclWI38P4gsSsNqXgS6d11F7eDNPz8jieDqz1GfhXrowq
 VG9eE9esFFmJ1hqZ6b/YDr3U1xF9lwwlNX03ZM0LRJyTPg09csiv/4n07l5bHGiecQr/
 lDPamuHlPhk8Kxjz7rrWg5y2doc0SFZzJM0XaXt1kAtJs5TXYVUn0zShcNE9GaQIyIm9
 Nrkcae3MkVppfjUk35bRCgiL1+Cx+a9rjiYxtwhNnTadoRHNxWt3+KwJTWhjBWU2r0oV
 7zOhUX01tvJDluzsQi9AE7UOyk4GpLRYG9LXpmcXrMLm91yuPPozaXppA0q944QRTFdE
 zGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=a0jYTmrFpdw95OyIRLlDuQeZ5xit+fHnq5W5rVj7juA=;
 b=HoJJY1DItHBhLR90ubcRvX75fH3d8hO0YUyXvALEulPY70hOUUqCZpDSPXxpcyOopB
 YSx33mbH0yJ8yDUezODRBcjokdnJlrpItwtiTAd2Ye+uVPj29tjh0fzqAMLwuHnmmwc3
 t5tokAO2JRqmTHOosaL0xFQtijh7SKWKaykNEQuTUkPtXjudZPV8UiJRXodEWgquhSuF
 GaZk0f7tB8UZ7/Qu5XR1QAOdO7sFBpw1Bz0Jr5MfeolSByig7JtsbrrsdhPjcwYNPYeY
 fsTefqXvqYnQP8f1jOsoMWTYao4YR8GNWU9wP+U43tDTWXUi/p8fnaK+QW+HP6CBLvnu
 vSeQ==
X-Gm-Message-State: AOAM533WFgiE7pELVM4gFLfQCEcK+qYEYvN8nTfWD7ZhUkS2ln5fp3AN
 kZSsWwFWhqerjEBcEHm/9ss=
X-Google-Smtp-Source: ABdhPJzBvEf8/a8mYK9gWC2o0GG6EkLwG/D1jjlRP3lTFRhwncusiDCdB/RROZx1ly3sBcCr6BQDqQ==
X-Received: by 2002:a17:902:a589:b029:d6:856a:2978 with SMTP id
 az9-20020a170902a589b02900d6856a2978mr21413557plb.67.1604337424893; 
 Mon, 02 Nov 2020 09:17:04 -0800 (PST)
Received: from localhost ([160.202.157.3])
 by smtp.gmail.com with ESMTPSA id j11sm13951700pfc.64.2020.11.02.09.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 09:17:04 -0800 (PST)
Date: Mon, 2 Nov 2020 22:46:58 +0530
From: Deepak R Varma <mh12gx2825@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, gregkh@linuxfoundation.org,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] drm/amdgpu/gfx: improve code indentation and alignment
Message-ID: <8a81ed33f995301350742aff6cce0463e37c8bb0.1604336791.git.mh12gx2825@gmail.com>
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
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 10 +++++-----
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c  |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 56fdbe626d30..987f9b6dbc3f 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -3192,7 +3192,7 @@ static void gfx_v10_0_set_irq_funcs(struct amdgpu_device *adev);
 static void gfx_v10_0_set_gds_init(struct amdgpu_device *adev);
 static void gfx_v10_0_set_rlc_funcs(struct amdgpu_device *adev);
 static int gfx_v10_0_get_cu_info(struct amdgpu_device *adev,
-                                 struct amdgpu_cu_info *cu_info);
+				 struct amdgpu_cu_info *cu_info);
 static uint64_t gfx_v10_0_get_gpu_clock_counter(struct amdgpu_device *adev);
 static void gfx_v10_0_select_se_sh(struct amdgpu_device *adev, u32 se_num,
 				   u32 sh_num, u32 instance);
@@ -4200,10 +4200,10 @@ static void gfx_v10_0_read_wave_vgprs(struct amdgpu_device *adev, uint32_t simd,
 }
 
 static void gfx_v10_0_select_me_pipe_q(struct amdgpu_device *adev,
-									  u32 me, u32 pipe, u32 q, u32 vm)
- {
-       nv_grbm_select(adev, me, pipe, q, vm);
- }
+				       u32 me, u32 pipe, u32 q, u32 vm)
+{
+	nv_grbm_select(adev, me, pipe, q, vm);
+}
 
 
 static const struct amdgpu_gfx_funcs gfx_v10_0_gfx_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
index 94b7e0531d09..3e9a230f84df 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
@@ -5058,7 +5058,7 @@ static int gfx_v8_0_pre_soft_reset(void *handle)
 		gfx_v8_0_cp_compute_enable(adev, false);
 	}
 
-       return 0;
+	return 0;
 }
 
 static int gfx_v8_0_soft_reset(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 6959aebae6d4..48f98c750956 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -787,7 +787,7 @@ static void gfx_v9_0_set_irq_funcs(struct amdgpu_device *adev);
 static void gfx_v9_0_set_gds_init(struct amdgpu_device *adev);
 static void gfx_v9_0_set_rlc_funcs(struct amdgpu_device *adev);
 static int gfx_v9_0_get_cu_info(struct amdgpu_device *adev,
-                                 struct amdgpu_cu_info *cu_info);
+				struct amdgpu_cu_info *cu_info);
 static uint64_t gfx_v9_0_get_gpu_clock_counter(struct amdgpu_device *adev);
 static void gfx_v9_0_ring_emit_de_meta(struct amdgpu_ring *ring);
 static u64 gfx_v9_0_ring_get_rptr_compute(struct amdgpu_ring *ring);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
