Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DCF485DCB
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 02:02:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E8D910E5B5;
	Thu,  6 Jan 2022 01:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B989B10E5B5
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 01:02:29 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id y70so1257044iof.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 17:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MIFRxmXWiEBCiGr15456Pgg06Y+aeSi4XJyFkvrjKcY=;
 b=YWi65CpZCs2GGkYUWUA+9oQ5itYVgpmPFXUHQhi8B3TMg6XhFy5U+fGdUq21oWo/dB
 TDI/nlySgRjRy/gbqtKKNYZXShZrx8VtLBM6nKht/ZaExjQIxD4ZpGOJs6D3s8DWreQq
 SAF/8uVSAr7OkGtIJlg90seeMXjq6K1dJhN9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MIFRxmXWiEBCiGr15456Pgg06Y+aeSi4XJyFkvrjKcY=;
 b=Uu0MnNtA040Y5JziyqNjW4Y0v1Y3Qer6uMS6wCKtHvdNxKkNMzm7ta5GP79s9WnepD
 lYF+SnSn7nRcy13pZCqB8TqcXKnFxs7M4nuuNiqJ6AQq2RAJq/efM7I/D7Ht2VMlyPKn
 tT60dRbaVTswwmHnTwRmFKxu1gLI1LakuLj+qU1hIcPNRhUi/LOzeQwg2rxSN5BNLjAv
 cTEsDiNT5gh96HX7Lu8zUEPt2pscBDN4jX7A0sS0nQDzY0QJmOJw6zSzgUHf4Ri/VkCX
 B7w/QkUA65JqDWY74RyzNje7Ie4dyS3Qe15tydl4GeuA9NT2pjmNkSfjoHF+qQXfXmdL
 a9+g==
X-Gm-Message-State: AOAM530jXb4G5PAMgvvXS1PyuxADkS+MidGKCI2V0iJaZDdudwUVebWl
 qI/6M0XMkKUebsCy6J7DVZqc9Zx3elgsiw==
X-Google-Smtp-Source: ABdhPJywfkxpBXs60Yu+2PjXXBFLVsBubveQy9avaOzKkmh7ebet0Ohz3eqqH8IRcRjzj1Z3+JlgpQ==
X-Received: by 2002:a05:6602:2dd0:: with SMTP id
 l16mr27518249iow.198.1641430948636; 
 Wed, 05 Jan 2022 17:02:28 -0800 (PST)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com.
 [209.85.166.41])
 by smtp.gmail.com with ESMTPSA id m12sm309994ilu.8.2022.01.05.17.02.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 17:02:28 -0800 (PST)
Received: by mail-io1-f41.google.com with SMTP id i14so1203216ioj.12
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 17:02:28 -0800 (PST)
X-Received: by 2002:a02:294b:: with SMTP id p72mr21568959jap.263.1641430947664; 
 Wed, 05 Jan 2022 17:02:27 -0800 (PST)
MIME-Version: 1.0
References: <20211220104855.428290-1-thierry.reding@gmail.com>
 <20211220104855.428290-3-thierry.reding@gmail.com>
In-Reply-To: <20211220104855.428290-3-thierry.reding@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 5 Jan 2022 17:02:16 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WV2dsmRL0bVXz9jTgyy1zQpDjzrM=XDO=2rxsks=70rA@mail.gmail.com>
Message-ID: <CAD=FV=WV2dsmRL0bVXz9jTgyy1zQpDjzrM=XDO=2rxsks=70rA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: tegra: Move panels to AUX bus
To: Thierry Reding <thierry.reding@gmail.com>
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
Cc: Thomas Graichen <thomas.graichen@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jon Hunter <jonathanh@nvidia.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Dec 20, 2021 at 2:49 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Move the eDP panel on Venice 2 and Nyan boards into the corresponding
> AUX bus device tree node. This allows us to avoid a nasty circular
> dependency that would otherwise be created between the DPAUX and panel
> nodes via the DDC/I2C phandle.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm/boot/dts/tegra124-nyan-big.dts   | 15 +++++++++------
>  arch/arm/boot/dts/tegra124-nyan-blaze.dts | 15 +++++++++------
>  arch/arm/boot/dts/tegra124-venice2.dts    | 14 +++++++-------
>  3 files changed, 25 insertions(+), 19 deletions(-)
>
> diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts b/arch/arm/boot/dts/tegra124-nyan-big.dts
> index 1d2aac2cb6d0..fdc1d64dfff9 100644
> --- a/arch/arm/boot/dts/tegra124-nyan-big.dts
> +++ b/arch/arm/boot/dts/tegra124-nyan-big.dts
> @@ -13,12 +13,15 @@ / {
>                      "google,nyan-big-rev1", "google,nyan-big-rev0",
>                      "google,nyan-big", "google,nyan", "nvidia,tegra124";
>
> -       panel: panel {
> -               compatible = "auo,b133xtn01";
> -
> -               power-supply = <&vdd_3v3_panel>;

You remove the "power-supply" line here but don't add it below. Isn't
that a problem? power-supply for the panel is listed as "required" in
the panel dt bindings so I presume this will increase validation
warnings?


> -               backlight = <&backlight>;
> -               ddc-i2c-bus = <&dpaux>;
> +       host1x@50000000 {
> +               dpaux@545c0000 {

Optional nit: on other SoC dts files I've always had the policy to try
to avoid replicating hierarchies like this (host1x@50000000 =>
dpaux@545c0000). Instead I'd express this as:

&dpaux {
  aux-bux {
    panel: panel {
      ...
    };
  };
};


> +                       aux-bus {
> +                               panel: panel {
> +                                       compatible = "auo,b133xtn01";
> +                                       backlight = <&backlight>;

nit: In theory the "backlight" could go in tegra124-nyan.dtsi, right?
Then you just need to override the compatible...


-Doug
