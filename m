Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 092C7C61691
	for <lists+dri-devel@lfdr.de>; Sun, 16 Nov 2025 15:10:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F6410E046;
	Sun, 16 Nov 2025 14:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF65310E046
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 14:10:07 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-59581e32163so3131373e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 06:10:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763302206; x=1763907006;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1P5GUNQOH0XPCOyCgZr+gwsMYMYyLhVYsxtxGdPiZx4=;
 b=aM/X/vCrTlpmuUEkhcydrdS6W62I2SKhfQmzGMXLLlgPjPF0b35OLnCLBerc/ZbS9x
 +OVQlQAQ5a+GIFvCM5dVlybnuSIUmck+FhIxB6LDpxizLqq5rmDRM1oPXzmuX9FnDt/C
 VVOW4uGctJ4QIxpq8zg9xt/WCCsbAt7lThTx1oK7nyttFm1Nofvw+qZIXsgmJtJF9at6
 XvrlCPhEvePppyNmklG8BVFCHxv8/x/6qKTiidtK6LLMAFUPafqByeyOoFpz38rFYtTG
 /ZimLN7MU+KvDZjzney7dAf1hl1Jv47X4E60Zz3oNpCvsxyQW+pgqOdxTrsRJI0e1rTj
 V/Xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkDHtY+9eu6z9jlw5oxQ5v8lbqIcReVG+X0iGiOMAO/eW4Y/EFZCMybOtbE2uWONzeKacHN2/35B4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGEF+ABCbsS6b/q42XLdRninPEi30qm6k7ggnPmxZBM4mY+xcO
 jnnGB262qKMQyFcSA2sqxMZVBmm9XP01k5/JA7UZ7FRQL1nFT7XhJVVGY3XAsy/uD2g=
X-Gm-Gg: ASbGncsyFOEYTwSEiaiu2HyNImfISlvtrNxRp0LORgMjonmf4ByZ/rgHmCfzBhhhfbo
 pn2JO4Y2eWKWsl5vo6qyqt3KZ7wp7qKfiIyePVpREo52zq2aoPTpp3Wv+rD3brCrWEvVwRE00ew
 yicXGbSGngk2GgJS/L/fq1eHvWZviQcFGzaf6XQ/Cm5AKEW/NnhU64cNdSPSQDI5Q7/jnYdFITQ
 DV+IB4lcGJErtpWB6rWoWVxUHUiozbX8XAkIkmSGXG4tPMxh0kp9Sk5lBuobukyPnLgRcPPAuxB
 uLre9bajywav2zxYeMRYR7LUxVlG5pscL0/vTbDukoKPDSuNg43dgVPD5lE7jYeraUhtZzSggKy
 bLO/CAKN0TbN1xHHnoSfRA/il+RCKKY+pC7xUX0nnloNiNtdWMYZWYMSqPi0e7WLe8awNqP4rJh
 0bjDbfG7oP8hNLP5ovPUWGgfrhYcLi/VCe
X-Google-Smtp-Source: AGHT+IEZOUzyEeKuUTACT4zDZ7Yt4to7RcxjqduWOHFqS6khOpcnPolK4UWjfslq3ZFyr1tpN7I/Hg==
X-Received: by 2002:a05:6512:3ba3:b0:595:76d6:26ea with SMTP id
 2adb3069b0e04-595841b3febmr3589924e87.23.1763302205255; 
 Sun, 16 Nov 2025 06:10:05 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
 [209.85.208.177]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-595803b42fdsm2430893e87.38.2025.11.16.06.10.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Nov 2025 06:10:05 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-37a34702a20so28330721fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 06:10:05 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXfuF9T2pyoMNdIirHlPbmrWA86BTYZKHs1UcoeSlSdgyT95qmw041Qi5ICNavITlTGAn9WvlnrHKM=@lists.freedesktop.org
X-Received: by 2002:a05:651c:440f:10b0:37b:9e27:89f with SMTP id
 38308e7fff4ca-37babd73323mr19895421fa.37.1763301811739; Sun, 16 Nov 2025
 06:03:31 -0800 (PST)
MIME-Version: 1.0
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
 <20251116134609.447043-1-kuba@szczodrzynski.pl>
In-Reply-To: <20251116134609.447043-1-kuba@szczodrzynski.pl>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 16 Nov 2025 22:03:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v67V01k8zj2r+Dd+JDEsH2LX2Jtx+CP=i8aQfX_JyFtLfg@mail.gmail.com>
X-Gm-Features: AWmQ_bnVpj5bkGX3ksszDMr19xhbiJNyazuPC_F2JRblaiVwkcXftIdoMcMBl8Q
Message-ID: <CAGb2v67V01k8zj2r+Dd+JDEsH2LX2Jtx+CP=i8aQfX_JyFtLfg@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] drm/sun4i: Support LVDS on D1s/T113 combo D-PHY
To: =?UTF-8?Q?Kuba_Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
Cc: Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, parthiban@linumiz.com, paulk@sys-base.io
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
Reply-To: wens@csie.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 16, 2025 at 9:46=E2=80=AFPM Kuba Szczodrzy=C5=84ski
<kuba@szczodrzynski.pl> wrote:
>
> [replying to v1 to keep the same series on Patchwork]

That is not the right way to do it.

If you reply to an old series, the tooling does not pickup the new version
as a separate series.

ChenYu

> Some Allwinner chips (notably the D1s/T113 and the A100) have a "combo
> MIPI DSI D-PHY" which is required when using single-link LVDS0. The same
> PD0..PD9 pins are used for either DSI or LVDS.
>
> Other than having to use the combo D-PHY, LVDS output is configured in
> the same way as on older chips.
>
> This series enables the sun6i MIPI D-PHY to also work in LVDS mode. It
> is then configured by the LCD TCON, which allows connecting a
> single-link LVDS display panel.
>
> Changes in v2/v3:
> - Applied code formatting changes from review comments
> - Changed "dphy" to "combo-phy"
> - Made the LVDS setup/teardown functions abort early in case of error
>   (adding a proper return value would require changes in several levels
>    of caller functions; perhaps could be done in a separate patch)
> - Added the PHY properties to DT bindings
> - Renamed lvds0_pins to lcd_lvds0_pins
> - Rebased on top of drm/misc/kernel/for-linux-next
> - Hopefully corrected the incomplete patch list of v2, which happened
>   due to an SMTP error
>
> Kuba Szczodrzy=C5=84ski (6):
>   phy: allwinner: phy-sun6i-mipi-dphy: Support LVDS in combo D-PHY
>   drm/sun4i: Support LVDS using MIPI DSI combo D-PHY
>   drm/sun4i: Enable LVDS output on sun20i D1s/T113
>   dt-bindings: display: sun4i: Add D1s/T113 combo D-PHY bindings
>   riscv: dts: allwinner: d1s-t113: Add D-PHY to TCON LCD0
>   riscv: dts: allwinner: d1s-t113: Add LVDS0 pins
>
>  .../display/allwinner,sun4i-a10-tcon.yaml     |  6 ++
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 11 +++
>  drivers/gpu/drm/sun4i/sun4i_tcon.c            | 50 +++++++++++++
>  drivers/gpu/drm/sun4i/sun4i_tcon.h            |  6 ++
>  drivers/phy/allwinner/phy-sun6i-mipi-dphy.c   | 70 ++++++++++++++++++-
>  5 files changed, 141 insertions(+), 2 deletions(-)
>
> --
> 2.25.1
>
