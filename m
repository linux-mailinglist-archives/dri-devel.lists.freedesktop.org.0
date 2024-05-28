Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D336B8D1514
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 09:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02AF410E0CB;
	Tue, 28 May 2024 07:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="rXRSNI9h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D6F710E0CB
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 07:13:38 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-627efad69b4so4560387b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 00:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1716880417;
 x=1717485217; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kYF5IHcfckC0APtkdja1Ko0BdMw5bz3HKSZAuIfw6hQ=;
 b=rXRSNI9he3iTPSrHtbQHgQymub3UbGCCj0N2eaxKl1RgA7TD/oZd+o/B3sABc9NHFw
 Wjj249IZrLTcH39tffcQw8G8C2Ym6j+VNwhMDwpaDhgJQNaJVxRD3uUYGo21NnNyGv1q
 tQQkAgv4vMuNz1DJq/AjsqAG/KwSwX2+aECo77q6uhrA7bWrmgg4KHvOm+pCY9vIdN5o
 DvcUnsRhwdZaQMTF9ylWgw1oJh4yyPySDwyzEeTaLpEKrdjCCZPqfqxV4eUBEG0ULuAS
 3tSpbD+9MEz1TzbmPOAq3vvH3WQQMNMmyXJFZe/f7vEP3JNn80QQrKESVEH8OAVgJqbP
 V6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716880417; x=1717485217;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kYF5IHcfckC0APtkdja1Ko0BdMw5bz3HKSZAuIfw6hQ=;
 b=cG9XUQJz3G4qKRSwdW+73nZGrE4sizfjJQEHQtyeV7M9fm209ECYzh9a0hPMCW8vyE
 GlzqGvbLOYw9Ts3v22pTyRVZaJgjAid9j+yM/WQpRPCuJ1VwRt1YYTJCuDSw5DmQwwkT
 CYA9S5NBoR+wzFfI4cWG1SyT55KJ9CU08fN+O+H2uGM0uiQyQ3ZyjhkvyqymZ0YEsF7S
 hIjmCUZevNVs+rX1GddM6rwyvrj2cDnesYlEjsJwGe/A0bxw5msItasTFaaont9IbTvV
 rXWwrt/QH3Cu3O0b4oVKWDHVHJV9rIKR8PS/GjfEVG7VzkomZaJKn32yqSfa7E87pkZ4
 C5UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2XFaHtHOQFdQNAwo2T4+DjEDSokHwua12LK2yaQLo8eK065f04QBjanw0sjN4JD8hxgH74aXzO4NoItMFbhsipwu8+kNHZ6urkY161TwF
X-Gm-Message-State: AOJu0YwILD7RSBljj61VI07uhy17FWeVBkHUdWyov+y/w/0Ixo+WBpsn
 Noh/c3uuj9lj5M8PXvnfFnbNidJPGnKOfTHgPOhfVnNBieA5s9knz2Vg7I8Ct9k/4bjQUkOWdMP
 nrYA=
X-Google-Smtp-Source: AGHT+IFEfhmftPfvQJpqQtlcYKHK4IRQlf4rl57anYFSuj4wcg1ut/OqCUEVKQFKp8w0RgSz23k/4Q==
X-Received: by 2002:a0d:df4c:0:b0:61b:eb65:4a87 with SMTP id
 00721157ae682-62a08ee9ff1mr100326247b3.48.1716880417434; 
 Tue, 28 May 2024 00:13:37 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com.
 [209.85.128.182]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-62a0a3bfa19sm19135697b3.44.2024.05.28.00.13.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 00:13:37 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-627e3368394so4936297b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 00:13:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUmMCJvEJA5EjlUgz023lPfCpGf7dAXE2E3k5+gPvgX9i+zhrO7INSWtuYuOUA+jYdYBUwwn0mCDXql6R4sqD4QX+zJFGHBXi6/2FEEM/s5
X-Received: by 2002:a81:49cf:0:b0:61b:3346:eb60 with SMTP id
 00721157ae682-62a08d87da6mr111183687b3.22.1716880416501; Tue, 28 May 2024
 00:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAAObsKAw174AhGaA13Hyw0ANW=TxJHpK10+OwQGNMVca85Urdg@mail.gmail.com>
 <ZkyPoIXBeBUqFJ48@phenom.ffwll.local>
In-Reply-To: <ZkyPoIXBeBUqFJ48@phenom.ffwll.local>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 28 May 2024 09:13:25 +0200
X-Gmail-Original-Message-ID: <CAAObsKBdpoGF0B9XgQxbG0P4JXAXSdLLdhzhrdAkt7J7rtCZ6Q@mail.gmail.com>
Message-ID: <CAAObsKBdpoGF0B9XgQxbG0P4JXAXSdLLdhzhrdAkt7J7rtCZ6Q@mail.gmail.com>
Subject: Re: DRM Accel BoF at Linux Plumbers
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 open list <linux-kernel@vger.kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Oded Gabbay <ogabbay@kernel.org>, Olof Johansson <olof@lixom.net>, 
 Lucas Stach <l.stach@pengutronix.de>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Cancan Chang <Cancan.Chang@amlogic.com>, Jiho Chu <jiho.chu@samsung.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Alexandre Bailon <abailon@baylibre.com>, 
 Dejia Shang <Dejia.Shang@armchina.com>, Toby Huang <toby.huang@armchina.com>, 
 Chengkun Sun <CK.Sun@armchina.com>, Cai Huoqing <cai.huoqing@linux.dev>,
 matthew.bentham@arm.com, Kieran Bingham <kieran.bingham@ideasonboard.com>
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

On Tue, May 21, 2024 at 2:12=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch> wro=
te:
>
> On Sat, May 18, 2024 at 10:46:01AM +0200, Tomeu Vizoso wrote:
> > Hi,
> >
> > I would like to use the chance at the next Plumbers to discuss the
> > present challenges related to ML accelerators in mainline.
> >
> > I'm myself more oriented towards edge-oriented deployments, and don't
> > know enough about how these accelerators are being used in the cloud
> > (and maybe desktop?) to tell if there is enough overlap to warrant a
> > common BoF.
> >
> > In any case, these are the topics I would like to discuss, some
> > probably more relevant to the edge than to the cloud or desktop:
> >
> > * What is stopping vendors from mainlining their drivers?
> >
> > * How could we make it easier for them?
> >
> > * Userspace API: how close are we from a common API that we can ask
> > userspace drivers to implement? What can be done to further this goal?
> >
> > * Automated testing: DRM CI can be used, but would be good to have a
> > common test suite to run there. This is probably dependent on a common
> > userspace API.
> >
> > * Other shared userspace infrastructure (compiler, execution,
> > synchronization, virtualization, ...)
> >
> > * Firmware-mediated IP: what should we do about it, if anything?
> >
> > * Any standing issues in DRM infra (GEM, gpu scheduler, DMABuf, etc)
> > that are hurting accel drivers?
> >
> > What do people think, should we have a drivers/accel-wide BoF at
> > Plumbers? If so, what other topics should we have in the agenda?
>
> Yeah sounds good, and I'll try to at least attend lpc this year since it'=
s
> rather close ... Might be good to explicitly ping teams of merged and
> in-flight drivers we have in accel already.

Good point, I'm adding a bunch of people to CC, but I will be for sure
missing at least some, so I would be glad if people can check that
those that they know weren't missed.

Thanks,

Tomeu
