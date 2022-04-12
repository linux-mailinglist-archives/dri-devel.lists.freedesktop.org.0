Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DD14FD5BD
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 12:14:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6E310E02A;
	Tue, 12 Apr 2022 10:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6127910E02A
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 10:14:45 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id k5so1235540lfg.9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 03:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=0Umzz/3orNHQpIevU9VMNB3lNCISCl1rxzO7PoUg9Jg=;
 b=frXOkEGTVdQfOBPfLo6/U0msIHVopok9BHPAtF9BQG1TpY/8Z9un/BUw3V1HIweJtQ
 W6cwDOA4s0H5XvVvDw9BGqxg4jzaE0YSB3GzP/jCtgDxNAOxuTmfnQJDVmGGozoPHeMP
 kaz0p8cgw2KUhZ5WDmsEE8oO62rgooT0CNAVJBL7X9KzGr4HNRwzn/PawukIcVGVgs/l
 SwykZ/+EX7cx0wWI38cyz1IYSSL80HQmf7P6nI9LxqevAeYqMfolVrMhsSHPJpJj9liT
 IcLv92fLQTmCKZzXOVSn4xnDP9gfrRMONo4NXJ0d2NgTAXFo1cVpizBH3I56rwNZZsU1
 aOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=0Umzz/3orNHQpIevU9VMNB3lNCISCl1rxzO7PoUg9Jg=;
 b=GyNXq0ozsVALdTlropzu0qmrVbq35MbTPn/E5Vp4qBsoOlBL34Q7qvHtQw7V1y9H0u
 GBzKTbFU831+pK/0D/JBxw1e4ddRzcAk8JzxiL7SBoM9f4hlf8p9zD/DZvWsYk0hOtY0
 2DrE7gdGtkRx5CRNDnJCtbgSv3Ao5n66cOGh46/Al4qYwpd9fwLXcaTMVzkVKQtlWp/T
 bNZ9nDOuV4fonPUkOl8sPaIoX9BydxAXnpKfEFQEQHt4s7UjJHp43Ib1IzP/ty+Btk7D
 tuWHt/8Mh9CCFbn5irvqvRlROqedjv5gt8AJ0XSI1Q71Azc39cDLfbAFCz2xYfkyk0F+
 qqDQ==
X-Gm-Message-State: AOAM531VPnepA+8DjpJ8HNYkrrlg12vwqRSNL5Yaggt06k7r5nPfe1Ls
 LODJke1a/9fN+lJIma4WhLc=
X-Google-Smtp-Source: ABdhPJyjygbNhDD5y/Nf2J02dsGMY17yvI0Q9aBaT9AoENk7aTCfqMn5oHs0B7C5tuon17rQnB7g3Q==
X-Received: by 2002:a05:6512:3403:b0:448:5f92:7b0c with SMTP id
 i3-20020a056512340300b004485f927b0cmr23864868lfr.237.1649758483494; 
 Tue, 12 Apr 2022 03:14:43 -0700 (PDT)
Received: from smtpclient.apple (31-178-191-245.dynamic.chello.pl.
 [31.178.191.245]) by smtp.gmail.com with ESMTPSA id
 y14-20020a2eb00e000000b0024b55cda2eesm1119589ljk.30.2022.04.12.03.14.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Apr 2022 03:14:42 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v9 00/23] drm/rockchip: RK356x VOP2 support
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <e2ef484b60fe9c5fc077240a26bd18275974dc4a.camel@pengutronix.de>
Date: Tue, 12 Apr 2022 12:14:41 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <EF0F8E87-2618-4E5E-807D-259FEEC0FB24@gmail.com>
References: <20220328151116.2034635-1-s.hauer@pengutronix.de>
 <FB201567-AE5A-4242-82F1-7C55D8F111EA@gmail.com>
 <20220401125205.GL4012@pengutronix.de>
 <5420D26D-34FD-4637-B602-F6271E38BB8D@gmail.com>
 <BA4C591F-D115-43D2-BF59-A75B29889E50@gmail.com>
 <20220408080748.GA2387@pengutronix.de> <20220408120021.GO4012@pengutronix.de>
 <B3E76A7A-9B62-4E6F-9472-00B6298689C5@gmail.com>
 <20220411090800.GR4012@pengutronix.de>
 <5929E7A7-776E-4BCB-92C8-A1CE05774FE3@gmail.com>
 <20220412075034.GS4012@pengutronix.de>
 <e2ef484b60fe9c5fc077240a26bd18275974dc4a.camel@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Lucas Stach <lst@pengutronix.de>,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> Wiadomo=C5=9B=C4=87 napisana przez Lucas Stach =
<l.stach@pengutronix.de> w dniu 12.04.2022, o godz. 10:10:
>=20
> This could be both a Mesa/Panfrost or application issue. The
> application is supposed to try to allocate with a arbitrary chosen
> format and the valid modifiers queried from the plane it wants to put
> the surface on. However I'm not sure if all applications have a
> fallback path in place to try another format swizzling if the surface
> allocation fails.

This is good remark imho.
I think we have this fallback.
I'll try verify this.

Generalising a bit - I think we my consider following cases:

a\ format is correctly negotiated and signalled to consumer/provider but =
we don't see expected results (=3Dcorrect screen seen by user)
b\ format was correctly negotiated but consumer/provider failed using =
signalled format (i.e. due bug in implementation)
c\ consumer or provider advertising - in reality unsupported format =
(false positive) - so negotiation resulting with signalling efficiently =
non-working format
 =20
Sascha says (in today's email):

"Here is your problem. The cluster windows only allow AFBC compressed
formats. AR24 is supported by the cluster windows, but not by the GPU,
see panfrost_afbc_format() in Mesa:"

I'm reading this as case c\ as Sascha said "negotiated format is not =
supported by GPU" ....but this format was negotiated.

......but for sure Sascha is much better than me here in subject - so =
i'm might be wrong here
   =20

> Now there are two possible failures here:
>=20
> 1. The application feeds a wrong modifier list to the GBM
> implementation, as it may have queried another plane in the assumption
> that supported modifiers are uniform across all planes.
>=20

This will be cardinal design error.
(keeping in mind we have multiple producers (GPU/video decoder) and =
multiple consumers (base & overlay DRM planes)
 =20

> 2. The GBM implementation (Panfrost) actually allocates a surface
> instead of failing the allocation, even if it does not support any
> combination of the provided format and modifier list.
>=20

Testing Sacha patch (see today's email from Sascha) i'm getting

Qt: EGL Error : Could not create the egl surface: error =3D 0x3009

i'm reading this as: Qt tries allocate EGL surface and EGL returns =
error.

or i'm wrong?

