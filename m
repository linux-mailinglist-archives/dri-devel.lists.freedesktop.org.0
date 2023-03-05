Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E95AE6AAFA5
	for <lists+dri-devel@lfdr.de>; Sun,  5 Mar 2023 13:52:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C7810E035;
	Sun,  5 Mar 2023 12:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D24F10E034
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Mar 2023 12:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678020756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vQQ0uYBPxRhMjlBoHSkG7kjvkj++lGtvOQg+vNT+2wk=;
 b=PPAC4QwDVkEMfDs41Z/gySdVeNdx0X3A2Es9VDVLbAqpjw3BhxSQuddBH7ZnYQOPZ60Lcx
 qKyTkja5zrH398IpUnZyV2pxbr9dj2vmNPKFNgXYOiO1YG+qK9j1kFcD3wqhG0yW03DwHF
 QcdwkG4uAPebdqphco3XmyhlJ1sV20c=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-Ntth-GE3NLKnxTuNv1arxQ-1; Sun, 05 Mar 2023 07:52:35 -0500
X-MC-Unique: Ntth-GE3NLKnxTuNv1arxQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 l17-20020ac84cd1000000b003bfbae42753so3811983qtv.12
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Mar 2023 04:52:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678020754;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vQQ0uYBPxRhMjlBoHSkG7kjvkj++lGtvOQg+vNT+2wk=;
 b=43ns/toNwIwdJgXktmTXFBBGMRXrWusGmz+JlgFw2oBtxCqwn2ghr8i6ycEzJTjwDy
 9kjl+iWJGO/59F7krqTGsmPltkKBaNSkdU40P4Pwtcoeouxlc5KqpIYIVp6M+5hEQPdl
 nH6vvfsyfcb3jRukLe2vVCDFK+ARnPRrrIYWpgdHCm8WIiZ8Q46SAfg/4kyxA1X+TPF5
 S0rcWUlUd3taNUnbxuZf9e/QcPEQ7/EuoXDyDugXVjHc9hS1s3LpDdKqh20eHU88N+5e
 HkwZcS7Tjiuqfci8edm5HL+ggXN6LODu1jFw7/3UQRbXuj1EO2+YbIvh89TdTYMmgzX7
 At5w==
X-Gm-Message-State: AO0yUKVndF69BBY5/paUjxk2f/ncnnb3NFq190xfR0mcANOUvxB+fK4s
 NHejF4Wmj0f9ggx0jKgy1VprFFkWJxSc5uf591q8aLh1c6rGPNPZ4LpK3Ks+gIeX9rA3AAdAUYc
 +2MrGTsTZK8bb19+U0xdHfF4w523T
X-Received: by 2002:a05:622a:5d2:b0:3b9:a5d8:2c50 with SMTP id
 d18-20020a05622a05d200b003b9a5d82c50mr12269844qtb.38.1678020754036; 
 Sun, 05 Mar 2023 04:52:34 -0800 (PST)
X-Google-Smtp-Source: AK7set+W7zKVuSVvPa9kOsfNu2XMxPKYssuDIr6jC6Wd16rob9HdjLdX/3AcHy4wLZTo1nMeA5PdoQ==
X-Received: by 2002:a05:622a:5d2:b0:3b9:a5d8:2c50 with SMTP id
 d18-20020a05622a05d200b003b9a5d82c50mr12269819qtb.38.1678020753790; 
 Sun, 05 Mar 2023 04:52:33 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 a3-20020ac86103000000b003b63dfad2b4sm5681344qtm.0.2023.03.05.04.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 04:52:32 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, jiapeng.chong@linux.alibaba.com,
 aurabindo.pillai@amd.com
Subject: [PATCH] drm/amd/display: change several dcn30 variables
 storage-class-specifier to static
Date: Sun,  5 Mar 2023 07:52:26 -0500
Message-Id: <20230305125226.1953574-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

smatch reports these similar problems in dcn30
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dwb.c:223:25:
  warning: symbol 'dcn30_dwbc_funcs' was not declared. Should it be static?
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_mmhubbub.c:214:28:
  warning: symbol 'dcn30_mmhubbub_funcs' was not declared. Should it be static?
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_mpc.c:1402:24:
  warning: symbol 'dcn30_mpc_funcs' was not declared. Should it be static?

All of these are only used in their definition file, so they should be static

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.c      | 2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.c | 2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.c
index f14f69616692..0d98918bf0fc 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.c
@@ -220,7 +220,7 @@ void dwb3_set_denorm(struct dwbc *dwbc, struct dc_dwb_params *params)
 }
 
 
-const struct dwbc_funcs dcn30_dwbc_funcs = {
+static const struct dwbc_funcs dcn30_dwbc_funcs = {
 	.get_caps		= dwb3_get_caps,
 	.enable			= dwb3_enable,
 	.disable		= dwb3_disable,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.c
index 7a93eff183d9..6f2a0d5d963b 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.c
@@ -211,7 +211,7 @@ static void mmhubbub3_config_mcif_arb(struct mcif_wb *mcif_wb,
 	REG_UPDATE(MCIF_WB_ARBITRATION_CONTROL, MCIF_WB_CLIENT_ARBITRATION_SLICE,  params->arbitration_slice);
 }
 
-const struct mcif_wb_funcs dcn30_mmhubbub_funcs = {
+static const struct mcif_wb_funcs dcn30_mmhubbub_funcs = {
 	.warmup_mcif		= mmhubbub3_warmup_mcif,
 	.enable_mcif		= mmhubbub2_enable_mcif,
 	.disable_mcif		= mmhubbub2_disable_mcif,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
index ad1c1b703874..6cf40c1332bc 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
@@ -1399,7 +1399,7 @@ static void mpc3_set_mpc_mem_lp_mode(struct mpc *mpc)
 	}
 }
 
-const struct mpc_funcs dcn30_mpc_funcs = {
+static const struct mpc_funcs dcn30_mpc_funcs = {
 	.read_mpcc_state = mpc1_read_mpcc_state,
 	.insert_plane = mpc1_insert_plane,
 	.remove_mpcc = mpc1_remove_mpcc,
-- 
2.27.0

