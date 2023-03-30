Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C79526CFC06
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 08:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58A7E10E13B;
	Thu, 30 Mar 2023 06:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2821110E13B
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 06:56:09 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-545e907790fso221980957b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 23:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680159368;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3A+wpr19CmQ1TBVKKYT6GbRWSRYO793ifnsMOlUiwbE=;
 b=OABucgc84fkecsB2apt/ogKzIf6bvpjaTQB9vmPKnxOjgqC3jbY5/6bWVmEs92Cyfb
 nUeuA2iJSLy46uwgpJxLgHKX6VHnAIltBZ5zi+aR26/iSoPeYRGWPUWbCU/pLnwSqLG0
 KcCsjBrSKWMx3nX1saQmuhKlPvarup2xrLNt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680159368;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3A+wpr19CmQ1TBVKKYT6GbRWSRYO793ifnsMOlUiwbE=;
 b=RCBey5pMtmKPmg1UD07IK805WrdQgDhn1QMHu/1dBw9HyRyPllr0kt6Cd6kiH4Jcsk
 LqGqeSJ4r+lnXhR0SNWZ7TXNAkmZS0VmFbccRe9bIHdli4mP4wAZAEkyaARJez4Giq3U
 pFALYDKqDjBaz1k/YFHcqV+UFMvSh+UKorcD/wCN5a1sGN4HJ6cwIG1dR0PDYCEtJpJd
 DEpl03CIJbV+hnn4awce3uO2huT+zr1UeC/zITh0k7UTYHxnWOjmVtUEvnCriuYaFkrx
 kaZNd4s07MHLx0ORgixeoNJjA0aBXlBXgO5AQCSsxTSoWcGYSiU7Mg76IhmbCM3Lvzy9
 6zPA==
X-Gm-Message-State: AAQBX9ebjrX5LRIEYTxkJRbIbcIKW0BU3FRgd+7C2ZyfkCS1tt1wuii8
 GKXjxj4WAVypEnajOZ+lXeyhjlGsaKMZjrgpQQpEqA==
X-Google-Smtp-Source: AKy350ZHJjZhJJwBBtdUqfaY6RG/76vwwThMMt3oK5B3TbQQEDFWJx0IY4u2AwSvrLkQBQtu5ALiwx0jgs6FaeAsOf0=
X-Received: by 2002:a81:ac46:0:b0:544:6828:3c09 with SMTP id
 z6-20020a81ac46000000b0054468283c09mr11139395ywj.0.1680159368210; Wed, 29 Mar
 2023 23:56:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230329131929.1328612-1-jagan@amarulasolutions.com>
 <CAPY8ntCJP53uiGNQHUZqma08Vsxfwm7KvAkgMzK=hn4AxJLS3A@mail.gmail.com>
 <20230329164638.v43la4l7rxut6hk6@penduick>
In-Reply-To: <20230329164638.v43la4l7rxut6hk6@penduick>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 30 Mar 2023 12:25:56 +0530
Message-ID: <CAMty3ZCsn6OR1-TvqFXP48iamG-k5sPU1_CH2fNLBQP3Ofb0QA@mail.gmail.com>
Subject: Re: [PATCH v7 10/12] drm/bridge: Implement enable_next_first to alter
 bridge init order
To: Maxime Ripard <maxime@cerno.tech>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 29, 2023 at 10:16=E2=80=AFPM Maxime Ripard <maxime@cerno.tech> =
wrote:
>
> On Wed, Mar 29, 2023 at 05:28:28PM +0100, Dave Stevenson wrote:
> > On Wed, 29 Mar 2023 at 14:19, Jagan Teki <jagan@amarulasolutions.com> w=
rote:
> > >
> > > DSI sink devices typically send the MIPI-DCS commands to the DSI host
> > > via general MIPI_DSI_DCS read and write API.
> > >
> > > The classical DSI sequence mentioned that the DSI host receives MIPI-=
DCS
> > > commands from the DSI sink first in order to switch HS mode properly.
> > > Once the DSI host switches to HS mode any MIPI-DCS commands from the
> > > DSI sink are unfunctional.
> >
> > That statement contradicts the spec.
> > The DSI spec section 8.11.1 Transmission Packet Sequences says that
> > during any BLLP (Blanking or Low Power) period the host can do any of:
> > - remain in LP-11
> > - transmit one or more non-video packets from host to peripheral in esc=
ape mode
> > - transmit one or more non-video packets from host to peripheral in
> > using HS mode
> > - receive one or more packets from peripheral to host using escape mode
> > - transmit data on a different virtual channel.
> >
> > Indeed if the sink doesn't set MIPI_DSI_MODE_LPM /
> > MIPI_DSI_MSG_USE_LPM, then the expectation is that any data transfer
> > will be in HS mode.
> >
> > That makes me confused as to the need for this patch.
>
> Yeah, and it looks like that would break the expectation that, in
> enable, a bridge can expect its controller to be in HS mode.
>
> I think that was Jagan is trying to do is to work around an issue with
> the Allwinner DSI driver:
> https://elixir.bootlin.com/linux/v6.3-rc4/source/drivers/gpu/drm/sun4i/su=
n6i_mipi_dsi.c#L775

Correct and I can see it seems to be a classic DSI sequence observed
in dw-mipi-dsi as well - based on Neil's comments.
https://lore.kernel.org/all/9aa3d19d-4378-aaf3-6857-c40be5d252c7@baylibre.c=
om/

In fact, I did follow and initialize the command-mode mode_set which
set low-speed DCS and switch back to video-mode @enable and switch to
HS but could see the same issue as the host cannot accept DCS as
before (I might implement improper sequence, but not sure due to lack
of documentation). But this sequence has issues with calling
post_disable twice even on dw-mipi-dsi.

May be Neill, can comment here?

Thanks,
Jagan.
