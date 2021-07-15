Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE883C95E0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 04:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7366E4AF;
	Thu, 15 Jul 2021 02:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A676E4AF
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 02:25:30 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id 23so3786018qke.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 19:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=McBq68M+HsWMO7TnkYEiDyLYccEzmurvCsExjxpoKnY=;
 b=cijbUUgggTcNqbllSrtS1wkZhN1lCIRy1EHbQHn8iR7GmtvV0qmcHImAGokNOmWsYf
 Z+6xs3jEFiDEEwUnv3nb0cpnmXtfBQPT6tf78UQihArg2dw2wfRLOrmOGKOUPwTmlkLp
 s51vxj3pDrwXc8OdrOiEiZvuKSQoomzmt20mY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=McBq68M+HsWMO7TnkYEiDyLYccEzmurvCsExjxpoKnY=;
 b=DPThsSB8zQk6O2pf15u/RXReChGEEO1VSXr/J9N/CjhesDzJ/90gI/dCq8fjTH4mGU
 K96Xip3qvYI0de8HR6dkXEabKVanxdkKiHkqiE4eWBo9BmWQ8afGSynyNtTH+RfYV5TZ
 YWeujS2X8AMJCb5cfYIizXt92vzFmpizP0j7bc71zi1MX5XZwkCEkd+0pOt4Jh32zG2H
 ofSW+Ra72G2JuMCPgnLfnZbQJsgGjuOa56xfgkGaFr/1yHgEKDxh3dO9i00aoqsz0wy/
 Wc8Q9XAfPXRZ6HAvhnlOxg8yQXH/MaS0eaf21x/+3WlzRGsvWxWLfZR8FsZrRoPQguo0
 mpdg==
X-Gm-Message-State: AOAM531Bf19cbQS5rGyOoKm7H97m5SKAGhvzkMF+ll/7IQlOy+LFMbLe
 UBvTI02XAcYRGm8Mp6n3tes9j36M4hWPwA==
X-Google-Smtp-Source: ABdhPJyUSHkwShtKcizWcflLzZ7daSE2/KcjOPQTK6j6YR5TNGo5Xhqi/n0q62ZT0z9Fg8QgBEzrkg==
X-Received: by 2002:a37:9e0e:: with SMTP id h14mr1295131qke.264.1626315929263; 
 Wed, 14 Jul 2021 19:25:29 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180])
 by smtp.gmail.com with ESMTPSA id a127sm1341799qkc.121.2021.07.14.19.25.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 19:25:28 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id y38so6532988ybi.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 19:25:28 -0700 (PDT)
X-Received: by 2002:a25:8082:: with SMTP id n2mr1538174ybk.79.1626315927662;
 Wed, 14 Jul 2021 19:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210714225002.1065107-1-linus.walleij@linaro.org>
 <20210714225002.1065107-2-linus.walleij@linaro.org>
In-Reply-To: <20210714225002.1065107-2-linus.walleij@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 14 Jul 2021 19:25:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WnO+vH_6-KC8WZ4AyGY9knWz6ecK3Hwqy9CQX1RnZzQw@mail.gmail.com>
Message-ID: <CAD=FV=WnO+vH_6-KC8WZ4AyGY9knWz6ecK3Hwqy9CQX1RnZzQw@mail.gmail.com>
Subject: Re: [PATCH 2/2 v4] drm/panel: ws2401: Add driver for WideChips WS2401
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

On Wed, Jul 14, 2021 at 3:52 PM Linus Walleij <linus.walleij@linaro.org> wr=
ote:
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
> Reviewed-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v3->v4:
> - Add more talkative Kconfig telling which mobile phone has this.
> - Make sure to turn off the internal backlight totally if requested.
> - Alter the logic so that we assign the backlight handle to
>   panel->backlight directly and save some code.

Officially this is disallowed according to comments. ...and I quote:

/**
 * @backlight:
 *
 * Backlight device, used to turn on backlight after the call
 * to enable(), and to turn off backlight before the call to
 * disable().
 * backlight is set by drm_panel_of_backlight() or
 * drm_panel_dp_aux_backlight() and drivers shall not assign it.
 */

I do not personally know the motivation of not letting drivers assign
it, but with the words "shall not". Yikes!

-Doug
