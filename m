Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3D61DB0CF
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 12:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9AB6E132;
	Wed, 20 May 2020 10:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD45F6E10F
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 10:59:39 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id z12so1092751uap.6
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 03:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CXGaKccVrRy36L43Nke8P+zhim7bpSfiT4aGLV8CKcA=;
 b=gjE595vXwYwWb9RsVXte3hkyNLKaKLXIfqRmP3wfz4Q35f2vBm56o9xjAIOm4ofxRz
 /pitgVFqXv7tx/J5njhqQvse0iyN9L6LSDQXJqTtib1g/JUb437VTS39XK6jAQrY4+9k
 oxSdnsxnxbIrJa2DPBKn+MvewMRlq/mXBBSrIuv0Lsdq2kjUiUUkgBT9Afi01jgUHIyV
 WA3bTZ0XEBv1AFSH6WRpZdlxnhWNplSt1OB5mjNtBzTQ8lmssykQWwTvFKJ/aK7tO3d1
 CLDoGRshoZ5uSgkJ2wJe8JOm840PXTF2VXwSwA0kDJnD3tGn25jYXslVjxxYob986b2l
 7CgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CXGaKccVrRy36L43Nke8P+zhim7bpSfiT4aGLV8CKcA=;
 b=uS0kmG63Ylcst1TG3JDnhz0ObYp7Dd4NdScMr5NJGripCMwoTk5o3DHVTQ2FxWRYvA
 OB7SSFeFYvvE64f0s1ZIFxPdN8ewEDzI7ngklem29jdIPXwS82INqvm/h1VH5qiKY+IG
 V1F1fncw5kHqGhwvH+zqFssd6hg7YX8fT6VtB2DLPeiK9hQl6JdQ17r/1SsukxMEWv/0
 uy/UMn6E/vvM2l+Y9fTgp/0uOnVtAk0NJcrfvT8KikJwh/5sUMMFW9WGe4GCpkVPf2pM
 vZdSZkpHsSqWSCLV6l57zfts5NKO742UQzP/27cbHSA8Zc73H38VfOzVDwN/adbtTEQQ
 lsQQ==
X-Gm-Message-State: AOAM530s2QI0PX8NNSyZ9nOJ1FqaUlElBSXrL2oGrNSuzIFaglxUMLey
 elCY2awYnFjodoDONPSSAN+NTKeGYip0wauwZ6s=
X-Google-Smtp-Source: ABdhPJyvHJkmJbRptDh8mQ4oHd78/X7Er/4FZ5Lj5ztGvU007xdvuspQeMjeeyWTK3Fw7+MINPYnYsWh9TxmVdhbooo=
X-Received: by 2002:ab0:4e0d:: with SMTP id g13mr2929360uah.64.1589972379086; 
 Wed, 20 May 2020 03:59:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200517190139.740249-1-sam@ravnborg.org>
 <20200517190139.740249-17-sam@ravnborg.org>
In-Reply-To: <20200517190139.740249-17-sam@ravnborg.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 20 May 2020 11:56:43 +0100
Message-ID: <CACvgo51C6zb_K3DBwG-xhf9=baoxmcp8YeCFEyB3XvqA5p7r2A@mail.gmail.com>
Subject: Re: [PATCH v2 16/16] backlight: use backlight_is_blank() in all
 backlight drivers
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Andy Gross <agross@kernel.org>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Sun, 17 May 2020 at 20:02, Sam Ravnborg <sam@ravnborg.org> wrote:

> --- a/drivers/video/backlight/88pm860x_bl.c
> +++ b/drivers/video/backlight/88pm860x_bl.c
> @@ -123,13 +123,7 @@ static int pm860x_backlight_update_status(struct backlight_device *bl)
>  {
>         int brightness = bl->props.brightness;
>
> -       if (bl->props.power != FB_BLANK_UNBLANK)
> -               brightness = 0;
> -
> -       if (bl->props.fb_blank != FB_BLANK_UNBLANK)
> -               brightness = 0;
> -
> -       if (bl->props.state & BL_CORE_SUSPENDED)
> +       if (backlight_is_blank(bl))
>                 brightness = 0;
Off the top of my head, the above two lines should really be in backlight core.
There's nothing driver specific to them, plus it minimises the chances
of next-driver getting it wrong.


> --- a/drivers/video/backlight/as3711_bl.c
> +++ b/drivers/video/backlight/as3711_bl.c
> @@ -107,13 +107,11 @@ static int as3711_bl_update_status(struct backlight_device *bl)
>         int brightness = bl->props.brightness;
>         int ret = 0;
>
> -       dev_dbg(&bl->dev, "%s(): brightness %u, pwr %x, blank %x, state %x\n",
> +       dev_dbg(&bl->dev, "%s(): brightness %u, pwr %x, state %x\n",
>                 __func__, bl->props.brightness, bl->props.power,
> -               bl->props.fb_blank, bl->props.state);
> +               bl->props.state);
>
Let's also move this to backlight core.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
