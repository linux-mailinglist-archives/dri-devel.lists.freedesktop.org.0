Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8176B49CF1C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 17:04:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7380510E5BE;
	Wed, 26 Jan 2022 16:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C2810E5A5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 16:04:38 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id 23so192977ybf.7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 08:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I1PFWUBDwhEY3Hv2QBW+PKkoeBVqFCkIFV0TuJ7bvS8=;
 b=P0OwVjXGqxYvsrwB7spRllLzGtiOBqjE0WSO7AYtGnmDOvkbK58mgms4Kc+Cfe9CAb
 VCEcyBeitlDZUrJI9x+1xHYvONl3nxmo38WuR/WbDnARdBvrcbnw4EMDihlOd9gvprrI
 UioSkgQz5gCMF0iNPrsnwuxtjq5AKy17Nc3MH5MKgjwIstBOgWTGpEraXDgZxNkhip2W
 5yRw89f4Rvmk+/tyRxy7haKoJMZgPw4Z+5oNXnC7qyLkJuaYvQt0oPNMCv+UWlNyiSQN
 BQuicCfmyi08sy50mYqftEt2JmvWlzo+QzjW+SS57BdbgZmAUSrqESwfbqhBYi/qfru4
 PXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I1PFWUBDwhEY3Hv2QBW+PKkoeBVqFCkIFV0TuJ7bvS8=;
 b=dWnHIBcW2EoMRrupYPGc9+EAkZnlccWP39F6IMWkpmx57BvO/URa61FGdF0RmFU2Ru
 qFSp9lwta5LvBzlERS7g22EhEnbHwQkGxWiwsRZfDacsWD1KBq075JyiPppydhHyIAb5
 NzmwzEgObso5cymx7d40+ffVTvPaoXJz6pjTpcgk0CXUP0KbMwjQCD1MseR8ubcH/vhI
 3/fb4OiwASiUhWQwRu8OTxRrY6ZBvsHcDi+CV2houAapLdTrJa7lJ/XDC0nufIt79LzR
 bMe8qBBC+spmt71cvf3uPXQ0mE+RksHMgj9VS17Mxv0eP0In1yZmMx3qaJe1ExCe8rx+
 V5cw==
X-Gm-Message-State: AOAM531i3GTdYNE8syVBupuZ31I4PNrGGAuzlQ+PNO0/FTORJJlKgCO7
 LHo9b/Utu2EpWklHg/yFE/n0fUBkYPKa6F7DOkk=
X-Google-Smtp-Source: ABdhPJw0/pa8cCSqurWfk1GgO29W+8GRV6N3mR0rOJRhQPTh932RajwBQ5CXANcMfITbWzinmuCmScUdNZmKYWuDiyc=
X-Received: by 2002:a25:8888:: with SMTP id d8mr33876297ybl.405.1643213077990; 
 Wed, 26 Jan 2022 08:04:37 -0800 (PST)
MIME-Version: 1.0
References: <20220126145549.617165-1-s.hauer@pengutronix.de>
 <20220126145549.617165-22-s.hauer@pengutronix.de>
In-Reply-To: <20220126145549.617165-22-s.hauer@pengutronix.de>
From: Peter Geis <pgwipeout@gmail.com>
Date: Wed, 26 Jan 2022 11:04:26 -0500
Message-ID: <CAMdYzYrLw9+VW08cuj4_o4GDFhgBB8dZ-oVJ0TUnKFGLNetdyQ@mail.gmail.com>
Subject: Re: [PATCH 21/27] arm64: dts: rockchip: rk356x: Add HDMI nodes
To: Sascha Hauer <s.hauer@pengutronix.de>
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
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>,
 arm-mail-list <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 26, 2022 at 9:58 AM Sascha Hauer <s.hauer@pengutronix.de> wrote:
>
> Add support for the HDMI port found on RK3568.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  arch/arm64/boot/dts/rockchip/rk356x.dtsi | 37 +++++++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> index 4008bd666d01..e38fb223e9b8 100644
> --- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> @@ -10,7 +10,6 @@
>  #include <dt-bindings/pinctrl/rockchip.h>
>  #include <dt-bindings/power/rk3568-power.h>
>  #include <dt-bindings/soc/rockchip,boot-mode.h>
> -#include <dt-bindings/soc/rockchip,vop2.h>
>  #include <dt-bindings/thermal/thermal.h>
>
>  / {
> @@ -502,6 +501,42 @@ vop_mmu: iommu@fe043e00 {
>                 status = "disabled";
>         };
>
> +       hdmi: hdmi@fe0a0000 {
> +               compatible = "rockchip,rk3568-dw-hdmi";
> +               reg = <0x0 0xfe0a0000 0x0 0x20000>;
> +               interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
> +               clocks = <&cru PCLK_HDMI_HOST>,
> +                        <&cru CLK_HDMI_SFR>,
> +                        <&cru CLK_HDMI_CEC>,
> +                        <&pmucru CLK_HDMI_REF>,
> +                        <&cru HCLK_VOP>;
> +               clock-names = "iahb", "isfr", "cec", "ref", "hclk";
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&hdmitx_scl &hdmitx_sda &hdmitxm0_cec>;

I looked into CEC support here, and it seems that it does work with one change.
Please add the two following lines to your patch:
assigned-clocks = <&cru CLK_HDMI_CEC>;
assigned-clock-rates = <32768>;

The issue is the clk_rtc32k_frac clock that feeds clk_rtc_32k which
feeds clk_hdmi_cec is 24mhz at boot, which is too high for CEC to
function.

> +               power-domains = <&power RK3568_PD_VO>;
> +               reg-io-width = <4>;
> +               rockchip,grf = <&grf>;
> +               #sound-dai-cells = <0>;
> +               status = "disabled";
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       hdmi_in: port@0 {
> +                               reg = <0>;
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                       };
> +
> +                       hdmi_out: port@1 {
> +                               reg = <1>;
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                       };
> +               };
> +       };
> +
>         qos_gpu: qos@fe128000 {
>                 compatible = "rockchip,rk3568-qos", "syscon";
>                 reg = <0x0 0xfe128000 0x0 0x20>;
> --
> 2.30.2
>
