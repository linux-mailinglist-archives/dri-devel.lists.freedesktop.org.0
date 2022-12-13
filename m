Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DA364B61C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 14:26:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0564710E311;
	Tue, 13 Dec 2022 13:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C273510E318
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 13:26:13 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id j206so17579734ybj.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 05:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6wqJWLbRDpMVRcqYYnGe5+MeubHOK6xVgmSXJipG9Ds=;
 b=AYL8AUr3YZu5xrJ8GSlSeroVIrQY2fD0Q8nHE/pNg/DRPJu6l+UVgUSmQJhJz6D734
 6wq8NofMna9asvu51dRywNQylES3dYbluo44MTLPw1/J+5xKE+hg3jGgDJ28f85uk1hX
 ICQE/LpvXGnqw5DWspSWtNR7JZcOPZq3p11m0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6wqJWLbRDpMVRcqYYnGe5+MeubHOK6xVgmSXJipG9Ds=;
 b=qhYV4RXNfhaUmtMUffqjBOi5Ae8N0uKwwdw78nHtpjIcVHq1PLIb3jmyl1Twvin0H2
 7TtRpdULXFZYa5G1DWOBrmMGeCkRxnK9bA7Bwqd8d2rLq8xg4bUgjtCmTBHfFuSlkb91
 HTOBMogZ5uSZxuhCK9mx7CNlPtzbpyOhrHIo1ZDJiipaFxOUo85b8+OKEyIv/o3H+17T
 zLfa/hXR1uQ1m5uFlZecMoAiEEZFPraHaARrFtK+EAn0vW3S+JJ6e+bUvTb+fCXIH7hV
 RhsBp6gqQ/kEr6LwUVfD1+hq3/Ajg4q1WrAvxUnmVIcLVQYFiapYPAaoMXKBKLx2MD4r
 pGYg==
X-Gm-Message-State: ANoB5pnDOaY96w0lpEP+ldyKnO1YP+560jxM0qJRcyQgaDksUMY9mTKF
 S608KyM+pr5buchdhwjKv1WfdlZr8iKiculnjJpQvw==
X-Google-Smtp-Source: AA0mqf4409n0qZFrLSWqzuanaiRVGOXDfCMgU6vhZvGURhfL2DHT6R6DlRGW5rwa13df/GtgjvZVq/1zThiUqgnxqpY=
X-Received: by 2002:a25:e648:0:b0:6f2:bad:1be7 with SMTP id
 d69-20020a25e648000000b006f20bad1be7mr64408457ybh.84.1670937972905; Tue, 13
 Dec 2022 05:26:12 -0800 (PST)
MIME-Version: 1.0
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
 <CGME20221209152722eucas1p2534c4e4837d3006683fc57c0dcb1ab52@eucas1p2.samsung.com>
 <20221209152343.180139-11-jagan@amarulasolutions.com>
 <df99edbd-7150-7274-2c5e-fe6d4ed4d92d@samsung.com>
 <CAMty3ZCCscqE8e_Rr9KpmUONxh4aCBWB7qh4xSvuCGrUT4kUeQ@mail.gmail.com>
 <b1e38212-985c-21c9-58a5-7504719c3af8@samsung.com>
 <ed13b791-ab47-7aaa-7993-bb49478e7f2a@samsung.com>
 <CAMty3ZBzpmwAV7e7wdBu+GOmg6M7xqqc46QtGzuLsnv2kT0Zdw@mail.gmail.com>
 <395a4762-70fe-1caf-579f-2b5952232470@samsung.com>
 <CAMty3ZABHUjSHRBR6RCnyE19HOWknw67s__0WBKgMnX5nQBy9w@mail.gmail.com>
 <CAOMZO5CPfgYUhXO_JZJvVBoFpddw+LHbd58a2TzPd2nWjzx_rg@mail.gmail.com>
 <CAMty3ZD6fVps-PE=iNR2Zr0_qz--h4wcjO5Wa1czA7w7VN2SqQ@mail.gmail.com>
 <9913c39b-5a52-0b45-eed7-4bdc860aa877@denx.de>
 <CAMty3ZDpYRSTN2u7jg4faKRZwP-CvR52FYe4dZ5GPCpQyuPHXw@mail.gmail.com>
 <35d8e467-fc6d-3b5f-225a-9a11596de771@denx.de>
In-Reply-To: <35d8e467-fc6d-3b5f-225a-9a11596de771@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 13 Dec 2022 18:56:01 +0530
Message-ID: <CAMty3ZCuzx9a1dx2L8FM9z8n8YoY_gWdCn=s-jLCVDfF98NzCA@mail.gmail.com>
Subject: Re: [PATCH v9 10/18] drm: bridge: samsung-dsim: Init exynos host for
 first DSI transfer
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
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Robert Foss <robert.foss@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 13, 2022 at 6:51 PM Marek Vasut <marex@denx.de> wrote:
>
> On 12/13/22 14:18, Jagan Teki wrote:
> > On Tue, Dec 13, 2022 at 6:44 PM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 12/13/22 11:53, Jagan Teki wrote:
> >>> Hi Fabio,
> >>
> >> Hi,
> >>
> >>> On Tue, Dec 13, 2022 at 4:17 PM Fabio Estevam <festevam@gmail.com> wrote:
> >>>>
> >>>> Hi Jagan,
> >>>>
> >>>> On Tue, Dec 13, 2022 at 7:40 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >>>>
> >>>>> https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v10
> >>>>
> >>>> Please preserve the authorship of the patches.
> >>>>
> >>>> This one is from Marek Vasut:
> >>>> https://gitlab.com/openedev/kernel/-/commit/e244fa552402caebcf48cd6710fd387429f7f680
> >>>
> >>> The original patch was changed with respect to this one and that is
> >>> the reason I have to keep his signed-off-by.
> >>
> >> You did change the authorship of the patch, not just a SoB line.
> >> It seems that the only change is dropped comment, which was squashed
> >> into earlier patch in this series, see the original submission:
> >
> > OKay. I will update it on V10 or if you want to send it from your side
> > then I will exclude it from the series. let me know.
>
> Just keep the authorship intact, unless there is significant change to
> the patch.

Please confirm it.
https://gitlab.com/openedev/kernel/-/commit/8ce066d7fdf45e17cb1979376e70e6be353e001b

>
> >> https://patchwork.freedesktop.org/patch/507166/
> >>
> >> btw. it seems hunk 3 has disappeared, the samsung_dsim_attach() hw_type
> >> check.
> >
> > Do you mean previous = NULL; addition?
>
> Yes, this hunk has been dropped.

Yes this FIXME has dropped due to Dave's changes.

Jagan.
