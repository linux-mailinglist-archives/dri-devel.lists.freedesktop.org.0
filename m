Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D1F90DD5A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 22:23:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65D110E7B6;
	Tue, 18 Jun 2024 20:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KcoVEMNF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C197710E69D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 14:16:42 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-2508320e62dso2840701fac.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 07:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718720202; x=1719325002; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Om4iC8WD2JaG4NL4a3+9I68t3tIKpeGHX/9WOTfeeHU=;
 b=KcoVEMNFwl3bLgry7JXh5DaKOhh8hvw8nKB/lj/Rp+jTHpqneLyab7WGl2M5a8sb82
 +GV6qvbiCaEGODy/Q0Jt3D05eUW26bErhFHIRHlHo+aqcw8j9HuRnHrAHRwaJ1cTI2YL
 N3Ec8BfviUbk03nemCS4gs9NkoYh4V2aWpC4Ii5B4DV7t4NpbzxD4w0Si9/YPbf500Tb
 b+gjUzpiKZ7muo0MQztYQjiXVs3P41tN6RWUunprzmEgZIB3hlvWdh8W082sGqKX7Uaf
 gZ5yGhn2pinwohZNULVXx0+9dHHNXjznWlCyF/8zZnIC3YqKKK+JY61v968OoeOFXphP
 hHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718720202; x=1719325002;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Om4iC8WD2JaG4NL4a3+9I68t3tIKpeGHX/9WOTfeeHU=;
 b=RReEjMJsvZwuy/Gbu9EdP0Xh2TXD3Cyn6uFEkv0Hsf4oBW4BRPp5JK56twsXtmvFnS
 1GZqup9oBI8DzTVl8OWlTbfUdwvNLNd6DbgXXrgV0PLqZis7cwfvHRXCx3SNvz8R08Tl
 78mcUQk0MpDi7pgdoX3wILSstbJNyuiyr8QWOZYYoWAQvBoCk62WjWYIG6q3HNbxnYS7
 6Kt8CKxtdECljEE/d7d1W0iRX/EioSNHpRrAj+LpD1/xpmbfgTemgboVUgaPVaajRYeY
 ZvEpQM3VPlOA8nDthxCLYFbE1uaDaaK/4WfvgAR5atD5zzDIasZNRfgUKbTWsC0nQVIX
 9pqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0YhUeFZtfumNbsIQB1N1C6JdQWH+Re+otWpyYqG0uUftPjYwQ5JnF0itySqRqszu65Dnp+Vov9liZVTdH3vm1epmOnIMfwr7KW5Ka5oeF
X-Gm-Message-State: AOJu0YwIJx0E+O3KJQk5M+BWb1Say9abqzg6D/g/cvTUrWyxOn4kzPnS
 HGcreBulquNlilFtBqJPdL53s6tb9QTT/M9KzwI8cbdnJ6/yHViJYjZ/cq8opmk/D7vhiRnEDGz
 o/To0ED1NzwhjlMzdA3TvlZh92Io=
X-Google-Smtp-Source: AGHT+IFVxJEPFbT79HYd7zoJLAxyrPm1gzxY90KGBgQZvvizvrURzGFMbP7julYl6JpqzUKt2q+uL/xgIcBmlrzc4oI=
X-Received: by 2002:a05:6870:b525:b0:259:ae64:9231 with SMTP id
 586e51a60fabf-259ae6493e7mr583749fac.15.1718720201642; Tue, 18 Jun 2024
 07:16:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-22-e3f6662017ac@gmail.com>
 <e6a81932-0609-4476-82b6-43ee30b7de43@linaro.org>
In-Reply-To: <e6a81932-0609-4476-82b6-43ee30b7de43@linaro.org>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 18 Jun 2024 17:16:29 +0300
Message-ID: <CABTCjFAKFMQJXdwELZitCKpZQn+irfrHW6uOpHzwvFv=T7zKDA@mail.gmail.com>
Subject: Re: [PATCH v3 22/23] arm64: dts: qcom: starqltechn: fix usb regulator
 mistake
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
X-Mailman-Approved-At: Tue, 18 Jun 2024 20:22:03 +0000
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

=D0=B2=D1=82, 18 =D0=B8=D1=8E=D0=BD. 2024=E2=80=AF=D0=B3. =D0=B2 17:08, Kon=
rad Dybcio <konrad.dybcio@linaro.org>:
>
>
>
> On 6/18/24 15:59, Dzmitry Sankouski wrote:
> > Usb regulator was wrongly pointed to vreg_l1a_0p875.
> > However, on starqltechn it's powered from vreg_l5a_0p8.
> >
> > Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device=
 tree for starqltechn")
> >
> > Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> > ---
>
> How did you confirm that?
Vendor kernel source code:
https://github.com/klabit87/twrp_android_samsung_kernel_sdm845/blob/e8bb630=
39008e1704a2f1bde68d39ded9c16ea88/arch/arm64/boot/dts/samsung/sdm845-sec-st=
arqlte-chnhk-r14_v2.1.dts#L10242
https://github.com/klabit87/twrp_android_samsung_kernel_sdm845/blob/e8bb630=
39008e1704a2f1bde68d39ded9c16ea88/arch/arm64/boot/dts/samsung/sdm845-sec-st=
arqlte-chnhk-r14_v2.1.dts#L23401
>
> Konrad
