Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F2923C6B4
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 09:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285376E50D;
	Wed,  5 Aug 2020 07:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72876E4B6;
 Tue,  4 Aug 2020 20:07:10 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id w14so15192452ljj.4;
 Tue, 04 Aug 2020 13:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u8vVd3eNYQguySxvKcCaV5W8ooNVhtOP1CKm/UC6A7I=;
 b=s9xx/Duk98DAB0+L8vFJMaT7WWygK0TAVyP8WfoNoaFx3f2OxDMsQm34eFo1UqG5Xr
 d9dpxhegHqwtwtW6evsWeDD9utm7jF5dneGl3JlS/3ERywgRsNOPa5o0gke2M+69aSwY
 O9wZPw8E8PiOT0Mo3LmYhFOdJvbUlxHqUTdcU3XwO1/LAH8DVBMbxlw8SIkK30Hdz+Za
 KXs8UGhnHkIcTbM9q/sVxhDjpXK/r1vgmHsLL3AO8VYtuijNNqWECRksnrVnZ4x/i53X
 KoS7hM2sZgmiDw2nxwUeo6qssL0XXACOrQKM150LTEUabBJ/VC+boW6XHPfAwM/xQEZR
 mtDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u8vVd3eNYQguySxvKcCaV5W8ooNVhtOP1CKm/UC6A7I=;
 b=HyC9r/V3OFBAQFQQs0UvwGVS0iOnbZwL4cInkPV4nnIRnEROg2ClUftCjlRKedW61e
 iHfv9sjJEFOMgLLrN3Bd/PdYLBQd1RC1hTg4NgR5Gtqy+Kgdyk7mwokKa5uMIjOx95o1
 VCkBNrfFTrn4SxRqiXv0DeF6Ow8pD7POIovTKyQTjrr1vP6d0qx3OcMdUuzfKz8lIJej
 KP4dZ5s/ZQP6U2kzlGUTycqzF+Lq+859AxewaM3LDSHopAhNU37S4E4UO9b+oojVxeKT
 NemOLxmM7Y14IHW4SKsttt+bM4xvwsGBqZoEkIr0ucFcZHyCeQZYONzw2nvn3nm6iJzA
 z2nQ==
X-Gm-Message-State: AOAM533qwFV4ReUJw+DeGci6J2s0nIAwFooQ4og6CSh3B6knnwCcQXBn
 wcXjEB5ZY0QHFdkptimHduk=
X-Google-Smtp-Source: ABdhPJyBRrbSBhdu9xngj5VBMCOa3dus0RevnDqkrLCpPxaq4pkyHzKmzy8Eur5swB9DFOpFQqCLPg==
X-Received: by 2002:a05:651c:c6:: with SMTP id
 6mr10769338ljr.237.1596571629160; 
 Tue, 04 Aug 2020 13:07:09 -0700 (PDT)
Received: from localhost.localdomain (h-82-196-111-59.NA.cust.bahnhof.se.
 [82.196.111.59])
 by smtp.gmail.com with ESMTPSA id g21sm3080020ljh.103.2020.08.04.13.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 13:07:08 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com
Subject: [PATCH 3/3] drm/amd/display: Constify dcn30_res_pool_funcs
Date: Tue,  4 Aug 2020 22:06:55 +0200
Message-Id: <20200804200655.30495-4-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200804200655.30495-1-rikard.falkeborn@gmail.com>
References: <20200804200655.30495-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 05 Aug 2020 07:13:16 +0000
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
Cc: amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The only usage of dcn30_res_pool_funcs is to assign its address to a
const pointer. Make it const to allow the compiler to put it in
read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
index 653a571e366d..d474a6188445 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
@@ -2412,7 +2412,7 @@ static void dcn30_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw
 		dml_init_instance(&dc->current_state->bw_ctx.dml, &dcn3_0_soc, &dcn3_0_ip, DML_PROJECT_DCN30);
 }
 
-static struct resource_funcs dcn30_res_pool_funcs = {
+static const struct resource_funcs dcn30_res_pool_funcs = {
 	.destroy = dcn30_destroy_resource_pool,
 	.link_enc_create = dcn30_link_encoder_create,
 	.panel_cntl_create = dcn30_panel_cntl_create,
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
