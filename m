Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E21B6AA318
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 22:55:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C6510E76E;
	Fri,  3 Mar 2023 21:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B25AE10E76E;
 Fri,  3 Mar 2023 21:55:41 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1755e639b65so4666157fac.3; 
 Fri, 03 Mar 2023 13:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677880541;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6AFZEkYJ2SPZLOLjAy2GSQIbeAnHolJ0EeRAikdfL+4=;
 b=P3d2oihIqjPJuCposna/iUIlVvMp/CshgIa/46oePogW1VU1iA6kwOQDkuYw1vYVMG
 GTW8+NUonaE6nILgGlnJ0/4CGjZCM0Z9nVnzqfEXUqA7VA7xPbfi0Q4657v8yd4moT5K
 aRcTrSGk3s1D9w6H4A6yeAL33Yt4xR1Z3E3cFOVh170NzcifWddufl/LLqRDvyy+iAy1
 f78AtLxrWTcrvplFQYXzA0zLVmKnmuD0iDRA71HWr2siPdPWT02JEJLLYL7anyR/jxXY
 OXSvcMYvaMJDXNtnD5zfvdbZQjZWiTa36yUgwBy11TjYMPJEtAUA4YI/7K7Z75fgmlv2
 o2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677880541;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6AFZEkYJ2SPZLOLjAy2GSQIbeAnHolJ0EeRAikdfL+4=;
 b=EWnFusEjHZ+RDA/Uj6Tc+656pGrESoWAu154AOmzKtpNFI9lawH3TdHdeRYgvzgse1
 i8vi9vkQsD/y0yvNFt+bUj+1EgIs6EMo8w0PSRC97fRva1DUp7TAkT0As4byFBRzJeo9
 Ms1v+2LuphE9RRjkF0U89TRhye50ZQ29PBN4i4K1lylr+S2srB8DfC2C2T5b94D3mz39
 nXgTb8gxuIXmQbizKuWOhgmA1hwNEegNqDlmMtLkM+E46EAJKC6k/Z4qhUXe5RReO6E2
 4m7YQNtBvUAEUBjbE+x7NJ1rFvKrHVoCBFtqgC6V72gK/tDRhiFFStNFeQOGfCYB6maX
 HqNg==
X-Gm-Message-State: AO0yUKXLO9alrOYD43Y0OG6gG2x8VyPH1a+7XGJXQN4FVOSSYREJas/4
 qgUnQIgTmWNeG0FA77qlK6nY3osy1QpPjT1Hd00=
X-Google-Smtp-Source: AK7set98BMz0wptKlJctbuyi8i0Ffce6eA9OhFewFlRnUKWKfPeYpxam4lXKQdp037LmrN3olRPSo6rPFsRvOqUB2cA=
X-Received: by 2002:a05:6871:6b9d:b0:175:4a1f:edff with SMTP id
 zh29-20020a0568716b9d00b001754a1fedffmr1100138oab.8.1677880540951; Fri, 03
 Mar 2023 13:55:40 -0800 (PST)
MIME-Version: 1.0
References: <20230303120233.1878140-1-usama.anjum@collabora.com>
In-Reply-To: <20230303120233.1878140-1-usama.anjum@collabora.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 3 Mar 2023 16:55:29 -0500
Message-ID: <CADnq5_M_irvEL4Ggr4UaK2n5GeGD_EchqtZvumBtmdOUqqewhQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: remove dead code
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
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
Cc: kernel@collabora.com, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Kun Liu <Kun.Liu2@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Mar 3, 2023 at 7:03 AM Muhammad Usama Anjum
<usama.anjum@collabora.com> wrote:
>
> The less than zero comparison of unsigned variable "value" is never
> true. Remove dead code.
>
> Fixes: c3ed0e72c872 ("drm/amdgpu: added a sysfs interface for thermal throttling")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
>  drivers/gpu/drm/amd/pm/amdgpu_pm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> index f212cae0353f..0ffe351c1a1d 100644
> --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> @@ -1738,7 +1738,7 @@ static ssize_t amdgpu_set_apu_thermal_cap(struct device *dev,
>         if (ret)
>                 return ret;
>
> -       if (value < 0 || value > 100) {
> +       if (value > 100) {
>                 dev_err(dev, "Invalid argument !\n");
>                 return -EINVAL;
>         }
> --
> 2.39.2
>
