Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AEF690BCD
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 15:31:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5AD410E23B;
	Thu,  9 Feb 2023 14:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E38E10EB03;
 Thu,  9 Feb 2023 14:31:38 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-169ba826189so2762813fac.2; 
 Thu, 09 Feb 2023 06:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bAHq2aXoHE9Fe/KZsmeyboiiKh6zP+A9gzRXjKBxKu8=;
 b=ZcoBm1Ri0Z9Sk5SjI7nRheQwxs5BaGMxW+if4vsk8pC6GqwRLdSLhV+aNhibhJOOZ2
 8ojHsKob/AgvRN11PPVSh17NuQ1V/L/vJcUEBRFDt6e95suHbthebKmUyv3DowKX1H5u
 jZAL1hTKf+UUfYIqFhMyu92POgbnS9hi3RnUBRO/zL1a5em5CHRfJeMFQRg+2dVZhfWS
 vUuHQ+MfUD4iYHxLQfLtPxlPHTyii+nHqUD24gUV/UGT35S8CazCeiYBeVUpUUBUdBNE
 XUGrvSfZHJbFrGKOC/Pu8XhjcYJoDtbfwMfS93GI9ne9diwciFOxP3PhhOhmEAQdUvs4
 C1EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bAHq2aXoHE9Fe/KZsmeyboiiKh6zP+A9gzRXjKBxKu8=;
 b=QJpcCXa9AKuLcjDjRzSbPhAhVxVW1J6U96njQ2akGfNMUidzwYI+WuAPFjjFiYjFvb
 G3uFq/Al9R5TIFDIk8/JyZBqeMEneQlFXileFyK+PmzyMGi7G6VXe4vOx4cX42Aals/W
 j7hyI+bANfVo4VnsqvSY/1UyY0UdlyDTQvzHgpKpgMrGAkpQ+z6VEarplFc1BAH5j9WF
 gx9+7jnwbAmEteKPIrGRdhR8nzdTfsDzbL91CgJLEmP/r+iZmws15e++UoZksvUdRmc7
 S8bsFLCmh25ttgUUdHjgBd6iPz0dvaXVom384adZiAxs66Ir8oq3EZT800tTKlkiujXi
 EDcg==
X-Gm-Message-State: AO0yUKVRwAInIJ8MyVzTL5X1P1RRCwGCrbIrn9ZQI23TgAQqLlx2tbUV
 RO/2Vov6zQv5jDXrIJcs9ccu45NXbQnc++zzg68=
X-Google-Smtp-Source: AK7set82uDRv5nADn17D2bnmo1l46P/8c3InNahDM5vhaCkpxSWLBEyOT4US+eVY9f1hThDEzvpdaL7BWFbrQfaRTzU=
X-Received: by 2002:a05:6871:29c:b0:163:8cc6:86a with SMTP id
 i28-20020a056871029c00b001638cc6086amr1083579oae.46.1675953097478; Thu, 09
 Feb 2023 06:31:37 -0800 (PST)
MIME-Version: 1.0
References: <20230209124513.1341645-1-arnd@kernel.org>
In-Reply-To: <20230209124513.1341645-1-arnd@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 9 Feb 2023 09:31:25 -0500
Message-ID: <CADnq5_PMNWFZR-ZJ2d4RUtNJDLsP1AGEqLs27X4A7R22L5H3bQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix link_validation build failure
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
Cc: Arnd Bergmann <arnd@arndb.de>, Leo Li <sunpeng.li@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, George Shen <George.Shen@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Feb 9, 2023 at 7:45 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> When CONFIG_DRM_AMD_DC_DCN is disabled, the is_frl member
> is not defined:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.c: In function 'dp_active_dongle_validate_timing':
> drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.c:126:66: error: 'const struct dc_dsc_config' has no member named 'is_frl'
>   126 |                         if (timing->flags.DSC && !timing->dsc_cfg.is_frl)
>       |                                                                  ^
>
> Use the same #ifdef as the other references to this.
>
> Fixes: 54618888d1ea ("drm/amd/display: break down dc_link.c")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/amd/display/dc/link/link_validation.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_validation.c b/drivers/gpu/drm/amd/display/dc/link/link_validation.c
> index cd821d077d73..8ddebf3bdd46 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/link_validation.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/link_validation.c
> @@ -123,9 +123,11 @@ static bool dp_active_dongle_validate_timing(
>                 if (dongle_caps->dp_hdmi_frl_max_link_bw_in_kbps > 0) { // DP to HDMI FRL converter
>                         struct dc_crtc_timing outputTiming = *timing;
>
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
>                         if (timing->flags.DSC && !timing->dsc_cfg.is_frl)
>                                 /* DP input has DSC, HDMI FRL output doesn't have DSC, remove DSC from output timing */
>                                 outputTiming.flags.DSC = 0;
> +#endif
>                         if (dc_bandwidth_in_kbps_from_timing(&outputTiming) > dongle_caps->dp_hdmi_frl_max_link_bw_in_kbps)
>                                 return false;
>                 } else { // DP to HDMI TMDS converter
> --
> 2.39.1
>
