Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDAF67CF0C
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 15:59:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46CD210E03D;
	Thu, 26 Jan 2023 14:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800F410E032
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 14:58:54 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-4a263c4ddbaso26984777b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 06:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=F+hnVEHWhv1xBaJ1U7spBSPMrJ9sXpPQta5PjiVCDtk=;
 b=bt3SpHN+sRz6tSirTZKY5wDQH90STxi/RLwjwG4+XthZJ+ZWN2X85Z6aICwvMZs05P
 52o5qi133GGJ9xHKv0gEkcR5lUNm8eldFqSqdbxeC/sv4tSTW1nQP3Ah57G6fSDzAHsx
 QmHS5sMoYz4EDTJjsOPuqj6Tww9AdvBf91R3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F+hnVEHWhv1xBaJ1U7spBSPMrJ9sXpPQta5PjiVCDtk=;
 b=jkTulCxYaFp+VrEQfSiPL/n6jEyPgDWgdBFCPwj5mXg7rw9sVcZjn6zke/x5EB2NX5
 TaN6+/j+iIBswdrqNRjIt2WzBh7tdCaK35M3iH9+tp+KGh+eCxPgfaQzpgf8AJmrx3FA
 wkRYAaoDZiGXfVRzkC86UrZEiskdAvz4HrZI5ZfRX3ZdK4IUN/3L0loRSZkKI1n0BEWd
 F5TUqy2aNc5AmduDoCIA+z1N1rxbhBGHULGoQMJBVTulQaeV25SVa+fRfrF9czQO2RhB
 bi17V5Ia/AzmDG4r85MBYO9AGjUs7TnRqxcTkVN1ai0zVHmkuqu6fklEyBrPvNDpGFyV
 6qSw==
X-Gm-Message-State: AFqh2kpIy901W9VwtBfEFznghxWfCUwtED6fANrgACEYcNrHvAg/IThc
 7ue5MVYT59SZQzVOAEeXcRDz7TDi4LAKi4qFideBfA==
X-Google-Smtp-Source: AMrXdXs5yK+DoJlQQlLQlVVwsCkCFhxE7bTrku1TJXrm0rNp6kW5dWTC6+wLxRv9HcE0LxxkHMZEDuVzue2VSCtVoTw=
X-Received: by 2002:a05:690c:852:b0:4d7:eb11:6bf7 with SMTP id
 bz18-20020a05690c085200b004d7eb116bf7mr4313303ywb.235.1674745132681; Thu, 26
 Jan 2023 06:58:52 -0800 (PST)
MIME-Version: 1.0
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
 <20230126144427.607098-3-jagan@amarulasolutions.com>
 <20230126144722.ahnfzrl7ohy4lsah@houat>
In-Reply-To: <20230126144722.ahnfzrl7ohy4lsah@houat>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 26 Jan 2023 20:28:41 +0530
Message-ID: <CAMty3ZDzF=yUM0OCFdcdRJgaAqozTeLetCrCGD3xmG5_pyLQRQ@mail.gmail.com>
Subject: Re: [PATCH v12 02/18] drm: bridge: panel: Add
 devm_drm_of_dsi_get_bridge helper
To: Maxime Ripard <maxime@cerno.tech>
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
 Matteo Lisi <matteo.lisi@engicam.com>, dri-devel@lists.freedesktop.org,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, NXP Linux Team <linux-imx@nxp.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 26, 2023 at 8:17 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Thu, Jan 26, 2023 at 08:14:11PM +0530, Jagan Teki wrote:
> > Add devm OF helper to return the next DSI bridge in the chain.
> >
> > Unlike general bridge return helper devm_drm_of_get_bridge, this
> > helper uses the dsi specific panel_or_bridge helper to find the
> > next DSI device in the pipeline.
> >
> > Helper lookup a given child DSI node or a DT node's port and
> > endpoint number, find the connected node and return either
> > the associated struct drm_panel or drm_bridge device.
> >
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v12, v11:
> > - none
> > Changes for v10:
> > - new patch
>
> I sent you an email earlier today telling you to change this.

Ohh. Missed it, I will respond to that thread.

Thanks,
Jagan.
