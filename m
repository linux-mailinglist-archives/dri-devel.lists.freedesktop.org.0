Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2795D526363
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 16:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101E710F8AD;
	Fri, 13 May 2022 14:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2244D10F86F
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 14:01:55 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id j6so16407214ejc.13
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 07:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zogWEg/DHS/kEyTziX3Y7ikgUeE0/ghsHW2rBATD0As=;
 b=Z7B0E8uAAa4/07YBzPrvrGdGA1iyOcpHOu0Z6lAPmqfzBqg+6799a7oxE2M9oWKpfM
 kAESn4tV4iT80hxjIseTo3h8xkx1lDKhN99cyUbntq9rd/hvYh03D8Mz1zb0yrCQuZUb
 QvfmNQunVHmm/plBzVSEggaMg174uUCuMSShU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zogWEg/DHS/kEyTziX3Y7ikgUeE0/ghsHW2rBATD0As=;
 b=cBewjkZYz0HTxzV7hbQrqO9w1qdoejXO/GyVNGg2Am6KCLS30pAwCjH/+RoR6JWdBC
 SVei/91sMjj8iq5iD0JC3N5maiHtSovhNWLL+Jjt/XhQoyuYFPlrIyBxR3y17zVLyicg
 qV93hSzMlwnHgu1aQhd1ItJ7c+J4mKPlyVSvlvgpHawgZIdDynTv/4NR+QqR7921NB41
 4n4hR0SvVX4ze8nTIWmXq4vQELIx9tePRIwParzRBbJwMGmwO88bj1DAh4mb7adGSeoF
 yAHF+1nmmkKAsBjauX+gFQP15je0Xxtm14ryZ8gMPN/rlDHT8vCwRBjx3wTx1c+N30cp
 xSDg==
X-Gm-Message-State: AOAM533m1pCqrwbzulFRKq8yNS6QsbC8XpACA0TaJA3OJyLMrL39rZza
 n97o0uugGgtDgEB7kHbJZCcHKBoP/NpfzpZrg/yGwA==
X-Google-Smtp-Source: ABdhPJwUPel3f04//LuBKCSsHIdR/EfQndnH24nO7lj8baEqdrztIKkPW9AyxToA/0Xj+mdBqtNMXGeid7vpAJ+9O+c=
X-Received: by 2002:a17:907:2159:b0:6f3:a307:d01d with SMTP id
 rk25-20020a170907215900b006f3a307d01dmr4485594ejb.760.1652450513568; Fri, 13
 May 2022 07:01:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
 <CAPY8ntC-2Yij+a5wWEZ3BRBSh7bz+74coHCoB01ZhY550H+BDg@mail.gmail.com>
 <CGME20220405114402eucas1p1d139ce6825a481d1318f013cf27a5fe7@eucas1p1.samsung.com>
 <CAPY8ntAi1tM7BZEpKkMAasRH3R_+tJCUFY7k-yVBdtogvxQNRA@mail.gmail.com>
 <e96197f9-948a-997e-5453-9f9d179b5f5a@samsung.com>
 <c94fceb7-20d6-b7e4-a8cd-6a2f459990d6@denx.de>
In-Reply-To: <c94fceb7-20d6-b7e4-a8cd-6a2f459990d6@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 13 May 2022 19:31:42 +0530
Message-ID: <CAMty3ZAWPq5w-WTw9oo8y9DW8UobgQwetb_vFhD+ShjsrdQQ3Q@mail.gmail.com>
Subject: Re: [PATCH V2 0/3] DSI host and peripheral initialisation ordering
To: Marek Vasut <marex@denx.de>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>,
 Jonas Karlman <jonas@kwiboo.se>, Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 11, 2022 at 9:17 PM Marek Vasut <marex@denx.de> wrote:
>
> On 5/11/22 16:58, Marek Szyprowski wrote:
> > Hi Dave,
> >
> > On 05.04.2022 13:43, Dave Stevenson wrote:
> >> On Fri, 18 Mar 2022 at 12:25, Dave Stevenson
> >> <dave.stevenson@raspberrypi.com>  wrote:
> >>> On Fri, 4 Mar 2022 at 15:18, Dave Stevenson
> >>> <dave.stevenson@raspberrypi.com>  wrote:
> >>>> Hi All
> >>> A gentle ping on this series. Any comments on the approach?
> >>> Thanks.
> >> I realise the merge window has just closed and therefore folks have
> >> been busy, but no responses on this after a month?
> >>
> >> Do I give up and submit a patch to document that DSI is broken and no one cares?
> >
> > Thanks for pointing this patchset in the 'drm: bridge: Add Samsung MIPI
> > DSIM bridge' thread, otherwise I would miss it since I'm not involved
> > much in the DRM development.
> >
> > This resolves most of the issues in the Exynos DSI and its recent
> > conversion to the drm bridge framework. I've added the needed
> > prepare_upstream_first flags to the panels and everything works fine
> > without the bridge chain order hacks.
> >
> > Feel free to add:
> >
> > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >
> >
> > The only remaining thing to resolve is the moment of enabling DSI host.
> > The proper sequence is:
> >
> > 1. host power on, 2. device power on, 3. host init, 4. device init, 5.
> > video enable.
>
> +CC Raphael, STM32MP1 has similar topic.
>
> > #1 is done in dsi's pre_enable, #2 is done in panel's prepare. #3 was so
> > far done in the first host transfer call, which usually happens in
> > panel's prepare, then the #4 happens. Then video enable is done in the
> > enable callbacks.
> >
> > Jagan wants to move it to the dsi host pre_enable() to let it work with
> > DSI bridges controlled over different interfaces
> > (https://lore.kernel.org/all/20220504114021.33265-6-jagan@amarulasolutions.com/
> > ). This however fails on Exynos with DSI panels, because when dsi's
> > pre_enable is called, the dsi device is not yet powered. I've discussed
> > this with Andrzej Hajda and we came to the conclusion that this can be
> > resolved by adding the init() callback to the struct mipi_dsi_host_ops.
> > Then DSI client (next bridge or panel) would call it after powering self
> > on, but before sending any DSI commands in its pre_enable/prepare functions.
> >
> > I've prepared a prototype of such solution. This approach finally
> > resolved all the initialization issues! The bridge chain finally matches
> > the hardware, no hack are needed, and everything is controlled by the
> > DRM core. This prototype also includes the Jagan's patches, which add
> > IMX support to Samsung DSIM. If one is interested, here is my git repo
> > with all the PoC patches:
> >
> > https://github.com/mszyprow/linux/tree/v5.18-next-20220511-dsi-rework
>
> Can you CC me on the iMX DSIM discussion/patches ? It seems I was left
> out of it all, even though I work with the iMX8M DRM stuff extensively.

Sorry, this is not intentional. I added you and many others in RFC and
subsequently, I have added in the next versions whoever responds to
the previous. I will do it in the next version DSIM.

Thanks,
Jagan.
