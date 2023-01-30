Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C55680EC1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 14:25:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1570810E248;
	Mon, 30 Jan 2023 13:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741D310E24A
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 13:25:06 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id b1so13910605ybn.11
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 05:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fjv+/E7O9V7DZVWlNMMTfaSn1KNdTFVRK34aoQeSsQE=;
 b=azrR8dxvTG+zW+XTUkRM5iail1HeaGQQ6c3C8vQtn3oK4dJZ64cZrbxJxfsoKjz4XO
 k492kmeLLzP5wBXd1dZr5O9uf2y1/GS1v99kNAQbTTppxOtnhQA+PkYXInVYFyvujaIk
 eV70JlQM98yAnQgMV8amV1c02VkLF6Uvc0JHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fjv+/E7O9V7DZVWlNMMTfaSn1KNdTFVRK34aoQeSsQE=;
 b=7TpoRZUdbwIv24WGZLIB4WQl1WJ6SLCV0iS1YnrdriWGdOdwYvwe05F26gtOUMDVht
 VBNA15nNEjQPtL0C1b9LmGeD5ehyJ+HPPgzipk7e5h6pWOADqxTuTMzy4aDoKH3LPvOj
 4j5eoMSuZ9mLBjwRv7nUtAGgIWSww2fXrRhWcCKHS5+dtLUPc6A+wdGiGlHeSuUS5lAb
 2JiZROz4555hEFLvtem3u4tVWVFGz3etnhoDTnbPF3lMAv9ZohPg5nevLNmCWAG5G6EP
 DkPnr1y60k/2LtjmEKPAO1Ky8qv32ppmpT5OEBR8pvYjAjwBlD4zt35D8DZzadFBYzAd
 FTuw==
X-Gm-Message-State: AO0yUKWQVVEVnl4R1+swEYSynnnUDFYt1ppuUY798bvG7SyqKRliWoQs
 PplST1XrmhpKEQ7FJn3xQ8SX2Y+Dcfjb+otmcBaLyA==
X-Google-Smtp-Source: AK7set9R/9ExSamHld21fB3UmF6BQKaP+543rXKY2KUZE7qJpQig5geVNt4zfsyMvM9rQzLSIf1gnaP5j6xIkgaAsLE=
X-Received: by 2002:a25:3745:0:b0:80b:6fc1:8b32 with SMTP id
 e66-20020a253745000000b0080b6fc18b32mr343908yba.126.1675085105613; Mon, 30
 Jan 2023 05:25:05 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-3-jagan@amarulasolutions.com>
 <20230126121227.qcnftqvgiz44egpg@houat>
 <CAMty3ZB6QiqgQN_zWEXULHiipQWU_VaWxDWf9W8OTVQvkACu5A@mail.gmail.com>
 <CAMty3ZDTuvYKQYpVnoUU_-b3znJiyR0yBADO-5_5+86KgwYv3Q@mail.gmail.com>
 <20230130125648.mlrtubymeooejvhg@houat>
In-Reply-To: <20230130125648.mlrtubymeooejvhg@houat>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 30 Jan 2023 18:54:54 +0530
Message-ID: <CAMty3ZANxwUp8yOjo+EWHNngi7SoMYhm1FchM38v_EUDpLY7UQ@mail.gmail.com>
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

On Mon, Jan 30, 2023 at 6:26 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Fri, Jan 27, 2023 at 11:09:26PM +0530, Jagan Teki wrote:
> > Hi,
> >
> > On Thu, Jan 26, 2023 at 8:48 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > >
> > > On Thu, Jan 26, 2023 at 5:42 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Mon, Jan 23, 2023 at 08:41:56PM +0530, Jagan Teki wrote:
> > > > > Add devm OF helper to return the next DSI bridge in the chain.
> > > > >
> > > > > Unlike general bridge return helper devm_drm_of_get_bridge, this
> > > > > helper uses the dsi specific panel_or_bridge helper to find the
> > > > > next DSI device in the pipeline.
> > > > >
> > > > > Helper lookup a given child DSI node or a DT node's port and
> > > > > endpoint number, find the connected node and return either
> > > > > the associated struct drm_panel or drm_bridge device.
> > > >
> > > > I'm not sure that using a device managed helper is the right choice
> > > > here. The bridge will stay longer than the backing device so it will
> > > > create a use-after-free. You should probably use a DRM-managed action
> > > > here instead.
> > >
> > > Thanks for the comments. If I understand correctly we can use
> > > drmm_panel_bridge_add instead devm_drm_panel_bridge_add once we found
> > > the panel or bridge - am I correct?
> >
> > Look like it is not possible to use DRM-managed action helper here as
> > devm_drm_of_dsi_get_bridge is calling from the DSI host attach hook in
> > which we cannot find drm_device pointer (as drm_device pointer is
> > mandatory for using DRM-managed action).
> > https://github.com/openedev/kernel/blob/imx8mm-dsi-v12/drivers/gpu/drm/bridge/samsung-dsim.c#L1545
> >
> > Please check and correct me if I mentioned any incorrect details.
>
> You shouldn't call that function from attach anyway:
> https://dri.freedesktop.org/docs/drm/gpu/drm-kms-helpers.html#special-care-with-mipi-dsi-bridges

True, If I remember we have bridges earlier to find the downstream
bridge/panels from the bridge ops and attach the hook, if that is the
case maybe we can use this DRM-managed action as we can get the
drm_device pointer from the bridge pointer. So, what is the best we
can do here, add any TODO comment to follow up the same in the future
or something else, please let me know?

Thanks,
Jagan.
