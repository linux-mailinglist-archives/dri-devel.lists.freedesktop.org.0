Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C7E6ACE59
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 20:43:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C41010E222;
	Mon,  6 Mar 2023 19:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC2FF10E217;
 Mon,  6 Mar 2023 19:43:52 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 u3-20020a4ad0c3000000b0052541ef0bafso1706800oor.5; 
 Mon, 06 Mar 2023 11:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678131832;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+V0EwO6G1+NsdivbbBORAc/NjBVd2whnpDLZ9uwuBOk=;
 b=juILeSvhI3iZefJOGuCghopgkpsqHTNjDpBpW6JVxi7WAJO9X8Oj4gLL7cJyR44plp
 y1JS3glWd1n7a4QTfeAtmJZLrQywzHkCsHHTrZJl6SWA5UYBIz5+S2wskKCt6cYzMf/+
 f4FbrkGQNsJMfD9ORGRRij4MiKH7JDmwE/OUBj1IJZYFBVN8cOCMuWpR+S53Mi8hpxJp
 yoFCtZRDSyPQCPGHbXHGLvgj89XexGfCt3PvRbFwORx9QZ6GQ5uMZ4njSQQAJBJB5UTd
 n0i2HJMBILwzcZAkwLzWCvnUxW9FwVjIZBoc/k1VhnWxLQI2FeF0o6jCT/MvENm2P1lO
 VfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678131832;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+V0EwO6G1+NsdivbbBORAc/NjBVd2whnpDLZ9uwuBOk=;
 b=rzqJjIvaBM+ZUao1uHVr8eQh6qG6fkA6+UVclcmf5p7qrRL+TaSazM/2X9RAfJEfSx
 ObYDHX1SR/30jqtaYy3LNIDCNvT0b+FL7o9h23FvtJL3u1JaTa/K10npgnNg+SQqrFdv
 PUn0PKg2UgAEcxD4jNSIhUTnLoXM4DHZZtNipxuw5HYngXekHm7SNFPH3DyHtrzU6AC1
 rReg5cJRv/Y9Rw/cKR/r0RnPXsyblWuDm42zT9+GMeElmvZ3JWUBnqdoCZj1/REmqxh6
 o5E/WNcffu+WRieQXfZ14LLeKfxI41T/hvX4HgaKTM2Cufa2MUXzhL3VeRZB90lURo68
 nVxQ==
X-Gm-Message-State: AO0yUKWKz8VLiKO9y3eLn8J0G1rtRo6kOHy0uEKP+wKaXplaEAjBX7td
 kOiWQNMRx0tIkvAx9xW+mnqpK+J8N9Om+jffahM=
X-Google-Smtp-Source: AK7set+F1eBn2tH3xXCaADaUGLCEOerW5DQ8sfH/ykuSI5jUceMP5bufdOfeyBYPtE74msssSZw48JCEClvCBVRq6as=
X-Received: by 2002:a4a:3c1c:0:b0:525:2f4d:54a3 with SMTP id
 d28-20020a4a3c1c000000b005252f4d54a3mr4767571ooa.0.1678131832162; Mon, 06 Mar
 2023 11:43:52 -0800 (PST)
MIME-Version: 1.0
References: <20230305125226.1953574-1-trix@redhat.com>
In-Reply-To: <20230305125226.1953574-1-trix@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 6 Mar 2023 14:43:41 -0500
Message-ID: <CADnq5_MYjVbNA5yJ2mOCgGut6d1kEaNA_U0ZvjEqD=adjn9hPA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: change several dcn30 variables
 storage-class-specifier to static
To: Tom Rix <trix@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: jiapeng.chong@linux.alibaba.com, sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, aurabindo.pillai@amd.com,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Sun, Mar 5, 2023 at 7:52 AM Tom Rix <trix@redhat.com> wrote:
>
> smatch reports these similar problems in dcn30
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dwb.c:223:25:
>   warning: symbol 'dcn30_dwbc_funcs' was not declared. Should it be static?
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_mmhubbub.c:214:28:
>   warning: symbol 'dcn30_mmhubbub_funcs' was not declared. Should it be static?
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_mpc.c:1402:24:
>   warning: symbol 'dcn30_mpc_funcs' was not declared. Should it be static?
>
> All of these are only used in their definition file, so they should be static
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.c      | 2 +-
>  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.c | 2 +-
>  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c      | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.c
> index f14f69616692..0d98918bf0fc 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.c
> @@ -220,7 +220,7 @@ void dwb3_set_denorm(struct dwbc *dwbc, struct dc_dwb_params *params)
>  }
>
>
> -const struct dwbc_funcs dcn30_dwbc_funcs = {
> +static const struct dwbc_funcs dcn30_dwbc_funcs = {
>         .get_caps               = dwb3_get_caps,
>         .enable                 = dwb3_enable,
>         .disable                = dwb3_disable,
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.c
> index 7a93eff183d9..6f2a0d5d963b 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.c
> @@ -211,7 +211,7 @@ static void mmhubbub3_config_mcif_arb(struct mcif_wb *mcif_wb,
>         REG_UPDATE(MCIF_WB_ARBITRATION_CONTROL, MCIF_WB_CLIENT_ARBITRATION_SLICE,  params->arbitration_slice);
>  }
>
> -const struct mcif_wb_funcs dcn30_mmhubbub_funcs = {
> +static const struct mcif_wb_funcs dcn30_mmhubbub_funcs = {
>         .warmup_mcif            = mmhubbub3_warmup_mcif,
>         .enable_mcif            = mmhubbub2_enable_mcif,
>         .disable_mcif           = mmhubbub2_disable_mcif,
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
> index ad1c1b703874..6cf40c1332bc 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
> @@ -1399,7 +1399,7 @@ static void mpc3_set_mpc_mem_lp_mode(struct mpc *mpc)
>         }
>  }
>
> -const struct mpc_funcs dcn30_mpc_funcs = {
> +static const struct mpc_funcs dcn30_mpc_funcs = {
>         .read_mpcc_state = mpc1_read_mpcc_state,
>         .insert_plane = mpc1_insert_plane,
>         .remove_mpcc = mpc1_remove_mpcc,
> --
> 2.27.0
>
