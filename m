Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E0D4F56D7
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 09:35:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39FB910F468;
	Wed,  6 Apr 2022 07:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89B010F468
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 07:35:04 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 s14-20020a17090a880e00b001caaf6d3dd1so4999360pjn.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 00:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5CP8FXnPXw7W8pjgs5sytTiLcyEOz/zjWAnYj1yHLDs=;
 b=qjeTxG2MVVWWxo1K2eiQxaxEw8kR9uixr/B6vyRqHgU/nDXUKdLQoKXmTBnOcmWN+s
 wRhL4EIbwkKZ2kNo+fRr8vZmaHH0EtugeRC5eRlJSfnu0EhpWk+K7KvmeWOOLORqMnhh
 +O9uyQ25xm9df1H1nTOBdOJqq9+J7g6BVaoDCwOdwMReRm11uwri6GLGrbK9XhuHJIli
 vvirNBjV2FBzoKa+VYtd8NGXO68km/ZL49qc88dumosoKBu1uWeoOFc/NLtfdet91roz
 Qoc7utyLp+upHRy5Xyty5feuMEYRdXMePlrGtjj5BsbvNL6nkReaT1klQuqxQ0REsAgg
 Ex2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5CP8FXnPXw7W8pjgs5sytTiLcyEOz/zjWAnYj1yHLDs=;
 b=qk5rDx6f0esfHcrCydk1UmGT45s6jNPnKR+irmjVoOLUEZcosRPUZ31Z/pSpgTwita
 tUhsCVJBQs+Ik5DcQt/yyvR6Idx0BllQKjLVZU3Rst/9MLPrdJs0XoinVfPmp/XaJUCl
 qbUwCn4qy1k5JLmw/4ZxdeivQDYTZ4mBs2Jd/VdFTREPJ9Yqrcmyap7wbjQ/Yjz96Ikq
 HLyQNqnbjmkRyHzkLS6CU5TWIuKljPj7zBdylDJ1yV7e4hLzE4k+nnYLLh78n1Si2Qhe
 Q/f0tdksskItHAtGGzvC2V7XG83ZcB7DSX5fS/ab0boT5VpWWOo5zwOuQ4/nVItja+Pr
 Bq/Q==
X-Gm-Message-State: AOAM5318fBT3utxa+on45dnNozH+kyHPWHNAH0bE4ybLkJfZW6LnODxq
 TXCaibTo5HkfEQ/Qa4j3YZsmSol4pKFr89iztTZD+Q==
X-Google-Smtp-Source: ABdhPJx04THCjLXCCdEuimv62YYNAKFBpZ2Ddsxdx/elVkirOr6++zcgODKjAZv2H44e/T4cCVE1RzB0q9eMJCOrMoA=
X-Received: by 2002:a17:90b:3e85:b0:1c7:7eab:2649 with SMTP id
 rj5-20020a17090b3e8500b001c77eab2649mr8606094pjb.232.1649230504392; Wed, 06
 Apr 2022 00:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220406014250.902187-1-marex@denx.de>
In-Reply-To: <20220406014250.902187-1-marex@denx.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 6 Apr 2022 09:34:53 +0200
Message-ID: <CAG3jFyuDzKW3fKSZMob3idBWGk3S8jmGVw83p7Rnm02ouyy0Pg@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: icn6211: Mark module exit callback with
 __exit
To: Marek Vasut <marex@denx.de>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 6 Apr 2022 at 03:43, Marek Vasut <marex@denx.de> wrote:
>
> Fix copy-paste error, module exit function should be marked with __exit
> instead of __init.
>
> Fixes: 8dde6f7452a1 ("drm: bridge: icn6211: Add I2C configuration support")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> To: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/bridge/chipone-icn6211.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
> index c4d2f6d811bf1..b9cc0fac26686 100644
> --- a/drivers/gpu/drm/bridge/chipone-icn6211.c
> +++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
> @@ -787,7 +787,7 @@ static int __init chipone_init(void)
>  }
>  module_init(chipone_init);
>
> -static void __init chipone_exit(void)
> +static void __exit chipone_exit(void)
>  {
>         i2c_del_driver(&chipone_i2c_driver);
>
> --
> 2.35.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
