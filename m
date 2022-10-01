Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1205F1C9A
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 16:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E3310E3E6;
	Sat,  1 Oct 2022 14:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6024110E380
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 14:10:36 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id nb11so14299165ejc.5
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 07:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=rv9v4/MvmxXgWjEpXGV9Xie7FP+raCUsFY7ppiKksEw=;
 b=dFg8ghrgAKkB13/TtmR/Vjj721I+ko7PX0Hz7zoEKqWNh7c/pVdb8JhcTIGx2akXWN
 VD9OCcIfx98oziHI47xQL30633GzDV3Js9fHCpRfkoEtiLpVCa5cIf4RhoUH/P3lJufu
 riC3gXYWXEWIJMxm3Nw6/oZW7HThJEnUmWvA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=rv9v4/MvmxXgWjEpXGV9Xie7FP+raCUsFY7ppiKksEw=;
 b=L1iooFbigTkaGQzTCGNBqE9C8yR7nz7GwFh1LH2l9BrGzlxBHmVVoFXa4YvP+j9Lj2
 Uw2Xe1NgcAA/yX3rBqDxjxSOkwLz5ZFtvZEuMMyCoPDnUZjzynu4oWzt6MYBDthDPmS0
 wvzRX0Ezj0xt7kwtIIcT/M05JMzCRMI/BymH19jWkrO4FHZ9CTwa3kmymPna7GB2tKJ5
 Aw4ox4/9g+kFSGGnOI5HBzB1RIESRWrjUxGd3Uhj1UNesMDn3CtoqBhzbBZxMGzhEf8R
 9VLDArXh9v4Wtd1Gw+8grNaAO12wWK5Ouz3YrjET/nlqPO7ssuP/xkZzQ3k/DIzpZMmu
 c7IA==
X-Gm-Message-State: ACrzQf0/76XHhMgdbfx8mPIujeH5AyvX0FZJMsuiu9FnK77xt+/aJZO8
 U4nEjDe17hSAYXFGzw0KBErlwaEu0VxbXVNAbzC3uw==
X-Google-Smtp-Source: AMsMyM5Bq2zk++cz6cWiLLFhqRnpHkI1zCBsNf0KdVzYn+L0vlghw/z5j5mMBy0amI480ZeRhNzsTwfyKhDeDlLAI+M=
X-Received: by 2002:a17:907:608d:b0:787:6e75:5111 with SMTP id
 ht13-20020a170907608d00b007876e755111mr9915872ejc.760.1664633434877; Sat, 01
 Oct 2022 07:10:34 -0700 (PDT)
MIME-Version: 1.0
References: <20221001080650.1007043-1-jagan@amarulasolutions.com>
 <CAOMZO5CsDePtApxwU1RCJj+BJkDuWj-bCHx5SkWO-e5zf7PRBA@mail.gmail.com>
In-Reply-To: <CAOMZO5CsDePtApxwU1RCJj+BJkDuWj-bCHx5SkWO-e5zf7PRBA@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Sat, 1 Oct 2022 19:40:23 +0530
Message-ID: <CAMty3ZDqKvqirC3WQ7cpVugF3aw9Uhte6H7bDkaa29ur+4NWqA@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] drm: bridge: Add Samsung MIPI DSIM bridge
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

On Sat, Oct 1, 2022 at 4:04 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Jagan,
>
> On Sat, Oct 1, 2022 at 5:07 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> > Repo:
> > https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v6
>
> This URL returns an error. Please double-check.

Thanks for the notice. Now it is accessible.

Jagan.
