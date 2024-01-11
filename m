Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1488082B1CB
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 16:28:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA7BA10E91C;
	Thu, 11 Jan 2024 15:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFABA10E91C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 15:28:27 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id
 4fb4d7f45d1cf-557a3ce9942so5749596a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 07:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1704986906; x=1705591706; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B7mE+52tIHuQGxlPUuwMMzBM9GxGpHPAmvjX828iiAI=;
 b=NPbuyS0jQK+4PQ1M+rXkgk76b+lHiZi/BXQoRArzUj89UXlRKzmx4yoPqvOJkEB2GY
 /9pdBKiPEkRSPrOvdH/FnKBU0x0ckxxAG32tlRTj6t8eam0wzfi/noZW7oCrM+rv96j2
 mDW5IH51nNkXCEpkPsHyTtfbpdeUEI+StGQkkY2G13oJeZpfZRiefy/ckCSJveTPjdoB
 cBo/F6tOp25zH60rlslDrqM1j2ZwfRQywCrzduc7TXbRyqLmecAOOF+phxw0OOG0XRFF
 72NAI5Z9pYoG/L5sHsJL2CQ5nzhkPJRsiIcK+5bbxVLf7Z6JZ7BoMeas5GOEXv984GFX
 mlsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704986906; x=1705591706;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=B7mE+52tIHuQGxlPUuwMMzBM9GxGpHPAmvjX828iiAI=;
 b=NGt4+ynXZbW3mVtJZpApcqglWHJbrqh2vKasSP5PbepMW0elxhmOXM8RfYkZ5Iss7t
 zVN3GFYg3Z2W5BNUiVLwM9Sjuo+EtjECce+kp/3iNAx3p7DOYS3uyQL1E7r7IwLuehR7
 S+aDmODp7XYct/RXYYv69ea0C4Aqi6A8kL4evtlcBZ5sXUjh+mEnNxij+VKk41y43t4V
 KeL/7V/zz7bRgIyBe5/6X5qj5se//1OnO1vA3+S5V19u2nnCal/YodFKgOGfn0c4wA0k
 m5lI2KuBHOyxI8DeTZoMHgTuSDM5hdNRaNnGYNBL+v+JeW3UgBy+IrIwtFUWHClgUKtD
 Q86A==
X-Gm-Message-State: AOJu0YyAeuTZ6XZ/M2Pp4uE/5vNwT7SsW9kfUNVlG4MLqjSBUYDQZogq
 HAe1Qz7qpXlmfummP09yXFiludHMS50HdQ==
X-Google-Smtp-Source: AGHT+IFrvzkgvZxDk2Qj4HTlNXeH9Cg5K5scTvQ7rSicpxuLzRPig/wdkeNZZxH3cj4lmdNGi3b+9Q==
X-Received: by 2002:aa7:d403:0:b0:558:b988:b8dc with SMTP id
 z3-20020aa7d403000000b00558b988b8dcmr33261edq.84.1704986906349; 
 Thu, 11 Jan 2024 07:28:26 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 m23-20020a50ef17000000b0055751515a84sm717753eds.51.2024.01.11.07.28.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 07:28:26 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jan 2024 16:28:24 +0100
Message-Id: <CYBZEZ4IM6IL.VR04W7933VI@fairphone.com>
Subject: Re: [PATCH v2 2/4] drm/panel: Add driver for DJN HX83112A LCD panel
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Linus Walleij" <linus.walleij@linaro.org>
X-Mailer: aerc 0.15.2
References: <20240110-fp4-panel-v2-0-8ad11174f65b@fairphone.com>
 <20240110-fp4-panel-v2-2-8ad11174f65b@fairphone.com>
 <CACRpkdaWTfPDCin_L6pefHsokjNyO8Mo6hWPdzPLLi1EUkKUuA@mail.gmail.com>
In-Reply-To: <CACRpkdaWTfPDCin_L6pefHsokjNyO8Mo6hWPdzPLLi1EUkKUuA@mail.gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob
 Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu Jan 11, 2024 at 3:57 PM CET, Linus Walleij wrote:
> On Wed, Jan 10, 2024 at 4:14=E2=80=AFPM Luca Weiss <luca.weiss@fairphone.=
com> wrote:
>
> > Add support for the 2340x1080 LCD DJN panel bundled with a HX83112A
> > driver IC, as found on the Fairphone 4 smartphone.
> >
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>
> This makes it sound like the Himax HX83112A is the driver IC.
>
> This does not seem to be the case:
> https://github.com/HimaxSoftware/HX83112_Android_Driver
>
> The driver IC seems to be a truly 5p65.

Hi Linus,

In some internal documentation it says "LCD Driver IC" "HX83112A" and I
don't see any reference to Truly 5P65 anywhere.

On their website they have this sentence:

  Himax offers display drivers for mobile handset displays that combine
  source driver, gate driver, timing controller, frame buffer, and DC to
  DC circuits into a single chip in various display technologies, such
  as TFT-LCD, LTPS, In-Cell Touch and AMOLED.

https://www.himax.com.tw/products/display-drivers/mobile-handset-applicatio=
ns/

While I'm not super well versed in panel driver ICs, this sounds like it
should be the one to take the name from?

Regards
Luca

>
> If this is right, could you rename the driver file to truly-5p65.c
> and all symbols containing hx83112 to truly_5965 or something
> that indicate the driver IC instead of the panel?
>
> My main concern is that the next display using the same IC
> need to find the right file to patch.
>
> Yours,
> Linus Walleij

