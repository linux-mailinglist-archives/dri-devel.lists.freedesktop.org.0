Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8831416F48D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 01:56:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190456E04A;
	Wed, 26 Feb 2020 00:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE756E04A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 00:56:02 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id t13so1091973qto.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 16:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KTr07x+ZuW+Wkx10CmLSTlKU+6ax9EaUyaBXKAF3OqM=;
 b=Y7BmXd6Mfp+6AZ5v7tzuyEct+NldmkDhFbkaCIoOl6/SfR059Z2NK44rQkbVc+4j7t
 n0RrGob1lJqy4jSvVTBHC3x7e53bCvZCs0af4K9zwmRDwcKU3x3vY+Goiu220sgiSxhg
 LkPCOLYG0N6aE3fNLH+xw2IiIErd9z+gBVRxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KTr07x+ZuW+Wkx10CmLSTlKU+6ax9EaUyaBXKAF3OqM=;
 b=rDIdxl0DJKO2qxG5fu8cdaaFZpuqJQRJlHxw7EPi0idIaCUzUaGPaI3SvrMVXnxokr
 IjpGhAea/QddhluwWWeQWqbOSNzz/m0o5NTQNwHLPl05kImsOgVCUVrjC2dpydT8Q5/u
 faiouXPHMN+tVegyhNVaCBMlnI7ge6mepFco3Jb1qpcQDg0WN5VyluIs/xoZrQUKkq2z
 9Um7Us8mffzS/dqJigbkAa4IGUYoZJj5xuQ/2B9WSB5Z4dizG11EqUndMXWm6sOoRAVe
 yfaWPDfBv63M9v/lLwIYpdRJMUQNCvNhO6lxyUzEVN3GwkLImDF7U+cb3awnElvrxayf
 WQ7Q==
X-Gm-Message-State: APjAAAWRB9A/R+/PUMwO3CqSTozVi6A5Ti6go6mlIGXghCF1L0JXL/+F
 bGKeHhofZvA/UGoRRjEsCdhU7p2UlLFFIrCNY/5eRQ==
X-Google-Smtp-Source: APXvYqwn/doZ3Sl5MivNf7aeBY0i9IjKThPIXnCkYsjm6+vHV5atNhFSLqXf91LmG+mgvcdhqR+658LdmJfFTgy7fYc=
X-Received: by 2002:ac8:72d6:: with SMTP id o22mr1774873qtp.174.1582678561028; 
 Tue, 25 Feb 2020 16:56:01 -0800 (PST)
MIME-Version: 1.0
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <20200207052627.130118-2-drinkcat@chromium.org> <20200225171613.GA7063@bogus>
In-Reply-To: <20200225171613.GA7063@bogus>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 26 Feb 2020 08:55:50 +0800
Message-ID: <CANMq1KAVX4o5yC7c_88Wq_O=F+MaSN_V4uNcs1nzS3wBS6A5AA@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
To: Rob Herring <robh@kernel.org>, Nick Fan <nick.fan@mediatek.com>, 
 Sj Huang <sj.huang@mediatek.com>
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
 Devicetree List <devicetree@vger.kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+Nick Fan +Sj Huang @ MTK

On Wed, Feb 26, 2020 at 1:16 AM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Feb 07, 2020 at 01:26:21PM +0800, Nicolas Boichat wrote:
> > Define a compatible string for the Mali Bifrost GPU found in
> > Mediatek's MT8183 SoCs.
> >
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> > ---
> >
> > v4:
> >  - Add power-domain-names description
> >    (kept Alyssa's reviewed-by as the change is minor)
> > v3:
> >  - No change
> >
> >  .../bindings/gpu/arm,mali-bifrost.yaml        | 25 +++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > index 4ea6a8789699709..0d93b3981445977 100644
> > --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > @@ -17,6 +17,7 @@ properties:
> >      items:
> >        - enum:
> >            - amlogic,meson-g12a-mali
> > +          - mediatek,mt8183-mali
> >            - realtek,rtd1619-mali
> >            - rockchip,px30-mali
> >        - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
> > @@ -62,6 +63,30 @@ allOf:
> >            minItems: 2
> >        required:
> >          - resets
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: mediatek,mt8183-mali
> > +    then:
> > +      properties:
> > +        sram-supply: true
> > +        power-domains:
> > +          description:
> > +            List of phandle and PM domain specifier as documented in
> > +            Documentation/devicetree/bindings/power/power_domain.txt
> > +          minItems: 3
> > +          maxItems: 3
> > +        power-domain-names:
> > +          items:
> > +            - const: core0
> > +            - const: core1
> > +            - const: 2d
>
> AFAIK, there's no '2d' block in bifrost GPUs. A power domain for each
> core group is correct though.

Good question... Hopefully Nick/SJ@MTK can comment, the non-upstream DTS has:
gpu: mali@13040000 {
compatible = "mediatek,mt8183-mali", "arm,mali-bifrost";
power-domains = <&scpsys MT8183_POWER_DOMAIN_MFG_CORE0>;
...
}

gpu_core1: mali_gpu_core1 {
compatible = "mediatek,gpu_core1";
power-domains = <&scpsys MT8183_POWER_DOMAIN_MFG_CORE1>;
};

gpu_core2: mali_gpu_core2 {
compatible = "mediatek,gpu_core2";
power-domains = <&scpsys MT8183_POWER_DOMAIN_MFG_2D>;
};

So I picked core0/core1/2d as names, but looking at this, it's likely
core2 is more appropriate (and MT8183_POWER_DOMAIN_MFG_2D might just
be a internal/legacy name, if there is no real 2d domain).

Thanks.

> Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
