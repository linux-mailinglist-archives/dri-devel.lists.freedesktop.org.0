Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCB8599ECB
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 17:51:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4D410F3A5;
	Fri, 19 Aug 2022 15:51:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2577910F3A4;
 Fri, 19 Aug 2022 15:51:17 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id o184so5163160oif.13;
 Fri, 19 Aug 2022 08:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=xgwTvjMwaFjXHhe/IO+w6T7DhkiHCUWjRJpOUsdchd0=;
 b=o9y70K1U/ZFzxXmKgJhnyH/S9odUAA6e++Ppu/HoYfGlet8DA1dkwSjRQH6yV+yZ7n
 yX3TF9mv9X40MfU1n/G/iPTAJYhY5DfBmEXlm5Kk0eHVtfslgQFhzNy8MDQVwT+in96d
 0QgmKJiJwl3JdNVnAcG6s4ydQhb5KxEh4ha+N7UZQr9fXN5Cnf6Qt52h2oNtamyyRekO
 J3rlTjz3kq5h5mlDAVGVisi21fgEV54fLjq7mGNucxWRBS1q2/kMN4Co+BHooEIT979n
 Pmm/GyWAEhbKElFesidIPmEEk8HS68Z/1qTGIHTa3rO86qZoNH4akiWwNwjZNHhq/qlR
 IpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=xgwTvjMwaFjXHhe/IO+w6T7DhkiHCUWjRJpOUsdchd0=;
 b=GENWYUf0aHfivQtxhYkMGF9G6JiCB7ERlpVkgbPtS1RO+Z6pRmKsw/Qrt5ald3iso2
 MRzP/UlXXH/pYTTUHAgYmbJYidOSHSeBnkMJe9bskuhG0ZgrTkZkL2R1QY/QsY8ZLG09
 UFuhfjCIhbJHBZTisYSR8CRMvMwAvbYeeUyae7G+Rh80sLVX2Ai5RujZVBtYxELwnqE0
 6ZoYxnsw7veAxRNUg4ZwhfAj0ACHobMuHmZkw5RDV89SV+GUc+XJxNytsHH+qagJoKa9
 a3HV3LKGoaitoMF7pWMT8msVsrrJr24oVBosKKaGAr6mkmSF3QvG+eFfjZ4j1iISlzg1
 GDDA==
X-Gm-Message-State: ACgBeo2ykghsr/amDc8o99yUk5lzE/YnsTuxZXWpx881kN3xu2p9JTOf
 ir65nyDD2JasqVG1twOWsnyfP/6+6PPISApHuBQ=
X-Google-Smtp-Source: AA6agR7S0xUz50QPqMSnBBMcfiJgBBVAfan5W+tNffrGBgq8Lr/C6R5EhYRVOsOGMWIzKSB1eFOpWCVHozZt4n6o0Jg=
X-Received: by 2002:a05:6808:1491:b0:343:7543:1a37 with SMTP id
 e17-20020a056808149100b0034375431a37mr3653355oiw.106.1660924276437; Fri, 19
 Aug 2022 08:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220818025912.87327-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20220818025912.87327-1-yang.lee@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 19 Aug 2022 11:51:05 -0400
Message-ID: <CADnq5_OX48EnKN8eMaD9tNhiBSME=CYLzvr0-KVP2vXYGBHDaQ@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: remove unneeded semicolon
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: airlied@linux.ie, Abaci Robot <abaci@linux.alibaba.com>, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Aug 17, 2022 at 10:59 PM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> Semicolon is not required after curly braces.
>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=1918
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c
> index beb025cd3dc2..1995e1d708d9 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c
> @@ -614,7 +614,7 @@ static void dcn314_clk_mgr_helper_populate_bw_params(struct clk_mgr_internal *cl
>                 bw_params->clk_table.entries[i].dppclk_mhz = max_dppclk;
>                 bw_params->clk_table.entries[i].wck_ratio = convert_wck_ratio(
>                         clock_table->DfPstateTable[min_pstate].WckRatio);
> -       };
> +       }
>
>         /* Make sure to include at least one entry at highest pstate */
>         if (max_pstate != min_pstate || i == 0) {
> --
> 2.20.1.7.g153144c
>
