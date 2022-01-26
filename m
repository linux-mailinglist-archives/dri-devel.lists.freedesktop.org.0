Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B73649D2F7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 21:00:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE1710E329;
	Wed, 26 Jan 2022 20:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6655D10E329
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 20:00:13 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id r65so1955962ybc.11
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 12:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wJitFFvuG9U27VE5xDsshWEG+RLx//q3+Kf8s/0efLA=;
 b=IB6FHARyL2Wi3BsHj1bGchMCEtBXLv5/1LaJAOk8bXFQVE4LQmOzSuqNxRnEi1miMM
 CNRMvzPCtSrdYJOyOpClPfremh1MBmRGSXyVeEjvYxlwelVdtb87vWO+EsoPeQ7MSz5L
 GoNa9M0MYnkPLZ/xNoekXr1DWEmUTQiaN6pXDd1TdEhHfn9ptmJf4czrp74NI3MEaAHv
 bnses4O01vK33ETZXxwqvrzSBMw+mY+O7CgkgV3QjkTIxolcegL3eyc3tSnVQ8MJoNA4
 nwNvmuMdr3NSrKA94y2UNo1G6KzZTgi2zBK5Ywh5XjXqJnAGIT+Bpg6lr3DoPjIAyduX
 DE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wJitFFvuG9U27VE5xDsshWEG+RLx//q3+Kf8s/0efLA=;
 b=gAcCQS6If5BbaRIOZbDYn/CzbqG14TGNS9GBeynq2QnAwtJxQ7isSEmMwLvhuz6Fcn
 gqt4X4oiwMysOW9rjh1J37HhACEiYVlYMK6jmtvWI371jYzfb2wpZq08lbTPYLfsuFM3
 8dXQw/FPilpeYRcd89op1de6Bsj+HFNPnAbTcHNPymK6YOKqn17GqNtNkBDgDEzaqCx6
 hlEfOoDA4JgEe22OQawpdG6jpJlKKSlz7ZAJCiV+lvyJpfBiyoPaKIQVlHzCYAo7tTuI
 uoPIwoZmbG1xtN0YE7y49cJNcNuxqRCJMbA/5BzW854MlR4ynP6WVhS3d9Td3lZ5mfxU
 BF0A==
X-Gm-Message-State: AOAM533VEUCoEL9Im7dkQ1POolJ7Rgwlp8pYkJpOsctCoqrMr2CHTvgi
 X58MpdCZyfbr4jUzs6yTqFtQ1u1pC+Gi0n17Yz0=
X-Google-Smtp-Source: ABdhPJxth+wPVilLzlTzlFktv0sqR193AtoZzoZz1MfcBDy+YaXG320Ay/wnjmM+mLCBKK07QwNqr+YuazBkReA/GNQ=
X-Received: by 2002:a25:1583:: with SMTP id 125mr766085ybv.216.1643227212355; 
 Wed, 26 Jan 2022 12:00:12 -0800 (PST)
MIME-Version: 1.0
References: <20220126145549.617165-1-s.hauer@pengutronix.de>
 <20220126145549.617165-22-s.hauer@pengutronix.de>
 <CAMdYzYrLw9+VW08cuj4_o4GDFhgBB8dZ-oVJ0TUnKFGLNetdyQ@mail.gmail.com>
 <a1438d39-b670-1ca5-d3f7-4e3f54702e53@arm.com>
 <CAMdYzYrcsj5Vas+ysoK6iD3uEAdmhcmLVi-5LY7hfHEtjeB6Cg@mail.gmail.com>
 <45132d1f-626d-5fe3-3118-21c0b3f4c8f1@arm.com>
In-Reply-To: <45132d1f-626d-5fe3-3118-21c0b3f4c8f1@arm.com>
From: Peter Geis <pgwipeout@gmail.com>
Date: Wed, 26 Jan 2022 15:00:01 -0500
Message-ID: <CAMdYzYpyrACnNtRYUNSSkEA_AUdWJ22BvWKU3YVHumLmcB1fpA@mail.gmail.com>
Subject: Re: [PATCH 21/27] arm64: dts: rockchip: rk356x: Add HDMI nodes
To: Robin Murphy <robin.murphy@arm.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>,
 arm-mail-list <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 26, 2022 at 2:25 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2022-01-26 18:44, Peter Geis wrote:
> > On Wed, Jan 26, 2022 at 12:56 PM Robin Murphy <robin.murphy@arm.com> wrote:
> >>
> >> On 2022-01-26 16:04, Peter Geis wrote:
> >>> On Wed, Jan 26, 2022 at 9:58 AM Sascha Hauer <s.hauer@pengutronix.de> wrote:
> >>>>
> >>>> Add support for the HDMI port found on RK3568.
> >>>>
> >>>> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> >>>> ---
> >>>>    arch/arm64/boot/dts/rockchip/rk356x.dtsi | 37 +++++++++++++++++++++++-
> >>>>    1 file changed, 36 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> >>>> index 4008bd666d01..e38fb223e9b8 100644
> >>>> --- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> >>>> +++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> >>>> @@ -10,7 +10,6 @@
> >>>>    #include <dt-bindings/pinctrl/rockchip.h>
> >>>>    #include <dt-bindings/power/rk3568-power.h>
> >>>>    #include <dt-bindings/soc/rockchip,boot-mode.h>
> >>>> -#include <dt-bindings/soc/rockchip,vop2.h>
> >>>>    #include <dt-bindings/thermal/thermal.h>
> >>>>
> >>>>    / {
> >>>> @@ -502,6 +501,42 @@ vop_mmu: iommu@fe043e00 {
> >>>>                   status = "disabled";
> >>>>           };
> >>>>
> >>>> +       hdmi: hdmi@fe0a0000 {
> >>>> +               compatible = "rockchip,rk3568-dw-hdmi";
> >>>> +               reg = <0x0 0xfe0a0000 0x0 0x20000>;
> >>>> +               interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
> >>>> +               clocks = <&cru PCLK_HDMI_HOST>,
> >>>> +                        <&cru CLK_HDMI_SFR>,
> >>>> +                        <&cru CLK_HDMI_CEC>,
> >>>> +                        <&pmucru CLK_HDMI_REF>,
> >>>> +                        <&cru HCLK_VOP>;
> >>>> +               clock-names = "iahb", "isfr", "cec", "ref", "hclk";
> >>>> +               pinctrl-names = "default";
> >>>> +               pinctrl-0 = <&hdmitx_scl &hdmitx_sda &hdmitxm0_cec>;
> >>>
> >>> I looked into CEC support here, and it seems that it does work with one change.
> >>> Please add the two following lines to your patch:
> >>> assigned-clocks = <&cru CLK_HDMI_CEC>;
> >>> assigned-clock-rates = <32768>;
> >>>
> >>> The issue is the clk_rtc32k_frac clock that feeds clk_rtc_32k which
> >>> feeds clk_hdmi_cec is 24mhz at boot, which is too high for CEC to
> >>> function.
> >>
> >> Wouldn't it make far more sense to just stick a suitable clk_set_rate()
> >> call in the driver? AFAICS it's already explicitly aware of the CEC clock.
> >
> > This is handled purely in the
> > drivers/gpu/drm/bridge/synopsys/dw-hdmi.c driver, so I'm hesitant to
> > touch it there as it would affect all users, not just Rockchip.
>
> I'd have a strong hunch that it's a standard thing for the DesignWare IP
> and not affected by platform integration. I don't have the magical
> Synopsys databook, but between the trusty old i.MX6 manual and most of
> the other in-tree DTs getting their dw-hdmi "cec" clock from
> suspiciously-obviously-named sources, I'd be somewhat surprised if it
> was ever anything other than 32KHz.

My main concern was similar to the other HDMI clock issues, mainly
setting the clock can propagate up and affect other users of the
upstream clock.
I'll spin up a quick patch for this method.

Thanks,
Peter

>
> Robin.
>
> > Could someone familiar with the dw-hdmi IP weigh in on the minimum and
> > maximum clock rate the CEC block can handle?
> >
> >>
> >> Robin.
> >>
> >>>> +               power-domains = <&power RK3568_PD_VO>;
> >>>> +               reg-io-width = <4>;
> >>>> +               rockchip,grf = <&grf>;
> >>>> +               #sound-dai-cells = <0>;
> >>>> +               status = "disabled";
> >>>> +
> >>>> +               ports {
> >>>> +                       #address-cells = <1>;
> >>>> +                       #size-cells = <0>;
> >>>> +
> >>>> +                       hdmi_in: port@0 {
> >>>> +                               reg = <0>;
> >>>> +                               #address-cells = <1>;
> >>>> +                               #size-cells = <0>;
> >>>> +                       };
> >>>> +
> >>>> +                       hdmi_out: port@1 {
> >>>> +                               reg = <1>;
> >>>> +                               #address-cells = <1>;
> >>>> +                               #size-cells = <0>;
> >>>> +                       };
> >>>> +               };
> >>>> +       };
> >>>> +
> >>>>           qos_gpu: qos@fe128000 {
> >>>>                   compatible = "rockchip,rk3568-qos", "syscon";
> >>>>                   reg = <0x0 0xfe128000 0x0 0x20>;
> >>>> --
> >>>> 2.30.2
> >>>>
> >>>
> >>> _______________________________________________
> >>> Linux-rockchip mailing list
> >>> Linux-rockchip@lists.infradead.org
> >>> http://lists.infradead.org/mailman/listinfo/linux-rockchip
