Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 353D316F02C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 21:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC156EBA6;
	Tue, 25 Feb 2020 20:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B626EBA6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 20:35:18 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4D0F822464
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 20:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582662918;
 bh=IlMHPJZoi6qlavWG4Ahbm3IprtnpXIxML8X3NnRiesw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=M/zmMhCkKG5ZR2aALAAcDqwXx55QaZ79a6R/kP7ncLhvfpPHN14IL07ANpCOk/KqL
 osvvkEIyAzlIUNoWzB9MFSu4Mzp/XQ0NZA31wZHfw19OqWb3jgSh+XeQHJsnDnOcTS
 kP8Q5MyOjKWvQsQjsJ4mhFk7dYdaIU4SDmwTej1w=
Received: by mail-qt1-f182.google.com with SMTP id i23so623376qtr.5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 12:35:18 -0800 (PST)
X-Gm-Message-State: APjAAAUhIirh2w/Q/RALwxskdQ2czVDJiyvUfM1pWISBv1QLJzlG0m5Y
 dUCpKabXYa3djLxNQZsMqmMgMwaDuogssPoBKw==
X-Google-Smtp-Source: APXvYqxghQYLQ6PnllHaIfdR/E6y+DaIAu6c0wU88JtyBWhTwo7n81Ke2zCDhWVpQ1z8bFO/Ygmz9cAyLAvnFp0aF5U=
X-Received: by 2002:ac8:1415:: with SMTP id k21mr568504qtj.300.1582662917307; 
 Tue, 25 Feb 2020 12:35:17 -0800 (PST)
MIME-Version: 1.0
References: <20200207052627.130118-1-drinkcat@chromium.org>
In-Reply-To: <20200207052627.130118-1-drinkcat@chromium.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 25 Feb 2020 14:35:05 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJb2aFHKcVdD-FM2To71iRUJ2nMniw7aZUVXmPmBkazNw@mail.gmail.com>
Message-ID: <CAL_JsqJb2aFHKcVdD-FM2To71iRUJ2nMniw7aZUVXmPmBkazNw@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] Add dts for mt8183 GPU (and misc panfrost patches)
To: Nicolas Boichat <drinkcat@chromium.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 6, 2020 at 11:26 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> Hi!
>
> Follow-up on the v3: https://patchwork.kernel.org/cover/11331343/.
>
> The main purpose of this series is to upstream the dts change and the
> binding document, but I wanted to see how far I could probe the GPU, to
> check that the binding is indeed correct. The rest of the patches are
> RFC/work-in-progress, but I think some of them could already be picked up.
>
> So this is tested on MT8183 with a chromeos-4.19 kernel, and a ton of
> backports to get the latest panfrost driver (I should probably try on
> linux-next at some point but this was the path of least resistance).
>
> I tested it as a module as it's more challenging (originally probing would
> work built-in, on boot, but not as a module, as I didn't have the power
> domain changes, and all power domains are on by default during boot).
>
> Probing logs looks like this, currently. They look sane.
> [  501.319728] panfrost 13040000.gpu: clock rate = 511999970
> [  501.320041] panfrost 13040000.gpu: Linked as a consumer to regulator.14
> [  501.320102] panfrost 13040000.gpu: Linked as a consumer to regulator.31
> [  501.320651] panfrost 13040000.gpu: Linked as a consumer to genpd:0:13040000.gpu
> [  501.320954] panfrost 13040000.gpu: Linked as a consumer to genpd:1:13040000.gpu
> [  501.321062] panfrost 13040000.gpu: Linked as a consumer to genpd:2:13040000.gpu
> [  501.321734] panfrost 13040000.gpu: mali-g72 id 0x6221 major 0x0 minor 0x3 status 0x0
> [  501.321741] panfrost 13040000.gpu: features: 00000000,13de77ff, issues: 00000000,00000400
> [  501.321747] panfrost 13040000.gpu: Features: L2:0x07120206 Shader:0x00000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> [  501.321752] panfrost 13040000.gpu: shader_present=0x7 l2_present=0x1
> [  501.324951] [drm] Initialized panfrost 1.1.0 20180908 for 13040000.gpu on minor 2
>
> Some more changes are still required to get devfreq working, and of course
> I do not have a userspace driver to test this with.
>
> I believe at least patches 1, 2, and 3 can be merged. 4 and 5 are mostly
> useful in conjunction with 6 and 7 (which are not ready yet), so I'll let
> maintainers decide.

I've applied 3, 4, and 5 to drm-misc-next. Patch 2 should go via Mediatek tree.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
