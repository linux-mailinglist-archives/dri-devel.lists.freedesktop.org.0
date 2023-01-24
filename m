Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D41AD67A482
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 22:01:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 148FB10E253;
	Tue, 24 Jan 2023 21:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A346310E253
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 21:01:48 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-4ff07dae50dso191367317b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 13:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3G0KBOpll5yzaJduvaF+qGkdsYlRvm8JqRhMLU9isTo=;
 b=CSlQHmq9300PGQqIBUvS0MxrxWJDOmqpqiXWpi29J2zDxL88tX4vxwxYM53gG/Vwj1
 3aFrym0TtCdWSUUS8XW354YMxkHosDktcAi7Ty4OOOFfTKvZN3ad4PsScO0NccUNEa/b
 Iw3gR+tXs+sBRfk7HS6MTPkvjTzMQSl0IJTZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3G0KBOpll5yzaJduvaF+qGkdsYlRvm8JqRhMLU9isTo=;
 b=6EyZcTfDqp47RaNTLOTvpx9ikrF+nwlI9kPOrCjfio2K/pV+dvLnHWpA2XfFRXhEOH
 xoQAuk/8/KgwZD2LPQ/Nb7B9J9TUjGXaPvJn3bmtgBEYx3hKEhjPCANC+wk8KQ/ULwxR
 Kbc+XEDWSpZbXHaRzB2yDps23961cV5uIRCGiED+1st02ySED9+r9zUFCzP5lJ38slci
 kfy2VOZyPaBssSDvXnt4PA6ADRpAVgrOTJXQZspPAmPVyG9bjPhnB6ICDDPjPTYEotQ1
 GCPJkMB0eRJl7l9a+VyIOafx5ri49boa1DM/eFaTBWo1JeonQIrGXpeTb+YR6cE/SxvD
 yjAA==
X-Gm-Message-State: AFqh2kqU84+xDgS1Bt+oJM/bmMY8fz6LYsNrwavDqi0zGeyFXT1HuqgY
 kTf+DrlaOJPYRAvhSKmqOQlstNv0gc1Jne15zAtliQ==
X-Google-Smtp-Source: AMrXdXunOp69Qe+oGJdmhaszyj6MV1dHwRWxkQhSpimYhYvfwQSniHZ8LGLXrEB1TVKNLAUTxlgXSOccy0JXdgFsCXA=
X-Received: by 2002:a05:690c:852:b0:4d7:eb11:6bf7 with SMTP id
 bz18-20020a05690c085200b004d7eb116bf7mr3490967ywb.235.1674594107810; Tue, 24
 Jan 2023 13:01:47 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-14-jagan@amarulasolutions.com>
 <43f4a7dc-a4cc-7552-1a6d-a2a49fae6020@denx.de>
In-Reply-To: <43f4a7dc-a4cc-7552-1a6d-a2a49fae6020@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 25 Jan 2023 02:31:36 +0530
Message-ID: <CAMty3ZBZWERT=HpjSepSaFbpKpwZUvuG82s6+z7EgDRY5D+TFg@mail.gmail.com>
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

On Wed, Jan 25, 2023 at 2:18 AM Marek Vasut <marex@denx.de> wrote:
>
> On 1/23/23 16:12, Jagan Teki wrote:
> > Enable and disable of te_gpio's are Exynos platform specific
> > irq handling, so add the exynos based irq operations and hook
> > them for exynos plat_data.
>
> If this is just an optional generic GPIO IRQ, why not keep it in the
> core code ? TE (tearing enable?) should be available on MX8M too.

So far the discussion (since from initial versions) with Marek
Szyprowski, seems to be available in Exynos. So, I keep it separate
from the DSIM core.

Jagan.
