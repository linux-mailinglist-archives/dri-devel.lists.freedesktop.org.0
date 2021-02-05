Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F6D310DEC
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 17:34:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2302E6E0DA;
	Fri,  5 Feb 2021 16:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 668D46E048;
 Fri,  5 Feb 2021 16:34:48 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id y72so1756389ooa.5;
 Fri, 05 Feb 2021 08:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K4+nfXJYv6rImfIz10Fvs+e6kT5fBA4A7novTZpwhno=;
 b=YONHGyb/udgiK3VD2rOYX8oHaE7T1sjffo0kIxPPdPSXk8CpzO8I8BqXA6H/7wMLLG
 bFpXxYXdHA1jgetLZBH2nJOKmDZmBJULSIJOyzxtv3M+ou83TDwbkTjInBAGmuO4OpcI
 qEW+f2GarAyKg0U7fNsYfjl48W2MKFq0XjIlOFIE2tlmqweuolDS+w5pgiX3GEr6xVX/
 EZk4JpFcTFgDMhg8RDWYc3Dl8NIr792n7eGo40Abmy8+mt3iPekpWCTHnscvwPxKNMEU
 3gdcXiT2MpO1LC7uLGLwq9GuF4GeHVPuUMvT7o7SmfCmIIJe4v1x8hZlShCeOoXKuyX2
 cI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K4+nfXJYv6rImfIz10Fvs+e6kT5fBA4A7novTZpwhno=;
 b=hyjYipg4fvv8qzAJ/gtcLTpQFllp+2YlkMz2Eii+qZhuVLv+AUmvKHqLSmFScBdwg+
 hoKtLfYz5s8yESrl9Z3B4Bssiga+kTfgHU9fZaceJbuR1VsOfc8lM1GkX5fkhjJB/Qt2
 gzbIs+l4VW34dR2CQpYg5U6lI1DMzk8XywMziboC6+DGeYS6730aLVmaIRAE0t5ZQ2wB
 2VD+5sKGj+PphsOzl6e16l2BD1zW8D4IDa3rFqmKOZ6xn6sYQsdfPyqvnmruTLXWbfaq
 8bwK+8LbqPvvUDwepGntSAGSotY00vtdUlUbaxbV/dU8/ZBZA3au0W3d0b7MXwMHXOrT
 cZ5g==
X-Gm-Message-State: AOAM5323wIkbWR3/dIWkXH89RK9xsxnmtGQ5Uf3O2vMdZab0uNzj7uB1
 9VG3tGmLU1gHNzu8XtNP0YWDzhCqpw+rlGNbW9lIkvNK
X-Google-Smtp-Source: ABdhPJz26jq4z6+ZB9Y4Ob3z1dyE9tYiMcdYGgSiMocrJKsfWKoAQy1qtF3o7twaaJLhdGIUSy1OmLgeEfbUzIR8s6I=
X-Received: by 2002:a4a:ce90:: with SMTP id f16mr3999706oos.61.1612542887714; 
 Fri, 05 Feb 2021 08:34:47 -0800 (PST)
MIME-Version: 1.0
References: <20210203124241.8512-1-tiwai@suse.de>
 <20210203124241.8512-3-tiwai@suse.de>
In-Reply-To: <20210203124241.8512-3-tiwai@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 5 Feb 2021 11:34:36 -0500
Message-ID: <CADnq5_M--+6mCVrQ5-J+NKFeLEGRDcUAPPbmHpAaUJRi6XNBtQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amd/display: Add aux_backlight module option
To: Takashi Iwai <tiwai@suse.de>
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
Cc: Leo Li <sunpeng.li@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 3, 2021 at 7:42 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> There seem devices that don't work with the aux channel backlight
> control.  For allowing such users to test with the other backlight
> control method, provide a new module option, aux_backlight, to specify
> enabling or disabling the aux backport support explicitly.  As
> default, the aux support is detected by the hardware capability.
>
> BugLink: https://bugzilla.opensuse.org/show_bug.cgi?id=1180749
> BugLink: https://gitlab.freedesktop.org/drm/amd/-/issues/1438
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h               | 1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c           | 4 ++++
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +++
>  3 files changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 5993dd0fdd8e..4793cd5e69f9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -179,6 +179,7 @@ extern uint amdgpu_smu_memory_pool_size;
>  extern uint amdgpu_dc_feature_mask;
>  extern uint amdgpu_dc_debug_mask;
>  extern uint amdgpu_dm_abm_level;
> +extern int amdgpu_aux_backlight;
>  extern struct amdgpu_mgpu_info mgpu_info;
>  extern int amdgpu_ras_enable;
>  extern uint amdgpu_ras_mask;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 7169fb5e3d9c..5b66822da954 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -777,6 +777,10 @@ uint amdgpu_dm_abm_level;
>  MODULE_PARM_DESC(abmlevel, "ABM level (0 = off (default), 1-4 = backlight reduction level) ");
>  module_param_named(abmlevel, amdgpu_dm_abm_level, uint, 0444);
>
> +int amdgpu_aux_backlight = -1;
> +MODULE_PARM_DESC(aux_backlight, "Aux backlight control (0 = off, 1 = on, default auto)");
> +module_param_named(aux_backlight, amdgpu_aux_backlight, bint, 0444);

I'd suggest making this something more generic like "backlight" and
make -1 auto, 0 pwm, 1 aux.  That way we can handle potential future
types more cleanly.

Alex


> +
>  /**
>   * DOC: tmz (int)
>   * Trusted Memory Zone (TMZ) is a method to protect data being written
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index fb62886ae013..6ad384ef61b8 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -2209,6 +2209,9 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
>             caps->ext_caps->bits.hdr_aux_backlight_control == 1)
>                 caps->aux_support = true;
>
> +       if (amdgpu_aux_backlight >= 0)
> +               caps->aux_support = amdgpu_aux_backlight;
> +
>         /* From the specification (CTA-861-G), for calculating the maximum
>          * luminance we need to use:
>          *      Luminance = 50*2**(CV/32)
> --
> 2.26.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
