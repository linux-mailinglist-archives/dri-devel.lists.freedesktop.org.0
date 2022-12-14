Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC3364CCCF
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 16:02:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7D910E40B;
	Wed, 14 Dec 2022 15:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E2910E40B
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 15:02:17 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id t17so7205369pjo.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 07:02:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zizgjhAGxfQnxHupIAnCacCyNq0cxVj4cOtAYW/ctXU=;
 b=ROKLz+iTrcprmDj/BhOK1FY05E9Mt48faEoUXobrB2nqSgnx+zE0udfPnvi5vUyG/Z
 k+6xL1iRVvg7YsXd0YOpHNcjKOnmNDBwuuNd0rIygJcKvZM8p2JojM0MKd1NWCn17gsM
 NXHpTa5ZkjAhGl0xZXKsAuWMpNvUDUGDTo0hAe+hhMHdL0QyoNqHXbtZTXDxQ20WDlrs
 FEO3pmr23fL52TVt0F3sgOsix508rfAdS4YBIMBTbhsM0zd2OxxvAGd80VqPDbrzuNBf
 Fj4YctTqRV526v8vzQZeYRwW6KDT7I1yZpjSpfLkSfCfulo1OmkwJrqmpWXqGZTQ0LHt
 OK3w==
X-Gm-Message-State: ANoB5pk/Hfbitsqydh9v9FTG8TA2+TAbf9Rg2LUNMsRsmGFjMaxLHAL6
 JX0tWbffnS4g+eyXlg3/L2jm1W84gm/wcA==
X-Google-Smtp-Source: AA0mqf6nT/byREZZMEWR53Ab01VjK3aQJAfIdBhc0WmumeZaqPdDLWsWwJySsXNpdPUmTEBu5in3sA==
X-Received: by 2002:a17:902:6a8c:b0:185:441e:4cef with SMTP id
 n12-20020a1709026a8c00b00185441e4cefmr24039277plk.31.1671030136523; 
 Wed, 14 Dec 2022 07:02:16 -0800 (PST)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174]) by smtp.gmail.com with ESMTPSA id
 s6-20020a05620a29c600b006eeca296c00sm10180454qkp.104.2022.12.14.07.02.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 07:02:16 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id y135so21689176yby.12
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 07:02:16 -0800 (PST)
X-Received: by 2002:a25:9:0:b0:6f9:29ef:a5ee with SMTP id
 9-20020a250009000000b006f929efa5eemr38819937yba.380.1671030135781; 
 Wed, 14 Dec 2022 07:02:15 -0800 (PST)
MIME-Version: 1.0
References: <6398848e.170a0220.f8e8e.d44f@mx.google.com>
 <Y5itf0+yNIQa6fU4@sirena.org.uk>
 <CAMuHMdW4RNFspMheq1JGUkCm+s1oM90Q_4vPH1XX9ZRAxrmPdA@mail.gmail.com>
 <ea3d5e98-8901-1f9c-b27d-3c65e7969c41@collabora.com>
 <CAMuHMdVGK=WDXqtJ_NgBJf_g=wQJ0V+dQ_b0RztafpxoRW=v5Q@mail.gmail.com>
 <fea3d246-d1d5-450f-6e9e-1ab63a91a053@collabora.com>
 <Y5ngIwSr7PradhxE@sirena.org.uk>
In-Reply-To: <Y5ngIwSr7PradhxE@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Dec 2022 16:02:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXyFp=96NpoxRgSzFL=vndcweTGyXy9JCmjD=VZF-5O=g@mail.gmail.com>
Message-ID: <CAMuHMdXyFp=96NpoxRgSzFL=vndcweTGyXy9JCmjD=VZF-5O=g@mail.gmail.com>
Subject: Re: renesas/master bisection:
 igt-kms-rockchip.kms_vblank.pipe-A-wait-forked on rk3399-gru-kevin
To: Mark Brown <broonie@kernel.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 Brian Norris <briannorris@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernelci@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mark,

On Wed, Dec 14, 2022 at 3:39 PM Mark Brown <broonie@kernel.org> wrote:
> On Wed, Dec 14, 2022 at 03:16:33PM +0100, Guillaume Tucker wrote:
> > Mark, how did you get the list of recipients?
>
> > There's a command for this btw, which was used when the reports
> > were automatically sent to the recipients before we reverted to
> > manual filtering to reduce the noise:
>
> My standard thing is to look at who touched the commit, possibly also
> adding seemingly relevant maintainers depending on how good the list
> from the commit was (IIRC in this case the commit went entirely through
> ChromeOS people so I added relevant DRM submaintainers which turned out
> to be a surprisingly large number of people), and relevant lists.
>
> > As you can see, Geert is not listed there.
>
> I didn't send the report to Geert as far as I can see, I imagine he saw
> it as a result of it going to one of the lists and noticed the mention
> of Renesas as the tree, possibly he's got some filter set up to find
> things that mention it.  The recipient list I have is:
>
> | To: kernelci-results@groups.io, bot@kernelci.org, Brian Norris
> |         <briannorris@chromium.org>, Sean Paul <seanpaul@chromium.org>, Douglas
> |         Anderson <dianders@chromium.org>
> | Cc: gtucker@collabora.com, dri-devel@lists.freedesktop.org,
> |         linux-arm-kernel@lists.infradead.org, Andrzej Hajda
> |         <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
> |         Robert Foss <robert.foss@linaro.org>, Laurent Pinchart
> |         <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
> |         Jernej Skrabec <jernej.skrabec@gmail.com>
>
> which doesn't mention him at all.

Right. I noticed the email because my name was in the body (it's part
of the git repo name).
The "Re: renesas/master bisection" in the subject immediately triggered
my interest.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
