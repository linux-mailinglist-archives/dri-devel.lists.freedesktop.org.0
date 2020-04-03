Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DB819DF73
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 22:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10A26E4B7;
	Fri,  3 Apr 2020 20:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24AD6E4B7;
 Fri,  3 Apr 2020 20:37:05 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id h9so10070782wrc.8;
 Fri, 03 Apr 2020 13:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y+LvCt9qhAFpj3aG3kw3OiW81EprahiJdVZ5TutAfFQ=;
 b=uPfcm0nj5hMvo6GiSlcuvInLBcJ2k4qS/AJRY/DITisJzW/jSuv57MZ62EXBmSYKQI
 4Mr5SDR43oKr0A6ofhkaL3iRkX1cq87c2TsxtZYq4W5JuytX/nAMzO4uEU2j2nY0WZ+2
 snkTPDDQeF6/DT/Y/2vxw9+h1X+meoA+JTp1xLVtEJBbnGBYwzXyYpIsPxqLI2HxXUFq
 jZy7r70+mnms5eBQPrsSrqg8Obod44qfddFaX60hj7+y8TkrXZG4+MWXNeo24CbFDieb
 rR4YUYksdxre/YKiLFxfbaa+zkObrNuzQTigCtAO7saQ6WbxcAtzYKTRq1D3iFjAzDUa
 LEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y+LvCt9qhAFpj3aG3kw3OiW81EprahiJdVZ5TutAfFQ=;
 b=eM3RbtqqnlceRk0mNLdKxfD8b5xrvnB2eLkwvx9LxJ9uDjWPLZdTDaVulwPoVSiJwh
 GU45Ze1CtC2dGJFU40JbNcFg5uS006RkNWEuV2Dfu2s+qw4wTGBoRGiirQWmRRVvvrxm
 4Kqddv3xIpMTOvW912J16b3Fv20jFvz45doZ/vsIUTV/1Kb3oABcwLj7pzHNflig2a8m
 f6DUpb9LKAXP09Ik9iXSkz3cpCTvMX2sCCZibpLcZse7Pc9r6Da3LTyYuM3i9izltLA+
 1/h6RF/hLS+3MtSNQ7xzJFK2sN2EI/FQmP4h/S4krWXzMC4slm9Czq3dwb5674kM0nbp
 qpYQ==
X-Gm-Message-State: AGi0PuZpgBl8VyTGmZHGG5Wg/R3BCjQOnZYH+kvqleMrzGyZHnRMtonC
 s7MERjF96AXiPPC2/NizUbI0lhNaQFH1bMBIYVQ=
X-Google-Smtp-Source: APiQypJUPo10j7ErhZkwbPSCOJdNNULVakATbooMPRF180BK4dv4mEanANUn8ZBD+P10a3gQ9rsf7j5N5i2AJYmVqV8=
X-Received: by 2002:a5d:500d:: with SMTP id e13mr1761051wrt.362.1585946224335; 
 Fri, 03 Apr 2020 13:37:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200403143419.155503-1-aaron.ma@canonical.com>
In-Reply-To: <20200403143419.155503-1-aaron.ma@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 3 Apr 2020 16:36:52 -0400
Message-ID: <CADnq5_OVUSfXPoUse+xTPcqifOT1AHmjqF98QrGWmzppeujgMQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix oops when pp_funcs is unset in ACPI event
To: Aaron Ma <aaron.ma@canonical.com>
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
Cc: Dave Airlie <airlied@linux.ie>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, "Yuan, Xiaojie" <xiaojie.yuan@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 3, 2020 at 11:18 AM Aaron Ma <aaron.ma@canonical.com> wrote:
>
> On ARCTURUS and RENOIR, powerplay is not supported yet.
> When plug in or unplug power jack, ACPI event will issue.
> Then kernel NULL pointer BUG will be triggered.
> Check for NULL pointers before calling.
>
> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>

Applied.  Thanks!

Alex


> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> index f197f1be0969..611de69f9d48 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> @@ -89,7 +89,8 @@ void amdgpu_pm_acpi_event_handler(struct amdgpu_device *adev)
>                         adev->pm.ac_power = true;
>                 else
>                         adev->pm.ac_power = false;
> -               if (adev->powerplay.pp_funcs->enable_bapm)
> +               if (adev->powerplay.pp_funcs &&
> +                               adev->powerplay.pp_funcs->enable_bapm)
>                         amdgpu_dpm_enable_bapm(adev, adev->pm.ac_power);
>                 mutex_unlock(&adev->pm.mutex);
>
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
