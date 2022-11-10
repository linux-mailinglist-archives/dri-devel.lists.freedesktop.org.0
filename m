Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D84D3624689
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 17:03:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E96110E155;
	Thu, 10 Nov 2022 16:03:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0BD710E15B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 16:03:17 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id 63so1559540iov.8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 08:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RIxTRYd8LXmwSWWSkhggCPCFSFpw6CNw0xX91rswKjg=;
 b=BRbX2/V5HybGHHyn2aaIrJ51X6Xy2F1MOf4NAWdltjawfjvylCiqK0Dv9/NWVpG1DC
 LupQoAhjH5uv9xe5mNBHMyZKm/Inwxn+rul07Pi+Km6j/uEGSFxP5KpjjCZN7fW2DuCQ
 I0zQ05+1Jl4tjjmzl08dShWn0rIoHS/lRGpdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RIxTRYd8LXmwSWWSkhggCPCFSFpw6CNw0xX91rswKjg=;
 b=SvQ0s6Hc2Y9qWWMndxpKFj6R+6MpwJF7sTZYsXmtQgdUOlqnO+jIZLfvKNf50E1PIP
 HqyPfH2VQSzMGX6DtlYgy2EVHZ+GWXeoSbH0GuWK9jOf17eeaUTU8v9+uan2q/L7j3do
 20JKke80UTfrWwZlhZFEWmjD872rT8O/AYPsfZV+hs2PqJukcQz+m0W9SdMEjXODXHqO
 Mvo2t2+m4L8MKESoj9G632Hxctijw7oEqub6iW3DkAUShS7VIULOi6oceScBaFrRIjkg
 XE7JzADYQEG/AsOdS3m7g8KdniiAv3VpYFwiXWq0wVxCBXzv2F7OaAGseUx5seopEQyE
 Xgtg==
X-Gm-Message-State: ACrzQf13Mc5ONFW4nUVKcxoPwe4YIhcA7+s2sTAFipJC9wYKlSNHxnNz
 nCgakgVO9fkqh5TWK/ykqB8JxrPKutVaqDdcP8wdFA==
X-Google-Smtp-Source: AMsMyM4fDoK33KDDH0EOAkYrqGWWMRDg6cHZ6bI+cXayZHtFVq/RgBH7wHIQaOmyPCFA/9zQ1nbl9V4uV9ZqLXFF+8o=
X-Received: by 2002:a6b:6f19:0:b0:6c3:168a:a25e with SMTP id
 k25-20020a6b6f19000000b006c3168aa25emr2885739ioc.174.1668096197188; Thu, 10
 Nov 2022 08:03:17 -0800 (PST)
MIME-Version: 1.0
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <f1dfac7d-643e-db29-28fe-7a2fcde01894@kontron.de>
 <CAOMZO5AqRRYLTUQWACiCA0RCvsjGaCmK3yhdGP8XfNxjFP1OiA@mail.gmail.com>
In-Reply-To: <CAOMZO5AqRRYLTUQWACiCA0RCvsjGaCmK3yhdGP8XfNxjFP1OiA@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 10 Nov 2022 21:33:06 +0530
Message-ID: <CAMty3ZA9sPf97C0xonHwBR8SWDrRyA7DKVCmWOyoxijQwXUSZQ@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] drm: bridge: Add Samsung MIPI DSIM bridge
To: Fabio Estevam <festevam@gmail.com>
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

On Thu, Nov 10, 2022 at 9:24 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi,
>
> On Mon, Nov 7, 2022 at 1:34 PM Frieder Schrempf
> <frieder.schrempf@kontron.de> wrote:
>
> > I tested this on the Kontron DL i.MX8MM which uses a TI SN65DSI84 bridge
> > and a Jenson 7" LVDS Display.
> >
> > Thanks for your work, Jagan!
> >
> > Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron DL
> > i.MX8MM
>
> As this series has been successfully tested on multiple devices, is it possible
> to apply it so people can make further adjustments?

I think the next version patchset on this would be clean and properly
address a few comments from Marek Vasut. However, I'm still waiting
for Marek's response to my comment on the input bus formats - if it is
Okay I will send the v8.
https://lore.kernel.org/all/CAMty3ZAM+fetmBQWaSbfjME7-Up4h+Ln3BRHaPgg5tuSsObPdw@mail.gmail.com/

Thanks,
Jagan.
