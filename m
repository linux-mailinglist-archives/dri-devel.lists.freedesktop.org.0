Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A9197C609
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 10:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0682288668;
	Thu, 19 Sep 2024 08:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VHweQgvA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB9A10E6A6
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 08:40:44 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-84876d069acso164654241.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 01:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726735243; x=1727340043; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xykemnfjHLjw1rPIo+7O6AS00C6CkkoCorxyDrzMaEQ=;
 b=VHweQgvAyC/yNgpRIpUot6sUql98nAlyOXs981j6KAfOkXUPcmccexwutoqibj65NT
 UaobyCpO1St/612/LNljZVGQk8ZJiH3qJwlNRhtCs0kck9nfRMMD6qCADu2rNn0it9CF
 TTgBEzgQIJEEH/X0Ctl0YKxZsIb/g8T0A5ZDn3Nsr09JVfYcpBm/CDZKHB5+0gA3suzE
 Jzj1dfqVEwnLjz4OxcNwsfK6geQ35XV2kFNXjc8toAPplX8TAkW9Hi2GuP9lZ4oE0UIb
 oGDpntw2avo4IFh/AxldcCZvsDBhEXMoGotrQITFf6fTD24Er8AxefdBTnvQWi3PiC5g
 rPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726735243; x=1727340043;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xykemnfjHLjw1rPIo+7O6AS00C6CkkoCorxyDrzMaEQ=;
 b=hUpFmGsrAvmhY8MKKKqbnBYJN3uKolV3gdkciANYKVeWQutLoO08hsGjQFvQFxfz6X
 QgT1go3rEd6Mhk5GMlmYUMtxoWbFbH8RunI+AB6FfaI5xJF0CIaGiBDeU/WLJ7KVE/lH
 a0KiFd+gMigvCO4eVsebslp3XEesjiSh5GM1K9SyTho9tLZJ+0CZ4Td2svQftDYvB/go
 worqqqZd8mi2K6E3CbB+wSji+e/Nd5psYW/womRABNokEtDoHt7OlUWx/KCQD2oPj+6B
 QwBe5MtdNqoHBV8lB0NCgotn4cnvwZssPVcORxEHSAKNKYG6x1+Rwr36ukozzBxyP+6i
 llGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbtuCBcLyY4I0ImAw9swGo/Ab/EicKpojLEU6b+a9OufhZC8XzNdN+b9isKL3/ihDn9y2XbP/BAbo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxa5OtCKRxkuTpt6gLKVUr61z/05o1HtunBa/d8yaNLgJgSjwbQ
 SP4inFNd0MokzpOd/uod5PBLjhmIj3b67qUIXZjNjceIx2xGNJuKTBTLXIp0dgEo23bOR5+PoKs
 oUP+HaiRcTf7wyqkBRizZFUyeQe4=
X-Google-Smtp-Source: AGHT+IEPF6qaPSTwKWIjFiNSfRRNnkJYm1P330LaZ6f6Fgj87ECtB4FGVzstCMCjXzBEMRn+f/qNz2tsedSZyWrs7oI=
X-Received: by 2002:a05:6102:38d1:b0:49b:f5ed:4bcb with SMTP id
 ada2fe7eead31-49d4157db8cmr17162683137.24.1726735243511; Thu, 19 Sep 2024
 01:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
 <20240913-starqltechn_integration_upstream-v4-8-2d2efd5c5877@gmail.com>
 <wywp6vj2pqqe7to55k7ssh5sbqrmy7emvwruvm2waytancf3r4@aygtw3y6huwx>
 <CABTCjFAvXYrRJS3Dwf-TMq3OW_vN1hskk+qPjosbRym7xOvy1Q@mail.gmail.com>
 <6886f561-b9e4-468b-9515-72053d57911f@kernel.org>
In-Reply-To: <6886f561-b9e4-468b-9515-72053d57911f@kernel.org>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 19 Sep 2024 11:40:32 +0300
Message-ID: <CABTCjFDKuEM2wogLcJXX+0eCOTCDUSycPi7JCjvdRCbXaP2EOg@mail.gmail.com>
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

=D1=87=D1=82, 19 =D1=81=D0=B5=D0=BD=D1=82. 2024=E2=80=AF=D0=B3. =D0=B2 10:0=
0, Krzysztof Kozlowski <krzk@kernel.org>:
>
> On 18/09/2024 14:53, Dzmitry Sankouski wrote:
> > =D0=BF=D0=BD, 16 =D1=81=D0=B5=D0=BD=D1=82. 2024=E2=80=AF=D0=B3. =D0=B2 =
12:10, Krzysztof Kozlowski <krzk@kernel.org>:
> >>
> >> On Fri, Sep 13, 2024 at 06:07:51PM +0300, Dzmitry Sankouski wrote:
> >>> Remove `enum max77693_irq_source` declaration because unused.
> >>>
> >>> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> >>> ---
> >>>  include/linux/mfd/max77693-private.h | 11 -----------
> >>>  1 file changed, 11 deletions(-)
> >>
> >> Please split your patchset per subsystems. There is no dependency on M=
FD
> >> bits from your DTS... (if there is, this needs to be fixed anyway)
> >
> > Indeed, my dts has no dependency on this patch.
> > However, my dts has dependency on MAX77705, so AFAIU,
> > I should send this patch separately, while leaving other drivers in sam=
e
> > patchset, right?
>
> How DTS could have dependency on MAX77705? It's a clear no go - broken
> patch. And something very weird, almost never happening for new hardware.
>
Oh right, dts only depends on driver bindings, not driver code, so I
can send dts
patches with bindings in separate series, and per subsystem series for new
driver code.
