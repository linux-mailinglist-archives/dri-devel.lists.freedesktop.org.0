Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A62593A9F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 22:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C3DD4540;
	Mon, 15 Aug 2022 20:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737E0D452D
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 20:25:42 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-10ee900cce0so9405246fac.5
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 13:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=4dtzTFOnMPiWvS9NLNA0mqLFC7hsFAHAm90iIPVobYc=;
 b=SeFZ79e0Ib2qe8lWGXWbtJnO1uoeTkXxuyOheUHiRumZOEHdQ89jRkc6vdvRF88xO2
 0Q4WYBhfDHleGxaz7VEEdJub6/39aUSVuRtjj/iz4GfWVibrycWLP9p7CE8N1TJdzl4d
 qhgEgwEFHJndse9bYsrgVCgE+K0BCAgLTLlWW1gzXtQ8bmaF20ywDRNiRWy1bZFRPsHG
 0toLbWcpLKKazTOTp3TvkQW/FdV3lFfIE4wYErDaXHpUgSfYGrDAfhCBLMZv/v3Iv0cM
 ziNo0d3c97R3XwyxAKdIQSO4xdgM/1+2YjQcXlnBn8tkfDubyPNVAMyQioPLNvin9y3g
 UWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=4dtzTFOnMPiWvS9NLNA0mqLFC7hsFAHAm90iIPVobYc=;
 b=yyzaprj9XsyUsJ36foxuhDPGGgImUibhCnmQd2vGf6L7V3fuz9AbVegByFJHqt55Um
 JgUIKalXG9c+gHvWhu77RlyCrNdx93OF0anXK+yVRhcaV2zWSgSA+y5VJoPDPxNz4ZTc
 f11L0k453nWPa+HB6jFLhdT/JILPOP4tAYqDASNFrzHHcw57WaP4uNcXlO9+sAa5nwN9
 gKd8rLE/ZwrJlHSSv9l4VsiR4Z6X+N15/D8ix2NMu7Q0tSsWAeaSE1zd/9DPJj5zkUVe
 6eqgVii/3U/UxSa1jYpYO96WAiaqK4pUbM9gGr0Ehl2yUrMxWThkEcwOdaQYDfxQVdBh
 GBjg==
X-Gm-Message-State: ACgBeo0plt/zwUd30kKcfDpLQu84rpfjDXel5+tGUMHFgy9cL9jt8bIf
 JaK4UPzzZdb5gIYLmy6FviH+w0Lji4JR8nq5v2vxUoSf
X-Google-Smtp-Source: AA6agR6bJkCopn47V4nY1QH2wV548mliE5H5Sqfe/Al4hqBtReFyVjXia6hjtMitXPe9oKY4lE/EfAxJW9M+RkLGNrg=
X-Received: by 2002:a05:6870:e98b:b0:10d:fe5c:f818 with SMTP id
 r11-20020a056870e98b00b0010dfe5cf818mr7637447oao.106.1660595141685; Mon, 15
 Aug 2022 13:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220813153421.4754-1-tangmin@cdjrlc.com>
In-Reply-To: <20220813153421.4754-1-tangmin@cdjrlc.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 15 Aug 2022 16:25:30 -0400
Message-ID: <CADnq5_O0CD0s0=Rf7+c4FDg_Gte7NPdh7OVrBda=Wq6mDOzz4g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Unneeded semicolon
To: min tang <tangmin@cdjrlc.com>
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
Cc: Charlene.Liu@amd.com, airlied@linux.ie, qingqing.zhuo@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sunpeng.li@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Sat, Aug 13, 2022 at 11:35 AM min tang <tangmin@cdjrlc.com> wrote:
>
> There is no semicolon after '}' in line 510.
>
> Signed-off-by: min tang <tangmin@cdjrlc.com>
> ---
>  drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
> index 27501b735a9c..c87cf8771c6d 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
> @@ -505,7 +505,7 @@ static void dcn315_clk_mgr_helper_populate_bw_params(
>                 bw_params->clk_table.entries[i].dispclk_mhz = clock_table->DispClocks[i];
>                 bw_params->clk_table.entries[i].dppclk_mhz = clock_table->DppClocks[i];
>                 bw_params->clk_table.entries[i].wck_ratio = 1;
> -       };
> +       }
>
>         /* Make sure to include at least one entry and highest pstate */
>         if (max_pstate != min_pstate || i == 0) {
> --
> 2.17.1
>
