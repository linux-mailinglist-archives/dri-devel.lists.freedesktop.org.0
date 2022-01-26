Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBAF49D1F8
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 19:44:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846CA10E3DE;
	Wed, 26 Jan 2022 18:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8627710E2CD
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 18:44:23 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id r65so1409798ybc.11
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 10:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MEyovfba2dw8hkEOOp/dCCAQBZpKCIOPP7X2Ld61Z6k=;
 b=GFD5GDEf8XsnNM8IRgqyWTh3wGzwVNEjI4OZlCRQJ7ZDl2I5hNDUrcZC0+87NSTvfG
 ZEtUR/4GnSPgmrC8BuLwbnjvun5DuwTYBhn699iaGoM67aGuT71K+WmhS7tKaY2i/TON
 8rJ908EHaHxYG1Ktwl5I/YR8+COZwRflJR5laa3tCsNoBIUeLSWabjP3/h7OjA2HHv/P
 Vt9fK5J7pm+yCYNHyQS0mXKyvP4zkQ5j71ANNfLjKSTFn3IcI9ef33+ElVnuanzTA+iV
 iPXjh4cvS5t9l7EABB9JbzED/O/qhTIcHHOiAS29JL+kaexKaN6Yv4gQaZmD9LnOtCJa
 MVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MEyovfba2dw8hkEOOp/dCCAQBZpKCIOPP7X2Ld61Z6k=;
 b=4c1ac0k8d3zezNzfIBXfMJf02vgeyUIZ8Ig+EV91IEufnusoQu5awwdcruDo2EVBam
 Coq2RShwRVQU7AjxE3bdxa7GdYKXtnZFr9OTjvI0wH1wVHmnFkrlhcs1dLIMQwNmLorZ
 uuRsftne5NoZ9bt6YnEe1RgGZB1E762bAHq1H+ggYFYpDVSbi64CvsiNJGHPf+1NI0Sg
 lkQwyLIqbZR55feRZAuGd0wF0zPJDX15SIg0K3GnvccGvppCaZiEPuWkRifnVoEpyj/D
 gqlo2F4L8oK1kx6Gwx+rBJQfzU7v0w6PgHSF9mHBRylarNmIYuox13W0XbLYAyiAKQuO
 am7A==
X-Gm-Message-State: AOAM533JVkiwXsmelzTm9j9F3DnL26RwL1mjzO0ueTzZNjLAKjImztzZ
 bj4lM2ru+GTcv6QMCaDnkQga2OrlpexIAJk1Tgo=
X-Google-Smtp-Source: ABdhPJxgscoeLIS7qct8a8DWzs0s6Es0+lcQu9iy9qDfJ6AWxgxtRTjH86KBHwecm7mbF7FPn31RB7ujyUgKXeLnP/U=
X-Received: by 2002:a05:6902:704:: with SMTP id
 k4mr306757ybt.355.1643222662540; 
 Wed, 26 Jan 2022 10:44:22 -0800 (PST)
MIME-Version: 1.0
References: <20220126145549.617165-1-s.hauer@pengutronix.de>
 <20220126145549.617165-22-s.hauer@pengutronix.de>
 <CAMdYzYrLw9+VW08cuj4_o4GDFhgBB8dZ-oVJ0TUnKFGLNetdyQ@mail.gmail.com>
 <a1438d39-b670-1ca5-d3f7-4e3f54702e53@arm.com>
In-Reply-To: <a1438d39-b670-1ca5-d3f7-4e3f54702e53@arm.com>
From: Peter Geis <pgwipeout@gmail.com>
Date: Wed, 26 Jan 2022 13:44:11 -0500
Message-ID: <CAMdYzYrcsj5Vas+ysoK6iD3uEAdmhcmLVi-5LY7hfHEtjeB6Cg@mail.gmail.com>
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

On Wed, Jan 26, 2022 at 12:56 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2022-01-26 16:04, Peter Geis wrote:
> > On Wed, Jan 26, 2022 at 9:58 AM Sascha Hauer <s.hauer@pengutronix.de> wrote:
> >>
> >> Add support for the HDMI port found on RK3568.
> >>
> >> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> >> ---
> >>   arch/arm64/boot/dts/rockchip/rk356x.dtsi | 37 +++++++++++++++++++++++-
> >>   1 file changed, 36 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> >> index 4008bd666d01..e38fb223e9b8 100644
> >> --- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> >> +++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> >> @@ -10,7 +10,6 @@
> >>   #include <dt-bindings/pinctrl/rockchip.h>
> >>   #include <dt-bindings/power/rk3568-power.h>
> >>   #include <dt-bindings/soc/rockchip,boot-mode.h>
> >> -#include <dt-bindings/soc/rockchip,vop2.h>
> >>   #include <dt-bindings/thermal/thermal.h>
> >>
> >>   / {
> >> @@ -502,6 +501,42 @@ vop_mmu: iommu@fe043e00 {
> >>                  status = "disabled";
> >>          };
> >>
> >> +       hdmi: hdmi@fe0a0000 {
> >> +               compatible = "rockchip,rk3568-dw-hdmi";
> >> +               reg = <0x0 0xfe0a0000 0x0 0x20000>;
> >> +               interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
> >> +               clocks = <&cru PCLK_HDMI_HOST>,
> >> +                        <&cru CLK_HDMI_SFR>,
> >> +                        <&cru CLK_HDMI_CEC>,
> >> +                        <&pmucru CLK_HDMI_REF>,
> >> +                        <&cru HCLK_VOP>;
> >> +               clock-names = "iahb", "isfr", "cec", "ref", "hclk";
> >> +               pinctrl-names = "default";
> >> +               pinctrl-0 = <&hdmitx_scl &hdmitx_sda &hdmitxm0_cec>;
> >
> > I looked into CEC support here, and it seems that it does work with one change.
> > Please add the two following lines to your patch:
> > assigned-clocks = <&cru CLK_HDMI_CEC>;
> > assigned-clock-rates = <32768>;
> >
> > The issue is the clk_rtc32k_frac clock that feeds clk_rtc_32k which
> > feeds clk_hdmi_cec is 24mhz at boot, which is too high for CEC to
> > function.
>
> Wouldn't it make far more sense to just stick a suitable clk_set_rate()
> call in the driver? AFAICS it's already explicitly aware of the CEC clock.

This is handled purely in the
drivers/gpu/drm/bridge/synopsys/dw-hdmi.c driver, so I'm hesitant to
touch it there as it would affect all users, not just Rockchip.

Could someone familiar with the dw-hdmi IP weigh in on the minimum and
maximum clock rate the CEC block can handle?

>
> Robin.
>
> >> +               power-domains = <&power RK3568_PD_VO>;
> >> +               reg-io-width = <4>;
> >> +               rockchip,grf = <&grf>;
> >> +               #sound-dai-cells = <0>;
> >> +               status = "disabled";
> >> +
> >> +               ports {
> >> +                       #address-cells = <1>;
> >> +                       #size-cells = <0>;
> >> +
> >> +                       hdmi_in: port@0 {
> >> +                               reg = <0>;
> >> +                               #address-cells = <1>;
> >> +                               #size-cells = <0>;
> >> +                       };
> >> +
> >> +                       hdmi_out: port@1 {
> >> +                               reg = <1>;
> >> +                               #address-cells = <1>;
> >> +                               #size-cells = <0>;
> >> +                       };
> >> +               };
> >> +       };
> >> +
> >>          qos_gpu: qos@fe128000 {
> >>                  compatible = "rockchip,rk3568-qos", "syscon";
> >>                  reg = <0x0 0xfe128000 0x0 0x20>;
> >> --
> >> 2.30.2
> >>
> >
> > _______________________________________________
> > Linux-rockchip mailing list
> > Linux-rockchip@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-rockchip
