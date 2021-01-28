Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BD1307254
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 10:11:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6B989E63;
	Thu, 28 Jan 2021 09:11:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F8389E63
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 09:11:22 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id v1so4507616ott.10
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 01:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BpH8ufxoi7Wf0OvvYg4DlAzvPrwoTT0dl+FXt2N9bdw=;
 b=ZG3D9l1mrE8u11+4t1oKrakZ8yoNRc3iqYfBA5JFX711kPox/GdilHmoQd34vIz5q7
 nW/1iTSXzQzCf4rWRapemQKLf4bA3RswLUmLKCWQg40dRNG7ozxOCgYdIn33SS2SnqOF
 1lTlgz9Hf5oOYTlzqYoItp+GObYybgOWDw27u8orGRbM5SmX1+IbZt0sny2HDGxYlvgr
 R6Nk+sFAWjyoL0YTv4yfbn1Wsm/JG2gDMahzUjPX40k1CcUuZpKK8nkFAn+X74fJnyiN
 nPmElhgFBvCCLEy1E6S3C23NUM4xZxeh3NcnHdRxUWoI1/tg0FaY95iiYGIXAeCXND+H
 5mxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BpH8ufxoi7Wf0OvvYg4DlAzvPrwoTT0dl+FXt2N9bdw=;
 b=g8lbA0zb+7YpybSm8ndX06CqCp9+G/UdsY7xaQLv7QeOm6zRQbXwa7S32ShbTLCcsz
 cLSSoBI1zJ7Vje/4W687m2F9lACW76lt7MGRVbhK7aOmdrrpH3rPd/EBNLVnpD3+AXYF
 HgXQsT8IV+0QVetrugBVgBQSW/u3LLZJx699mblNo5iSA/50b7flSeDEEcu5CgaQlzIl
 FqtO+d946d3HEeMx7c0CJ53YSPBkSxfhLRCiuAYnxc8W1I8MoCYl343RHN5CQi4qATEu
 3ZyUQRN8Cwm8KUcEGywvRjiquRv25F0c3Sgt5FNJkkQrO9GpODeDaAgTr/PvTX/U+PLL
 Z5GQ==
X-Gm-Message-State: AOAM530LCzZUXiYbNWJKQoger+smjKQpARgYLHf3+APuwkQxVqSoWG6K
 GewEZSeSR4fse2RrWWKyQj48LcBayYYMmkLDbIs=
X-Google-Smtp-Source: ABdhPJwmVwbpJuVCu7aP1ss+R20SLHhCSoSintnWm2cqEvOWeAq3xFHQVy5TXM8vV1E/vhrdcmfiXUh2L7R41WY/m08=
X-Received: by 2002:a05:6830:230b:: with SMTP id
 u11mr10952979ote.184.1611825081403; 
 Thu, 28 Jan 2021 01:11:21 -0800 (PST)
MIME-Version: 1.0
References: <20210128072802.830971-1-hsinyi@chromium.org>
 <20210128072802.830971-3-hsinyi@chromium.org>
In-Reply-To: <20210128072802.830971-3-hsinyi@chromium.org>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 28 Jan 2021 10:11:09 +0100
Message-ID: <CAFqH_53kVHh2Phyd=xoM7A3g0qz2HACAJHYcgX24eRTo_YE5Cg@mail.gmail.com>
Subject: Re: [PATCH v11 2/9] arm64: dts: mt8183: refine gamma compatible name
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

Thank you for your patch.

Missatge de Hsin-Yi Wang <hsinyi@chromium.org> del dia dj., 28 de gen.
2021 a les 8:28:
>
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
>
> mt8183 gamma is different with mt8173
> remove mt8173 compatible name for mt8183 gamma
>

Should this patch contain?

Fixes: 91f9c963ce79 ("arm64: dts: mt8183: Add display nodes for MT8183")

> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 6c84ccb709af6..9c0073cfad452 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1055,8 +1055,7 @@ aal0: aal@14010000 {
>                 };
>
>                 gamma0: gamma@14011000 {
> -                       compatible = "mediatek,mt8183-disp-gamma",
> -                                    "mediatek,mt8173-disp-gamma";
> +                       compatible = "mediatek,mt8183-disp-gamma";
>                         reg = <0 0x14011000 0 0x1000>;
>                         interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_LOW>;
>                         power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
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
