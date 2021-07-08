Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A845A3C1A4B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 22:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9516E999;
	Thu,  8 Jul 2021 20:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61FC46E999
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 20:04:51 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id y9so5812079qtx.9
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 13:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uPw+0QJuY5Q09jTgOGFaWLvfQj6r7YCC88pG09d9eQ0=;
 b=W1+rZYCrvHU7VgIu2eBCFOeAfLxz4b4WUKFEgAcUzzxr7KE0nxGi/2ttANL2+3JiQr
 cB+bEP+nYjQYgTxfy9e0hNiHlXM0ZkwlnVkSX0v2cxzUkLaRuguTF18w9PcaKslYWAd3
 L38WveaxPZt6R37upOEgyO5LAaJUVQQE/3zHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uPw+0QJuY5Q09jTgOGFaWLvfQj6r7YCC88pG09d9eQ0=;
 b=X/zZjv1xXvvUgtQOcYOMN+MtG3kZXa8y/iYlu8CTwc+/gaes/MMeEHQ2BkiR7eAAzv
 nzzqX7njiC7Bj2y6F7bL+ZBENPIIrxDn57DrXfgXWA6KJ9qJK7VGeYkV0i4zRwwWmH4k
 AR5Z1leNPOIQyOYxL8Q8k1WgQtzg5AoM3kjht7abVbQcNsJwDtlzP3jHgayw215cuYEx
 JR3/jORPSAWckmoTAxKKcLYNqcZCJPLCJKH084UB41cc5TQctxYibDHPrx2BtZ5hQPHJ
 u/0JrZApQUkKu0yOA/HUSyzwceLkEZA3+B1o+Ot/93Y9zssUafpi9Jf+ipi5uU6nazTr
 5cRQ==
X-Gm-Message-State: AOAM530zOEnuTgEUohWNCgNj8Nvd4dRWcLwSYcD0FAyecJ9i8vE64+Ad
 xjQzeydxsz43URauxtawqyOxh8Fa/W/CJQ==
X-Google-Smtp-Source: ABdhPJz87nu4V4dp8go2t+5n8LsYXnJMNtyqa2Vr8lmYCTwoWIhSL1jproVBE61/+LNbaDhJpAsVXA==
X-Received: by 2002:ac8:670f:: with SMTP id e15mr29807018qtp.291.1625774690510; 
 Thu, 08 Jul 2021 13:04:50 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174])
 by smtp.gmail.com with ESMTPSA id y24sm1544857qkj.4.2021.07.08.13.04.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 13:04:50 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id y38so10945229ybi.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 13:04:50 -0700 (PDT)
X-Received: by 2002:a25:dc50:: with SMTP id y77mr41917648ybe.405.1625774689596; 
 Thu, 08 Jul 2021 13:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210707234315.242663-1-linus.walleij@linaro.org>
 <20210707234315.242663-2-linus.walleij@linaro.org>
In-Reply-To: <20210707234315.242663-2-linus.walleij@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 8 Jul 2021 13:04:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UkppOGLbgAMf-t+d8eAMcV9kiPGprHtKdeck0YhUnYrg@mail.gmail.com>
Message-ID: <CAD=FV=UkppOGLbgAMf-t+d8eAMcV9kiPGprHtKdeck0YhUnYrg@mail.gmail.com>
Subject: Re: [PATCH 2/2 v3] drm/panel: ws2401: Add driver for WideChips WS2401
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jul 7, 2021 at 4:55 PM Linus Walleij <linus.walleij@linaro.org> wro=
te:
>
> This adds a driver for panels based on the WideChips WS2401 display
> controller. This display controller is used in the Samsung LMS380KF01
> display found in the Samsung GT-I8160 (Codina) mobile phone and
> possibly others.
>
> As is common with Samsung displays manufacturer commands are necessary
> to configure the display to a working state.
>
> The display optionally supports internal backlight control, but can
> also use an external backlight.
>
> This driver re-uses the DBI infrastructure to communicate with the
> display.
>
> Cc: phone-devel@vger.kernel.org
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Drop the ws2401_command() macro - we enhanced the
>   mipi_dbi_command() to print errors for everyone instead.
> - Read out MTP properly (used wrong variables)
> - Register internal backlight if and only if the panel->backlight
>   field is NULL after trying to look up external backlight.
> ChangeLog v1->v2:
> - Disable the backlight in ->unprepare() before entering sleep
>   mode.
> - If we are not using internal backlight, close the L2 access
>   after initializing.
> - Depromote some talkative dev_info()s to dev_dbg().
> - Power up and read the MTP values before we register the display.
>   This works fine and is probably how MTP is supposed to work.
> - Fix the set-up of gamma values, this was found in the GT-I8160 HD
>   kernel tree.
> - Bail out properly if drm_panel_of_backlight() returns
>   -EDEFER_PROBE.
> - Drop OF from dependencies since drm_panel_of_backlight() has
>   static inline stubs in the header file.
> - Sort MAINTAINERS properly.
> - Alphabetize includes
> - Use format specifier %#02x so we get 0x... output in debug
> - Drop unnecessary braces around if () in debug macro
> - Drop unused <of.h> include.
> ---
>  MAINTAINERS                                   |   7 +
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-widechips-ws2401.c    | 436 ++++++++++++++++++
>  4 files changed, 453 insertions(+)

Looks nice to me now.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
