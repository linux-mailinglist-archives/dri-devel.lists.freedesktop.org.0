Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E89291A46AF
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 15:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB786ECEB;
	Fri, 10 Apr 2020 13:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4506ECEB
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 13:26:42 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id n2so1204360ybg.4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 06:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lc0KOkyMV8sWDooM45gghG9E65wr53BA3rQ6QAkOchY=;
 b=XN/ByGzC++QmVak+Ivw5BdvZfPgiPf9yhyCCU6csMw8n2AozTHVgMzABR+GI4ynC4a
 1LSZvneXMlRZUHb9jnr2nPWcOhUINoCVJI22amYLPzyolouwepYT352yBi+Os3c4Ledv
 dEx7KUVa3p7MEZ1YvVShe9tVYCFaC1eBeRkaP3+exasCEHTavNNu0GI6Z6tO1q16X0fp
 1LPFRrSPwAdrYxQR5tYsgkjBJSSAHQwHt9ccFj+KQkQxL/OanaLPYJ0Si9aU1wV3DqAg
 B0dcAq9/Wk9CS/+ezC2yKJhTf6hjCwSSmXddAiScxG5QFPD7KeegsBgdnkfjvEDw1/xY
 LHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lc0KOkyMV8sWDooM45gghG9E65wr53BA3rQ6QAkOchY=;
 b=iT6wb5Zg1F2L0mEOk3V0ECuBT6adomTqpbS3ZMvb533rtLM/4IyB0HIR/mokBE1W6B
 FFMC6kIMqyFQstQI2mTgNDh8vgpGK9FsjWQ6aqgCPXpIn9inUEUrdWYJW0eyV5fez6Zx
 MUZ1pEME+zWDB9cd4CkJV4i41W+PYemWcRpOGE88VH5MFHudiSYVoIdGoov1VgkPjn4X
 vtX45XNWuTBsRwf5CGws2rAGUS1hPfU5KuO8CIbQVRRYzdaTNrXNBlfoKyo+OTOLoO1S
 jMf38Gxd7oIp7gpmc3qXn92WJxw/Cqvyh6w/DtU/JG2K343EXktlQzyKmlu+dAU/zcPj
 mDzw==
X-Gm-Message-State: AGi0PuYT5uu5vAfC+rbOFZ952KalROtmBSHvvVoD0l813MtmVGRugj0u
 NoblT6sW7u32hrGn3Q3mmL87S3gIFQG3T18JeGEVI6JN
X-Google-Smtp-Source: APiQypIosQ2E2A6Kynf1hzeHWGqlIhYWWsfzQSPab3/uu8PQf1eJY5khwY+XiZfabaS/YXMebUJpakXgr2skoFZvuxw=
X-Received: by 2002:a25:734c:: with SMTP id o73mr7444089ybc.140.1586525201451; 
 Fri, 10 Apr 2020 06:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAGPDPzCHs0ty0rxs=QN7xmHhuDfftdO17P81-s=L=J5e_14vNw@mail.gmail.com>
In-Reply-To: <CAGPDPzCHs0ty0rxs=QN7xmHhuDfftdO17P81-s=L=J5e_14vNw@mail.gmail.com>
From: Sandeep <sandy.8925@gmail.com>
Date: Fri, 10 Apr 2020 18:56:33 +0530
Message-ID: <CAGPDPzC72jSBYHfD1PbcTme6LavTX_cVGqTe5TTHFSjg4qnv3Q@mail.gmail.com>
Subject: Re: [PATCH] AMDGPU: Correctly initialize thermal controller for GPUs
 with Powerplay table v0 (e.g Hawaii)
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

Can someone please look at this patch? It would be nice to get it
merged in, so that others using the Hawaii GPU can get proper fan
speeds reported. Thanks in advance.

Yours sincerely,
Sandeep

On Sun, 5 Apr 2020 at 22:22, Sandeep <sandy.8925@gmail.com> wrote:
>
> This is required for the AMDGPU driver to report fan speed for Hawaii
> GPUs (otherwise the fan speed is just reported as 0)
> ---
>  .../drm/amd/powerplay/hwmgr/processpptables.c | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/processpptables.c
> b/drivers/gpu/drm/amd/powerplay/hwmgr/processpptables.c
> index 77c14671866c..bb58cfab1033 100644
> --- a/drivers/gpu/drm/amd/powerplay/hwmgr/processpptables.c
> +++ b/drivers/gpu/drm/amd/powerplay/hwmgr/processpptables.c
> @@ -984,6 +984,34 @@ static int init_thermal_controller(
>   struct pp_hwmgr *hwmgr,
>   const ATOM_PPLIB_POWERPLAYTABLE *powerplay_table)
>  {
> + hwmgr->thermal_controller.ucType =
> + powerplay_table->sThermalController.ucType;
> + hwmgr->thermal_controller.ucI2cLine =
> + powerplay_table->sThermalController.ucI2cLine;
> + hwmgr->thermal_controller.ucI2cAddress =
> + powerplay_table->sThermalController.ucI2cAddress;
> +
> + hwmgr->thermal_controller.fanInfo.bNoFan =
> + (0 != (powerplay_table->sThermalController.ucFanParameters &
> + ATOM_PP_FANPARAMETERS_NOFAN));
> +
> + hwmgr->thermal_controller.fanInfo.ucTachometerPulsesPerRevolution =
> + powerplay_table->sThermalController.ucFanParameters &
> + ATOM_PP_FANPARAMETERS_TACHOMETER_PULSES_PER_REVOLUTION_MASK;
> +
> + hwmgr->thermal_controller.fanInfo.ulMinRPM
> + = powerplay_table->sThermalController.ucFanMinRPM * 100UL;
> + hwmgr->thermal_controller.fanInfo.ulMaxRPM
> + = powerplay_table->sThermalController.ucFanMaxRPM * 100UL;
> +
> + set_hw_cap(
> + hwmgr,
> + ATOM_PP_THERMALCONTROLLER_NONE != hwmgr->thermal_controller.ucType,
> + PHM_PlatformCaps_ThermalController
> +   );
> +
> + hwmgr->thermal_controller.use_hw_fan_control = 1;
> +
>   return 0;
>  }
>
> --
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
