Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B8467BAD9
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:25:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97D210E11D;
	Wed, 25 Jan 2023 19:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA27210E11D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 19:24:58 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id 188so24335284ybi.9
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 11:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kjCOH+Bah/rBQEkuY52H26Uj32tdQ7thposSFvWsa0U=;
 b=TN7YHmXzQ3wjzP9Ck1OVEcK4t58+AbefJbHKE0l3WJcjJP4Om58Gjokv1C8CaXnAcW
 nYKB9qZ2B52WKif5+y7HAWSSYJPxo5I01oMIw1YkZMIGi6arOuz55v2gCE2gy7DHkhws
 fA3Or4HKz9/pqH4DDEhzRNR+DFWPjP63+6YRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kjCOH+Bah/rBQEkuY52H26Uj32tdQ7thposSFvWsa0U=;
 b=2N4XjdN9A7g0jFdeyKGmMMkhtxnSxouF7q4a8GPiyP2TK6ILeTHf0ZsROlW8vcU/td
 +JwsR4aiQR7PdjxL9asMqoZzmAI8BVYJziutUuQs8Hvvaq0+SA8X87mafUgsx7pZStNb
 FbHeue39J9mRc1MPZTZZLhkeLx1R5vwWW1DCPJ2SIcuy5VDK2xkaFJT8zh/SqReXRIlT
 pNLxvL8WFSAJFz/+qHJuJBGntrTUaqmyCWB5YmoHt54o5JVvi8Wn3HCsl54ikLYel4I5
 aOuv5Xrp9Wi4HQWzPzqdZR5KBLG1rVom+UtuTk+9qzY1UoUA2f0f38I0IttwlRwcrD+A
 NC8Q==
X-Gm-Message-State: AO0yUKUJtOrXZ+jWmArOEt4SLgMv55efFA83GovsaS5/mcUZX/xMJcB0
 hF/SklNSkeJFKBog3H9EHKnCUqOHz5ZFwM6OYnGvUA==
X-Google-Smtp-Source: AK7set/Ubjl/kR4XwJKyXJklCNuk6uw5bs8ayrSC/puhHItAJpvdjyRHNS7xDQs6m2Sadjo8lcfO3DKG2/svHfyov2E=
X-Received: by 2002:a25:3749:0:b0:80b:6fc1:8b32 with SMTP id
 e70-20020a253749000000b0080b6fc18b32mr665824yba.126.1674674697800; Wed, 25
 Jan 2023 11:24:57 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-14-jagan@amarulasolutions.com>
 <43f4a7dc-a4cc-7552-1a6d-a2a49fae6020@denx.de>
 <CAMty3ZBZWERT=HpjSepSaFbpKpwZUvuG82s6+z7EgDRY5D+TFg@mail.gmail.com>
 <fb7dfb89-42d6-139e-7ff1-4985838e222f@denx.de>
 <CAMty3ZAYz=XEN6s1XhBWg5b77kk+s942qa9Oz4E4oHtSfaVZtA@mail.gmail.com>
 <CAMty3ZB8jAoKzXpPJzrfH6bOGBOpJRuTacgQDSg8kVuhg7p37Q@mail.gmail.com>
 <CAMty3ZDNwJ40pPJFKqwMd13y-rF9ELb5N6JZffea6T4dnD-0nA@mail.gmail.com>
 <d8e539bd-93db-fb6f-eaec-463f382a1dfb@denx.de>
 <CAMty3ZBxbwwocAwZ18o8tis54SRC64853b+p8VfzcD=OWrjP6Q@mail.gmail.com>
 <c67cdb83-2fef-ad7c-f2c4-e2a6eb09a3e8@denx.de>
 <CAMty3ZAh7J6_X9NkE+-mBrHBFx+KfuQXPBUYyL5g2vu_Y5X9iw@mail.gmail.com>
 <a756fd20-28e4-85e7-3947-4c468bf3366d@denx.de>
 <CAMty3ZDTcnN_NgjL8hEBnABpFcaE=hCegZnzaC9tz-7wFxYSmw@mail.gmail.com>
 <94f847b0-769d-e28b-11c0-b817b30c704f@denx.de>
In-Reply-To: <94f847b0-769d-e28b-11c0-b817b30c704f@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 26 Jan 2023 00:54:46 +0530
Message-ID: <CAMty3ZBTRO55N87u+YS+MtOn-D=-YRbe1Gnm8uuQM04ULuT_Vw@mail.gmail.com>
Subject: Re: [RESEND PATCH v11 13/18] drm: exynos: dsi: Add Exynos based host
 irq hooks
To: Marek Vasut <marex@denx.de>
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
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 25, 2023 at 11:33 PM Marek Vasut <marex@denx.de> wrote:
>
> On 1/25/23 18:35, Jagan Teki wrote:
>
> [...]
>
> >>> exynos_dsi_register_te_irq is done after the bridge attach is done in
> >>> Exynos, here bridge attach is triggered in the component ops bind
> >>> call, since samsung-dsim is a pure bridge w/o any component ops.
> >>> https://github.com/openedev/kernel/blob/imx8mm-dsi-v12/drivers/gpu/drm/bridge/samsung-dsim.c#L1527
> >>> https://github.com/openedev/kernel/blob/imx8mm-dsi-v12/drivers/gpu/drm/exynos/exynos_drm_dsi.c#L112
> >>>
> >>> Any suggestion on how to handle this?
> >>
> >> Why isn't the generic code calling drm_bridge_attach() in
> >> samsung_dsim_host_attach(), like the exynos one ?
> >
> > Exynos drm drivers follow component ops and generic dsim is a pure drm
> > bridge whose downstream bridge will attach in bridge ops attach and
> > the component-based drivers require an initial bridge attach (whose
> > previous is NULL) call in the component bind hook for establishing the
> > bridge chain.
>
> Well in that case, call the exynos optional host_attach and register the
> TE IRQ handler at the end, that should work just fine too, right ? If
> so, then you can also move the IRQ handler registration into the generic
> part of the driver.

Something like this?

samsung_dsim_host_attach()
{
        drm_bridge_add(&dsi->bridge);

        if (pdata->host_ops && pdata->host_ops->attach)
                pdata->host_ops->attach(dsi, device);

        exynos_dsi_register_te_irq

        dsi->lanes = device->lanes;
        dsi->format = device->format;
        dsi->mode_flags = device->mode_flags;
}

Jagan.
