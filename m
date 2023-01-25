Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FFA67B3D7
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 15:04:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A80B10E7BA;
	Wed, 25 Jan 2023 14:04:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9394C10E7BA
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 14:04:52 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-4c131bede4bso264317727b3.5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 06:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+LBRkUPcT5cSLfU1Shlwd9jP9M0+3VXXbQQB1UsR0NA=;
 b=Ybae0TdtOy+PKR7+AepH0BGeexUntFKPlKJKW1aUPxYL05djkRvKrtQatEDytHbYEE
 P+DVgGQq/VBgllZHqKhxt6aYOWOJH+D4y6TG9YwzLW2ePnNseemEVc6+UE+sMLWlB9vo
 RUiT+eMYKUpd2IY4keBXDfbNUw48PN/x6OIso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+LBRkUPcT5cSLfU1Shlwd9jP9M0+3VXXbQQB1UsR0NA=;
 b=GT9Ichi4CSI8w2OfRcTyKgkHf1Fny8CdlNKYZnzxBvJQZ2fIT0Ky5BEnP8oynMmndQ
 CKTsWCL6BR7QfRjQPNIC7uFoMx+uOX4+ztOzKKNcrGvCwmoCVfSRk1NKMyUXnAbiqept
 W7K4nvIe2GqK6XKtRvjnLn0sHTlzcBCkgnAbN737jAzESjie6lyuQ4cD9ifTE+6eyiQQ
 hhSxpppmV1ohyr9XHPw+N95jxs+Rfphqb9F6eDvujkvP0YoDNYW4hwx2sx6v3DHMp1as
 zOp6Hm7N7gQp2wUbrhKTfdKyXQUd0hYk1tkDLxGGtvbd5C1lZV3DnpK71ueJHjF8Ty3k
 BBDQ==
X-Gm-Message-State: AO0yUKUVNkXgOWHtzMm/OQG09KwLLn6/rqBw1otLMseS3zZDVTZlqs0T
 YTpRwEBcfzX1k9t29/JivIoYL0AGagE2H0mvYmmVaQ==
X-Google-Smtp-Source: AK7set+NfcCN0p2R4VGAwkQslapAjE2pMGBNGS8pNJVA2a8RHKTtrDzf5Gw2QuDdNyJHVw7wXKUSxtH4O1c8BSCokKQ=
X-Received: by 2002:a0d:d512:0:b0:506:4b25:8655 with SMTP id
 x18-20020a0dd512000000b005064b258655mr580885ywd.106.1674655491725; Wed, 25
 Jan 2023 06:04:51 -0800 (PST)
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
In-Reply-To: <d8e539bd-93db-fb6f-eaec-463f382a1dfb@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 25 Jan 2023 19:34:37 +0530
Message-ID: <CAMty3ZBxbwwocAwZ18o8tis54SRC64853b+p8VfzcD=OWrjP6Q@mail.gmail.com>
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
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 25, 2023 at 7:23 PM Marek Vasut <marex@denx.de> wrote:
>
> On 1/25/23 07:54, Jagan Teki wrote:
> > On Wed, Jan 25, 2023 at 2:54 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >>
> >> On Wed, Jan 25, 2023 at 2:54 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >>>
> >>> On Wed, Jan 25, 2023 at 2:42 AM Marek Vasut <marex@denx.de> wrote:
> >>>>
> >>>> On 1/24/23 22:01, Jagan Teki wrote:
> >>>>> On Wed, Jan 25, 2023 at 2:18 AM Marek Vasut <marex@denx.de> wrote:
> >>>>>>
> >>>>>> On 1/23/23 16:12, Jagan Teki wrote:
> >>>>>>> Enable and disable of te_gpio's are Exynos platform specific
> >>>>>>> irq handling, so add the exynos based irq operations and hook
> >>>>>>> them for exynos plat_data.
> >>>>>>
> >>>>>> If this is just an optional generic GPIO IRQ, why not keep it in the
> >>>>>> core code ? TE (tearing enable?) should be available on MX8M too.
> >>>>>
> >>>>> So far the discussion (since from initial versions) with Marek
> >>>>> Szyprowski, seems to be available in Exynos. So, I keep it separate
> >>>>> from the DSIM core.
> >>>>
> >>>> Isn't TE a generic GPIO IRQ ? If so, it is available also on i.MX8M .
> >>
> >> I will check this.
> >
> > In order to use TE_GPIO we need te handler implementation, right now
> > Exynos CRTC DRM drivers have implementation for this. That is the main
> > reason to keep the TE_GPIO handling in exynos, maybe if we handle that
> > generically then it is a viable option to move TE_GPIO to the DSIM
> > core.
>
> I think you can do this exactly the same way exynos does it -- check
> whether te_handler() callback is implemented by the glue code (the one
> you already have for various exynos and imx8mm/imx8mm SoCs) and if so,
> call it. If it is not implemented, do not call anything in the TE IRQ
> handler.

I need to understand how i.MX8MM handles this on TE IRQ in the DSIM
host side, Can I do this in future patch set as it might involve
bindings changes as well if it's part of DSIM?

Jagan.
