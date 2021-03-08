Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E68C331983
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 22:45:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 472EA6E885;
	Mon,  8 Mar 2021 21:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA0386E87E;
 Mon,  8 Mar 2021 21:45:44 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id z22so2558858oop.0;
 Mon, 08 Mar 2021 13:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=98cBjcjhuYHRPD7k85MY8DSxP3E150dqHIpXKr7a8vo=;
 b=HTNVHer2R1dsIR8ja17XwqWKWkEQRomuKKAFZBtej5KqVJPPaJjh28B5dI+v3ASXR2
 Aiv4Df+7C9OYzaNZHFfEV7OyVLMD/GCAKrX2XgeBkZR8XhdUlLMUBp1m+JAxlex/3Iqn
 oVw1bJsQ9Yz92eDMa0jL0yO5FGrSR+AKD8XtJ8dZs8q4lm0v+/hWFc0ppMpgXCSsvwaF
 Q7SjKCYgtt+P+wLA8P1GpH9pVEL8H9ghqHDUuZG23dE2RdsbT155L/w/tS2dS71I8N47
 poEQCJUjZPp6EtDjiCw9e1lfpinSouLeV//1U6NZBIfOsY8SU3W9o0tZchFSv9wzX21M
 spDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=98cBjcjhuYHRPD7k85MY8DSxP3E150dqHIpXKr7a8vo=;
 b=Gj/JSF2+mPO1DehgjjMCwJwH3PZVWujNm9X+zdbtSdgHGJ9SjVYyVV7R7jIc7VkC2b
 FMkwi2k7KjF68DApoW0KeGNtPSw+xVP4LwDbx1J8TswnR/gqULK1Ydz6tEdaK1r/MVhe
 birC6yMXRJdW0yNmzZ9vfgJE/332daZcckixJHgdgTy9qojlVb27p7XXRrDESGIuReok
 qrQ2kHmv9V2mXLO2rIErRSCzO5I0/3/NRwXuFml1wftrpFR3XcOrRmvIckALa/2arG5I
 aXxhMz3jtz0MyT/4psqD9HLTpIlsVQyVBfrQAgf0oa7Xpby5n9qIxoIAzRJD3ARNX4kL
 sR/A==
X-Gm-Message-State: AOAM5310JSek5ZMrV/PJx1LlPAKpcTq2I+Ot8NDdwNBTOo5kjrDGryZl
 GuMAsYSObZohd4okcX5eQ8ISK179FlqBfLDUr83XwTmR
X-Google-Smtp-Source: ABdhPJwpsHutLCgDMpdVA+x2+rqBtCCg/0khVtNykRTxJz6fzAakSBg9LGgIAsGNhNJObjtkA57rNQ/RQJlxHyshSQQ=
X-Received: by 2002:a4a:d155:: with SMTP id o21mr19817235oor.72.1615239944232; 
 Mon, 08 Mar 2021 13:45:44 -0800 (PST)
MIME-Version: 1.0
References: <20210306110525.216316-1-zhang.yunkai@zte.com.cn>
In-Reply-To: <20210306110525.216316-1-zhang.yunkai@zte.com.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 8 Mar 2021 16:45:33 -0500
Message-ID: <CADnq5_Mxeg2jpzPkQ1f8ugEyB7j9U1hp6+_3xsY-0LuA7yTwaw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove duplicate include in dcn21 and
 gpio
To: menglong8.dong@gmail.com
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
Cc: isabel.zhang@amd.com, Sung Lee <sung.lee@amd.com>,
 Zhang Yunkai <zhang.yunkai@zte.com.cn>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Wyatt Wood <wyatt.wood@amd.com>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Krunoslav Kovac <Krunoslav.Kovac@amd.com>, "Cheng, Tony" <Tony.Cheng@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Sat, Mar 6, 2021 at 6:05 AM <menglong8.dong@gmail.com> wrote:
>
> From: Zhang Yunkai <zhang.yunkai@zte.com.cn>
>
> 'dce110_resource.h' included in 'dcn21_resource.c' is duplicated.
> 'hw_gpio.h' included in 'hw_factory_dce110.c' is duplicated.
>
> Signed-off-by: Zhang Yunkai <zhang.yunkai@zte.com.cn>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c         | 1 -
>  .../gpu/drm/amd/display/dc/gpio/dce110/hw_factory_dce110.c    | 4 ----
>  2 files changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> index 072f8c880924..8a6a965751e8 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> @@ -61,7 +61,6 @@
>  #include "dcn21/dcn21_dccg.h"
>  #include "dcn21_hubbub.h"
>  #include "dcn10/dcn10_resource.h"
> -#include "dce110/dce110_resource.h"
>  #include "dce/dce_panel_cntl.h"
>
>  #include "dcn20/dcn20_dwb.h"
> diff --git a/drivers/gpu/drm/amd/display/dc/gpio/dce110/hw_factory_dce110.c b/drivers/gpu/drm/amd/display/dc/gpio/dce110/hw_factory_dce110.c
> index 66e4841f41e4..ca335ea60412 100644
> --- a/drivers/gpu/drm/amd/display/dc/gpio/dce110/hw_factory_dce110.c
> +++ b/drivers/gpu/drm/amd/display/dc/gpio/dce110/hw_factory_dce110.c
> @@ -48,10 +48,6 @@
>  #define REGI(reg_name, block, id)\
>         mm ## block ## id ## _ ## reg_name
>
> -#include "../hw_gpio.h"
> -#include "../hw_ddc.h"
> -#include "../hw_hpd.h"
> -
>  #include "reg_helper.h"
>  #include "../hpd_regs.h"
>
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
