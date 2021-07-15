Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C363C9D8E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 13:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238E26E826;
	Thu, 15 Jul 2021 11:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A95E6E823;
 Thu, 15 Jul 2021 11:12:56 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id u15so6134742oiw.3;
 Thu, 15 Jul 2021 04:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G7yK9VzLEQCG6XE//c9cVdti/iHPJ3DxnhKwu9cnsjI=;
 b=NlMo7/06IiuX+CxJRiTWwRLYAECimiW0KcSKx3FPDyhg//qYD+xUnzoPnUGxdN/YZM
 L8QIWKpiGVXGMzF5Rs1pbhzfiDd0bVzRgb6E8/AAdfrIYlE/fhxV8s1Ngwmvlsrz/GIl
 aL/RlzPYC5j6aQfvfY8kkeK45rCPEJ4hTqhPn/q2dWzSGd2k18aUnDJbE7e6eLaFSpmr
 1PgjcCYt04tTWmzSvtIw0MeTyl4+C2pESNcbZ9Vi9HMI5ZmESxO85j6Jgemf6Xe6L2fV
 2D02skzT9DUri5jE0CHzIMB1Cg+ysuyMYfXTwi5W9Adrjbhtxq/GC9Dvro4VcA20R42q
 /elw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G7yK9VzLEQCG6XE//c9cVdti/iHPJ3DxnhKwu9cnsjI=;
 b=PjV8TyNxiQkO9UzDgWHUO8uCvaGADgYlHlXI2LaOBzWnCKOUXFEjP/VzYukLEW37JC
 E5KfIIugAdBpJf5RupsUBrtRqnZ+HVmeFwzRkVMif/4bLSTFmybqnwx/pHuW7ia+i3vl
 EyBHRWrf4pBnRGukVFihBx+QIfipaFnDX1XBdMrq8sB2BZ+W0UDcfCJxxB3SwfoTCI8T
 RAbNjwa5y6W7mQIWgbxImBCtS8PxiXJ0JCTFCXM5Q+8IoZVfLSig5aq5TdY82ml4YMDI
 jJA0QgCgWOqq09fRHSFECD5IDjbs35X5Hl3kBDKvsa1ihkZHenFTBwkNdbHHKEZrYW9O
 Ymgw==
X-Gm-Message-State: AOAM532Yuky3mwlllh6v0YKNhhy0PnxwuGMSU8YoCN3dT0A2g7dG8exn
 hMfCtuZeBsNyWjFih4zYns35Z6hh2GjyC3fSRbU=
X-Google-Smtp-Source: ABdhPJzOFkRPM1F5bStdEZ0HnTr0PNZpn8ngy3uh/IeBzMB96wnzSxAwpctzKDpwPU357CBdQwPf/oPm4PKS8eRVHl0=
X-Received: by 2002:aca:c6c9:: with SMTP id w192mr3095017oif.47.1626347575562; 
 Thu, 15 Jul 2021 04:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210527074202.1706724-1-hsinyi@chromium.org>
 <20210527074202.1706724-3-hsinyi@chromium.org>
In-Reply-To: <20210527074202.1706724-3-hsinyi@chromium.org>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 15 Jul 2021 13:12:44 +0200
Message-ID: <CAFqH_50_EP_aBs3UuBNCFbgqFHS=jizberM8pZY6EhpOnWnbVw@mail.gmail.com>
Subject: Re: [PATCH v6 RESEND 3/3] arm64: dts: mt8183: Add panel rotation
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Robert Foss <robert.foss@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hsin-Yi,

Thank you for the patch.

Missatge de Hsin-Yi Wang <hsinyi@chromium.org> del dia dj., 27 de maig
2021 a les 9:42:
>
> krane, kakadu, and kodama boards have a default panel rotation.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

It looks good to me, so

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

and, on a Lenovo IdeaPad Duet. The display appears well rotated now.

Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Thanks,
  Enric
> ---
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index ff56bcfa3370..793cc9501337 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -263,6 +263,7 @@ panel: panel@0 {
>                 avee-supply = <&ppvarp_lcd>;
>                 pp1800-supply = <&pp1800_lcd>;
>                 backlight = <&backlight_lcd0>;
> +               rotation = <270>;
>                 port {
>                         panel_in: endpoint {
>                                 remote-endpoint = <&dsi_out>;
> --
> 2.31.1.818.g46aad6cb9e-goog
>
