Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 931D182BC95
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 10:00:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FE510EAA9;
	Fri, 12 Jan 2024 09:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D2C10EAA9
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 09:00:19 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id
 4fb4d7f45d1cf-55642663ac4so7036292a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 01:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1705050018; x=1705654818; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9SkiM1CyhiqOdeyM++a6lT4rbKePEx/F9YY5NzKazuE=;
 b=jLHB8cfAckTLvZmcMB4atC+uGvWvIEr+Z1N1Nj1qeKryXxqoMNWKI9j9YFGs8204Ks
 i86np3i0gDm3Dhx9AP/g8w8nlbIN9uW3nBiADYo2qnFK0XGQxG1dS9Fw2CF5COXIN/+6
 B+P/tvL2zUWVFFTIff+1kmpwLRWZ7v/Gj5sjLhVCorYDoX0FNUzRoI2I+m9kkvQPjnFB
 tHNDtYx9nbd0nb2ZUOHoQzEHmQdJERhmJgLOa8t2loZRYljldpM5u93yzovWC7Mbx1yj
 RM7u+konJ4BJlxsFdULSw9FSNMyJF88OliuNSEpKAHKRCghn5ijhIKL9jEtEdGY3TxSV
 Tz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705050018; x=1705654818;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9SkiM1CyhiqOdeyM++a6lT4rbKePEx/F9YY5NzKazuE=;
 b=wEaNEemk9ZlR3NNPntGrkZxdlaGuEsFh5IsALFOjbNHuozcClISq+UB5Dy18j+vZmJ
 Wqi/khPUM2v0lFD/0Fbw7Gsg2CLn+2TlH3jozbNa6a7SRn2kWgLO6IOlBh5+kyKnUcBh
 UBxkjLZkp+txKfTsTrmUCwN725lovvIqCiI80zAd31K4UIQJeGN2zXSFcvhx0wAehzJW
 0eg2O4o+Qg25/u98eM6aVph0E9qlp9n6MTcvaOy8VDF3qV36hzdMCrE5ZkJ3lDMHioMQ
 9EEG1YoWvD0GZlrH3N1+jHF5mEHWB3fzEzN/LUTPLVwtiISDxoNDBC8iNh/okpnjZTs8
 5Wiw==
X-Gm-Message-State: AOJu0Yz8lc9zeXEOXpNUs/LuDAyw4KuDmNhZ2TdtO7yu4Xt5KNBrmvjC
 nh7C9qzCIj+58/MB2NbO60e1NGxJ2Tf2Mg==
X-Google-Smtp-Source: AGHT+IE4lqCuCcBKUQKcGYBXm2hn5tLGot0ekhVA4EDWlovNg76g03laNX/Vn5Sk4TgseAUkA74dQQ==
X-Received: by 2002:a50:fa94:0:b0:54c:60f0:7511 with SMTP id
 w20-20020a50fa94000000b0054c60f07511mr480176edr.35.1705050018310; 
 Fri, 12 Jan 2024 01:00:18 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 j14-20020a50ed0e000000b005550192159bsm1555191eds.62.2024.01.12.01.00.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jan 2024 01:00:17 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jan 2024 10:00:17 +0100
Message-Id: <CYCLSCKPPBOC.1B1MP3VOOC0Q8@fairphone.com>
Subject: Re: [PATCH v2 2/4] drm/panel: Add driver for DJN HX83112A LCD panel
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Linus Walleij" <linus.walleij@linaro.org>
X-Mailer: aerc 0.15.2
References: <20240110-fp4-panel-v2-0-8ad11174f65b@fairphone.com>
 <20240110-fp4-panel-v2-2-8ad11174f65b@fairphone.com>
 <CACRpkdaWTfPDCin_L6pefHsokjNyO8Mo6hWPdzPLLi1EUkKUuA@mail.gmail.com>
 <CYBZEZ4IM6IL.VR04W7933VI@fairphone.com>
 <CACRpkdZQbVXfBa70nhDOqfWPbsh-6DgX-uvZOxr19pzMmF2giQ@mail.gmail.com>
In-Reply-To: <CACRpkdZQbVXfBa70nhDOqfWPbsh-6DgX-uvZOxr19pzMmF2giQ@mail.gmail.com>
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

On Thu Jan 11, 2024 at 8:05 PM CET, Linus Walleij wrote:
> On Thu, Jan 11, 2024 at 4:28=E2=80=AFPM Luca Weiss <luca.weiss@fairphone.=
com> wrote:
>
> > In some internal documentation it says "LCD Driver IC" "HX83112A" and I
> > don't see any reference to Truly 5P65 anywhere.
>
> In the Android directory I pointed to I see this file:
> HX83112_Android_Driver/Truly_5p65_module_fw/UpdateFW.bat
>
> (Notice the 5p65 fw dir is *inside* the HX82112 dir)
>
> And in that file:
> adb push TRULY_5P65_1080_2160_HX83112A_D01C01.bin
> /system/etc/firmware/Himax_firmware.bin
>
> Clearly indicating that they are pushing a Truly 5P65 firmware into
> the Himax display firmware directory.
>
> To be fair, that is the driver for the touchscreen part of HX83112A,
> but ... Truly is a well known manufacturer of display controllers?
>
> But... given that you have a @fairphone.com mal address and
> a working relationship with them, can't you just ask?
>
> > On their website they have this sentence:
>
> All OEMs want to look like everything is their own product. It is
> business as usual.

I can't tell you anything there that I don't know, sorry.

>
> Further on the same note since I guess you have a datasheet)
> please bring in #defines for the commands (the first byte in the
> write sequences, for examples:
>
> +       mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x02);
> +       mipi_dsi_dcs_write_seq(dsi, 0xd8,
> +                              0xaa, 0xff, 0xff, 0xff, 0xff, 0xff, 0xaa, =
0xff,
> +                              0xff, 0xff, 0xff, 0xff);
> +       mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x03);
>
> Clearly 0xbd is HX83112_CMD_SETREGBANK?
> (This is easily spotted from the similar structure in the
> existing panel-himax-hx8394.c.) So please add #defines
> for all commands you know, especially if you have a datasheet
> because we reviewers don't have them and "it's just magic
> bytes" isn't very compelling. It adds a lot to understanding.

Right, the register names seem to match more or less the ones from that
driver, plus some new ones and some differently named ones. Will send a
v3 with that.

>
> I strongly suspect other Himax displays such as HX8394 to
> be using a Truly controller as well, hence the similarities.
>
> In a datasheet for their TFT800480-84-V1-E display controller
> Truly kept the init sequence name of void LCD_INIT_HX8290(void)
> for example.

In that datasheet (assuming I'm looking at the same one?) it says
"Driver IC" "HX8290-A[...]" so there the display driver is manufactured
by Himax and not Truly to my understanding. Truly is assembling together
Driver + all the other parts that go into an LCD.

For the panel used on Fairphone 4 that part is done by the company DJN.

Regards
Luca

>
> Yours,
> Linus Walleij

