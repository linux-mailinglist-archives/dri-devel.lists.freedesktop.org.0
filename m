Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 193E53C22D6
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 13:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2978A6EA0C;
	Fri,  9 Jul 2021 11:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE926EA0C
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 11:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1625830110;
 bh=j6rzl1T2VppWbP//akxXTOsnokNfQHS/1AZyiol3FiY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=aQKTUaB+t57AI1VLXEbZeO4kiHHBr4GyDifUjWrRqEuRN75IHjwEFyJhyZEI4BXYo
 B/TMplp2rMzI4g/4KcOYiIINMUTY38x/k0tXmxlKcx/yzZ6WlkuaByU9W3J/BIUFHe
 u2WsCau4I8xJXd+CFjNFzX1XA+ol/Mkxc52wC6HY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.72.148] ([80.245.72.148]) by web-mail.gmx.net
 (3c-app-gmx-bap43.server.lan [172.19.172.113]) (via HTTP); Fri, 9 Jul 2021
 13:28:30 +0200
MIME-Version: 1.0
Message-ID: <trinity-937ebfa3-d123-42de-a289-3ad0dbc09782-1625830110576@3c-app-gmx-bap43>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <frank-w@public-files.de>
Subject: Aw: Re: Re: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 9 Jul 2021 13:28:30 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <trinity-ac304676-173c-42c6-837c-38e62971ede0-1625827104214@3c-app-gmx-bap43>
References: <trinity-cc8f5927-9aaf-43ae-a107-6a6229f1b481-1625565279264@3c-app-gmx-bs60>
 <25d61873-38ae-5648-faab-03431b74f777@collabora.com>
 <trinity-e6443313-a436-4e9d-a93c-1bef1cce135d-1625736911475@3c-app-gmx-bap19>
 <trinity-3f4f4b55-7e39-4d80-8fc3-7d0e2b3026de-1625758259993@3c-app-gmx-bap19>
 <trinity-fd86a04e-81b6-45f0-8ab4-5c21655bdf53-1625824929532@3c-app-gmx-bap43>
 <CAFqH_52OdB+H+yLh-b8ndbS_w3uwFyQEkZ-y2RQ2RnKnMEt6vQ@mail.gmail.com>
 <trinity-ac304676-173c-42c6-837c-38e62971ede0-1625827104214@3c-app-gmx-bap43>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:AhrRymJLG798R6GlUJTbNXqVLA1onupKDy3QLdwBQ5EYAo7ciyRAU2pghP2iI4fOpy0d3
 HLJITFxviSNxFnviafc49JthpmaVeocjLJi2OqJHTilPAP0HeBFEz4Q2e5dp1RPLomdNw4hzaI3e
 zVrFI31RZ0abng4Rr5ke1nXgsyTNC9cHTAv03vpYk0I5sCtsX0K2mo06J7mv1C5u3tThGHPkpCpi
 KsWpqlFp7NtSfCph2QlCHSis9zn0C4lc3xgIk8n8HjOWZR+qyaM0LCdSW9I6GhKnK5KqDm5oVRcW
 tg=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:u/imABG7Iec=:u2nsH1ZpUrdBA+kERlefig
 JGl0qkxTikV9vr6rF1CNQmnX+KQWdMeSbOINRt4eobJDvdGVMOHJAWdemloYuj2An8Z5Bt1z/
 y8odNW9trnqMqpHcg94RSyld8xW0TFZR1nWkGRcidcGDVQoEpaMGm8JJmPWJ/OlSQ7oBa0r0F
 fAW2YyVM5SmQ4gRtV35Tk/rj+lHnm97AsTezin5NIqD2Tpmhg2M+lxcRVpzDEriT1unulX/zg
 xCUPFqurpvbDGWUqbbJpr6lEBw1X4Py5pEaxNnM8XdoIYgHXti6knT4AYrssXKHjqwLs2SotK
 xvweXIg0kTpHGCXWfJbkR9en47rjLgC7VcttYlD/6m5o/JnA4djtsZQqnOhDNwP8ZV8y4FFH6
 PUimzCdiV6jYCb6R2P0rkJ/10Qf2huYZOnNog8OyQ9HHzUWF410cqA5ZjQ5IVGX2gc3JSub6Q
 7MXhA92e14Ik4EywTpPOA/LPHIcczUZLhPPEqZiPGJkkjw6Qg2WmbLrBQ7EXoXNDfhFbn2qnV
 EIwai2UnUPY6eyWEYKL1AIzYcfERPjWqTkAiWdiLFeE9T2crlh7E86kEVK7bN/DZtp8cPVZDN
 6x7ueZs+JY0pB09SSKoqGQSIQmDqViH48oiiu17Z5a1BuOdg54v60WyLO4Ld0++6ZNsLlgBPt
 5ICgzjtR0ycZBr8nbDaWii7QwpBi0k6O8+nJrT7l84U4At7DcXTHJnltNb6rqjEWYUZ0QAnr1
 5rxJZMx/2Ca7Cr6bI4y73M5y1+FzKej00kqCkveVQinet4A9GhDEfntbW36VjE3VqTKgLFwyk
 cYN8gs6AtXlA9cVYZr3Zb9CDuyuDmhnHXyC+9f556eoCuNHCu0=
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
 linux-kernel <linux-kernel@vger.kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 David Airlie <airlied@linux.ie>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Collabora Kernel ML <kernel@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Gesendet: Freitag, 09. Juli 2021 um 12:38 Uhr
> Von: "Frank Wunderlich" <frank-w@public-files.de>
> An: "Enric Balletbo Serra" <eballetbo@gmail.com>
> Cc: "CK Hu" <ck.hu@mediatek.com>, "Dafna Hirschfeld" <dafna.hirschfeld@c=
ollabora.com>, "chunkuang Hu" <chunkuang.hu@kernel.org>, "Thomas Zimmerman=
n" <tzimmermann@suse.de>, "David Airlie" <airlied@linux.ie>, "linux-kernel=
" <linux-kernel@vger.kernel.org>, "Enric Balletbo i Serra" <enric.balletbo=
@collabora.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek=
@lists.infradead.org>, "dri-devel" <dri-devel@lists.freedesktop.org>, "Mat=
thias Brugger" <matthias.bgg@gmail.com>, "Collabora Kernel ML" <kernel@col=
labora.com>
> Betreff: Aw: Re: Re: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
>
>
> > Gesendet: Freitag, 09. Juli 2021 um 12:24 Uhr
> > Von: "Enric Balletbo Serra" <eballetbo@gmail.com>
> > If this is the offending commit, could you try if the following patch
> > fixes the issue for you?
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git=
/commit/?h=3Dv5.13-next/fixes&id=3Ddb39994e0bd852c6612a9709e63c09b98b161e0=
0
> >
> > If not, and that patch is the offending commit, it probably means that
> > the default routing table doesn't work for mt7623. Needs a specific
> > soc table.
>
> Hi Eric,
>
> thanks for response, but it does not fix the issue for me. hdmi on mt762=
3 is DPI not DSI. There is already a mt7623 specific routing-table defined=
 (one for DPI/HDMI and one for external=3DDSI/MIPI):
>
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/mediatek/=
mtk_drm_drv.c#L74
>
> maybe it can be included or compared with the "default" route?
>
> regards Frank

Hi

i tried to convert the old routing table into the new format

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-m=
msys.c
index 080660ef11bf..134dae13382f 100644
=2D-- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -20,6 +20,12 @@ static const struct mtk_mmsys_driver_data mt2701_mmsys_=
driver_data =3D {
        .num_routes =3D ARRAY_SIZE(mmsys_default_routing_table),
 };

+static const struct mtk_mmsys_driver_data mt7623_mmsys_driver_data =3D {
+       .clk_driver =3D "clk-mt2701-mm",
+       .routes =3D mmsys_mt7623_routing_table,
+       .num_routes =3D ARRAY_SIZE(mmsys_mt7623_routing_table),
+};
+
 static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data =3D {
        .clk_driver =3D "clk-mt2712-mm",
        .routes =3D mmsys_default_routing_table,
@@ -133,6 +139,10 @@ static const struct of_device_id of_match_mtk_mmsys[]=
 =3D {
                .compatible =3D "mediatek,mt2701-mmsys",
                .data =3D &mt2701_mmsys_driver_data,
        },
+       {
+               .compatible =3D "mediatek,mt7623-mmsys",
+               .data =3D &mt7623_mmsys_driver_data,
+       },
        {
                .compatible =3D "mediatek,mt2712-mmsys",
                .data =3D &mt2712_mmsys_driver_data,
diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-m=
msys.h
index 11388961dded..fd397f68339c 100644
=2D-- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -214,5 +214,14 @@ static const struct mtk_mmsys_routes mmsys_default_ro=
uting_table[] =3D {
                DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, UFOE_MOUT_EN_DSI0,
        }
 };
-
+static const struct mtk_mmsys_routes mmsys_mt7623_routing_table[] =3D {
+       //HDMI
+       {
+               DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
+               DISP_REG_CONFIG_DISP_OVL_MOUT_EN, OVL_MOUT_EN_RDMA
+       }, {
+               DDP_COMPONENT_RDMA0, DDP_COMPONENT_DPI0,
+               DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_DPI0
+       }
+};
 #endif /* __SOC_MEDIATEK_MTK_MMSYS_H */
:...skipping...
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-m=
msys.c
index 080660ef11bf..134dae13382f 100644
=2D-- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -20,6 +20,12 @@ static const struct mtk_mmsys_driver_data mt2701_mmsys_=
driver_data =3D {
        .num_routes =3D ARRAY_SIZE(mmsys_default_routing_table),
 };

+static const struct mtk_mmsys_driver_data mt7623_mmsys_driver_data =3D {
+       .clk_driver =3D "clk-mt2701-mm",//leave clock as mt7623 is based o=
n mt2701
+       .routes =3D mmsys_mt7623_routing_table,
+       .num_routes =3D ARRAY_SIZE(mmsys_mt7623_routing_table),
+};
+
 static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data =3D {
        .clk_driver =3D "clk-mt2712-mm",
        .routes =3D mmsys_default_routing_table,
@@ -133,6 +139,10 @@ static const struct of_device_id of_match_mtk_mmsys[]=
 =3D {
                .compatible =3D "mediatek,mt2701-mmsys",
                .data =3D &mt2701_mmsys_driver_data,
        },
+       {
+               .compatible =3D "mediatek,mt7623-mmsys",
+               .data =3D &mt7623_mmsys_driver_data,
+       },
        {
                .compatible =3D "mediatek,mt2712-mmsys",
                .data =3D &mt2712_mmsys_driver_data,
diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-m=
msys.h
index 11388961dded..fd397f68339c 100644
=2D-- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -214,5 +214,14 @@ static const struct mtk_mmsys_routes mmsys_default_ro=
uting_table[] =3D {
                DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, UFOE_MOUT_EN_DSI0,
        }
 };
-
+static const struct mtk_mmsys_routes mmsys_mt7623_routing_table[] =3D {
+       //HDMI
+       {
+               DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
+               DISP_REG_CONFIG_DISP_OVL_MOUT_EN, OVL_MOUT_EN_RDMA
+       }, {
+               DDP_COMPONENT_RDMA0, DDP_COMPONENT_DPI0,
+               DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_DPI0
+       }
+};

here i've left out COLOR0 and BLS because i have not found the 3rd (addres=
s) and 4th params (value) for the routing between them and edging componen=
ts

this is the old route:

	DDP_COMPONENT_OVL0,
	DDP_COMPONENT_RDMA0,
	DDP_COMPONENT_COLOR0,
	DDP_COMPONENT_BLS,
	DDP_COMPONENT_DPI0,

so i guess i need:

DISP_REG_CONFIG_DISP_RDMA0_MOUT_EN, RDMA0_MOUT_EN_COLOR0
DISP_REG_CONFIG_DISP_COLOR0_MOUT_EN, COLOR0_MOUT_EN_BLS
DISP_REG_CONFIG_DISP_BLS_MOUT_EN, BLS_MOUT_EN_DPI0

thinking OUT is right for display...it's no HDMI-in
but i'm unsure whats the difference between MOUT and SOUT

compatible for mmsys is already set to mediatek,mt7623-mmsys in arch/arm/b=
oot/dts/mt7623n.dtsi but it's not working, i guess because color0 and bls =
are missing in route

any hint how to add them?

regards Frank
