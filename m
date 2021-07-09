Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EAC3C27CB
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 18:53:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 159F56E919;
	Fri,  9 Jul 2021 16:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48BE26E919
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 16:53:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 06D4F613CF
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 16:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625849600;
 bh=JsXIl7xahTFA/MerH9QEXjUdUOH9+NPpHNCD++zUxTk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ROy9X/22IM3F80KSn9D8BKeqvxZfFpSFpRP39ztcrS8XD8vBkI5ZboIsBxzvzttLC
 QGWnoquJymewRDtISc7KZ+ujIJpznTzy5G3tJ8PpPWWxe0+laKodBJdlJjl4ofuvwM
 YdyxaZmM/DnodSFPG2JtPmS7B1yXItWiUEHyfmgHT0sWCuIVrzwA59JTvK6tV+2TaW
 GdGHtXiku+RK0a0lxr77dHgruyILj1nRCzecqs6DZyr0w4g5Non5MieRzzUi3vShuL
 2eVBGhW17LCAWnuNT0wYtATHhw3c74gVh5asqyoEwT4NM2gzdnALNOMoxrIVNyZlU3
 cVY5rq01h8jFA==
Received: by mail-ej1-f51.google.com with SMTP id gb6so17340638ejc.5
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 09:53:19 -0700 (PDT)
X-Gm-Message-State: AOAM532L80Zndz8p1jfy4soNu04z9Lw+sV6i90ALA2W2QzBEmEc7POX+
 Eb4He3f3Tm9Z0Z0hJbI0HKvs9Mb2BODEerRozQ==
X-Google-Smtp-Source: ABdhPJylPfVO5RStLK3tb27ot5t8ct8ONmIvowUaaTxaT2qPCccX7VMTYkv1d99rPNZHRTl5Lgmp46mcrBqG+V6/bVo=
X-Received: by 2002:a17:907:62a1:: with SMTP id
 nd33mr38892423ejc.303.1625849598502; 
 Fri, 09 Jul 2021 09:53:18 -0700 (PDT)
MIME-Version: 1.0
References: <trinity-cc8f5927-9aaf-43ae-a107-6a6229f1b481-1625565279264@3c-app-gmx-bs60>
 <25d61873-38ae-5648-faab-03431b74f777@collabora.com>
 <trinity-e6443313-a436-4e9d-a93c-1bef1cce135d-1625736911475@3c-app-gmx-bap19>
 <trinity-3f4f4b55-7e39-4d80-8fc3-7d0e2b3026de-1625758259993@3c-app-gmx-bap19>
 <trinity-fd86a04e-81b6-45f0-8ab4-5c21655bdf53-1625824929532@3c-app-gmx-bap43>
 <CAFqH_52OdB+H+yLh-b8ndbS_w3uwFyQEkZ-y2RQ2RnKnMEt6vQ@mail.gmail.com>
 <trinity-ac304676-173c-42c6-837c-38e62971ede0-1625827104214@3c-app-gmx-bap43>
 <trinity-937ebfa3-d123-42de-a289-3ad0dbc09782-1625830110576@3c-app-gmx-bap43>
In-Reply-To: <trinity-937ebfa3-d123-42de-a289-3ad0dbc09782-1625830110576@3c-app-gmx-bap43>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 10 Jul 2021 00:53:07 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-yi5NP_U-m==ZHeBNC9-6NrjUacKWdmmgVXZjH+sFZKw@mail.gmail.com>
Message-ID: <CAAOTY_-yi5NP_U-m==ZHeBNC9-6NrjUacKWdmmgVXZjH+sFZKw@mail.gmail.com>
Subject: Re: Re: Re: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
To: Frank Wunderlich <frank-w@public-files.de>
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
Cc: chunkuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Frank:

Frank Wunderlich <frank-w@public-files.de> =E6=96=BC 2021=E5=B9=B47=E6=9C=
=889=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=887:28=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> > Gesendet: Freitag, 09. Juli 2021 um 12:38 Uhr
> > Von: "Frank Wunderlich" <frank-w@public-files.de>
> > An: "Enric Balletbo Serra" <eballetbo@gmail.com>
> > Cc: "CK Hu" <ck.hu@mediatek.com>, "Dafna Hirschfeld" <dafna.hirschfeld@=
collabora.com>, "chunkuang Hu" <chunkuang.hu@kernel.org>, "Thomas Zimmerman=
n" <tzimmermann@suse.de>, "David Airlie" <airlied@linux.ie>, "linux-kernel"=
 <linux-kernel@vger.kernel.org>, "Enric Balletbo i Serra" <enric.balletbo@c=
ollabora.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@li=
sts.infradead.org>, "dri-devel" <dri-devel@lists.freedesktop.org>, "Matthia=
s Brugger" <matthias.bgg@gmail.com>, "Collabora Kernel ML" <kernel@collabor=
a.com>
> > Betreff: Aw: Re: Re: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
> >
> >
> > > Gesendet: Freitag, 09. Juli 2021 um 12:24 Uhr
> > > Von: "Enric Balletbo Serra" <eballetbo@gmail.com>
> > > If this is the offending commit, could you try if the following patch
> > > fixes the issue for you?
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.gi=
t/commit/?h=3Dv5.13-next/fixes&id=3Ddb39994e0bd852c6612a9709e63c09b98b161e0=
0
> > >
> > > If not, and that patch is the offending commit, it probably means tha=
t
> > > the default routing table doesn't work for mt7623. Needs a specific
> > > soc table.
> >
> > Hi Eric,
> >
> > thanks for response, but it does not fix the issue for me. hdmi on mt76=
23 is DPI not DSI. There is already a mt7623 specific routing-table defined=
 (one for DPI/HDMI and one for external=3DDSI/MIPI):
> >
> > https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/mediatek=
/mtk_drm_drv.c#L74
> >
> > maybe it can be included or compared with the "default" route?
> >
> > regards Frank
>
> Hi
>
> i tried to convert the old routing table into the new format
>
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-=
mmsys.c
> index 080660ef11bf..134dae13382f 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -20,6 +20,12 @@ static const struct mtk_mmsys_driver_data mt2701_mmsys=
_driver_data =3D {
>         .num_routes =3D ARRAY_SIZE(mmsys_default_routing_table),
>  };
>
> +static const struct mtk_mmsys_driver_data mt7623_mmsys_driver_data =3D {
> +       .clk_driver =3D "clk-mt2701-mm",
> +       .routes =3D mmsys_mt7623_routing_table,
> +       .num_routes =3D ARRAY_SIZE(mmsys_mt7623_routing_table),
> +};
> +
>  static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data =3D {
>         .clk_driver =3D "clk-mt2712-mm",
>         .routes =3D mmsys_default_routing_table,
> @@ -133,6 +139,10 @@ static const struct of_device_id of_match_mtk_mmsys[=
] =3D {
>                 .compatible =3D "mediatek,mt2701-mmsys",
>                 .data =3D &mt2701_mmsys_driver_data,
>         },
> +       {
> +               .compatible =3D "mediatek,mt7623-mmsys",
> +               .data =3D &mt7623_mmsys_driver_data,
> +       },
>         {
>                 .compatible =3D "mediatek,mt2712-mmsys",
>                 .data =3D &mt2712_mmsys_driver_data,
> diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-=
mmsys.h
> index 11388961dded..fd397f68339c 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.h
> +++ b/drivers/soc/mediatek/mtk-mmsys.h
> @@ -214,5 +214,14 @@ static const struct mtk_mmsys_routes mmsys_default_r=
outing_table[] =3D {
>                 DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, UFOE_MOUT_EN_DSI0,
>         }
>  };
> -
> +static const struct mtk_mmsys_routes mmsys_mt7623_routing_table[] =3D {
> +       //HDMI
> +       {
> +               DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> +               DISP_REG_CONFIG_DISP_OVL_MOUT_EN, OVL_MOUT_EN_RDMA
> +       }, {
> +               DDP_COMPONENT_RDMA0, DDP_COMPONENT_DPI0,
> +               DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_DPI0
> +       }
> +};
>  #endif /* __SOC_MEDIATEK_MTK_MMSYS_H */
> :...skipping...
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-=
mmsys.c
> index 080660ef11bf..134dae13382f 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -20,6 +20,12 @@ static const struct mtk_mmsys_driver_data mt2701_mmsys=
_driver_data =3D {
>         .num_routes =3D ARRAY_SIZE(mmsys_default_routing_table),
>  };
>
> +static const struct mtk_mmsys_driver_data mt7623_mmsys_driver_data =3D {
> +       .clk_driver =3D "clk-mt2701-mm",//leave clock as mt7623 is based =
on mt2701
> +       .routes =3D mmsys_mt7623_routing_table,
> +       .num_routes =3D ARRAY_SIZE(mmsys_mt7623_routing_table),
> +};
> +
>  static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data =3D {
>         .clk_driver =3D "clk-mt2712-mm",
>         .routes =3D mmsys_default_routing_table,
> @@ -133,6 +139,10 @@ static const struct of_device_id of_match_mtk_mmsys[=
] =3D {
>                 .compatible =3D "mediatek,mt2701-mmsys",
>                 .data =3D &mt2701_mmsys_driver_data,
>         },
> +       {
> +               .compatible =3D "mediatek,mt7623-mmsys",
> +               .data =3D &mt7623_mmsys_driver_data,
> +       },
>         {
>                 .compatible =3D "mediatek,mt2712-mmsys",
>                 .data =3D &mt2712_mmsys_driver_data,
> diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-=
mmsys.h
> index 11388961dded..fd397f68339c 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.h
> +++ b/drivers/soc/mediatek/mtk-mmsys.h
> @@ -214,5 +214,14 @@ static const struct mtk_mmsys_routes mmsys_default_r=
outing_table[] =3D {
>                 DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, UFOE_MOUT_EN_DSI0,
>         }
>  };
> -
> +static const struct mtk_mmsys_routes mmsys_mt7623_routing_table[] =3D {
> +       //HDMI
> +       {
> +               DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> +               DISP_REG_CONFIG_DISP_OVL_MOUT_EN, OVL_MOUT_EN_RDMA
> +       }, {
> +               DDP_COMPONENT_RDMA0, DDP_COMPONENT_DPI0,
> +               DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_DPI0
> +       }
> +};
>
> here i've left out COLOR0 and BLS because i have not found the 3rd (addre=
ss) and 4th params (value) for the routing between them and edging componen=
ts
>
> this is the old route:
>
>         DDP_COMPONENT_OVL0,
>         DDP_COMPONENT_RDMA0,
>         DDP_COMPONENT_COLOR0,
>         DDP_COMPONENT_BLS,
>         DDP_COMPONENT_DPI0,
>
> so i guess i need:
>
> DISP_REG_CONFIG_DISP_RDMA0_MOUT_EN, RDMA0_MOUT_EN_COLOR0
> DISP_REG_CONFIG_DISP_COLOR0_MOUT_EN, COLOR0_MOUT_EN_BLS
> DISP_REG_CONFIG_DISP_BLS_MOUT_EN, BLS_MOUT_EN_DPI0
>
> thinking OUT is right for display...it's no HDMI-in
> but i'm unsure whats the difference between MOUT and SOUT
>
> compatible for mmsys is already set to mediatek,mt7623-mmsys in arch/arm/=
boot/dts/mt7623n.dtsi but it's not working, i guess because color0 and bls =
are missing in route
>
> any hint how to add them?

SOUT means even though data could output to multiple sink, but could
only output to single sink at one moment. MOUT means data could output
to multiple sink at one moment.
For SOUT with 4 sink output, the value for each sink would be 0, 1, 2, 3.
For MOUT with 4 sink output, the value for each sink would be BIT(0),
BIT(1), BIT(2), BIT(3).
[1] is my original design, and it has 'mask' in struct mtk_mmsys_conn_cfg.
For SOUT with 4 sink output, the mask would be 0x3.
For MOUT with 4 sink output, the mask would be 0xf.
You could try to add back the mask.

[1] https://chromium-review.googlesource.com/c/chromiumos/third_party/kerne=
l/+/2345186

Regards,
Chun-Kuang.

>
> regards Frank
