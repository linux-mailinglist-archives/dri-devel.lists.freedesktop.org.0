Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E4D44EFC1
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 23:51:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA5F6E08E;
	Fri, 12 Nov 2021 22:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 101C26E057;
 Fri, 12 Nov 2021 22:51:42 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id m6so20685356oim.2;
 Fri, 12 Nov 2021 14:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FLzIBsTyi5anlNkdUPxTn+CgSU0qm6Id0co/DWFLZLM=;
 b=oZAiCn5bj/KyDEohqn+qP/WvAJ1FsinCXqcrsvfB1KoSv9yuI6lqla/OPCi/Ksr+Vl
 2QghttB9JfrKpP2F2l4hunMGTmTY8cSlDVUBBPzFwQJQkNt3ZADdwj2tPBWgOwf1Yc9+
 smQbT0Li4C+vD7dd8UWZHfHkyozN1H498X2ClSwMVTnQ3T1URa0rQ3QGDBuK+RHyy0uS
 eRHHSOHLVEI+sk7mbgH31l1VMrbO1MHL3ivuxPrPCMdx7anllZC9ZG1Htbe+D/sEeou9
 79qrXdT4+VFSeJud2DowsYyOu2vwC5T1G2z24mr9Exd2rYOCBMhDUgRTRiCJ6G7Bly6h
 /xAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FLzIBsTyi5anlNkdUPxTn+CgSU0qm6Id0co/DWFLZLM=;
 b=unWLBTy7nCjfa4z3GLJemYwogaxFuX3TNMsAC1aP2oGM2AtIAwwbIJcnKUkkeBmo2t
 Ta53sxl/FLc2Fz2QXT6kjbuzR+rXrWOtB5+QzO6WdOYEbiuyGc0epnUw7Svdh0xQHA2T
 IMsENwKIjiMPdmY9zJ54Ifaj/T4fB/sDLJFWDNiESO6meIUfHLnS4NkBSGpJfTfs69N1
 CnkyMKF7x9oK+Z6xijbewUsQFSqL4pGy1lJJFcJSMzjh7ynRdtdoEp6UF3XUInmKcVPb
 5yTrVFRWJ+2RRqxgFceJIfsmO0LSDxD0CWzTlG/uYHglKZxiNHaZmMjwu587pIjQRjKd
 UwEQ==
X-Gm-Message-State: AOAM533CWubG8zIMUnNWIdunkAjIvtepwC2lrk0wLfYzKnpoasBSZ+Hc
 f6jIJwC/6AA+OXys+QHaDSVQQ1O0ZRwbXL4ATfk=
X-Google-Smtp-Source: ABdhPJwgyYh0RREmbw4GiriaHJ4K0Kj+m6J4NQ2IGpXCRtIDbSrp4aWxlwa3a/LByhKzmp69EriOJvibNEELW189YyQ=
X-Received: by 2002:a05:6808:144b:: with SMTP id
 x11mr16013641oiv.123.1636757501349; 
 Fri, 12 Nov 2021 14:51:41 -0800 (PST)
MIME-Version: 1.0
References: <20211111033207.28565-1-hongao@uniontech.com>
In-Reply-To: <20211111033207.28565-1-hongao@uniontech.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 12 Nov 2021 17:51:30 -0500
Message-ID: <CADnq5_OXkMUBu6AOBUARm3ogok=Qyj6z0KzFgSMh63JAO==Wkg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix set scaling mode Full/Full aspect/Center
 not works on vga and dvi connectors
To: hongao <hongao@uniontech.com>
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
Cc: Dave Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Nov 10, 2021 at 10:54 PM hongao <hongao@uniontech.com> wrote:
>
> amdgpu_connector_vga_get_modes missed function amdgpu_get_native_mode
> which assign amdgpu_encoder->native_mode with *preferred_mode result in
> amdgpu_encoder->native_mode.clock always be 0. That will cause
> amdgpu_connector_set_property returned early on:
> if ((rmx_type != DRM_MODE_SCALE_NONE) &&
>         (amdgpu_encoder->native_mode.clock == 0))
> when we try to set scaling mode Full/Full aspect/Center.
> Add the missing function to amdgpu_connector_vga_get_mode can fix this.
> It also works on dvi connectors because
> amdgpu_connector_dvi_helper_funcs.get_mode use the same method.
>
> Signed-off-by: hongao <hongao@uniontech.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> index b9c11c2b2885..0de66f59adb8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> @@ -827,6 +827,7 @@ static int amdgpu_connector_vga_get_modes(struct drm_connector *connector)
>
>         amdgpu_connector_get_edid(connector);
>         ret = amdgpu_connector_ddc_get_modes(connector);
> +       amdgpu_get_native_mode(connector);
>
>         return ret;
>  }
> --
> 2.20.1
>
>
>
