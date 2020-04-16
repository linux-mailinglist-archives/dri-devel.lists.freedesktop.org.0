Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7A71AD0F9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 22:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978176EB5E;
	Thu, 16 Apr 2020 20:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4085F6EB5F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 20:18:25 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x18so52864wrq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 13:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d0sjIa/QB1zpATXN4/bUNeBrOCkbkU0g+VxZP5fTXW4=;
 b=XtMZ3xRM1jik9xWVA5bPXsw9mLiciX7gz4ZV1skt+1T7PeXjcUPdLfIzsA6av99zPt
 Kk1N8jWCMdlB8KzXjbqWJ7xx2bTYniJAWhdHoxE+clSkgzKSeaTzRVAi+drw1V88Bunu
 g1HgZ7xbdEnfuPxTXJzLn8DJkWhZrrxtESjokXDSwqq0TAlJ9sVmYIbDjyzvGGqCCY9I
 JVZPIh/nTKFPIXfukSRtCpSMf/ZcNAKguWfK+OLMsO5FMBwqBrvi1XV1uskT3NcJHI5S
 gNrjv3js88vyGepJB0k62bkb6aZnojQ7nq+tSm2BnYOsfoaQJwq98iMPCD9MPoZv8TwF
 ePJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d0sjIa/QB1zpATXN4/bUNeBrOCkbkU0g+VxZP5fTXW4=;
 b=Zot87dsU+J9eVCS9IPzZX32tdOdJfkp/1BLZRr20Y+dDL9B4TR9qmInaMz1JiURS+2
 1pNGmGI8Sv24uX3Zp52DJmAUyFTQ4BwFOq5Vy49y9FVQnKKS5+efeufND/6ke30oDVu2
 voFSv1cce4xjtH+yqcpVZ21AlG7vDXzOlRcgShNRiknFw4nfqE1Zbw8IqPHnaMc59d7y
 3lOBtIektYSWWHFSR3DLWImZB4Ms9fAEoe0/VNySp0vfZmh+UCL+Auxn+rQjkkeHxl4/
 a8zUqT/T+CgOo9m8YX9NHhNIqZlx8G+7SDVF83IitX7LlL7oeN7pWLEZ2G/QMq+h/f51
 8TUQ==
X-Gm-Message-State: AGi0PuauhprlB02ILxDlTZesW8uhBy3zwsKcmIrbZC3odouRrTmefLmm
 qYEShhT1b9uaofvN9h5QqrQaMzpusRZyPp5aGUs=
X-Google-Smtp-Source: APiQypI4klVWgDBiagAW/fI5xGnxGKLb9yGFyw3NsJtpUwccBfovKbGX9V68iGhRkK/n6LKvOk6RFnTf3ODyqtZT2Ms=
X-Received: by 2002:adf:f844:: with SMTP id d4mr17565998wrq.362.1587068303837; 
 Thu, 16 Apr 2020 13:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAGPDPzCSaiXdL6ocFtL1VoFtiQLHDE5YQhw-ikWkFVjpaW9GAg@mail.gmail.com>
 <CADnq5_MTLNJ8mh6nZyH14b+RQx1mXwG3hX_x5wco6oQo2d2pUw@mail.gmail.com>
 <ec13c954-2adf-5a6a-2cbf-40c70c6ce1ba@gmail.com>
In-Reply-To: <ec13c954-2adf-5a6a-2cbf-40c70c6ce1ba@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 Apr 2020 16:18:12 -0400
Message-ID: <CADnq5_Naj5b9KmjHNYurEmPvcqxDG8YQxo8KG-P5kpWfSqjYMQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] AMDGPU: Correctly initialize thermal controller for
 GPUs with Powerplay table v0 (e.g Hawaii)
To: Sandeep Raghuraman <sandy.8925@gmail.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 16, 2020 at 4:07 PM Sandeep Raghuraman <sandy.8925@gmail.com> wrote:
>
> Initialize thermal controller fields in the PowerPlay table for Hawaii
> GPUs, so that fan speeds are reported.
>
> Signed-off-by: Sandeep Raghuraman <sandy.8925@gmail.com>

Applied.  Thanks!

Alex

>
> ---
>  .../drm/amd/powerplay/hwmgr/processpptables.c | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/processpptables.c b/drivers/gpu/drm/amd/powerplay/hwmgr/processpptables.c
> index 77c14671866c..bb58cfab1033 100644
> --- a/drivers/gpu/drm/amd/powerplay/hwmgr/processpptables.c
> +++ b/drivers/gpu/drm/amd/powerplay/hwmgr/processpptables.c
> @@ -984,6 +984,34 @@ static int init_thermal_controller(
>                         struct pp_hwmgr *hwmgr,
>                         const ATOM_PPLIB_POWERPLAYTABLE *powerplay_table)
>  {
> +       hwmgr->thermal_controller.ucType =
> +                       powerplay_table->sThermalController.ucType;
> +       hwmgr->thermal_controller.ucI2cLine =
> +                       powerplay_table->sThermalController.ucI2cLine;
> +       hwmgr->thermal_controller.ucI2cAddress =
> +                       powerplay_table->sThermalController.ucI2cAddress;
> +
> +       hwmgr->thermal_controller.fanInfo.bNoFan =
> +               (0 != (powerplay_table->sThermalController.ucFanParameters &
> +                       ATOM_PP_FANPARAMETERS_NOFAN));
> +
> +       hwmgr->thermal_controller.fanInfo.ucTachometerPulsesPerRevolution =
> +               powerplay_table->sThermalController.ucFanParameters &
> +               ATOM_PP_FANPARAMETERS_TACHOMETER_PULSES_PER_REVOLUTION_MASK;
> +
> +       hwmgr->thermal_controller.fanInfo.ulMinRPM
> +               = powerplay_table->sThermalController.ucFanMinRPM * 100UL;
> +       hwmgr->thermal_controller.fanInfo.ulMaxRPM
> +               = powerplay_table->sThermalController.ucFanMaxRPM * 100UL;
> +
> +       set_hw_cap(
> +                       hwmgr,
> +                       ATOM_PP_THERMALCONTROLLER_NONE != hwmgr->thermal_controller.ucType,
> +                       PHM_PlatformCaps_ThermalController
> +                 );
> +
> +       hwmgr->thermal_controller.use_hw_fan_control = 1;
> +
>         return 0;
>  }
>
> --
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
