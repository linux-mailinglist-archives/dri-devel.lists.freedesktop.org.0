Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6467F6D91C7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 10:37:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF85C10EB2D;
	Thu,  6 Apr 2023 08:37:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A5E10EB2D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 08:37:46 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-183f4efa98aso468979fac.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 01:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680770265;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CJseOoFeLU397COS8+SiCqUvVdGE4HhjRjTP11dBWtA=;
 b=iSBvWUqn5qOxvXcLD8i1QG8h+gJJuz45aLiDGKvxTGiXmYNldG0XFLFibj5eukZLWL
 wKSc09RPYg8/DIZCtbP4nXHODlcmhhPspkR64Ro0dTPgB1nRF4FrBfpEtoO9BJyt+6GO
 3Q+N+UiXJ7DOEqwCzSQDzhE+KhMRCC93GU32M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680770265;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CJseOoFeLU397COS8+SiCqUvVdGE4HhjRjTP11dBWtA=;
 b=hNKZbKTEh6DXXVCMxfeJ5TqMbmnW3tTR3eTLQSQnhZSYSDLg89rhCVF5pnQom1Pzd8
 TR17sOoYwKYF+g6Ep7YuD0ugCpipeGrPubWJErOmrGbhL8Ls9eHOC6iBc+3Sa8L+UL0R
 65PZ65NeVmPGfbn/ooDaxYfAgJMkqWkXPiC1Dh4lqJ2aIRzc8MnKjBRf7pwZFwBjAJTT
 uMUmYgIEF5ub7YM0O0ce86e+Ood9QLE/RdRhbx5jqX5BtKR6kbChEB4n/3mudWXw5XlM
 nsuA273rqQN4Z0KiJqpUEGMecn2I/FMtx+93Nbvtgeqo/Dv95UaGks7/0Ey1COvY7Xq+
 yyYQ==
X-Gm-Message-State: AAQBX9ffRqNvxDOqIO2jvq8fA8VVT56/LJoBX+6hmglv2piyFs9qBY7A
 bp1si2GPNBqYIEL9CuemyP50ZGjK6YCwphbyx9aAW7YCZJDp+Lyv
X-Google-Smtp-Source: AKy350YiHm+7zpuJ8JfPUmv+ai+6nci6R8xfUljWUvdvb2uopHWOGC8kz5TKv7OkYv9Y0GAWcZ2k/IHAOq3SBG8lWiU=
X-Received: by 2002:a05:6870:339e:b0:17e:7304:6a98 with SMTP id
 w30-20020a056870339e00b0017e73046a98mr4301207oae.8.1680770265548; Thu, 06 Apr
 2023 01:37:45 -0700 (PDT)
MIME-Version: 1.0
References: <2991779.e9J7NaK4W3@steina-w>
 <CAMty3ZAQyADGLVcB13qJdEy_BiZEKpyDfCr9QrM-ucFLFPZLcw@mail.gmail.com>
 <3727424.e9J7NaK4W3@steina-w>
In-Reply-To: <3727424.e9J7NaK4W3@steina-w>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 6 Apr 2023 10:37:34 +0200
Message-ID: <CAKMK7uFXvGu7E9w3a+5DUCqUoXXJd2jcDhWP-i_uk4pBVr0vyA@mail.gmail.com>
Subject: Re: RFC: DSI/DRM multiplexer bridge
To: Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding the usual bridge maintainer/review folks since this looks tricky.
-Daniel

On Thu, 6 Apr 2023 at 10:33, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi Jagan,
>
> thanks for your reply.
>
> Am Mittwoch, 5. April 2023, 16:39:07 CEST schrieb Jagan Teki:
> > On Wed, Apr 5, 2023 at 7:39=E2=80=AFPM Alexander Stein
> >
> > <alexander.stein@ew.tq-group.com> wrote:
> > > Hi,
> > >
> > > my platform has a DIP switch controlled multiplexer for MIPI DSI outp=
ut
> > > signals. One output has a TI SN65DSI84 (LVDS) and the other output ha=
s a
> > > TI
> > > SN65DSI86 (eDP) attached to it. The Multiplexer status can be read ba=
ck
> > > from a GPIO. The GPIO is also IRQ capable, so it would be possible to
> > > support hotplug additionally later on.
> >
> > I have this requirement a year back [1] but my design has i.mx8mq DSI
> > outputs to SN65DSI84(LVDS) and ADV7533 (HDMI) and GPIO has muxed as
> > IRQ in order to find the bridge selection. (not confused with HDMI
> > HPD).
>
> Looks quite similar. This platform can be used using imx8mq, imx8mm or im=
8xmn.
> That mentioned GPIO is also not the HDMI HPD, but connected to a DIP swit=
ch on
> the mainboard to be changed manually.
>
> > > My initial idea was to create a DRM multiplexer bridge driver which
> > > (depending on the input GPIO) allows only one output to be enabled.
> > > Unfortunately ti- sn65dsi86.c driver expects a DSI host on remote nod=
e 0
> > > (see ti_sn_attach_host and ti_sn_bridge_parse_dsi_host), so it does n=
ot
> > > work. ti-sn65dsi83.c just requires a drm_bridge.
> >
> > Yes, we need to have a finite amount of pipeline changes. assuming
> > that your mux bridge sits between DSI to Output interfaces the
> > proposed mux bridge selects which pipeline.
>
> My setup looks like this, but the switch is a different one than yours.
>
>                               | =3D> SN54DSI86 =3D> DP Connector
> DSI Host =3D> display-switch =3D> |
>                               | =3D> SN65DSI83 =3D> Panel-Simple
>
> > > What is the best approach for this? I currently see two approaches:
> > > * Create an explicit DSI/DRM multiplexer bridge driver which register=
s
> > > itself as DSI host
> > > * Create a DRM multiplexer bridge (only). But this needs to remove th=
e DSI
> > > device registration from ti-sn65dsi86.c
> >
> > Based on my experience, having a muxed bridge between in and out would
> > be proper in order to satisfy the pipeline as well as the design. That
> > mux bridge has to be a normal bridge doesn't aware of DSI or any other
> > interface like one of the submissions has done in the recent mailing
> > list. [2] Things would be complicated when we switch the outputs but
> > we still use normal static switching of outputs in a proper way.
> >
> > > I am aware that DSI support is suboptimal, so I'm not sure which appr=
oach
> > > on the TI bridge drivers is the correct one and needs to be considere=
d as
> > > given. Any ideas?
> >
> > I did implement some complicated things of switching outputs at
> > runtime but the idea of the switching pipelines would be similar if
> > you want to implement it in a normal static way. Here are some details
> > and a demo of how those been worked. [3] [4]
>
> Thanks for the links. From what I read in those discussions dynamically
> (re)building the bridge chains it not correct/acceptable. Instead two bri=
dges
> shall be created, but only one connector at the end shall be enabled. Thi=
s
> would look like this:
>
>    switched-bridge
>     +------------+                 +-------------+
>     | drm_bridge-|- next_bridge -- | LVDS bridge |- connector
>     |            |                 +-------------+
> in -|            |
>     |            |                 +-------------+
>     | drm_bridge-|- next_bridge -- | eDP bridge  |- connector
>     +------------+                 +-------------+
>           ^
>           |
>       DIP switch
>
> But here I'm not so sure how an (hotplug) event (e.g. IRQ) on the switche=
d-
> bridge can be forwarded to the connectors. But this hotplug event seems t=
o be
> essential so that DRM master can reconfigure it's output.
>
> Best regards,
> Alexander
>
> > [1]
> > https://lore.kernel.org/all/CAMty3ZD7eFi4o7ZXNtjShoLd5yj3wn85Fm6ZNL89=
=3DQpWj4
> > 4KPw@mail.gmail.com/T/ [2]
> > https://patchwork.kernel.org/project/dri-devel/patch/20230218111712.238=
0225
> > -6-treapking@chromium.org/ [3]
> > https://indico.freedesktop.org/event/2/contributions/76/
> > [4] https://www.youtube.com/watch?v=3DPoYdP9fPn-4&t=3D624s
> >
> > Thanks,
> > Jagan.
>
>
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> http://www.tq-group.com/
>
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
