Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A58607A20
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 17:09:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F112D10E3BA;
	Fri, 21 Oct 2022 15:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A4710E3BA
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 15:09:31 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id m16so6987417edc.4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 08:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=E1t79Ir1ooVQXjUw4JlL4xRT2xhdG4RFYt/CAeAMdpQ=;
 b=St93DXqgP0zZHnIJbveQ9TzrvZTY+c6nimZS314QJguPEYlZCp6RwSmz/FIKQOMMlM
 gIiWsPe7ZRFSLa04YVZsDsNvvJaKBd8NL1C6/Fs6eCd8ESmYs+r3PH5KC8SdcxlJo3xz
 uGuVFvQkwOF8m9ZYTWKzLyLjOheypPI1G0Qvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E1t79Ir1ooVQXjUw4JlL4xRT2xhdG4RFYt/CAeAMdpQ=;
 b=hAkO9UTWjg0Ci+Cf8o8uR7RJ1Ri0I/jKCZ4jMjyHS0kfGO6QKJFTwVfyc8hee96Pls
 vnPoEppRiWFZ8MmcStvlgo2bIGvFoUabhobL4YyedgZdD2aq2UnJxtK1sQIqGgI5wQkw
 nSePjVHC8hgJEacViRDw+aZ1TMm3tp3ki6tfN58k9ARKWOipzu5EWJVu9Z3pdW+eOVYI
 gTn3WRSNLStH0GURgV0cM5mSyRKNdTzCWwW1vvxRoCLvVLs0QnqhVz0aTWGjvyV4Zkzi
 PNKjP4J49AtmTXYy5Tcua6hV2GiG8bZtlaDNSw4p6eP9HZgOUyOIQ5Y6cmKTTwGEyIVe
 op8w==
X-Gm-Message-State: ACrzQf1MyZyeiKQpZobkrUSVw+LpgPrMJ7nChFW8zwHdm140NS8Zdn8D
 nZ6TekjbY3vJ7lvVmeAzI9oF6MiknpYrm/gE
X-Google-Smtp-Source: AMsMyM6QR4ou9bYsp+cx7qnjpMChU7m14lTXbcJ49fV+Aei9pJXheV58hMDN6g372f88djD960VXWg==
X-Received: by 2002:a17:906:eecb:b0:73c:5c85:142b with SMTP id
 wu11-20020a170906eecb00b0073c5c85142bmr16003552ejb.433.1666364969794; 
 Fri, 21 Oct 2022 08:09:29 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com.
 [209.85.221.43]) by smtp.gmail.com with ESMTPSA id
 ku15-20020a170907788f00b0078b551d2fa3sm11826642ejc.103.2022.10.21.08.09.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 08:09:26 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id a14so2455202wru.5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 08:09:26 -0700 (PDT)
X-Received: by 2002:a05:6000:3c1:b0:236:5779:546d with SMTP id
 b1-20020a05600003c100b002365779546dmr1615303wrg.405.1666364965966; Fri, 21
 Oct 2022 08:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <20221017121813.1.I59700c745fbc31559a5d5c8e2a960279c751dbd5@changeid>
 <CAE-0n51Fdp6hGqWdBy1zgb0XwqQXPveG7tQahP4hjM_Jg9hkYw@mail.gmail.com>
 <CAD=FV=WvUtgH-_p+jHiOsRkOFdcH9ND_=pX8SyYGTne-MZj6Fw@mail.gmail.com>
In-Reply-To: <CAD=FV=WvUtgH-_p+jHiOsRkOFdcH9ND_=pX8SyYGTne-MZj6Fw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 21 Oct 2022 08:09:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UUGnjb0_c3fwND-E8T5obvQAwu4ws0Q2Mm_gk3=wbvyA@mail.gmail.com>
Message-ID: <CAD=FV=UUGnjb0_c3fwND-E8T5obvQAwu4ws0Q2Mm_gk3=wbvyA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ps8640: Add back the 50 ms mystery delay
 after HPD
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: Philip Chen <philipchen@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Rock Chiu <rock.chiu@paradetech.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Jason Yen <jason.yen@paradetech.corp-partner.google.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Oct 19, 2022 at 11:22 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, Oct 19, 2022 at 11:18 AM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Douglas Anderson (2022-10-17 12:18:51)
> > > Back in commit 826cff3f7ebb ("drm/bridge: parade-ps8640: Enable
> > > runtime power management") we removed a mysterious 50 ms delay because
> > > "Parade's support [couldn't] explain what the delay [was] for".
> > >
> > > While I'm always a fan of removing mysterious delays, I suspect that
> > > we need this mysterious delay to avoid some problems.
> > >
> > > Specifically, what I found recently is that on sc7180-trogdor-homestar
> > > sometimes the AUX backlight wasn't initializing properly. Some
> > > debugging showed that the drm_dp_dpcd_read() function that the AUX
> > > backlight driver was calling was returning bogus data about 1% of the
> > > time when I booted up. This confused
> > > drm_panel_dp_aux_backlight(). From continued debugging:
> > > - If I retried the read then the read worked just fine.
> > > - If I added a loop to perform the same read that
> > >   drm_panel_dp_aux_backlight() was doing 30 times at bootup I could
> > >   see that some percentage of the time the first read would give bogus
> > >   data but all 29 additional reads would always be fine.
> > > - If I added a large delay _after_ powering on the panel but before
> > >   powering on PS8640 I could still reproduce the problem.
> > > - If I added a delay after PS8640 powered on then I couldn't reproduce
> > >   the problem.
> > > - I couldn't reproduce the problem on a board with the same panel but
> > >   the ti-sn65dsi86 bridge chip.
> > >
> > > To me, the above indicated that there was a problem with PS8640 and
> > > not the panel.
> > >
> > > I don't really have any insight into what's going on in the MCU, but
> > > my best guess is that when the MCU itself sees the HPD go high that it
> > > does some AUX transfers itself and this is confusing things.
> > >
> > > Let's go back and add back in the mysterious 50 ms delay. We only want
> > > to do this the first time we see HPD go high after booting the MCU,
> > > not every time we double-check HPD.
> > >
> > > With this, the backlight initializes reliably on homestar.
> > >
> > > Fixes: 826cff3f7ebb ("drm/bridge: parade-ps8640: Enable runtime power management")
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> >
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>
> I'm not expecting any other reviews of this patch, though I'm happy to
> be proven wrong. As a heads up, I'll plan to land this on Friday
> (roughly 2 days from now) in "drm-misc-fixes" barring anything else.
> If anyone else plans to offer any opinions about this patch or just
> wants more time to review, please shout.

As promised, pushed to drm-misc-fixes:

cb8e30ddb7e3 drm/bridge: ps8640: Add back the 50 ms mystery delay after HPD
