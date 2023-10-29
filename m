Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 141AD7DAD4C
	for <lists+dri-devel@lfdr.de>; Sun, 29 Oct 2023 17:52:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B584D10E0C9;
	Sun, 29 Oct 2023 16:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2BD910E0C9
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Oct 2023 16:52:33 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-5af5b532d8fso26758827b3.2
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Oct 2023 09:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698598352; x=1699203152; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Aoy1l/OIWuZyO9Z9oXh2HgTPM0zwmwHlZqeVfBp4F14=;
 b=UHX5canh5EswlZczq2BN8dAApH8pC0NBHutJ5dSbj73IVjQ8BcJUBsxyhPq7zBF7VK
 Fxn7q0V2CFAkdJ0RMzCTnm1iXlcFo1zqHp9u6zSd8Jwj3d5T8iM3O2RP2APTZUuaxiTW
 0ZurwLDf/KSQqehWRbP/gvqNK2G6lkOs1HMpUAv19Tv/a3DCc3Yq61Oe6ExbIQCauRcP
 gXxqDF/ruuo+xE6qZK9WWMXycHpNyemUl4RrJe+zfTbJpHB1ByQp4dii5nEdsAgvEerl
 kuHcDN8XBQQDqV07vh6RqDQl/kOwWEQlYyo+IcOLknnnPCDciWexIGsX/1wGMd/rPwjA
 BANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698598352; x=1699203152;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Aoy1l/OIWuZyO9Z9oXh2HgTPM0zwmwHlZqeVfBp4F14=;
 b=KMSW++xuC6pzE2fkGXZymtKko/SRQRu1UfWqE/oPlIn+nOQsoe4TDZAcTmkxRDfEE7
 Xa6nEg2D4nJ4EocUsh1Vta6qm/XWNXvWD4Jqeik02TO0TjKaOA9Kbn0D/BYo1AaSJhd2
 KMPpSdiNe0Oyr9HhpHZDnM39ZGrvMt+QERMu0aSogCCaqzCBTFDxUp5wiEYXh0BJJ1oV
 HhmMj2fdiCQFZduVg9/WiqB056lhqozBH+ggA4SnCuLLNoN8HqGIae4ASqA6cB/VxWEU
 tJUNSqCNS5TTgw1rbydeQlX8NW3NQmGnEHvdAVVKlYNLGijRkjbZOUbI7UNtx6cCh3sz
 WzGw==
X-Gm-Message-State: AOJu0Yzf5VsrvApPlzN2G5eGvV4O9hQ3frh4B40tFl7WJt6qKh862R94
 oawUJfNLqzWwbeRta41hyvIwAa3ZGdI8GKlfeV1jCw==
X-Google-Smtp-Source: AGHT+IFXSrP5aeoWhs3Y4D0eNG10IP70i3n/QShH9gKSv775NDiMg4SU6zfUoxyYEuuq+a+adTKElsBDmpSGQ+aBEhI=
X-Received: by 2002:a81:e50c:0:b0:5ad:a3f9:1b10 with SMTP id
 s12-20020a81e50c000000b005ada3f91b10mr6688733ywl.10.1698598352517; Sun, 29
 Oct 2023 09:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <20231025103957.3776-1-keith.zhao@starfivetech.com>
 <20231025103957.3776-7-keith.zhao@starfivetech.com>
 <70805ff2-56a8-45e1-a31c-ffb0e84749e5@linaro.org>
 <3twc4zoohon7uujypgjtlnryfmebx4osvpykagnwr5nemmqz2w@w4vw55uswebh>
 <CAA8EJppxQ7J8DEDFsWzPL8bDpNW-KY0nhUA++zDBRpMCpP-bkA@mail.gmail.com>
 <344veqjvvwlo7vls2kdlgjggf77of2ijxwc2hmk7tarm75ugcs@bmozk23uqxqr>
In-Reply-To: <344veqjvvwlo7vls2kdlgjggf77of2ijxwc2hmk7tarm75ugcs@bmozk23uqxqr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 29 Oct 2023 18:52:24 +0200
Message-ID: <CAA8EJpomaDoJVkq+_NhcxqOs6X-dFd=Vo9Wtqnp8egNaWzDH2Q@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] drm/vs: Add hdmi driver
To: Maxime Ripard <mripard@kernel.org>
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Shengyang Chen <shengyang.chen@starfivetech.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jagan Teki <jagan@edgeble.ai>,
 linaro-mm-sig@lists.linaro.org, Rob Herring <robh+dt@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Keith Zhao <keith.zhao@starfivetech.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 christian.koenig@amd.com, Jack Zhu <jack.zhu@starfivetech.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 26 Oct 2023 at 14:53, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Thu, Oct 26, 2023 at 11:57:22AM +0300, Dmitry Baryshkov wrote:
> > On Thu, 26 Oct 2023 at 11:07, Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > On Thu, Oct 26, 2023 at 01:23:53AM +0300, Dmitry Baryshkov wrote:
> > > > > +static int starfive_hdmi_register(struct drm_device *drm, struct starfive_hdmi *hdmi)
> > > > > +{
> > > > > +   struct drm_encoder *encoder = &hdmi->encoder;
> > > > > +   struct device *dev = hdmi->dev;
> > > > > +
> > > > > +   encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
> > > > > +
> > > > > +   /*
> > > > > +    * If we failed to find the CRTC(s) which this encoder is
> > > > > +    * supposed to be connected to, it's because the CRTC has
> > > > > +    * not been registered yet.  Defer probing, and hope that
> > > > > +    * the required CRTC is added later.
> > > > > +    */
> > > > > +   if (encoder->possible_crtcs == 0)
> > > > > +           return -EPROBE_DEFER;
> > > > > +
> > > > > +   drm_encoder_helper_add(encoder, &starfive_hdmi_encoder_helper_funcs);
> > > > > +
> > > > > +   hdmi->connector.polled = DRM_CONNECTOR_POLL_HPD;
> > > > > +
> > > > > +   drm_connector_helper_add(&hdmi->connector,
> > > > > +                            &starfive_hdmi_connector_helper_funcs);
> > > > > +   drmm_connector_init(drm, &hdmi->connector,
> > > > > +                       &starfive_hdmi_connector_funcs,
> > > > > +                       DRM_MODE_CONNECTOR_HDMIA,
> > > >
> > > > On an embedded device one can not be so sure. There can be MHL or HDMI
> > > > Alternative Mode. Usually we use drm_bridge here and drm_bridge_connector.
> > >
> > > On an HDMI driver, it's far from being a requirement, especially given
> > > the limitations bridges have.
> >
> > It's a blessing that things like MHL / HDMI-in-USB-C / HDMI-to-MyDP
> > are not widely used in the wild and are mostly non-existing except
> > several phones that preate wide DP usage.
>
> And those can be supported without relying on bridges.

Yes, they likely can, in the way that nouveau handles I2C TV encoders.
But I don't think this can scale. We can have different devices
attached to the DSI, LVDS, HDMI and even DP image sources. I don't see
a scalable solution for either of them. E.g. by switching drm/msm to
use panel bridges for DSI panels we were able to significantly unify
and simplify code paths.

> > Using drm_connector directly prevents one from handling possible
> > modifications on the board level. For example, with the DRM connector
> > in place, handling a separate HPD GPIO will result in code duplication
> > from the hdmi-connector driver. Handling any other variations in the
> > board design (which are pretty common in the embedded world) will also
> > require changing the driver itself. drm_bridge / drm_bridge_connector
> > save us from those issues.
>
> And we have other solutions there too. Like, EDIDs are pretty much in
> the same spot with a lot of device variations, but it also works without
> a common driver. I'd really wish we were having less bridges and more
> helpers, but here we are.
>
> > BTW: what are the limitations of the drm_bridge wrt. HDMI output? I'm
> > asking because we heavily depend on the bridge infrastructure for HDMI
> > output. Maybe we are missing something there, which went unnoticed to
> > me and my colleagues.
>
> A bridge cannot extend the connector state or use properties, for
> example. It works for basic stuff but falls apart as soon as you're
> trying to do something slightly advanced.

Ack. I agree, we didn't have a necessity to implement properties up to
now. But that sounds like an interesting topic for DSI-to-HDMI bridges
and HDCP support. I'll need to check if any of the RB3/RB5/Dragonboard
bridges are programmed with the HDCP keys.
--
With best wishes
Dmitry
