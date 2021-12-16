Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A26A4773DC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 15:00:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323DD112129;
	Thu, 16 Dec 2021 14:00:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F3E112129
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 14:00:21 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id j2so64716920ybg.9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 06:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u6OncGT5DH6LGjtg6Vfmos78FGM9/13B2AHVO5qFxzo=;
 b=yGu/21vZc2BZXDQ+5xlnnP2EyPY7ZJJn400mL6Vy5KUzv5UXUFyqxHAlE0rfczGIIa
 fCwLnxS1Z2EvrffUk1Qs1Dwn93SwpPREtMHfCnEuUDSbe00fcfz/V7K2DHorMmIT447l
 KkpprabH7UA1JK/SOqDiVhKRmDBKRNomtNwQB9UNcLHvygbRq6HqnEWd2K3dczUimB2e
 DdtafW3miFc65tmyvj6ForM4T80sbJnpMZyoDv7oBm5F4MKfXfHMk/q5I2ZemrHwg6um
 l3sd/Bl33z6+XqWapaWduxkg+PndrQehs4+hSADbA/1x1hoktDsnXKcRMHvxjpgEfYvM
 aAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u6OncGT5DH6LGjtg6Vfmos78FGM9/13B2AHVO5qFxzo=;
 b=1S9NLr5+bXhIwTg9JdTJNsKMM03DDcDbXV2r49SM7H3/j+CkQocUtP0j6A1GjhTD0f
 9MkiJuOd++LJ/J/ln+lw8Uvr5rOc3tfXG0OimOLcH9GRrccKNShecnzB+zpp+bElGTda
 Hoz7lQ4F/93xd948fJ2DGqAjTF2IJYVb9LbG1dToS497zl5inDh+du8glGaBSLJeTDRW
 zGrhsztcGbgQVjksCS6G9ZUXN9isdLBKK2ll3v9RcY1X65ERWDK3XgvjfLH6ske7z9k6
 ZP2SxQAUrledcgD7FuMk2paR4lLQwD8dVbDsYOb4KH8i+5Ry8XLM3eCHyKb9KZGLCERC
 aM2A==
X-Gm-Message-State: AOAM530NHF+qxliNybfBFTimoGk20vvbayVRGiNrqflPzpsVuUwesPQc
 MGHGhQiNJcIPaPs3AY5iMkktJ+/yqSgC80hek2stCQ==
X-Google-Smtp-Source: ABdhPJwXwKfOppuBxULwQYeRr4eAgVGntM2699eq0a0bjDi9ASHuoyFoltd12L8a9F6DoGRmCB2RyMqqsJvritZooBI=
X-Received: by 2002:a25:4c8:: with SMTP id 191mr13679935ybe.357.1639663220586; 
 Thu, 16 Dec 2021 06:00:20 -0800 (PST)
MIME-Version: 1.0
References: <20211208104026.421-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211208104026.421-1-biju.das.jz@bp.renesas.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 16 Dec 2021 14:00:09 +0000
Message-ID: <CAPj87rMUrB34jVMSdcMqVaf+aRJLq0okHtDjc-bHQ8BcQoqOkQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add Mali-G31 GPU support for RZ/G2L SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 tomeu.vizoso@collabora.com, Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Biju Das <biju.das@bp.renesas.com>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

On Wed, 8 Dec 2021 at 10:40, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> RZ/G2L SoC embeds Mali-G31 bifrost GPU.
> This patch series aims to add support for the same
>
> It is tested with latest drm-misc-next + mesa 21.3.0 +
> out of tree patch for (du + DSI) +
> platform specific mesa configuration for RZ/G2L.

Could you please post the 'platform-specific Mesa configuration'
patches as a merge request to Mesa? Thanks.

Cheers,
Daniel
