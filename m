Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAEF90BFE2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 01:46:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD1CF10E1F2;
	Mon, 17 Jun 2024 23:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="UMGSZnKo";
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="GYoxpcwk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gw2.atmark-techno.com (gw2.atmark-techno.com [35.74.137.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464E210E1F2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 23:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
 s=gw2_bookworm; t=1718667955;
 bh=u4SQ7Kn/9QOe7Lbom+t4xd7zdIO/xFKu407b+d9kyI8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=UMGSZnKoHG/Zc5ZwN/31s+HC2UNbvGpWfiYFdipO8awZ2khP7PL3nhoVanjKcpb8p
 /BZ/XECVxinNAomK5yRR/BTta1xXFaeu6wnjAC29KTuStkhiMiQ7LpIe0WfC/dStyq
 Fz6GztirNj+/L0ybiIid50cK2q9jXgz+Abby+H+r4KvfEZm30ClmzXE6WW7sVrjkxw
 Viebas+vvynhWTKRVaTc8IBUyrmGQyq2pBQEY3sKVZIwpt56PIXxSQNtN/mVHS1p9J
 bC8Nt/8dUKdYb10ir0+XxSws5QDY7MLzZBCdan+rMNdRJBG8XWzlKuXd5UKRFYZeni
 DkHWVoRwDOVBA==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
 by gw2.atmark-techno.com (Postfix) with ESMTP id AAE3199F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 08:45:55 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com; dkim=pass (2048-bit key;
 unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com
 header.a=rsa-sha256 header.s=google header.b=GYoxpcwk; 
 dkim-atps=neutral
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69])
 by gw2.atmark-techno.com (Postfix) with ESMTPS id 52CC8A55
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 08:45:53 +0900 (JST)
Received: by mail-ot1-f69.google.com with SMTP id
 46e09a7af769-6f96e58ad4aso6132454a34.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 16:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atmark-techno.com; s=google; t=1718667952; x=1719272752;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WEcb4ceq4vj6F4Lm3zQBzfoD3bnUJEBNMCgzOVt1Zv0=;
 b=GYoxpcwkxWh5TXKz0eokqVmaiAqlGoTquiWrZdpkPV7Q3ePDf99tWXjcbNeVc0yhw6
 Zo04xtPF5SF2yrqE45XKKkbn4VQPq/B++BlnVXiskEYwzrFrt6QjA6P8lXQLX1VmS9W5
 Chnf65U761XKBwSXMy2+wbIt01FG9DbH1jA9TTJKxkvMNrB4TZU/J9xWTmPKCGS/U/Od
 +jqdE1pedkcMc5/MIiLOPiTQ93BE0kK7iXIcsu/opV864QM6lRT+VxmzQYV4OyXgxCN7
 l10c/1Gt+I10z5pNfktBBz/806+uF7G4BhUWsonaCQATFzoc6wLi5OC5ASr09UYbBVyM
 6iEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718667952; x=1719272752;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WEcb4ceq4vj6F4Lm3zQBzfoD3bnUJEBNMCgzOVt1Zv0=;
 b=IoHaReM+Zs1NvvB0alTfF7iSmGSqxVYU6TqjksIqSk8dF/6ImBbMFfolAlW0+igl5J
 +TAaY2x8MU5arEdbnlPOBvky3J+GF5z+1mJOQTW7pegMrPji62vqfQrNRZFRTe+3nd1m
 uGzF8b1VpolStMVfkohMQyDziVtdY4nuJx2M4k5gy2TXo2w+um++bdrextD+QOpr7RBp
 3dAN9vv9y6UcR49RU1KorggA7nc4dImhuGxMbGvVgqoMwV7OaV4aj2oks1phGJQw9oZs
 /FIhvXKtgTB8ALGpXXpd0ykCaUmwpPwkW6y3jPp3RGZm9TulAfx1WTys+ZLqEl5sw3sK
 j49g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZcSds0EgOPpVdrgWUJyikr2EzbliOKoFJ7Z9B722kQBizKo0yNNRoAAj4Yx+Jx0KktPBSIYp/seWF7DKlZluqwRTyFjLUq6hyAqKqO1Yb
X-Gm-Message-State: AOJu0YyzGBBD0MoyXm6VjpNrCtdsO1j8mmkpZDiZpqOgVqlGTLgY82xV
 tVr3UMtFvhTK6MlHHDGHWRqTcoxjPWmEBYMVTDdlg4mAyfE6CKwquoISdQ+o5ku2al35qlHgWJm
 GVbo+TGEARI8eCQOq4hMUqF1X+zNz4S1yi87y0r5gDLRv1izHMyInbXYaHdh+CRWEsyY=
X-Received: by 2002:a05:6870:1c6:b0:24c:a547:7b5a with SMTP id
 586e51a60fabf-258428b6ce7mr13781154fac.14.1718667951749; 
 Mon, 17 Jun 2024 16:45:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRFeiOGQPSIT5KptgcYboMcw31OfX8XCos9btgN4pxjCsjHfG6eKkB1gU/XzVNeRv8POSMRg==
X-Received: by 2002:a05:6870:1c6:b0:24c:a547:7b5a with SMTP id
 586e51a60fabf-258428b6ce7mr13781138fac.14.1718667951311; 
 Mon, 17 Jun 2024 16:45:51 -0700 (PDT)
Received: from pc-0182.atmarktech (103.131.189.35.bc.googleusercontent.com.
 [35.189.131.103]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705cc91dc67sm7938979b3a.2.2024.06.17.16.45.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2024 16:45:50 -0700 (PDT)
Received: from martinet by pc-0182.atmarktech with local (Exim 4.96)
 (envelope-from <martinet@pc-zest>) id 1sJM2m-00ABEf-2m;
 Tue, 18 Jun 2024 08:45:48 +0900
Date: Tue, 18 Jun 2024 08:45:38 +0900
From: Dominique MARTINET <dominique.martinet@atmark-techno.com>
To: Adam Ford <aford173@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, marex@denx.de,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Makoto Sato <makoto.sato@atmark-techno.com>
Subject: Re: drm/bridge/imx8mp-hdmi-tx: Allow inexact pixel clock frequencies
 (Was: [PATCH V8 10/12] drm/bridge: imx: add bridge wrapper driver for
 i.MX8MP DWC HDMI)
Message-ID: <ZnDKovBokBu5D_eb@atmark-techno.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <22a3f5266260dd3915269ae3eec7724f7537eb55.camel@pengutronix.de>
 <CAHCN7xJt+1WGFYeBii1jUDEg9OU176f0AA+rMkXCqNQrfq=XWg@mail.gmail.com>
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

Thanks for the replies, replying to both mails at once.

Adam Ford wrote on Mon, Jun 17, 2024 at 08:28:58AM -0500:
> > Commit 6ad082bee902 ("phy: freescale: add Samsung HDMI PHY") already
> > "fixed" the samsung hdmi phy driver to return the next frequency if an
> > exact match hasn't been found (NXP tree's match frequencies exactly, but
> > this gets the first clock with pixclk <= rate), so if this check is also
> > relaxed our displays would work out of the box.
> 
> Are you proposing to replace 'return MODE_CLOCK_RANGE' with a printed warning?

Yes, something like that.

The imx93-mipi-dsi.c code has a check that's a bit more complex that
might be closer to what we want if you think the check is useful:
        if ((bridge->ops & DRM_BRIDGE_OP_DETECT) &&
            (bridge->ops & DRM_BRIDGE_OP_EDID)) {
                unsigned long pixel_clock_rate = mode->clock * 1000;
                unsigned long rounded_rate;

                /* Allow +/-0.5% pixel clock rate deviation */
                rounded_rate = clk_round_rate(dsi->clk_pixel, pixel_clock_rate);
                if (rounded_rate < pixel_clock_rate * 995 / 1000 ||
                    rounded_rate > pixel_clock_rate * 1005 / 1000) {
                        dev_dbg(dsi->dev, "failed to round clock for mode " DRM_MODE_FMT "\n",
                                DRM_MODE_ARG(mode));
                        return MODE_NOCLOCK;
                }
        }

However, for my particular case 0.5% wouldn't be enough to get something
to display unfortunately :/

> > In practice the screen I'm looking at has an EDID which only supports
> > 51.2MHz and the closest frequency supported by the Samsung HDMI phy is
> > 50.4MHz, so that's a ~1.5% difference and it'd be great if it could work
> > out of the box.
> 
> I wonder if the HDMI PHY could be improved to better dynamically
> calculate values instead of the look tables.

That would probably be ideal, right... If we could do that we could
likely compute something within 0.5% of the required freq.

The original code from NXP was full of what seemed at the time magic
values, but with the new code it seems quite a bit clearer...
At least the values that are left seem to somewhat make sense:
https://gaia.codewreck.org/local/linux/hdmi/plot-combined.svg
https://gaia.codewreck.org/local/linux/hdmi/plot-1.svg
 -> dented linear values, per the intervals defined in
 fsl_samsung_hdmi_phy_configure_pixclk()
https://gaia.codewreck.org/local/linux/hdmi/plot-2.svg
 -> constant for each intervals?
https://gaia.codewreck.org/local/linux/hdmi/plot-3.svg
https://gaia.codewreck.org/local/linux/hdmi/plot-4.svg
 these don't really make sense to me...
https://gaia.codewreck.org/local/linux/hdmi/plot-5.svg
 that one 0 value at 154000000 looks odd,
 but that aside we could probably get away with constant 0x80
 if the value matters at all...
https://gaia.codewreck.org/local/linux/hdmi/plot-6.svg
 weird as well

I'm thinking the last few values just affect a very small % of the
values, but would need to check with a proper scope if I can get a hold
of the clock line...
Does any of you happen to have any datasheet for these registers,
or should we consider them to be magic values?

Lucas Stach wrote on Mon, Jun 17, 2024 at 06:32:45PM +0200:
> > Do you know why such a check is here?
> 
> Sending a HDMI signal with a different rate than what the display
> expects rarely ends well, so this check avoids that.
>
> However, this check is a bit overcautious in that it only allows exact
> rate matches. IIRC HDMI allows a rate mismatch of +- 0.5%, so this
> check could be relaxed quite a bit to allow for that.

I'd expect displays to be tolerant to quite a few percents, but I didn't
know the spec defined something like that... iirc the HDMI spec isn't
public?

> > In practice the screen I'm looking at has an EDID which only supports
> > 51.2MHz and the closest frequency supported by the Samsung HDMI phy is
> > 50.4MHz, so that's a ~1.5% difference and it'd be great if it could work
> > out of the box.
> 
> For rate mismatches larger than the 0.5% allowed by the HDMI spec it
> would be better to actually add PHY PLL parameters matching those
> rates.
> 
> We could potentially add some more leeway for displays like yours that
> aren't actually HDMI (as it doesn't seem to have a standard HDMI
> resolution). But that's more of a last resort option, as it may
> introduce other problems for displays that aren't as tolerant with
> their input rates. Remember the mode_valid call is used to filter modes
> that aren't compatible with the source, so for a display with multiple
> modes allowing too much leeway may lead to incompatible modes not
> getting tossed, in turn allowing userspace to set a mode that the
> display may not like due to too much rate deviation, instead of only
> presenting a list of valid modes. This again would present the user
> with a black-screen without warning situation.

Ah, that's a very good point, if other modes are valid then we don't
want to present modes that are less likely to work, we should only allow
bigger variations if no other mode worked...
I don't think we have this info at validation time though?

I think that Adam's suggestion of making this more dynamic would be
great, if we can just generate finer frequencies for a reasonable range
then it wouldn't be a problem to limit the check to 0.5%.

Short of something really dynamic I can add a value for our particular
display based on what I've seen above (just pick a couple of points
along the lines for the two values I understood and whatever value
neighbors have for the rest & check with a scope it's somewhat close),
but I honestly would rather not get too far down this hole, we can't
cover all the quirky hardwares that exist manually...


Cheers,
-- 
Dominique


