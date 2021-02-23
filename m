Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A71B322D02
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 15:59:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A6B6E9D1;
	Tue, 23 Feb 2021 14:59:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4199F6E9D1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 14:59:49 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id b145so8937906pfb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 06:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TPWEywY+7RrfQbDRMsLObI9Lz4l7g81hZ8ntaurd66Q=;
 b=lbbRCJqlfccsjStUNQy8nhqxYofLITmpfBAADMw4vOkRyawXkjP+v15BH5BB/qE5EV
 /9akhT1BCeZei8qQMvZb1ph5tLwtZqGy3u3w82MT+F836ZGXmHRM+bnmXZAPKoE99huv
 9xRYX4OPlXgF/YCnQhd7Ad1ASEjTjjKouX7H4b1HZuFRM2I8epUo/1IFI1zgh4dO/FPN
 gh5wnyY3chjcuuW9Vo/hiHCULBBq4him8f4pbgNVCdMdZc7Z4FtkjxctWzjzC3/T03VZ
 jS1KnTd+b6DxWnksUcDfRwHI95N03AYO5UKKZC4Q6Lg8qxooDak/FaZlrD3cFft5VqMe
 7sQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TPWEywY+7RrfQbDRMsLObI9Lz4l7g81hZ8ntaurd66Q=;
 b=AVSBzCKFCcgvKWdQcO1V1Xi+nEQQUFEbgA99Ol+/vYyZ3mb295/y8iPPtX3M4n+Png
 2flf0cww5EeY+jVXG4vdfrm3+n6VtVAgwZSfdNto76R5DoMV5jF1rUTpPij9sRDT5U7l
 bbogkgRWFRxVBeTmdk8fpiaVe07RMZfiZRqkfoBiYZ9/4x7bxRbvhXfG7WNIm3UpgkdZ
 n7dy2DkE308tHcv5KBmk7b+1ibVnmq16DANdCxxtvyqm9RC6yYX/0l5kshX0cJnFZeBo
 kCUlrnoqDUbWXOxnkGYYwl5u7p4Oh7wXkPD9J+SG8iOks7o0xSDxVga0oaK58Hki3XDE
 plbg==
X-Gm-Message-State: AOAM531HdUKk5JuSrrNpcocvftjWgflSKpnlenn4/DGDQVJaYXctP13c
 lKncDyD9BbgkOUb0t0LrOOpH5Ch7ECSr0tri4YT3mA==
X-Google-Smtp-Source: ABdhPJx7k9bw5zaosBrKWi8wkAKNteucUQHNyLik7bVbAEcWampxkTVMmg57ff2wzNQ0TIL+9tQQibeUmtIw7ZfVhHU=
X-Received: by 2002:a63:6547:: with SMTP id z68mr21393175pgb.120.1614092388836; 
 Tue, 23 Feb 2021 06:59:48 -0800 (PST)
MIME-Version: 1.0
References: <20210220060811.2500081-1-hsinyi@chromium.org>
In-Reply-To: <20210220060811.2500081-1-hsinyi@chromium.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 23 Feb 2021 15:59:37 +0100
Message-ID: <CAG3jFyvRn7zmk0tY70VMkh0xPFaSjYcF4PreTFjf8xj8VXHCVA@mail.gmail.com>
Subject: Re: [RESEND v3 1/2] dt-bindings: drm/bridge: anx7625: Add power
 supplies
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Hsin-Yi,

Thanks for the patch, and sorry about the delays in reviewing this.

This patch does not apply to the drm-misc/for-linux-next branch due to
some other changes having been merged.

On Sat, 20 Feb 2021 at 07:10, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> anx7625 requires 3 power supply regulators.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/display/bridge/analogix,anx7625.yaml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> index 60585a4fc22bc..3ae97d9523e56 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> @@ -34,6 +34,15 @@ properties:
>      description: used for reset chip control, RESET_N pin B7.
>      maxItems: 1
>
> +  vdd10-supply:
> +    description: Regulator that provides the supply 1.0V power.
> +
> +  vdd18-supply:
> +    description: Regulator that provides the supply 1.8V power.
> +
> +  vdd33-supply:
> +    description: Regulator that provides the supply 3.3V power.
> +

This chunk below has seen some changes.

With this patch fixed, feel free to add my r-b.
Reviewed-by: Robert Foss <robert.foss@linaro.org>

>    ports:
>      type: object
>
> @@ -55,6 +64,9 @@ properties:
>  required:
>    - compatible
>    - reg
> +  - vdd10-supply
> +  - vdd18-supply
> +  - vdd33-supply
>    - ports
>
>  additionalProperties: false
> @@ -72,6 +84,9 @@ examples:
>              reg = <0x58>;
>              enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
>              reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
> +            vdd10-supply = <&pp1000_mipibrdg>;
> +            vdd18-supply = <&pp1800_mipibrdg>;
> +            vdd33-supply = <&pp3300_mipibrdg>;
>
>              ports {
>                  #address-cells = <1>;
> --
> 2.30.0.617.g56c4b15f3c-goog
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
