Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FEC3B403C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 11:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 549F36E0E4;
	Fri, 25 Jun 2021 09:21:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9038F6E0E4
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 09:21:38 +0000 (UTC)
Received: from mail-ed1-f72.google.com ([209.85.208.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lwi1o-0002eo-Gj
 for dri-devel@lists.freedesktop.org; Fri, 25 Jun 2021 09:21:36 +0000
Received: by mail-ed1-f72.google.com with SMTP id
 j15-20020a05640211cfb0290394f9de5750so4265259edw.16
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 02:21:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QsPyFBqPfdmelbWnXguclm9JevGGaBII5W3HvpNQ+C8=;
 b=nfiSUI89HgEZJrHR/j4JcbQUQp5WUeuxaN/i0ZrhkzL3YGzg9k3z7GC2xVLZEEXeGk
 W2HTH0ui67UYP0SiINttu0/DEJelEuhZlbR5OIo+W46lSvGfIcEwt3b0AFZ/Q9fkpCDz
 rgHz0yEafsigWpmx4TNJtSD3qQFCBmTLpY0ksP6MluCUuSG+E97o5fyo2mjRpIlvVRdO
 u0xtihAzyigQ9TWTj5BDyLpSwxxoMtiSKZU77bY6xH+ZqZ86lXHGl3cYHoARb/9YMBU5
 haHSLBczWWUa1zfLFPhd408seEo5eZ6iq80zRuFRKU5mP1FaoKu4QPfIBMErGeTWms0Q
 nJhA==
X-Gm-Message-State: AOAM533nfJMafEo5B0E3mnNqSHyxXAxZoXkquYSw9LDQ2RXpyxuvIn8J
 ATz49A0y2JTcScOQh1gtFcGAhkQx3w98pu5k5b0iUf3MJKY8lYM75Hz7n6SfMidJXG6ilFV21bd
 1tXXwHmmXNQfd4bXgP7gH17qI9K6erQWwI9niVnHEiht0uQ==
X-Received: by 2002:aa7:d34f:: with SMTP id m15mr12772183edr.311.1624612896127; 
 Fri, 25 Jun 2021 02:21:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+TM38F4Yr0eNdERAI2zb41U3+ytlASbW0YpW0+yf9XGf8E0tFDX/OQzorcP9sXyGgE3SWQg==
X-Received: by 2002:aa7:d34f:: with SMTP id m15mr12772163edr.311.1624612895982; 
 Fri, 25 Jun 2021 02:21:35 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id hz14sm2415400ejc.107.2021.06.25.02.21.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 02:21:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [RFC PATCH 2/9] drm: bridge: Add Samsung SEC MIPI DSIM bridge
 driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20210621072424.111733-1-jagan@amarulasolutions.com>
 <20210621072424.111733-3-jagan@amarulasolutions.com>
 <YNO0LHNVSWjrh1ZS@pendragon.ideasonboard.com>
 <CAOMZO5Ahbu4mohtMDOQOv_y5B_TDesbdYEUZTF1RL7_y-bS+RA@mail.gmail.com>
 <CAMty3ZAtObU-bf6FuxvSBaZn2cotj_NxASW9g9on-kBJ7iW3OA@mail.gmail.com>
 <YNR37NWkxq0mZyq5@pendragon.ideasonboard.com>
Message-ID: <fdd446c6-c8ce-9dae-f7ac-e06241f76250@canonical.com>
Date: Fri, 25 Jun 2021 11:21:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YNR37NWkxq0mZyq5@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Francis Laniel <francis.laniel@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Robert Foss <robert.foss@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Milco Pratesi <milco.pratesi@engicam.com>,
 Anthony Brandon <anthony@amarulasolutions.com>, linux-phy@lists.infradead.org,
 Shawn Guo <shawnguo@kernel.org>, Fancy Fang <chen.fang@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Jun 2021 at 14:19, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Jagan,
>
> On Thu, Jun 24, 2021 at 05:42:43PM +0530, Jagan Teki wrote:
> > On Thu, Jun 24, 2021 at 8:18 AM Fabio Estevam wrote:
> > > On Wed, Jun 23, 2021 at 7:23 PM Laurent Pinchart wrote:
> > >
> > > > Looking at the register set, it seems to match the Exynos 5433,
> > > > supported by drivers/gpu/drm/exynos/exynos_drm_dsi.c. Can we leverage
> > > > that driver instead of adding a new one for the same IP core ?
> > >
> > > Yes. there was an attempt from Michael in this direction:
> > > https://patchwork.kernel.org/project/dri-devel/cover/20200911135413.3654800-1-m.tretter@pengutronix.de/
> >
> > Thanks for the reference, I will check it out and see I can send any
> > updated versions wrt my i.MX8MM platform.
>
> Thanks.
>
> I had a brief look at the exynos driver, and I think it should be turned
> into a DRM bridge as part of this rework to be used with the i.MX8MM.
>
> Is there someone from Samsung who could assist, at least to test the
> changes ?

Yes, I mentioned few guys in reply to PHY. Around the DRM drivers you
can get in touch with:
Inki Dae <inki.dae@samsung.com>
Seung-Woo Kim <sw0312.kim@samsung.com>
Marek Szyprowski <m.szyprowski@samsung.com>
Andrzej Hajda <a.hajda@samsung.com>

The easiest testing of the display stack would be on Hardkernel's Odroid
XU4 (https://www.hardkernel.com/shop/odroid-xu4-special-price/) however
you will not test the DSI/DSIM directly (it has only HDMI port).

Best regards,
Krzysztof
Best regards,
Krzysztof
