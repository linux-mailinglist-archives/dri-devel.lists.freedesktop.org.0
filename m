Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDB36A591F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 13:34:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115E310E1F6;
	Tue, 28 Feb 2023 12:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEDAC10E1F6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 12:34:51 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-536cb25982eso266218127b3.13
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 04:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6Rv5DZKpY+1WCDSdTAJ/I4zTl24wpSxoAeFTDaVOJMs=;
 b=EIBy74QzUxJDr8BZCXWG7cX5cUo0beAd7Pvx/Po1NA2AJqx6gygtdaLEMB5YfoU5qL
 76T6MA45akh7ifCWk/GypNm0hFOhAZPPAkgVGnq+nl1ZnNsbsSQmvMazY8lLJErr2Cza
 Iei95b0LgaLhronsMmy6UHeKzr7jd4CaZGGmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6Rv5DZKpY+1WCDSdTAJ/I4zTl24wpSxoAeFTDaVOJMs=;
 b=C1UHEHzz8svgydYHifX84Vq17pBOmsEmWSJzvmeAx+To02VBRlIKzaJLjBceVOU5Nh
 yFZ3yiP6F3xmr9XgcgH7W6LKzL2GPmy8hwQ2oTBm6Glves8OZzcOJK6u61u2EN9xxYKY
 KME1KJM5Vn9qdSik/wULvfw2y8BIXjKRcdeCYHHtngTGuSaVxFcA+fQhio79bqTwBoQ0
 xe/Ju+jKp2W2Ngn8KPpoEeI9DAcBMKmsscRxxoZpaZPiGuPVdboYUy3KaDVt5VJwwN2J
 vFqRfBXMbIX1lgNKKpTYoUH3QjJxDrEecEc85xEVcPPDXiw7pWPXFF1WvY0n/uKT1a1Y
 VNQg==
X-Gm-Message-State: AO0yUKV/fgnOtBo64HcY2+5gvmS7cZXFcoEIEcLvXqT+mWXJo3igW3m+
 BE2Gu2lg2UHtVPZqEeUgFMfTW85CtM1FTlsy1WMRIPJ21EXzoJCqCWQ=
X-Google-Smtp-Source: AK7set8kKDssuoxSDcdwA7Nq6ZuI2ItzmitypzgoZHIkdYkwDXzIGqZK7rmS5x6yWrTmsXE/YqN0Bms5sQ4JRSEV+W0=
X-Received: by 2002:a5b:c88:0:b0:a86:eba7:c3ca with SMTP id
 i8-20020a5b0c88000000b00a86eba7c3camr986620ybq.1.1677587690934; Tue, 28 Feb
 2023 04:34:50 -0800 (PST)
MIME-Version: 1.0
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
 <20230227113925.875425-5-jagan@amarulasolutions.com>
 <3c2f91d3-0406-7730-d4e4-c94868f23c91@denx.de>
 <CAMty3ZA6_pKiOK6gWq4iQFtKsoxfUgnSFBqkgDBzEp1DcBEt3A@mail.gmail.com>
 <7b59aaf9-1f72-fd9f-29ac-1857ec3f91f3@denx.de>
 <CAMty3ZC6vqpFfdh2F=KUsAgm_KCksVXBV9ON1csjJd1m+gJpVQ@mail.gmail.com>
 <6066dff9-5a66-0da5-14d9-66162a2fbb39@denx.de>
 <CAMty3ZDjwD+3SKJiOgZLbYYTtq=udWkXbqnsyYaM73rsYxDumQ@mail.gmail.com>
 <47b8ad7d-cfc1-112c-2117-cb3612c1bba5@denx.de>
 <20230228121046.jfq6dqyuphfmqemi@houat>
In-Reply-To: <20230228121046.jfq6dqyuphfmqemi@houat>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 28 Feb 2023 18:04:39 +0530
Message-ID: <CAMty3ZAYAsShnBPRirLCb+S-Ysg5TaNP9OC3xszNWwtJH5VREg@mail.gmail.com>
Subject: Re: [PATCH v13 04/18] drm: exynos: dsi: Switch to DSI panel or bridge
 find helper
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Matteo Lisi <matteo.lisi@engicam.com>, dri-devel@lists.freedesktop.org,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, NXP Linux Team <linux-imx@nxp.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 28, 2023 at 5:40 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Mon, Feb 27, 2023 at 08:41:22PM +0100, Marek Vasut wrote:
> > > If we go ahead with no need for DRM-managed helper at the moment, then
> > > find the panel hook in host.attach and then drop 2/18.
> >
> > The panel lookup must happen in .bind/.probe for exynos/imx respectively ,
> > that's really all that is required here. Then you can drop 1,2,3/18 and get
> > this series applied (I hope) .
> >
> > Can you implement just this one change ?
> >
> > There is no need to use drmm_* helper for now, that can be improved later if
> > possible.
>
> Yeah... The drmm helper isn't needed per se, but not using it will
> create a use-after-free pattern that is very easy to miss.
>
> I'd really prefer not to add a new helper that favors an unsafe pattern,
> but the driver seems to have a whole bunch of them anyway so it's not
> really a big deal.
>
> Which also raises another question: if it's code that is only really
> relevant in the context of that driver, why are you creating a helper
> for it in the first place?

I can answer this question as I did add these helpers.

1. DSI-specific helper added since it is a good candidate for
common/helper code, based on the comments in V9 by Marek. V
https://patchwork.kernel.org/project/dri-devel/patch/20221209152343.180139-8-jagan@amarulasolutions.com/

So, I have added this to the common drm_of code in V10.
https://patchwork.kernel.org/project/dri-devel/patch/20221214125907.376148-2-jagan@amarulasolutions.com/

2. DRM-managed discussion was commented on in V11 by you, so from
where all discussion moved.
https://patchwork.kernel.org/project/dri-devel/patch/20230123151212.269082-3-jagan@amarulasolutions.com/

1) helper wouldn't be an unsafe helper as it can reuse many DSI
drivers but 2) helper might be an unsafe helper at the moment.

Jagan.
