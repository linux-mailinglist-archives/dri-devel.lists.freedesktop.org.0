Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24959ADBDF8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 02:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7616510E476;
	Tue, 17 Jun 2025 00:14:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NFp340Fi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2599710E475
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 00:14:55 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-23633a6ac50so72671565ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 17:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1750119292; x=1750724092;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tdpbl3k/YSmDDGdsuwN+GlqcV59+7D5igTv++Q9dI5Q=;
 b=NFp340FiAJ7ZTmP6gWXuwbPDzOYSeJJRdbARI6kqrcjTtxjKpOWXO0omRD4sDguDWW
 Ab+38kNxcHXCeBKGHWfuBsx/P1yEGYXcryd3o0EZ4qSe3Gdutn9+t3kW58EDzBBMIJe3
 EczxsYUYSD4ARFw8hOQa8Bpz0shNNKfwK1swc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750119292; x=1750724092;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tdpbl3k/YSmDDGdsuwN+GlqcV59+7D5igTv++Q9dI5Q=;
 b=fvKb3QfyOVbz8rJci2LhmhKY/uWXj/1/xs9gKAeoxpi8ulJxuaOjMBVWLoQ5L29tug
 zVVjeCpHIOBPnKu5XIC/wAt95cQZ+XrgZplnMbwpSyyThKJw7vLcdruduAnSu++9mpuU
 6OCHo2ziDTSXILJo5/baE8pkGqsrXPqVklcSV0Hyd4bXUk8YUtgzUcDXCtAv1EMUYq3T
 D+SV98IjXlFewnbUEL9DTc0Voif0L0f/Ezjl9XsWutZ+PBSwCLodaX1WxA2/wMqZu+7E
 Q6qAiwCafT8CvTgcP8wEdq+/7jHQf5l/rq0LVIwj00O5GykIYv969z1roSTqZG6SkXX5
 yTvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3OD6ag4FrR3QkDiiZJbgOJfKDtC3ffu3ESvJPq3Jk+OITDYXOsroAyylKLMN7qHMMxSRb0LPKXDw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygXTZIQYPUbWWxu1VGyGSht+OrCUOr+qI8hy5j5EjOJUoO/3Uk
 /+JEl9tZBc1RQ4EHh2mbgIfK81rHFTDgDhAjHXt4Aiz9F/NdSaLCKlPvBq3jCoYxvO04+7U7a1b
 /GLk=
X-Gm-Gg: ASbGncu09OjQBJv6tOiKRoDjHNfJh0r4jlk4p3zBrizn9Mxi1V0neDFxuWwIxihpfg1
 uaLRofYpMpZvVm0dCcZTc39pXWvtGL6LpFaZU9D2grpzLHx9TfaUNzL6jG2xrq3wh4aHaPQEMB1
 iMULhjyEVhzKqMiMXJHwXsijckeGjuFLIxcqsuPiK+WkcC6zxxbE/U7kRoGlH0fCTr/ZwVBbbqp
 hbocwHo/BvEJOXXZkKLiKOVnwaTKbLU+Y9vBSx5eRvoyRfHp5gPzzLa7C0duBDz6SpToBKPIGP4
 bYtFoYYeU84mH6VmVL5BM8OnxQ+4sZ84FI0yaQqaVOSdSkdiHiKuqmFHvknJWNwSpAfKr6/577K
 f0cav/p+9J0qLB7ETRRf9JZ18jrYm8g==
X-Google-Smtp-Source: AGHT+IGpmEXpEzCAeN2QIHh2x3fvia/MXXlvkoaxloUlaSi0sCpspOjvN/lmX02Wjdt6F+lKuQboUQ==
X-Received: by 2002:a17:902:f750:b0:236:7079:fafd with SMTP id
 d9443c01a7336-2367079fdb1mr102923425ad.36.1750119292542; 
 Mon, 16 Jun 2025 17:14:52 -0700 (PDT)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com.
 [209.85.215.175]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365d88bdedsm67495035ad.15.2025.06.16.17.14.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 17:14:48 -0700 (PDT)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-b3182c6d03bso3445450a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 17:14:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWPwNy1CRQ17Z9B7x1rf5ysA06CuCY2+G+2DzkF+B6XkL1pmYCDFK/YcUXfFcOy9j01wDlyrYho/Eo=@lists.freedesktop.org
X-Received: by 2002:a17:90b:5104:b0:311:ad7f:329c with SMTP id
 98e67ed59e1d1-313f1ce5cacmr19759622a91.18.1750119283755; Mon, 16 Jun 2025
 17:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpu-v1-1-ac0a21e74b71@linaro.org>
 <CAD=FV=Unb1LdKV7iuPME1KJ35OBbP5OXD=_=A0ESQFCOzFBSXQ@mail.gmail.com>
In-Reply-To: <CAD=FV=Unb1LdKV7iuPME1KJ35OBbP5OXD=_=A0ESQFCOzFBSXQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 16 Jun 2025 17:14:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XXCkqWmKT-bA5wqtbUy0nFRkewyApAkAx_1OCGAXV9Eg@mail.gmail.com>
X-Gm-Features: AX0GCFuDw-NZx-6lsELE9bQYvQioo6Vrln5eCE046cB2GyvGfvnR5APAhOiGf30
Message-ID: <CAD=FV=XXCkqWmKT-bA5wqtbUy0nFRkewyApAkAx_1OCGAXV9Eg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: use new GPIO line value setter
 callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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

On Tue, Jun 10, 2025 at 9:27=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Tue, Jun 10, 2025 at 5:34=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> > Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> > values") added new line setter callbacks to struct gpio_chip. They allo=
w
> > to indicate failures to callers. We're in the process of converting all
> > GPIO controllers to using them before removing the old ones.
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 18 +++++++-----------
> >  1 file changed, 7 insertions(+), 11 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Looks like this should be fine to go through drm-misc. I'll plan to
> apply it next week unless I get overly distracted.

Pushed to drm-misc-next:

[1/1] drm/bridge: ti-sn65dsi86: use new GPIO line value setter callbacks
      commit: 98df1626ae036c1ba8c844c9fd995ab8f23bbe37
