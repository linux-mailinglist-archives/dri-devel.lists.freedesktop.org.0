Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA88D9F625B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 11:06:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625BF10EB3F;
	Wed, 18 Dec 2024 10:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39D110EB3F
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 10:06:49 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-844ce6d0716so480888839f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 02:06:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734516409; x=1735121209;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SvpieJCHhkISUTUlgye5lssHWrIBSVqqrABKwtDyEdQ=;
 b=uVmkvPLv4BCI58ccEaLrNYREA7YeVp63/tF9CpOEwyBJCijZjHxIsNeEL+8bvqOhWx
 su4O7G8Jjl5o1yAQLeEbUw4sdBtPvcXxzhz0me5Anstn7bOFAyZahfE8e9sR/rakIMK0
 57tBRGHaGx7y+Nlh7sLRfyixNf804x/dRa1Ikx3Mc5REbqx/bQZAqPEwSqT4YeRZRoAL
 KstO9PYdXvCcwBy+RlWii39vQrsW1BXWt2tO6ZXoNOuI6qHIbJDFMt7VfXOLHZQTi/y4
 W8Zh/PpMoP3CsGBipbdE+rzmAb0E8tuIgq7YqpHgoiyovuVQaEh7NygIGneG1AvQ+vbV
 7nQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4YqlSj+kX2dmqA8pQuDpT+aNbszvGwXNO8725aY2q4lqksV2lJhXyqOt/Mvo96x5VGsxCrWeQZgM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqhxbdwOzj41p8BqhV+VMIxV2LnAV7Jp1JPqtyoJNK1bEpNl3S
 dgUaoYnKgXD+YoXc6jMy4lJA43swLBNeMAmZn6/Qe7ullb/FeJJocvxZqMxK
X-Gm-Gg: ASbGncshNcdMTNCkBJcKAaebFbKxB1Vvsc2bM32HvdmOSBmonISs+KaBruN3fLMB3x7
 ICIH0h62ZEPLs6TNRwLcAkBv6tT+Uz+nV+r9ID+e1HjOI+8CHy2id0pukLd/WaAXdmGy0wTFNrJ
 z8W1lxP1v7M08gwXqwLtJal/IQRhlp2Fd3eKmIHUju997yYuauMfcB6FZfmNtM1kq7d5XG3RHxr
 YplKm9L/NpHqV4jh5uVdzJ0HhPsfBR8b3iQf2cz1wkbd+ZuLVxik7weZvxanyLtOAoOfzpzrGjU
 B/zKsRrHptF68Vvpb0c=
X-Google-Smtp-Source: AGHT+IG2m1V1AZT2uVMXNQC66hn5qGqAaDXc2A/wUcbSGG8U+iTLl1FlllU3XTdUAc46obSt+yBA0A==
X-Received: by 2002:a05:6e02:194c:b0:3a7:c5cb:8bf3 with SMTP id
 e9e14a558f8ab-3bdc0bc8017mr23996705ab.9.1734516408748; 
 Wed, 18 Dec 2024 02:06:48 -0800 (PST)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com.
 [209.85.166.45]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3b2475b01bbsm26334505ab.7.2024.12.18.02.06.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 02:06:48 -0800 (PST)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-844de072603so539889939f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 02:06:48 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUZR7+tpnyqDr5rjjmTIaDXyN5USnfBbYezVBK/Oi22b1hm8QiYbhm/sTttR7QWZiC9Lxewglj0r3A=@lists.freedesktop.org
X-Received: by 2002:a05:6102:38c7:b0:4b1:2010:5cd7 with SMTP id
 ada2fe7eead31-4b2ae735822mr1363766137.8.1734516092461; Wed, 18 Dec 2024
 02:01:32 -0800 (PST)
MIME-Version: 1.0
References: <20241218085837.2670434-1-arnd@kernel.org>
In-Reply-To: <20241218085837.2670434-1-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Dec 2024 11:01:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW-PEnkRugFVw2=0Xozw6TQaAJN_FzNucPMTZazZ3--hw@mail.gmail.com>
Message-ID: <CAMuHMdW-PEnkRugFVw2=0Xozw6TQaAJN_FzNucPMTZazZ3--hw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: stop selecting foreign drivers
To: Arnd Bergmann <arnd@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 CK Hu <ck.hu@mediatek.com>, 
 Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Chen-Yu Tsai <wenst@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Hi Arnd,

On Wed, Dec 18, 2024 at 9:58=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The PHY portion of the mediatek hdmi driver was originally part of
> the driver it self and later split out into drivers/phy, which a
> 'select' to keep the prior behavior.
>
> However, this leads to build failures when the PHY driver cannot
> be built:
>
> WARNING: unmet direct dependencies detected for PHY_MTK_HDMI
>   Depends on [n]: (ARCH_MEDIATEK || COMPILE_TEST [=3Dy]) && COMMON_CLK [=
=3Dy] && OF [=3Dy] && REGULATOR [=3Dn]
>   Selected by [m]:
>   - DRM_MEDIATEK_HDMI [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && DRM_MED=
IATEK [=3Dm]
> ERROR: modpost: "devm_regulator_register" [drivers/phy/mediatek/phy-mtk-h=
dmi-drv.ko] undefined!
> ERROR: modpost: "rdev_get_drvdata" [drivers/phy/mediatek/phy-mtk-hdmi-drv=
.ko] undefined!
>
> The best option here is to just not select the phy driver and leave that
> up to the defconfig. Do the same for the other PHY and memory drivers
> selected here as well for consistency.
>
> Fixes: a481bf2f0ca4 ("drm/mediatek: Separate mtk_hdmi_phy to an independe=
nt module")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch!

> --- a/drivers/gpu/drm/mediatek/Kconfig
> +++ b/drivers/gpu/drm/mediatek/Kconfig
> @@ -15,9 +15,6 @@ config DRM_MEDIATEK
>         select DRM_BRIDGE_CONNECTOR
>         select DRM_MIPI_DSI
>         select DRM_PANEL
> -       select MEMORY
> -       select MTK_SMI
> -       select PHY_MTK_MIPI_DSI
>         select VIDEOMODE_HELPERS
>         help
>           Choose this option if you have a Mediatek SoCs.
> @@ -28,7 +25,6 @@ config DRM_MEDIATEK
>  config DRM_MEDIATEK_DP
>         tristate "DRM DPTX Support for MediaTek SoCs"
>         depends on DRM_MEDIATEK
> -       select PHY_MTK_DP
>         select DRM_DISPLAY_HELPER
>         select DRM_DISPLAY_DP_HELPER
>         select DRM_DISPLAY_DP_AUX_BUS
> @@ -39,6 +35,5 @@ config DRM_MEDIATEK_HDMI
>         tristate "DRM HDMI Support for Mediatek SoCs"
>         depends on DRM_MEDIATEK
>         select SND_SOC_HDMI_CODEC if SND_SOC
> -       select PHY_MTK_HDMI
>         help
>           DRM/KMS HDMI driver for Mediatek SoCs

What about replacing select by imply?

Alternatively, PHY_MTK_HDMI could default to DRM_MEDIATEK ||
DRM_MEDIATEK_DP || DRM_MEDIATEK_HDMI.

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
