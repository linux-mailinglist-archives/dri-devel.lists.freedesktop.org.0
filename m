Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B7F97C9FA
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 15:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D6E10E6D4;
	Thu, 19 Sep 2024 13:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GM6WNubn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B64410E6D4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 13:17:57 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-4581e0ed0f2so16153471cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 06:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726751876; x=1727356676; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=anfCIpzkOCIiGL9EDPttCS594d1L2okUuXy0ncEeGXA=;
 b=GM6WNubn0YgTNBbXa/zRAm0j/WXcZ2wZiggOK+MtpyVjv8LpMj6g9n69EXx91z46qt
 5kVW4fkCoE8P5vQowuZdrowCylAtjDmL2kdtHTA25FRKwbwFcu3n64LMeYMHKxlj9uc8
 bLF8uyaf4MOUPAgd2gar8xKB/sWfUwaXXAEv1DWOCQCu0omqrLTx2KvikaoI4WOgPQz4
 s09hgNjYHYYgX5r52SDBTdGDXZ/RQNbZ4VOGlfaHy8Grtq/XeyHcQeclA1cTeugPOeEx
 WjkQI8+hgi8JPb51GUauFAE1t0g0rt94V6mE8X+rwjCp+FubhPVhn2OGEO8qKV3kSEKa
 Z6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726751876; x=1727356676;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=anfCIpzkOCIiGL9EDPttCS594d1L2okUuXy0ncEeGXA=;
 b=YgOlb5qcOVuIVeaVdpVcn/s8Lu8iPgMOO8UrTUXoBQN2OHT+qol4GG9fWcFVxtL+K9
 6+dPt1GlI0BwStdUlZQmj2KDqQAcMDqF6gl6880KJDTIYFryYGPXWZ1wGd5sqclwACSh
 6cyVriKPxgeTnTZNGJgADkT/gi2ZZHNbCHX22uANowKHWzpoAALplR4w12tK8AO7KUja
 jxj78CbblVdUds21/Ih3dtFnJE5qhT6uTPmDX/a2i7mHJOr4/6NEDeDWHzAzsk4aT8Xq
 +ipNFrJx4nmQ5nwXlBT1cKOixRG2BMTwP2YyD5pTA8BMegKtULwotI772e0t2eRjNpZN
 +vMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNAX90YmVS2m9gng1YmPtMGWeLRkBBhfWRv+OXCUUVsdkY91pYmbt4N517TptaSNJ/AX5Wmjolqf8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPLQ9ZuRWAYQjgq/J/fmDA9YHJmDnKLuTJxjMf3DdcubSiO0SV
 XOPVrbHePlS7A2FacsUy3Y3KqQ99APQMd2ytxv7QJ2s4U+RHb/9VdS3pdy0e+LwqvrF2Nael6nJ
 K1wTxeCIbJ+hcz5CsvRxjHmb2//s=
X-Google-Smtp-Source: AGHT+IF9IGnoFymNrY96ZdfBvRdXpeFvTASmMi6xugMQ0/+PzTD5PFJN6ulZK08RbShyMHH/uKX0/0RAUmq5n3tkuIs=
X-Received: by 2002:a05:620a:1728:b0:7a7:d6f2:95f8 with SMTP id
 af79cd13be357-7acaf5a0246mr459527785a.20.1726751875987; Thu, 19 Sep 2024
 06:17:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
 <20240913-starqltechn_integration_upstream-v4-23-2d2efd5c5877@gmail.com>
 <rfoxnd4axyqxvexgq3mm2zntzvpihv4g424hepkoh7bfr2izjz@htjeqbfuq2gu>
In-Reply-To: <rfoxnd4axyqxvexgq3mm2zntzvpihv4g424hepkoh7bfr2izjz@htjeqbfuq2gu>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 19 Sep 2024 16:17:44 +0300
Message-ID: <CABTCjFCwg9HJcAQOG4+jeHviPiXoSiQgzX-ogUPQt1M2494aBQ@mail.gmail.com>
Subject: Re: [PATCH v4 23/27] arm64: dts: qcom: starqltechn: add display PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Simona Vetter <simona@ffwll.ch>, 
 cros-qcom-dts-watchers@chromium.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > +             pmic@60 {
> > +                     compatible = "samsung,s2dos05";
> > +                     reg = <0x60>;
> > +
> > +                     regulators {
> > +                             s2dos05_ldo1: ldo1 {
> > +                                     regulator-active-discharge = <1>;
> > +                                     regulator-enable-ramp-delay = <12000>;
> > +                                     regulator-min-microvolt = <1500000>;
> > +                                     regulator-max-microvolt = <2000000>;
> > +                                     regulator-name = "s2dos05-ldo1";
>
> Useless name. Please use rather names from the schematics, but I guess
> you might not have them, so maybe downstream has reasonable name?

Unfortunately, downstream uses that same name.

-- 

Best regards,
Dzmitry
