Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05551A937E5
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 15:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E5FE10E1FA;
	Fri, 18 Apr 2025 13:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SNW26AgR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372CC10E1FA;
 Fri, 18 Apr 2025 13:25:44 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2240ff0bd6eso2703515ad.0; 
 Fri, 18 Apr 2025 06:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744982743; x=1745587543; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nyC6qiVT+u6rR7PgNOginiie1BVxcpXDs4+aZTBzC9Y=;
 b=SNW26AgRWPDN7jEjaP2Jfuy4CKhgDCJVlQUoWX37oOnBSnazunYu2WfUZ1dASbpN66
 N5ussMNcTUfWxEqCMbMvSWyfOGkZAaQssfzGRmdexyWSfFFS1egciYRbs2XPSs0ymFH0
 xGtubC49k7r2qNtWqZ6yoBX3kgGlvRsMA2sXx0KoXirOH/FBOYaj9bMOnJxeWYj7UMXF
 FZzQ0C7UmEcMh+p3ggMq4JSlCm2gq6K1WmZ9i/IrshxaMT8w5QjqBHl58y/FSbHqk0f9
 pq0REYBkN5s0xFTVUnBLvE2ElP7n3QXedOFKMdldfQzUj2mAiPSxQ8oG3gwGxqdkjY26
 K53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744982743; x=1745587543;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nyC6qiVT+u6rR7PgNOginiie1BVxcpXDs4+aZTBzC9Y=;
 b=Qm4QjS5vh4seSeRhkfe2q+JMYcVA2Fb1D5OY6+i4qWPB32DFKQ8LJ4EfthwCCgsH7M
 w+ZYaJSf1vy8abYEhooI6OQIBmdkwdUsS7Nsqh4YLmVvWrnfJo4bguZmkGX/PD5V8WLS
 iv4WzKwLJ7keccHBIfTMa26NylTQMGcxLhOACrmc8fQluDLUf59KYqOAwx1VWRaS+b8b
 VxVWBI6sE+sEJyHjZxTLLjsm1xtUalWssr4p6rC38jkZTbJ4YA+O/QEFHkjqJGiXwNPq
 iK4P1pojTPXC/GGpZdPH0ls8XH2oXYAYQxhdKsjzI/AV8avZiKOEC30bjXcEf8+yshIe
 kdNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxA1L3qSSZX82vxxfAr3xElJZ48371etSvejw8yK4JhD4uGClyZuWyHXqBlOTz+PX+mifDZ7yp@lists.freedesktop.org,
 AJvYcCVG+qPisDObSwhgRcsbUpBeQANqnkKpVDr9rmWKmKsrnCV+QwyiPtW/RCAJ8q+H+Tv6uxLjAxlkMoe+@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSGvGLPKfsY7URMN1koFEgktNv6alJbNStZnyOzIrXVtIgPC6F
 Bi/Q8nDto8EDIookQIkp8yYpT8+ubwV0FxUuD/xOqCkIupie3aceykMzObDLN+uN3a05/3T9KY4
 TTmHeq7IGWR7zd0P2h1NMhmLFIbU=
X-Gm-Gg: ASbGncuQWtEBwRRt4dTKAylH1ylB268tOnQbPk8VKrgUed/LoIc2rR2WpTCW+/nKEAy
 Xl+rvA1/8APfMqypFrzO71yeBUmZOqtmwwlU+jvz03dDBnSjFyTZ0CJb22qoLnoL1kG9mxgon/L
 V2eqnxsFmFD6AsYesfX+wQ0g==
X-Google-Smtp-Source: AGHT+IEkg5l32NGk3QoxdJcXn0CidWWNtFY5WaOURIUpxvd0XNAJikgTjGRg3HBLp/wS28RhXBbDrZYprx9XXbEdsWo=
X-Received: by 2002:a17:902:fc46:b0:21f:3e2d:7d43 with SMTP id
 d9443c01a7336-22c5361fd79mr16154295ad.13.1744982743399; Fri, 18 Apr 2025
 06:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250418002117.130612-1-linux@treblig.org>
 <20250418002117.130612-5-linux@treblig.org>
In-Reply-To: <20250418002117.130612-5-linux@treblig.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Apr 2025 09:25:31 -0400
X-Gm-Features: ATxdqUFslTsaOCqwA3wvaxSTpSZ6IN0_tcLcXqKz9RibnGUgvP0nVR7xs914qb8
Message-ID: <CADnq5_PWLjCAfPx_2K+r=tuwf=+dN4iP1-OnyfP8mgXsR1Ting@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/amd/display: Remove unused *vbios_smu_set_dprefclk
To: linux@treblig.org
Cc: alexander.deucher@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com, 
 siqueira@igalia.com, christian.koenig@amd.com, airlied@gmail.com, 
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Applied patches 1, 3, 4.  Thanks!

On Thu, Apr 17, 2025 at 8:28=E2=80=AFPM <linux@treblig.org> wrote:
>
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> rn_vbios_smu_set_dprefclk() was added in 2019 by
> commit 4edb6fc91878 ("drm/amd/display: Add Renoir clock manager")
> rv1_vbios_smu_set_dprefclk() was also added in 2019 by
> commit dc88b4a684d2 ("drm/amd/display: make clk mgr soc specific")
>
> neither have been used.
>
> Remove them.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  .../dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c       | 14 --------------
>  .../dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.h       |  1 -
>  .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c        | 14 --------------
>  .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.h        |  1 -
>  4 files changed, 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbi=
os_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_s=
mu.c
> index 19897fa52e7e..d82a52319088 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.=
c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.=
c
> @@ -142,17 +142,3 @@ int rv1_vbios_smu_set_dispclk(struct clk_mgr_interna=
l *clk_mgr, int requested_di
>
>         return actual_dispclk_set_mhz * 1000;
>  }
> -
> -int rv1_vbios_smu_set_dprefclk(struct clk_mgr_internal *clk_mgr)
> -{
> -       int actual_dprefclk_set_mhz =3D -1;
> -
> -       actual_dprefclk_set_mhz =3D rv1_vbios_smu_send_msg_with_param(
> -                       clk_mgr,
> -                       VBIOSSMC_MSG_SetDprefclkFreq,
> -                       khz_to_mhz_ceil(clk_mgr->base.dprefclk_khz));
> -
> -       /* TODO: add code for programing DP DTO, currently this is down b=
y command table */
> -
> -       return actual_dprefclk_set_mhz * 1000;
> -}
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbi=
os_smu.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_s=
mu.h
> index 083cb3158859..81d7c912549c 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.=
h
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.=
h
> @@ -27,6 +27,5 @@
>  #define DAL_DC_DCN10_RV1_CLK_MGR_VBIOS_SMU_H_
>
>  int rv1_vbios_smu_set_dispclk(struct clk_mgr_internal *clk_mgr, int requ=
ested_dispclk_khz);
> -int rv1_vbios_smu_set_dprefclk(struct clk_mgr_internal *clk_mgr);
>
>  #endif /* DAL_DC_DCN10_RV1_CLK_MGR_VBIOS_SMU_H_ */
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbio=
s_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu=
.c
> index 23b390245b5d..5a633333dbb5 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c
> @@ -164,20 +164,6 @@ int rn_vbios_smu_set_dispclk(struct clk_mgr_internal=
 *clk_mgr, int requested_dis
>         return actual_dispclk_set_mhz * 1000;
>  }
>
> -int rn_vbios_smu_set_dprefclk(struct clk_mgr_internal *clk_mgr)
> -{
> -       int actual_dprefclk_set_mhz =3D -1;
> -
> -       actual_dprefclk_set_mhz =3D rn_vbios_smu_send_msg_with_param(
> -                       clk_mgr,
> -                       VBIOSSMC_MSG_SetDprefclkFreq,
> -                       khz_to_mhz_ceil(clk_mgr->base.dprefclk_khz));
> -
> -       /* TODO: add code for programing DP DTO, currently this is down b=
y command table */
> -
> -       return actual_dprefclk_set_mhz * 1000;
> -}
> -
>  int rn_vbios_smu_set_hard_min_dcfclk(struct clk_mgr_internal *clk_mgr, i=
nt requested_dcfclk_khz)
>  {
>         int actual_dcfclk_set_mhz =3D -1;
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbio=
s_smu.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu=
.h
> index 1ce19d875358..f76fad87f0e1 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.h
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.h
> @@ -30,7 +30,6 @@ enum dcn_pwr_state;
>
>  int rn_vbios_smu_get_smu_version(struct clk_mgr_internal *clk_mgr);
>  int rn_vbios_smu_set_dispclk(struct clk_mgr_internal *clk_mgr, int reque=
sted_dispclk_khz);
> -int rn_vbios_smu_set_dprefclk(struct clk_mgr_internal *clk_mgr);
>  int rn_vbios_smu_set_hard_min_dcfclk(struct clk_mgr_internal *clk_mgr, i=
nt requested_dcfclk_khz);
>  int rn_vbios_smu_set_min_deep_sleep_dcfclk(struct clk_mgr_internal *clk_=
mgr, int requested_min_ds_dcfclk_khz);
>  void rn_vbios_smu_set_phyclk(struct clk_mgr_internal *clk_mgr, int reque=
sted_phyclk_khz);
> --
> 2.49.0
>
