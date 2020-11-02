Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4672E2A3EA5
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:16:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104616EC33;
	Tue,  3 Nov 2020 08:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCAA46EB87;
 Mon,  2 Nov 2020 19:38:29 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id o129so12040574pfb.1;
 Mon, 02 Nov 2020 11:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0j6o5IOXi9QCY4rzpYV2c+ym2ifBD5NBqGCfA07Vm74=;
 b=L+AjpdoGoATYswlcQZhH4mqTxzzmDQvbcl+DXWmCC3hNnZMM+5uhN9ZB7j2A9gBxct
 SvlaNuQKR2lVpeFNyVAF0KnG3UZTlAjwOs/aCsxyCWUjqf5vvxJOPOXkbLC8ysSLyA0c
 aoY2nQkuizoHzMasFTP/0WustlerkjlON5jj6neaMmbxYc1Pyh70xUsTHC/K0iy5+MSu
 mY7aI4BnxhtYak5yK7AFJcJf8sNBdE9JU5b888xr7DAvZpkrC0Ht6C/dQBacZvgRg8pv
 rIerePPn6aUVFuFWFvOyEmcSQcqWXCk7Pyu60+APYH8adIG4ZHCkGH6IlyEtmzgBPaaV
 Y5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0j6o5IOXi9QCY4rzpYV2c+ym2ifBD5NBqGCfA07Vm74=;
 b=Z7dj2v9HzrQOrJph+ySm7rstK9afWVt4cFJCskm9BeLqLkgO2u60m23eS9eL3K0Ojx
 WhkeiKSdyaMRyUitL1c7etyVvb+wEOWUe9focU0zCMVftVbUO6tTBGUix9g6DNdfRO0m
 NPJOwSCokfe4ZHmkGVmA1YRisSifaMrD7Xjua5VyRzjs5uBxGZ0W17pAVsu7LKnW2HKb
 P9KBFGyVSRnfJSnxCC9ipcGAbRnMkT2AvxA7zLIKfNRtA2UTu1XIOEvHqp8W0iFK8Vwq
 usnXi/6V5APE5LmNHN9g9gKubg/FacRZseaL+9/aR9EYxfV7YU6KH5x4NRoCw3/qsN8W
 Ne0g==
X-Gm-Message-State: AOAM533ktZBjQmO4oaH/CsCT42madMweYFmy8+ZaS8r6676Oh1RxG2rN
 aKL7WLDm/gHI+naYMcAUf8s=
X-Google-Smtp-Source: ABdhPJzv9XHaWF7iKhvLYB3sajkHQCPPJDccyaXCoDOLYSCHbFivdvNuvOqFfpiT3T1VA25ibfNArg==
X-Received: by 2002:a63:160b:: with SMTP id w11mr14557370pgl.110.1604345909343; 
 Mon, 02 Nov 2020 11:38:29 -0800 (PST)
Received: from localhost ([160.202.157.3])
 by smtp.gmail.com with ESMTPSA id q5sm267634pjj.26.2020.11.02.11.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 11:38:29 -0800 (PST)
Date: Tue, 3 Nov 2020 01:08:23 +0530
From: Deepak R Varma <mh12gx2825@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] drm/amdgpu: use "*" adjacent to data name
Message-ID: <59ffb58ca0d30ababc611ebc414e816902cc1b77.1604345594.git.mh12gx2825@gmail.com>
References: <6ad41a97d7805124d2e31c70d96c846cf0d21524.1604345594.git.mh12gx2825@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6ad41a97d7805124d2e31c70d96c846cf0d21524.1604345594.git.mh12gx2825@gmail.com>
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
the data name as per the coding standards. This resolves following
issues reported by checkpatch script:
	ERROR: "foo *   bar" should be "foo *bar"
	ERROR: "foo * bar" should be "foo *bar"
	ERROR: "foo*            bar" should be "foo *bar"
	ERROR: "(foo*)" should be "(foo *)"

Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/atom.c         | 16 ++++++++--------
 drivers/gpu/drm/amd/amdgpu/atombios_i2c.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c     |  4 ++--
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c    |  2 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c    |  2 +-
 5 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdgpu/atom.c
index 46c00ee580b1..515890f4f5a0 100644
--- a/drivers/gpu/drm/amd/amdgpu/atom.c
+++ b/drivers/gpu/drm/amd/amdgpu/atom.c
@@ -67,8 +67,8 @@ typedef struct {
 } atom_exec_context;
 
 int amdgpu_atom_debug;
-static int amdgpu_atom_execute_table_locked(struct atom_context *ctx, int index, uint32_t * params);
-int amdgpu_atom_execute_table(struct atom_context *ctx, int index, uint32_t * params);
+static int amdgpu_atom_execute_table_locked(struct atom_context *ctx, int index, uint32_t *params);
+int amdgpu_atom_execute_table(struct atom_context *ctx, int index, uint32_t *params);
 
 static uint32_t atom_arg_mask[8] =
 	{ 0xFFFFFFFF, 0xFFFF, 0xFFFF00, 0xFFFF0000, 0xFF, 0xFF00, 0xFF0000,
@@ -1201,7 +1201,7 @@ static struct {
 	atom_op_div32, ATOM_ARG_WS},
 };
 
-static int amdgpu_atom_execute_table_locked(struct atom_context *ctx, int index, uint32_t * params)
+static int amdgpu_atom_execute_table_locked(struct atom_context *ctx, int index, uint32_t *params)
 {
 	int base = CU16(ctx->cmd_table + 4 + 2 * index);
 	int len, ws, ps, ptr;
@@ -1262,7 +1262,7 @@ static int amdgpu_atom_execute_table_locked(struct atom_context *ctx, int index,
 	return ret;
 }
 
-int amdgpu_atom_execute_table(struct atom_context *ctx, int index, uint32_t * params)
+int amdgpu_atom_execute_table(struct atom_context *ctx, int index, uint32_t *params)
 {
 	int r;
 
@@ -1388,8 +1388,8 @@ void amdgpu_atom_destroy(struct atom_context *ctx)
 }
 
 bool amdgpu_atom_parse_data_header(struct atom_context *ctx, int index,
-			    uint16_t * size, uint8_t * frev, uint8_t * crev,
-			    uint16_t * data_start)
+			    uint16_t *size, uint8_t *frev, uint8_t *crev,
+			    uint16_t *data_start)
 {
 	int offset = index * 2 + 4;
 	int idx = CU16(ctx->data_table + offset);
@@ -1408,8 +1408,8 @@ bool amdgpu_atom_parse_data_header(struct atom_context *ctx, int index,
 	return true;
 }
 
-bool amdgpu_atom_parse_cmd_header(struct atom_context *ctx, int index, uint8_t * frev,
-			   uint8_t * crev)
+bool amdgpu_atom_parse_cmd_header(struct atom_context *ctx, int index, uint8_t *frev,
+			   uint8_t *crev)
 {
 	int offset = index * 2 + 4;
 	int idx = CU16(ctx->cmd_table + offset);
diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_i2c.c b/drivers/gpu/drm/amd/amdgpu/atombios_i2c.c
index 09a538465ffd..af0335535f82 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_i2c.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_i2c.c
@@ -159,7 +159,7 @@ u32 amdgpu_atombios_i2c_func(struct i2c_adapter *adap)
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
 }
 
-void amdgpu_atombios_i2c_channel_trans(struct amdgpu_device* adev, u8 slave_addr, u8 line_number, u8 offset, u8 data)
+void amdgpu_atombios_i2c_channel_trans(struct amdgpu_device *adev, u8 slave_addr, u8 line_number, u8 offset, u8 data)
 {
 	PROCESS_I2C_CHANNEL_TRANSACTION_PS_ALLOCATION args;
 	int index = GetIndexIntoMasterTable(COMMAND, ProcessI2cChannelTransaction);
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 48f98c750956..e96ab5325af5 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -5167,7 +5167,7 @@ static void gfx_v9_0_ring_set_wptr_gfx(struct amdgpu_ring *ring)
 
 	if (ring->use_doorbell) {
 		/* XXX check if swapping is necessary on BE */
-		atomic64_set((atomic64_t*)&adev->wb.wb[ring->wptr_offs], ring->wptr);
+		atomic64_set((atomic64_t *)&adev->wb.wb[ring->wptr_offs], ring->wptr);
 		WDOORBELL64(ring->doorbell_index, ring->wptr);
 	} else {
 		WREG32_SOC15(GC, 0, mmCP_RB0_WPTR, lower_32_bits(ring->wptr));
@@ -5353,7 +5353,7 @@ static void gfx_v9_0_ring_set_wptr_compute(struct amdgpu_ring *ring)
 
 	/* XXX check if swapping is necessary on BE */
 	if (ring->use_doorbell) {
-		atomic64_set((atomic64_t*)&adev->wb.wb[ring->wptr_offs], ring->wptr);
+		atomic64_set((atomic64_t *)&adev->wb.wb[ring->wptr_offs], ring->wptr);
 		WDOORBELL64(ring->doorbell_index, ring->wptr);
 	} else{
 		BUG(); /* only DOORBELL method supported on gfx9 now */
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
index 1c22d8393b21..985e454463e1 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
@@ -46,7 +46,7 @@ static void mes_v10_1_ring_set_wptr(struct amdgpu_ring *ring)
 	struct amdgpu_device *adev = ring->adev;
 
 	if (ring->use_doorbell) {
-		atomic64_set((atomic64_t*)&adev->wb.wb[ring->wptr_offs],
+		atomic64_set((atomic64_t *)&adev->wb.wb[ring->wptr_offs],
 			     ring->wptr);
 		WDOORBELL64(ring->doorbell_index, ring->wptr);
 	} else {
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
index 6c5d9612abcb..d521ca0f3afa 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
@@ -615,7 +615,7 @@ static int psp_v11_0_memory_training_send_msg(struct psp_context *psp, int msg)
 static int psp_v11_0_memory_training(struct psp_context *psp, uint32_t ops)
 {
 	struct psp_memory_training_context *ctx = &psp->mem_train_ctx;
-	uint32_t *pcache = (uint32_t*)ctx->sys_cache;
+	uint32_t *pcache = (uint32_t *)ctx->sys_cache;
 	struct amdgpu_device *adev = psp->adev;
 	uint32_t p2c_header[4];
 	uint32_t sz;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
