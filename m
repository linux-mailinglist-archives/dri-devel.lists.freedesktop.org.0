Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E4D675798
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 15:41:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77ACF10E033;
	Fri, 20 Jan 2023 14:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A9010E033
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 14:41:29 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id 123so6914834ybv.6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 06:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ody2VwbWyzJCEoTCrPWuZTMErMgICWUGOLVYILw0XoA=;
 b=Eae9Of/Ov1XhcCmov+o08TB7ndmw04F4U9QlIiHCWqegFzyQicvUpYy9ALP6GmPL1d
 Uil5SoEzJYNYz/MkJl9Yxr5yLe1DkJV6a4Ckzzpwo17R9IL5VIFdSr+z66Tqlqymp4VK
 wcegKTLIGammf1WrCXoPS18e3xYQlObfQJS9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ody2VwbWyzJCEoTCrPWuZTMErMgICWUGOLVYILw0XoA=;
 b=xnWJJ8y4oDtq6YyJ2fXEPnWCscwBO2woZGpuEV2QzL2bxlx2geoUTDPOfM7pvEXc1h
 6GVyCkhpHR/f0aHvqEsw6neSwZNfYvblIyjmuQK537BnPaMtNOLTyukCJvlqIjcGnQ9J
 UDAMLSLdEq2tq4ec7RHhbANNu14yyTN6OUHgP7YsTRvkFbLk+h3iGO3bHwQf1eRmlT5L
 wUl56bj4afDothScBQkJginrA2kjxKn9012y2ZTDLuo7bseK8XcDm9x1B7kj68ScIEyb
 efcsg0elUzW38Y6yy/JwuokZ5RyqeNgHjEZrvgtFo08un2hafzfyd4FfQSz10DDy1RU0
 xrsg==
X-Gm-Message-State: AFqh2krS5L0hoNuqDSqdQdEiSHZ0KtgZVVmDroa9PTWMTrJTIQZ+sRji
 2F6H7HyKFK9AiPW07Q5axsFz6ZWLHGxs9wYsICzmRw==
X-Google-Smtp-Source: AMrXdXs+dnVURFc+udtKNceuDm29bsMaET8vGrIITAFJcxpO5SeW7X85UMxRmvAoWDnQk+iWyE1bwHwtLPEi+HNOqTE=
X-Received: by 2002:a25:ac66:0:b0:800:5d4e:8063 with SMTP id
 r38-20020a25ac66000000b008005d4e8063mr353173ybd.126.1674225688483; Fri, 20
 Jan 2023 06:41:28 -0800 (PST)
MIME-Version: 1.0
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
 <CAMty3ZC9TtnupJKF4LA9e-jnYMux28u4Pn3femJZXi4ogV+drA@mail.gmail.com>
 <CAOMZO5AYzZXQ_7jqktKrGcZyE_CaZHZpfyQPWAzbcxGvByH5Kg@mail.gmail.com>
 <CAMty3ZDnNJJQ2=Xbi6tNDzp17Ye=mnVhPOEtWVZbZuot_N513w@mail.gmail.com>
 <CAOMZO5CXCYjmmjs97=c6pVzyG8s0W=XN01k0C_0M_X2-pCFuMQ@mail.gmail.com>
In-Reply-To: <CAOMZO5CXCYjmmjs97=c6pVzyG8s0W=XN01k0C_0M_X2-pCFuMQ@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 20 Jan 2023 20:11:16 +0530
Message-ID: <CAMty3ZAc=t5FEphQkd=O1eaA70-779zhESwPFqoiGs8x569H2w@mail.gmail.com>
Subject: Re: [PATCH v10 00/18] drm: Add Samsung MIPI DSIM bridge
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

Hi Fabio,

On Fri, Jan 20, 2023 at 5:36 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Jagan,
>
> On Thu, Jan 19, 2023 at 2:59 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> > There are two patch series prior to this need to apply.
> >
> > https://patchwork.kernel.org/project/dri-devel/patch/20221212145745.15387-1-jagan@amarulasolutions.com/
> > https://patchwork.kernel.org/project/dri-devel/cover/20221212182923.29155-1-jagan@amarulasolutions.com/
>
> Would it make sense to re-submit these two patches as part of your series?

The previous version's comment was to separate them from the DSIM series.

Jagan.
