Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E0DA5C8DB
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 16:52:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C033A10E5BB;
	Tue, 11 Mar 2025 15:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="IxxkjWaZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3D210E5BB
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 15:52:11 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5498d2a8b89so5671761e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 08:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1741708328; x=1742313128;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5aSw78de2mCMGc1nBdrYo0b6FIM8P0VsjFuePWhw/p0=;
 b=IxxkjWaZlW5v13FsUf0023zQICYx28vLgMEGQPqxES3gYDy9feYXgn1Ki8tJFpavDf
 7Tfs5jczNKxRExdFb+GFQV48hNxtE5KzpA1YINB1v5aJvbkvjZwQLycZ5vFtP7bVGEzy
 hVir81N3iTEwPHa5JwcBHM9CUsnuxaUEkF4HI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741708328; x=1742313128;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5aSw78de2mCMGc1nBdrYo0b6FIM8P0VsjFuePWhw/p0=;
 b=RgIJeFEQ+Xut2y+MgOiwje/B4a7SJHDYkL+4f02LqC7Rmvx1EbACMzVoI6YQJb+jbj
 J6btcL+1KcSYOAGa3JLpTCe/dFEqzyvN+D0qySg7hcn5VEMQbClgHBCI2xIycbUc6z2n
 XY1f+uZWu5hMs8CvfCIyIGsiTWeIG47PP04md7sIwUxXmqL9OmosTKsbMdrV8U/i3l2A
 bI1M38t7bzsZphRIOJPLsdOxXZ/hB4bL285ppg/xrD77FGX1BrbmdmCvCm+ornS7x+wY
 gydIYa0UBi88TzkUKQGyvltY1kTPhcSj0ud0lucHISeMeJsnwxCBs4lToisAOvvpCWEv
 PRvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaHceHhf1C1WdlNzNzR7zWpvyBDhcc/WE0O2n0pTtYF9CBFPVri557o4uUvqe5uDgV7YI9hprKLX4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhiuD8T53WdA43FA7Rblc+DdCUEspxFDqxZje/ki73JfZMuzx5
 j3190pLvacB2Tt7ZVSqdzsnz27xZrdGGDIXrCxgH4TlSsMOm9R+JtlYgLkjpK6Sdjcjvyys2n5y
 Ru/5N
X-Gm-Gg: ASbGncuVPET144otwLvl1FxfEkNnfPdwwlNKJf4M5/K9Zf7OSKdkLBRHw2+BY8fIu2J
 73JKbEt5bccZAhdQEIHqO2d2va6YN4ZGVEVadXUpZlrkbL27CjpkrHARhnisU8pGEHNhudcwgIk
 s9q0CCbgXN2cmoXcJjAAmAU5yYeA7NnP2Nuqys/QgDfAViYZjR4bqY9g9I8QOAscu+BoBTjDdk0
 hN/1ddxVZLuAx8vZgwCvdqcdcWBizXYDkyfBsxl/+Emow+4ayZE52yy5yx35DSPKVATQswCY64n
 +KrVmZFJN0Ny2BejY98FONeJ0CpQ5zIqFlO3lIs6G37l+acPbkxH+XrzlUeEBXTEK9XgfQR2MGC
 MD91xNr5p
X-Google-Smtp-Source: AGHT+IGRzPPC24vvIcbh/EcDLxTHl4ey+YzVbzaXxCbb9Uu0BWGQ+tLAwjdIXm8Fot5XTHnqRlobNA==
X-Received: by 2002:a05:6512:220a:b0:545:49d:547a with SMTP id
 2adb3069b0e04-54990e5dac1mr6246948e87.18.1741708328216; 
 Tue, 11 Mar 2025 08:52:08 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com.
 [209.85.167.41]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498ae4620asm1828874e87.13.2025.03.11.08.52.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 08:52:05 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5498d2a8b89so5671648e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 08:52:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWv6rRMqhzaoQmEQRws1M2tBksfLtdG8bAY/oprlKDSwjP70dzFCHaNeg3K/9y0UwsCRm45PbOCZws=@lists.freedesktop.org
X-Received: by 2002:a05:6512:39c7:b0:542:28b4:23ad with SMTP id
 2adb3069b0e04-54990e5da4dmr7908205e87.16.1741708321042; Tue, 11 Mar 2025
 08:52:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250310-mipi-synaptic-1-v2-1-20ee4397c670@redhat.com>
In-Reply-To: <20250310-mipi-synaptic-1-v2-1-20ee4397c670@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 11 Mar 2025 08:51:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WW1ak-_MEBVks==Yr1tUdfFZ3K16_gcdJQ9rwE4ZduNg@mail.gmail.com>
X-Gm-Features: AQ5f1JqjhYIh-K-V6kVV6ysPirVcNFNTBtRezYB438xMMjh4zAHshLydS3Jw1pI
Message-ID: <CAD=FV=WW1ak-_MEBVks==Yr1tUdfFZ3K16_gcdJQ9rwE4ZduNg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel/synaptics-r63353: Use _multi variants
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Tejas Vipin <tejasvipin76@gmail.com>
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

On Mon, Mar 10, 2025 at 1:58=E2=80=AFPM Anusha Srivatsa <asrivats@redhat.co=
m> wrote:
>
> @@ -70,6 +70,7 @@ static int r63353_panel_power_on(struct r63353_panel *r=
panel)
>  {
>         struct mipi_dsi_device *dsi =3D rpanel->dsi;
>         struct device *dev =3D &dsi->dev;
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
>         int ret;
>
>         ret =3D regulator_enable(rpanel->avdd);
> @@ -78,7 +79,7 @@ static int r63353_panel_power_on(struct r63353_panel *r=
panel)
>                 return ret;
>         }
>
> -       usleep_range(15000, 25000);
> +       mipi_dsi_usleep_range(&dsi_ctx, 15000, 25000);

No. None of the conversions in this function are correct.
mipi_dsi_usleep_range() is only for use when you're in the middle of a
bunch of other "multi" calls and want the sleep to be conditional upon
there being no error. Here there is no chance of an error because no
_multi() are used. Go back to the normal usleep_range().

> @@ -106,53 +107,46 @@ static int r63353_panel_power_off(struct r63353_pan=
el *rpanel)
>  static int r63353_panel_activate(struct r63353_panel *rpanel)
>  {
>         struct mipi_dsi_device *dsi =3D rpanel->dsi;
> -       struct device *dev =3D &dsi->dev;
> -       int i, ret;
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
> +       int i;
>
> -       ret =3D mipi_dsi_dcs_soft_reset(dsi);
> -       if (ret < 0) {
> -               dev_err(dev, "Failed to do Software Reset (%d)\n", ret);
> +       mipi_dsi_dcs_soft_reset_multi(&dsi_ctx);
> +       if (dsi_ctx.accum_err)
>                 goto fail;
> -       }

This isn't how the _multi() functions are intended to be used. The
whole idea is _not_ to have scattered "if" statements everywhere and
to just deal with errors at the appropriate places. You just trust
that the _multi() functions are no-ops if an error is set and so it
doesn't hurt to keep calling them. In this case you'd just have a pile
of _multi() functions with no "if" checks and then at the very end of
the function you check for the error. If the error is set then you set
the reset GPIO and return the error.

-Doug
