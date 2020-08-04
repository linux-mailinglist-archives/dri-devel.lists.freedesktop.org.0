Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A8823C6B2
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 09:13:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7C36E503;
	Wed,  5 Aug 2020 07:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF906E478
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 15:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596554545;
 bh=sjy/7cbvWFDMn93C7JAJB2eqqf8LM8odrGp9n3IbZGk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=cQpkxL4hhhXpPxZQ+R3FkwSJH+yJQ71UhitSB3H854cKFCgN+OUrO7WPyJmejWVIP
 3Wi4A3baqTW7qzOP0DDx3TS5fHWDRaOc7fOu4vw/RWlFgGGZfPw+40py8e7rwrVgt9
 +sFA8x66BQmOfLrlVUc/XN7kh4WaEeXvEsMZBSlE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.144.119] ([217.61.144.119]) by web-mail.gmx.net
 (3c-app-gmx-bap28.server.lan [172.19.172.98]) (via HTTP); Tue, 4 Aug 2020
 17:22:25 +0200
MIME-Version: 1.0
Message-ID: <trinity-e5fb1e73-2aa9-4dd2-a115-3ef216a6336e-1596554545050@3c-app-gmx-bap28>
From: Frank Wunderlich <frank-w@public-files.de>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Aw: Re: [PATCH v3 5/5] arm: dts: mt7623: add display subsystem
 related device nodes
Date: Tue, 4 Aug 2020 17:22:25 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <CAAOTY_9aDqz3muo6ynqX9r0VjW7tD5vvZOiQyR8UZOTUct8oVA@mail.gmail.com>
References: <20200804105849.70876-1-linux@fw-web.de>
 <20200804105849.70876-6-linux@fw-web.de>
 <CAAOTY_9aDqz3muo6ynqX9r0VjW7tD5vvZOiQyR8UZOTUct8oVA@mail.gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:7BhFM7ZWcvyKxzn6X4OC4HJ8PW9UUMcnuJQtOpn6fq0ut1vX7rAoKcI91P7RKJEfeCOqY
 I7ot1zQTlWvDkGkrGRSwc/lkJY+S4g36GnrQ5NxM/dnbOI8JKOzLX4hTuObrTliv53GWrt2CH808
 EB+hekE8X9q28nNguT6jIHaJrES3w4QS0pDwZOrkCZ2OW/g+CjeHYytnnCQu5LXkTmsN04KJPo0Y
 e+L5vmaIR6gKZMLOS2YdrJArq4nbjh33LgekvMS14m097X6q2beSmbCZ88D3fUNUe5HurO/Ctvje
 Sc=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:n7pknJx/PMc=:jYzmEzGpoiLpdjr8CLGEVU
 xgdSkHEUheng6dfd/mOS6rlbAmsK9UtntmoXDI5vg2mGGnQ8m8jD2MY8hZS5SEblnHeYQkT4v
 NHVIAXocNqblBarVIZF9gR5RSDnH7Eoo9fouYWm4HxJfdGECFSM3AWf7uWzosqigLZt7G/h9K
 wD77NPmX4H1fmpBZhK674+wuxQyv+YEQDBE2qiwIId0nKkESLvYzU+sOYbO6VmsKybX8ah/kG
 CSYXZ4piQV4bhxMwhp4TvsksOMoKc7hAJ7EFHgkEGPc9IBzVXFvhq5hCMVD1LRkHuC43og0lp
 tHzbbuEFuC47drEqr3KmVf5uDu36aVMztcpTFC9yGZVAPuXltw7rpReAnh41oLx8s8amzcI1Z
 Lzss8TcVNRyl8sMHW8lNZKg01uaunbwLrbF7MdwN6DBQrDPUJVVdCEPjejT/O3L56N/uk5EJV
 xdGLZcAeY/AFekB4U3r4qsWvuTl43XOhNgtIZCU/B4aN14vtukWafnYuRi2xNKEOzKNh+wRl7
 7uCqWLuBd56okF/gE89sihIgbTzTvakgPDCJBOJXQ9crq48EM6jtgF5SEct4zIU1oDrrfnvaV
 cQ76SjFDTD00YBTd9GwVwmxgcya3zTgiAANKBga4jzRNqjf3b/FSoQv3P90nnCKni275L3G6K
 rBsvblDim8x8Encjmp0zKDc7mK1tPVMdL4AvbwlA0gpThU40nhflV3U7kQ4DbW61yQZw=
X-Mailman-Approved-At: Wed, 05 Aug 2020 07:13:16 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 chunhui dai <chunhui.dai@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Frank Wunderlich <linux@fw-web.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

Except mmsys (i added in Patch #1) all mt7623-compatibles are not defined in code and fallback (mt2701-x/mt8173-x) is used. If i add it in dt-binding, it should be added in code too, right? or should i remove mt7623 compatibles and only add documentation for new mmsys?

regards Frank


> Gesendet: Dienstag, 04. August 2020 um 17:00 Uhr
> Von: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>
> An: "Frank Wunderlich" <linux@fw-web.de>
> > +       mipi_tx0: mipi-dphy@10010000 {
> > +               compatible = "mediatek,mt7623-mipi-tx",
>
> In mediatek,dsi.txt [1], "mediatek,mt7623-mipi-tx" is undefined.
>
> [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/display/mediatek/mediatek%2Cdsi.txt

in drivers/gpu/drm/mediatek/mtk_mipi_tx.c only the compatible for mt2701 is defined (which is fallback in dts). So should i remove mt7623 compatible here and in the other occurences?

>
> > +                            "mediatek,mt2701-mipi-tx";

> > +
> > +       cec: cec@10012000 {
> > +               compatible = "mediatek,mt7623-cec",
>
> Please explicitly define "mediatek,mt7623-cec" in mediatek,hdmi.txt [2].
>
> [2] https://www.kernel.org/doc/Documentation/devicetree/bindings/display/mediatek/mediatek%2Chdmi.txt
>
> > +                            "mediatek,mt8173-cec";

same here...only mt8173-cec is defined in drivers/gpu/drm/mediatek/mtk_cec.c

> >         cir: cir@10013000 {
> >                 compatible = "mediatek,mt7623-cir";
> >                 reg = <0 0x10013000 0 0x1000>;
> > @@ -369,6 +393,18 @@ apmixedsys: syscon@10209000 {
> >                 #clock-cells = <1>;
> >         };
> >
> > +       hdmi_phy: phy@10209100 {
> > +               compatible = "mediatek,mt7623-hdmi-phy",
>
> Ditto.
>
> > +                            "mediatek,mt2701-hdmi-phy";
same as above (./drivers/gpu/drm/mediatek/mtk_hdmi_phy.c)

> > +       hdmiddc0: i2c@11013000 {
> > +               compatible = "mediatek,mt7623-hdmi-ddc",
>
> Ditto.
>
> > +                            "mediatek,mt8173-hdmi-ddc";
> > +               interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_LOW>;
> > +               reg = <0 0x11013000 0 0x1C>;
> > +               clocks = <&pericfg CLK_PERI_I2C3>;
> > +               clock-names = "ddc-i2c";
> > +               status = "disabled";
> > +       };
> > +
> >         nor_flash: spi@11014000 {
> >                 compatible = "mediatek,mt7623-nor",
> >                              "mediatek,mt8173-nor";
> > @@ -766,6 +812,84 @@ mmsys: syscon@14000000 {
> >                 #clock-cells = <1>;
> >         };
> >
> > +       display_components: dispsys@14000000 {
> > +               compatible = "mediatek,mt7623-mmsys",
> > +                            "mediatek,mt2701-mmsys";
>
> In mediatek,mmsys.txt [3], this should be:
>
> mmsys: syscon@14000000 {
>         compatible = "mediatek,mt7623-mmsys", "mediatek,mt2701-mmsys", "syscon"
>
> [3] https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/mediatek/mediatek%2Cmmsys.txt

as i added this in driver, i add this to documentation (and maybe remove the fallback because it results in wrong routing?)

>
> > +               reg = <0 0x14000000 0 0x1000>;
> > +               power-domains = <&scpsys MT2701_POWER_DOMAIN_DISP>;
> > +       };
> > +
> > +       ovl@14007000 {
> > +               compatible = "mediatek,mt7623-disp-ovl",
>
> This is not defined in mediatek,disp.txt [4].
>
> [4] https://www.kernel.org/doc/Documentation/devicetree/bindings/display/mediatek/mediatek%2Cdisp.txt
also not defined in drivers/gpu/drm/mediatek/mtk_drm_drv.c so again fallback used

>
> > +                            "mediatek,mt2701-disp-ovl";

> > +               reg = <0 0x14007000 0 0x1000>;
> > +               interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_LOW>;
> > +               clocks = <&mmsys CLK_MM_DISP_OVL>;
> > +               iommus = <&iommu MT2701_M4U_PORT_DISP_OVL_0>;
> > +               mediatek,larb = <&larb0>;
> > +       };
> > +
> > +       rdma0: rdma@14008000 {
> > +               compatible = "mediatek,mt7623-disp-rdma",
> > +                            "mediatek,mt2701-disp-rdma";
> > +               reg = <0 0x14008000 0 0x1000>;
> > +               interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_LOW>;
> > +               clocks = <&mmsys CLK_MM_DISP_RDMA>;
> > +               iommus = <&iommu MT2701_M4U_PORT_DISP_RDMA>;
> > +               mediatek,larb = <&larb0>;
> > +       };
> > +
> > +       wdma@14009000 {
> > +               compatible = "mediatek,mt7623-disp-wdma",
> > +                            "mediatek,mt2701-disp-wdma";
> > +               reg = <0 0x14009000 0 0x1000>;
> > +               interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_LOW>;
> > +               clocks = <&mmsys CLK_MM_DISP_WDMA>;
> > +               iommus = <&iommu MT2701_M4U_PORT_DISP_WDMA>;
> > +               mediatek,larb = <&larb0>;
> > +       };
> > +
> > +       bls: pwm@1400a000 {
> > +               compatible = "mediatek,mt7623-disp-pwm",
> > +                            "mediatek,mt2701-disp-pwm";
> > +               reg = <0 0x1400a000 0 0x1000>;
> > +               #pwm-cells = <2>;
> > +               clocks = <&mmsys CLK_MM_MDP_BLS_26M>,
> > +                        <&mmsys CLK_MM_DISP_BLS>;
> > +               clock-names = "main", "mm";
> > +               status = "disabled";
> > +       };
> > +
> > +       color@1400b000 {
> > +               compatible = "mediatek,mt7623-disp-color",
> > +                            "mediatek,mt2701-disp-color";
> > +               reg = <0 0x1400b000 0 0x1000>;
> > +               interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_LOW>;
> > +               clocks = <&mmsys CLK_MM_DISP_COLOR>;
> > +       };
> > +
> > +       dsi: dsi@1400c000 {
> > +               compatible = "mediatek,mt7623-dsi",
>
> This is not defined in mediatek,dsi.txt [1].
>
> > +                            "mediatek,mt2701-dsi";
also fallback used (drivers/gpu/drm/mediatek/mtk_drm_drv.c)


> > +       dpi0: dpi@14014000 {
> > +               compatible = "mediatek,mt7623-dpi",
>
> This is not defined in mediatek,dpi.txt [5].
>
> [5] https://www.kernel.org/doc/Documentation/devicetree/bindings/display/mediatek/mediatek%2Cdpi.txt
>
> > +                            "mediatek,mt2701-dpi";

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
