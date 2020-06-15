Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1ED1F9A71
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 16:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46906E042;
	Mon, 15 Jun 2020 14:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77696E042
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 14:37:08 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id u17so9474781vsu.7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 07:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jQ7S3FlEiexYsr4lwFQ+YPcMSE4i4i8SYc02PMpdNRs=;
 b=OrN4GhiCldEYngS5C9zMWmKc8uT0jp2fECCklT9801PrIRD6hkwiJ3JGiK1iHeGhI+
 e5UGox5+6/NlvlOUcwJXW/xpmnMU89WF82kjAEMmEBpqHxVQ3d+tcz2wx2W8OQ/s44jZ
 Q0rQIksw4dkw8w0N5mEfN25a5oxnvwGyAm2mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jQ7S3FlEiexYsr4lwFQ+YPcMSE4i4i8SYc02PMpdNRs=;
 b=sGto5+puE4TTyWO9QJoYpr8SXgm3ftjYZsErYEorSmc4T2t1yvTcO1mwMCpNnC7tvg
 xFgigrZatULAThQJJnKO499ncejgKyTTVwdm/KjpMo1CHKBstrCN2afTczIjFj8Ok0PU
 WIxSAzXcvchSEgSRh6PgNLj74eGOcdcZtzbrVbo3U6VNf4kjuRM67qaDna+iMXEuhNbW
 Z7KTv8rtUXkmb57QElwJ0EsfLyOKKNPQOaLfVHa2Z+35DEfM8pq8w6SQ883IbwJ+4kRb
 k5VVU3192gAzvTgv8rmOxsY/uzWZe5PvBl6Dkug4DnLGFNcjYhnB9AD7Oj9yEAhpTI9z
 NfAw==
X-Gm-Message-State: AOAM532Ntlk5nHtfuRuav9m3M5vJts0e08SrEFIVmD7xV8geKv9zbgfe
 prQLG/ZxIG5+Fm6rJ9t/4Sf7MKJ+Qxw=
X-Google-Smtp-Source: ABdhPJwXoXkpCDUsobOqgBl/pyYsndMmMsXGpF2LKY2iLKyNz69fAEUSjEt15hOWQNTYNAVTVScgYQ==
X-Received: by 2002:a67:cb87:: with SMTP id h7mr19709752vsl.226.1592231827447; 
 Mon, 15 Jun 2020 07:37:07 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com.
 [209.85.221.179])
 by smtp.gmail.com with ESMTPSA id n12sm1991013uap.8.2020.06.15.07.37.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2020 07:37:06 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id n188so3978060vkc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 07:37:06 -0700 (PDT)
X-Received: by 2002:a1f:280c:: with SMTP id o12mr18294000vko.92.1592231825528; 
 Mon, 15 Jun 2020 07:37:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200612123003.v2.1.Ibe95d8f3daef01e5c57d4c8c398f04d6a839492c@changeid>
In-Reply-To: <20200612123003.v2.1.Ibe95d8f3daef01e5c57d4c8c398f04d6a839492c@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 15 Jun 2020 07:36:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W6d-Asap63+MDga26k2krfNOZ4ftcM1HPp3T0oXWdA0A@mail.gmail.com>
Message-ID: <CAD=FV=W6d-Asap63+MDga26k2krfNOZ4ftcM1HPp3T0oXWdA0A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/bridge: ti-sn65dsi86: Don't compile GPIO bits
 if not CONFIG_OF_GPIO
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Sean Paul <seanpaul@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, kernel test robot <lkp@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>, Sandeep Panda <spanda@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Jun 12, 2020 at 12:31 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> The kernel test robot noted that if "OF" is defined (which is needed
> to select DRM_TI_SN65DSI86 at all) but not OF_GPIO that we'd get
> compile failures because some of the members that we access in "struct
> gpio_chip" are only defined "#if defined(CONFIG_OF_GPIO)".
>
> All the GPIO bits in the driver are all nicely separated out.  We'll
> guard them with the same "#if defined" that the header has and add a
> little stub function if OF_GPIO is not defined.
>
> Fixes: 27ed2b3f22ed ("drm/bridge: ti-sn65dsi86: Export bridge GPIOs to Linux")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>
> Changes in v2: None
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

The kernel test robot gave me another yell over the weekend.  I think
the whole series is ready to land, but if nothing else could at least
patch #1 land to fix the build error so the robot is happy?

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
