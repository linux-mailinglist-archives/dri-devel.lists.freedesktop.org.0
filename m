Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B84E439259D
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 05:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 282476EE00;
	Thu, 27 May 2021 03:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108526EE00;
 Thu, 27 May 2021 03:52:40 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 v19-20020a0568301413b0290304f00e3d88so3162308otp.4; 
 Wed, 26 May 2021 20:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GMNN8zidej8CCx7epceEx2ySsZhlFSGB0Zr+V9xhpsE=;
 b=WQ51LN90zU6GGhJNh70xPboiDCxVvC0k64dOhSBqzbuqmTIQkgmACc4VQ5GwW4Se4z
 P/W1tAMTAiQuc/lV0vYTMOuxr+lq6YtLgXeHd1X+bpdb1QmsP0O8aU9u8opmJuxmPZVk
 fCHVDsIylgwUOb+pb+E4Y7RoCtT9c/xQ6aeBGU7DKQDwbZPdWm32zl+aNpEUzfE0YFsu
 R9iAh1YEPhE5lK6T1dqZcPoLHzHK67z/1QJ+hmriu9c4o9kDW5jpOqr9HKlwcQAhjhMb
 PCTQJU6lvh0to4U1UGg5qDu9PS2IoI3ooVD658khTIFNijds2dbBJ3atoa4PMRkhuVV6
 SzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GMNN8zidej8CCx7epceEx2ySsZhlFSGB0Zr+V9xhpsE=;
 b=tGnDEzuyDEB1Xbhme7b9VDTlRMd0KCNufHehju27OFYCy/zewRt3vbeX/WH9RFOYXq
 FKPM2qY1O+8NR//LDlNbWE5+5mACxquUyuETWD2HQX2NeAOMSIzutl56CbnCZIwlKpiu
 yhTFpSRrxv8W3r/41BNUmwIFK8uuEjf0MiUC3aZs/9rgc1mAHNA1iMj18KyYVfZH7Sxy
 H4N29incZuWsYhdYoPNu5dmJ/7c9r6Vx0QbmOBx7X6+dyCd+ljzAfGl8Y+d+bhsLsPjG
 DY01VFifxL3xP0J0+5cT5tfJItEJzRP+hhZWpjc3TE+Gx1Q8CPfGu/P1TesM3SOCKlQ/
 Fcag==
X-Gm-Message-State: AOAM533yn0nOv6RUJ9SdPNRPMy7OdNM1oTS+ARjGgciTzvN9n3DPLue4
 dI7I9Puk9qGpUx716l2mzfRAnBoKv2zVFOXbzhnRK1QU
X-Google-Smtp-Source: ABdhPJwejt1H97rNvX0CfGW0uyBD5BPQYzbjUvBiuVZWOTUQktXyL/vOFPR6r2TmKVdvNZPBu2gg5fAoui3ceq/p3ek=
X-Received: by 2002:a9d:6548:: with SMTP id q8mr1197817otl.311.1622087559482; 
 Wed, 26 May 2021 20:52:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210526084726.552052-1-lee.jones@linaro.org>
 <20210526084726.552052-5-lee.jones@linaro.org>
In-Reply-To: <20210526084726.552052-5-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 26 May 2021 23:52:28 -0400
Message-ID: <CADnq5_Pm3rtKnmjGND7vs5eSNF5xEzT9FmfUsT81JmNW55mmcw@mail.gmail.com>
Subject: Re: [PATCH 04/34] drm/amd/pm/powerplay/hwmgr/vega12_thermal: Provide
 function name
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, May 26, 2021 at 4:47 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega12_thermal.c:171: w=
arning: expecting prototype for Set the requested temperature range for hig=
h and low alert signals(). Prototype was for vega12_thermal_set_temperature=
_range() instead
>
> Cc: Evan Quan <evan.quan@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_thermal.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_thermal.c b/dr=
ivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_thermal.c
> index 0dc16f25a463b..ed3dff0b52d21 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_thermal.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_thermal.c
> @@ -159,7 +159,8 @@ int vega12_thermal_get_temperature(struct pp_hwmgr *h=
wmgr)
>  }
>
>  /**
> - * Set the requested temperature range for high and low alert signals
> + * vega12_thermal_set_temperature_range - Set the requested temperature =
range
> + *                                        for high and low alert signals
>   *
>   * @hwmgr: The address of the hardware manager.
>   * @range: Temperature range to be programmed for
> --
> 2.31.1
>
