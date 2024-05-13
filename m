Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 872148C4549
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 18:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB3E910E6BC;
	Mon, 13 May 2024 16:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="GL9PqtjW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DD510E6BC
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 16:49:51 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-792b8c9046bso402408485a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 09:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715618989; x=1716223789;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hJRwL4tnfvW/OsRQWszZHG+HVl8OHZr6t0b1afINm14=;
 b=GL9PqtjWSbpyKHodk2xGahrTIm+zNXzizJ88M9cZ+Q8GGvJ13mk6o1eqpSiAfxTZlo
 Jfku7VMnvugybZv/2lr6AoxzHThtY+u94h3I6NuhLiHQxHow4vQEKIyqieNAZxMAChm1
 0RPnEM1EnGeP44Wtga6hgmmu79ohb32KyYm3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715618989; x=1716223789;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hJRwL4tnfvW/OsRQWszZHG+HVl8OHZr6t0b1afINm14=;
 b=v0zp8Q+CXCAoA2uJQY/G79d/WoX/DTn3RTW7dZDK2eZCEvmL1bF8afKM1ZA8H0yEOT
 14ZrVcsZBXXlxJlZ5XsUCp6Y9gVV96eSaTH2RvXqPdBRdlV49Dvuc1Aam6x60Hf74+Y3
 TdIvn/c97t3lyhIcHLZhZ7I27G5S/KnT8WMC8sYnFRkvo/r3KEIFl7F7NrRlmRUA+h6W
 4oorUv4gy8cKqdLGn5Q4EKG+eyDVtfdaBL7REFnP4GtWU1tItbISTUXtNdPPqSVmJ/at
 EXciaU7pa5fO4Nyx1mOhIeWp+0qOg7QP5jUOsscUIujW1CtTH1HIBV8jQmXT8TsNPQLd
 hXQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmsCvTfh0JwEhJXgR+6XPjFWDccJXXWybwaykPL0bZeeWKG+h16mdvt4D4KrKiy8GTpJIi033y4CuJvhoTNO5hY6a3pwLWbSAKTeN8mCFX
X-Gm-Message-State: AOJu0Yy4UzyKRT3NErR9qPvgAiiWFW1zNeJpHbsebm+Y80SkrenIbwe3
 nANi9ok3rDD90El8ixIw1Yq3M0ZmUy/hrV0+Bh1ghlwxa9zcVyJ+4rS7ogH0hsTZeQv3tpSEkv8
 =
X-Google-Smtp-Source: AGHT+IFIwrneJfsN03jN3xoKTcP5TGeoZPkFsh5a2JhkZqDunnaAKqej/f3K1PILKtCXdhJtsglW0Q==
X-Received: by 2002:a05:620a:1905:b0:790:c6ef:3d0f with SMTP id
 af79cd13be357-792c75ff8c6mr1396974285a.54.1715618989406; 
 Mon, 13 May 2024 09:49:49 -0700 (PDT)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com.
 [209.85.160.176]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792bf33b36csm469082485a.129.2024.05.13.09.49.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 May 2024 09:49:48 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-43dfe020675so847031cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 09:49:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW2StC6aLWwCB+rseni9Nf6xEpq1+++uCrL+sig3NaV9+YfVOvai9vIbiY6NKLZykFMI45iv5HEdTPh/9KvHQXZ71fFeg5RSW3Oh+I/aT+2
X-Received: by 2002:a05:622a:1c15:b0:43a:f42f:f0b4 with SMTP id
 d75a77b69052e-43e0a22b948mr4322661cf.13.1715618987646; Mon, 13 May 2024
 09:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240511021326.288728-1-yangcong5@huaqin.corp-partner.google.com>
 <20240511021326.288728-3-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20240511021326.288728-3-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 13 May 2024 09:49:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xm99c3t_LGiHCBaJVKfurD7_SO1Wcxk73gZgftS7jEcw@mail.gmail.com>
Message-ID: <CAD=FV=Xm99c3t_LGiHCBaJVKfurD7_SO1Wcxk73gZgftS7jEcw@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] drm/panel: himax-hx83102: Break out as separate
 driver
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 linus.walleij@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
 robh+dt@kernel.org, conor+dt@kernel.org, airlied@gmail.com, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 xuxinxiong@huaqin.corp-partner.google.com
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

On Fri, May 10, 2024 at 7:13=E2=80=AFPM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> +static int hx83102_prepare(struct drm_panel *panel)
> +{
> +       struct hx83102 *ctx =3D panel_to_hx83102(panel);
> +       struct mipi_dsi_device *dsi =3D ctx->dsi;
> +       struct device *dev =3D &dsi->dev;
> +       int ret;
> +
> +       gpiod_set_value(ctx->enable_gpio, 0);
> +       usleep_range(1000, 1500);
> +
> +       ret =3D regulator_enable(ctx->pp1800);
> +       if (ret < 0)
> +               return ret;
> +
> +       usleep_range(3000, 5000);
> +
> +       ret =3D regulator_enable(ctx->avdd);
> +       if (ret < 0)
> +               goto poweroff1v8;
> +       ret =3D regulator_enable(ctx->avee);
> +       if (ret < 0)
> +               goto poweroffavdd;
> +
> +       usleep_range(10000, 11000);
> +
> +       mipi_dsi_dcs_nop(ctx->dsi);
> +       usleep_range(1000, 2000);
> +
> +       gpiod_set_value(ctx->enable_gpio, 1);
> +       usleep_range(1000, 2000);
> +       gpiod_set_value(ctx->enable_gpio, 0);
> +       usleep_range(1000, 2000);
> +       gpiod_set_value(ctx->enable_gpio, 1);
> +       usleep_range(6000, 10000);
> +
> +       ret =3D ctx->desc->init(ctx);
> +       if (ret < 0)
> +               goto poweroff;
> +
> +       ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> +       if (ret) {
> +               dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> +               return ret;
> +       }

The above should have been "goto poweroff", not "return ret".


> +       msleep(120);
> +
> +       ret =3D mipi_dsi_dcs_set_display_on(dsi);
> +       if (ret) {
> +               dev_err(dev, "Failed to turn on the display: %d\n", ret);
> +               return ret;
> +       }

The above should have been "goto poweroff", not "return ret".


Other than that:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
