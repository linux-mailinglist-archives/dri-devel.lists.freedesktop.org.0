Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8541D492F21
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 21:18:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30EC310E556;
	Tue, 18 Jan 2022 20:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E366210E556
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 20:17:59 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id u11so20295355plh.13
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 12:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fTJy6r2petxIyCqlCeqcI3j0J1mr0+L2iTxm9kuz7Xs=;
 b=inhbbrVy+Fl/lXwKK3g5gU174TWO3UbXPm6+kPhfHgNNQVApLzBtbDcGk4Xgom17AB
 i3YZWJdLTgR31k1+RKgfidYdZUqNPiFDDZAGoFHkdyc4Ob67KE7sURHRukbTSubzASSf
 maDQWVxRz4iuaY3PO0xLJR+1EQcEZT+I8Q6AQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fTJy6r2petxIyCqlCeqcI3j0J1mr0+L2iTxm9kuz7Xs=;
 b=bMOzdTLFKZMxX12LtTow3k0V+SLC0RTteNYdR7Y77pPCeCHXNHbKQq3FYXRQVR73iY
 fIwOHhnha1MzyT9GEN36V12B3KfHQQ1HN3vl1VcCaoTwE9Z9FZ1LhyKRh8NVmFy3i0Uh
 DtMVqqnsS+Zo1Btqwtc51aJeDuS/WqOnQDNGK+DOzI69cWl/zzjkDBekOI4kyH63A5zA
 zzywF/VaumTpph700pHgJfhPBxkAdA0unACeN2bGsLMryr6KvK3UVDmhHFWeD30rzlus
 eLb2XBgwrPlX4gl/+DtmgBiZdB8h4p8NGMbrYHeEtb41Hg8iyfw8jGCQrlTrBE6YV8ic
 vDZA==
X-Gm-Message-State: AOAM533J+9zIRueU6K32RfleXWULEm/6n3G2djR1YLzncssKdCpJW2f0
 iV16ihOGuL8fnKnzQpdj/lLD8g==
X-Google-Smtp-Source: ABdhPJxiIurI5FHOTYvsCLYSQboCxGuQP/VrNeICLl1afrsd2ymXtXw5svEXZBZPdy/+GQJ6NoXhPA==
X-Received: by 2002:a17:90b:4b8a:: with SMTP id
 lr10mr278353pjb.58.1642537079558; 
 Tue, 18 Jan 2022 12:17:59 -0800 (PST)
Received: from google.com ([2620:15c:202:201:e4bb:67e6:f0b5:1b92])
 by smtp.gmail.com with ESMTPSA id ha11sm1170099pjb.3.2022.01.18.12.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 12:17:58 -0800 (PST)
Date: Tue, 18 Jan 2022 12:17:55 -0800
From: Brian Norris <briannorris@chromium.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v2 3/3] ASoC: rk3399_gru_sound: Wire up DP jack detection
Message-ID: <YecgcwXrQNzCesMN@google.com>
References: <20220114230209.4091727-1-briannorris@chromium.org>
 <20220114150129.v2.3.I3c79b1466c14b02980071221e5b99283cd26ec77@changeid>
 <CAGXv+5HC00YU6ARtGDahxWLqivvUCowh7wDq5H5OzoGO9htB+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGXv+5HC00YU6ARtGDahxWLqivvUCowh7wDq5H5OzoGO9htB+g@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Lin Huang <hl@rock-chips.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chen-Yu,

On Mon, Jan 17, 2022 at 05:01:52PM +0800, Chen-Yu Tsai wrote:
> On Sat, Jan 15, 2022 at 7:03 AM Brian Norris <briannorris@chromium.org> wrote:
> >
> > Now that the cdn-dp driver supports plug-change callbacks, let's wire it
> > up.
> >
> > Signed-off-by: Brian Norris <briannorris@chromium.org>
> > ---
> >
> > (no changes since v1)
> >
> >  sound/soc/rockchip/rk3399_gru_sound.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/sound/soc/rockchip/rk3399_gru_sound.c b/sound/soc/rockchip/rk3399_gru_sound.c
> > index e2d52d8d0ff9..eeef3ed70037 100644
> > --- a/sound/soc/rockchip/rk3399_gru_sound.c
> > +++ b/sound/soc/rockchip/rk3399_gru_sound.c
> > @@ -164,6 +164,25 @@ static int rockchip_sound_da7219_hw_params(struct snd_pcm_substream *substream,
> >         return 0;
> >  }
> >
> > +static struct snd_soc_jack cdn_dp_card_jack;
> > +
> > +static int rockchip_sound_cdndp_init(struct snd_soc_pcm_runtime *rtd)
> > +{
> > +       struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
> 
> Using snd_soc_card_get_codec_dai() might be a better choice throughout this
> driver. While it will work for the cdn_dp case, because it is the first DAI
> in |rockchip_dais[]|, all the invocations for the other codecs are likely
> returning the wrong DAI.

I'll admit, I'm not very familiar with the ASoC object model, so you may
well be correct that there's something fishy in here. But I did trace
through the objects involved here, and we *are* getting the correct DAI
for both this case and the DA7219 case (preexisting code).

It looks like we actually have a new runtime for each of our static
dai_links:

devm_snd_soc_register_card()
  ...
  for_each_card_prelinks()
    snd_soc_add_pcm_runtime()

So I think this is valid to keep as-is.

> For this particular patch it works either way, so
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Thanks for looking!

Brian
