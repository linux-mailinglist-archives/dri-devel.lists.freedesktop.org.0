Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F28267EC9D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 18:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A6610E9BF;
	Fri, 27 Jan 2023 17:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF91B10E9BF
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 17:39:38 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-4c24993965eso76196157b3.12
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 09:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=e2YXWr1HG5PC3aXK4CzFGhgLqF4TwbPxIsqKBeKBW4g=;
 b=gA0EatzTjAacYhO0/TiDJdnXTuNNdWjyIt0DkW1qsY9p2TRJsCAFdsNZUiz4QyezT+
 XkPQ2kSc3j93oxdfnMkzO9fBPoCRo34HTApdF4eTkDFt0niTOH+aWm4ZRwBt1gSmupIU
 9XjIxZ2jsjOTb3WU1902XnI/4kpuuQAcNkrrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e2YXWr1HG5PC3aXK4CzFGhgLqF4TwbPxIsqKBeKBW4g=;
 b=ctggWIyOAYHULQi5/rae0553JPib8U4+JK17iH61kEJLMw7M1Xl3K41cWpQ5AmTZqk
 2tE/Ts4nGMzCrla0lQqxqJibXNFGeL5/vgpnIh1goiOifJshSMMDBlT5502W/KXmPzG2
 Wjnu2CdtzP2Y4KMCBFPfAxv8CUJLjiTx9RYPAxNylaeJw1ugrZnf2sNeyKhDhXQ4FO8n
 PKlnBU6jChAKEZYcDPlBGt9Ze0kuMwwIsxnwTSqF12XUM6isubghniQ9udlU6MVhXSxb
 oyplu/H6h2U0oQ0tdwg7DP6zhjoxvDRDVDlT+dFhtplxu4XFQ34RrCU2kgnEEVjl9m1T
 AJTQ==
X-Gm-Message-State: AFqh2kpuIoc+HCFyrYOxOiMAlCTdrzQhe3BTcKrLVtv6lJHlO7bIuKO6
 QyT5O6uBAi0G2PEwy+LLGsWCZg3qV9iT1zQZoZrTlg==
X-Google-Smtp-Source: AMrXdXuVNwSWKBh/6v0X8S1+k0INDffwXqKFD9ZdtW09goRn50INi1zYFaJ87D2lzXSkCd/8DMiIHazjH3DcrGBwhNY=
X-Received: by 2002:a0d:fe03:0:b0:470:533:cb89 with SMTP id
 o3-20020a0dfe03000000b004700533cb89mr5543044ywf.81.1674841178008; Fri, 27 Jan
 2023 09:39:38 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-3-jagan@amarulasolutions.com>
 <20230126121227.qcnftqvgiz44egpg@houat>
 <CAMty3ZB6QiqgQN_zWEXULHiipQWU_VaWxDWf9W8OTVQvkACu5A@mail.gmail.com>
In-Reply-To: <CAMty3ZB6QiqgQN_zWEXULHiipQWU_VaWxDWf9W8OTVQvkACu5A@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 27 Jan 2023 23:09:26 +0530
Message-ID: <CAMty3ZDTuvYKQYpVnoUU_-b3znJiyR0yBADO-5_5+86KgwYv3Q@mail.gmail.com>
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

Hi,

On Thu, Jan 26, 2023 at 8:48 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> On Thu, Jan 26, 2023 at 5:42 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Hi,
> >
> > On Mon, Jan 23, 2023 at 08:41:56PM +0530, Jagan Teki wrote:
> > > Add devm OF helper to return the next DSI bridge in the chain.
> > >
> > > Unlike general bridge return helper devm_drm_of_get_bridge, this
> > > helper uses the dsi specific panel_or_bridge helper to find the
> > > next DSI device in the pipeline.
> > >
> > > Helper lookup a given child DSI node or a DT node's port and
> > > endpoint number, find the connected node and return either
> > > the associated struct drm_panel or drm_bridge device.
> >
> > I'm not sure that using a device managed helper is the right choice
> > here. The bridge will stay longer than the backing device so it will
> > create a use-after-free. You should probably use a DRM-managed action
> > here instead.
>
> Thanks for the comments. If I understand correctly we can use
> drmm_panel_bridge_add instead devm_drm_panel_bridge_add once we found
> the panel or bridge - am I correct?

Look like it is not possible to use DRM-managed action helper here as
devm_drm_of_dsi_get_bridge is calling from the DSI host attach hook in
which we cannot find drm_device pointer (as drm_device pointer is
mandatory for using DRM-managed action).
https://github.com/openedev/kernel/blob/imx8mm-dsi-v12/drivers/gpu/drm/bridge/samsung-dsim.c#L1545

Please check and correct me if I mentioned any incorrect details.

Thanks,
Jagan.
