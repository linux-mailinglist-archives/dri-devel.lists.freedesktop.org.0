Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A81CA8BC7C5
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 08:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891F41121A4;
	Mon,  6 May 2024 06:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="g0T3EGkS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366D91121A4
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 06:45:27 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-61be4b9869dso16136547b3.1
 for <dri-devel@lists.freedesktop.org>; Sun, 05 May 2024 23:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714977926; x=1715582726; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+mfxz2O8XS3FqjCrjmLET9AWxg3oFsKvwghyYD05k6U=;
 b=g0T3EGkSl5vFc2BhcEbui2jP1myzu/9+g+heeE0yR99wrk7ICyaEJTAAWzF32jidK2
 zU85CH87Jm3gZfGd0CtTWzSE9X9E4zMVDrc2XLW91CYLqAjg/j+2sFHHz3kJWD3mGcXA
 DKVao2AiyQTiaq7pa3M47RPSNcZNxA5O6Pyybk7K2iACAm4zd/EH/bJsuGcG1q+LtmOY
 V0qvguqu+7y+sj0bXdS8cQRNe9KkkNZQmMa4752dD7yugfrGD0lGkc3MxEH1gHkidwWe
 85XKbm1RVMOE9dwqE+ldW/CvOBWqrLpR/E+KxTQ3QLRWxw3rlhWd6X8nfNN+oYDP77Je
 d5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714977926; x=1715582726;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+mfxz2O8XS3FqjCrjmLET9AWxg3oFsKvwghyYD05k6U=;
 b=SS0d3uHrRBrNqE+Pq3QSHXj3pKlT6eKwL7n5SD1Gt+EZxY/C3oVzQ74DuW4WCn57gM
 ODaoFpFcSbAx9ZuwnGjf4lc/xVO4JDLJaXJLEcXMSPjy8rtBttRW7W46zjXkFEzF+GUb
 iyzSZ6lU2Y7Qa/tvzPqI71upS+ttPtdD7pR/NGKDlX7au1g4HCEkrZiM+cIN2ECRefac
 HB3Y7qyups+nraPdNwda1hqJENUhFK10MgOegYpZMOjWCZrhywByGAArmBP3QLE2z3z7
 Lb0QifB7hSUZKqV2jPP78gM1Bs4w4qVpRY58n/F7Ng5gvwLW0oSzIoRps+lnnnNBrkpR
 Xd5g==
X-Gm-Message-State: AOJu0Yz7rOrPiAQ09lX+5HX3VB7N62U4X90F/Da5x6XytJ0AMEAe9weA
 5SojLIvdhk5/F6+M3pGeP6Nb0QI0HN7MxmtZIrNE/8K/w0OXsGrmVLWqPAxc7zRjYlLKu1mcf0I
 W87XQ4nhYRw/g522UDu43ToD6BJgD11I4bTWjnQ==
X-Google-Smtp-Source: AGHT+IEFH0U8CO1IDjCLvIZv1boxJZTKo1UkGaFseTk0bJY4Cy4LrIDB4kffcrBBs7di25uwzfJQ4u2WysBYxgh/aSs=
X-Received: by 2002:a81:a14a:0:b0:61e:a3a:2538 with SMTP id
 y71-20020a81a14a000000b0061e0a3a2538mr9695835ywg.18.1714977926097; Sun, 05
 May 2024 23:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240501154251.3302887-1-dianders@chromium.org>
 <20240501084109.v3.9.I947e28c81f9ef7dcd3add6e193be72d6f8ea086f@changeid>
In-Reply-To: <20240501084109.v3.9.I947e28c81f9ef7dcd3add6e193be72d6f8ea086f@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 May 2024 08:45:15 +0200
Message-ID: <CACRpkdZek9Q1ovQY_f7SzT3bvcK4dsn_t0ZGB94On7MG=CzTEw@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] drm/panel: innolux-p079zca: Don't use a table for
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
> init commands but should instead use init functions. We'll use the
> same concepts as the recently introduced
> mipi_dsi_generic_write_seq_multi() to make this clean/easy and also
> not bloat the driver too much. Measuring before/after this change:
>
> $ scripts/bloat-o-meter \
>   .../before/panel-innolux-p079zca.ko \
>   .../after/panel-innolux-p079zca.ko
> add/remove: 3/2 grow/shrink: 0/1 up/down: 2356/-1944 (412)
> Function                                     old     new   delta
> innolux_p097pfg_init                           -    1772   +1772
> innolux_p097pfg_init.d                         -     480    +480
> innolux_panel_write_multi                      -     104    +104
> innolux_panel_prepare                        412     308    -104
> .compoundliteral                             480       -    -480
> innolux_p097pfg_init_cmds                   1360       -   -1360
> Total: Before=3D5802, After=3D6214, chg +7.10%
>
> Note that, unlike some other drivers, we actually make this panel
> driver _bigger_ by using the new functions. This is because the
> innolux-p079zca panel driver didn't have as complex of a table and
> thus the old table was more efficient than the code. The bloat is
> still not giant (only 412 bytes).
>
> Also note that we can't direclty use
> mipi_dsi_generic_write_seq_multi() here because we need to deal with
> the crazy "nop" that this driver sends after all commands. This means
> that we have to write code that is "inspired" by the new macros.
>
> Since we're touching all the tables, let's also convert hex numbers to
> lower case as per kernel conventions.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

With the mentioned bugfix:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
