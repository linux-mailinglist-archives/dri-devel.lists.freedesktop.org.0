Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B718829129
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 01:15:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6801510E536;
	Wed, 10 Jan 2024 00:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A4810E536
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 00:15:09 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a28f66dc7ffso808529366b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 16:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1704845706; x=1705450506;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5kAqGhucPMVtfo1InPdfTFWkdNUtgMKoqN9J3JzON2c=;
 b=LY8gv6Txw6ru6gdsYJjiYhCwe9iIE7k/FIzqmrx5iNmkpSgA1e+cvZO+glQyM+63Tw
 qAxeRQwDrDxFJ1vZJc5gpN/BgMNXZV4iXo4jukZus5+bNBA7GMkVDf1+FRJOmIRcqXUQ
 D1HRhGv0IcXAU/ApV4veuzRObyvJX1TA2/p54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704845706; x=1705450506;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5kAqGhucPMVtfo1InPdfTFWkdNUtgMKoqN9J3JzON2c=;
 b=b8vMcaG9C9oJoTD+VeCr2RUg7sbtatVO4C9gXWU6ePhGRedgtPXkZoORsvyyOpm37K
 +NoBAduh6ngCQh8CQinkwpkJ+k/EDLw6oIjWCTYSqez/jJFHcQKPrTbhO8uONdjahksj
 RraOJkpe/63OqzEiKWlyi9Vlw5mE7UHpUurgr0iwl6TvDD+HrU/RXnUAxqS40qB5OJb8
 mMhZw9w1LIzJgdwf7w6IDo0nr/xkwdysTKrDiXrPtEsbH/zQ8BZg9v5uq8PAlW9KZmlF
 9Udsb0G/8cJ9kgWOf/FRcqlQJtHcvyJnsljovlekIdyPX55/K6F0IXDiut3QiJ523p4A
 j14w==
X-Gm-Message-State: AOJu0Yy0FusN0xgM8i0giNd2JQV3C4DuF8nF3ZmLWtrZkeoX7sZ7VauB
 jxTqOLkxp4aRn2kJ7oARaLKtxiwRDPQhlZTDeTZnETa2SN/TOng=
X-Google-Smtp-Source: AGHT+IGz+yGD0+sOjpBsMACjjrflk5/wwYmJKlo/8Sf3Shu1Wguwb2XUaejd7PvQJWFj67Tz2NmnOg==
X-Received: by 2002:a17:906:1919:b0:a2a:c113:2677 with SMTP id
 a25-20020a170906191900b00a2ac1132677mr281999eje.61.1704845705572; 
 Tue, 09 Jan 2024 16:15:05 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42]) by smtp.gmail.com with ESMTPSA id
 l18-20020a1709062a9200b00a2afe82f651sm1554391eje.12.2024.01.09.16.15.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jan 2024 16:15:04 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-40e4afe9ea7so9975e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 16:15:04 -0800 (PST)
X-Received: by 2002:a05:600c:43c5:b0:40d:5fee:130 with SMTP id
 f5-20020a05600c43c500b0040d5fee0130mr62920wmn.5.1704845704513; Tue, 09 Jan
 2024 16:15:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1704835845.git.u.kleine-koenig@pengutronix.de>
 <53d8c545aa8f79a920358be9e72e382b3981bdc4.1704835845.git.u.kleine-koenig@pengutronix.de>
In-Reply-To: <53d8c545aa8f79a920358be9e72e382b3981bdc4.1704835845.git.u.kleine-koenig@pengutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 9 Jan 2024 16:14:49 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UyoSc7fpvaO08Bhj54UG5b1OGteXV95tCVkpDzrvzwsw@mail.gmail.com>
Message-ID: <CAD=FV=UyoSc7fpvaO08Bhj54UG5b1OGteXV95tCVkpDzrvzwsw@mail.gmail.com>
Subject: Re: [PATCH 2/5] pwm: Drop useless member .of_pwm_n_cells of struct
 pwm_chip
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Alexander Shiyan <shc_work@mail.ru>,
 Jonas Karlman <jonas@kwiboo.se>, Benson Leung <bleung@chromium.org>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, chrome-platform@lists.linux.dev,
 Guenter Roeck <groeck@chromium.org>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jan 9, 2024 at 1:35=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Apart from the two of_xlate implementations this member is write-only.
> In the of_xlate functions of_pwm_xlate_with_flags() and
> of_pwm_single_xlate() it's more sensible to check for args->args_count
> because this is what is actually used in the device tree.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c |  1 -
>  drivers/pwm/core.c                    | 22 +++-------------------
>  drivers/pwm/pwm-clps711x.c            |  1 -
>  drivers/pwm/pwm-cros-ec.c             |  1 -
>  drivers/pwm/pwm-pxa.c                 |  4 +---
>  include/linux/pwm.h                   |  2 --
>  6 files changed, 4 insertions(+), 27 deletions(-)

I haven't done massive thinking about this, but it seems reasonable to
me. I remember being confused about why we needed some of these extra
checks ages ago when I looked at this code, so getting rid of them
makes sense to me.

I've been involved with both the ti-sn65dsi86.c and the pwm-cros-ec.c
code and both looks fine to me.

I'm an official reviewer for ti-sn65dsi86.c and I'm fairly happy with
this tag for it:

Acked-by: Douglas Anderson <dianders@chromium.org>

...and I think it would be fine to go through the PWM tree. If one of
the senior drm-misc maintainers disagrees with me, however, then you
should listen to them rather than me.

-Doug
