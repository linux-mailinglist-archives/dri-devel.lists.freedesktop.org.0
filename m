Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 024F54D03EB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 17:20:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB2A10E05A;
	Mon,  7 Mar 2022 16:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EADB10E05A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 16:20:18 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id s11so14246806pfu.13
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 08:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=+wV1FY8U0FWB4VAPUiegJjEIq4RD3FNiqaa9wr6HZiU=;
 b=HHxBwJWvb+zcfYI6s9N+7pQZWwRNUv3GxQ6D78pso72TORyjd7Eoi7G9ZoGfaTtuvT
 +YGxjcgJNHZWubIdOEwRzBEmMlMeCxU6xnn1f9XqzuOOKCKZEE3tpPK3j+ID10hUCguZ
 mHOATnIR8CkGYTCe6H27Px6VUPMR5+JMrlpyHxw6vMj1MNjuazGNc5Y0F/PmAqBvVlTI
 Kv4UnmBTAxOAH+YXealbXzJMmAmoTZKL+68os0S0/EPJle5tuR0W5FsA7Nfgcc2pexey
 IDSK+9jDYCZdtn5MbsEssOwC2ebqPhbqCYaGzp158jtWQVu2VuUfq++MJyoHi2rzXy3d
 zzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=+wV1FY8U0FWB4VAPUiegJjEIq4RD3FNiqaa9wr6HZiU=;
 b=BD9Rj/QJu+OXY24XiBKuh5oU45+hjRoe6tx+uQHWle2g2m7uwb6QjiZAfNErTTRTPX
 cePpfh/AuqWS8adtaqfF/PtFkBhuM1b073/KS+lNeHSYlQp1V9G/uNl9UWX/HA1aPKaE
 yesvINoALmgnF8bKyKrXfreSR7cZaD0odZU6zzY/m70rf2JkvI92r0MP8qIOumh136sy
 tum+lah+0lpeWe6IVvJDZ9DiLw0tPRZxZGbkaz+xdyb+xaRhoC98fFs03xHN5Swxjwfr
 oLmRLvqa0zni3NzRURqDcCKFKHf9l4/0mdXyzwS3X89xHNVZJyQZl8wPKtorr5md2J/V
 5i2A==
X-Gm-Message-State: AOAM530BnogfN2xr7sGucYMXwjwQRemDdNYz3iQo0l74nr6eGheDg+k4
 Q6/WPrw53WMixIqdYePz/TNvy/XIyAtEokYjd3o5cA==
X-Google-Smtp-Source: ABdhPJx/V3uLVWBI8/E8KCOJyzUgUR2RjgCZBR6Hgu1VcR0R4QgDq/3T8EiSucOBT+/CPouLZFgIw7Ts/R5qlhZ+a60=
X-Received: by 2002:a05:6a00:24c5:b0:4d1:65bf:1fe0 with SMTP id
 d5-20020a056a0024c500b004d165bf1fe0mr13441313pfv.0.1646670017759; Mon, 07 Mar
 2022 08:20:17 -0800 (PST)
MIME-Version: 1.0
References: <20220307154558.2505734-1-robert.foss@linaro.org>
 <20220307154558.2505734-3-robert.foss@linaro.org>
In-Reply-To: <20220307154558.2505734-3-robert.foss@linaro.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 7 Mar 2022 17:20:06 +0100
Message-ID: <CAG3jFytGV3NNfkEPqx_rZX9O9aZjTjzo2tpeSK8mFimOrYt9zw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] Revert "arm64: dts: mt8183: jacuzzi: Fix bus
 properties in anx's DSI endpoint"
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, 
 matthias.bgg@gmail.com, robert.foss@linaro.org, xji@analogixsemi.com, 
 hsinyi@chromium.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chen-Yu Tsai <wenst@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Robert Foss <robert.foss@linaro.org>

On Mon, 7 Mar 2022 at 16:46, Robert Foss <robert.foss@linaro.org> wrote:
>
> This reverts commit 32568ae37596b529628ac09b875f4874e614f63f.
> ---
>  arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> index e8f133dc96b95..8f7bf33f607da 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> @@ -171,8 +171,6 @@ port@0 {
>
>                         anx7625_in: endpoint {
>                                 remote-endpoint = <&dsi_out>;
> -                               bus-type = <5>;
> -                               data-lanes = <0 1 2 3>;
>                         };
>                 };
>
> --
> 2.32.0
>
