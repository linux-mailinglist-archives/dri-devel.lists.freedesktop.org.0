Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C2362781C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 09:47:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D9B10E287;
	Mon, 14 Nov 2022 08:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B8E10E284
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 08:47:40 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id o13so5386591ilc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 00:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vQZaGyGGRMG9WSnxx0EKgQyP34O/zWxUK3kr2RIAKt8=;
 b=m3Ypy7jgqA7HJ9d03+D79kNjn4LqBSbI1ZO72wNhweOHOKxwJ5xgtLNQx8zsqXpziZ
 cHaEix1EjrZKwkv9ovN3KJlQapuaDvkifJk0Q21Q+h1B9sy09P7NhQSsZO+hONpGmZhP
 NJhdDokKiIab2LPAaegj09Usq+SKIkLga/FdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vQZaGyGGRMG9WSnxx0EKgQyP34O/zWxUK3kr2RIAKt8=;
 b=KoLUDqPjR1o/J7tsHONFWGcYoaPMN4n73aEu8XU/ETJ6JDlYc77+nxClG8XgzKQFV3
 Sr8LQS8iOaTugYkEbXPnSkkU+MA7hY6IBC+wyTKNxFJAWLzTjvBBO9g5QHktXtRTRuhN
 TWcvvJOee+kT5sW7uHv1Cg3VDHGyqqZByHAmQATl+NVVfoJba/yDIyXtkGt4uci9WrWe
 MsfxqOYDjlDbesNyk63KA85F9azh4eLSiREjDfLMSPLioP051xYbnbWS6KBCCLcShpuU
 OO77E9cXGXgS+tu1p1cri9MYHl6nG6ClAB1QAvyEJiB9O4bu7zTlXgc3UFrH7TKdcrQb
 ieiw==
X-Gm-Message-State: ANoB5pk6q1iPiFAUYW3zM5pNZrDRGWJn1cmdQyqRZFHQLpnjpFQH2waU
 KkQTDoV4fAzsCJ91viTa3aReyOXJ2uMA40oYFMg9Og==
X-Google-Smtp-Source: AA0mqf6GVlTdNStkdafmYuPoOe6C9UIZRwut/dQ2SxahOodAVWaxTbIKNBB/R2sQ7J7EZ4sAvFSSNLxReqypBpNsYo8=
X-Received: by 2002:a05:6e02:1a4b:b0:302:43b8:d42f with SMTP id
 u11-20020a056e021a4b00b0030243b8d42fmr5359490ilv.64.1668415660226; Mon, 14
 Nov 2022 00:47:40 -0800 (PST)
MIME-Version: 1.0
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <abfb3397-a0b4-ce31-3b49-172d8256bee1@kontron.de>
In-Reply-To: <abfb3397-a0b4-ce31-3b49-172d8256bee1@kontron.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 14 Nov 2022 14:17:29 +0530
Message-ID: <CAMty3ZCcm8nPrP+0z6AVkN7TK3OEeDDdUogQuEpr8gKt0x+vSw@mail.gmail.com>
Subject: Re: [PATCH v8 00/14] drm: bridge: Add Samsung MIPI DSIM bridge
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
 Joonyoung Shim <jy0922.shim@samsung.com>, dri-devel@lists.freedesktop.org,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Frieder,

On Mon, Nov 14, 2022 at 2:12 PM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> Hi Jagan,
>
> On 10.11.22 19:38, Jagan Teki wrote:
> > This series supports common bridge support for Samsung MIPI DSIM
> > which is used in Exynos and i.MX8MM SoC's.
> >
> > The final bridge supports both the Exynos and i.MX8M Mini/Nano/Plus.
> >
> > Changes for v8:
> > * fixed comment lines
> > * fixed commit messages
> > * fixed video mode bits
> > * collect Marek Ack
> > * fixed video mode bit names
> > * update input formats logic
> > * added imx8mplus support
>
> Did you miss to collect all the Tested-by tags from v7, or did you drop
> them deliberately?

Few changes in v8 compared to v7, so I've not picked these tags as code changes.

Jagan.
