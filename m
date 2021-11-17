Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C58CE4549CB
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 16:19:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 817996E93D;
	Wed, 17 Nov 2021 15:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4CB66E93B
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 15:19:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC49A61BF9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 15:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637162391;
 bh=21V8ySdNI8rzKppmwzqXaWV+WIeRV5sbbODnQ+RIf/4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cz59dCa+o2S/wHot45VrB76ew3z7XNQ55gUlziZUp5WzfwP1jlnBNpZtJk00p3JeI
 EuvTBY88yoYke5aVPCR3Lt4OksFhJBJRyOqUyHM/ZwwLjZTvzXuWe1YwV1wYkNxbjC
 gGJtsLGsf566Vm4OJapBw1F6WTHDl9IiKeTE/nbsvyDtwedn0ad6INVefXZRueXdj4
 nPYwjZku/V8mEm2GBPckhPJZ9zgE5jDoYq48kxQkqlsTzI8Azj2NNoXiUddCMd8peh
 5khdWUcfI4CP/7NLas+8NOSulMrLzld1dEQKqWzPYWJokbCOUPsNaGidg2IundZsS9
 avOG9wUy5xzmA==
Received: by mail-ed1-f41.google.com with SMTP id g14so12810073edz.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 07:19:51 -0800 (PST)
X-Gm-Message-State: AOAM530V8PaPvBy1KCX53kSHCe9PhVWOQUvnqKNXEBGDHncpqotzsE59
 7mXdDaGZKXun17L2hA5Wfs8XIzkCYBqMTFib1g==
X-Google-Smtp-Source: ABdhPJxa6UOUwCE4UADcjJKl6sQgO6HQ05fBhvojoiMf7CwaNTfZtwtbbDkvZLkvvHzt+nTfGmKMinHDp78RYSO3hOI=
X-Received: by 2002:a17:907:7f25:: with SMTP id
 qf37mr22897118ejc.147.1637162390183; 
 Wed, 17 Nov 2021 07:19:50 -0800 (PST)
MIME-Version: 1.0
References: <20211117143347.314294-1-s.hauer@pengutronix.de>
 <20211117143347.314294-11-s.hauer@pengutronix.de>
In-Reply-To: <20211117143347.314294-11-s.hauer@pengutronix.de>
From: Rob Herring <robh@kernel.org>
Date: Wed, 17 Nov 2021 09:19:38 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL7C32FB47=xfUtndtCvfOQx7f3Gq0O0FqZxRoeS1fNSQ@mail.gmail.com>
Message-ID: <CAL_JsqL7C32FB47=xfUtndtCvfOQx7f3Gq0O0FqZxRoeS1fNSQ@mail.gmail.com>
Subject: Re: [PATCH 10/12] arm64: dts: rockchip: rk3568-evb: Enable VOP2 and
 hdmi
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sascha Hauer <kernel@pengutronix.de>, Peter Geis <pgwipeout@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 17, 2021 at 8:34 AM Sascha Hauer <s.hauer@pengutronix.de> wrote:
>
> This enabled the VOP2 display controller along with hdmi and the
> required port routes which is enough to get a picture out of the
> hdmi port of the board.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  .../boot/dts/rockchip/rk3568-evb1-v10.dts     | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
> index 184e2aa2416af..156e001492173 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
> @@ -106,6 +106,12 @@ &gmac1m1_rgmii_clk
>         status = "okay";
>  };
>
> +&hdmi {
> +       status = "okay";
> +       avdd-0v9-supply = <&vdda0v9_image>;
> +       avdd-1v8-supply = <&vcca1v8_image>;
> +};
> +
>  &i2c0 {
>         status = "okay";
>
> @@ -390,3 +396,21 @@ &sdmmc0 {
>  &uart2 {
>         status = "okay";
>  };
> +
> +&vop {
> +       status = "okay";
> +       assigned-clocks = <&cru DCLK_VOP0>, <&cru DCLK_VOP1>;
> +       assigned-clock-parents = <&pmucru PLL_HPLL>, <&cru PLL_VPLL>;
> +};
> +
> +&vop_mmu {
> +       status = "okay";
> +};
> +
> +&hdmi_in_vp0 {
> +       status = "okay";
> +};
> +
> +&vp0_out_hdmi {
> +       status = "okay";
> +};

You can accomplish the same thing already with:

&vp0_out_hdmi {
  remote-endpoint = <&hdmi_in_vp0>;
};

or:

&vp0_out_hdmi {
  /delete-property/ remote-endpoint;
};
