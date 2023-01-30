Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A48E7680EB2
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 14:22:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C2410E0F6;
	Mon, 30 Jan 2023 13:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2106A10E0F6
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 13:22:18 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-5063029246dso158978557b3.6
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 05:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gttOd15yZEiFoNt1YESSdvZd7eBWMsxLFeeyfZcuhEU=;
 b=i0x8ngqMvtZM5rDk05SRUFOCslYhjId7Oc4pmrJXchAtkUG78bOjFzsV/ZWCHUbrwU
 kcvKIKE5aL++pLWI/cmz2Rp1tA2F7bo0LXKGE2xTPTPOF4T1DvkKKWyMMYhWMPqxry6r
 s0vcIoS1/4nln/Fv4pci3f8szOHxxGxg1Tkn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gttOd15yZEiFoNt1YESSdvZd7eBWMsxLFeeyfZcuhEU=;
 b=Qx4kTwRcyl4dstCan3fruW68EFmNp/LeKAU5o2iyuP1HiyXJ5wAjQ180uBQPE0N5cW
 sN34qtGBbjvgP5TOWUyt9wS39veOagUvq07PlIVop2lWR8Fow370d3MzbYga4GPePo4t
 lKO80SE4jsFPKNBHEDmCF9gMP1G299QwP0FDAxxeugOXCDAushJWfqKW9bKpzW9JY6/G
 8DJrES61+AWohTW4C5i2bXyMI3ynSM2nkTHM1m26oPnyiXzq99I6g35IHT5F+jYRM79n
 YyGGt4Jn3DNnG/ruHmqZC+sGEXYARSzjlF/Z1IWG5frqJFqGieo9Vue6mvxSlIiK+cGI
 HITw==
X-Gm-Message-State: AO0yUKWZLuFU18wvmpa2J3tzeVx4Na07ckxXa3ZKotleqod5VMD7yeej
 HbC/gq08iz0QPjL/v5r4PWmqsyMHNPzPQkwtPpSsPw==
X-Google-Smtp-Source: AK7set+6a15jU4R+OVaFt1d47zLUJd+Iv5IFZZXua79rQ+nkNaCqxHZ6Jk/p7MJxLftepnIM3yN6jQGQQ6uGWOC/mjI=
X-Received: by 2002:a81:ae61:0:b0:506:6364:fda3 with SMTP id
 g33-20020a81ae61000000b005066364fda3mr2568530ywk.72.1675084937150; Mon, 30
 Jan 2023 05:22:17 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-3-jagan@amarulasolutions.com>
 <20230126121227.qcnftqvgiz44egpg@houat>
 <CAMty3ZB6QiqgQN_zWEXULHiipQWU_VaWxDWf9W8OTVQvkACu5A@mail.gmail.com>
 <20230130125828.qkqsq6ax5mojkdbq@houat>
In-Reply-To: <20230130125828.qkqsq6ax5mojkdbq@houat>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 30 Jan 2023 18:52:05 +0530
Message-ID: <CAMty3ZDdbBTsKTzmMaUxwmR+YqdVZVB8vtMr4qEy99O03t6fSg@mail.gmail.com>
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

On Mon, Jan 30, 2023 at 6:28 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Thu, Jan 26, 2023 at 08:48:48PM +0530, Jagan Teki wrote:
> > On Thu, Jan 26, 2023 at 5:42 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > Hi,
> > >
> > > On Mon, Jan 23, 2023 at 08:41:56PM +0530, Jagan Teki wrote:
> > > > Add devm OF helper to return the next DSI bridge in the chain.
> > > >
> > > > Unlike general bridge return helper devm_drm_of_get_bridge, this
> > > > helper uses the dsi specific panel_or_bridge helper to find the
> > > > next DSI device in the pipeline.
> > > >
> > > > Helper lookup a given child DSI node or a DT node's port and
> > > > endpoint number, find the connected node and return either
> > > > the associated struct drm_panel or drm_bridge device.
> > >
> > > I'm not sure that using a device managed helper is the right choice
> > > here. The bridge will stay longer than the backing device so it will
> > > create a use-after-free. You should probably use a DRM-managed action
> > > here instead.
> >
> > Thanks for the comments. If I understand correctly we can use
> > drmm_panel_bridge_add instead devm_drm_panel_bridge_add once we found
> > the panel or bridge - am I correct?
>
> It's not that we can, it's that the devm_panel_bridge_add is unsafe:
> when the module is removed the device will go away and all the devm
> resources freed, but the DRM device sticks around until the last
> application with a fd open closes that fd.

Thanks for the details. I think this is the reason you have introduced
this DRM-managed action helper - drmm_of_get_bridge. Initially, i
thought of adding similar, but as you are aware it is not possible to
call it from the host attach.

Jagan.
