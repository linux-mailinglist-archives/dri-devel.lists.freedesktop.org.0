Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A69B54B4902
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 11:18:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E0C10E50B;
	Mon, 14 Feb 2022 10:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE9410E4F5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 10:18:22 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id m8so11906750ilg.7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 02:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YUDVx4TIFTRbJIuv2rupyK084bb2oTVATeZ8Fn6KFXI=;
 b=Vy5TjXpR1UvKyYsGrQDajSEdq6i7nkBrs9dNkT8ZOiRnZH7iyE4oeURkMBOCh00XOL
 yj1cTNcNbUutaQQX2/qLgSLKlQ17IGKHKIwi1Dz9PkMqdGMt4ShElCGNHNNinwT6mHPK
 oMptJF1N2bFC6U+Eyf21jelIvX6riTkU8CImg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YUDVx4TIFTRbJIuv2rupyK084bb2oTVATeZ8Fn6KFXI=;
 b=MFvLalrkASCBr45m4zKrXNgSKZAJdTZSQYZxwnTr6Q+NMURD7XVfaiNyoGAEmltgdJ
 OSJLMkt79dLzl+Uhbr2DgDN7kc8zJK+tuf2FpZ9dc1TO5pGhR8SwcCe7X9q5rRPRJ82K
 ao1NJGQjR3yY3KFhk4cq1/Eg2mmV0SPB63hCCYBTcRme7QLauCCILjVM7jHb3YmPCrsG
 +UuWZ4HBIZuo/fTsNvvybPTTpX1dagyVPRQF8Cx1dO1uKfdlqSmN3jtDhJD7wD34C7HS
 1B/6EWqjUJ1Hli7z5Z2ukmQDsHtBAkoYNiPpiQtHpSYe65MabMagobU62eo8fGcUslbz
 i6SA==
X-Gm-Message-State: AOAM530jk9YVqQJAKdE9d2YYYFsubQlw5NzJ7tbG7ud8EGXREBf8QghJ
 zyr86mrRiZD4/Qps1svC/YYytXNaaUHfgbEBK4UqoA==
X-Google-Smtp-Source: ABdhPJxouA9SM/xEm/8Xf2lg3Blaymfy9tRI6GOkeimZwqJOmKMUcENtZWCPXUvxeGblbu9sGRovxCTfui1pdv1kxmo=
X-Received: by 2002:a92:d90b:: with SMTP id s11mr3230734iln.105.1644833901824; 
 Mon, 14 Feb 2022 02:18:21 -0800 (PST)
MIME-Version: 1.0
References: <20220213063151.3321331-1-hsinyi@chromium.org>
 <7efb2a87-1b8e-5bab-651f-ffa21ea8d716@collabora.com>
In-Reply-To: <7efb2a87-1b8e-5bab-651f-ffa21ea8d716@collabora.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 14 Feb 2022 18:17:56 +0800
Message-ID: <CAJMQK-hCD7sCTODV_WPxC_eX27XQ3dWyhHJjp96KWNjzuPvquw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/panel: Add inx Himax8279d MIPI-DSI LCD panel
 driver
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 14, 2022 at 6:10 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 13/02/22 07:31, Hsin-Yi Wang ha scritto:
> > From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
> >
> > Add STARRY 2081101QFH032011-53G 10.1" WUXGA TFT LCD panel
> >
> > Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>
> I have no way of testing this driver but the code itself looks good to me,
> so, strictly for the code:
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>

This driver is used by ASUS Chromebook Detachable CZ1 [1]. The dts
will be accepted after this panel is accepted.

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20211213162856.235130-1-hsinyi@chromium.org/

> > ---
> > v2->v3:
> > rebase to next-20220211
> > ---
> >   drivers/gpu/drm/panel/Kconfig                 |   9 +
> >   drivers/gpu/drm/panel/Makefile                |   1 +
> >   .../gpu/drm/panel/panel-innolux-himax8279d.c  | 515 ++++++++++++++++++
> >   3 files changed, 525 insertions(+)
> >   create mode 100644 drivers/gpu/drm/panel/panel-innolux-himax8279d.c
> >
