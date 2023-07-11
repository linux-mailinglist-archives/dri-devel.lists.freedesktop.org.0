Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5445474E8F6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 10:24:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F5210E335;
	Tue, 11 Jul 2023 08:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [IPv6:2607:f8b0:4864:20::e2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E193410E335
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 08:24:21 +0000 (UTC)
Received: by mail-vs1-xe2d.google.com with SMTP id
 ada2fe7eead31-444c42f608aso1479765137.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 01:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1689063860; x=1691655860;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZrU6Xsa0V1WqXVV3JvJ4wrZDM66k/gtoRFytP7Ma7bo=;
 b=Zn90hdmXUldF2ronB05z91XulUpY5khDBEA+ng1+csphiBZUG6o8nkV8Udqrdd6HNL
 pMxpmS/REWgMsBl1VTfAQFp84IRHmByxf9Cf66w2CcNcfAAAmVqlO29jnIW1opWKa5Cj
 OGkTd/bw976/iDBA3woknN+6uo23kLw+XzmGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689063860; x=1691655860;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZrU6Xsa0V1WqXVV3JvJ4wrZDM66k/gtoRFytP7Ma7bo=;
 b=DbzXUMD39+AknwZx288Alq1mRyeovU3m8qN86allCflZmjWRsQbb2FIDhDEbGQLmqf
 gqH2RJcD3VyJe2iKDx4KX1W+KPWi8I9D9e3onD9L72G+YcOzHONGMNZQWZ4qbVQb5cZX
 EY6rXtOLnJKN7wrqh7/cxcP3igMVBKOlMJ7iU7G2WDZDk5F+Du+b7Yk0jOndNvHW3tsR
 ambF7jk12zgJhAncZLb7L4AWGwE4jGgMXmHMgTa2X0rBRM83j+/Npbl4vAQrtcZlurGj
 BZzIxzq/W2xe1RYgg1yekoD/sgRZxqAA1OnwlsSM3idM8O1n9nCQYA7UO8Ppo4wOLxvY
 I/jw==
X-Gm-Message-State: ABy/qLZhnppQV5UobX48sZoR7dsUMQ0PyKQDG+izFrhLAkk1KQGAFrTG
 WNSIwLbkgNlbV3AoDFBeiZPDQRuuq4q1rsxA17DQQQ==
X-Google-Smtp-Source: APBJJlGOAQTq/vj1kFR6kgaTzRdb1DuZFGS44SFaTUtxEdPu90Dcdy9xdEtT0Q8SqXK2puCM5yU8nHcI26PaLZQkh5M=
X-Received: by 2002:a67:ffca:0:b0:443:6052:43a4 with SMTP id
 w10-20020a67ffca000000b00443605243a4mr6816204vsq.20.1689063860537; Tue, 11
 Jul 2023 01:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230710090929.1873646-1-wenst@chromium.org>
 <87edlgjbvg.fsf@intel.com>
 <CAGXv+5HPaJf_M0nAgaGsUZ3mG=BFhTkS-ASbMwjL4K8CRkxChA@mail.gmail.com>
 <87lefmj4iu.fsf@intel.com>
In-Reply-To: <87lefmj4iu.fsf@intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 11 Jul 2023 16:24:09 +0800
Message-ID: <CAGXv+5HBVuVPCaFii07PNvzoDJwyULMdkydku1=vCnTC6uZduw@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/bridge: anx7625: Use common macros for DP
 power sequencing commands
To: Jani Nikula <jani.nikula@linux.intel.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 11, 2023 at 3:23=E2=80=AFPM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Tue, 11 Jul 2023, Chen-Yu Tsai <wenst@chromium.org> wrote:
> > On Mon, Jul 10, 2023 at 6:32=E2=80=AFPM Jani Nikula <jani.nikula@linux.=
intel.com> wrote:
> >>
> >> On Mon, 10 Jul 2023, Chen-Yu Tsai <wenst@chromium.org> wrote:
> >> > The DRM DP code has macros for the DP power sequencing commands. Use
> >> > them in the anx7625 driver instead of raw numbers.
> >> >
> >> > Fixes: 548b512e144f ("drm/bridge: anx7625: send DPCD command to down=
stream")
> >> > Fixes: 27f26359de9b ("drm/bridge: anx7625: Set downstream sink into =
normal status")
> >> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >> > Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> >> > ---
> >> > Collected tags and rebased on v6.5-rc1.
> >> >
> >> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
> >> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >> >
> >> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu=
/drm/bridge/analogix/anx7625.c
> >> > index 8b985efdc086..9db3784cb554 100644
> >> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> >> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> >> > @@ -931,8 +931,8 @@ static void anx7625_dp_start(struct anx7625_data=
 *ctx)
> >> >
> >> >       dev_dbg(dev, "set downstream sink into normal\n");
> >> >       /* Downstream sink enter into normal mode */
> >> > -     data =3D 1;
> >> > -     ret =3D anx7625_aux_trans(ctx, DP_AUX_NATIVE_WRITE, 0x000600, =
1, &data);
> >> > +     data =3D DP_SET_POWER_D0;
> >> > +     ret =3D anx7625_aux_trans(ctx, DP_AUX_NATIVE_WRITE, DP_SET_POW=
ER, 1, &data);
> >>
> >> So you have code to implement the drm dp aux abstractions, why aren't
> >> you using drm_dp_dpcd_writeb() and friends here?
> >
> > I didn't write the original code. Nor do I do much DP stuff. IIRC someo=
ne
> > pointed out to me these had proper macros, so I converted them.
> >
> > Would you accept a follow-up patch to convert the AUX transfers to the
> > DRM abstractions?
>
> I believe they would be welcome, but I'm personally not familiar with
> the driver in question.

OK. I take it you are not blocking this patch then?

ChenYu
