Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1750190F2E9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 17:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC9410ED0D;
	Wed, 19 Jun 2024 15:49:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iXyF98Av";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 997C410ED0D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 15:49:18 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id
 a1e0cc1a2514c-80b58104615so1848353241.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 08:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718812157; x=1719416957; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sCo0S/t/wVuMA8QyWX9utK/82LOwdLvNdRyW93Wh9Zo=;
 b=iXyF98Avv+PvDxEWtXuWJ97GlSaMbtxXnkirTUrjZPFvz2nqaAtmuUsiQ4buBgHKES
 32GrnVIISUIqBqfZKxZo8d4dwVdNKX6XgtYkgUUiTH760Pc8lKiZHZ+2Ksb3bs3flcP7
 RLsP5A9puFW+zOYaYfCBpiaKsgIbI7Rk4a3Ho0Kv3GsIUDc+VovgUkrkdJf6YT2xX0pm
 GVuM8PNRPa2NumpbZUx9WPevcM1nL4gzWjQ88hYiWYk5a+5TxiQEWxkppyLLy14heEnp
 kmiNIOByioGhXI+3BYijuVffBRH1jG5RAWK9Urnt7a9eO0dkMDi/XETonZqU3vtV8/CI
 cxNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718812157; x=1719416957;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sCo0S/t/wVuMA8QyWX9utK/82LOwdLvNdRyW93Wh9Zo=;
 b=ZGlQVs3GLToSqTB4VhA2QqZ28n4yEGxBu9EGNJ2ymjg0OupxgekTtOePEI9ju/z2tZ
 jZ2VWYJVxoS7yukLo+oeaEgALC8QJwFrM/yTww4EVFnFlYA3H22t88scnnI3UntwLxub
 QQASTj/7kX1vnJtdbHkaTNKWkQXDcWcoQ0+gKWmw2lccy5m1mZKBbwQJmvcSgUNjResI
 kmm5yK2vj/shQVpTBV9mdambHSa21X8CJHKN/v0gnfmkOHxrah6TSiq0d9RRc/BgC8P1
 +zjmJ0chsMsAjUeiD34z3+/X8JW3SMLrHKrS2Ro3yiWxRNmkSC0o3dYjEAAGfHCHM/qv
 ssPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbwNT5jrorazNmcMN9/lcRHg1gUnEbkg2L5NxJ+mD3uL6iw+bswsmD2z2yBUIXEEIo0Me7eow9hn6l7jO3SbdPfOgseMHGZpcwwnXVC5NZ
X-Gm-Message-State: AOJu0YyGq2lcusKLqtgipkvuucj549e4jp8w0yvb94QsdBhN0BKeutA6
 WjaZTW6fSDAmf09tfyRC/XEAMlGLLaDZyb5UspoVscCegdNmvmSJehRkZI+F7emVnosAWf3ChhK
 J9DqLGuQB0Xwdcj3R5q94v3uob7E=
X-Google-Smtp-Source: AGHT+IHg0GWswSl3r9pwlr7iQjchG/nGHT//aM8i64MYsXIGAJArmngGDjmCxE9ZpGaKh9pHgPCRQReNLVUNTwTTHm4=
X-Received: by 2002:a05:6102:26ce:b0:48c:40cd:e4da with SMTP id
 ada2fe7eead31-48f1304b1c6mr3802757137.19.1718812157407; Wed, 19 Jun 2024
 08:49:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-18-e3f6662017ac@gmail.com>
 <4eab619f-6da9-4aff-b956-69d8e2ecd47f@sirena.org.uk>
In-Reply-To: <4eab619f-6da9-4aff-b956-69d8e2ecd47f@sirena.org.uk>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Wed, 19 Jun 2024 18:49:06 +0300
Message-ID: <CABTCjFDUKgeYWuwo8eLt+5WD=4O+kLbFwMRxsTufGnqK0Ecpvg@mail.gmail.com>
Subject: Re: [PATCH v3 18/23] regulator: add s2dos05 regulator support
To: Mark Brown <broonie@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
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

=D0=B2=D1=82, 18 =D0=B8=D1=8E=D0=BD. 2024=E2=80=AF=D0=B3. =D0=B2 17:08, Mar=
k Brown <broonie@kernel.org>:
>
> On Tue, Jun 18, 2024 at 04:59:52PM +0300, Dzmitry Sankouski wrote:
>
> > index 000000000000..3c58a1bd2262
> > --- /dev/null
> > +++ b/drivers/regulator/s2dos05-regulator.c
> > @@ -0,0 +1,362 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * s2dos05.c - Regulator driver for the Samsung s2dos05
> > + *
>
> Please make the entire comment a C++ one so things look more
> intentional.
>
Do you mean enclosing the first line (license identifier) in /* */
style comment?
