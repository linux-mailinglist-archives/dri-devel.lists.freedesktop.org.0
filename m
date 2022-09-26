Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A407C5E98D2
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 07:35:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C0A310E363;
	Mon, 26 Sep 2022 05:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7BE210E363
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 05:35:18 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id y8so7445097edc.10
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 22:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=uQm/cyI6O2TECbE+cPd+sUKnp2FCGlHvQ4HWSuz+uSg=;
 b=bvj4BJCXhuoY+XVd7CpW0wyJbpTiRkIRiYp5uuTDkAbcaXZe8AzQT/VxPZLxL3Yorg
 xdtZuFe7/VqVVkB3XXhYGSa3RMXjHjZTOhD8G2nHvEN2zaQOYaHrsWWh0Jv3hyyoD3x2
 E0Wcv+6JZdSQryG4iCkzVhAd3XiX3pnqGTDQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=uQm/cyI6O2TECbE+cPd+sUKnp2FCGlHvQ4HWSuz+uSg=;
 b=ZYQmSoIIklAHtDY945zr6bFxhMz6SutX2MW0ODE11YNHEL6x7nMNrOYAZlgww0vath
 do0xgIsdkClD54bKGlFWRvwfMeVptJxcMpRkjn33UwoW6ir0yqwkRBw1IkCtzLB8uJMs
 lWD+nR7ZbNNiVMHj/UoNiWOnJ0bjUJOq2KgcUEBgOjZmHiTvU0P0s6rpswl/7roejaD6
 Od1Lh6IynK7kfw3bJhF0T/m1cw/PEpNB+DVStyeblJplAAKPniabdrBCqrKG28enkbil
 wdv0JJRWkmG+FFBRBlboZbibXMNROv9VjwlUU7vy8RD3yUaOPYOwRAwwsmoKDueoNa9/
 jXqw==
X-Gm-Message-State: ACrzQf2fd0K7aKyuVVgSpRI2nX9ZN9KsWT0Y/w4A8zsVhK+EOVohtfkE
 c0Mnc34VdqWKyLFzpry6HH1jxRR7/XmliMLrBUK7uw==
X-Google-Smtp-Source: AMsMyM5sOF/np8p+lz3ZmwY9NsZIytiFDwGMSg6JHrTesURDkV9WMexbAV6SKC66ej7VC+axAK4njLND0s0MeZqSPD4=
X-Received: by 2002:a05:6402:280f:b0:44e:ee5c:da6b with SMTP id
 h15-20020a056402280f00b0044eee5cda6bmr20607304ede.256.1664170517096; Sun, 25
 Sep 2022 22:35:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-2-4844816c9808@baylibre.com>
 <CAGXv+5GJrjxG0pEGqseEacz_KFCRhWJSiLoiwuwwUTaSeO0RBg@mail.gmail.com>
In-Reply-To: <CAGXv+5GJrjxG0pEGqseEacz_KFCRhWJSiLoiwuwwUTaSeO0RBg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Sep 2022 13:35:05 +0800
Message-ID: <CAGXv+5Gw_fKHfhTEAOQi7R_GtD5OSiSTQ5wCvKjEckXBwjLLQA@mail.gmail.com>
Subject: Re: [PATCH v1 02/17] clk: mediatek: add VDOSYS1 clock
To: Guillaume Ranquet <granquet@baylibre.com>
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
Cc: devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao shi <jitao.shi@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Pablo Sun <pablo.sun@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 26, 2022 at 1:09 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Tue, Sep 20, 2022 at 12:59 AM Guillaume Ranquet
> <granquet@baylibre.com> wrote:
> >
> > From: Pablo Sun <pablo.sun@mediatek.com>
> >
> > Add the clock gate definition for the DPI1 hardware
> > in VDOSYS1.
> >
> > The parent clock "hdmi_txpll" is already defined in
> > `mt8195.dtsi`.
> >
> > Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

I've queued patches 1 & 2 up here [1] and will send a pull request to
the clock maintainer later this week.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git/log/?h=clk-mtk-for-6.1
