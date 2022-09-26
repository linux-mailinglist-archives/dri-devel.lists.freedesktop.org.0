Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7485EA8A4
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 16:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C0E10E6CE;
	Mon, 26 Sep 2022 14:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C159C10E6C9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 14:39:50 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id r18so14505561eja.11
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 07:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=U4P4B3TbQzarjVNZDv4gqApQTlrs8KmOMrryfEJMlqQ=;
 b=Fp99UflAw+Dk6Ml2cfIJ16FGICkQxIkBHbnCh9bLj+OhheO2m3OhnF+uD7cHOMH3p5
 gltrAa3kSng8qilmB53Pt+2SS+lChIa9pRgx8dXM46vyh4O6wlXOxNzd/SDdy3AvQwyS
 iHJ7IKKrsqP4Xnm8aMFM0F0Vw5DGOgVoO3wUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=U4P4B3TbQzarjVNZDv4gqApQTlrs8KmOMrryfEJMlqQ=;
 b=JW/6hTGgFvsZJ2qUhxPHOa39B48uxlzCsq1kKUjzlyMqwUlui4A7KQT+CLahW/6hlR
 vEq7Yl6ZRxO9MJNb3p10p8wPo9cBGi1++K6jeFrB5RmQNuX/KIFeJfUfysr3wuNBzJXw
 DnEd9au4/42ey3TIUFENhuWxJ6ORrzjRyPsGr5hF1Vk7WQzUh9THaS2WOV6wAAGWWx5S
 vlWPuTAlK+1XO4BmbWVKMsS6NHO+rjUhhWi0CVt3lVqNmTq1FgjucTQW7coqj1qYFyJJ
 +RxdsAmwb4NvXkyNf24VgWIco8JKa5K8PocO/lxOSVSo25yLWdrh6yUlqzwmdLg4hsyP
 E/Xg==
X-Gm-Message-State: ACrzQf1e3F8nlaDqHhB+r3PTwjdwICgkSDxmrhnRTnk/8Ge/5xiUp+aO
 RK5zv3Sp4iL/j55n/eYIP6X2VtwXJdomBY0k
X-Google-Smtp-Source: AMsMyM4oLKIPVhifD4ZF3OEF1rE49+T5XoyuHL7lNHuZbd8darKornJwFU0Bb3p5b/ZrPvtlXdnhng==
X-Received: by 2002:a17:907:7faa:b0:783:a5f7:86ec with SMTP id
 qk42-20020a1709077faa00b00783a5f786ecmr3290280ejc.187.1664203189152; 
 Mon, 26 Sep 2022 07:39:49 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com.
 [209.85.221.41]) by smtp.gmail.com with ESMTPSA id
 g2-20020a17090604c200b007415f8ffcbbsm8473761eja.98.2022.09.26.07.39.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 07:39:47 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id t7so10523686wrm.10
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 07:39:47 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr13578674wrr.583.1664203187390; Mon, 26
 Sep 2022 07:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220926100839.482804-1-sean.hong@quanta.corp-partner.google.com>
In-Reply-To: <20220926100839.482804-1-sean.hong@quanta.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 26 Sep 2022 07:39:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U1iUHBbA52Jr2mV5JSvTeipTZ3DuAS9mJ6gitBDwp8UQ@mail.gmail.com>
Message-ID: <CAD=FV=U1iUHBbA52Jr2mV5JSvTeipTZ3DuAS9mJ6gitBDwp8UQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add INX N116BCA-EA2
To: Sean Hong <sean.hong@quanta.corp-partner.google.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Sep 26, 2022 at 3:08 AM Sean Hong
<sean.hong@quanta.corp-partner.google.com> wrote:
>
> Add support for the INX - N116BCA-EA2 (HW: C1) panel
>
> Signed-off-by: Sean Hong <sean.hong@quanta.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 060f4f98bc04..ba75fae7d376 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1889,6 +1889,7 @@ static const struct edp_panel_entry edp_panels[] = {
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116WHM-N45"),
>
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x114c, &innolux_n116bca_ea1.delay, "N116BCA-EA1"),
> +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x1154, &delay_200_500_p2e80, "N116BCA-EA2"),
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, "N120ACA-EA1"),

This patch doesn't apply cleanly. You should be posting it against the
top of drm-misc-next to make it easy to apply.

In this case the merge conflict was trivial so I've fixed it and pushed it but:
* Other folks applying patches won't do this.
* If a patch is more complicated, I won't do this either.

In any case, this is now in drm-misc-next as:

c7bcc1056cff drm/panel-edp: Add INX N116BCA-EA2


-Doug
