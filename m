Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E14304429A6
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 09:39:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 170BE6FEA1;
	Tue,  2 Nov 2021 08:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
 [209.85.221.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072CA6FE9F
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 08:39:53 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id u207so4542492vkb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Nov 2021 01:39:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vtHObjXz/fBAC2wVKkwQJuDdB+3lhXmiXIXLkWkTc/M=;
 b=5RVRzpKRSPLM408+uPRsew/YphABPbFy3AW8o7O6ilve8nn+6Kx2msMmBIU68+Wfli
 xAQCPmOCbKfLokFN8AWRwCS2Zcj85dbhgISueYcWUhRPDnBAbUBtrjGK+e6rwyrB+8TQ
 AcYVmckO+WbVafZzis5V8Rlx2aepb0cd6HjrpI4G2GkG6Nd/0N2uclnZISdwJ1Gp0d2n
 I2UXrz0qroAyunEgFj/2kpfOhOygCzwS5328qiyeTT5rag8VZkLw1CinjyXJhAQI+neT
 stAkUSVnunNbUk0f74WfUoHmLGSWokRzdPT4foZVDLMD/t68QU8xycWR4RY53/p9amMz
 /4/w==
X-Gm-Message-State: AOAM531S1EcBSbx5TCRe7gQdw5AKupWOgOj1ZSS+t6ih6HU/+ecB2H/s
 CymNmPoN1asPMlQPAPQRhZuRwnU081bv8g==
X-Google-Smtp-Source: ABdhPJwhZxOnuBFs5UuzCLJotdixJ6hrE6ogLBsxHJUagm2G8T+2P7ly3qbjsUkKEca3W8DruOlodQ==
X-Received: by 2002:a05:6122:169e:: with SMTP id
 30mr10748140vkl.7.1635842391856; 
 Tue, 02 Nov 2021 01:39:51 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com.
 [209.85.222.46])
 by smtp.gmail.com with ESMTPSA id u14sm2738393vsi.2.2021.11.02.01.39.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 01:39:51 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id q13so36617443uaq.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Nov 2021 01:39:50 -0700 (PDT)
X-Received: by 2002:ab0:2bd2:: with SMTP id s18mr35296866uar.78.1635842390754; 
 Tue, 02 Nov 2021 01:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <YX1KCclMB/HTZ22c@fedora>
In-Reply-To: <YX1KCclMB/HTZ22c@fedora>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Nov 2021 09:39:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW5thqxWz37er3BHwqee_agvhHVDK5p8Hrx7HCKOdFjLA@mail.gmail.com>
Message-ID: <CAMuHMdW5thqxWz37er3BHwqee_agvhHVDK5p8Hrx7HCKOdFjLA@mail.gmail.com>
Subject: Re: [PATCH v3] backlight: lp855x: Switch to atomic PWM API
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>
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
Cc: Linux PWM List <linux-pwm@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ma=C3=ADra,

On Sat, Oct 30, 2021 at 3:35 PM Ma=C3=ADra Canal <maira.canal@usp.br> wrote=
:
> Remove legacy PWM interface (pwm_config, pwm_enable, pwm_disable) and
> replace it for the atomic PWM API.
>
> Signed-off-by: Ma=C3=ADra Canal <maira.canal@usp.br>

Thanks for your patch!

> --- a/drivers/video/backlight/lp855x_bl.c
> +++ b/drivers/video/backlight/lp855x_bl.c
> @@ -233,9 +233,8 @@ static int lp855x_configure(struct lp855x *lp)
>
>  static void lp855x_pwm_ctrl(struct lp855x *lp, int br, int max_br)
>  {
> -       unsigned int period =3D lp->pdata->period_ns;
> -       unsigned int duty =3D br * period / max_br;
> -       struct pwm_device *pwm;
> +       struct pwm_device *pwm =3D NULL;
> +       struct pwm_state state;
>
>         /* request pwm device with the consumer name */
>         if (!lp->pwm) {
> @@ -245,18 +244,16 @@ static void lp855x_pwm_ctrl(struct lp855x *lp, int =
br, int max_br)
>
>                 lp->pwm =3D pwm;
>
> -               /*
> -                * FIXME: pwm_apply_args() should be removed when switchi=
ng to
> -                * the atomic PWM API.
> -                */
> -               pwm_apply_args(pwm);
> +               pwm_init_state(lp->pwm, &state);
> +               state.period =3D lp->pdata->period_ns;
>         }
>
> -       pwm_config(lp->pwm, duty, period);
> -       if (duty)
> -               pwm_enable(lp->pwm);
> -       else
> -               pwm_disable(lp->pwm);
> +       pwm_get_state(lp->pwm, &state);
> +
> +       state.duty_cycle =3D br * state.period / max_br;

Above is a 64-by-32 division, which should not be open-coded, as
that will cause link failures on 32-bit platform (cfr. "undefined
reference to `__udivdi3'", as reported by the kernel test robot).
Please use div_u64() instead.

> +       state.enabled =3D state.duty_cycle;
> +
> +       pwm_apply_state(lp->pwm, &state);
>  }
>
>  static int lp855x_bl_update_status(struct backlight_device *bl)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
