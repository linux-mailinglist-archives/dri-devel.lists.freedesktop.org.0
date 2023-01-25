Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAD767AA8E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 07:55:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950D910E72E;
	Wed, 25 Jan 2023 06:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F57210E72E
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 06:54:54 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id m199so6087954ybm.4
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 22:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wqs8wbPlAZDTLJakmydgiMmPGts6HLlVoCIHxpQubjo=;
 b=U9e8Wb1myASouSuwhQv8BZllXOdBrkn1B/LD3/eQtP3RbEskY2eAbeGHgnDeI2u+wL
 xbYUpDGHjyh2Jk2q5v/wz3K3I5cC0fvFcxFWAqPPMvbnivzVZplnxdM1DNMn6W8ctfKb
 cNe5JM5I3ZqDMasXSnCsqHwv2ijsTc1omaCaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wqs8wbPlAZDTLJakmydgiMmPGts6HLlVoCIHxpQubjo=;
 b=j08DMGCl8sdwfkaB03ZNpQpRB+T+AMt0VYiTwFNrV+CvT9vUemMkMlCI4CZBPG/+Gv
 W+ocDyZpyStbQLgkxV3Du0O16gzsflSA0oPrP8wdOOKt41ImVPLaTYqvu2JzprZLcxyS
 syuEWJPLGfZPs+UeiepYK+IPBvCVL0xa+u6YMAhlMqT83hPpKZjGRIBWL5hYXAebHx4B
 HVYYXDeiYMkvyfwQ1RBhwlU5qhrDfbYysHMYoTHLviaRNVVgfiDmfJQ1XLWSQwUJ1oZU
 m4Ahg2GNoGqFELgWzZB6DQ8ONYB+64bIEEdAya/aeCr56wqI7E/7AKcvcEyScSOUY+QX
 QJiw==
X-Gm-Message-State: AFqh2kqPRVrZQ5NfXNzUzBJV534bDpYvub3enG5rtTR+0K8c+oUbPLe9
 yvfMvkN42Wnp/Av+x5fHo2GB3pBusMV63wj+aK5TaQ==
X-Google-Smtp-Source: AMrXdXvvAsurupMLHcGBtjeQclADi/LmwKvn2BnkYvtRMrfeYGqUbYn8zvts83S+YXbNwfYM1DXRJYMkL3VgSnzAZcc=
X-Received: by 2002:a25:5f43:0:b0:7fe:b611:d88c with SMTP id
 h3-20020a255f43000000b007feb611d88cmr2270813ybm.594.1674629693289; Tue, 24
 Jan 2023 22:54:53 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-14-jagan@amarulasolutions.com>
 <43f4a7dc-a4cc-7552-1a6d-a2a49fae6020@denx.de>
 <CAMty3ZBZWERT=HpjSepSaFbpKpwZUvuG82s6+z7EgDRY5D+TFg@mail.gmail.com>
 <fb7dfb89-42d6-139e-7ff1-4985838e222f@denx.de>
 <CAMty3ZAYz=XEN6s1XhBWg5b77kk+s942qa9Oz4E4oHtSfaVZtA@mail.gmail.com>
 <CAMty3ZB8jAoKzXpPJzrfH6bOGBOpJRuTacgQDSg8kVuhg7p37Q@mail.gmail.com>
In-Reply-To: <CAMty3ZB8jAoKzXpPJzrfH6bOGBOpJRuTacgQDSg8kVuhg7p37Q@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 25 Jan 2023 12:24:41 +0530
Message-ID: <CAMty3ZDNwJ40pPJFKqwMd13y-rF9ELb5N6JZffea6T4dnD-0nA@mail.gmail.com>
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
> On Wed, Jan 25, 2023 at 2:54 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > On Wed, Jan 25, 2023 at 2:42 AM Marek Vasut <marex@denx.de> wrote:
> > >
> > > On 1/24/23 22:01, Jagan Teki wrote:
> > > > On Wed, Jan 25, 2023 at 2:18 AM Marek Vasut <marex@denx.de> wrote:
> > > >>
> > > >> On 1/23/23 16:12, Jagan Teki wrote:
> > > >>> Enable and disable of te_gpio's are Exynos platform specific
> > > >>> irq handling, so add the exynos based irq operations and hook
> > > >>> them for exynos plat_data.
> > > >>
> > > >> If this is just an optional generic GPIO IRQ, why not keep it in the
> > > >> core code ? TE (tearing enable?) should be available on MX8M too.
> > > >
> > > > So far the discussion (since from initial versions) with Marek
> > > > Szyprowski, seems to be available in Exynos. So, I keep it separate
> > > > from the DSIM core.
> > >
> > > Isn't TE a generic GPIO IRQ ? If so, it is available also on i.MX8M .
>
> I will check this.

In order to use TE_GPIO we need te handler implementation, right now
Exynos CRTC DRM drivers have implementation for this. That is the main
reason to keep the TE_GPIO handling in exynos, maybe if we handle that
generically then it is a viable option to move TE_GPIO to the DSIM
core.

Jagan.
