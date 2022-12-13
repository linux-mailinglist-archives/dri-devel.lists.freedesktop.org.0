Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF92964B3A0
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 11:54:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDCD10E2FF;
	Tue, 13 Dec 2022 10:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA2D10E2FF
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 10:54:10 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-3e45d25de97so186160557b3.6
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 02:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MXsAlPTFFvncdyXw2byeMeo4fFQE5YBUhXEkgIML2YI=;
 b=am9Tg4PQBmIbp0qQ+gJHc4g1F/mNW/noZZqMWeRbdyoTLhuQDOU0IR6X45MX5R8rzL
 XeKQFa3Mh3Zs1U9s3WfKJoHs8XHaYF/vEFy3AbTZsJWjBVB2HOHHXf9QrFwaMTlgmduS
 bF2ljD3jsIZ1vKP4i26UzFNdIXqRRLolH+SXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MXsAlPTFFvncdyXw2byeMeo4fFQE5YBUhXEkgIML2YI=;
 b=xyYDvocd4zugH9q8s/LRz8llyt+kSJK7hWH1MPtUB3M4giVHaxuYwcJ8xRVTDZG32y
 UDYd4QzrJqFBMveUUpAV7SvuQPcYe8H8+oRYWkwoELuLJqvcvKaqN18BdRjV6SKdQJ7b
 M8FvrxpbWLuS+nfBR1IZrNoRbEwtgZNjZzCLXIre9JSl4AIP7UMBYfn+nIKMPh4m+9c8
 mjVLe3r9qoAmJIS9YHda7vMP6q1+j3U8lZnjr5CwiJUsJaT0pCnKPETfUBVkywE74q8b
 PZ7QEzrTg9FOmH3S2z4T3sdCZRPc3vXQBhPLFsMTm26rNK3KiaeIKPjI1enye1/dg2Ad
 iRZA==
X-Gm-Message-State: ANoB5pnOqgP9DIf65HQuaC/KTEs3Ppn+epYDVSzGhCVPYg/saG2nyVHK
 a80hWQ1s7XQFNGMSaPmGOZRZdv/B/hIfP/gRGZL7zw==
X-Google-Smtp-Source: AA0mqf7iw8iRtzG5evBmzQAbWdt7RxfkRTJ+sPenp2iurCIb0Z8UUU1DaUSR6lqSJdWaduAY4ptn8U2EQCZFzSb5c+Y=
X-Received: by 2002:a81:9a13:0:b0:398:ab7a:aba9 with SMTP id
 r19-20020a819a13000000b00398ab7aaba9mr21032401ywg.106.1670928849851; Tue, 13
 Dec 2022 02:54:09 -0800 (PST)
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
In-Reply-To: <CAOMZO5CPfgYUhXO_JZJvVBoFpddw+LHbd58a2TzPd2nWjzx_rg@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 13 Dec 2022 16:23:58 +0530
Message-ID: <CAMty3ZD6fVps-PE=iNR2Zr0_qz--h4wcjO5Wa1czA7w7VN2SqQ@mail.gmail.com>
Subject: Re: [PATCH v9 10/18] drm: bridge: samsung-dsim: Init exynos host for
 first DSI transfer
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Matteo Lisi <matteo.lisi@engicam.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fabio,

On Tue, Dec 13, 2022 at 4:17 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Jagan,
>
> On Tue, Dec 13, 2022 at 7:40 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> > https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v10
>
> Please preserve the authorship of the patches.
>
> This one is from Marek Vasut:
> https://gitlab.com/openedev/kernel/-/commit/e244fa552402caebcf48cd6710fd387429f7f680

The original patch was changed with respect to this one and that is
the reason I have to keep his signed-off-by.

Jagan.
