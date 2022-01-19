Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 047F84934B5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 06:59:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10DEE10EE5E;
	Wed, 19 Jan 2022 05:59:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6361610EE82
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 05:59:42 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id x11so4981351lfa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 21:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1tKYVg7wJMJMNFKIyw+d3Kv62PM5IDYj6Uiog3M1guQ=;
 b=O3rjR1xwJ5RJa/8Pr4j+o/xz2ODymM24FgRvDAyyXVz801NpNIj40tnMPXagEzzIdN
 YgApJ9Se2RtCuzQIBr9UoxOYieOUmAITh7Ff2mH+sSXNnt/MyPTQm0hxbsds1OhLg9Lx
 iGrVXc3V0OyRFdbBmsPvPpedratR1otyTGqBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1tKYVg7wJMJMNFKIyw+d3Kv62PM5IDYj6Uiog3M1guQ=;
 b=f6pUdHWSiWqamPW+SguV9YgO+CZ46DP74Z4vKiOcFKt2dIMTSGart/zyRNl3zmPDgS
 S+mqMeUTL2KzEZM9badsQQJG7kXIg8TlO/GEuILncm+T3mk+jnsp29+dy/aCgh7nxCkL
 M7xBEHRafzgNWQsWiVOFveSWk82SVKrBPaFzG8NIEjkyQ21fEhODghfMoq1w2PGHZo4b
 AsPhfeTqpQtYaR12xD3lIWiF4OQxVM8/uz5AFlNBQgIj4yMUPHn3JSNx1IBZ6H1Mwn2V
 VfwKnL5VTdLclH/qh94ct+xCjbKv2bydiyXr/cpYd58nxcvidFI5pEcUAwdC69Z0x0pr
 sdJg==
X-Gm-Message-State: AOAM533KSpiS86FcgVeFK1iM0vM9yLlv/4DjU/eSptgeHjdw+OdJe5t5
 vrR9uB6s9yQkWGkH627rMxsHe24goWKhug/p2V9aFA==
X-Google-Smtp-Source: ABdhPJxmDuwkFJziW4xvLsZmdp9HyrtsLl84OWqtBxpyS7OeNwc36CaaRT+rymCOgrfcQNTO0R57Np83PfJ/v382SjQ=
X-Received: by 2002:a05:6512:1320:: with SMTP id
 x32mr25449431lfu.597.1642571980606; 
 Tue, 18 Jan 2022 21:59:40 -0800 (PST)
MIME-Version: 1.0
References: <20220114230209.4091727-1-briannorris@chromium.org>
 <20220114150129.v2.3.I3c79b1466c14b02980071221e5b99283cd26ec77@changeid>
 <CAGXv+5HC00YU6ARtGDahxWLqivvUCowh7wDq5H5OzoGO9htB+g@mail.gmail.com>
 <YecgcwXrQNzCesMN@google.com>
In-Reply-To: <YecgcwXrQNzCesMN@google.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 19 Jan 2022 13:59:29 +0800
Message-ID: <CAGXv+5HANAorgJhSupH96V_n01VzvO5mY6LXf=bzzMi3ek089w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ASoC: rk3399_gru_sound: Wire up DP jack detection
To: Brian Norris <briannorris@chromium.org>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Lin Huang <hl@rock-chips.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 19, 2022 at 4:18 AM Brian Norris <briannorris@chromium.org> wrote:
>
> Hi Chen-Yu,
>
> On Mon, Jan 17, 2022 at 05:01:52PM +0800, Chen-Yu Tsai wrote:
> > On Sat, Jan 15, 2022 at 7:03 AM Brian Norris <briannorris@chromium.org> wrote:
> > >
> > > Now that the cdn-dp driver supports plug-change callbacks, let's wire it
> > > up.
> > >
> > > Signed-off-by: Brian Norris <briannorris@chromium.org>
> > > ---
> > >
> > > (no changes since v1)
> > >
> > >  sound/soc/rockchip/rk3399_gru_sound.c | 20 ++++++++++++++++++++
> > >  1 file changed, 20 insertions(+)
> > >
> > > diff --git a/sound/soc/rockchip/rk3399_gru_sound.c b/sound/soc/rockchip/rk3399_gru_sound.c
> > > index e2d52d8d0ff9..eeef3ed70037 100644
> > > --- a/sound/soc/rockchip/rk3399_gru_sound.c
> > > +++ b/sound/soc/rockchip/rk3399_gru_sound.c
> > > @@ -164,6 +164,25 @@ static int rockchip_sound_da7219_hw_params(struct snd_pcm_substream *substream,
> > >         return 0;
> > >  }
> > >
> > > +static struct snd_soc_jack cdn_dp_card_jack;
> > > +
> > > +static int rockchip_sound_cdndp_init(struct snd_soc_pcm_runtime *rtd)
> > > +{
> > > +       struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
> >
> > Using snd_soc_card_get_codec_dai() might be a better choice throughout this
> > driver. While it will work for the cdn_dp case, because it is the first DAI
> > in |rockchip_dais[]|, all the invocations for the other codecs are likely
> > returning the wrong DAI.
>
> I'll admit, I'm not very familiar with the ASoC object model, so you may
> well be correct that there's something fishy in here. But I did trace
> through the objects involved here, and we *are* getting the correct DAI
> for both this case and the DA7219 case (preexisting code).

Neither am I, so ...

> It looks like we actually have a new runtime for each of our static
> dai_links:
>
> devm_snd_soc_register_card()
>   ...
>   for_each_card_prelinks()
>     snd_soc_add_pcm_runtime()
>
> So I think this is valid to keep as-is.

I missed this bit. As you say, things are good.

> > For this particular patch it works either way, so
> >
> > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Thanks for looking!

And thanks for double checking!
