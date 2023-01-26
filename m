Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D4667CFED
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 16:19:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023D010E154;
	Thu, 26 Jan 2023 15:19:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BA510E936
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 15:19:00 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-506609635cbso27284217b3.4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 07:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=H2iIBsu00H9gmCgE1ndDAGrufitOVygCG62ixZ4OeCs=;
 b=QXMR9D/0V2HDiY7QdY2pjQGdWi4SnYxOySqkpwIbYSejiEGfN0URhm/TA9YTpf8Rke
 0FxG8DHmyWv9c+aa6/uB5rX8uEI2JkmUmV9L0lGRIlSMxwMmEb8Nq/MHnkvsLNxew+DK
 RGnPxGHxAp7TxRAQh4Dr+ae92yBuldYzSJpV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H2iIBsu00H9gmCgE1ndDAGrufitOVygCG62ixZ4OeCs=;
 b=YQNGJ3U2g6NpT9madL2HdFd7nMGq1yRmGud61yWbN1TjqGcSIyOxe7clFoqrHiFFwv
 77CzhUeBb13V5I9OfUIUuaeDxOjRd+h8rhWij1HvvPwjdOScw59p0ipCWr+2l9XbppFH
 Wf2ylnWQy22EOfPjKGzVPEwrqT/cGTnbvlmsqpqEA3q8uaayS03jm2SwFz5bj5D8qzjh
 BgYZhE0HiZnkzWO6n2IlLSHaB2iAaDU9CVjAt0UIXnOd1eYTWpJYiLByojlHbNitJlQW
 NRkQeor7elcXkizt78lVqUhSjKMrdxGrQF3+UaWAENSU+21Vl/BP8oOkgpNeKKNIf+bU
 d2DA==
X-Gm-Message-State: AO0yUKUQxt4QTxJb03JPx16P5NrDCMHhAnXJx5L/EZq1USp58n7O5Y2x
 Ylut2AG4NtwP3dKRwCDQfUYUAxqb+TpVL5eLMcqMRw==
X-Google-Smtp-Source: AK7set+jRC7u8wW7Xx1AG5xaUYOEg22JmByUS/W1o4X59rwJjwTCmRDM+0j4mi+mxvE1TGu8bTm0n9a6JOY3guYA/Lw=
X-Received: by 2002:a81:ae61:0:b0:506:6364:fda3 with SMTP id
 g33-20020a81ae61000000b005066364fda3mr912382ywk.72.1674746339676; Thu, 26 Jan
 2023 07:18:59 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-3-jagan@amarulasolutions.com>
 <20230126121227.qcnftqvgiz44egpg@houat>
In-Reply-To: <20230126121227.qcnftqvgiz44egpg@houat>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 26 Jan 2023 20:48:48 +0530
Message-ID: <CAMty3ZB6QiqgQN_zWEXULHiipQWU_VaWxDWf9W8OTVQvkACu5A@mail.gmail.com>
Subject: Re: [RESEND PATCH v11 02/18] drm: bridge: panel: Add
 devm_drm_of_dsi_get_bridge helper
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 26, 2023 at 5:42 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> On Mon, Jan 23, 2023 at 08:41:56PM +0530, Jagan Teki wrote:
> > Add devm OF helper to return the next DSI bridge in the chain.
> >
> > Unlike general bridge return helper devm_drm_of_get_bridge, this
> > helper uses the dsi specific panel_or_bridge helper to find the
> > next DSI device in the pipeline.
> >
> > Helper lookup a given child DSI node or a DT node's port and
> > endpoint number, find the connected node and return either
> > the associated struct drm_panel or drm_bridge device.
>
> I'm not sure that using a device managed helper is the right choice
> here. The bridge will stay longer than the backing device so it will
> create a use-after-free. You should probably use a DRM-managed action
> here instead.

Thanks for the comments. If I understand correctly we can use
drmm_panel_bridge_add instead devm_drm_panel_bridge_add once we found
the panel or bridge - am I correct?

Jagan.
