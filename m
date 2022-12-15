Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D69D764DA81
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 12:39:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6269210E0A6;
	Thu, 15 Dec 2022 11:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7581610E0A6
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 11:39:28 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-142b72a728fso20558510fac.9
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 03:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yJRvwMAk47d1d+Rj/Ks/R3isqSE7sPbBB85HHuRrV0o=;
 b=qDcjtGRf2kzm8mpJXHsgYZk0y2r0mZwZ8AyGpm6r1BT+NVCt8h6vWmnzp8CU/QzFGd
 awgbeAyjgP1WhIzirBa8LuiFqSFBwmeyVUBadNFJ1VkBkvYox202LdJYy/HAuvwsv59P
 0VZB+Wzayh4YRXumgI/jbYzThd3ykix5KcgaqUmv4Cv3B3jn9MTrH0hERp4o1GtCXcn/
 SUiTBHaKUTIB4rtQ5gQyspWfRZV/2NRpM1OY90yY7g6AkMIFmAxKEcmZeWyiDe5qTJZS
 Xd6PXRla5P8CPFoeus0G8dS9yhbTj4wWo5XVi7ZfCaCttQgJfMQ2B7q4fM3e4iSYAuuA
 rkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yJRvwMAk47d1d+Rj/Ks/R3isqSE7sPbBB85HHuRrV0o=;
 b=Gnf0MF7o7cTYr/ScOLu5iMc6YQgm1vWv4oedW/RcQ+Xg9oJBwpKMVlxfdz9QSBNgn0
 Qnmav5vWKKevG9ePykiH6zKBQDPflWEMgOdZP2YKe0TSM/QBGifgsGc9no0CNa5btIAz
 QzJYS7mUiKgluQQnKTeIqOhgh6AERhwt0XBly0nFb7EhD9d/BYKHk59YaV4qyyAc/6JC
 Umx1/K2JkF4VTqGidjTEpe6nBMLmKSCzZHcPJl+2auHCLdTMGw+cQNi/sWeCnyvCQ7sK
 iGeepX89GiWmc3kJflBkMM+Ssrj9FB24EGckOeuijCrl2DYuW+wQGzWftJTe2mwDaHaN
 lLng==
X-Gm-Message-State: AFqh2kqo8iUAVbR/Wcp7HRw/JtnS8CAJWMRyE5Y20ri//NrELpt7XIL+
 Z2Ruw1HqqG9Mb++ZfmxcHRRdd6pugjTyGKJdKVrH3w==
X-Google-Smtp-Source: AA0mqf5+8oomt5/aC+bnm7+gK9sejDVAUdUGVYkHyFYont6AiCTu8+BUdmqeeX60AQG5vFFqmkT3M34m60jCbPk8v/4=
X-Received: by 2002:a05:6870:9e4c:b0:13c:33d0:22e2 with SMTP id
 pt12-20020a0568709e4c00b0013c33d022e2mr597733oab.14.1671104367774; Thu, 15
 Dec 2022 03:39:27 -0800 (PST)
MIME-Version: 1.0
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
 <20221214125907.376148-17-jagan@amarulasolutions.com>
 <7a58566d-9069-bc65-9a87-e79404d05e0d@kontron.de>
In-Reply-To: <7a58566d-9069-bc65-9a87-e79404d05e0d@kontron.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 15 Dec 2022 12:39:17 +0100
Message-ID: <CAG3jFyvoWUfa9qHme6-EDMCrXH54QmU2EeCvi8mkX0PoWA_bPg@mail.gmail.com>
Subject: Re: [PATCH v10 16/18] drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano
 support
To: Frieder Schrempf <frieder.schrempf@kontron.de>
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
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Neil Armstrong <narmstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 15 Dec 2022 at 10:22, Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> On 14.12.22 13:59, Jagan Teki wrote:
> > Samsung MIPI DSIM master can also be found in i.MX8M Mini/Nano SoC.
> >
> > Add compatible and associated driver_data for it.
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Acked-by: Robert Foss <robert.foss@linaro.org>
