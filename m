Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 784A03925B8
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 05:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B716E8BA;
	Thu, 27 May 2021 03:59:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18596E8BA;
 Thu, 27 May 2021 03:59:19 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 v19-20020a0568301413b0290304f00e3d88so3173564otp.4; 
 Wed, 26 May 2021 20:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GwO6hJTK9pMNiwOSyto0K/M7BIjvwe2kKr/NYGp3HmM=;
 b=fyrsG2+DIYTWujXjBGM4BV9gq0EDSmTSnTWiaPcjmz/R5tkMVNrDYRs4JBtcr3FAN7
 qY56UgKx7lo7AIKwadaHdjFDyI+Yqq4qNrcUVHMUaNY/NytUHe/gZEtCdieaD0ucEGLY
 iKg8/JcFyrM2DuTAbuacIk83HFxhxikO62ECTt9p6561AFo7qYtUSzqXZN3SufbjV3EB
 8jDxtnxyM1Bhteu5cHh+qZNDJ8TWmSSEs9cPUkNf1dXFCVORXKhQTZS/neSjgkj9L+Kj
 wQStrH0lKOpiNPn2LS4WrDLovPKyrk+9YmlvfA9EH0rLOeuTpV08+byU9QDhTV2uxGH9
 6qhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GwO6hJTK9pMNiwOSyto0K/M7BIjvwe2kKr/NYGp3HmM=;
 b=sgnPqVvc7/5zEof9N2cB4Gu+tZ03xp0zLLT4SRbsTxKfthDi/cfcnZ+f2ARkhKdcDz
 A1X2nEEo8NbqDF2WwgLp4ghZqwW80eBYuAH+/Bk41PWALetuHGrm2GNWiy+IbLSrg9Vi
 DcJDb8pWp7NCizQy24svQBq+4yFemwQm2FkOMZm6q6IfgMq5zNjMOpFUw+6088UZoEbB
 FymlhUOyl7hUbHfz18qcwevwiUJR4bHVE1IbQpjxRCuQvOKx3XQ6rcOHVtW1DCSB7t53
 Z011xJqWGZqjxZlVTi+hUhPsPjUGWpN3yKFDW/44VQHLPuxrt5trRueUKLNEsbneC9da
 Bs1Q==
X-Gm-Message-State: AOAM531dmqZq1GO+4YIqdiFv75FiZW1IlJCSmF1c4BJHhs5OxTVNTPjI
 oBdp7sJZO2VHBU29whq6OtuUv+Yqu6NhrAJpWmg=
X-Google-Smtp-Source: ABdhPJyATqLeX4DjT0DHydcZY1XslJVIVgJQsHnV55ps2XsRxhAGo5OyUKoCOIt7xtwjLTxMvz62nA4/v7zSGdPQAn8=
X-Received: by 2002:a9d:6548:: with SMTP id q8mr1214250otl.311.1622087959271; 
 Wed, 26 May 2021 20:59:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210526084726.552052-1-lee.jones@linaro.org>
 <20210526084726.552052-13-lee.jones@linaro.org>
In-Reply-To: <20210526084726.552052-13-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 26 May 2021 23:59:08 -0400
Message-ID: <CADnq5_N=O8-4POzw2_vviyKmNxKSREZwCAfiDxEhoPC-4x249Q@mail.gmail.com>
Subject: Re: [PATCH 12/34] drm/amd/display/amdgpu_dm/amdgpu_dm: Functions must
 directly follow their headers
To: Lee Jones <lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, May 26, 2021 at 4:47 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:608: warning=
: Function parameter or member 'interrupt_params' not described in 'dm_dcn_=
vertical_interrupt0_high_irq'
>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index b4e95d3ff3b88..ae0a95c5f1d8c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -601,6 +601,7 @@ static void dm_crtc_high_irq(void *interrupt_params)
>  }
>
>  #if defined(CONFIG_DRM_AMD_DC_DCN)
> +#if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
>  /**
>   * dm_dcn_vertical_interrupt0_high_irq() - Handles OTG Vertical interrup=
t0 for
>   * DCN generation ASICs
> @@ -608,7 +609,6 @@ static void dm_crtc_high_irq(void *interrupt_params)
>   *
>   * Used to set crc window/read out crc value at vertical line 0 position
>   */
> -#if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
>  static void dm_dcn_vertical_interrupt0_high_irq(void *interrupt_params)
>  {
>         struct common_irq_params *irq_params =3D interrupt_params;
> --
> 2.31.1
>
