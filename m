Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB7FC3B942
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 15:09:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2E010E8E4;
	Thu,  6 Nov 2025 14:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53E810E8E4
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 14:09:02 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b3e9d633b78so173165166b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 06:09:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762438141; x=1763042941;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lizrVusrsLOAQyowXz5s1Qp7I158lhdEAu4sLj0s0D8=;
 b=wNxiJErYinDu1lzlEc7jecA55D9Vf90/3XcccXlbrFW9DuSyQKSmZ056uaOJeqvN6U
 sGxhzRLoFnV6fSiC8zUN4xXYeBeLdk39jHbeXEGxAEXETlnfNjlrACo/4LnyoBrn5l/G
 wS1gNzTiekRd+F6mc2p9K7ododgYjNYR1j++Dj5AJfb1UJGi/PVdWvkrC0CzkdDmxVFI
 lK/p9MsSSxM3s4JictGx1ocbejMHE1QjgQCsQ+INdROhAh8vVKconEbcel8ecfyBxA2M
 JWWACCPiKwIOjOCfLDsAlWp5BJsEr9QTu/NDBClhm9PTu2MdcyBVB8LDCAPqIJ5rVVBV
 V0vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvEP6lyswl2vzjx5ENYsohpxltvBNo6YxgLuG8ERc2US19SeifOcUqwLoc8//ghZUeP/1Ls4Xufzs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAfnD5d7465DEI0hiiJf+/vvEUHbkiY8hDk6dv3eUFC5r9RuXD
 yGgYftQxcBnNQfhjSyC0Klfm3gNMkZ1FN//thFmXMp0lQIcabe4kKdR7IMiqGHgQco8=
X-Gm-Gg: ASbGnctLO713zCmg7at7VhCQmPCk5bD8tsEbUh6dprI8YXGP57nxAMDx1R6w9eqd5jr
 CCRnQ7ipIr0+3Yv9qdpqWWumrnFQi2aOPcfsOBPoLegAX/UhSeEsH8CVim5O/4w1y3H3Ii3Y+n8
 bNUF21xuGlN1Lkel8wP8zf2mBvAUzZzW9qQTNwKmBGoeFuB4Fso8yfnlYQge9y64hIGb2k/BghV
 YMkLgwvhmxfV9MelgTNz5+1SKcM8iLtx6iPWlPEzrC6jBOKPxd5Mxshaj7dCusXXghHlrgwZgHL
 FNlo9vNm5MeWc23/vDvHfQizwY+8v59Ji/QU0i/j0/d59a1+Uj863eCQsDrpYcyyRm0wihlkfb9
 aiEmZDgdCDHAIcqs9zXlBXVDVDLh1esiUdaKI/H555Hi1cnC+sBeoQY+KuZtwbUjqv/7piiBw6E
 mJEXyHAkCEgYq9eutClS+wCg0OBDQqhVgXrZmOmVcb3/Ym0IXT
X-Google-Smtp-Source: AGHT+IFFdCFDS1kC2wPMF+HQJ3KFqcmMvcD5FxqyBlj7GexpRGDlhh7cBSUBJecZAwmhnMABGSPntA==
X-Received: by 2002:a17:907:1c17:b0:b61:e088:b560 with SMTP id
 a640c23a62f3a-b72892ac5b7mr390269166b.4.1762438140895; 
 Thu, 06 Nov 2025 06:09:00 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com.
 [209.85.208.48]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72896454d2sm223905066b.46.2025.11.06.06.09.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 06:09:00 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-6407e617ad4so2096479a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 06:09:00 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUAhAahELNhiUT5FjiXKLY6DjgITt3M06ONRqkA20hm4fDa66dgmsnu7917izD0RP41IgVyf9oluYI=@lists.freedesktop.org
X-Received: by 2002:aa7:d343:0:b0:640:931e:ccac with SMTP id
 4fb4d7f45d1cf-6411d17972dmr2555913a12.7.1762438140350; Thu, 06 Nov 2025
 06:09:00 -0800 (PST)
MIME-Version: 1.0
References: <20251105232737.1933437-1-niklas.soderlund+renesas@ragnatech.se>
 <20251105232737.1933437-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20251105232737.1933437-3-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Nov 2025 15:08:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWGZa6E_Yu-hF9O6yi3rRemWnFdkUeKg3SucqmmLFUUAg@mail.gmail.com>
X-Gm-Features: AWmQ_bmyVoqHrTmXlpr1ElP362H1OrWvK3sMuHRjQlEwD_rKvK_e3yJJeGhG1Kc
Message-ID: <CAMuHMdWGZa6E_Yu-hF9O6yi3rRemWnFdkUeKg3SucqmmLFUUAg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a779a0: Add GE7800 GPU node
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>, 
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, 
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

Hi Niklas,

On Thu, 6 Nov 2025 at 00:28, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Describe Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
> present in Renesas R-Car R8A779A0 V3U SoC.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> @@ -338,6 +338,23 @@ cmt3: timer@e6148000 {
>                         status =3D "disabled";
>                 };
>
> +               gsx: gsx@fd000000 {

Please preserve sort order (by unit address).

> +                       compatible =3D "renesas,r8a779a0-gpu",
> +                                    "img,img-ge7800",
> +                                    "img,img-rogue";
> +                       reg =3D <0 0xfd000000 0 0x40000>;
> +                       interrupts =3D <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&cpg CPG_CORE R8A779A0_CLK_ZG>,
> +                                <&cpg CPG_CORE R8A779A0_CLK_S3D1>,
> +                                <&cpg CPG_MOD 0>;
> +                       clock-names =3D "core", "mem", "sys";
> +                       power-domains =3D <&sysc R8A779A0_PD_3DG_A>,
> +                                       <&sysc R8A779A0_PD_3DG_B>;
> +                       power-domain-names =3D "a", "b";
> +                       resets =3D <&cpg 0>;
> +                       status =3D "disabled";
> +               };
> +
>                 cpg: clock-controller@e6150000 {
>                         compatible =3D "renesas,r8a779a0-cpg-mssr";
>                         reg =3D <0 0xe6150000 0 0x4000>;

The rest LGTM, so with the node name and sort order fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
