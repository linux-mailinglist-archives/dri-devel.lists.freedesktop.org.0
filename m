Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDF211CF7C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 15:14:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965CA6ED9A;
	Thu, 12 Dec 2019 14:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BDB6ED9A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 14:14:31 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id s25so2967121iob.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 06:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rYO0vtrh5ndy7gwZikU1oH7JLP2fHnRpDb1aMOPMlmg=;
 b=ZEpemDipLJFLngdu5DRHLK9+G9LT0ArmVRxkc8wGxIJnqkil2etBm4qSp+IMEctcSB
 OaorxX5ZkSpoAZAOyvdKfot1SClAuqc5sA1E179IY2tokIY8etLGQ1V5l4ZhuXNJJm/4
 x6IRDfrQ977wlrNNXnTBZrDV7TgagxbLLav5lYzy1dl2N/pjWuNkYxf1v27pDbQ6tyce
 n9zaJ+LgPuJ2H69BsPTLviGI7wdCrYaCVRSkFz8RPRGsGZZDxAixGKOt1caM6QhqC3G1
 QegodW0hqpFnlRN2EmipG2w/5jSb7CygatS9gavL1rORWt3K7EZGGYkkyNtIXvNQcVGF
 PDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rYO0vtrh5ndy7gwZikU1oH7JLP2fHnRpDb1aMOPMlmg=;
 b=UH+7ab3aJxZUwg6RAvVlmySQTZfRGigyj5XYQl4fHE5TPh7qx3/hTjv2Ua9AERI3hy
 gHIu/lDEFRYM3nchbA2XkrK6DV7xXQXYWyFRso8ge88pwGFY9xLX+nbWXVB3L+RTvJLG
 KSOGod49SDPu0DYE4q+rN9TZA40Q1epUBp4NHOJq5ZIXbhgFJjNFBS7T0IUR55frAHZo
 Yrtr31t1VXejb5sCN9CozP+sjyA0X6UyRZzafE8iQ8EQI4Zhr0Hpq79EL8YlhbnbwcXb
 wGEB4le3Fjc4FtxGiTsRLlgtoREsHpeoj4TSPpK4oVcHNGxk0SHUBElaF+uyVaIS9PNm
 qi8g==
X-Gm-Message-State: APjAAAV14k2GUhZZAwqCcM6FpTIGUXTItXKFoF9qqsaQHRhX9Fu0iiqb
 h8ZjnRUB2ebL9ErJ+kX+7upNPgQHDsxEGzxbJFJjDQ==
X-Google-Smtp-Source: APXvYqwXu9iyecqx40na9enDvYofmCWOETmlMVhDGZVixaQ93xIQYvWAz1tw1Gs5v2KKKODm4Ff9b32roWCcC4rYKpM=
X-Received: by 2002:a6b:bd06:: with SMTP id n6mr3199167iof.165.1576160070755; 
 Thu, 12 Dec 2019 06:14:30 -0800 (PST)
MIME-Version: 1.0
References: <20191211154901.176256-1-markyacoub@google.com>
 <1576125900.29693.0.camel@mtksdaap41>
In-Reply-To: <1576125900.29693.0.camel@mtksdaap41>
From: Sean Paul <sean@poorly.run>
Date: Thu, 12 Dec 2019 09:13:55 -0500
Message-ID: <CAMavQKKOtYKVnCs3RCi3iYiX-2rLHoaDBTsEHyQmvWGoYj4M0g@mail.gmail.com>
Subject: Re: [PATCH 1/2] Return from mtk_ovl_layer_config after
 mtk_ovl_layer_off
To: CK Hu <ck.hu@mediatek.com>
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
Cc: Daniele Castagna <dcastagna@chromium.org>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 11, 2019 at 11:45 PM CK Hu <ck.hu@mediatek.com> wrote:
>
> Hi, Mark:
>
> On Wed, 2019-12-11 at 10:49 -0500, Mark Yacoub wrote:
> > drm/mediatek: return if plane pending state is disabled.
> >
> > If the plane pending state is disabled, call mtk_ovl_layer_off then
> > return.
> > This guarantees that that the state is valid for all operations when the
> > pending state is enabled.
>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>

Thanks for reviewing these patches, CK. When you apply them to your
tree, could you please fixup the subjects with the correct prefixes?

Both patches are also

Reviewed-by: Sean Paul <seanpaul@chromium.org>

Sean

> >
> > Suggested-by: Sean Paul <seanpaul@chromium.org>
> > To: CK Hu <ck.hu@mediatek.com>
> > To: dri-devel@lists.freedesktop.org
> > Cc: Daniele Castagna <dcastagna@chromium.org>
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-mediatek@lists.infradead.org
> > Signed-off-by: Mark Yacoub <markyacoub@google.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > index 4a55bb6e2213..526b595eeff9 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > @@ -260,8 +260,10 @@ static void mtk_ovl_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
> >       unsigned int src_size = (pending->height << 16) | pending->width;
> >       unsigned int con;
> >
> > -     if (!pending->enable)
> > +     if (!pending->enable) {
> >               mtk_ovl_layer_off(comp, idx);
> > +             return;
> > +     }
> >
> >       con = ovl_fmt_convert(ovl, fmt);
> >       if (idx != 0)
> > @@ -283,8 +285,7 @@ static void mtk_ovl_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
> >       writel_relaxed(offset, comp->regs + DISP_REG_OVL_OFFSET(idx));
> >       writel_relaxed(addr, comp->regs + DISP_REG_OVL_ADDR(ovl, idx));
> >
> > -     if (pending->enable)
> > -             mtk_ovl_layer_on(comp, idx);
> > +     mtk_ovl_layer_on(comp, idx);
> >  }
> >
> >  static void mtk_ovl_bgclr_in_on(struct mtk_ddp_comp *comp)
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
