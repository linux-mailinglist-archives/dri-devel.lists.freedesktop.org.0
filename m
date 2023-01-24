Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFF267A4F0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 22:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 865ED10E706;
	Tue, 24 Jan 2023 21:25:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A88810E706
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 21:25:10 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id n5so18192368ljc.9
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 13:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vUBHr8D8GWJZ1r7Tn60/9dMtNgme2KiGS5XhvwJMhHM=;
 b=OKgs8tWykXM8n8HRcHyqr6gXj3ZTRfIsLgp9yw7SIEiufVzYzf3SDtgc2juwpFqoS5
 IGjYjYP7VFsW5VHnJR/A93svc0TSgf9oNOJNAIA4qR8ixxl/nN/fN5PXhgJ7xbPCDEJV
 i5tAvcA3rpCfgUw1LxOjYF5i/h82AdhgHTBGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vUBHr8D8GWJZ1r7Tn60/9dMtNgme2KiGS5XhvwJMhHM=;
 b=bqkjyQ1KizPm2Dqfb7aopUAa/FwHwRBgqFB/LWC3UC3UUen6KlzQ69WgVSgI1AkX31
 WpkSSnr+Gtcu9jCqN+8dqm/Dc+G3nuhl5Rx7/HKARia6ClTZ2P4vyZaPZdSXynBLmFtA
 WHPZ/12aW0Qe1JfmjZVHF2HVRCIcwkt/VjmlYrNps4tHD0WM7/Sn19KP8jhvevealQyG
 FHYnUkzFZ3dJvgvKvo8FJtXzIoJAZeAnldStIEGXjx3c6wPdp6GnIiXbUWXz25HpEavi
 wG+pE3+CY2tlh/Ui+vot3muFgya4KvHNKGrZxWyrccHJWUdARSkMr01vIGxOwir1ah3F
 T27Q==
X-Gm-Message-State: AFqh2krpB/Jfpg981YK55Po+NX2axxAQcGFMpUue6jkW5jpJ6lPiJstk
 R5+K+mWOF9bSQzRbwry30rxyCjNFszcb+iosVCQlww==
X-Google-Smtp-Source: AMrXdXvZEKxsRlr95LHEdUrninbUwoeQKjtH08GI54vYab+/kf5NUu8pnuUBXVuxQBBEemm5i5Ah1Vvg2BeuxdcC6K0=
X-Received: by 2002:a05:651c:218:b0:28b:7993:585b with SMTP id
 y24-20020a05651c021800b0028b7993585bmr2954286ljn.473.1674595508485; Tue, 24
 Jan 2023 13:25:08 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-14-jagan@amarulasolutions.com>
 <43f4a7dc-a4cc-7552-1a6d-a2a49fae6020@denx.de>
 <CAMty3ZBZWERT=HpjSepSaFbpKpwZUvuG82s6+z7EgDRY5D+TFg@mail.gmail.com>
 <fb7dfb89-42d6-139e-7ff1-4985838e222f@denx.de>
 <CAMty3ZAYz=XEN6s1XhBWg5b77kk+s942qa9Oz4E4oHtSfaVZtA@mail.gmail.com>
In-Reply-To: <CAMty3ZAYz=XEN6s1XhBWg5b77kk+s942qa9Oz4E4oHtSfaVZtA@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 25 Jan 2023 02:54:55 +0530
Message-ID: <CAMty3ZB8jAoKzXpPJzrfH6bOGBOpJRuTacgQDSg8kVuhg7p37Q@mail.gmail.com>
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

On Wed, Jan 25, 2023 at 2:54 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> On Wed, Jan 25, 2023 at 2:42 AM Marek Vasut <marex@denx.de> wrote:
> >
> > On 1/24/23 22:01, Jagan Teki wrote:
> > > On Wed, Jan 25, 2023 at 2:18 AM Marek Vasut <marex@denx.de> wrote:
> > >>
> > >> On 1/23/23 16:12, Jagan Teki wrote:
> > >>> Enable and disable of te_gpio's are Exynos platform specific
> > >>> irq handling, so add the exynos based irq operations and hook
> > >>> them for exynos plat_data.
> > >>
> > >> If this is just an optional generic GPIO IRQ, why not keep it in the
> > >> core code ? TE (tearing enable?) should be available on MX8M too.
> > >
> > > So far the discussion (since from initial versions) with Marek
> > > Szyprowski, seems to be available in Exynos. So, I keep it separate
> > > from the DSIM core.
> >
> > Isn't TE a generic GPIO IRQ ? If so, it is available also on i.MX8M .

I will check this.

Jagan.
