Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 142B418327D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 15:10:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5516EACE;
	Thu, 12 Mar 2020 14:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22656EACE;
 Thu, 12 Mar 2020 14:10:40 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id f3so674693wrw.7;
 Thu, 12 Mar 2020 07:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5ew4nctO4indXSHhLzfgYmvH3/95PcDt5dya905io4s=;
 b=sX/nnTzF3WpKLW62aZlNhg/tTlQc74J7QTe1pBr91d8+JK2+VEiYuqwttW48ushB4x
 i3KDywYEXlpUVblBDddQq9yAhpfBBfUBL2gFgMksYr9BFi0NRWSEfBLfg1jZbBrXegBH
 hiR5L63dnbJuHzhV5khA5kWHnb6YFMboh134KqQmjWahLl88dQ061x4subDiaAU/iLMK
 lSEl6pYsL1shARFfb7TwcRm8bqMgXOSyKPbmBUJtI5Nsoq9uq2US5HIFzpIa3VxPOBbB
 n+Y8sFibTJ+s1gY8tMX6ufWMSjxFw7aow0lwiXR3841o2GcXk5J9eG6VTkAYL0sJo8Yt
 rudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5ew4nctO4indXSHhLzfgYmvH3/95PcDt5dya905io4s=;
 b=PM0K89r9uXF6bQICuYI0ACv4TzfK3GEhnOSRvgy341cnRtleVudz3xfL9XcwKDW2zu
 kljrhuxHiJ3qT8Yrnu6Jco41bzjlhJGr9yfzII95L7TES656FbdiZcguQ6EOyyfroKVo
 fp5dPc5h2Cx9ClV9WxELnfRmwURDKAGhMGWY6AntSvU3uCwP5PsTyIaMJTYE5Co+OjvI
 2Ulc9IZYyadv4mFrm0kG0Io9BaR2YskCieF/WJlEZeHDOTa3zMjVB5UVU5JeRk/KlskV
 Y2p6f25tePODp/nfEDo6F3DBP0rUF9sq3HvXaXIOj84zwR1wbHFdEx6FAlhEUvgRF3ju
 ohCg==
X-Gm-Message-State: ANhLgQ07rnECeeMsUEUcplMb398OY3tnRcXWDkR9qKKEofKOpNzSSrRB
 iUFYiqB/O1Emn+cL0LtGFzUjE1K+szaXC0p10Hw=
X-Google-Smtp-Source: ADFU+vu2HXAwbqlqKOCUAswlE7mxU7DuLJWJDNNP8K82VB8pUBhvZNzs6p6b0qoJdIatEFawHfMSI05gTzYSHQzNFMU=
X-Received: by 2002:adf:c5c8:: with SMTP id v8mr6917160wrg.111.1584022239536; 
 Thu, 12 Mar 2020 07:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1583896344.git.joe@perches.com>
 <c9f6b726f857935502a4bfb026e27d9e6e5f7e72.1583896349.git.joe@perches.com>
In-Reply-To: <c9f6b726f857935502a4bfb026e27d9e6e5f7e72.1583896349.git.joe@perches.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 12 Mar 2020 10:10:28 -0400
Message-ID: <CADnq5_MistiCrp=jRXqpuu03zTYb+Av8EFq2Dkwjvo5_+PrK0w@mail.gmail.com>
Subject: Re: [PATCH -next 025/491] AMD POWERPLAY: Use fallthrough;
To: Joe Perches <joe@perches.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  thanks! (link fixed locally).

Alex

On Wed, Mar 11, 2020 at 1:07 AM Joe Perches <joe@perches.com> wrote:
>
> Convert the various uses of fallthrough comments to fallthrough;
>
> Done via script
> Link: https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe.com/
>
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>  drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
> index bf04cf..fc5236c 100644
> --- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
> @@ -1250,7 +1250,7 @@ static void smu7_set_dpm_event_sources(struct pp_hwmgr *hwmgr, uint32_t sources)
>         switch (sources) {
>         default:
>                 pr_err("Unknown throttling event sources.");
> -               /* fall through */
> +               fallthrough;
>         case 0:
>                 protection = false;
>                 /* src is unused */
> @@ -3698,12 +3698,12 @@ static int smu7_request_link_speed_change_before_state_change(
>                         data->force_pcie_gen = PP_PCIEGen2;
>                         if (current_link_speed == PP_PCIEGen2)
>                                 break;
> -                       /* fall through */
> +                       fallthrough;
>                 case PP_PCIEGen2:
>                         if (0 == amdgpu_acpi_pcie_performance_request(hwmgr->adev, PCIE_PERF_REQ_GEN2, false))
>                                 break;
>  #endif
> -                       /* fall through */
> +                       fallthrough;
>                 default:
>                         data->force_pcie_gen = smu7_get_current_pcie_speed(hwmgr);
>                         break;
> --
> 2.24.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
