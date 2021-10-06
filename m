Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66770424603
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 20:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E913B6EDF2;
	Wed,  6 Oct 2021 18:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA056EDF2
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 18:25:15 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id m3so14352502lfu.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 11:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Nilvj0BCNWHsyq1W7awlCSFRX2jOx57s9HjwLir53WA=;
 b=aT8IlMoIH8cgyNkOORPkoY7N2odN1B9ip5felUqWhaWSrDewU2VSCzPp5/yxcFtdyi
 VRjd6IKbxjRx7NaNEYZW3OyTfTk2OZdXpO1oTQkJEqKpueu6pvInIFS5SbB3ZHPKuGP6
 PhCNKDO0XQDrbszz7iI/OYDfKXllQevjoIVk+W1F5Z+H/WTk3rwk3KzPmENNXZX4wMTi
 vHMnYcNKEVT7HOG1ueFU2ogb788ZcjjlDfvkdciJtISxTyFHg/D4Xc6YoH4CB+WZ/Bwo
 sP2RXfDebRjRRAqMWstuXcS31bx+BUnkyz6rnAK3LeXwxe44YajGQNNpcJCbLx+eeV77
 Xf4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Nilvj0BCNWHsyq1W7awlCSFRX2jOx57s9HjwLir53WA=;
 b=jVQdCTjitN6Haz7p9aKcDcJVbrl7aaNYLZfUqGV5lvaRRFXS/Aq0yBrIZn5a7kSm9R
 9f9NwdEpL0QBsbNeDKZ9XcwG/a4+KooU7uqT4M0SouPJXr9hzTdTZZ8WHu33O2bOQRXc
 D8hgbOKIgx8j9yWRefbHut0CAvolnmLLmKyxXAE78EenWXpJtva0tBGV+74f3uNHtJwj
 9H1sd1h1OBvN9DwOgHhcAKbcijf/mpK32uA5FpiXNzwIkklEKj8isWgpcLyaQ+u2fBGF
 HZHmw3fruHy8c6/2Y8KrqH4juDd7Q9ki5pwAspStPPm2xMIlruf8CUGTkY84RRXRS9XL
 QYuA==
X-Gm-Message-State: AOAM531WxpN9nVVND2KSRJBUfrL7nJEwf79SFmPUjRsej1AbJisyrspZ
 Pv9FUgqXKmzKmj+tssfMxZLA4MvEplNFB7jrlnmVZy+2mBc=
X-Google-Smtp-Source: ABdhPJxp9XhtFnKoflB76MTWzHr6/mQhe0VNIY3phx28RDnkMpdeIipOPEKfQgAmIMfAAVSM9xYcOp2aHV+dug8jOAI=
X-Received: by 2002:a05:6512:13a0:: with SMTP id
 p32mr11523368lfa.492.1633544713324; 
 Wed, 06 Oct 2021 11:25:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210813145302.3933-1-kevin3.tang@gmail.com>
 <20210813145302.3933-7-kevin3.tang@gmail.com>
 <20210917154047.leojvqjqjj2sg34l@gilmour>
 <CAFPSGXZbqh0f6kEoQaq_Nt677ksVS6QPdAa5==KVVAszSAuasw@mail.gmail.com>
 <YVCgznmOA97v30wG@ravnborg.org>
In-Reply-To: <YVCgznmOA97v30wG@ravnborg.org>
From: Kevin Tang <kevin3.tang@gmail.com>
Date: Thu, 7 Oct 2021 02:25:02 +0800
Message-ID: <CAFPSGXbap3QsaofzRnJ79eOro3Z5DNN0Kj_v3ZaTn8pdSf=m8g@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] drm/sprd: add Unisoc's drm mipi dsi&dphy driver
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Maxime Ripard <maxime@cerno.tech>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, pony1.wu@gmail.com,
 Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sam,
Thanks for your response.

Sam Ravnborg <sam@ravnborg.org> =E4=BA=8E2021=E5=B9=B49=E6=9C=8827=E6=97=A5=
=E5=91=A8=E4=B8=80 =E4=B8=8A=E5=8D=8812:33=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Kevin,
>
> > > > +     reg->_0b.bits.out_sel =3D pll->out_sel;
> > > > +     reg->_0b.bits.kint_l =3D pll->kint & 0xf;
> > > > +     reg->_0e.bits.pll_pu_byp =3D 0;
> > > > +     reg->_0e.bits.pll_pu =3D 0;
> > > > +     reg->_0e.bits.stopstate_sel =3D 1;
> > > > +     reg->_0f.bits.det_delay =3D pll->det_delay;
> > > > +
> > > > +     val =3D (u8 *)&reg;
> > > > +
> > > > +     for (i =3D 0; i < sizeof(reg_addr); ++i) {
> > > > +             regmap_write(regmap, reg_addr[i], val[i]);
> > > > +             DRM_DEBUG("%02x: %02x\n", reg_addr[i], val[i]);
> > > > +     }
> > > > +}
> > >
> > > It would be great to also convert this part to a pattern without
> > > structures.
> > I will try it, but our pll registers, all not have official name from
> > aisc design owner.
> > If need to convert it, our pll regiters macro define, it can only be
> > named as reg_01, reg_02...
> IT is better to use the stupid names provided by you asic design owner,
> than just numbers. Add a comment explaining this is due to the asic
> design owner the names are stupid and not your fault.
The chip manual released to us by the asic designer is like this for
many years ago.
As for the specific reason, unable to find out now, i will try use
"stupid names" rather than numbers.
>
> > > > +
> > > > +     if (dsi->panel) {
> > > > +             drm_panel_prepare(dsi->panel);
> > > > +             drm_panel_enable(dsi->panel);
> > > > +     }
> > >
> > > Please use the new devm_drm_of_get_bridge helper here, and use the
> > > bridge API instead.
> > We use drm_panel_init and drm_panel_add API to add panel, so here is a
> > panel device, not a bridge.
>
> The new way to do this is to always wrap the panel in a bridge. We will
> start to slowly migrate away from direct use of the panel API, and let
> display drivers always wrap the panles in a bridge.
> So please do as Maxime suggests.
I only found a demo about the use of devm_drm_of_get_bridge in the vc4
dsi driver, i
will try to follow it.
>
>         Sam
