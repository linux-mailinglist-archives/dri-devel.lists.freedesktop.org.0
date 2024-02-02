Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2266A846EAA
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 12:08:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0E310F010;
	Fri,  2 Feb 2024 11:08:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBB610F010
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 11:07:58 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-dc6e08fde11so1428782276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Feb 2024 03:07:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706872077; x=1707476877;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jfv2qKejWElyCs3KRimHnaJxDJDdphdyezyPkNwX/u0=;
 b=OTc6VPr/qsFNt2awrZFsi0Q9a4USGNw7URdvMokRz3M5NQMhjYRRxyfeWHdisYgTCH
 9c141zO249q/Vq6F1oa5+ovpnzJSUeSGGQwkVI9YpZ2jGH1CNPGNdyf8sMxZLM1mVNHK
 20MSwsbawvW+AmjlLuknqauiZW0TskTxw6aivj3SvZTizfGuwZqetJZmKuXUe5YBiYyl
 bAbv2yFvqSAiYaMDrkKqz1ApObzc7s0gbiwdVvUvBMu10OyQVpkOBAgfc7Me+zmQXd0q
 rQQS0wy/FXU0+lNnPVv9ViLrkTljuGgtIbmIKwxJuWxEGJlgXxANUM1lYnxoqfyOv1xI
 qE5w==
X-Gm-Message-State: AOJu0Ywx+jne19aJRVESTBeJCds0/rRyk18fs0pAzUq368Aa9SGpXoCI
 LZr7Vkxcw3Rsjl2C793hEGura5zEn9TW1aE7XyPNwUoPd5ZruN81NIxWpCxfdMk=
X-Google-Smtp-Source: AGHT+IE1qefQsYNsZEFKPuvkhmSNPF/BCueD5EUIrwXOJiZqDz5QkzR/Q3jagUEknx3VENj2PM774w==
X-Received: by 2002:a25:2e4a:0:b0:dc2:4397:6add with SMTP id
 b10-20020a252e4a000000b00dc243976addmr8003150ybn.32.1706872076738; 
 Fri, 02 Feb 2024 03:07:56 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVSMuq09ZQYHflY2eeCg1okK9UJO/pRd35nlDw/lM6f4K3/hl0Cuhiej/8MFYijC/+HOvvG0IKgeHJHoJpw/QYLyrgD1/LfUa8boB6Ig7lD
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com.
 [209.85.128.182]) by smtp.gmail.com with ESMTPSA id
 r24-20020a25ac58000000b00dc69cc533f2sm366712ybd.30.2024.02.02.03.07.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Feb 2024 03:07:56 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-604191522daso19349567b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Feb 2024 03:07:56 -0800 (PST)
X-Received: by 2002:a81:b608:0:b0:5ff:b07b:fb0b with SMTP id
 u8-20020a81b608000000b005ffb07bfb0bmr7753792ywh.49.1706872075811; Fri, 02 Feb
 2024 03:07:55 -0800 (PST)
MIME-Version: 1.0
References: <CGME20240202095104eucas1p2df4522cc4a7ee29540db1fb61d8e19fc@eucas1p2.samsung.com>
 <20240202095044.1980696-1-m.szyprowski@samsung.com>
In-Reply-To: <20240202095044.1980696-1-m.szyprowski@samsung.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 Feb 2024 12:07:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVk0YOUFKy-ZjMHWCGkNMeBGU5Zs6VxtNH38emBnAR9xA@mail.gmail.com>
Message-ID: <CAMuHMdVk0YOUFKy-ZjMHWCGkNMeBGU5Zs6VxtNH38emBnAR9xA@mail.gmail.com>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Enable BACKLIGHT_CLASS_DEVICE
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>, 
 Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Davis <afd@ti.com>, 
 Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
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

Hi Marek,

On Fri, Feb 2, 2024 at 10:51=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Commit 72fee6b0a3a4 ("fbdev: Restrict FB_SH_MOBILE_LCDC to SuperH")
> disabled availablity of the SH_MOBILE_LCDC driver on the RENESAS arch.
> This innocent change has a significant side-effect on the ARM's
> multi_v7_defconfig, because FB_BACKLIGHT symbol is no longer selected,
> what in turn leaves BACKLIGHT_CLASS_DEVICE symbol selected only as
> a module. The latter disables some backlight related code in the DRM

Oops, sorry for that.

> core, because the DRM core is set to be compiled-in in this defconfig.
> This leaves all DRM display panels without integrated backlight control,
> even if the needed modules have been properly loaded and probed.

Hmm, that's bad.

Is there any way to fix this in DRM?
A quick grep shows that DRM is using the full monty of
IS_{BUILTIN,ENABLED,MODULE,REACHABLE}(CONFIG_BACKLIGHT_CLASS_DEVICE).
Probably not all of them are in perfect sync?

Several DRM drivers do select BACKLIGHT_CLASS_DEVICE, but if that
does not work in the modular case, it should be fixed.

> Fix this by selecting BACKLIGHT_CLASS_DEVICE to be compiled-in in
> multi_v7_defconfig.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Sounds like a good interim solution.

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
