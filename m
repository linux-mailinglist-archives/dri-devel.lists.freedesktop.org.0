Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D753068C79C
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 21:24:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2331E10EA42;
	Mon,  6 Feb 2023 20:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93FC510EA3F;
 Mon,  6 Feb 2023 20:24:52 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 n25-20020a9d7119000000b0068bd8c1e836so3556161otj.3; 
 Mon, 06 Feb 2023 12:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ii3QWaTSpWqp8nAIBHYKbEzhocMIY28k394B8Gv37po=;
 b=EIsiXELTDJZsBHSzEz0zei/PUThrVQSlx0895jVSVUXzJ9Ee0VIVViPE29DCHdJQ1I
 ueoaQxqXV4qHNWNBu6FhGAPMC3i3SsTdk3p9nY7zcUAizG7Zh539bk3rjJFuAQgf02Md
 wbmyC2j/iNPuVdMqHG0w81geTiflP2FO6+dW+rWN02ZYRuI5dNYXZ2Beh9tTg+cQ/8WW
 YdfESXCvyBZsWyQjfB+IzEXp15yDOnJvxBaTsuFYjWTVTu8xYibijEZXh2y29ujyQfSa
 zhVo3saNVNroFTdkrlh+zFCkNITKmkjN1PJ6hl65Vt4RHbE6RDMPKlPrY09T/jeT7Hdh
 Zc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ii3QWaTSpWqp8nAIBHYKbEzhocMIY28k394B8Gv37po=;
 b=Fk+NJVCe3U2Btqq2GRmztwfSPsC8D3pXrWwwfAt3l4+KIroLSuPuUpwudhQc3CCVV/
 WClWFzf8B1HeoXv4+F7cFi+uC7DoKFtACccbdDQVhjg0vPL3qT48ytPyqtP05xpc7Ivy
 6tUXRaGbN+toISbvGGyjqAgMGap1IofIzgwKgzcz/wa50yUIBeWeALPalO63cWdF+4U6
 eBLK8t/N98NLFC+kdZ96nTUxRRLBrHlXWxQpEnZHCYhVnjHZIoC6UpuqKG4Uqh+aNSMD
 ka+nd+dH2f98vHmyDmT6sI/xGF3giNJXgDShZQgWwDLSlscuKbCH4CBV55D6qBP0/0Iy
 omWQ==
X-Gm-Message-State: AO0yUKUABwaL6xctpT02G31/LgEpaNV6VCHXibspUv3tj/xO8qbF/O+h
 1FL90xnem90XJtIUrE0dTK6zhBpz3ztltjpZ7Nk=
X-Google-Smtp-Source: AK7set9oYVPJvXFFlrdhnRzD5XmmpUtCk86aL0C9pwbKJGoLMv/n+wmWY4auI9t864Gv+GlUtukuDRtHa2bkjtuBMD4=
X-Received: by 2002:a05:6830:22e1:b0:686:413a:59ae with SMTP id
 t1-20020a05683022e100b00686413a59aemr40628otc.120.1675715091814; Mon, 06 Feb
 2023 12:24:51 -0800 (PST)
MIME-Version: 1.0
References: <20230206193620.69550-1-arnd@kernel.org>
In-Reply-To: <20230206193620.69550-1-arnd@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 6 Feb 2023 15:24:39 -0500
Message-ID: <CADnq5_OAZ2-sKs8Cr3=t3SjMT9NoGBFRbh2Jtzpy60x_5xsKCQ@mail.gmail.com>
Subject: Re: [PATCH] [SUBMITTED 20210927] [RESEND^2] drm/amdgpu: fix enum
 odm_combine_mode mismatch
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
Cc: Arnd Bergmann <arnd@arndb.de>, Leo Li <sunpeng.li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Nevenko Stupar <Nevenko.Stupar@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Yang Li <yang.lee@linux.alibaba.com>,
 Jun Lei <Jun.Lei@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pavle Kotarac <Pavle.Kotarac@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 6, 2023 at 2:36 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> A conversion from 'bool' to 'enum odm_combine_mode' was incomplete,
> and gcc warns about this with many instances of
>
> display/dc/dml/dcn20/display_mode_vba_20.c:3899:44: warning: implicit conversion from 'enum <anonymous>' to 'enum
> odm_combine_mode' [-Wenum-conversion]
>  3899 |     locals->ODMCombineEnablePerState[i][k] = false;
>
> Change the ones that we get a warning for, using the same numerical
> values to leave the behavior unchanged.
>
> Fixes: 5fc11598166d ("drm/amd/display: expand dml structs")
> Link: https://lore.kernel.org/all/20201026210039.3884312-3-arnd@kernel.org/
> Link: https://lore.kernel.org/all/20210927100659.1431744-1-arnd@kernel.org/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I sent this in 2020 and in 2021, but never got a reply and the warning
> is still there.

Applied.  Sorry for the delay.

Alex

> ---
>  .../amd/display/dc/dml/dcn20/display_mode_vba_20.c   |  8 ++++----
>  .../amd/display/dc/dml/dcn20/display_mode_vba_20v2.c | 10 +++++-----
>  .../amd/display/dc/dml/dcn21/display_mode_vba_21.c   | 12 ++++++------
>  3 files changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
> index f34bc3c8da41..69c41e3e3ba2 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
> @@ -3901,14 +3901,14 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>                                         mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine = mode_lib->vba.PixelClock[k] / 2
>                                                         * (1 + mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0);
>
> -                               locals->ODMCombineEnablePerState[i][k] = false;
> +                               locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_disabled;
>                                 mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithoutODMCombine;
>                                 if (mode_lib->vba.ODMCapability) {
>                                         if (locals->PlaneRequiredDISPCLKWithoutODMCombine > mode_lib->vba.MaxDispclkRoundedDownToDFSGranularity) {
> -                                               locals->ODMCombineEnablePerState[i][k] = true;
> +                                               locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
>                                                 mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>                                         } else if (locals->HActive[k] > DCN20_MAX_420_IMAGE_WIDTH && locals->OutputFormat[k] == dm_420) {
> -                                               locals->ODMCombineEnablePerState[i][k] = true;
> +                                               locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
>                                                 mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>                                         }
>                                 }
> @@ -3961,7 +3961,7 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>                                 locals->RequiredDISPCLK[i][j] = 0.0;
>                                 locals->DISPCLK_DPPCLK_Support[i][j] = true;
>                                 for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
> -                                       locals->ODMCombineEnablePerState[i][k] = false;
> +                                       locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_disabled;
>                                         if (locals->SwathWidthYSingleDPP[k] <= locals->MaximumSwathWidth[k]) {
>                                                 locals->NoOfDPP[i][j][k] = 1;
>                                                 locals->RequiredDPPCLK[i][j][k] = locals->MinDPPCLKUsingSingleDPP[k]
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
> index 366138df0fe2..f475a0ae946c 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
> @@ -4012,17 +4012,17 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
>                                         mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine = mode_lib->vba.PixelClock[k] / 2
>                                                         * (1 + mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0);
>
> -                               locals->ODMCombineEnablePerState[i][k] = false;
> +                               locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_disabled;
>                                 mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithoutODMCombine;
>                                 if (mode_lib->vba.ODMCapability) {
>                                         if (locals->PlaneRequiredDISPCLKWithoutODMCombine > MaxMaxDispclkRoundedDown) {
> -                                               locals->ODMCombineEnablePerState[i][k] = true;
> +                                               locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
>                                                 mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>                                         } else if (locals->DSCEnabled[k] && (locals->HActive[k] > DCN20_MAX_DSC_IMAGE_WIDTH)) {
> -                                               locals->ODMCombineEnablePerState[i][k] = true;
> +                                               locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
>                                                 mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>                                         } else if (locals->HActive[k] > DCN20_MAX_420_IMAGE_WIDTH && locals->OutputFormat[k] == dm_420) {
> -                                               locals->ODMCombineEnablePerState[i][k] = true;
> +                                               locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
>                                                 mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>                                         }
>                                 }
> @@ -4075,7 +4075,7 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
>                                 locals->RequiredDISPCLK[i][j] = 0.0;
>                                 locals->DISPCLK_DPPCLK_Support[i][j] = true;
>                                 for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
> -                                       locals->ODMCombineEnablePerState[i][k] = false;
> +                                       locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_disabled;
>                                         if (locals->SwathWidthYSingleDPP[k] <= locals->MaximumSwathWidth[k]) {
>                                                 locals->NoOfDPP[i][j][k] = 1;
>                                                 locals->RequiredDPPCLK[i][j][k] = locals->MinDPPCLKUsingSingleDPP[k]
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
> index eeb4d3441e1d..3a896d0172a9 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
> @@ -4106,17 +4106,17 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>                                         mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine = mode_lib->vba.PixelClock[k] / 2
>                                                         * (1 + mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0);
>
> -                               locals->ODMCombineEnablePerState[i][k] = false;
> +                               locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_disabled;
>                                 mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithoutODMCombine;
>                                 if (mode_lib->vba.ODMCapability) {
>                                         if (locals->PlaneRequiredDISPCLKWithoutODMCombine > MaxMaxDispclkRoundedDown) {
> -                                               locals->ODMCombineEnablePerState[i][k] = true;
> +                                               locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
>                                                 mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>                                         } else if (locals->DSCEnabled[k] && (locals->HActive[k] > DCN21_MAX_DSC_IMAGE_WIDTH)) {
> -                                               locals->ODMCombineEnablePerState[i][k] = true;
> +                                               locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
>                                                 mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>                                         } else if (locals->HActive[k] > DCN21_MAX_420_IMAGE_WIDTH && locals->OutputFormat[k] == dm_420) {
> -                                               locals->ODMCombineEnablePerState[i][k] = true;
> +                                               locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
>                                                 mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>                                         }
>                                 }
> @@ -4169,7 +4169,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>                                 locals->RequiredDISPCLK[i][j] = 0.0;
>                                 locals->DISPCLK_DPPCLK_Support[i][j] = true;
>                                 for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
> -                                       locals->ODMCombineEnablePerState[i][k] = false;
> +                                       locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_disabled;
>                                         if (locals->SwathWidthYSingleDPP[k] <= locals->MaximumSwathWidth[k]) {
>                                                 locals->NoOfDPP[i][j][k] = 1;
>                                                 locals->RequiredDPPCLK[i][j][k] = locals->MinDPPCLKUsingSingleDPP[k]
> @@ -5234,7 +5234,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>                         mode_lib->vba.ODMCombineEnabled[k] =
>                                         locals->ODMCombineEnablePerState[mode_lib->vba.VoltageLevel][k];
>                 } else {
> -                       mode_lib->vba.ODMCombineEnabled[k] = false;
> +                       mode_lib->vba.ODMCombineEnabled[k] = dm_odm_combine_mode_disabled;
>                 }
>                 mode_lib->vba.DSCEnabled[k] =
>                                 locals->RequiresDSC[mode_lib->vba.VoltageLevel][k];
> --
> 2.39.0
>
