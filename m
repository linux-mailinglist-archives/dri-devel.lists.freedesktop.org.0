Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D748BE2210
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 10:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6FC210E2DD;
	Thu, 16 Oct 2025 08:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A170F10E2DD
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 08:23:20 +0000 (UTC)
Received: by mail-vk1-f175.google.com with SMTP id
 71dfb90a1353d-54bc08ef45dso316417e0c.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 01:23:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760602999; x=1761207799;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xR7pvs4sY0VZXb71oeLpqLl5nfCodgR8zUuBqvOj1Tc=;
 b=M9L7xLfZxCJWRo/jF3yuUmwHe0irj+mhthEN61O5ZdpcQi+USQ6lL+ZlJwu1vwwZve
 26m0c24IHG66tX4ApoooDbFcn5CP+FHAExm1GHhZUyaa3CZwsTkztjKp0AestcVQIfyN
 Ejlr6gNpJrHQUXvsaEAv36MV2fbNbd6WaZ0xFnIrVzpdsEJRMZh18wUs8SjiGBUD6bNu
 vizAYFLI9he7ZVVB1AmfyEn/J2BXT8dB9TOp0m3RyNKbIJoMCL0ga43LP7ivdOXQPS2H
 ZRPio8FBro2IKCCl60Xq18IiGzGTV+ZtL9fetyB5XWYGh67X9g5UxJq/mTGdJaZjeyYv
 b1Ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPRDRIAL68Ywy45LM7WSZDDpIF2uBIjdiKUC+F3NHcmMIaFiZhaZhiDEwE/AvJnJdb2bT/QEMyQKU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPM00fJv9GPLgG2j8XpSXd09f5xh/Q5ivOBNDd4pjppaiEB7Vd
 wzMTxTTDU5rAKBoVn2BJbItcwJRMZIdeFCvfKJzLtgZU3mr2ciyjRB+DunN69wGq
X-Gm-Gg: ASbGnctLOzWReyX0uEWyg9IU2ihETCRbpcMiFVYIH+m4902avwPkrfNzr10W8NjIzI7
 z1K9zrbYKpj47XEx/5a6Sx54W3e7sRV/3rc6Eul6syoE88lJDu3GzS6fJ97hZXQMucW7z+rfs67
 nMWwmU1Ac2Jm92IKerWLpKW2DrG14yBgrCDC4GmdvmkwChblfho0t+Wygt2wPqBj5nnk/lsj9DD
 Et9fPf99Y9gungAROCfRx/HPPnW0+aJphhetbnN0B45EFeZYIbOEFk358I8yB9/oMG2YQ9flcsb
 pwq1tU2wRsHYukfbB2LA5rpfiqLjtqSLAlSrKq+7ywaYaXAdR2AQeqUtdNek2rmWZ8Jb31U7gIE
 0xnNPXEjll/3MJF6vq85GTQ6Zdq0x+HjYGujMPxlNAtsyLnU6eB4yuxDYRq8i9NVjzM9caJ57ax
 esFy3/pSLxaQHbDeISj0k/S+S0H3EVZXIckoEqobeq566lX1wLYMEPJNlt7e4=
X-Google-Smtp-Source: AGHT+IGmQReQYp2RHxg8wDHTugcPaHCMCZ1jVL9UWH+ooE32AfeF0Uro79NpuLu0G6BcXIH3rGtSLA==
X-Received: by 2002:a05:6122:c84:b0:54c:3fe6:6281 with SMTP id
 71dfb90a1353d-554b8aadf06mr12175106e0c.6.1760602999327; 
 Thu, 16 Oct 2025 01:23:19 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com.
 [209.85.217.48]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-554f37d2ea8sm4256605e0c.4.2025.10.16.01.23.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 01:23:18 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id
 ada2fe7eead31-5ce093debf6so362535137.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 01:23:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW/h3Okg1vuxYHx7nd7Fw0ArYUwtdg5/XdzgNRljqovgCKqLuynG61qL2iAs7egmBDM85qAPXZZQQc=@lists.freedesktop.org
X-Received: by 2002:a05:6102:32c1:b0:52d:110:a920 with SMTP id
 ada2fe7eead31-5d5e2394649mr12437643137.33.1760602998488; Thu, 16 Oct 2025
 01:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
 <20251015153952.185249-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251015153952.185249-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 10:23:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUfssQFZj4Mj0T4KpXDzDXBC6MecnauD5wp2_2OLdt=ZA@mail.gmail.com>
X-Gm-Features: AS18NWDv5MDbI0Q-YaerQHTTLK54INzbJu8pMvADwEhMtSUs8ivJgVETlU0r9ws
Message-ID: <CAMuHMdUfssQFZj4Mj0T4KpXDzDXBC6MecnauD5wp2_2OLdt=ZA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: r8a77961: Add GX6250 GPU node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Matt Coster <matt.coster@imgtec.com>, Maxime Ripard <mripard@kernel.org>, 
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
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

On Wed, 15 Oct 2025 at 17:40, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Describe Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
> present in Renesas R-Car R8A77961 M3-W+ SoC.
>
> Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se=
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: - Add RB from Niklas
>     - Fix up power-domains =3D <&sysc R8A77961_PD_3DG_B>; for 77961
>     - Fill in all three clock and two power domains

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> @@ -2455,6 +2455,22 @@ gic: interrupt-controller@f1010000 {
>                         resets =3D <&cpg 408>;
>                 };
>
> +               gpu: gpu@fd000000 {
> +                       compatible =3D "renesas,r8a77961-gpu",
> +                                    "img,img-gx6250",
> +                                    "img,img-rogue";
> +                       reg =3D <0 0xfd000000 0 0x40000>;
> +                       interrupts =3D <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&cpg CPG_CORE R8A77961_CLK_ZG>,
> +                                <&cpg CPG_CORE R8A77961_CLK_S2D1>,
> +                                <&cpg CPG_MOD 112>;
> +                       clock-names =3D "core", "mem", "sys";
> +                       power-domains =3D <&sysc R8A77961_PD_3DG_A>,
> +                                       <&sysc R8A77961_PD_3DG_B>;
> +                       power-domain-names =3D "a", "b";
> +                       resets =3D <&cpg 112>;

status =3D "disabled"; ?

> +               };
> +
>                 pciec0: pcie@fe000000 {
>                         compatible =3D "renesas,pcie-r8a77961",
>                                      "renesas,pcie-rcar-gen3";

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
