Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEFF835628
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jan 2024 15:39:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E5110E0AC;
	Sun, 21 Jan 2024 14:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C9A10E0AC
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jan 2024 14:38:31 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-5ffd5620247so2911787b3.0
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jan 2024 06:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705847851; x=1706452651; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CDApNaplKZ25oamiktN0S+Ji5xLI1g1rccClqr4J0Bg=;
 b=fZV0ki3km4skQ4r4lBzctY8GTz2oXGnYDRYCj1qjbPPDDehu5dvK98r2RVl2tlruyx
 X73JpF8iU1OIpr0+pX64I2626umSrjTgBDlsUsykisjJYVbF+s9xwfAt+5dR98jNoMMM
 ygb4Yr2Mqx3h7CYoYOEQqtYhES5XyhPYF0TbF+9Tow4iSxv8zEWhI+xAq2aQj/n9/yWf
 qL2SHI5mdBPacnOlwmswaCMnQTcmR7uzMn0lo7AAbBWYRArJy2/CdH0tV19KxAxD/M8/
 9+ENW+QJSu0Kovqhf1LFmr/wtRq+AFMVT8qYsZ6rSnDxly8TukrzZVUyLVcXobuRVQAv
 NVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705847851; x=1706452651;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CDApNaplKZ25oamiktN0S+Ji5xLI1g1rccClqr4J0Bg=;
 b=hw229IochWpXQMLj1f1JZPfssbPM169gEhe1Np9kdyrBqIvdU1zh9bKK5NIPmMS1ht
 v68tNjsfrk+/agWcAxCJo+lwcYe4e0vg71a0tf2cqDpW2fU/WTaSy8SaGOg8B6i/8CDv
 pEgFW/1f5CS1N13bzNRCe4RvPFMdOoPk3iXS/D5+euLDU408g6ihox6gpIpj/uV8ljEZ
 Q6emcUPHS5T2KqIdLjfKjSyeaKtAWJdToYeZSJEVI/lxa2n/EjU+J7EA4sev9uzPccu5
 dS2eODJVHzWNsNfYZmjBiyVSRJaFre5Fm5oAN/AahTdIa5YTFdTJG8fp/SOKVqW0AYGu
 CDYA==
X-Gm-Message-State: AOJu0YxnA2G4m1dpzg2o48j+6LyfRekTqrrSFgeRYM8vK4hF9xo53QoD
 syOz1jkKJUP18DrVAoCnXzWuAJpDDy4WW7dHafa1deods5PDQfkocNDa7XNNzZTT6t3pBOBY38h
 lg7vxF/ML8DZQSF1mGf16TYYu1kgRRE4n6znUrw==
X-Google-Smtp-Source: AGHT+IEsDujy+qqr3r2XFC+/gU5C2SO5cQeDz63EZves/xdhXK8OzrJSa1DJzBv9cLts87tjJ1jzxqWX5kxbmIDL1RI=
X-Received: by 2002:a81:7b06:0:b0:5ff:9b70:226c with SMTP id
 w6-20020a817b06000000b005ff9b70226cmr2450527ywc.53.1705847850626; Sun, 21 Jan
 2024 06:37:30 -0800 (PST)
MIME-Version: 1.0
References: <20240120-ktd2801-v3-0-fe2cbafffb21@skole.hr>
 <20240120-ktd2801-v3-3-fe2cbafffb21@skole.hr>
In-Reply-To: <20240120-ktd2801-v3-3-fe2cbafffb21@skole.hr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 21 Jan 2024 15:37:19 +0100
Message-ID: <CACRpkdbC0hwAZ47Q-iQUkVB4H+EZFO_nENNB2hRNRWQoNHrECA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] backlight: Add Kinetic KTD2801 backlight support
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, Karel Balej <balejk@matfyz.cz>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 20, 2024 at 10:27=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovi=
c@skole.hr> wrote:

> KTD2801 is a LED backlight driver IC found in samsung,coreprimevelte.
> The brightness can be set using PWM or the ExpressWire protocol. Add
> support for the KTD2801.
>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>

Very slim after abstracting out the library and the library
has the change I requested so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
