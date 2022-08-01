Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FCE587446
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 01:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C33F10E116;
	Mon,  1 Aug 2022 23:12:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59E410E116
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 23:12:09 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id z19so11855610plb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Aug 2022 16:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vcne+DijzvkGGojl7ODwtHBhru6f6mHbW8Yh6JWpaSo=;
 b=BSFh9Y/3Bqf/eS6bf/VCEmnc4PQDR2RyCgFyqmlEFpQpCNlbiH1W0gCWFDtQ7rUKT9
 Kl93q+bIPvOnfXkMMWeMVnZuTXEaO4BXGXKTibfb5rBQ8tvlJd80aS7YXjl9Wjxr0VQt
 53i2nwUa9LLbSM4WpBK6CG3zOKyeTykIBaXoVQsjaNFLRSqzoIaQ/z6mkjeWlgcETkhz
 04vtV67FjJCyiiUA+NQsymzh7cRXmXYoX99X9hwG/PMyyHqZDxB30IPXvcJvQXMryq+f
 3krV0vPaUpSNlT7vywfNl+nuXcT9dkBniEyn7b8QncxUhaFwZZawz1xry3cj99hUKBO/
 vkuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vcne+DijzvkGGojl7ODwtHBhru6f6mHbW8Yh6JWpaSo=;
 b=fkGmsXqWTb36lgDBxc8rFz9id7ouo6P4mBd6YUnnqtseq4U/kaQ/LUnjEga7VNDLVB
 TaB+mOrC83D+ON6xBXm9eYXug2+YPBj/uxLTr99CpttB2HXOePo5SgbEGr+lCUBqHb6J
 neUHplyYri6PCXpkCH+nVnaeM5twHt+bUB4zPRYT2GXK7c6h4PjW0ZWWiKyrqOTIh8Ps
 35Tiz7KWm8NOSJYrG3NVFg0VayxAl8Z48/jkEVgZRvhpMKZDKMscVYzoVeV6MonALpxL
 8Mk5efKE9I5EpSTDND5WBOQ/koQTtdKQywQqOQUm6KcDsjzkkQDyz9/LaXuAJubOyayM
 b/BA==
X-Gm-Message-State: ACgBeo0PDFvMGPUPyBESzMxQvlFCwZ+/P+FyW7cI08x5zPMHlvmTsszP
 8NF9kTLgV5HVEoEC/RVnsnLi/SBhgiM1cDOdbpo=
X-Google-Smtp-Source: AA6agR5MQkRVnpQvn23Dqex9iHEwjfhYODOQ7uDrOBdjfp44M0noFu3cGl/T0SboflHe+rhf23b2iHPvWRoDJuJ2liU=
X-Received: by 2002:a17:902:e746:b0:16e:f7cf:671f with SMTP id
 p6-20020a170902e74600b0016ef7cf671fmr4205003plf.168.1659395529356; Mon, 01
 Aug 2022 16:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xJ=N1vWVTBjArskJ59fyaLzmAGWfc0E=_iGizrDNR_Udw@mail.gmail.com>
 <CAOMZO5BAheG4r1Umnd7bLhOqezsxJgE0x1c-858EcabbpPm6Pg@mail.gmail.com>
 <20220801225538.qtdb5zd66g6ipewz@pengutronix.de>
In-Reply-To: <20220801225538.qtdb5zd66g6ipewz@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 1 Aug 2022 20:11:55 -0300
Message-ID: <CAOMZO5DUTxQKbpTVOgaVC0V7hPqJG77sgmkW8p=aNpG8th-aLw@mail.gmail.com>
Subject: Re: imx8mm lcdif->dsi->adv7535 no video, no errors
To: Marco Felsch <m.felsch@pengutronix.de>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, robert.chiras@nxp.com,
 laurentiu.palcu@nxp.com, NXP Linux Team <linux-imx@nxp.com>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 Adam Ford <aford173@gmail.com>, arm-soc <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marco,

On Mon, Aug 1, 2022 at 7:55 PM Marco Felsch <m.felsch@pengutronix.de> wrote:

> Question is, does your setup work for all modes after applying your
> patches and without using the NXP-downstream porches settings? We also

Without Frieder's patch:
"drm/exynos: Fix horizontal timing settings in MHPORCH/MSYNC
registers", I get no HDMI output.

Regards,

Fabio Estevam
