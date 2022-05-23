Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 636D453150F
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 18:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466AF10F27E;
	Mon, 23 May 2022 16:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4520A10F2CD
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 16:47:50 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id y13so29333794eje.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 09:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MEws4DwjHJownhbfu+ZS9DYpAvJAvD1xJi7PEnph5Es=;
 b=DVN/LllFu0NRh49fsIEhd3xNw/x+qM841drkPE9Auic6RUQhHEOWbHU3m3h5ND4968
 Sz8aznj0zITPihHiFfft7uES0P2bx2aP1FABmWIxcxJ6RIoEKpsN7IbvOnYIlFiKYOk8
 MRcgi6G9XeMhnzg9hDKuj1hUVyFGUz/1fc5P0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MEws4DwjHJownhbfu+ZS9DYpAvJAvD1xJi7PEnph5Es=;
 b=g2u2PT11zFEEmSARH2gRmDqX+zBuSuV+UomDnVV378KaETcc8swgkpImTkTzAmEbzz
 1D054lKyXm4fIUwgwmshdwq4gEG4sRgC732Lk0upT7WHRhv7L3obslb+aCs/rLV3m9rb
 kAcjsNwxgd2+vUT4aXPx+6Nnh9FBas20er40IatFjrIHNIusFnM9orjMx7dExPH7IXZn
 t+A9ljNAMNZTXuh/af4w7Ca/Ete0St3ukczHVWqlFfIw1O9N44jg7CDg1/FuZHAKGW5i
 Uft7cxRcvQWVSgWY3pmc/gOuD2OG/2I+iDZA8n4Xy6RNybc7v9hy/LMtOfD1F1pAzQk1
 tXhA==
X-Gm-Message-State: AOAM531Ct13GjPswuXdLlzhAxJfQtHEFF19i13U5i9rR9LeNAve+wo36
 Uy6E8qcOZOZeCT3mjkp3Jo8dMK/0E9Ri9FJS43I=
X-Google-Smtp-Source: ABdhPJzBw/YWmEvncbFvz6Cro2BPyTOD5IZITqAQ66Gn5duf3Ue5cYzlxRSYrKSofcoeR4+QbRwmCg==
X-Received: by 2002:a17:907:6d82:b0:6fe:fd05:e21e with SMTP id
 sb2-20020a1709076d8200b006fefd05e21emr1504135ejc.432.1653324468497; 
 Mon, 23 May 2022 09:47:48 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51]) by smtp.gmail.com with ESMTPSA id
 a7-20020a1709064a4700b006feb3d65337sm3615742ejv.102.2022.05.23.09.47.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 09:47:47 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id p10so3591348wrg.12
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 09:47:47 -0700 (PDT)
X-Received: by 2002:a5d:6483:0:b0:20f:d046:6382 with SMTP id
 o3-20020a5d6483000000b0020fd0466382mr8111413wri.342.1653324466491; Mon, 23
 May 2022 09:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220523085745.276-1-gaochao49@huawei.com>
In-Reply-To: <20220523085745.276-1-gaochao49@huawei.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 May 2022 09:47:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VVZo+wsR0yPLvq-8jkZg12+Sw0NM0TkgQLHDCxCiFdGw@mail.gmail.com>
Message-ID: <CAD=FV=VVZo+wsR0yPLvq-8jkZg12+Sw0NM0TkgQLHDCxCiFdGw@mail.gmail.com>
Subject: Re: [PATCH -next] drm/panel: Fix build error when
 CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=y && CONFIG_DRM_DISPLAY_HELPER=m
To: gaochao <gaochao49@huawei.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, zhengbin13@huawei.com,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, May 23, 2022 at 1:58 AM gaochao <gaochao49@huawei.com> wrote:
>
> If CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=y && CONFIG_DRM_DISPLAY_HELPER=m,
> bulding fails:
>
> drivers/gpu/drm/panel/panel-samsung-atna33xc20.o: In function `atana33xc20_probe':
> panel-samsung-atna33xc20.c:(.text+0x744): undefined reference to
>  `drm_panel_dp_aux_backlight'
> make: *** [vmlinux] Error 1
>
> Let CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20 select DRM_DISPLAY_DP_HELPER and
> CONFIG_DRM_DISPLAY_HELPER to fix this error.
>
> Fixes: 32ce3b320343 ("drm/panel: atna33xc20: Introduce the Samsung ATNA33XC20 panel")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: gaochao <gaochao49@huawei.com>

I think the author / Signed-off-by are supposed to be real names. Is
"gaochao" your legal name?

> ---
>  drivers/gpu/drm/panel/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)

Other than the Signed-off-by / Author issue:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
