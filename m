Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A2848AA98
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 10:33:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 656A2112912;
	Tue, 11 Jan 2022 09:33:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA00112912
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 09:33:31 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id u21so42071080edd.5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 01:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X8bneVZ+qC15M11+UEogNTqMcApOjWyY+lQpeNZkiXo=;
 b=MDG3t1FDU8XXB0ZGubfHzYuh/BCkX+jsYiXrFKFfWtqDltvGakGb2KF668ymmoEEQp
 05b9nH/on0byJC71ajqLPicmF45UQb2HJdLibllWuzqE2y7BexMLJLy8lZvHaRNM1ccn
 8C9i1xwsQW0Qz9obrqWG37k0NhMOyc89UIhDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X8bneVZ+qC15M11+UEogNTqMcApOjWyY+lQpeNZkiXo=;
 b=5k9IdSPVkLOicpNWYFhblYxbpwPQHSnF7iNC2T8gEG0rfV1r6ZCCI43Xe1S8tMyrUq
 YBICOUzwkD+uGDtqagY8DRPN7DOHkMf7wRiK8GVWevSrfpmSI1DvEoFoHpN84PD3AnX5
 G8M13MQxpLuEoSO8hA8mqZvbxX6OEHm04qjNyQ98M/cuLM6G6B8PpwCPCYrDlebLlCnf
 tZ5uCBTd9zGSgZq0VRbRXNg0tyz/L6eG/E0/pnpVE5BR+MNY5WQksz3TH/La05LTie2b
 6d1cMMn4zxrr5iPPVMbvEyCO/FFRuv0ieBlnOAjWgGsoeevm98pSmuK8o2hxet8ZJQJg
 Pz8g==
X-Gm-Message-State: AOAM532E4pP2aEqhuMLO3UgjKaCvRmvXW7cEIDNv5iHxRr1HIj7Jr0Gn
 DQQxp60AJDrj4FtGTXKret1mvPMIfdxSp4vQ1opdmf0JxlU=
X-Google-Smtp-Source: ABdhPJyFng5l8FDcltBOzaC7Q+BUfc4C2MuIm8fya/CGbULn+72c0lC2c+/0gRyMdBsFYI1M/uk1b8A58qoDK8H9wBI=
X-Received: by 2002:a05:6402:5214:: with SMTP id
 s20mr3549866edd.13.1641893610416; 
 Tue, 11 Jan 2022 01:33:30 -0800 (PST)
MIME-Version: 1.0
References: <20220110152714.58220-1-jagan@amarulasolutions.com>
 <9912c743-8acb-c59a-760a-a9b79ed48784@intel.com>
In-Reply-To: <9912c743-8acb-c59a-760a-a9b79ed48784@intel.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 11 Jan 2022 15:03:19 +0530
Message-ID: <CAMty3ZDF8jjoOx_qHsFAVKGDPqrOaiwSFkCikrHZQLRd-OV0pQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: exynos: Link DSI panel at port@1 for TM2
 board
To: Andrzej Hajda <andrzej.hajda@intel.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej,

On Tue, Jan 11, 2022 at 2:05 PM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
>
> +CC: dri-devel
>
> On 10.01.2022 16:27, Jagan Teki wrote:
> > TM2 board DSI pipeline has input from MIC and output to
> > s6e3ha2 panel.
> >
> > The existing pipeline has child nodes of ports, panel and
> > MIC is remote-endpoint reference of port@0 of ports.
> >
> > Adding panel as another child node to DSI is unconventional
> > as pipeline has ports child. However it can be true if MIC
> > is added inside port node like this.
> >
> > dsi {
> >       compatible = "samsung,exynos5433-mipi-dsi";
> >       #address-cells = <1>;
> >       #size-cells = <0>;
> >
> >       port {
> >               dsi_to_mic: endpoint {
> >                       remote-endpoint = <&mic_to_dsi>;
> >               };
> >       };
> >
> >       panel@0 {
> >               compatible = "samsung,s6e3hf2";
> >                  reg = <0>;
> >                  vdd3-supply = <&ldo27_reg>;
> >                  vci-supply = <&ldo28_reg>;
> >                  reset-gpios = <&gpg0 0 GPIO_ACTIVE_LOW>;
> >                  enable-gpios = <&gpf1 5 GPIO_ACTIVE_HIGH>;
> >       };
> > };
> >
> > The above pipeline is proper but it requires the DSI input MIC
> > pipeline to update.
> >
> > This patch is trying to add panel at port@1 so-that the entire
> > pipeline before to panel output is untouched.
> >
> > Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >   arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 16 ++++++++++++++++
> >   1 file changed, 16 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> > index aca01709fd29..e13210c8d7e0 100644
> > --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> > +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> > @@ -53,6 +53,16 @@ &cmu_disp {
> >   };
> >
> >   &dsi {
> > +     ports {
> > +             port@1 {
> > +                     reg = <1>;
> > +
> > +                     dsi_out_panel: endpoint {
> > +                             remote-endpoint = <&dsi_in_panel>;
> > +                     };
> > +             };
> > +     };
> > +
> >       panel@0 {
> >               compatible = "samsung,s6e3ha2";
> >               reg = <0>;
> > @@ -60,6 +70,12 @@ panel@0 {
> >               vci-supply = <&ldo28_reg>;
> >               reset-gpios = <&gpg0 0 GPIO_ACTIVE_LOW>;
> >               enable-gpios = <&gpf1 5 GPIO_ACTIVE_HIGH>;
> > +
> > +             port {
> > +                     dsi_in_panel: endpoint {
> > +                             remote-endpoint = <&dsi_out_panel>;
> > +                     };
> > +             };
>
>
> As I already wrote in Exynos thread, DSI host has already parent-child
> relation with the panel - DSI host knows well who is connected to it.
> Adding another links between them is redundant and has no value added.
>
> I have already answered in Exynos thread[1] how could you deal with the
> issue, you have.
>
> [1]:
> https://lore.kernel.org/dri-devel/e541c52b-9751-933b-5eac-783dd0ed9056@intel.com/

I have commented on this thread for better understanding. Please have
a look and respond.

Thanks,
Jagan.
