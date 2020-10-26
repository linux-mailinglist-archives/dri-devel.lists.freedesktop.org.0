Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48041299232
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 17:20:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA07E6E044;
	Mon, 26 Oct 2020 16:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C29236E044;
 Mon, 26 Oct 2020 16:20:50 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id d78so12271037wmd.3;
 Mon, 26 Oct 2020 09:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FneYwIRzGWRgT/Sz6YdB9/M1Akj6cm+qmZoMOttLQjk=;
 b=ZfV3YV9hqOUVSJRCNHJ5pMK+LrpPzJT56mirDKob6UJrKlhMcf8Sl5+0Wapx48W3Zj
 CSWyHrEe52EIB6QfMQwHQH9gpnv0Gqmregjr/qU8YjQSe35IC2+2mF/Ud2EJ+QNig1af
 s7UwftDK7X48ZswkeVz3xjCvsa3qqO2osbuR865qfeti0dKR8esZbUTapVu1IQ0Mu/sp
 NeO03lSDL0DZTgDhZXbV/LQSvsmuAtwTZRXYAKkLrUNytJVRxyAXlMYLeqMvxTI1W1wB
 ap9NnMMobfpSzL/PHHEfY1Icrl0YZvvPjXhWie9b5469MbtX2ckq6KElgfHLkIPCr2jv
 U9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FneYwIRzGWRgT/Sz6YdB9/M1Akj6cm+qmZoMOttLQjk=;
 b=KYHt9Pp3Wld8g6j4WPv0l90MkFH/owB2JMZLs/DSpuGoUSJOJA9CeCnM7SuU9ClGzq
 eaYVihsjPB+VB47MUAEl8c72KBuIjRZrmzbDJ9yFvtEeVLFpTEF2SivutN6P4lT4yPiz
 iwz+Qh4570shJzjrp6rPr/kgvqvi5Rpd8BvoNUcLttFPZuib3JtzA3ZcX8tcdKMHc9AJ
 +QJTmyhD3/1SBNduCZAxhzpfcqkCscCzD/KBp7oWPBoxLmMw/qIreoEtp0eWlcWgAYQE
 WxtAaKuSKLU3LqJuccxGo6O8ilSJtp6X8QnvAJzJaU8roc+n8y1mcDKRc3V0TvNwT764
 sSuw==
X-Gm-Message-State: AOAM531eWCl3G4kdu6Yg9kMGu8nBnI92M93+b60+vLlZ66h1yxHirEBK
 tSWRnT2hrlXSLt+wOwDfglhbWNsWlFEsTp2QK6dY7zcp
X-Google-Smtp-Source: ABdhPJwtVnC/D43zPbJQlp/7EvUuT3yhGhh8G+o60Y77WMEfvByKDNna6OOP9xyMc5nmXxQ83OFOAg/WoA3glNMCS00=
X-Received: by 2002:a1c:6302:: with SMTP id x2mr17098606wmb.56.1603729249478; 
 Mon, 26 Oct 2020 09:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <20201026115930.14991-1-zhangqilong3@huawei.com>
In-Reply-To: <20201026115930.14991-1-zhangqilong3@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 26 Oct 2020 12:20:38 -0400
Message-ID: <CADnq5_NeD__bpPcs7cQWWNyUmGtjKVo+yQ_3GOYSM+Sx8L=H8Q@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amdgpu: Discard unnecessary breaks
To: Zhang Qilong <zhangqilong3@huawei.com>
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
Cc: Dave Airlie <airlied@linux.ie>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Oct 26, 2020 at 11:31 AM Zhang Qilong <zhangqilong3@huawei.com> wrote:
>
> The 'break' is unnecessary because of previous
> 'return', discard it.
>
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/atombios_encoders.c | 6 ------
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c         | 4 ----
>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c         | 7 -------
>  3 files changed, 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> index 8339c8c3a328..fa817ebff980 100644
> --- a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> +++ b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> @@ -499,10 +499,8 @@ int amdgpu_atombios_encoder_get_encoder_mode(struct drm_encoder *encoder)
>                 } else {
>                         return ATOM_ENCODER_MODE_DVI;
>                 }
> -               break;
>         case DRM_MODE_CONNECTOR_LVDS:
>                 return ATOM_ENCODER_MODE_LVDS;
> -               break;
>         case DRM_MODE_CONNECTOR_DisplayPort:
>                 dig_connector = amdgpu_connector->con_priv;
>                 if ((dig_connector->dp_sink_type == CONNECTOR_OBJECT_ID_DISPLAYPORT) ||
> @@ -519,20 +517,16 @@ int amdgpu_atombios_encoder_get_encoder_mode(struct drm_encoder *encoder)
>                 } else {
>                         return ATOM_ENCODER_MODE_DVI;
>                 }
> -               break;
>         case DRM_MODE_CONNECTOR_eDP:
>                 return ATOM_ENCODER_MODE_DP;
>         case DRM_MODE_CONNECTOR_DVIA:
>         case DRM_MODE_CONNECTOR_VGA:
>                 return ATOM_ENCODER_MODE_CRT;
> -               break;
>         case DRM_MODE_CONNECTOR_Composite:
>         case DRM_MODE_CONNECTOR_SVIDEO:
>         case DRM_MODE_CONNECTOR_9PinDIN:
>                 /* fix me */
>                 return ATOM_ENCODER_MODE_TV;
> -               /*return ATOM_ENCODER_MODE_CV;*/
> -               break;
>         }
>  }
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> index 5963cbe0d455..34448df0ccf3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> @@ -2202,22 +2202,18 @@ static int dce_v10_0_pick_dig_encoder(struct drm_encoder *encoder)
>                         return 1;
>                 else
>                         return 0;
> -               break;
>         case ENCODER_OBJECT_ID_INTERNAL_UNIPHY1:
>                 if (dig->linkb)
>                         return 3;
>                 else
>                         return 2;
> -               break;
>         case ENCODER_OBJECT_ID_INTERNAL_UNIPHY2:
>                 if (dig->linkb)
>                         return 5;
>                 else
>                         return 4;
> -               break;
>         case ENCODER_OBJECT_ID_INTERNAL_UNIPHY3:
>                 return 6;
> -               break;
>         default:
>                 DRM_ERROR("invalid encoder_id: 0x%x\n", amdgpu_encoder->encoder_id);
>                 return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> index 1954472c8e8f..eb16f7529223 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> @@ -2235,22 +2235,18 @@ static int dce_v11_0_pick_dig_encoder(struct drm_encoder *encoder)
>                         return 1;
>                 else
>                         return 0;
> -               break;
>         case ENCODER_OBJECT_ID_INTERNAL_UNIPHY1:
>                 if (dig->linkb)
>                         return 3;
>                 else
>                         return 2;
> -               break;
>         case ENCODER_OBJECT_ID_INTERNAL_UNIPHY2:
>                 if (dig->linkb)
>                         return 5;
>                 else
>                         return 4;
> -               break;
>         case ENCODER_OBJECT_ID_INTERNAL_UNIPHY3:
>                 return 6;
> -               break;
>         default:
>                 DRM_ERROR("invalid encoder_id: 0x%x\n", amdgpu_encoder->encoder_id);
>                 return 0;
> @@ -2304,19 +2300,16 @@ static u32 dce_v11_0_pick_pll(struct drm_crtc *crtc)
>                                 return ATOM_COMBOPHY_PLL1;
>                         else
>                                 return ATOM_COMBOPHY_PLL0;
> -                       break;
>                 case ENCODER_OBJECT_ID_INTERNAL_UNIPHY1:
>                         if (dig->linkb)
>                                 return ATOM_COMBOPHY_PLL3;
>                         else
>                                 return ATOM_COMBOPHY_PLL2;
> -                       break;
>                 case ENCODER_OBJECT_ID_INTERNAL_UNIPHY2:
>                         if (dig->linkb)
>                                 return ATOM_COMBOPHY_PLL5;
>                         else
>                                 return ATOM_COMBOPHY_PLL4;
> -                       break;
>                 default:
>                         DRM_ERROR("invalid encoder_id: 0x%x\n", amdgpu_encoder->encoder_id);
>                         return ATOM_PPLL_INVALID;
> --
> 2.17.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
