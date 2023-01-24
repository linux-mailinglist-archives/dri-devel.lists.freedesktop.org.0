Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0076567A4ED
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 22:24:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E898E10E702;
	Tue, 24 Jan 2023 21:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DDF10E702
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 21:24:29 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id j17so25641164lfr.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 13:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2iPkwkhcnBowRQHKIi36TY+p4NIF9M/qZNlpyR+HwW8=;
 b=MhwyQzParKqr1uuB0R3T6yUcEvJGRcoJ0sfabAiJMLPlOuj96wNiRFJQ+VwIjvAe74
 5Nk1Knxp00JP8J4m5j/Pfbhnml6UBeX7ptyiGiD71v9ayxN6Dvr0aQBbwUVGgdEPnqCb
 B4TCUoEWG95mVljltCtIaeXNX/HkvmeKSWlRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2iPkwkhcnBowRQHKIi36TY+p4NIF9M/qZNlpyR+HwW8=;
 b=ymGg847q56EbyrFq6DcoHCEHAZjwBo7TbOaKz04lRczX/TZ2WL57L6MMYDW/D5DYk7
 dy3M+sSm21nbJMQivt2eltYTM1NjLZ+JfOj0cp1VQyPeAJHYe32D59JXtx/KLlyc+6v5
 uTsp9VkYaj15pY3KRpDfTCtoJwGBAedcUHzqTrzw2S5UAHDL3uM9wPxWQBxk66S+EeNq
 8t/EMKCkW2xYssvZLUYygHvSlo1L0nBIX4qZddTjfQgRXBbwpkwyTVbiJ4VlDoZVQOik
 N4yBRRRN+Q5xWN93ptOcJilz4VQ9MCQBy61boXPCyCPeOvFFTj9VmFw3Rkx63U5o6+PB
 +gUw==
X-Gm-Message-State: AFqh2kofPlgstYZcSUfq7wYTu8L3KMl5N5fltGznU8+95kkh9FCIrtVg
 3yN0Dhb4NDFPGKX8/FfJ2Vk/mHj9w80OQJ9DJDkp6w==
X-Google-Smtp-Source: AMrXdXtcl+2cMljDftQoH/N1RiskSCdfF6R1azWAx9xkgbRFfRy4sBrycF55b24pNNRkCASmifsvpPBgFx+smhVFrYM=
X-Received: by 2002:a19:7517:0:b0:4cc:9907:359c with SMTP id
 y23-20020a197517000000b004cc9907359cmr1174121lfe.465.1674595468042; Tue, 24
 Jan 2023 13:24:28 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-14-jagan@amarulasolutions.com>
 <43f4a7dc-a4cc-7552-1a6d-a2a49fae6020@denx.de>
 <CAMty3ZBZWERT=HpjSepSaFbpKpwZUvuG82s6+z7EgDRY5D+TFg@mail.gmail.com>
 <fb7dfb89-42d6-139e-7ff1-4985838e222f@denx.de>
In-Reply-To: <fb7dfb89-42d6-139e-7ff1-4985838e222f@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 25 Jan 2023 02:54:14 +0530
Message-ID: <CAMty3ZAYz=XEN6s1XhBWg5b77kk+s942qa9Oz4E4oHtSfaVZtA@mail.gmail.com>
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

On Wed, Jan 25, 2023 at 2:42 AM Marek Vasut <marex@denx.de> wrote:
>
> On 1/24/23 22:01, Jagan Teki wrote:
> > On Wed, Jan 25, 2023 at 2:18 AM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 1/23/23 16:12, Jagan Teki wrote:
> >>> Enable and disable of te_gpio's are Exynos platform specific
> >>> irq handling, so add the exynos based irq operations and hook
> >>> them for exynos plat_data.
> >>
> >> If this is just an optional generic GPIO IRQ, why not keep it in the
> >> core code ? TE (tearing enable?) should be available on MX8M too.
> >
> > So far the discussion (since from initial versions) with Marek
> > Szyprowski, seems to be available in Exynos. So, I keep it separate
> > from the DSIM core.
>
> Isn't TE a generic GPIO IRQ ? If so, it is available also on i.MX8M .



-- 
Jagan Teki,
Amarula Solutions India Pvt. Ltd.
Co-Founder & Embedded Linux Architect
405/E-Block, Sri Lakshmi Shubham Arcade, Chandanagar, Hyderabad - 500050, India
M. (+91) 910 009 0959
[`as] http://www.amarulasolutions.com
