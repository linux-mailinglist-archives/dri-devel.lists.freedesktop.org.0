Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E93155F1BCA
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 12:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5689810E374;
	Sat,  1 Oct 2022 10:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47AC10E374
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 10:34:52 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id h10so3231059plb.2
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 03:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=jsxWmcwphpybL3dC3x6YCHCFp2gYnWKEJjkthollSQ8=;
 b=ePqSJD+hpGkOh8FKrnQQplyy9nV0YG/tXs5I8bGy3q9xHBc0Ddryu9Mv1wbgB3mlGJ
 eUjrtikRanvO7PwA8p/UWAjRt3mq2FUZb1Uz7u0uJ7o3UOoLsi4rVRyXLMkegj2YOk4t
 ficzA6700XnGBsVKlo3U3EWMTw4J2Fxzd8WA05jqB816TJmPKz7RazgcmdYDJP+Fazxo
 ybYl9ZtW97YlEBHemKy8wZ3Tp4ARKUQrPW1aafdkcZwZUBw30kqSC/gDl/8pBzhssZbT
 2Up3qtB80u/LN/CopWH5GVxp0+0Uyl2Wzc57KW+sWUjH3kkJYgAiynX2yXkvA/SkiyHO
 lV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=jsxWmcwphpybL3dC3x6YCHCFp2gYnWKEJjkthollSQ8=;
 b=7MjipUxOYdmK/gv4b0JEDqd9W9bg+ZQOQO7bmT1ketv8w0VV0yjnQVEnNmrk2fBcmg
 wDXEkYSVx/OWeKDSYziEddmIp/ge1SMb2ixZ307orjN/kUzMZidUGB+fDmvRfD0xiYEJ
 4EYKxrFMR8rh6KKarYNX80rC2WLtTYrUOm6giWGnpA2B1YXrXku6RkX1Md/wqGA2uGGp
 8thYmMjcp9YZCpk+fodDsqS+/rKQ12nhyQp/qaQCeLF76mSfxj6OIv/4RsB/AHvzBY3e
 zlVCkRzb51ilarpzjHpcgRrwshdcij0/V/P8h9Df35R6vvY31bUGUmM5R0YNDQJoVT21
 eqPQ==
X-Gm-Message-State: ACrzQf3FfWiWgTjK5RbfqeWW0E8l75fswdx1na3oDXRp/4pHqhREqhkk
 Aq4TkQH2cpwnpvTjBv1hYc+NMIMC7c+JE6nU+ExOpq4JFto=
X-Google-Smtp-Source: AMsMyM5eOJEjCBWuJQFr2T8CTbIQxzVpeAMBWpD/N1SJ+Z1C0Rs9T0TveCvSOatrBw+Fu+YCypM/IeZb2rNX/oqxSSU=
X-Received: by 2002:a17:902:eb82:b0:17d:eb32:5ed9 with SMTP id
 q2-20020a170902eb8200b0017deb325ed9mr1320791plg.130.1664620492454; Sat, 01
 Oct 2022 03:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20221001080650.1007043-1-jagan@amarulasolutions.com>
In-Reply-To: <20221001080650.1007043-1-jagan@amarulasolutions.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 1 Oct 2022 07:34:40 -0300
Message-ID: <CAOMZO5CsDePtApxwU1RCJj+BJkDuWj-bCHx5SkWO-e5zf7PRBA@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] drm: bridge: Add Samsung MIPI DSIM bridge
To: Jagan Teki <jagan@amarulasolutions.com>
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

Hi Jagan,

On Sat, Oct 1, 2022 at 5:07 AM Jagan Teki <jagan@amarulasolutions.com> wrote:

> Repo:
> https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v6

This URL returns an error. Please double-check.
