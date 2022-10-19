Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59419604F97
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 20:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E817710F29C;
	Wed, 19 Oct 2022 18:28:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590CB10E5E4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 18:28:38 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id a26so41626339ejc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 11:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PXuk6gd0GXNAFejWrIRQ8xF5Y0pe8OGG5T6m5TWLME0=;
 b=Bkk2lQkeEKnnk9M34tqIFo43P8iACO9rIBHG4ONJ1kdDTC7bbmF0EF95lNM7A8piwB
 ysdneGiA449i+JcW63RSC/aZGryOs0G7aWVEQlKnP2YfnREc4R79dDOmtXs26mrb0d+b
 lp+XG3sbC8dHCfYJ0kHVFKqcFKEPmegDl3jC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PXuk6gd0GXNAFejWrIRQ8xF5Y0pe8OGG5T6m5TWLME0=;
 b=51GYg5aS96481rpmtv0vansUVK0oS9eFopj3GKux1mR95U9tIhufj8cLb6tk+OiCV3
 1sNf8xhhsjiDsM5ehx0Js0IMkQlmKXITN3oGhafPavmwZvhYmre5D92vAYBYSXaHem5s
 5pHrVTFfyph73Emoq004JfeE+OWOoUxHBw0OC5HkmKrIsf1GMc5VL5md5YYCCWhXvLgK
 gKV6qdcuNBQw9XZBGd5qA3aO6p40d5X2nRJahFLLgBlByGrj7FqrEJpERRGuXxAxmB+F
 zTbk3pGUZPmw7ZM3FkjtJBYXwZZAjLU/phJOTL2IQwhMMN5M1mOitZRWlqLcypanNy4o
 jNKA==
X-Gm-Message-State: ACrzQf2qekXFzuM4TvomO2uJ1GJoZsOtpCW+GDFudS8utDOKTzuo0tKj
 4+ezGzXO60R93wobdEsfUQCFUIKf+Q7PR8C2gU4=
X-Google-Smtp-Source: AMsMyM5Jhxi3/wAfr5ahFpHhwllSqOPvbpb+vQa5Csjk4sVM8xJJ0nMlv48xHqr0+48V8nY+qjBZ+A==
X-Received: by 2002:a17:907:9717:b0:78d:9fb4:16dd with SMTP id
 jg23-20020a170907971700b0078d9fb416ddmr8206175ejc.720.1666204116322; 
 Wed, 19 Oct 2022 11:28:36 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com.
 [209.85.218.48]) by smtp.gmail.com with ESMTPSA id
 la5-20020a170907780500b0077f20a722dfsm9320229ejc.165.2022.10.19.11.28.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 11:28:34 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id bj12so41938158ejb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 11:28:34 -0700 (PDT)
X-Received: by 2002:a5d:6488:0:b0:22b:3b0b:5e72 with SMTP id
 o8-20020a5d6488000000b0022b3b0b5e72mr6228612wri.138.1666203770860; Wed, 19
 Oct 2022 11:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20221017121813.1.I59700c745fbc31559a5d5c8e2a960279c751dbd5@changeid>
 <CAE-0n51Fdp6hGqWdBy1zgb0XwqQXPveG7tQahP4hjM_Jg9hkYw@mail.gmail.com>
In-Reply-To: <CAE-0n51Fdp6hGqWdBy1zgb0XwqQXPveG7tQahP4hjM_Jg9hkYw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 Oct 2022 11:22:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WvUtgH-_p+jHiOsRkOFdcH9ND_=pX8SyYGTne-MZj6Fw@mail.gmail.com>
Message-ID: <CAD=FV=WvUtgH-_p+jHiOsRkOFdcH9ND_=pX8SyYGTne-MZj6Fw@mail.gmail.com>
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

On Wed, Oct 19, 2022 at 11:18 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2022-10-17 12:18:51)
> > Back in commit 826cff3f7ebb ("drm/bridge: parade-ps8640: Enable
> > runtime power management") we removed a mysterious 50 ms delay because
> > "Parade's support [couldn't] explain what the delay [was] for".
> >
> > While I'm always a fan of removing mysterious delays, I suspect that
> > we need this mysterious delay to avoid some problems.
> >
> > Specifically, what I found recently is that on sc7180-trogdor-homestar
> > sometimes the AUX backlight wasn't initializing properly. Some
> > debugging showed that the drm_dp_dpcd_read() function that the AUX
> > backlight driver was calling was returning bogus data about 1% of the
> > time when I booted up. This confused
> > drm_panel_dp_aux_backlight(). From continued debugging:
> > - If I retried the read then the read worked just fine.
> > - If I added a loop to perform the same read that
> >   drm_panel_dp_aux_backlight() was doing 30 times at bootup I could
> >   see that some percentage of the time the first read would give bogus
> >   data but all 29 additional reads would always be fine.
> > - If I added a large delay _after_ powering on the panel but before
> >   powering on PS8640 I could still reproduce the problem.
> > - If I added a delay after PS8640 powered on then I couldn't reproduce
> >   the problem.
> > - I couldn't reproduce the problem on a board with the same panel but
> >   the ti-sn65dsi86 bridge chip.
> >
> > To me, the above indicated that there was a problem with PS8640 and
> > not the panel.
> >
> > I don't really have any insight into what's going on in the MCU, but
> > my best guess is that when the MCU itself sees the HPD go high that it
> > does some AUX transfers itself and this is confusing things.
> >
> > Let's go back and add back in the mysterious 50 ms delay. We only want
> > to do this the first time we see HPD go high after booting the MCU,
> > not every time we double-check HPD.
> >
> > With this, the backlight initializes reliably on homestar.
> >
> > Fixes: 826cff3f7ebb ("drm/bridge: parade-ps8640: Enable runtime power management")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

I'm not expecting any other reviews of this patch, though I'm happy to
be proven wrong. As a heads up, I'll plan to land this on Friday
(roughly 2 days from now) in "drm-misc-fixes" barring anything else.
If anyone else plans to offer any opinions about this patch or just
wants more time to review, please shout.

-Doug
