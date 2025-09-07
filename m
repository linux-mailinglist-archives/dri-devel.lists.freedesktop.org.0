Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC087B47A32
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 11:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF17D10E199;
	Sun,  7 Sep 2025 09:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AJzLyypQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2A710E199
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Sep 2025 09:43:34 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-45de56a042dso781595e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Sep 2025 02:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757238212; x=1757843012; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GZ/X6GOEUsW9+IFkzRBAiysCMqpUBrDHjoEhck1HoOk=;
 b=AJzLyypQULvTviiSMJWvJTXK+MdfeYjy1IVz6F+apepkCsExJk69wmSBMtsfge09MV
 MfhntrPgLo6QFG+uwnz1l3zztyjxc32R8g64tvfYekMO5M2TWvpJMmLJ4bCMaehAWaxn
 +1ggZyrw+9wefv4P1p/PNXNUGcswYsh6Ck7w5WNuA9B1sIwGVelpqJnsDmsTNyNAz225
 vP/P5OFpRVaP0d+fPZdSBYmglJLRjTg+jWV+5z2/JJ4pNIEASv0DyQMs0fri4vEoNPdl
 KdaAXeaddwQY7KSO5vUZCYN+TzTw880HC13bu/Iafo9f3J77rj4Sr3l9+3ik5udZno73
 pmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757238212; x=1757843012;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GZ/X6GOEUsW9+IFkzRBAiysCMqpUBrDHjoEhck1HoOk=;
 b=pjSrm9ilZCV2lQTJC+L6cseIc4ML09MRa0cWBg9bEh8sbPaww2NX6iq6dH8mteEnnj
 KL8EeWCf3kOs2wwMpPen3Ni7QqrdqhA+krCQm+U1w2df3F2HgKTPiDewJu5mbDf8g9YV
 7dwdlfJD0x/RHiao4avN/EctuMToQkxM9QpysHoy2rgook1htEyez7T6YeaMGM4hOmsW
 ztkinA0xXKMFkf7HkzO3i97m22MPG2NrL+y71aNC7qbK9s8W1RYDw0u8e88beU21NE+v
 eNpkrn4As2w8SC7bQPuf77DHwo92LMB5svtdH0FSIfRNXGn2ik+QLAY1VfKYkuANCo1o
 czdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzMmHQ7wONLpPzj5M3WuSKK2uv7vfYGGIVhzRQmkKCu2m2R39eaIfgU9zn5eAuPySOcOYiDrMnUR4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCepaeSkV/xkFHuCVnYn9Q0SIW4eCrl70AFO+k4JKAreT02zum
 IZbUFRMc19v0RCt1iDZrHfI7QXmHGsM2p6aiVPrRgaMnZy36npSE34FKRyPJh+NiYe78WZ0Vj36
 EcY3xePggYrRP5SYeIiosexVteuv3Pu4=
X-Gm-Gg: ASbGncsgcl4iyQfe/yN5xVkQPxWE5XIPfjgVhO6cfPVbguSVekDejKD2swCVoMmKtZj
 TPTmBkJicRwaquH/ejnPUk9NNPfgTPcYF/jl42SGYNZLV60vEDsxemli5mSROIknflb5hj9rkuV
 VOdD5hYbN1SMYKDdMxnjIUucreePiGNyxRRjzM8fnp1NqD1lp42acYQj0perEx02X4jV8FgrlzJ
 j0A8Fkq
X-Google-Smtp-Source: AGHT+IFPqig/UhEDyt4I8/2ZJlpITCSmd+DYWg5033ITXHJTPMBD050/gyXsr+9sNyIaTUs7NwKlwoEiYgPtX0PKgHs=
X-Received: by 2002:a05:600c:3b25:b0:45b:9a41:5d58 with SMTP id
 5b1f17b1804b1-45dddea60cbmr35564895e9.4.1757238212151; Sun, 07 Sep 2025
 02:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250906135345.241229-1-clamor95@gmail.com>
 <20250906135345.241229-3-clamor95@gmail.com>
 <20250907-arboreal-aquatic-gopher-686643@kuoka>
In-Reply-To: <20250907-arboreal-aquatic-gopher-686643@kuoka>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 7 Sep 2025 12:43:20 +0300
X-Gm-Features: AS18NWARBXRzhLtN6n3ce6WfDFCnzLq5yKlMbMSeV1CuL4QdfN0Ud8kVvzMMu8Y
Message-ID: <CAPVz0n0obwSFDup2n9R9SQNsOZw1Dm0G=2ifv=D7zyw=89+uYQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/23] dt-bindings: clock: tegra30: Add IDs for CSI pad
 clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>, 
 =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
 Charan Pedumuru <charan.pedumuru@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
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

=D0=BD=D0=B4, 7 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 12:34 Krzys=
ztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sat, Sep 06, 2025 at 04:53:23PM +0300, Svyatoslav Ryhel wrote:
> > Tegra30 has CSI pad clock enable bits embedded into PLLD/PLLD2 register=
s.
> > Add ids for these clocks. Additionally, move TEGRA30_CLK_CLK_MAX into
> > clk-tegra30 source.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/clk/tegra/clk-tegra30.c         | 1 +
> >  include/dt-bindings/clock/tegra30-car.h | 3 ++-
> >  2 files changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-te=
gra30.c
> > index ca367184e185..ca738bc64615 100644
> > --- a/drivers/clk/tegra/clk-tegra30.c
> > +++ b/drivers/clk/tegra/clk-tegra30.c
> > @@ -53,6 +53,7 @@
> >  #define SYSTEM_CLK_RATE 0x030
> >
> >  #define TEGRA30_CLK_PERIPH_BANKS     5
> > +#define TEGRA30_CLK_CLK_MAX          311
>
> Unused define drop.
>

Specify, your comment is not clear.

> Also, don't mix bindings and drivers. You cannot create such
> dependencies.

I literally did what you told me to do! TEGRA30_CLK_CLK_MAX was
removed from binding, but it is used by the driver, so how you propose
to handle this without redefining TEGRA30_CLK_CLK_MAX and breaking
build with missing TEGRA30_CLK_CLK_MAX?

>
> Best regards,
> Krzysztof
>
