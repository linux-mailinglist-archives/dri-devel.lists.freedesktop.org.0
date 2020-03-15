Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C253D185E77
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 17:25:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D7A489819;
	Sun, 15 Mar 2020 16:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F75889819
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 16:25:05 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id d23so15818584ljg.13
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 09:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bhIY9OOZnxZOPAI5wEukr5F3CCpgPoGyTg20FwGK9Tw=;
 b=p3BYWIc86jjcI6oonq+LpWal5UzLF4chdphbUkZtArCrHw3fHc0r6fLgOPpwW0F8hR
 gP4Wfu+rzzPF0TiSEeQmNwk7YZek2PC/56HeWXaU9kxZFmJvQJWL48w/6bXJGpQpscx5
 mQX9XtRjy9J6ILCe4VTqiwLdoLeZcGSF3Iysfgputl8Zcpgi6nfthRWP8WGtplaOHCLV
 CNMRfxnmU/gE4fUM38FDIXmAIE3eXmYiOp66YfTTZUEbCG7yNMmznET0H3BKDguuKLBT
 R/j398gdVF4udQkU44i1ljFDNFJWmHisvPXTUXOtNS5ggRoJNJLfpoNBC6m0Wd1NyfIy
 bWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bhIY9OOZnxZOPAI5wEukr5F3CCpgPoGyTg20FwGK9Tw=;
 b=q2mDDIa5QaRs86FtUjtN2nDrv4jtg86y5cuFNk6Xelxgpzyh6EBlqToHF7C+eeKXvt
 afbnEgG52HMRqPcnLvSxQgmU1MLKnZTg3ire+Y2o8h7iAIP+B2KgiqsD4gBcZIMzM7tt
 Epqb/aDCogUk4Mi/d6aKRlsc0v2v5a88bBrkvOzhI3a3jwqqc3SelbfDocrBWwWMGolg
 Zb0Nv78BtZYJ8OKiG7r2VmjlTnZ8lXY3sJWP+22f4vLsy6dV2tHUZo6ns4kK1trT8snv
 oJEeIykKTkG1aXUH8p+N6UlEY4gvOhQBFttnmttpQ2+6V6yfRUcnMJvjWA9DkbLI18nh
 Hnjw==
X-Gm-Message-State: ANhLgQ1JW1TwNsVzLDQyElS29vtPkxLUQ5AD6CmU1Cho1RBgqrIPWTbl
 Y8ZTxzxmDKMyL9gBEf8ZtGCzyONsbJkdqqIFZGAlQg==
X-Google-Smtp-Source: ADFU+vvfAn91cdIuck/jsg/zit0I3le1KpoewT5X+4/992npdZo2Qy9O+m/M8W1xq/3HAyQmj+l2pjjAwAxIq9vsk0M=
X-Received: by 2002:a2e:9a96:: with SMTP id p22mr12246494lji.258.1584289503947; 
 Sun, 15 Mar 2020 09:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200315134416.16527-1-sam@ravnborg.org>
 <20200315134416.16527-3-sam@ravnborg.org>
In-Reply-To: <20200315134416.16527-3-sam@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 15 Mar 2020 17:24:52 +0100
Message-ID: <CACRpkdZszEA+-KVrgALx3NdtVi86ExnEHB3p0EwxMeCCvHxD5A@mail.gmail.com>
Subject: Re: [PATCH v1 02/36] dt-bindings: spi: support non-spi bindings as
 SPI slaves
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Nikolaus Schaller <hns@goldelico.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Sandeep Panda <spanda@codeaurora.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Paul Cercueil <paul@crapouillou.net>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Zhong <zyw@rock-chips.com>, Marco Franchi <marco.franchi@nxp.com>,
 Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, Tony Lindgren <tony@atomide.com>,
 Nickey Yang <nickey.yang@rock-chips.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Vinay Simha BN <simhavcs@gmail.com>, Marek Belisko <marek@goldelico.com>,
 Heiko Schocher <hs@denx.de>, Guido Gunther <agx@sigxcpu.org>,
 Brian Masney <masneyb@onstation.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Purism Kernel Team <kernel@puri.sm>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Lin Huang <hl@rock-chips.com>, Douglas Anderson <dianders@chromium.org>,
 linux-spi <linux-spi@vger.kernel.org>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 15, 2020 at 2:44 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> Independent bindings can be SPI slaves which for example is
> the case for several panel bindings.
>
> Move SPI slave properties to spi-slave.yaml so the independent
> SPI slave bindings can include spi-slave.yaml rather than
> duplicating the properties.

To me it seems like you are creating the common SPI slave
bindings? Maybe the commit message should be about that.

> +  reg:
> +    minimum: 0
> +    maximum: 256

255? Or am I wrong?

Apart from that it looks good to me.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
