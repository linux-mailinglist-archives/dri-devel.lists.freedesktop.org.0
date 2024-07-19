Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC2D93756C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 11:02:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B59D510EB7C;
	Fri, 19 Jul 2024 09:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IwJSa3ub";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C92510EB7C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 09:02:01 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id
 ada2fe7eead31-48fe6ddc33bso574849137.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 02:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721379720; x=1721984520; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e8NqB4UXXfRhq7xibWmOKgLLvVoy7/cBoXSoL07ZZd8=;
 b=IwJSa3ubGzr7sqVf/pS6BppAZVxoxRps3Hl06iMSfIg/wscvCCLYWqM4Yor/QKUA/d
 eYTGUwMvlqmJYxRvu4MM8UMJNXntvlLhgf5K1dnJTOPyBMDJ7LOYCaOShAoUicWFRxor
 d1gUKQsPLInSpg3QqNiac8WQrYegJl/uc4wmUnPW55awls3/BvO6DeQ4tPlvBmPYO9h8
 Oca+VZmfdgVq3/8Mzjadz6XqgTeVyvdbCmpnuNtlFJzwk4+xy7B8eivW4hzY4/J+dUO6
 NZKPTfPtmAEwA0RY2bIGGTm3InU8maiaUN8FiMNVVjyt3gTjW1kVqyVTh8WAWsCNuKV4
 v+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721379720; x=1721984520;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e8NqB4UXXfRhq7xibWmOKgLLvVoy7/cBoXSoL07ZZd8=;
 b=UWbPxlQXwc5ceGumsZvTrP8kZ2vkkTndg2iWmxalxS/7JdRttkUdTQ0w9+JWNW+yor
 +Vw66T26MACK4AIz0ifXC9bA8SMPffXCair78lxI7Fs+SkINZtwf6mlfGSELY5wagPTR
 VmiEDuxWJJ3tJYiFDRbBKbu/sZ1FWrhDpTsv5aWEwN+jgY485NV4mj82dbDsAlaZYf2W
 MTCdZzDXnIcvJRnzwaTxPzwver2guACW4clJPKBwbijFLNBD9Vq8hmrxSbjjDBiUPwUn
 GsgW/CPtLHaQC0JUllLM9hiMekzt5F2HrjAgEo9w/b7xkQgL4eiZ2uguld7c96sEVsKT
 zPTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+TBput0CgVhW1MlZbRlD87fNLZgy3H7NCbZTPmW26/OlSC6sDCZ2Zo0PReLk/zAffYgBdaXTq+M2DAp5CT4MTT8DMRTwbK7lujH1qgGYP
X-Gm-Message-State: AOJu0YwK9boGht+THHkgCArPaAh6wjXAcaYWxvkUsc1nJaP9Jr4qiL1y
 qbUg/9SsEN6WL4i71W7oJ4j87ztLqh2rllazxo0+M2Dcj6qG3rFVyReAvroz8GGr+zGE/FInxNM
 KGSMoWqZ/kz8z1OC9W0BIBZQZQYU=
X-Google-Smtp-Source: AGHT+IEEXrAtw5qdg+6Tlto0/IkkAm7AL1K/G5e76SlvQXcdxQq43WWyLQGsGDvFSp5tU2oxcT8DtAITdKNEJ/5OAbQ=
X-Received: by 2002:a05:6102:512a:b0:48f:eb37:fd86 with SMTP id
 ada2fe7eead31-491599ec471mr8207968137.30.1721379719734; Fri, 19 Jul 2024
 02:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-2-e3f6662017ac@gmail.com>
 <wnf3mfgdm4p4f5wrxdtlx4wccnizdvohc7iiyu5t22eeb67r57@xun3r73hksrg>
 <ad04e203-4244-4cd3-9c9a-fae002962990@linaro.org>
 <lwrz4rvn6ogseea5v6j7plc3yi3xnzo76dvrsl3muat3iswlkb@zmwa3xo3xgw4>
 <85e03d10-59a2-4f15-bb85-7b2c0354a5d1@linaro.org>
In-Reply-To: <85e03d10-59a2-4f15-bb85-7b2c0354a5d1@linaro.org>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Fri, 19 Jul 2024 12:01:48 +0300
Message-ID: <CABTCjFBxOEdpbdYnbvPyf2MRE5m-3gfvHtaPbDF5PmkQZ2kV1w@mail.gmail.com>
Subject: Re: [PATCH v3 02/23] gcc-sdm845: Add rates to the GP clocks
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Lee Jones <lee@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 phone-devel@vger.kernel.org, 
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

Why cannot max values be defined as ((2 ^ mnd_width) - 1) and ((2 ^
hid_width) - 1)?

=D0=B2=D1=82, 18 =D0=B8=D1=8E=D0=BD. 2024=E2=80=AF=D0=B3. =D0=B2 22:12, Kon=
rad Dybcio <konrad.dybcio@linaro.org>:
>
>
>
> On 6/18/24 20:55, Dmitry Baryshkov wrote:
> > On Tue, Jun 18, 2024 at 08:50:52PM GMT, Konrad Dybcio wrote:
> >>
> >>
> >> On 6/18/24 19:50, Dmitry Baryshkov wrote:
> >>> On Tue, Jun 18, 2024 at 04:59:36PM GMT, Dzmitry Sankouski wrote:
> >>>> sdm845 has "General Purpose" clocks that can be muxed to
> >>>> SoC pins.
> >>>>
> >>>> Those clocks may be used as e.g. PWM sources for external peripheral=
s.
> >>>> Add more frequencies to the table for those clocks so it's possible
> >>>> for arbitrary peripherals to make use of them.
> >>>>
> >>>> See also: bf8bb8eaccf(clk: qcom: gcc-msm8916: Add rates to the GP cl=
ocks)
> >>>
> >>> Each time I look at the table attached to the GP CLK, I feel that it'=
s
> >>> plain wrong. In the end the GPCLK can in theory have arbitrary value
> >>> depending on the usecase.
> >>>
> >>> Bjorn, Konrad, maybe we should add special clk_ops for GP CLK which
> >>> allow more flexibility than a default clk_rcg2_ops?
> >>
> >> If we can somehow get max m/n/d values for all possible parents, sure
> >
> > Calculate them at runtime?
>
> We'd be calculating the mnd values for a frequency that's either equal or
> reasonably close to the one requested. My worry is that we somehow need
> to get the maximum values they can take (unless they're well-known)
>
> Konrad
