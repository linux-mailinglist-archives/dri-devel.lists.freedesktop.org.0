Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2322F526356
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 15:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A6810FDF4;
	Fri, 13 May 2022 13:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3EC310FDF3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 13:57:41 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id i27so16405880ejd.9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 06:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SeZYALh4SsSu+91tGqKKp5gUOcMNbC3UkE8NjdIrDlo=;
 b=cX3HavepppFTBYU0dtwHb2Ov2TOTqfelxFn6/joI1mhLJqSTSmviU9jxPz4w42y1M8
 HcVw5zO+zSoQfxLla1jR1r8ydVTZrXNJmynOjc0mOECLUdMqf8XItr3gjUmwWE5ZV7VQ
 LH6dkLY4N64DKQn3e5WRfTcesfjG77agqv5qA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SeZYALh4SsSu+91tGqKKp5gUOcMNbC3UkE8NjdIrDlo=;
 b=Drc3Ph9xoQe8p7slXawCcnEkYQi6gcFmsilJvtDBj/wFxNWq3+AU5kjJSn7/ZXAoOn
 fy5cchhAw+/6st0y6jT9PEL/saBTfYCbojE07f+4Q46jSDIfVMgeAWGCpOH+dXcvPV7g
 5grmhBHSC+zPvO3pW3DrByyspmuAXil8WKtglH2eaF8j0g1ZNeHIXaHrkaG77QcaFMaZ
 Eabhjo7WzS18GCiqFfYskGgHDQcCdigmAhAlM81m5UN5+ESUleJ2/Yqn1Dseor5e9tVA
 arWUEDuxq0SXvzHVlw1r/qoZtDGKkCcnfEv0ypeJ9USqQSbXnzT8TTM+0k0dYdcV482A
 dbuQ==
X-Gm-Message-State: AOAM53231uim2IhsU6BxB+27Aih9SlkiRmEuaS36s+eCuPHkGRu77dwX
 AsVRJX4zoevAG3qSo4q5+VvrjDbLxjv2a2uy2OSSCw==
X-Google-Smtp-Source: ABdhPJyKXwP/qUWQ6hOkGDs3meXoKdSGE4Z/q8Zi1em/RuQ4v/wPpwGnw6XYWels1Si/D2lZwdHtSiyqkWqkVU7OYNY=
X-Received: by 2002:a17:907:e91:b0:6f4:d1e7:417d with SMTP id
 ho17-20020a1709070e9100b006f4d1e7417dmr4438901ejc.123.1652450260489; Fri, 13
 May 2022 06:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
 <CAPY8ntC-2Yij+a5wWEZ3BRBSh7bz+74coHCoB01ZhY550H+BDg@mail.gmail.com>
 <CGME20220405114402eucas1p1d139ce6825a481d1318f013cf27a5fe7@eucas1p1.samsung.com>
 <CAPY8ntAi1tM7BZEpKkMAasRH3R_+tJCUFY7k-yVBdtogvxQNRA@mail.gmail.com>
 <e96197f9-948a-997e-5453-9f9d179b5f5a@samsung.com>
In-Reply-To: <e96197f9-948a-997e-5453-9f9d179b5f5a@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 13 May 2022 19:27:29 +0530
Message-ID: <CAMty3ZC30i0E5WcpraWNMbArmYPrXiweHTMVz=QoW0_cXh-oTA@mail.gmail.com>
Subject: Re: [PATCH V2 0/3] DSI host and peripheral initialisation ordering
To: Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Marek Vasut <marex@denx.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 11, 2022 at 8:28 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Dave,
>
> On 05.04.2022 13:43, Dave Stevenson wrote:
> > On Fri, 18 Mar 2022 at 12:25, Dave Stevenson
> > <dave.stevenson@raspberrypi.com>  wrote:
> >> On Fri, 4 Mar 2022 at 15:18, Dave Stevenson
> >> <dave.stevenson@raspberrypi.com>  wrote:
> >>> Hi All
> >> A gentle ping on this series. Any comments on the approach?
> >> Thanks.
> > I realise the merge window has just closed and therefore folks have
> > been busy, but no responses on this after a month?
> >
> > Do I give up and submit a patch to document that DSI is broken and no one cares?
>
> Thanks for pointing this patchset in the 'drm: bridge: Add Samsung MIPI
> DSIM bridge' thread, otherwise I would miss it since I'm not involved
> much in the DRM development.
>
> This resolves most of the issues in the Exynos DSI and its recent
> conversion to the drm bridge framework. I've added the needed
> prepare_upstream_first flags to the panels and everything works fine
> without the bridge chain order hacks.
>
> Feel free to add:
>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
>
> The only remaining thing to resolve is the moment of enabling DSI host.
> The proper sequence is:
>
> 1. host power on, 2. device power on, 3. host init, 4. device init, 5.
> video enable.
>
> #1 is done in dsi's pre_enable, #2 is done in panel's prepare. #3 was so
> far done in the first host transfer call, which usually happens in
> panel's prepare, then the #4 happens. Then video enable is done in the
> enable callbacks.
>
> Jagan wants to move it to the dsi host pre_enable() to let it work with
> DSI bridges controlled over different interfaces
> (https://lore.kernel.org/all/20220504114021.33265-6-jagan@amarulasolutions.com/
> ). This however fails on Exynos with DSI panels, because when dsi's
> pre_enable is called, the dsi device is not yet powered. I've discussed
> this with Andrzej Hajda and we came to the conclusion that this can be
> resolved by adding the init() callback to the struct mipi_dsi_host_ops.
> Then DSI client (next bridge or panel) would call it after powering self
> on, but before sending any DSI commands in its pre_enable/prepare functions.
>
> I've prepared a prototype of such solution. This approach finally
> resolved all the initialization issues! The bridge chain finally matches
> the hardware, no hack are needed, and everything is controlled by the
> DRM core. This prototype also includes the Jagan's patches, which add
> IMX support to Samsung DSIM. If one is interested, here is my git repo
> with all the PoC patches:
>
> https://github.com/mszyprow/linux/tree/v5.18-next-20220511-dsi-rework

This seems a bit confusing to me, how come a Host initialization
depends on the downstream bridge call flow?

Thanks,
Jagan.
