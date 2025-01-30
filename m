Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D014A22D96
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 14:20:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E14C10E15A;
	Thu, 30 Jan 2025 13:20:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lj64ridc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1517110E15A
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 13:20:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 953AAA402C7;
 Thu, 30 Jan 2025 13:18:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52BC3C4CED2;
 Thu, 30 Jan 2025 13:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738243230;
 bh=YfzfC3vgyP+KoosDU3ZEVST8TlyNzxQAsPYtsFBXE58=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lj64ridcOqJk+nJKj2rilUjQrksdnIkZwqkAbdYyYDFxKg8uHt/Bb884H6bOGuxCR
 YcZeixvzOkfEN5d6rIxjPplfF689GiqFCLLEuv9H2s/36UfwUcV+JJqX7feOVpBuMq
 xGRrvf6qDhlEtuVRGtbxOVPeJehX3f55sr9qy+Aubtx3YFeDYyF9YUn2RXh4/9Is4t
 daBqrBSpwZmRdxmFfDh2odgqx5Ke3cIttzTqayQQHsNcsC8evkGO6/8jNr5DmqVH4E
 s/q+RQU1NW2YA/dtNH9eLqlUwGTgB3LaiZ0zlcm+ouQLxy7ID4cSYdbvP+dSjVX1TU
 drm1NjY1bZhBg==
Message-ID: <f397d8e3-0ec2-4b76-a7b4-5c816a334831@kernel.org>
Date: Thu, 30 Jan 2025 14:20:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/panfrost: Add support for Mali on the MT8370 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, kernel <kernel@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <20250116-mt8370-enable-gpu-v1-0-0a6b78e925c8@collabora.com>
 <20250116-mt8370-enable-gpu-v1-2-0a6b78e925c8@collabora.com>
 <20250118-meticulous-black-caracal-ec7f0d@krzk-bin>
 <194b7237128.10f9923a41656565.5574753983898665940@collabora.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <194b7237128.10f9923a41656565.5574753983898665940@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 30/01/2025 13:15, Louis-Alexis Eyraud wrote:
> Hello,
> 
> sorry for the delay,
> 
>  ---- On Sat, 18 Jan 2025 17:08:10 +0100  Krzysztof Kozlowski  wrote --- 
>  > On Thu, Jan 16, 2025 at 03:25:58PM +0100, Louis-Alexis Eyraud wrote:
>  > > This commit adds a compatible for the MediaTek MT8370 SoC, with an
>  > > integrated ARM Mali G57 MC2 GPU (Valhall-JM, dual core), and adds
>  > > platform data using the same supplies and the same power domain lists
>  > > as MT8186 (one regulator, two power domains).
>  > > 
>  > > Signed-off-by: Louis-Alexis Eyraud louisalexis.eyraud@collabora.com>
>  > > ---
>  > >  drivers/gpu/drm/panfrost/panfrost_drv.c | 10 ++++++++++
>  > >  1 file changed, 10 insertions(+)
>  > > 
>  > > diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
>  > > index 0f3935556ac761adcd80197d87e8e478df436fd5..1d51b64ed0f0660cc95263a289d5dad204540cfd 100644
>  > > --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
>  > > +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
>  > > @@ -837,6 +837,15 @@ static const struct panfrost_compatible mediatek_mt8192_data = {
>  > >      .pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
>  > >  };
>  > >  
>  > > +/* MT8370 uses the same power domains and power supplies as MT8186 */
>  > > +static const struct panfrost_compatible mediatek_mt8370_data = {
>  > > +    .num_supplies = ARRAY_SIZE(mediatek_mt8183_b_supplies) - 1,
>  > > +    .supply_names = mediatek_mt8183_b_supplies,
>  > > +    .num_pm_domains = ARRAY_SIZE(mediatek_mt8186_pm_domains),
>  > > +    .pm_domain_names = mediatek_mt8186_pm_domains,
>  > > +    .pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
>  > > +};
>  > 
>  > No, people, stop this nonsense. This is exactly the same as previous.
>  > Don't duplicate entries just because you want a commit.
>  > 
> I added this new compatible in bindings and panfrost driver because there were no other matching compatible 
> Using another mali-vallhal-jm compatible would make the driver probe fail because of power domains number difference. 
> Using mt8186-mali compatible would work without modifications but as it is not the same architecture (mali-bifrost), it would be incorrect.

Fix your email app, so it won't add spaces before quote and will wrap
the text properly.

> 
> I've also misguessed on the dt_match array modifications, sorry.
> I'll amend this patch in order to reuse the mt8186 platform data instead.
> 
>  > > +
>  > >  static const struct of_device_id dt_match[] = {
>  > >      /* Set first to probe before the generic compatibles */
>  > >      { .compatible = "amlogic,meson-gxm-mali",
>  > > @@ -859,6 +868,7 @@ static const struct of_device_id dt_match[] = {
>  > >      { .compatible = "mediatek,mt8186-mali", .data = &mediatek_mt8186_data },
>  > >      { .compatible = "mediatek,mt8188-mali", .data = &mediatek_mt8188_data },
>  > >      { .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
>  > > +    { .compatible = "mediatek,mt8370-mali", .data = &mediatek_mt8370_data },
>  > 
>  > No, express properly compatibility or say in bindings commit msg why
>  > devices are not compatible.
>  > 
> I'll reword in V2 the commit messages to make the compatible need more explicit.

Your commit msg should then explain that this is not compatible with
mt8186 because programming model or architecture is different. Number of
power domains rarely matters for actual compatibility and as easily
visible in panfrost driver: does not matter here, either.

Best regards,
Krzysztof
