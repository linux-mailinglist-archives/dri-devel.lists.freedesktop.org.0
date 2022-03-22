Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A629A4E399D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 08:33:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE19510E0FD;
	Tue, 22 Mar 2022 07:33:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A297810E0FD
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 07:33:29 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id u16so22641840wru.4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 00:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KeL0XwdZoDHk0HJY6UD4i5wOSw01lP9KaIX9E/wmf14=;
 b=Ghj1Jwr7ot5jaMNP4tgZiZFZL7OwaoIaxLvWPfbUSU3LVjjJMwkPb4phdWEskVIQYa
 1NhjsthU4Uibt9mwHfI3JumhT0MwIwUrgRiuxbwi+zspq5hEShpCEKmyxQHKUKm/ApqS
 KzcCAYNQBh5mnxsooaC4By2KqQg53TdhPFAzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KeL0XwdZoDHk0HJY6UD4i5wOSw01lP9KaIX9E/wmf14=;
 b=rrGbM8UZW1EKkB64+utlX/2KYnH+nsqPOFsgAEHnUWhxbN4eNYrnXJFQYyZQp+NpBN
 YCha28NiEk59zK/ij+IaQ7wxsafWaVFK2++NAYF+u9KPMZmZLSodthYGDi3yPgKd03HV
 SmR/kwIZTi4fOvrXnxkVwqb1BzjfjIJ2JRC8YbYVyfr88oEzm9Hs7xlkZZ0NHNOcptoV
 OyxGb/bNha0Aa1GyBo2Ld+/dfH0L7iuTwj/RSK599bdheME9chHiOVGqqdC6sOX6lguq
 D0Oa5Gut8jvwXaIIJpYE85dsA9ksCbH8gxOz8I4gwY/ZvVS4KC9EINBco3q77OVj6hhG
 +/hg==
X-Gm-Message-State: AOAM530inEyKjSw0e3iY+GmuJ5p38h5T9hP1sp4RuKijhyKJnLF6E5jp
 CZXBl9rxGnrB+R4FaNC20YWDNmqjmUUqMOEIYVaSV+tf3bTk3g==
X-Google-Smtp-Source: ABdhPJy9dN6URJJcdfux8bA4y/yRtsPYh8+Hjvg2L2uTjRxceqsjwuE40RumFic8CrYPwgdIMr2McDKJyEOsXADZvJA=
X-Received: by 2002:adf:d1e3:0:b0:204:7e76:8a70 with SMTP id
 g3-20020adfd1e3000000b002047e768a70mr1860283wrd.580.1647934408221; Tue, 22
 Mar 2022 00:33:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220302120925.4153592-1-xji@analogixsemi.com>
 <CAEXTbpeUTdfA31gpiJAzvyCScjWLUqCxjpF6-YCFCe5JmiyDZw@mail.gmail.com>
In-Reply-To: <CAEXTbpeUTdfA31gpiJAzvyCScjWLUqCxjpF6-YCFCe5JmiyDZw@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Tue, 22 Mar 2022 15:33:17 +0800
Message-ID: <CAEXTbpf2V9CD=rs_KkVkD58rhtbiicFNjdphbuS0PU_5P=x0ZA@mail.gmail.com>
Subject: Re: drm/bridge: anx7625: Set downstream sink into normal status
To: Xin Ji <xji@analogixsemi.com>
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
Cc: dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 qwen@analogixsemi.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, hsinyi@chromium.org,
 bliang@analogixsemi.com, treapking@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Xin,

Can we use dev_dbg instead of dev_info for the logging?

The log here is more like a debugging message, and using dev_dbg makes
it consistent with anx7625_dp_stop.

Sorry for not catching this earlier.

Best regards,
Pin-yen

On Thu, Mar 3, 2022 at 3:52 PM Pin-yen Lin <treapking@chromium.org> wrote:
>
> Reviewed-by: Pin-Yen Lin <treapking@chromium.org>
>
>
> On Wed, Mar 2, 2022 at 8:09 PM Xin Ji <xji@analogixsemi.com> wrote:
> >
> > As downstream sink was set into standby mode while bridge disabled,
> > this patch used for setting downstream sink into normal status
> > while enable bridge.
> >
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index 9aab879a8851..963eaf73ecab 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -919,12 +919,20 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
> >  {
> >         int ret;
> >         struct device *dev = &ctx->client->dev;
> > +       u8 data;
> >
> >         if (!ctx->display_timing_valid) {
> >                 DRM_DEV_ERROR(dev, "mipi not set display timing yet.\n");
> >                 return;
> >         }
> >
> > +       dev_info(dev, "set downstream sink into normal\n");
> > +       /* Downstream sink enter into normal mode */
> > +       data = 1;
> > +       ret = anx7625_aux_trans(ctx, DP_AUX_NATIVE_WRITE, 0x000600, 1, &data);
> > +       if (ret < 0)
> > +               dev_err(dev, "IO error : set sink into normal mode fail\n");
> > +
> >         /* Disable HDCP */
> >         anx7625_write_and(ctx, ctx->i2c.rx_p1_client, 0xee, 0x9f);
> >
