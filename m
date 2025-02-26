Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD0FA455FA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 07:49:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D5410E85A;
	Wed, 26 Feb 2025 06:48:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NMH43lJM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9655D10E85A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 06:48:56 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-6fcd8090fe7so34343737b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 22:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740552536; x=1741157336; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5m/fbILzLKGGykUZ6kboto9JC0GWzY5Dl1+z1wn1h9Y=;
 b=NMH43lJMMYz9Kp6V+DLFz48CPWO4CglmtNe5/nEBN/Iw0EZU4OJaGfdCqgfQ0RP0iP
 usvXrF9ffAfxgzSbJmLqCijXQ1LgSsFfusEbkbM3ZSXIlLQvLoWgU1IYu7ID1ZIgz5oF
 aLs9Q9NziwiH63DAS4CjwXM6yB6/X3h3Rl55lqPfHuUNzJXdU3iEMEA93TN5WfoeZrHw
 rzrUFyQ205iTgwGWu0Z0AvGAI9CZk6toyCCzhTEHaHbrxTEinOqENscDYIvq98Yml8Ry
 iquBJlJyD7WznksJDklcl23JqFSj1ja44OGt/dDXRMAFXNFKBCWx6nk82DJpizDy91O1
 /ZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740552536; x=1741157336;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5m/fbILzLKGGykUZ6kboto9JC0GWzY5Dl1+z1wn1h9Y=;
 b=p2kmy/ld3OozJzSzefRkIewQ3z8KznAjOYxvcBA+Ea6bBQPyGcFHTWxmWUD/ptqVrW
 PkR9ySnUbvbr+vLZItfQsIq7YbBJZsyHjMzf/jqpByONx7JM2/YI3z0Vit2ziaV2Mcqn
 qJjfJu3ubRGZ7aZmpEpEpCD04Dl4gGDjeO3pBlpGxKuuLVs1VvRfdALcLbL9ppu3/4HP
 kl9dH03ibhWQY/0vX8Vn/fsnAPy2o7DFK+0FiR2M8JEeu1zmU4QNkLvdMu+ZH7nC950S
 do9prWNPjlpxmj3tM98BMNpvpw/DQMEP+Eu4SGlWGzr9PO/a6YnpQKHnZrmUKEK2Ygvv
 OAhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeXlk9AA9RtwQNU0nOGAnFV5OFt0r+zsUdhGZ5OjdPPJIpsJIURtF3x7n1TXZ9iO9e4tUyxQwYJQw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPrmS4rkkvgWXWDDl4J2LXK97yoCU6LUbkJ9OCEm81tnRvXjTN
 GQm2Weg36tQlBuyQ0HN7OXnQqhqUc6FRNdvSJUZ2hi7Q/GmT9AkGnczv9Q43f5cROhMh+itcQcr
 BIoUhBGQ1xkKhcN5K8buuHWqfnbyVYNDuMhHISw==
X-Gm-Gg: ASbGncuKDnCXJBuRNnKX37xpZikdL7RdRPjRZXvwEINykCsF6aONYJOSpp9yfv2wAXZ
 lrovpLilOZ6/5Halu3c6xUtl97d7H7XIgxPdjDTadX1eDhAgORT1f9Nsk0yMaQk8WND9ZOaQPw2
 1jJotTo9gg
X-Google-Smtp-Source: AGHT+IF78VTStupIwYIS0Xq3cT2iRwmchECX+kjak3P5Tm3vcYMtlr86loyt0dtlQrayF4yn4dAqOJK1+HKDJC1oQk0=
X-Received: by 2002:a05:690c:62c3:b0:6fb:b78a:c0e5 with SMTP id
 00721157ae682-6fd10ae9888mr57823187b3.28.1740552535692; Tue, 25 Feb 2025
 22:48:55 -0800 (PST)
MIME-Version: 1.0
References: <20250225083344.13195-1-clamor95@gmail.com>
 <20250225083344.13195-4-clamor95@gmail.com>
 <lkfxsq3daspjxdw43dofch3nulprpmg4soxsgflsypu3kem4ok@utt6rfdtbg7j>
 <CAPVz0n3Jc5GE5szjPGJXJNjKVfynvqmzSuZLba5XbLPtcycjwQ@mail.gmail.com>
In-Reply-To: <CAPVz0n3Jc5GE5szjPGJXJNjKVfynvqmzSuZLba5XbLPtcycjwQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 26 Feb 2025 08:48:44 +0200
X-Gm-Features: AQ5f1Jo0ziMos-3sSTHfrs6FFx8jw2_DfiVlri5rOMnAr3cY5ATon22-G_m3rIA
Message-ID: <CAA8EJprfD8pQVe=KKd1WaTtGf8UPZ2ndep56stZOV7Fx0NwgsA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/bridge: simple-bridge: Add support for MStar
 TSUMU88ADT3-LF-1
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Maxim Schwalm <maxim.schwalm@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Tue, 25 Feb 2025 at 14:02, Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> =D0=B2=D1=82, 25 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 13:57 Dm=
itry Baryshkov <dmitry.baryshkov@linaro.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Tue, Feb 25, 2025 at 10:33:44AM +0200, Svyatoslav Ryhel wrote:
> > > From: Maxim Schwalm <maxim.schwalm@gmail.com>
> > >
> > > A simple HDMI bridge used in ASUS Transformer AiO P1801-T.
> > >
> > > Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > Reviewed-by: Robert Foss <rfoss@kernel.org>
> > > ---
> > >  drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm=
/bridge/simple-bridge.c
> > > index ab0b0e36e97a..c0f1f7baaa37 100644
> > > --- a/drivers/gpu/drm/bridge/simple-bridge.c
> > > +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> > > @@ -277,6 +277,11 @@ static const struct of_device_id simple_bridge_m=
atch[] =3D {
> > >                       .timings =3D &ti_ths8134_bridge_timings,
> > >                       .connector_type =3D DRM_MODE_CONNECTOR_VGA,
> > >               },
> > > +     }, {
> > > +             .compatible =3D "mstar,tsumu88adt3-lf-1",
> > > +             .data =3D &(const struct simple_bridge_info) {
> > > +                     .connector_type =3D DRM_MODE_CONNECTOR_HDMIA,
> > > +             },
> >
> > This entry should also come between adi,adv7123 and ti,opa362.
> >
>
> Original list in the driver is not sorted alphabetically.

I'd say, it is, except for the special dumb-vga-dac entry.


--=20
With best wishes
Dmitry
