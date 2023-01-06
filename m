Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1CC660262
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 15:42:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D7010E03A;
	Fri,  6 Jan 2023 14:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E4510E03A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 14:42:27 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso5429288pjt.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 06:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RccYbfVcssWI8JrbnkcP0iz0oYEwSN4A0FSBKTl5QUw=;
 b=XgO8YsS6101Qjh+VG5PC2dkE/6AfmrgOyOa8YZ67wya6AahFAFNmFLmQQCcKNDtX+U
 AHDXsu6W33dqhO/odm8vdbrELgLeL6Ho4GZiJ1SoNUerynSPufGKBg6mE6IFwzjhMKru
 y9cDxurHKhgMJVlDLI9A5GnoFrcGdWuH/Gem5IDTaIT/udlI9GEQW6oe4hi++q4nNI97
 a/o9AFgQPfVy1y96BGO4N3v9tnOwceH4Yh1j3hGwrYNcrWl4Jr46ad6ohM/hif4sj1Na
 4H1FUA3uq0OdGEKfIhLS29bwSeOEbMXcvterqgK7/aP0QHOn8EwW81L4xNO+BGm95xPs
 iBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RccYbfVcssWI8JrbnkcP0iz0oYEwSN4A0FSBKTl5QUw=;
 b=JHwYTtjwZrL7YAk9RrPb9sdlS0HfKfRDk5URumJ2cNcwz/vpT7sNFlyHCg0IWH+peo
 W0Dm6f6hfkx3Z9jfXuwfEMs3zeeUqzJoHRvuBZY+oIOqjOGWfQDeWK20AFRpBJvgH4ra
 ufOdD4i2+JG916CFuM0fGetaZDf/1q2+QiMc6NtusS2Tx3cakoEFPp8eUeQKd9NqwrQ6
 g22/G2hr1qF3IMsBOinVEZjJ5Px8i/+/Q5XzzGXEs/GhrPlvcCobc0xLszLLUXb84XR5
 vWKvQcbLDtb2sALzF7L3SSdXypsgGuMXaAfXdvYeO5u93oNuHLrbzzNy6ONPPulZwUr2
 sQeA==
X-Gm-Message-State: AFqh2kpkPP45DzbT5vkfEDaDhaMPAdXfIKJJaxutg12BH6PwWCUArUEs
 cULG0PycOUaj5GuUtAdUSfDxExIuNHTChZH68lY=
X-Google-Smtp-Source: AMrXdXtGC40H+GuM7hhnexrloMQ0F/5MohmVV5bpTfWwFpnf5yzM7NP4MroBenM7KLoGeQBq0Ds8FOeqRDDAaanC+6E=
X-Received: by 2002:a17:90a:6942:b0:226:228:3e44 with SMTP id
 j2-20020a17090a694200b0022602283e44mr2179725pjm.172.1673016147057; Fri, 06
 Jan 2023 06:42:27 -0800 (PST)
MIME-Version: 1.0
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
 <CAMty3ZC9TtnupJKF4LA9e-jnYMux28u4Pn3femJZXi4ogV+drA@mail.gmail.com>
 <CAHCN7xLyS8Jr38gNSyaRMEU3zYg04AhyC79owpTrHbbLf8cL5A@mail.gmail.com>
In-Reply-To: <CAHCN7xLyS8Jr38gNSyaRMEU3zYg04AhyC79owpTrHbbLf8cL5A@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 6 Jan 2023 11:42:14 -0300
Message-ID: <CAOMZO5ASNzpnosgNLQzwWbbGwOihWxCung0W9dZbdfyg-SPyPA@mail.gmail.com>
Subject: Re: [PATCH v10 00/18] drm: Add Samsung MIPI DSIM bridge
To: Adam Ford <aford173@gmail.com>
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
 Joonyoung Shim <jy0922.shim@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Matteo Lisi <matteo.lisi@engicam.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>, dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 NXP Linux Team <linux-imx@nxp.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 6, 2023 at 11:34 AM Adam Ford <aford173@gmail.com> wrote:

> I got it working on an LVDS display that I have, but I didn't get it
> working on the HDMI bridge.  Since we have a few tested-by people,
> it'd be nice to see this integrated so we can work on ading more
> functionality

Agreed. Hopefully, this series can be applied soon so we don't miss
another cycle.
