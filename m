Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E28599ECE
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 17:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67CDF10F3B3;
	Fri, 19 Aug 2022 15:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC62210F3A7;
 Fri, 19 Aug 2022 15:52:13 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-11ce6cfabfeso1233594fac.0; 
 Fri, 19 Aug 2022 08:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=v74dd6HYD0i7hENs14lzGrojrLKHvAvTubOc2U5IsPs=;
 b=UJPFKMOL8xqH7+706gXdMjNwiOmwm0OztJOlHe+F6McBtwkJ7gGGHN8/BFGT3t4Vvd
 8u1qK3fjGxAmeyIXDE3lj4eC+MqY12P1OAbPgM/M4tWBy0nDlESQgpsZfiMzDPL/Q5fk
 HXCPxiIesYJNUn+LBKujfhwZsiQQYs3DqciNC85MyU/B2Dp/UND+hBwfqYnE5CXfXEG7
 6UDn/27+5DEqKozrfhkaHeqOl7eB3DbjQY2ysUVvf7LsHJ9kUO68fbnh3KwwJWOH6zlu
 tEYqXNSc8RhmL5MKuo36N8EJbM/D1A9uXaJyqk6fFRGgQVJmcyDDxsTmog7gTD/Dci27
 meVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=v74dd6HYD0i7hENs14lzGrojrLKHvAvTubOc2U5IsPs=;
 b=RQ3SP6mTwMKE3wI3yVwTns+hfzAWpo6DddF/8UgMeAXu1cqoAnihw4ywRXXwApfaIm
 gZP1lDtMuk/IZpgw8SGOASnp8mUKPgsl5QRHVWAikdtb9HAnPfSG8SPS2l+IlDHeqCJb
 rMVrGkozZvffvg0r3C9SEPxwcQO7VSSCQ1pk6TvQm2jCytHHpaF5gGUovGvm6p9AFSl1
 qCjS9UnF+LVDFGAtMuj6rfPPkSWgaRig4/4VX3N1ClBCECEQM7p2N4HLhJjvYxL8AwMt
 tZP6zMzmWn/JgcraFCBibS+qTFiE8OsCivIv4OCfyUe9BGAJ3KmfJOrDfji1HOLtLxpD
 tMJQ==
X-Gm-Message-State: ACgBeo1JRICkACAx8XEPx0VF2jGTUGom9XLCmVQr0ZNfylo7p3i58K2J
 6KDfR/Ibpj7dObn7LP0bX+jIsBA7LHeLCxMRguyZSHDj
X-Google-Smtp-Source: AA6agR5DjXNrqUvWnLjrQO2xY+N7bzB4757kWvfZj34cMCToRKLO2sI1h9MI9PAMDyq49BVCyuJ7l0Mxznf2pHm0G8s=
X-Received: by 2002:a05:6870:3398:b0:113:7f43:d0e9 with SMTP id
 w24-20020a056870339800b001137f43d0e9mr4091303oae.33.1660924332966; Fri, 19
 Aug 2022 08:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220818132730.399334-1-mairacanal@riseup.net>
In-Reply-To: <20220818132730.399334-1-mairacanal@riseup.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 19 Aug 2022 11:52:01 -0400
Message-ID: <CADnq5_O8Pu2WxiSiqm0Tfks4znu=_4j09DvgfS=kgoYwXy0z-w@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Include missing header
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>
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
Cc: kernel test robot <lkp@intel.com>, Magali Lemes <magalilemes00@gmail.com>,
 Leo Li <sunpeng.li@amd.com>, tales.aparecida@gmail.com, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, isabbasso@riseup.net,
 andrealmeid@riseup.net, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Aug 18, 2022 at 9:28 AM Ma=C3=ADra Canal <mairacanal@riseup.net> wr=
ote:
>
> The file amdgpu_dm_plane.c missed the header amdgpu_dm_plane.h, which
> resulted on the following warning:
>
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:1046:5:
> warning: no previous prototype for 'fill_dc_scaling_info'
> [-Wmissing-prototypes]
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:1222:6:
> warning: no previous prototype for 'handle_cursor_update'
> [-Wmissing-prototypes]
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:152:6:
> warning: no previous prototype for 'modifier_has_dcc'
> [-Wmissing-prototypes]
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:1576:5:
> warning: no previous prototype for 'amdgpu_dm_plane_init'
> [-Wmissing-prototypes]
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:157:10:
> warning: no previous prototype for 'modifier_gfx9_swizzle_mode'
> [-Wmissing-prototypes]
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:752:5:
> warning: no previous prototype for 'fill_plane_buffer_attributes'
> [-Wmissing-prototypes]
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:83:31:
> warning: no previous prototype for 'amd_get_format_info'
> [-Wmissing-prototypes]
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:88:6:
> warning: no previous prototype for 'fill_blending_from_plane_state'
> [-Wmissing-prototypes]
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:992:5:
> warning: no previous prototype for 'dm_plane_helper_check_state'
> [-Wmissing-prototypes]
>
> Therefore, include the missing header on the file and turn global functio=
ns
> that are not used outside of the file into static functions.
>
> Fixes: 5d945cbcd4b1 ("drm/amd/display: Create a file dedicated to planes"=
)
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Ma=C3=ADra Canal <mairacanal@riseup.net>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 5 +++--
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h | 8 --------
>  2 files changed, 3 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/dr=
ivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index b841b8b0a9d8..e022be4df290 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -34,6 +34,7 @@
>  #include "dal_asic_id.h"
>  #include "amdgpu_display.h"
>  #include "amdgpu_dm_trace.h"
> +#include "amdgpu_dm_plane.h"
>  #include "gc/gc_11_0_0_offset.h"
>  #include "gc/gc_11_0_0_sh_mask.h"
>
> @@ -149,12 +150,12 @@ static void add_modifier(uint64_t **mods, uint64_t =
*size, uint64_t *cap, uint64_
>         *size +=3D 1;
>  }
>
> -bool modifier_has_dcc(uint64_t modifier)
> +static bool modifier_has_dcc(uint64_t modifier)
>  {
>         return IS_AMD_FMT_MOD(modifier) && AMD_FMT_MOD_GET(DCC, modifier)=
;
>  }
>
> -unsigned modifier_gfx9_swizzle_mode(uint64_t modifier)
> +static unsigned modifier_gfx9_swizzle_mode(uint64_t modifier)
>  {
>         if (modifier =3D=3D DRM_FORMAT_MOD_LINEAR)
>                 return 0;
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h b/dr=
ivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
> index 95168c2cfa6f..286981a2dd40 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
> @@ -36,17 +36,9 @@ int fill_dc_scaling_info(struct amdgpu_device *adev,
>                          const struct drm_plane_state *state,
>                          struct dc_scaling_info *scaling_info);
>
> -void get_min_max_dc_plane_scaling(struct drm_device *dev,
> -                                 struct drm_framebuffer *fb,
> -                                 int *min_downscale, int *max_upscale);
> -
>  int dm_plane_helper_check_state(struct drm_plane_state *state,
>                                 struct drm_crtc_state *new_crtc_state);
>
> -bool modifier_has_dcc(uint64_t modifier);
> -
> -unsigned int modifier_gfx9_swizzle_mode(uint64_t modifier);
> -
>  int fill_plane_buffer_attributes(struct amdgpu_device *adev,
>                                  const struct amdgpu_framebuffer *afb,
>                                  const enum surface_pixel_format format,
> --
> 2.37.2
>
