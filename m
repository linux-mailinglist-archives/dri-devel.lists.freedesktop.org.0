Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 627BF9332DB
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 22:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75DEC10E8B3;
	Tue, 16 Jul 2024 20:19:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fGhfqLg2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E650910E8B3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 20:19:23 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-52ea2ce7abaso9845069e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 13:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721161162; x=1721765962; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v7rnxoOORbgKG3u1CwvViVAf3E43JRXh1BLDYP5Qb1M=;
 b=fGhfqLg2H4NCcPIVn/41crba5n/xTDdxNuc5aeyPkRgV6DWCUDJ1S4mof9CCUVC+e+
 X+fOH4UwdOO4REDuiXF6UTFdHYQ8nFd5AK7N78qKg0XX7BZVk7ZxkjT6Jd3FuufDZALN
 BAKbHsgMPRCtbJOzRQzow7IQOmm7mzHzYd9T+Fc1QwbpdCjHC9izemcCKydjafWg/0fW
 aFLS9Ajq6MKH4bPy3KW3jQ0lDVbnTmCjeKcZA2Lb9d/NZt3qPBsU9qDRCs/lTeZAxG+i
 /B3tvYIWlgq3JVj4jjjBtEPW77xQK+z4dwWUiVl5TgltcDeD26oMq0fwJQWO0JE9pX0u
 WNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721161162; x=1721765962;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v7rnxoOORbgKG3u1CwvViVAf3E43JRXh1BLDYP5Qb1M=;
 b=hOkOA8SIlwQZHJ1X+Z6C8z3pG2mTXqrkLdCf48PUH6A+8MrBm6ag3hWScC0xGZq3Wg
 MykL8G4rejNAN/6UvPehy7OMnqkOCTuQGfM/OXzVoWDSBUh/0lHxAEQiydRxoYYpBO0P
 iHlu1Kf1jjMnufYJfMY+Cl+JBpqjlmQx881qiBB8dab6m4E8iiAG4g++RDhouZPN9dkr
 UlhoXYGDDc+F+r+KyRaF4ZH/OfFit2tBJJ479riwYu3Aa4p1ZVzZIlSTLK1uwiBMx8nx
 zbpf3lb7/wbOgAj5H8bEa5mBopE47wmo6iMl5P9LAk02FSNVGycI48AHpuzYjrGaoEAZ
 BQLw==
X-Gm-Message-State: AOJu0Yy0qWIzLgP8hlDo4kXNwHl1ww5CwcglWdAFxfkg7QyvObH07BjL
 bqcLV9zbvjn1neOTT/W4KzmLgMUGT6uJbrtWrOSqy6A7PtL8lbIkUFiwpgLrOvcNBEWmvjvYkOg
 vi/5CoZKcYdeLCaYDPQF9ImtXhcdPb/HjavHkhA==
X-Google-Smtp-Source: AGHT+IFR9vPzZCaRAsh1FMZTGXiS1AhwmINfoSqA8fEWvYjLsWq33v+6qCjuwBm59JwgPW2bYOjKGJ1lsdYdjsXqqhE=
X-Received: by 2002:a05:6512:3185:b0:52e:7f18:176b with SMTP id
 2adb3069b0e04-52edef0fddbmr2312562e87.11.1721161162024; Tue, 16 Jul 2024
 13:19:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240621134427.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid>
In-Reply-To: <20240621134427.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 16 Jul 2024 22:19:10 +0200
Message-ID: <CACRpkdaT=zjrKtqS7h4Fq1sLOJ1MoxW9K-wMfWqOmD68owj+Kg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Avoid warnings w/ panel-simple/panel-edp at
 shutdown
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Maxime Ripard <mripard@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Fri, Jun 21, 2024 at 10:45=E2=80=AFPM Douglas Anderson <dianders@chromiu=
m.org> wrote:

> At shutdown if you've got a _properly_ coded DRM modeset driver then
> you'll get these two warnings at shutdown time:
>
>   Skipping disable of already disabled panel
>   Skipping unprepare of already unprepared panel
>
> These warnings are ugly and sound concerning, but they're actually a
> sign of a properly working system. That's not great.
>
> We're not ready to get rid of the calls to drm_panel_disable() and
> drm_panel_unprepare() because we're not 100% convinced that all DRM
> modeset drivers are properly calling drm_atomic_helper_shutdown() or
> drm_helper_force_disable_all() at the right times. However, having the
> warning show up for correctly working systems is bad.
>
> As a bit of a workaround, add some "if" tests to try to avoid the
> warning on correctly working systems. Also add some comments and
> update the TODO items in the hopes that future developers won't be too
> confused by what's going on here.
>
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

This is the right thing to do.

Yours,
Linus Walleij
