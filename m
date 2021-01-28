Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E89C03073A8
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 11:24:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1313E6E0FC;
	Thu, 28 Jan 2021 10:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F616E0FC
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 10:24:41 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id v19so1292260ooj.7
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 02:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m1z+Yu2fiQlavDIbv9fPx1NNOziGtX2cOyoTwpCpWQI=;
 b=MHD1CdFnmK00kxSnxryGxN7EuOz28GXa8gDugIWWKqB4bu29sYsgdBEO20Ik3ibTu6
 gy+vUfGHbC5IPeFzxq7DYJ8L1D4135+ZURvRtmdhllV/LSUxYO8kh4jZ5frnnFLBLS6z
 xXWAHil0XKu/RsMmMkRt0t+pRJoBfNe8/AyGWL8gHgBkrVFF4y8Rqkgd/KP9OAnZT1d4
 0j7oJi4cy74V4OhUvokWxX2xCM8RLtCnwwr3JdEecW//Vk56o3L3qFbRrLT1zAOjSlxY
 giq687DnX05W3NvZAbdLwIkAEPoClsexV3FsvPdT06rY/N5FU87xDPBL08j1o2G3Yk98
 A3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m1z+Yu2fiQlavDIbv9fPx1NNOziGtX2cOyoTwpCpWQI=;
 b=NzBac0LOIO5YS7HTyw+uNVNQ1VwP9QxyeAgKp1txnnQkOXhj8+Mv+qI29HC904awa8
 1bFd1ZoTf/7Z7xxS0dKJLwnyJGFJLgOCv8zlLNbctUIIpHzZTvq1rpX83bBrwAFz82do
 uEutt2NLz+PjjKTSFDDbX06PSJ+KPa/TSDm9o5I19BtrEbjJfw4/squmU/mjLme3xmSI
 bc0CSZRTPYi/aavPtwUjR5lY61eQXxRWfCe/32ObHPkmf2FNvjchtAFj/hHXLW2vPrLa
 GNyTXDG7Z0yGN0Q4QjkAePlPBdhssx8CtsbAbzZeNy/wF8HXBmPDk7cgII3T0B2dUTXZ
 LffA==
X-Gm-Message-State: AOAM531O9I+2lHKNcEsAQ8PbD/W9Ski7jQRJ/j4rQ8OmJlTpF9RHVVFk
 auiytoXWCaEtVyMCNqolP189V0RNlWvxUi2+4vo=
X-Google-Smtp-Source: ABdhPJwUsgdluUwC0izmBpnoRmX0hPl6NAxZbuWCF3shpvrYsv4fn9VmR+tzaw+Uf6ovgJbADeSOCErOYZJGoRFA9H8=
X-Received: by 2002:a4a:9c01:: with SMTP id y1mr10870225ooj.15.1611829481208; 
 Thu, 28 Jan 2021 02:24:41 -0800 (PST)
MIME-Version: 1.0
References: <20210128072802.830971-1-hsinyi@chromium.org>
 <20210128072802.830971-2-hsinyi@chromium.org>
In-Reply-To: <20210128072802.830971-2-hsinyi@chromium.org>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 28 Jan 2021 11:24:29 +0100
Message-ID: <CAFqH_52xmsSsxqxkBO8d93Jezy4YZFxtpJ0BX9TVrCy6qao02A@mail.gmail.com>
Subject: Re: [PATCH v11 1/9] arm64: dts: mt8183: rename rdma fifo size
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hsin-Yi,

Thank you for the patch.

Missatge de Hsin-Yi Wang <hsinyi@chromium.org> del dia dj., 28 de gen.
2021 a les 8:28:
>
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
>
> property name must include only lowercase and '-'
>

This is a leftover while I forward ported the patch, the
rdma_fifo_size only existed on the downstream kernels, in mainline it
is with '-', so we should probably add the fixes tag here.

Fixes: 91f9c963ce79 ("arm64: dts: mt8183: Add display nodes for MT8183")

> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 5b782a4769e7e..6c84ccb709af6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1011,7 +1011,7 @@ rdma0: rdma@1400b000 {
>                         clocks = <&mmsys CLK_MM_DISP_RDMA0>;
>                         iommus = <&iommu M4U_PORT_DISP_RDMA0>;
>                         mediatek,larb = <&larb0>;
> -                       mediatek,rdma_fifo_size = <5120>;
> +                       mediatek,rdma-fifo-size = <5120>;
>                         mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xb000 0x1000>;
>                 };
>
> @@ -1023,7 +1023,7 @@ rdma1: rdma@1400c000 {
>                         clocks = <&mmsys CLK_MM_DISP_RDMA1>;
>                         iommus = <&iommu M4U_PORT_DISP_RDMA1>;
>                         mediatek,larb = <&larb0>;
> -                       mediatek,rdma_fifo_size = <2048>;
> +                       mediatek,rdma-fifo-size = <2048>;
>                         mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
>                 };
>
> --
> 2.30.0.280.ga3ce27912f-goog
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
