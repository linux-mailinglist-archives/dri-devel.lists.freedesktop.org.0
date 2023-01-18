Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E8A67235D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 17:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 729E210E047;
	Wed, 18 Jan 2023 16:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD66210E047;
 Wed, 18 Jan 2023 16:32:27 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-15b9c93848dso27754882fac.1; 
 Wed, 18 Jan 2023 08:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FzGHdZnG38PUUso3BdMIxZ7feb7Goq8YWG54jrX7zvU=;
 b=GzemvJG3q98iiC1WOZ/vHs+0ci5tOEzqaW+djlTNc/h3csNqfHs8q3ah49wH69giFg
 Xd+vx1PvINMXJr9GDJ2t3YQ389aUfD5tKEO8m9EX7XorrooVPyqaC8MV0rd0DEESzKOp
 xBfHIxUjb7j5kk6DaGyyUmFbLg8Ly53BNGcVIVgll32oMGVW9NptEFEkTDjDShyTKlT2
 0e/zPlwN1iCRWFNfpQEA2zAc4wlEnoyROiEP49m+ty63pY27BV4dTFwz2HKjfJUs6BfH
 RNbS8BB868nWBfPIa5dortHoUp2ymPSyXmoV84X/nO9njNScIdO2LeykUaAK0QARvbaM
 Vu1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FzGHdZnG38PUUso3BdMIxZ7feb7Goq8YWG54jrX7zvU=;
 b=4//hkLn0Dx76AazLTIbf8KQJn/PEwdLOrSeK8JCfvujvhfWQKLLdN1YFxDbIiSXhrz
 4i6SsSzctpQneIITbIfP7nf+LlgDWDv//K5qFFvjCCkD/sAH8nlfLDKLrUCVXrKhEkXb
 DkV3Thpxj3oCAPtq2Y+YkvdwtgaQXovgj65aLAGHA0kGPg4tUQgXxWyLCgxcOEutqN2y
 xDb4FcCMUSU9uQ0W5Qxqzc0SXt7fJUjqBlPkEzmuUOI05uecmtzOqex5uucm3QCZhAOX
 yL+ojh7sqD1DUB5W9Nm+t8coaAxutQnGCTKALXlh3oVmnLPBiEAz6Yw03YhZ15o05FzU
 ckTg==
X-Gm-Message-State: AFqh2kpF7nOITUhWaO/X2Tg60YbCRgfgpQ/gtMhKysyEjJOjURMClCdG
 oFScFxJmQeWDRS6DXFdUXF2kzplKrVTt+rU2Y1g=
X-Google-Smtp-Source: AMrXdXs3xaVHPfIEvEvlPCi6maxmp3xBY1Iji7ce+Clj8jRQDwb5a3yegddizqXtH7OPOAPAkq/8C0VDJbyVyAapx/k=
X-Received: by 2002:a05:6870:7a18:b0:15f:5509:9a0d with SMTP id
 hf24-20020a0568707a1800b0015f55099a0dmr726423oab.46.1674059546916; Wed, 18
 Jan 2023 08:32:26 -0800 (PST)
MIME-Version: 1.0
References: <20230118160722.289840-1-arnd@kernel.org>
In-Reply-To: <20230118160722.289840-1-arnd@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 18 Jan 2023 11:32:15 -0500
Message-ID: <CADnq5_NPmDjmU+KpHU6z_pNDoASim7Hokq9XnHu8ONP6HqZZdw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix hdmi_encoded_link_bw definition
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
Cc: Ian Chen <ian.chen@amd.com>, Wesley Chalmers <Wesley.Chalmers@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Leo Li <sunpeng.li@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Solomon Chiu <solomon.chiu@amd.com>,
 Michael Strauss <michael.strauss@amd.com>, dri-devel@lists.freedesktop.org,
 "Shen, George" <George.Shen@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Po Ting Chen <robin.chen@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Jan 18, 2023 at 11:07 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Some of the data structures are hidden when CONFIG_DRM_AMD_DC_DCN is
> disabled, which leads to a link failure:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c:234:21: error: 'union hdmi_encoded_link_bw' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>   234 |         const union hdmi_encoded_link_bw hdmi_encoded_link_bw)
>       |                     ^~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c:234:42: error: parameter 2 ('hdmi_encoded_link_bw') has incomplete type
>   234 |         const union hdmi_encoded_link_bw hdmi_encoded_link_bw)
>       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c:232:17: error: function declaration isn't a prototype [-Werror=strict-prototypes]
>   232 | static uint32_t intersect_frl_link_bw_support(
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c: In function 'get_active_converter_info':
> drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c:1126:76: error: storage size of 'hdmi_encoded_link_bw' isn't known
>  1126 |                                                 union hdmi_encoded_link_bw hdmi_encoded_link_bw;
>       |                                                                            ^~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c:1130:101: error: 'struct <anonymous>' has no member named 'MAX_ENCODED_LINK_BW_SUPPORT'
>  1130 |                                                                                 hdmi_color_caps.bits.MAX_ENCODED_LINK_BW_SUPPORT);
>
> There is probably no need to hide the data structure, and removing
> the #ifdef makes it build cleanly.
>
> Fixes: d5a43956b73b ("drm/amd/display: move dp capability related logic to link_dp_capability")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/amd/display/dc/dc_dp_types.h | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
> index b7e53b7dc4ed..84da54358922 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
> @@ -361,14 +361,10 @@ enum dpcd_downstream_port_detailed_type {
>  union dwnstream_port_caps_byte2 {
>         struct {
>                 uint8_t MAX_BITS_PER_COLOR_COMPONENT:2;
> -#if defined(CONFIG_DRM_AMD_DC_DCN)
>                 uint8_t MAX_ENCODED_LINK_BW_SUPPORT:3;
>                 uint8_t SOURCE_CONTROL_MODE_SUPPORT:1;
>                 uint8_t CONCURRENT_LINK_BRING_UP_SEQ_SUPPORT:1;
>                 uint8_t RESERVED:1;
> -#else
> -               uint8_t RESERVED:6;
> -#endif
>         } bits;
>         uint8_t raw;
>  };
> @@ -406,7 +402,6 @@ union dwnstream_port_caps_byte3_hdmi {
>         uint8_t raw;
>  };
>
> -#if defined(CONFIG_DRM_AMD_DC_DCN)
>  union hdmi_sink_encoded_link_bw_support {
>         struct {
>                 uint8_t HDMI_SINK_ENCODED_LINK_BW_SUPPORT:3;
> @@ -428,7 +423,6 @@ union hdmi_encoded_link_bw {
>         } bits;
>         uint8_t raw;
>  };
> -#endif
>
>  /*4-byte structure for detailed capabilities of a down-stream port
>  (DP-to-TMDS converter).*/
> --
> 2.39.0
>
