Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D716A97BC8C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 14:53:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A8E10E081;
	Wed, 18 Sep 2024 12:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EozqlIxc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD74210E081
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 12:53:47 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id
 a1e0cc1a2514c-846d1ba933eso1452468241.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 05:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726664027; x=1727268827; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/g9NdqeVcPa5WEMV/Sz1b6LsprRcVfh5a8jA898vriU=;
 b=EozqlIxcsL51e7udh4c9BvZcL4ca/dcUao2MfIe/7G/dwrPUg9qfX5WjTvBBZ05777
 6clr8DIgphACstckEi2cvf1jQPQDwGlr6Gh5Ow4l0qPBL8qR1o/7G9/jJtf8gwa1wcm/
 VGVsfNF8z/4Iw/KUVFI4F9PGjKhFxJLH3yULui/PLV0OVqu0CYdW42RDq/kuSLJ19SCZ
 ZRSe4U3KGWA9Hhh6PGylWmJS+Bh2dEolc9cn8qQcoRFIVg7l5T1aeDsskN9/y+iHdyRN
 12wDf1iB4OXQRxCY9oAmzzl6Dox0831XYaqmrACIkZqOsneQyO12huBs2xO97VeW96fA
 T9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726664027; x=1727268827;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/g9NdqeVcPa5WEMV/Sz1b6LsprRcVfh5a8jA898vriU=;
 b=XohjevABNYEAzE44cLw7gQ8PF+ZTX3CgPAhEsb/GxfOhwTKlByDs3gCaeuB9xG1qD7
 82WJpBkVgqUUXSkZPYONaqttjbR295r0/XlgGy9C1lhKuIFdv86sVSyj3rOeJ7wCeYW3
 km/WLSyu2mwgXt/0d6ePBIwd3vfDrGq1ihV0afDEPX1mZpJo8uEmGdmhZ50wTUvBX82c
 2djcT+uW026TShD3zrLX8ScCqcvb1fBMTM18umAEamr3IhX562WV34DgHENtVG7SQvhm
 YkhzwW7n/3lS+C5mrIJkhtsB7KyUlMQskQ8wz0tfD7QASd8zt+Jcsu/oXpN1yIlYZwxS
 Zv7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuDNo7sRhD4Rlg38zF0a/zBeWZGW70DxQhOolYwdnXUFxJkx6lToI+ZcoBj2mB5i2DiqoFpfyiDCs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRGUrCFznhp1nZAoeFFrggsPHaS2wtm8cDZhR9GksOgNKfNt4a
 CCiqC9z+Y2Wl/eIGs0M5Rv058rxMAord56aFYMjaBokrcEoUiFR0jMvUgZaQER4gy9S8/CfK9zk
 aZoY0R1VzLfwsmJmycLD2LldgmJo=
X-Google-Smtp-Source: AGHT+IFGmph15ldtpeLTYgiO51oUhmQH5ahITzDspFrnSZzNrk9TuFGJLzehC4MTF6p1O8lGGsMcGjzI/fRVh7pjEYU=
X-Received: by 2002:a05:6102:3746:b0:49b:facb:15f0 with SMTP id
 ada2fe7eead31-49d4147e852mr16147058137.12.1726664026626; Wed, 18 Sep 2024
 05:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
 <20240913-starqltechn_integration_upstream-v4-8-2d2efd5c5877@gmail.com>
 <wywp6vj2pqqe7to55k7ssh5sbqrmy7emvwruvm2waytancf3r4@aygtw3y6huwx>
In-Reply-To: <wywp6vj2pqqe7to55k7ssh5sbqrmy7emvwruvm2waytancf3r4@aygtw3y6huwx>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Wed, 18 Sep 2024 15:53:34 +0300
Message-ID: <CABTCjFAvXYrRJS3Dwf-TMq3OW_vN1hskk+qPjosbRym7xOvy1Q@mail.gmail.com>
Subject: Re: [PATCH v4 08/27] mfd: max77693: remove unused declarations
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

=D0=BF=D0=BD, 16 =D1=81=D0=B5=D0=BD=D1=82. 2024=E2=80=AF=D0=B3. =D0=B2 12:1=
0, Krzysztof Kozlowski <krzk@kernel.org>:
>
> On Fri, Sep 13, 2024 at 06:07:51PM +0300, Dzmitry Sankouski wrote:
> > Remove `enum max77693_irq_source` declaration because unused.
> >
> > Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> > ---
> >  include/linux/mfd/max77693-private.h | 11 -----------
> >  1 file changed, 11 deletions(-)
>
> Please split your patchset per subsystems. There is no dependency on MFD
> bits from your DTS... (if there is, this needs to be fixed anyway)

Indeed, my dts has no dependency on this patch.
However, my dts has dependency on MAX77705, so AFAIU,
I should send this patch separately, while leaving other drivers in same
patchset, right?
