Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC74664E13C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 19:47:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD1B10E4FA;
	Thu, 15 Dec 2022 18:47:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 130BE10E512;
 Thu, 15 Dec 2022 18:47:15 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id s187so6054118oie.10;
 Thu, 15 Dec 2022 10:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CsTgnx/vUhdK+gz2CNEy5Z7hFYOJSlBzwtF5agxWOL8=;
 b=oJ/RLh3LE65rNsavJKHaY98DljooO1VSJWFUTr1wmqLEJMXIOe0CN8Q6agEtH9pvrl
 G0829Arhxti8Lxq/OboQdCGpM+BSSMy0u5YyANB0ogTqs7q29XR3OscSrV7QugBmLFVT
 5965GQ0r+20cquOxy7daSlbU9JSNv206QtP6u11wF0wmcfrZ2k5db2HoY18AnFjQ1QrN
 1Z8lML5DrGwyC4pgMHY3nFGGbRkvE3y7el4uYo4JlJQRjIR6yP0cTpl8w84fUt39z8Qb
 h7zgh8ztAeAa62eIxcm6VpzgPY7BiuaWyhLBvFCoLkcXVDABUvDH2EW3pASKTqCR/MTg
 7yjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CsTgnx/vUhdK+gz2CNEy5Z7hFYOJSlBzwtF5agxWOL8=;
 b=lPKkZXPkOPuoGzPBaDDlhfBKDY0MjtmL3oQ0h0PflcJHC/4rhtEHbIgfeXe7zirNpy
 xYVVD7KWh8zaON2YrvMuzNbs9/bm0WobnlR4LwO8vLmyXYG5RnnzDMUs9NjJcn1gJLbH
 EIGY2xtBHwRzvCAY+zhxFmQFHykycSKNyVohIqLfGrE/xqoUabDDmlyCG5gGDioW5hAx
 EED+kq1RzCR20xeXKF7roBoWXw3Q07Bo5rTlvBtARoa63o/V3mVxDm9C1jzMBfdwgFT0
 IgPBPZ0ZEKWKO1lBYdmLkVifNafcbjM3AB4szL+4tiKihwMSSI3xcH/3s3jNcQK8IvpZ
 yE6w==
X-Gm-Message-State: ANoB5pldtzXvwp/mXV/rhoT4Txc8tL0rrcDpcVbd2cyX3UvzGwtcIkgG
 FRMORJMMeB5wn3vQ3Nls2SZcYlfFQX4X5ZLgS4AMKhgk
X-Google-Smtp-Source: AA0mqf6sYeW3AlVu8sndUu1dAS9K8n4qGS3TdVKb977xhfSHkDUXzaWLTbMPA09k52WEWKWPUGEt6dskSiK1BWnMQhs=
X-Received: by 2002:a05:6808:1cd:b0:35b:f5f7:3ed0 with SMTP id
 x13-20020a05680801cd00b0035bf5f73ed0mr464102oic.46.1671130034322; Thu, 15 Dec
 2022 10:47:14 -0800 (PST)
MIME-Version: 1.0
References: <20221215164537.1126692-1-arnd@kernel.org>
In-Reply-To: <20221215164537.1126692-1-arnd@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 Dec 2022 13:47:02 -0500
Message-ID: <CADnq5_MxnmXaMW+D-F6fDLafwWPojHr2YuwX1mY8VM5a3S_Yjw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix duplicate assignments
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: Charlene Liu <Charlene.Liu@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Roman Li <roman.li@amd.com>,
 Alex Hung <alex.hung@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Michael Strauss <michael.strauss@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Duncan Ma <duncan.ma@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Dec 15, 2022 at 11:46 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The .set_odm_combine callback pointer was added twice, causing
> a harmless -Wextra warning:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn314/dcn314_optc.c:258:36: error: initialized field overwritten [-Werror=override-init]
>   258 |                 .set_odm_combine = optc314_set_odm_combine,
>       |                                    ^~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn314/dcn314_optc.c:258:36: note: (near initialization for 'dcn314_tg_funcs.set_odm_combine')
>
> Fixes: 5ade1b951dec ("drm/amd/display: Add OTG/ODM functions")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c
> index f246aab23050..0086cafb0f7a 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c
> @@ -241,7 +241,6 @@ static struct timing_generator_funcs dcn314_tg_funcs = {
>                 .set_dsc_config = optc3_set_dsc_config,
>                 .get_dsc_status = optc2_get_dsc_status,
>                 .set_dwb_source = NULL,
> -               .set_odm_combine = optc314_set_odm_combine,
>                 .get_optc_source = optc2_get_optc_source,
>                 .set_out_mux = optc3_set_out_mux,
>                 .set_drr_trigger_window = optc3_set_drr_trigger_window,
> --
> 2.35.1
>
