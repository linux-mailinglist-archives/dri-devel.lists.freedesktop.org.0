Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF6892A63A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 17:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1437710E196;
	Mon,  8 Jul 2024 15:54:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XrhMhY/r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B4610E196
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 15:54:30 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-810197638fcso1167673241.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 08:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720454069; x=1721058869; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/jA0wRlSERdOUIy/qi57GffPjw/ZRlZpxkgmsgkKytY=;
 b=XrhMhY/rujS26DOGXjBs1yIEhpqXCeKkgbbPCv4HFjfO1AkzRhMjj6S3Zoz06ktpog
 P9sUyKKR9k23NW0oSmlS8/vt59HpNdEtUCuaxLSz/RAYrrEJ/Xd7tAlkWVl43V7338nv
 4mQQjf7VryRRmnUQtUzRCTjS25Hrwhds2XZDocUghm6b8vdg8djkPl6nhICuG1OBYjYM
 I+w1d9hHyOZDUaajsCeU9N1r/Jf7IcX0YW6WWMxwalaHH8PnvsMTBiyHytjKeQk4xfRZ
 7+qiYV5vbNvBXgqc+zkPyjENyHimgry0fie30O2wGVSKW24SCIIsUal3hsjL1kOAZ/GA
 XlDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720454069; x=1721058869;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/jA0wRlSERdOUIy/qi57GffPjw/ZRlZpxkgmsgkKytY=;
 b=VW5gK7fZni+WeK4hLZH1mFgvWd2iDIXBm+LI8bjLTR0xtgqvA4WQoNwMrQF6svhooE
 M7L1RDtz+Fk1KpnPYO3MVSmgVrPo5p+AZSBAUkSd+wHtdg7VSoacCxmyoiLNpqCXJPv8
 dbwZUo52HX5BSHmPdqTUOq8lLsggaeYjF9hlBXOKguE0F8ynQhFtrBolXoiySDooIPe5
 Y8kh+O8XKMlNbu8vRNIdvJGlMKlufr+ZK/WGiqBZXEdHedQbwCr7XgZviaVg/njBSzdY
 FUsW5qmJjV5/KfIBG1ir0mAesvLtFXi4mXvsKH9qcoKJJAoJDPy9Lgr3Cp7yrBI/aS1C
 pV6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWadz6dMJ0xvhENXi0EmGha/ohN3oYz9ObnyCTxFSIaTwTQM6yIEE+0AmP0reSQ6dq5AGl8XlX8TH17qoQfx690MfmUHcx9nefmv1oGSn5P
X-Gm-Message-State: AOJu0YxygkOk554mRL1mPMrTSQXExlZLd9TGiXP+vYlnUEcNQ1Kp6Q4z
 hRF/RLniW5aQRegcV7sThyNCTXZLezPes9W4C6ZdbUseiMU3omUKUMnI78d4020lVmyF2axxso5
 9uUHHlPPxuzdcOvLlNGAv/e6jToQ=
X-Google-Smtp-Source: AGHT+IEZBoFU3ZLzG609wCmA5rnXqDuMLd0d2n5SrJ2I0lXatTkHpvsta1P7z0S7Pi2hNjQpBbhQnvIV2JNr2DTMmOU=
X-Received: by 2002:a67:e302:0:b0:48f:eabd:d72a with SMTP id
 ada2fe7eead31-48fee8a4cb2mr13105031137.17.1720454069449; Mon, 08 Jul 2024
 08:54:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-23-e3f6662017ac@gmail.com>
 <13fea5c0-5906-4075-b734-52649e35eb69@linaro.org>
In-Reply-To: <13fea5c0-5906-4075-b734-52649e35eb69@linaro.org>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 8 Jul 2024 18:54:18 +0300
Message-ID: <CABTCjFDebBxf=XcvTbVtifROFHrQLXtArLtj0wHVF_e529NVAg@mail.gmail.com>
Subject: Re: [PATCH v3 23/23] arm64: dts: qcom: starqltechn: add new features
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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

=D0=B2=D1=82, 18 =D0=B8=D1=8E=D0=BD. 2024=E2=80=AF=D0=B3. =D0=B2 17:12, Kon=
rad Dybcio <konrad.dybcio@linaro.org>:
>
>
...
>
> >       gpio-reserved-ranges =3D <0 4>, <27 4>, <81 4>, <85 4>;
>
> Do you know what these are for?
>
> Konrad

<85 4> is spi for fingerprint.
<27 4> is spi for eSE(embedded Secure Element)
The rest shouldn't be reserved.

--=20

Best regards,
Dzmitry
