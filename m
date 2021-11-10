Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF2144BAE3
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 05:41:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE4C6FD9C;
	Wed, 10 Nov 2021 04:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F7B6FD98
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 04:41:19 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id b15so5331941edd.7
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Nov 2021 20:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QUleFTjGQU+YlNUVWv8lxGspqW7QZPOBd6+zJ5I3cvg=;
 b=LkMTLgSmprMDFORpuTPsP4PugBARM13+qfuDqVf+Ao2Qv0ZczrsEbbepyJJEOk4Sof
 UWmFDMQrg9hb4nod/vN7hHJKwfbnDVAWy/pT9+TEZJeBzvEwWb/3OO+n5dRDNVX71DF1
 KfvcXyACUkZdsmN6MpqU3mj+/GIwzDiTeddQxBiakZLXg3TbXLUjti+FFUEELw2ctGg3
 G6x16oX43s6V2Tc1/1srjJSyZPs22whEpfGJsBPlQnW4C0EKqirOV+Xsqs4/Avad1B/4
 acGDiffEFxIxrUHWHr41Ase6hfLjh9HWWvSYjOI4J1W1Yh5kIBXU3zQ1Ds1ghxUUTDwC
 wH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QUleFTjGQU+YlNUVWv8lxGspqW7QZPOBd6+zJ5I3cvg=;
 b=xLWf5zje8P64c4+CdDPK01dfj+EtfdtFOo7/Y97SvyfeBTDUxozE8y6FhXdEhKlPy6
 Qv9wWafDNeeoMUU1+xp7l+BVsxl6ib+JDVtrfwluY4dfNA3XDbYgHdTArWMg2TA1oY4O
 z8tJspwT81oeDAntG8ayETZJmu7apILNLsTIgitxZPfeBmRujI0tNs/Ei/Kh5CH9wE0N
 kolIL5Olsglr5CEZRmWar0mT2IV/18DwqT0b/Q23GFyw+hNWqP+spndDrmWgvL45Z0Fp
 vADsRkMi5di4FvF6J2LsQG/A97zi/ftJoK10fT2jNd/MfyOC80OuFSGhlFJZ/SgXaik5
 xc0g==
X-Gm-Message-State: AOAM531WKAHs5cDrskCV48W+AiWtlxEzxo326fwkgcOACMae3k5Jupsa
 B9u8bj8uOmvotwT3WJuWyySZQDtV1y+uELZCZuw=
X-Google-Smtp-Source: ABdhPJxXwKpES2VPG2CXe91rugVtx+wXqPEf7U8Y0xoh8ytlAtRvSyT/XAoTjCGEfUP2zKkQgqS1Be9ov4+01uZlNTY=
X-Received: by 2002:a17:906:79c3:: with SMTP id
 m3mr16619128ejo.332.1636519277775; 
 Tue, 09 Nov 2021 20:41:17 -0800 (PST)
MIME-Version: 1.0
References: <20211109173357.780-1-tharvey@gateworks.com>
 <CAHCN7xKBMRRUO87Y9cn-885ESWvKbz_-EzGS9q3oXKy8KmpMpA@mail.gmail.com>
In-Reply-To: <CAHCN7xKBMRRUO87Y9cn-885ESWvKbz_-EzGS9q3oXKy8KmpMpA@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 9 Nov 2021 22:41:06 -0600
Message-ID: <CAHCN7xK9_+KwxBy9+O0cy-fnf9L1uM5rtxM-nHOO6YnV_3U6Mg@mail.gmail.com>
Subject: Re: [RFC] arm64: dts: imx8mm: Add MIPI and LCDIF nodes
To: Tim Harvey <tharvey@gateworks.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Marek Vasut <marex@denx.de>, dri-devel <dri-devel@lists.freedesktop.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 9, 2021 at 6:24 PM Adam Ford <aford173@gmail.com> wrote:
>
> On Tue, Nov 9, 2021 at 11:34 AM Tim Harvey <tharvey@gateworks.com> wrote:
> >
> > Add nodes for MIPI DSI and LCDIF on IMX8MM
> >
> > I'm currently working with a set of patches to convert drm/exynos
> > to a bridge [1] and add IMX8MM support [2] in order to get IMX8MM DSI
> > working for display with a Raspberry Pi DSI touchscreen compatible with
> > a Toshiba TC358762 DSI bridge and Powertip PH800480T013-IDF02
> > touchscreen.
> >
> > I had this working on a 5.10 kernel with the old blk-ctl and
> > power-domain drivers that didn't make it into mainline but my 5.15
> > series with blk-ctl backported from next hangs right after
> > "[drm] Initialized mxsfb-drm 1.0.0 20160824 for 32e00000.lcdif on minor 0"
> > so I assume I have a power-domain not getting enabled.
> >
> > Please let me know if you see an issue with the way I've configured
> > power-domain or clocks here.


I don't get hanging, but the samsung-dsi-imx driver doesn't load
automatically for some reason, so I manually modprobe it.  In my
configuration, I have lcdif->dsi->hdmi-bridge
When I modprobe the samsung-dsim-imx driver, I get the following:

[   50.217288] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000010
[   50.217292] Mem abort info:
[   50.217294]   ESR = 0x96000004
[   50.217297]   EC = 0x25: DABT (current EL), IL = 32 bits
[   50.217301]   SET = 0, FnV = 0
[   50.217303]   EA = 0, S1PTW = 0
[   50.217306]   FSC = 0x04: level 0 translation fault
[   50.217309] Data abort info:
[   50.217311]   ISV = 0, ISS = 0x00000004
[   50.217313]   CM = 0, WnR = 0
[   50.217316] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000044dfb000
[   50.217320] [0000000000000010] pgd=0000000000000000, p4d=0000000000000000
[   50.217331] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[   50.217336] Modules linked in: samsung_dsim_imx samsung_dsim 8021q
garp mrp stp llc caam_jr caamhash_desc caamalg_desc snd_soc_hdmi_codec
crypto_engine rng_core authenc libdes brcmfmac brcmutil cfg80211
crct10dif_ce etnaviv snd_soc_fsl_asoc_card mxsfb snd_soc_imx_audmux
gpu_sched fsl_imx8_ddr_perf imx8m_ddrc spi_imx spi_bitbang adv7511 cec
drm_kms_helper at24 caam clk_bd718x7 snd_soc_wm8962 rtc_pcf85363 error
rtc_snvs snvs_pwrkey imx8mm_thermal snd_soc_fsl_sai imx_pcm_dma
snd_soc_simple_card snd_soc_simple_card_utils imx_cpufreq_dt bluetooth
display_connector ecdh_generic ecc rfkill fuse drm ipv6
[   50.217453] CPU: 0 PID: 252 Comm: kworker/u8:4 Not tainted
5.15.0-ga6004e62a74a-dirty #3
[   50.217459] Hardware name: Beacon EmbeddedWorks i.MX8M Mini
Development Kit (DT)
[   50.217464] Workqueue: events_unbound deferred_probe_work_func
[   50.217482] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   50.217488] pc : mxsfb_crtc_atomic_enable+0x60/0x5e0 [mxsfb]
[   50.217500] lr : mxsfb_crtc_atomic_enable+0x60/0x5e0 [mxsfb]
[   50.217508] sp : ffff800012b6b500
[   50.217510] x29: ffff800012b6b500 x28: ffff00000a52fe30 x27: 0000000000000000
[   50.217519] x26: ffff000004fb0800 x25: 0000000000000038 x24: ffff8000091ab770
[   50.217528] x23: 0000000000000038 x22: ffff800009150c80 x21: ffff000009f4b5e8
[   50.217536] x20: ffff00000a538d80 x19: ffff000009f4b080 x18: fffffffffffeae28
[   50.217544] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000048
[   50.217552] x14: 0000000000000001 x13: 78696d7073696420 x12: fffffffffffcae27
[   50.217560] x11: ffff800011d32ed0 x10: 000000000000000a x9 : ffff800008fc3000
[   50.217569] x8 : ffff000003c71b80 x7 : 0000000000000000 x6 : 000000001abc391d
[   50.217577] x5 : 0000000000000130 x4 : 0000000000000000 x3 : 0000000000000000
[   50.217585] x2 : 0000000000000000 x1 : ffff00000874b880 x0 : 0000000000000000
[   50.217593] Call trace:
[   50.217596]  mxsfb_crtc_atomic_enable+0x60/0x5e0 [mxsfb]
[   50.217604]  drm_atomic_helper_commit_modeset_enables+0x208/0x250
[drm_kms_helper]
[   50.217725]  drm_atomic_helper_commit_tail_rpm+0x50/0xa0 [drm_kms_helper]
[   50.217797]  commit_tail+0xa4/0x184 [drm_kms_helper]
[   50.217869]  drm_atomic_helper_commit+0x160/0x370 [drm_kms_helper]
[   50.217940]  drm_atomic_commit+0x50/0x60 [drm]
[   50.218151]  drm_client_modeset_commit_atomic+0x1c8/0x260 [drm]
[   50.218284]  drm_client_modeset_commit_locked+0x60/0x19c [drm]
[   50.218413]  drm_client_modeset_commit+0x34/0x60 [drm]
[   50.218543]  drm_fb_helper_set_par+0xcc/0x124 [drm_kms_helper]
[   50.218649]  fbcon_init+0x394/0x4e0
[   50.218659]  visual_init+0xb4/0x104
[   50.218668]  do_bind_con_driver.isra.0+0x1c4/0x394
[   50.218676]  do_take_over_console+0x144/0x1fc
[   50.218683]  do_fbcon_takeover+0x6c/0xe0
[   50.218688]  fbcon_fb_registered+0x104/0x11c
[   50.218693]  register_framebuffer+0x1f4/0x350
[   50.218701]  __drm_fb_helper_initial_config_and_unlock+0x338/0x534
[drm_kms_helper]
[   50.218775]  drm_fbdev_client_hotplug+0x148/0x230 [drm_kms_helper]
[   50.218846]  drm_fbdev_generic_setup+0xb4/0x190 [drm_kms_helper]
[   50.218919]  mxsfb_probe+0x324/0x42c [mxsfb]
[   50.218929]  platform_probe+0x6c/0xe0
[   50.218938]  really_probe.part.0+0x9c/0x310
[   50.218946]  __driver_probe_device+0x98/0x144
[   50.218953]  driver_probe_device+0xc8/0x15c
[   50.218959]  __device_attach_driver+0xb8/0x120
[   50.218964]  bus_for_each_drv+0x78/0xd0
[   50.218971]  __device_attach+0xd8/0x180
[   50.218977]  device_initial_probe+0x18/0x24
[   50.218982]  bus_probe_device+0xa0/0xac
[   50.218988]  deferred_probe_work_func+0x88/0xc0
[   50.218995]  process_one_work+0x1d0/0x354
[   50.219001]  worker_thread+0x13c/0x470
[   50.219006]  kthread+0x154/0x160
[   50.219012]  ret_from_fork+0x10/0x20
[   50.219024] Code: f944ee61 b40000a1 aa1403e0 97f73bf5 (b9401017)
[   50.219030] ---[ end trace 8e3f6b78d85cbf0f ]---


Looking at the power domain, it appears that the LCDIf is enabled and
the power domain for it is active, but the dispblk-mipi-dsi power
domain is not:

root@beacon-imx8mm-kit:~# cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
domain                          status          children
            performance
    /device                                             runtime status
----------------------------------------------------------------------------------------------
vpublk-h1                       off-0
            0
vpublk-g2                       off-0
            0
vpublk-g1                       off-0
            0
vpumix                          off-0
            0
    /devices/genpd:0:38330000.blk-ctrl                  suspended
            0
gpu                             off-0
            0
    /devices/platform/soc@0/38000000.gpu                suspended
            0
    /devices/platform/soc@0/38008000.gpu                suspended
            0
dispblk-mipi-csi                off-0
            0
dispblk-mipi-dsi                off-0
            0
    /devices/platform/soc@0/32c00000.bus/32e10000.mipi_dsi  suspended
                0
dispblk-lcdif                   on
            0
    /devices/platform/soc@0/32c00000.bus/32e00000.lcdif  active
             0
dispblk-csi-bridge              off-0
            0
mipi                            off-0
            0
    /devices/genpd:3:32e28000.blk-ctrl                  suspended
            0
    /devices/genpd:4:32e28000.blk-ctrl                  suspended
            0
dispmix                         on
            0
    /devices/genpd:0:32e28000.blk-ctrl                  active
            0
    /devices/genpd:1:32e28000.blk-ctrl                  suspended
            0
    /devices/genpd:2:32e28000.blk-ctrl                  active
            0
vpu-h1                          off-0
            0
    /devices/genpd:3:38330000.blk-ctrl                  suspended
            0
vpu-g2                          off-0
            0
    /devices/genpd:2:38330000.blk-ctrl                  suspended
            0
vpu-g1                          off-0
            0
    /devices/genpd:1:38330000.blk-ctrl                  suspended
            0
gpumix                          off-0
            0
    /devices/platform/soc@0/30000000.bus/303a0000.gpc/imx-pgc-domain.5
 suspended                  0
usb-otg2                        off-0
            0
usb-otg1                        off-0
            0
pcie                            off-0
            0
hsiomix                         off-0
            0
    /devices/platform/soc@0/30000000.bus/303a0000.gpc/imx-pgc-domain.1
 suspended                  0
    /devices/platform/soc@0/30000000.bus/303a0000.gpc/imx-pgc-domain.2
 suspended                  0
    /devices/platform/soc@0/30000000.bus/303a0000.gpc/imx-pgc-domain.3
 suspended                  0

I'll be traveling for the rest of the week, but I'll try to help when
I come back.

adam

> >
> > Best Regards,
> >
> > Tim
> > [1] https://patchwork.kernel.org/project/dri-devel/list/?series=347439&archive=both&state=*
> > [2] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=359775&archive=both&state=*
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mm.dtsi | 68 +++++++++++++++++++++++
> >  1 file changed, 68 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > index 208a0ed840f4..195dcbff7058 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > @@ -188,6 +188,12 @@
> >                 clock-output-names = "clk_ext4";
> >         };
> >
> > +       mipi_phy: mipi-video-phy {
> > +               compatible = "fsl,imx8mm-mipi-video-phy";
> > +               syscon = <&disp_blk_ctrl>;
> > +               #phy-cells = <1>;
> > +       };
> > +
> >         psci {
> >                 compatible = "arm,psci-1.0";
> >                 method = "smc";
> > @@ -1068,6 +1074,68 @@
> >                         #size-cells = <1>;
> >                         ranges = <0x32c00000 0x32c00000 0x400000>;
> >
> > +                       lcdif: lcdif@32e00000 {
> > +                               #address-cells = <1>;
> > +                               #size-cells = <0>;
>
> If there is only 1 port I don't think you need address-cells and
> size-cells.  See more below....
>
> > +                               compatible = "fsl,imx8mm-lcdif", "fsl,imx6sx-lcdif";
> > +                               reg = <0x32e00000 0x10000>;
> > +                               clocks = <&clk IMX8MM_CLK_LCDIF_PIXEL>,
> > +                                        <&clk IMX8MM_CLK_DISP_AXI_ROOT>,
> > +                                        <&clk IMX8MM_CLK_DISP_APB_ROOT>;
> > +                               clock-names = "pix", "disp_axi", "axi";
> > +                               assigned-clocks = <&clk IMX8MM_CLK_LCDIF_PIXEL>,
> > +                                                 <&clk IMX8MM_CLK_DISP_AXI>,
> > +                                                 <&clk IMX8MM_CLK_DISP_APB>;
> > +                               assigned-clock-parents = <&clk IMX8MM_VIDEO_PLL1_OUT>,
> > +                                                        <&clk IMX8MM_SYS_PLL2_1000M>,
> > +                                                        <&clk IMX8MM_SYS_PLL1_800M>;
> > +                               assigned-clock-rate = <594000000>, <500000000>, <200000000>;
> > +                               interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> > +                               power-domains = <&disp_blk_ctrl IMX8MM_DISPBLK_PD_LCDIF>;
> > +                               status = "disabled";
> > +
> > +                               port@0 {
> > +                                       reg = <0>;
>
> This should be just "port {" and we can get rid of the @0 and the "reg=0"
>
> This eliminates some build warnings.
> > +
> > +                                       lcdif_to_dsim: endpoint {
> > +                                               remote-endpoint = <&dsim_from_lcdif>;
> > +                                       };
> > +                               };
> > +                       };
> > +
> > +                       mipi_dsi: mipi_dsi@32e10000 {
> > +                               #address-cells = <1>;
> > +                               #size-cells = <0>;
>
> I think this should move into a sub node...see below
>
> > +                               compatible = "fsl,imx8mm-mipi-dsim";
> > +                               reg = <0x32e10000 0x400>;
> > +                               clocks = <&clk IMX8MM_CLK_DSI_CORE>,
> > +                                        <&clk IMX8MM_CLK_DSI_PHY_REF>;
> > +                               clock-names = "bus_clk", "sclk_mipi";
> > +                               assigned-clocks = <&clk IMX8MM_CLK_DSI_CORE>,
> > +                                                 <&clk IMX8MM_VIDEO_PLL1_OUT>,
> > +                                                 <&clk IMX8MM_CLK_DSI_PHY_REF>;
> > +                               assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_266M>,
> > +                                                        <&clk IMX8MM_VIDEO_PLL1_BYPASS>,
> > +                                                        <&clk IMX8MM_VIDEO_PLL1_OUT>;
> > +                               assigned-clock-rates = <266000000>, <594000000>, <27000000>;
> > +                               interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> > +                               phys = <&mipi_phy 0>;
> > +                               phy-names = "dsim";
>
> I think the mipi_phy is the equivalent to the mipi_rst_mask in the
> power domain I added to the CSI.  Looking through the NXP 5.10 kernel,
>  BIT(17) is the reset for the MIPI_DSI.  I haven't tried it yet, but
> it makes me assume that BIT(16) is for the MIPI_CSI.
>
> Both bits are set in the imx-atf code, and the documentation isn't
> clear, but I tweaked the blk-ctrl driver to only set BIT(16) for the
> mipi_rst_mask on the CSI.  I still get some hanging, so it's not any
> better that way.
>
> > +                               power-domains = <&disp_blk_ctrl IMX8MM_DISPBLK_PD_MIPI_DSI>;
> > +                               samsung,burst-clock-frequency = <891000000>;
> > +                               samsung,esc-clock-frequency = <54000000>;
> > +                               samsung,pll-clock-frequency = <27000000>;
> > +                               status = "disabled";
> > +
>
> Add a subnode called "ports" and move address-cells and size-cells
> into it along wtih "port@0"
>
> > +                               port@0 {
> > +                                       reg = <0>;
> > +
> > +                                       dsim_from_lcdif: endpoint {
> > +                                               remote-endpoint = <&lcdif_to_dsim>;
> > +                                       };
> > +                               };
> > +                       };
> > +
> >                         csi: csi@32e20000 {
> >                                 compatible = "fsl,imx8mm-csi", "fsl,imx7-csi";
> >                                 reg = <0x32e20000 0x1000>;
> > --
> > 2.17.1
> >
