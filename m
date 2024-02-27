Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1046A868A91
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 09:12:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 114C110E892;
	Tue, 27 Feb 2024 08:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D673710E8A7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 08:11:55 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-607eefeea90so38100017b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 00:11:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709021514; x=1709626314;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9AOv9TtJDkUWmDznfDiDn5CRStO2mF8xqBgjOgsX5QA=;
 b=OsJIBG1bYBvfAc9SqkgYH1GA46J3H27LZRHa4hsgFdUcIUQqjzSp0HxK59kzMIfapT
 caaJ/+TdeVNVCXFj25JV4yV6MbaAjtGPSLdHmcutpg4jJerVUcBzxMDWgHHtCLPFPuEd
 4Oiomu/o1cCudXfYughOey3pOnF7Lv1wir9Q41ub77muCrvI1TgQwvEF08B9Owxx8CLY
 tfaaVThRl0ATWw/ZubkYXdIk+fGYcUzedAuJe8DiL2P4o5g1h67jQGTNGiEkpH6hgfXR
 uopn6w3h1CM+KnUyr1qd0tvldDWoHa+1A2y9IsYZswc1ZkY/yUKT9iWrRlF3YqGUVfvF
 A91g==
X-Gm-Message-State: AOJu0Yxi8avjY7W7rPSKaujnv0CuxeavxCHJCZYdi7Dg3naZixrLYZ0+
 iSGQ0N0L2HVhGMvVUDIrr7QvN+5Nbx0w5mZ22p24rTPqrb3pT941mgXZLR53Tzk=
X-Google-Smtp-Source: AGHT+IEWNOlnPqx/eoW/SMfZoevR9Mqt4JxP0pEPF3CWxUPgBfnSpVwNvEcr78g2ghGGuTMFeLYp8g==
X-Received: by 2002:a81:9282:0:b0:608:dc96:8162 with SMTP id
 j124-20020a819282000000b00608dc968162mr975493ywg.13.1709021513921; 
 Tue, 27 Feb 2024 00:11:53 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com.
 [209.85.128.181]) by smtp.gmail.com with ESMTPSA id
 p2-20020a815b02000000b006079f55766bsm1638155ywb.68.2024.02.27.00.11.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 00:11:52 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-6084e809788so25582957b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 00:11:52 -0800 (PST)
X-Received: by 2002:a25:642:0:b0:dc7:4265:1e92 with SMTP id
 63-20020a250642000000b00dc742651e92mr908405ybg.23.1709021512717; Tue, 27 Feb
 2024 00:11:52 -0800 (PST)
MIME-Version: 1.0
References: <20240227034539.193573-1-aford173@gmail.com>
 <20240227034539.193573-5-aford173@gmail.com>
In-Reply-To: <20240227034539.193573-5-aford173@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Feb 2024 09:11:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWNQ=_NHPybAhhLJJCytT4y583ROY-meuLyKPN8_Qa1HA@mail.gmail.com>
Message-ID: <CAMuHMdWNQ=_NHPybAhhLJJCytT4y583ROY-meuLyKPN8_Qa1HA@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm64: dts: renesas: r8a77951: Enable GPU
To: Adam Ford <aford173@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 aford@beaconembedded.com, Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

Hi Adam,

Thanks for your patch!

On Tue, Feb 27, 2024 at 4:46=E2=80=AFAM Adam Ford <aford173@gmail.com> wrot=
e:
> The GPU on the R-Car H3 is a Rogue GX6650 which uses firmware
> rogue_4.46.6.61_v1.fw available from Imagination.

s/61/62/

>
> When enumerated, it appears as:
> powervr fd000000.gpu: [drm] loaded firmware powervr/rogue_4.46.6.62_v1.fw
> powervr fd000000.gpu: [drm] FW version v1.0 (build 6513336 OS)

Do you have a different build number?

On Salvator-XS with R-Car H3 ES2.0:

    powervr fd000000.gpu: [drm] loaded firmware powervr/rogue_4.46.6.62_v1.=
fw
    powervr fd000000.gpu: [drm] FW version v1.0 (build 6538781 OS)
    [drm] Initialized powervr 1.0.0 20230904 for fd000000.gpu on minor 1

>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
> @@ -2771,6 +2771,16 @@ gic: interrupt-controller@f1010000 {
>                         resets =3D <&cpg 408>;
>                 };
>
> +               gpu: gpu@fd000000 {
> +                       compatible =3D "renesas,r8a77951-gpu", "img,img-a=
xe";

renesas,r8a7795-gpu

> +                       reg =3D <0 0xfd000000 0 0x20000>;
> +                       clocks =3D <&cpg CPG_MOD 112>;
> +                       clock-names =3D "core";
> +                       interrupts =3D <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +                       power-domains =3D <&sysc R8A7795_PD_3DG_E>;
> +                       resets =3D <&cpg 112>;
> +               };
> +
>                 pciec0: pcie@fe000000 {
>                         compatible =3D "renesas,pcie-r8a7795",
>                                      "renesas,pcie-rcar-gen3";

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
