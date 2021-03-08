Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F4833197D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 22:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49EE56E117;
	Mon,  8 Mar 2021 21:44:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CC86E0D4;
 Mon,  8 Mar 2021 21:44:46 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id t83so2651254oih.12;
 Mon, 08 Mar 2021 13:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FnfgAUbDVZeNGV7YSOf7CHMyIPf11X/pivOxwIJfz2U=;
 b=TSSG5A/hAXDZ3Gg2dIHVcjUUsjRUNiVSvLBrL0SBFArOAAcGXLO1YUH+K5qfrCjk36
 CGDzpY4dRxotUuZwB6QdyN5hqlO4A9wHQxkA4kQP8QKhvAyVC5QO2tPcimXv4q83/vId
 3VRHjzYSaKAyavvUfGYdzKNryAhBRfV1saWL+z30j1QxQ90B9ZcS0dxeuEhYbPOxo11l
 fiC/u4qVHoDcCSvIPm2kQTdtIb6xyA+GubYCmcxij9gHAwur2VbMjVOyQVE60JBmkbQ8
 U6zA4HDzNx4/Ea8kIGPY1tvwM3N0503y57XABxebCbUiXns5Crxz2N5yDqYSXaZZtxuI
 2jXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FnfgAUbDVZeNGV7YSOf7CHMyIPf11X/pivOxwIJfz2U=;
 b=Ne7bV0Gln3W8omjrOqomNJcxwKDB8HOABFSvYTT9TrNl+cPChveGijotjo+pSzmDmF
 OD/aPFsUumOB673rqzXdPEo5QUZFHEk1S3Duwovsgv+X00+UQQ9UYnCve2SfAJ0K/wKW
 Tn5fmXhoZVyY7tcqRHlkvE17ARls6vzCHAnkQD5Lja/gKwgNANMi4Zrjt22kfE0OVBm1
 /6mDu/MqohpgEjJKeRpKWBG9o9Kr1PKINtC4XDSQc4BsDHnHLWuLQAl0m49IphesUvWf
 B0P/loeMFu6ZFgS+UCwg40CuwcqEJ+FlCwVn1D3lQH/nLSB1oeICHOQDat3KmJHmptRr
 VnJw==
X-Gm-Message-State: AOAM532h+XJW+rsGF8BJIT0DoendzFFaX2OFXxkZiYphbtEPbfv2luuF
 Dqa1xdvkVqv2lYdu0pbj7gEJTIsnZUDZe4ZCyAA=
X-Google-Smtp-Source: ABdhPJzTV0MKG2bplLclx3EsQ/iIXSwzsj9SXfn6g3FatPK6uFrfqWxnwZ7Vw9XFr5SbhoPcMlN5X0RLizmg2dI9/Bw=
X-Received: by 2002:a05:6808:f15:: with SMTP id
 m21mr673052oiw.123.1615239885798; 
 Mon, 08 Mar 2021 13:44:45 -0800 (PST)
MIME-Version: 1.0
References: <20210306104720.215738-1-zhang.yunkai@zte.com.cn>
In-Reply-To: <20210306104720.215738-1-zhang.yunkai@zte.com.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 8 Mar 2021 16:44:34 -0500
Message-ID: <CADnq5_OPcTeFb1Onr=Haz3BHroG==9TzmD3F65ENNebe-iW_=Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove duplicate include in amdgpu_dm.c
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
Cc: Stylon Wang <stylon.wang@amd.com>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>, Dave Airlie <airlied@linux.ie>,
 Zhang Yunkai <zhang.yunkai@zte.com.cn>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Sat, Mar 6, 2021 at 5:48 AM <menglong8.dong@gmail.com> wrote:
>
> From: Zhang Yunkai <zhang.yunkai@zte.com.cn>
>
> 'drm/drm_hdcp.h' included in 'amdgpu_dm.c' is duplicated.
> It is also included in the 79th line.
>
> Signed-off-by: Zhang Yunkai <zhang.yunkai@zte.com.cn>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 3e1fd1e7d09f..fee46fbcb0b7 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -44,7 +44,6 @@
>  #include "amdgpu_dm.h"
>  #ifdef CONFIG_DRM_AMD_DC_HDCP
>  #include "amdgpu_dm_hdcp.h"
> -#include <drm/drm_hdcp.h>
>  #endif
>  #include "amdgpu_pm.h"
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
