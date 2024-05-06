Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AB28BC770
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 08:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0A0112168;
	Mon,  6 May 2024 06:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="C/qLCOiF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E5E112168
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 06:19:27 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-61e0c2b5cd2so25803877b3.1
 for <dri-devel@lists.freedesktop.org>; Sun, 05 May 2024 23:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714976366; x=1715581166; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eFdACjcDM2Uo7LPWPgteG5eQO148kN9bkoBsOWzObaM=;
 b=C/qLCOiFSvcqTu1GJhSeZhDuYARx4qAQu5t2xfGY1+5o3sViXHr8lAHXAtM8DfITKv
 XPjoXKeddYLOHPgkc3DW0637IGX3zM2WoWx4padtHpuGAI1ybpX9ghqzw7+XF026+bUl
 348C4cSpdurotl7wrR7DDMrZL7Vfo3Fu/eI/cc7yIMOYA7tK8J6U1/YDFceiqEXmvgCb
 Tlw0mdEkIAU+kWo+AV6N6wb/KAujNePZpHJaL7OqbsSk9bf76CbfmdZJ2j4L2QL2D95N
 g54pcle1It32n385m14ztNQ30PwIgJri6XizavU/2fGH5XVmNjUrhSpJG72KPL1wYNNJ
 w/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714976366; x=1715581166;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eFdACjcDM2Uo7LPWPgteG5eQO148kN9bkoBsOWzObaM=;
 b=M9lNpiE+FQkLYsaQVVB2BXoXYtbPUP7x0tK/4Rjrif0Eg3CgJJUrltHtIV0IYsnewz
 om6Uu+EU3/aCXMHjYqi/4DCRVgHweS8+BO3Wa/ZQKVaC/XXrCeDkiiB34BheFtNTwCe/
 E3HkIENOQikyJ6bSEe/upePqqWHc1MQ+sV67SH7o+uNIckXjdNVhuaEhqYxEPpr78mrm
 EURRT5nosk5vjwe2FWkhi5iQF/rHzwZFAJ48k6JjLcwF4ZKUR4M2v9XzGcRiyNfyMPsD
 fE22+sY1llS3AvG4jX1N2spIZRxM5riV2v+Wa5Wo6/M9ymVkPmlS51ixeBLj82DuCYrX
 5VyA==
X-Gm-Message-State: AOJu0YzxqhudvInnSQLwCj+drSCjNyM1rJ7w+oAOtkcNOYoCDU31aLcr
 /L2EiCTwKWFA1njwazyUEhRfn9/F1IqmB3lTlR1QucbLCkc513Su5iwWvzJtvspyIIESEW/lWTv
 kL7HB0CVa9BcbLyz595rOuMO/0ejh0Ohy4MmDgw==
X-Google-Smtp-Source: AGHT+IEOfDlvTMI/NrunpGMGEX1H7cUaYUMUIp5ePuXRYMERxQPnW5eCWrbE7ubT2MVuE+JU6uHO09TVxn9P+Oaprq0=
X-Received: by 2002:a05:690c:398:b0:61b:e1e8:9a2c with SMTP id
 bh24-20020a05690c039800b0061be1e89a2cmr10154543ywb.1.1714976366663; Sun, 05
 May 2024 23:19:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240501154251.3302887-1-dianders@chromium.org>
 <20240501084109.v3.8.I407b977f9508573103491df549dfaffc3688db13@changeid>
In-Reply-To: <20240501084109.v3.8.I407b977f9508573103491df549dfaffc3688db13@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 May 2024 08:19:15 +0200
Message-ID: <CACRpkdZm2diaTMQdpdCRdzjkmzP6dEYtWpCF+NyUzoYbqnFbuw@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] drm/panel: ili9882t: Don't use a table for
 initting panels
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Hsin-Yi Wang <hsinyi@google.com>, 
 Brian Norris <briannorris@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 Joel Selvaraj <jo@jsfamily.in>, lvzhaoxiong@huaqin.corp-partner.google.com, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
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

On Wed, May 1, 2024 at 5:43=E2=80=AFPM Douglas Anderson <dianders@chromium.=
org> wrote:

> Consensus on the mailing lists is that panels shouldn't use a table of
> init commands but should instead use init functions. With the recently
> introduced mipi_dsi_dcs_write_seq_multi() this is not only clean/easy
> but also saves space. Measuring before/after this change:
>
> $ scripts/bloat-o-meter \
>   .../before/panel-ilitek-ili9882t.ko \
>   .../after/panel-ilitek-ili9882t.ko
> add/remove: 3/2 grow/shrink: 0/2 up/down: 6834/-8177 (-1343)
> Function                                     old     new   delta
> starry_ili9882t_init                           -    6152   +6152
> starry_ili9882t_init.d                         -     678    +678
> ili9882t_disable.d                             -       4      +4
> ili9882t_disable                             260     228     -32
> ili9882t_prepare                             540     396    -144
> .compoundliteral                             681       -    -681
> starry_ili9882t_init_cmd                    7320       -   -7320
> Total: Before=3D11928, After=3D10585, chg -11.26%
>
> Let's do the conversion.
>
> Since we're touching all the tables, let's also convert hex numbers to
> lower case as per kernel conventions.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for doing this Doug, everything is starting to look much
better after this series, and I hope we can keep Chromium display
drivers looking this good going forward.

Yours,
Linus Walleij
