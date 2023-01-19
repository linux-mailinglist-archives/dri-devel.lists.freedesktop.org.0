Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0935673FE3
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 18:27:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A005010E94A;
	Thu, 19 Jan 2023 17:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAFDA10E94A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 17:27:32 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 m3-20020a17090a414300b00229ef93c5b0so1750266pjg.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 09:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+yByDB22HCudt49W/UmVaOb7KMALvWI5oNh+3zy2EdM=;
 b=YysEOaic5JVNZ5gOMnYf04BSi94eSQzxcKt0U77fM2sd5uXJM+gIX3K0rZtfNlzJGK
 nLBpzOC8kIYXV/FMbakdlfEqaZliLn4b89TpA6xSCW6+hyt/1RB2zqH6IHmJrvLzvHyw
 8gr13J6nkfOS6bW4VzfthYQX0v+0698pOvCfdtjFsTaN/1dazGKEbDShKdt6KE2MXcxQ
 PzSsEPUmbbxMgxFwloIi6BLaMf3Es5/UVsb08Lf3fn34gQJn29+RL8U8TZAQzCk5/cZ9
 9zsv8LtzYh8UFNPI9AyaeucIXSevdwuwNpB6MAZjtdX86FE2wrLFzMWjLkah3+Wmrf31
 HT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+yByDB22HCudt49W/UmVaOb7KMALvWI5oNh+3zy2EdM=;
 b=16AU8nFDoXe+5g/2NCpcwMnLtqX3VKrutUQvpxPwKVGnWe0NySsOTBwKdd/nnbO9+3
 y+FBEGPRg4q3zFZKbtR4atoiui84HcZxxPKqmtxUkRJ81jYGRLDvp/bjF+uvjLXeAD8Z
 ml1VrouGXmfYJ437y4TEV9I8uwKvqvl64tSjn4KOLqvTOp2mquE6q2TACEssNMuh1gIU
 Wc0UcpTPT54NLKCFzGOOXBALy4z9YsFUTJqjj/ElvZ8/evKFcsiPuuEYuXp1fpULJQU9
 nF6G9TL8w2934n05nEvghbnUFgO52ZMTDqH/uV5QxgG9WgR067g/Aaud604L+0ihDYU/
 ox5g==
X-Gm-Message-State: AFqh2koxQofmTd9umt1Hzf/MkMlQUzw8DGa1y2+eV82ddd86+wB1FpLA
 C98W+p3hZEWnRVOnf7Bax/2dkrM2BPw7caSTssg=
X-Google-Smtp-Source: AMrXdXv/g8vYV6jhwbL6XrS6ExuEFvgvSA5QzaUfxtJGoTacWqzI+vDaZ0qiUZmd9vjmvVKxQXXMvEa6kSgqIXSflos=
X-Received: by 2002:a17:90b:83:b0:229:5037:d9 with SMTP id
 bb3-20020a17090b008300b00229503700d9mr1197103pjb.195.1674149252291; 
 Thu, 19 Jan 2023 09:27:32 -0800 (PST)
MIME-Version: 1.0
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
 <CAMty3ZC9TtnupJKF4LA9e-jnYMux28u4Pn3femJZXi4ogV+drA@mail.gmail.com>
In-Reply-To: <CAMty3ZC9TtnupJKF4LA9e-jnYMux28u4Pn3femJZXi4ogV+drA@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 19 Jan 2023 14:27:17 -0300
Message-ID: <CAOMZO5AYzZXQ_7jqktKrGcZyE_CaZHZpfyQPWAzbcxGvByH5Kg@mail.gmail.com>
Subject: Re: [PATCH v10 00/18] drm: Add Samsung MIPI DSIM bridge
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

On Thu, Jan 5, 2023 at 7:24 AM Jagan Teki <jagan@amarulasolutions.com> wrote:

> Does anyone have any other comments on this? I would like to send v11
> with a few nits on v10. Please let me know.

What is blocking this series to be applied?
