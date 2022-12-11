Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F182649290
	for <lists+dri-devel@lfdr.de>; Sun, 11 Dec 2022 06:48:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C20710E091;
	Sun, 11 Dec 2022 05:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60C310E064
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Dec 2022 05:48:23 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-381662c78a9so104607097b3.7
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Dec 2022 21:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=k65HKQ4QsOLEKRFSAAwmrlaySPBMcA+krHdRpgmUHq8=;
 b=WT5FmpHx3gP/2F9fOP/OzTFEOuB/reCESWb8Gz+V0Av4ZCCdeJ2noh8MhG9h/xeiDZ
 uhWWRSCZgtN5IN7p7u/rWFSEi4GhNLneqvDXI41q+0jDm9bwQXIwIDONauFA5uDjJYOG
 H/rqtRQCyQlxq5PJC/oRggsAf8usmN6dJf2V8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k65HKQ4QsOLEKRFSAAwmrlaySPBMcA+krHdRpgmUHq8=;
 b=JZEi/biv29QXUeMCqc56QJoForn3m83zYyPFgW9onsyJd2vbqC2SiFzfLUISH5VoXC
 NiE5BzytkqbFDSk+0QleOL4HY12lrAADDl05b9ANgCBn3MozQP+fV71faQ3eC2hEwWzW
 0vCMMMs9p6yuWW8+UIso4VxHrMyvpmR0MrSsGneqR3KvSk1tdKVL7oSD9yZDehoqvcrb
 Y+rLhuqoEMwai2rzgsMhLZASU30ggJNE5fRlHuNEOhL2mmO6ROGmn41UYZe6CJIRXGSn
 gHjS8HawTscJ4Seo+p5kNYvc7OVVufsccHwA9B2gWppzsYOkUmnhoaCcU+zsvpWiHdId
 EBSw==
X-Gm-Message-State: ANoB5pln/KFPrieE9h918bOlF5y9nM22oqv8vmEbbAseQfY242NpE/Xq
 62s5PlythY3FioDCbuvEU/9pxgR4mMVU4Eo8lbaA/A==
X-Google-Smtp-Source: AA0mqf7NJDIXXb3U/76yXnuQAR4j2ELErehHZxueLD1ipjEBOHDsiXw/utcM1K3c4TqRcJToedbz0rxKDVSqiG0LF4M=
X-Received: by 2002:a81:1a4d:0:b0:368:75ab:a50e with SMTP id
 a74-20020a811a4d000000b0036875aba50emr24993783ywa.235.1670737702965; Sat, 10
 Dec 2022 21:48:22 -0800 (PST)
MIME-Version: 1.0
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
 <90c2e63d-138b-502d-5188-da49196e0ff1@denx.de>
In-Reply-To: <90c2e63d-138b-502d-5188-da49196e0ff1@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Sun, 11 Dec 2022 11:18:11 +0530
Message-ID: <CAMty3ZB7imKgS4ovyPfi5OMSHeBN=-hesTk6K+kuM-a+SvxbAQ@mail.gmail.com>
Subject: Re: [PATCH v9 00/18] drm: bridge: Add Samsung MIPI DSIM bridge
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

On Sun, Dec 11, 2022 at 7:58 AM Marek Vasut <marex@denx.de> wrote:
>
> On 12/9/22 16:23, Jagan Teki wrote:
> > This series supports common bridge support for Samsung MIPI DSIM
> > which is used in Exynos and i.MX8MM SoC's.
> >
> > The final bridge supports both the Exynos and i.MX8M Mini/Nano/Plus.
>
> I wonder if it would rather make sense to split the series up and submit
> all the various partial fixes and additions separately, instead of
> piling them up in this series and ever growing the series.
>
> It seems to me 3..5 and 7..14 can just go in before the rest.

Only 4 and 5 come under fixes and the rest of them seem dependent on
the series. However, 4, and 5 are reproduced in i.MX8M platform hence
I have added it as part of this series.

Jagan,
