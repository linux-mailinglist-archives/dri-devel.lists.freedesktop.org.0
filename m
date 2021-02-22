Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C89FF32106D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 06:31:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C748E6E8D7;
	Mon, 22 Feb 2021 05:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A3A6E4B0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 05:31:29 +0000 (UTC)
Received: by mail-ua1-x936.google.com with SMTP id c22so3802196uap.10
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Feb 2021 21:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gu/fKr3GRAQ+ErLkQJBUlVQcwe14YTdgKKhXg0Cv4l4=;
 b=nKDy+b2+V7fS2f7mnoG/Ss5+uvRYBQnercKoIeTycpfWKJxx6kOPPx2ZeMe5ucP5Iv
 50sS1bwNYdUpsm04AudIWrPnD+CNDRIBtKgv/9JUPjkbQlh1RAybhdP7pPk7uV3lZTxy
 I4/U2OZz5f4aafI7BWCv88whwJWIfvn83D3IM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gu/fKr3GRAQ+ErLkQJBUlVQcwe14YTdgKKhXg0Cv4l4=;
 b=kCkV8rb0zBH4aUFrILZi+aDU5dBfWysQAeirIynKZucStaKQ96KcxbVY9iX3f7ykUR
 LVpf/MPTAbJSrNMgiuiLm0DyQxZE5LOX77Qe52HV7PZflfXP0YPJHWVXs6UZVKOJXm92
 ou4bm1BsmaeO9YgZQAC47nHRXsIgJVWiXka/kQDQhwN8ZQGNjQT4YGcg53pvgJbjXLw5
 akOfeMAEwdsrICYlXPkL4kju/eJTlhHJPoGKrUv5NFXQMtN4iXX4zFaOlJ5+ThMvNjiF
 4KUXoG5HBLqu3qZDLmw0UN4yPoNAfr8/j7qFb5wQ1/MblKtNlZt8CLMLNPlH3ScInzrl
 4fBA==
X-Gm-Message-State: AOAM532yZCf/zU1Y44DQVs18+jnpfodxHpfCqHY7lyxhALsJYM/3zc9n
 Ds3I0VPQYfFK99FY3qXK/hrEjY5uxNqJ73QtdfBeoA==
X-Google-Smtp-Source: ABdhPJys5c+rCVxUlnAkJ7c+Jss6rAjW1MoFOcoVaCF3S96QpX3HiNwsT/MLRIitrpXf+DKZerK3D3cbUQdqljXKnGs=
X-Received: by 2002:ab0:1052:: with SMTP id g18mr3262401uab.74.1613971888653; 
 Sun, 21 Feb 2021 21:31:28 -0800 (PST)
MIME-Version: 1.0
References: <20210211113309.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
 <YDKvm1QmdJtJbaN6@pendragon.ideasonboard.com>
In-Reply-To: <YDKvm1QmdJtJbaN6@pendragon.ideasonboard.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 22 Feb 2021 13:31:17 +0800
Message-ID: <CANMq1KALq+C2GD2uRohKpwvkDC05-fHyo=_WoHwnsKNjgcSfEQ@mail.gmail.com>
Subject: Re: [PATCH] drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling features
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 Xin Ji <xji@analogixsemi.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, lkml <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 22, 2021 at 3:08 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Nicolas,
>
> Thank you for the patch.
>
> On Thu, Feb 11, 2021 at 11:33:55AM +0800, Nicolas Boichat wrote:
> > Many of the DSI flags have names opposite to their actual effects,
> > e.g. MIPI_DSI_MODE_EOT_PACKET means that EoT packets will actually
> > be disabled. Fix this by including _NO_ in the flag names, e.g.
> > MIPI_DSI_MODE_NO_EOT_PACKET.
> >
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
>
> This looks good to me, it increases readability.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Please however see the end of the mail for a comment.
>
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
>
> Ever tried coccinelle ? :-)

Fun project for next time ,-)

>
> >  drivers/gpu/drm/bridge/adv7511/adv7533.c             | 2 +-
> >  drivers/gpu/drm/bridge/analogix/anx7625.c            | 2 +-
> >  drivers/gpu/drm/bridge/cdns-dsi.c                    | 4 ++--
> >  drivers/gpu/drm/bridge/tc358768.c                    | 2 +-
> >  drivers/gpu/drm/exynos/exynos_drm_dsi.c              | 8 ++++----
> >  drivers/gpu/drm/mcde/mcde_dsi.c                      | 2 +-
> >  drivers/gpu/drm/mediatek/mtk_dsi.c                   | 2 +-
> >  drivers/gpu/drm/msm/dsi/dsi_host.c                   | 8 ++++----
> >  drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c | 2 +-
> >  drivers/gpu/drm/panel/panel-dsi-cm.c                 | 2 +-
> >  drivers/gpu/drm/panel/panel-elida-kd35t133.c         | 2 +-
> >  drivers/gpu/drm/panel/panel-khadas-ts050.c           | 2 +-
> >  drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c   | 2 +-
> >  drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c   | 2 +-
> >  drivers/gpu/drm/panel/panel-novatek-nt35510.c        | 2 +-
> >  drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c   | 2 +-
> >  drivers/gpu/drm/panel/panel-samsung-s6d16d0.c        | 2 +-
> >  drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c     | 2 +-
> >  drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c    | 2 +-
> >  drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c        | 4 ++--
> >  drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c      | 2 +-
> >  drivers/gpu/drm/panel/panel-simple.c                 | 2 +-
> >  drivers/gpu/drm/panel/panel-sony-acx424akp.c         | 2 +-
> >  drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c     | 2 +-
> >  include/drm/drm_mipi_dsi.h                           | 8 ++++----
> >  25 files changed, 36 insertions(+), 36 deletions(-)
> >
> > []
> > diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> > index 360e6377e84b..ba91cf22af51 100644
> > --- a/include/drm/drm_mipi_dsi.h
> > +++ b/include/drm/drm_mipi_dsi.h
> > @@ -119,15 +119,15 @@ struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(struct device_node *node);
> >  /* enable hsync-end packets in vsync-pulse and v-porch area */
> >  #define MIPI_DSI_MODE_VIDEO_HSE              BIT(4)
>
> We're mixing bits that enable a feature and bits that disable a feature.
> Are these bits defined in the DSI spec, or internal to DRM ? In the
> latter case, would it make sense to standardize on one "polarity" ? That
> would be a more intrusive change in drivers though.

Yes, that'd require auditing every single code path and reverse the
logic as needed. I'm not volunteering for that ,-P (hopefully the
current change is still an improvement).

Hopefully real DSI experts can comment (Andrzej?), I think the default
are sensible settings?


>
> >  /* disable hfront-porch area */
> > -#define MIPI_DSI_MODE_VIDEO_HFP              BIT(5)
> > +#define MIPI_DSI_MODE_VIDEO_NO_HFP   BIT(5)
> >  /* disable hback-porch area */
> > -#define MIPI_DSI_MODE_VIDEO_HBP              BIT(6)
> > +#define MIPI_DSI_MODE_VIDEO_NO_HBP   BIT(6)
> >  /* disable hsync-active area */
> > -#define MIPI_DSI_MODE_VIDEO_HSA              BIT(7)
> > +#define MIPI_DSI_MODE_VIDEO_NO_HSA   BIT(7)
> >  /* flush display FIFO on vsync pulse */
> >  #define MIPI_DSI_MODE_VSYNC_FLUSH    BIT(8)
> >  /* disable EoT packets in HS mode */
> > -#define MIPI_DSI_MODE_EOT_PACKET     BIT(9)
> > +#define MIPI_DSI_MODE_NO_EOT_PACKET  BIT(9)
> >  /* device supports non-continuous clock behavior (DSI spec 5.6.1) */
> >  #define MIPI_DSI_CLOCK_NON_CONTINUOUS        BIT(10)
> >  /* transmit data in low power */
>
> --
> Regards,
>
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
