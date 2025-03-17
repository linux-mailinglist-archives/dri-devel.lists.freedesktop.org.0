Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A787A657FC
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 17:27:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46CC10E2C4;
	Mon, 17 Mar 2025 16:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="OCuUrVEu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D7E10E2C4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 16:27:15 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5439a6179a7so5153570e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 09:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1742228828; x=1742833628;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s9th5vgX4dWb9XCR4ZHNIQSuw33Mm+jd8Ej6CRSdV6U=;
 b=OCuUrVEuDStp53FIu3sSYzAMjgHp85uQGBRwLZm7se/KCqtjisNFOaBfJMHN8ISgRV
 lU2UCzi3Mf++47gtfGUXmUB1R5mPgZsrACvygoeB5q62qdu9qo5ongzUEyLko4SbHbdI
 hJFCVcwhrIS564IH33M+EaYgQVtZNpfijb9TQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742228828; x=1742833628;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s9th5vgX4dWb9XCR4ZHNIQSuw33Mm+jd8Ej6CRSdV6U=;
 b=gaTCIiSx7ClRu22fG6xANgr20kPNeFp2FGM4bdXZIVKIBNtkOpdGXKdSxssB5oheHE
 HlW8AdYiIGsgOs8Cb1vx/MK1h6+4Edj6red85StHju/NvPhEnlFszIHNfs124lj1Qh+h
 TlWF3uTzONCEqAsrsZq7jnlcSROzahRwC8Rf2fMMR4/y46A+VOxZdqMsV/m979A0Hm2g
 9A//t18hJS5YB3qdhXnJxw21GefoJOGVfozHFcLXLaXXLLj4+VIE/Vehc60GtxWiBx18
 nokHxrHUd3PlFDjfT5CW4+94S15dzguk1fUeKdLjttfyPJB0hQvibs8eTQZFFFWU9F1n
 +Ouw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbrxi4OEv+qcqGKbGmEXdv7crLW8TeO/V7/nfJ/gbO01auhYksW+Nu/skQLmm/qDPA/bHB2F+HzKY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywnetv1qKil3saf920CjxyFUENeS4jrY2jW07lOp14vbGEDsN/3
 fyXTdqxZ5ShiGudYG+KIJMjTpjcoAChDuVUYFMnK74/Xs2UqMbrws9T0xqjpW4KGH8aYGkGMnM1
 tTQ==
X-Gm-Gg: ASbGncvsCLdeSuKAj0SrQ6aXT3QnDvAJ8E1YcMkLujJv5RbOQIejzmcJDwTLmAKPnYy
 +Jzgxk/hOOiIobdpQ93WdG4EYrq4v8tInLzsV//BAsQLLf9879ulQ7FA91f8Qd7yLdW/aU9w6ea
 CqT3oZ/nH6JknZYS2cbrHM4aZxwzxjAOJXXBlyIxkwlIVDbhgjKUOO/IxfJmg4C1e6dU7O5xbWB
 wgyWXYtN7YQPWuHH5Vi3lQ+3QKp5gSmUiv0g67phfbfwTOQbIYvwbpAXc1ooXgKawvg1aDgnbmT
 JcOLsCjZxuYYvKE7CTPinnlg20HUIz1zysiN9ieuWDn9kSPG1fI/5vieRYEe+x48WzN5jW8NMq4
 bg6RTFSWG
X-Google-Smtp-Source: AGHT+IFZcAXZVgXg7fnqXSkxLamZD5vdjlzySIeRnF6VW6lJqwhlnAG5y4fCxFbtD2g723kAw/uc0w==
X-Received: by 2002:a05:6512:6c3:b0:549:94c4:9f01 with SMTP id
 2adb3069b0e04-54a30475792mr94209e87.6.1742228828251; 
 Mon, 17 Mar 2025 09:27:08 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba88508asm1355445e87.186.2025.03.17.09.27.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 09:27:07 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-54991d85f99so5855898e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 09:27:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXPpYLmipqvmsdgsJxoTqnIxvazjplWl0ANhtN68dZNkQ1JqNe2mpqlqLl+fVG3g5wvJvlgiggP01w=@lists.freedesktop.org
X-Received: by 2002:a05:6512:1244:b0:549:903d:b8d8 with SMTP id
 2adb3069b0e04-54a30475b3emr112201e87.8.1742228826202; Mon, 17 Mar 2025
 09:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250316045024.672167-1-tejasvipin76@gmail.com>
In-Reply-To: <20250316045024.672167-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 17 Mar 2025 09:26:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xk6hYmJGLhW2ruvWwOETfmCAQX000WX4LrC3CPCZJMJQ@mail.gmail.com>
X-Gm-Features: AQ5f1JrBrTk4sVBXsj3dmm7M114VmKW881GUc4grvUi98QYdB5nlyFUkRHGglwY
Message-ID: <CAD=FV=Xk6hYmJGLhW2ruvWwOETfmCAQX000WX4LrC3CPCZJMJQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: samsung-s6d7aa0: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 aweber.kernel@gmail.com, quic_jesszhan@quicinc.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asrivats@redhat.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, Mar 15, 2025 at 9:50=E2=80=AFPM Tejas Vipin <tejasvipin76@gmail.com=
> wrote:
>
> @@ -62,93 +62,66 @@ static void s6d7aa0_reset(struct s6d7aa0 *ctx)
>         msleep(50);
>  }
>
> -static int s6d7aa0_lock(struct s6d7aa0 *ctx, bool lock)
> +static void s6d7aa0_lock(struct s6d7aa0 *ctx, struct mipi_dsi_multi_cont=
ext *dsi_ctx, bool lock)
>  {
> -       struct mipi_dsi_device *dsi =3D ctx->dsi;
> +       if (dsi_ctx->accum_err)
> +               return;

nit: I don't think you need this extra check, do you? The entire
function is "multi" calls so just let them be no-ops. It may seem like
an optimization to have the extra check at the start of the function,
but it's better to optimize for the "no error" case and let the
"error" case be a little slower.


>  static int s6d7aa0_on(struct s6d7aa0 *ctx)
>  {
>         struct mipi_dsi_device *dsi =3D ctx->dsi;
> -       struct device *dev =3D &dsi->dev;
> -       int ret;
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
>
> -       ret =3D ctx->desc->init_func(ctx);
> -       if (ret < 0) {
> -               dev_err(dev, "Failed to initialize panel: %d\n", ret);
> +       ctx->desc->init_func(ctx, &dsi_ctx);
> +       if (dsi_ctx.accum_err < 0)
>                 gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> -               return ret;
> -       }
>
> -       ret =3D mipi_dsi_dcs_set_display_on(dsi);
> -       if (ret < 0) {
> -               dev_err(dev, "Failed to set display on: %d\n", ret);
> -               return ret;
> -       }
> +       mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
>
> -       return 0;
> +       return dsi_ctx.accum_err;

Not something new to your patch, I wonder if the setting of the reset
GPIO should actually be _below_ the call to turn the display on. Seems
like if that fails you should also be setting the reset GPIO. That
would be a change in behavior but seems more correct?

Given that it's a change in behavior, I'd be OK w/ leaving it as-is or
changing it (and mentioning it in the commit message). I'd be curious
if anyone else has opinions here.

...oh, actually, you should just delete the reset GPIO stuff from this
function. The one caller of this function is already setting the reset
GPIO, right?


Everything else looks good to me.

-DOug
