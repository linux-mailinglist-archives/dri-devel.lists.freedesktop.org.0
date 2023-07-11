Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC23E74E56C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 05:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBBCE10E2F6;
	Tue, 11 Jul 2023 03:42:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com
 [IPv6:2607:f8b0:4864:20::930])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8DE10E2F6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 03:42:23 +0000 (UTC)
Received: by mail-ua1-x930.google.com with SMTP id
 a1e0cc1a2514c-7948c329363so1767752241.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 20:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1689046942; x=1691638942;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Njt3Ks8h4H91aSe9Y34oWfsbhXfcKAW5IwH8sXjNG4o=;
 b=ErLdye0cTKi2RkUw95t6n18FDc51HiRKt8OT1ZEN2eQANsswcs7RIQdKomDzfaqN/l
 /aWaBxygT9plDea2fy/Q/wDRPE6guaEmZFK5QxADPemyZoI2cRY5kaBKG1RxP7QTHEZ6
 2dlpehTzMzEEwn1R1nrvfCxLXO2oMv2cg4+OY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689046942; x=1691638942;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Njt3Ks8h4H91aSe9Y34oWfsbhXfcKAW5IwH8sXjNG4o=;
 b=SBzz5lFqqxi33Y6vDO3T0h5ppodIY/GJwIVbBKFsmf50uea8bfPI5d+lD2sZDHTBCQ
 NlTZd+V+m1s6W8agfRu/yIqrt3eqOVYMGhGAd6GVkPgD0dd4IRO49l3kANXjjD/z/E9z
 nyJNmGOcHYgLZENqVloTpfF4QO1Pt5J+K+vC+mUjYPKnA8h2YnI5jsfP322ix/Qy7AtX
 lhoVqMAYllTD5QpK4AKkLVhVM6uKLXgasp+qYfj7xlCwi3rx2X8jokTy9AN758mRAsfc
 uoLrD87hedxtIJGbIhBpOAeIYTYa+5LMy3PzqTOaGQ7XTfmbupZNkiaY/jph3Al62+Cp
 h71w==
X-Gm-Message-State: ABy/qLbPr/mQRJBhRvK9JVIvV8iIMhg1ayNpVuw07mnnSEgP2AlcdkDJ
 awNHXf2360r9xedPVDbd0UeHka7fTffz2v2PevBHHg==
X-Google-Smtp-Source: APBJJlFvbyeKetjrozI3mnk55uXLN9gS8auD3FJkxsO4OUFinZWuOx1OsA5jHVJ+PmltkXlJ1D7B4WmhjCsRCpfeqBI=
X-Received: by 2002:a1f:d0c2:0:b0:471:b3f3:9bf9 with SMTP id
 h185-20020a1fd0c2000000b00471b3f39bf9mr6869698vkg.6.1689046941861; Mon, 10
 Jul 2023 20:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230710090929.1873646-1-wenst@chromium.org>
 <87edlgjbvg.fsf@intel.com>
In-Reply-To: <87edlgjbvg.fsf@intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 11 Jul 2023 11:42:10 +0800
Message-ID: <CAGXv+5HPaJf_M0nAgaGsUZ3mG=BFhTkS-ASbMwjL4K8CRkxChA@mail.gmail.com>
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

On Mon, Jul 10, 2023 at 6:32=E2=80=AFPM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Mon, 10 Jul 2023, Chen-Yu Tsai <wenst@chromium.org> wrote:
> > The DRM DP code has macros for the DP power sequencing commands. Use
> > them in the anx7625 driver instead of raw numbers.
> >
> > Fixes: 548b512e144f ("drm/bridge: anx7625: send DPCD command to downstr=
eam")
> > Fixes: 27f26359de9b ("drm/bridge: anx7625: Set downstream sink into nor=
mal status")
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> > ---
> > Collected tags and rebased on v6.5-rc1.
> >
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/dr=
m/bridge/analogix/anx7625.c
> > index 8b985efdc086..9db3784cb554 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -931,8 +931,8 @@ static void anx7625_dp_start(struct anx7625_data *c=
tx)
> >
> >       dev_dbg(dev, "set downstream sink into normal\n");
> >       /* Downstream sink enter into normal mode */
> > -     data =3D 1;
> > -     ret =3D anx7625_aux_trans(ctx, DP_AUX_NATIVE_WRITE, 0x000600, 1, =
&data);
> > +     data =3D DP_SET_POWER_D0;
> > +     ret =3D anx7625_aux_trans(ctx, DP_AUX_NATIVE_WRITE, DP_SET_POWER,=
 1, &data);
>
> So you have code to implement the drm dp aux abstractions, why aren't
> you using drm_dp_dpcd_writeb() and friends here?

I didn't write the original code. Nor do I do much DP stuff. IIRC someone
pointed out to me these had proper macros, so I converted them.

Would you accept a follow-up patch to convert the AUX transfers to the
DRM abstractions?

ChenYu

> BR,
> Jani.
>
>
> >       if (ret < 0)
> >               dev_err(dev, "IO error : set sink into normal mode fail\n=
");
> >
> > @@ -971,8 +971,8 @@ static void anx7625_dp_stop(struct anx7625_data *ct=
x)
> >
> >       dev_dbg(dev, "notify downstream enter into standby\n");
> >       /* Downstream monitor enter into standby mode */
> > -     data =3D 2;
> > -     ret |=3D anx7625_aux_trans(ctx, DP_AUX_NATIVE_WRITE, 0x000600, 1,=
 &data);
> > +     data =3D DP_SET_POWER_D3;
> > +     ret |=3D anx7625_aux_trans(ctx, DP_AUX_NATIVE_WRITE, DP_SET_POWER=
, 1, &data);
> >       if (ret < 0)
> >               DRM_DEV_ERROR(dev, "IO error : mute video fail\n");
>
> --
> Jani Nikula, Intel Open Source Graphics Center
