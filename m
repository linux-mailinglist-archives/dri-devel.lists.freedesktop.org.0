Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 763C33D7337
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 12:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8BF06E45E;
	Tue, 27 Jul 2021 10:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5259F6E1F3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 10:29:20 +0000 (UTC)
Received: by mail-ua1-x936.google.com with SMTP id j7so4695467uaj.10
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 03:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BNXOQOHHvkyOlpYQvBOMgkkH26gWwGd0okW8oi8QdqI=;
 b=VA9XBSq4CQhlCAZrPbTm3nskntRBag7xfqyt0l5ZRi4tj4r7Nwmj7cH8Q//ULvZ68Y
 5rx6ds4fUh1cKyKjtK9DlDLoCmoMTBGuBTVGak7TJbutzKps51Gx+PW0a4zDeLzgCVRA
 7v+taAWoRMIo4GLW7W31F6kuP0wNC9VL3N8Xk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BNXOQOHHvkyOlpYQvBOMgkkH26gWwGd0okW8oi8QdqI=;
 b=n863eEX2JU2sL0/hJvzJkr4HIRb9aWo2XsB+xsszZpv2xbRdSkjSJq1VfJdAB1hSl+
 GZAUHFLj87W19uaAbypgvIlC9RC9VphWmeib/D532Y9vJ+swjsX8Wo0POWF1UH2YrXDQ
 GHcbFom2X+gT5fv0auRDmeKi3YRxTt0PxE4vrv5wM0Gzp+NpkZwuxsGUSN0XfmF+vYKZ
 uQi2YLgdM6A7vRjmTaU1hND4BBD4kThnVmHVIyPiOYU4R9Qvyg1upEe4Re6vdPQZtbZE
 ZU75phN+4Due75liFuXEeIiPptE7JJjopPDXR081Hrsg6ITBMjZyvgcodr8pKqZPnUtK
 hy5A==
X-Gm-Message-State: AOAM533IqQT2LJePAITIUImgLe2qEdKcJiDtagqkLo1a1vyZkpMqHUkU
 Kuw+5yZy19rf/7gsPR5DYCpJxLB9Po0YEkTV60BA+Q==
X-Google-Smtp-Source: ABdhPJyx7sQwhJ8UE8NDg2Kx4YHR88sGvEf5AH10FBKUxfscAE8LJuhcwnvw8wjRTLPiqyBoy6zqtE4uvHrV7c6EPNE=
X-Received: by 2002:ab0:2641:: with SMTP id q1mr16151134uao.82.1627381759398; 
 Tue, 27 Jul 2021 03:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210727094435.v3.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
 <YP/FMblLCPpR7Tgf@ravnborg.org>
In-Reply-To: <YP/FMblLCPpR7Tgf@ravnborg.org>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 27 Jul 2021 18:29:08 +0800
Message-ID: <CANMq1KAVA3LRXzcKrVoj30KtvwuA0hQ12JdMLu32-RD8h=UjFw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling
 features
To: Sam Ravnborg <sam@ravnborg.org>
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
 Viresh Kumar <viresh.kumar@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@samsung.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Jonathan Marek <jonathan@marek.ca>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 MSM <linux-arm-msm@vger.kernel.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Tzung-Bi Shih <tzungbi@google.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Paul <sean@poorly.run>, Xin Ji <xji@analogixsemi.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Rajendra Nayak <rnayak@codeaurora.org>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 lkml <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Yu Jiahua <yujiahua1@huawei.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 27, 2021 at 4:35 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Nicolas,
> On Tue, Jul 27, 2021 at 09:45:21AM +0800, Nicolas Boichat wrote:
> > Many of the DSI flags have names opposite to their actual effects,
> > e.g. MIPI_DSI_MODE_EOT_PACKET means that EoT packets will actually
> > be disabled. Fix this by including _NO_ in the flag names, e.g.
> > MIPI_DSI_MODE_NO_EOT_PACKET.
> >
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Andrzej Hajda <andrzej.hajda@samsung.com>
> > Reviewed-by: Xin Ji <xji@analogixsemi.com> # anx7625.c
> > Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org> # msm/dsi
> > ---
> > I considered adding _DISABLE_ instead, but that'd make the
> > flag names a big too long.
> >
> > Generated with:
> > flag=MIPI_DSI_MODE_VIDEO_HFP; git grep $flag | cut -f1 -d':' | \
> >   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HFP/" {}
> > flag=MIPI_DSI_MODE_VIDEO_HBP; git grep $flag | cut -f1 -d':' | \
> >   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HBP/" {}
> > flag=MIPI_DSI_MODE_VIDEO_HSA; git grep $flag | cut -f1 -d':' | \
> >   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HSA/" {}
> > flag=MIPI_DSI_MODE_EOT_PACKET; git grep $flag | cut -f1 -d':' | \
> >   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_NO_EOT_PACKET/" {}
> > (then minor format changes)
> >
> > Changes in v3:
> >  - Added all R-b tags from v1 and v2 (hopefully didn't miss any).
> >
> > Changes in v2:
> >  - Rebased on latest linux-next, after some of the flags got fixed
> >    (Linus Walleij).
>
> Thanks for the update, applied to drm-misc-next.

Thanks Sam!

>
>         Sam
