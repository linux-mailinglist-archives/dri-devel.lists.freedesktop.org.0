Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2666472CD5
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 14:08:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE2B10E71F;
	Mon, 13 Dec 2021 13:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA13510E70B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 13:08:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B5E8DB80ED7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 13:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A7CC34602
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 13:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639400910;
 bh=9ydNHDYKsiCtb2ZflappRnVfHZy3RsZlLzo1HG0qTQ8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oueOIM3fIOMj2+TI5XA1CuIizd/7PqMKjSRQFUKpBoHYyyBRgIocAGC4RblG6hYv1
 Q01/UVxT1MSebp672T/LsHpMogQVz15GFTDohMUXtvNjYsMGQI/pviD65bOTsi1eBg
 JtjiCQjOf4E3/UN8xY4VvXyaKQv9SQdZ2I5axkmTjOt4Yb1HwQZHIjJ2hfFBMrBQu6
 HWY1FKffwOl14/i0ZT2s1MYIcX2nntfok6J7gSaHA/KD5dY8jjgy3MdcdK538Jda3S
 NHxAHBRE/lax6+Xys4loXUuTACV4OKIbzLFO5E7yq7oyL/QtUbDVGDQ4G3tFMQtcoN
 xofGjuGP5PVwA==
Received: by mail-ed1-f49.google.com with SMTP id x10so34489909edd.5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 05:08:30 -0800 (PST)
X-Gm-Message-State: AOAM532oWc71QDyot8FmmhGp5euVQ5EMq2Wl6MGnwmTSnqjDIOM/YBW9
 l70KuZy9WiWea01Vtf6QU6GqYZDK8bF85NrPJA==
X-Google-Smtp-Source: ABdhPJyYH9M8ZF1ALPPysi0+E5P/GHohfR0mv1DVIz4G6JHoIMRL1u/arPHp4YYjl7O+tsaAU4Q6wDrSLDSQCkFycpk=
X-Received: by 2002:a50:d883:: with SMTP id p3mr63843811edj.94.1639400906772; 
 Mon, 13 Dec 2021 05:08:26 -0800 (PST)
MIME-Version: 1.0
References: <20211028074311.57842-1-angelogioacchino.delregno@collabora.com>
 <000ba19e-0220-f5c3-0efd-abb8338bb8f2@collabora.com>
In-Reply-To: <000ba19e-0220-f5c3-0efd-abb8338bb8f2@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 13 Dec 2021 21:08:15 +0800
X-Gmail-Original-Message-ID: <CAAOTY_87ugiuo+nz2D1upTX+oO8r3yHHLsU3r07qkpvu3UESDQ@mail.gmail.com>
Message-ID: <CAAOTY_87ugiuo+nz2D1upTX+oO8r3yHHLsU3r07qkpvu3UESDQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: hdmi: Perform NULL pointer check for
 mtk_hdmi_conf
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 Hi, Angelo:

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2021=E5=B9=B412=E6=9C=8813=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=886:=
02=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Il 28/10/21 09:43, AngeloGioacchino Del Regno ha scritto:
> > In commit 41ca9caaae0b ("drm/mediatek: hdmi: Add check for CEA modes on=
ly")
> > a check for CEA modes was added to function mtk_hdmi_bridge_mode_valid(=
)
> > in order to address possible issues on MT8167; moreover, with commit
> > c91026a938c2 ("drm/mediatek: hdmi: Add optional limit on maximal HDMI m=
ode clock")
> > another similar check was introduced.
> >
> > Unfortunately though, at the time of writing, MT8173 does not provide
> > any mtk_hdmi_conf structure and this is crashing the kernel with NULL
> > pointer upon entering mtk_hdmi_bridge_mode_valid(), which happens as
> > soon as a HDMI cable gets plugged in.
> >
> > To fix this regression, add a NULL pointer check for hdmi->conf in the
> > said function, restoring HDMI functionality and avoiding NULL pointer
> > kernel panics.
> >
> > Fixes: 41ca9caaae0b ("drm/mediatek: hdmi: Add check for CEA modes only"=
)
> > Fixes: c91026a938c2 ("drm/mediatek: hdmi: Add optional limit on maximal=
 HDMI mode clock")
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> > ---
> >   drivers/gpu/drm/mediatek/mtk_hdmi.c | 12 +++++++-----
> >   1 file changed, 7 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/medi=
atek/mtk_hdmi.c
> > index 5838c44cbf6f..3196189429bc 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> > @@ -1224,12 +1224,14 @@ static int mtk_hdmi_bridge_mode_valid(struct dr=
m_bridge *bridge,
> >                       return MODE_BAD;
> >       }
> >
> > -     if (hdmi->conf->cea_modes_only && !drm_match_cea_mode(mode))
> > -             return MODE_BAD;
> > +     if (hdmi->conf) {
> > +             if (hdmi->conf->cea_modes_only && !drm_match_cea_mode(mod=
e))
> > +                     return MODE_BAD;
> >
> > -     if (hdmi->conf->max_mode_clock &&
> > -         mode->clock > hdmi->conf->max_mode_clock)
> > -             return MODE_CLOCK_HIGH;
> > +             if (hdmi->conf->max_mode_clock &&
> > +                 mode->clock > hdmi->conf->max_mode_clock)
> > +                     return MODE_CLOCK_HIGH;
> > +     }
> >
> >       if (mode->clock < 27000)
> >               return MODE_CLOCK_LOW;
> >
>
> Hello, friendly ping!
>
> Can I please get a review (or merge) of this commit?
>
> This is an important fix for a null pointer KP and restores HDMI function=
ality.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Thanks,
> - Angelo
