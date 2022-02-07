Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9434AB940
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 12:14:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB9F010F81A;
	Mon,  7 Feb 2022 11:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E11A10E83A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 11:13:59 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id g14so38693692ybs.8
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 03:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nBzDSSm0EEu8YlwYiGk806GwlAAQU2Z/FUPe+VsHFPA=;
 b=T/7wk3lO80aq3pJAtt4RGGIjIj2b9Fn7bwJosVKg/h32AYZ2dA8jIvLd6pmEiKsrw7
 d+wRNFaNRZgeFoOrIEg+/gDqwSn6WDA/ATztazmIrrCq+wbxfPxxQUH9LMjJ9si8qxfo
 b0EqWsW8j3n1LomWc2M8apSfSQxLrg+IdJK6kUJGejyH93NZ782fiQUsw+1shoSxVmpR
 9+jlwSU6zfSRnerI+0rcxUuO7U1Qd/6Tp+kjfYQWtmsiY0SmJb74PJgtL3uUbqpfMeLk
 GRj6KOTpjPRrRJHDrLOxTSpH1OpmLB9ZEtpJTLACHxwWTVpJk+5BIPwy5E3EndgtdwAX
 AiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nBzDSSm0EEu8YlwYiGk806GwlAAQU2Z/FUPe+VsHFPA=;
 b=m/bqT4jo/YhQvjVEx0BXVLUvdUEsHP0dKYyGJMX/nhxhyGbDm0RN/JycgIOJUaQH2V
 DweE8PK9A/Y9YuowwofQ56g95fnbsrfw3RrKpACvnV5XUuFlNPqAqIzDq41vDhsJbfm5
 qoGWbjDoQMZPVcyoj7q0IYlleoIgs8L96kXcs1eWIbu93+FtqVTPtreWdB0hGM8ShO88
 aZon55BZ2UZMrZhNuD1mJsAQr5idu9UzHb7WPc1EMZ2ZWd0BedfbhKRg9RZeYC1nnfMl
 kitUAIk83RdT0sCOW5mAxFL0kUhgfZWPSPB5Kbk/a1Jn4LrPbseQZOBXbJ4Aoo3I9ZFP
 SPLQ==
X-Gm-Message-State: AOAM5334d5ibHUhICMnO4gEC3k8O+ASZJNqXwpo6mRTfWzSdJv8WeCGh
 GMVXZxccWBfvRK40I83q8RH4wmEV4c65JF2ybe/2SQ==
X-Google-Smtp-Source: ABdhPJwgh41dih9zlPM7REbgp2M1RRBY3okeMOFFaelkW45rQiD2UpYI1Hy/ZYL6fCL22GHQ0lPqBGm073/jol8UNeg=
X-Received: by 2002:a25:1402:: with SMTP id 2mr9089323ybu.684.1644232438681;
 Mon, 07 Feb 2022 03:13:58 -0800 (PST)
MIME-Version: 1.0
References: <20220203093922.20754-1-tzimmermann@suse.de>
In-Reply-To: <20220203093922.20754-1-tzimmermann@suse.de>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 7 Feb 2022 16:43:47 +0530
Message-ID: <CA+G9fYtZ=HMdwk7entzU9sbBh3EPcOO8jGLDGV9BE5Qp0qvoww@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: Select DRM_DP_HELPER for DRM_PANEL_EDP
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: arnd@arndb.de, airlied@linux.ie, rdunlap@infradead.org,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 Linux Kernel Functional Testing <lkft@linaro.org>, sam@ravnborg.org,
 ardb@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Thu, 3 Feb 2022 at 15:09, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> As reported in [1], DRM_PANEL_EDP depends on DRM_DP_HELPER. Select
> the option to fix the build failure. The error message is shown
> below.
>
>   arm-linux-gnueabihf-ld: drivers/gpu/drm/panel/panel-edp.o: in function
>     `panel_edp_probe': panel-edp.c:(.text+0xb74): undefined reference to
>     `drm_panel_dp_aux_backlight'
>   make[1]: *** [/builds/linux/Makefile:1222: vmlinux] Error 1
>
> The issue has been reported before, when DisplayPort helpers were
> hidden behind the option CONFIG_DRM_KMS_HELPER. [2]
>
> v2:
>         * fix and expand commit description (Arnd)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: adb9d5a2cc77 ("drm/dp: Move DisplayPort helpers into separate helper module")
> Fixes: 5f04e7ce392d ("drm/panel-edp: Split eDP panels out of panel-simple")
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Link: https://lore.kernel.org/dri-devel/CA+G9fYvN0NyaVkRQmA1O6rX7H8PPaZrUAD7=RDy33QY9rUU-9g@mail.gmail.com/ # [1]
> Link: https://lore.kernel.org/all/20211117062704.14671-1-rdunlap@infradead.org/ # [2]
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: dri-devel@lists.freedesktop.org

Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

This patch fixes the repored build problem.


> ---
>  drivers/gpu/drm/panel/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 434c2861bb40..0aec5a10b064 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -106,6 +106,7 @@ config DRM_PANEL_EDP
>         depends on PM
>         select VIDEOMODE_HELPERS
>         select DRM_DP_AUX_BUS
> +       select DRM_DP_HELPER
>         help
>           DRM panel driver for dumb eDP panels that need at most a regulator and
>           a GPIO to be powered up. Optionally a backlight can be attached so
> --
> 2.34.1
>


-- 
Linaro LKFT
https://lkft.linaro.org
