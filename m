Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7726A0141
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 03:44:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1872210E2C8;
	Thu, 23 Feb 2023 02:44:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C29E910E2C8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 02:44:02 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id f31so12745274vsv.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 18:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=glBWgfS+Z8AsJzCa0azp9rra0TmC5WFPpp9wbSwIysQ=;
 b=TlXON0dnZS3i2VneFhuywAEetx5CXx1Yt7HMbvQ90/JuEusyf7pnz6RQIpVd7zC3o0
 n4VlSAzuWvRIT/CCUnkBdl+Zu47u8j1gifDeC4ygpLSlzXO4n8hRdHdU6zHPr8CNCmF6
 xYxOGJMOjTDNqwpbiTnDtDSQcydd71K1J0p4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=glBWgfS+Z8AsJzCa0azp9rra0TmC5WFPpp9wbSwIysQ=;
 b=4w7cw0qLqL6Ul/94mfYF0K77+d6mU0jwl5Sj7QBdJWdnY/CTTZs7vf5vzZwjtBhoO1
 aBCQESH/jRVvtPSI9BN8Cfjqo65awFzd0GadnajMO4R4ZJndloJ5YM6Ptu7cyvpyjNSw
 gPJ+BsTubBLWpVjiKNDBdsHzGzX4LSCHWdrY0Py3el4apNrPhwwEmljExLxNqhNKQpkS
 lJQdDWbG+0nHa5c2VxxQKUyWp+F8Vw71RA4IVFq/kom4oEU9dcbbz3e6gbWE7I/DL1V9
 tEUuiWladNMVXpA1JTDa6Bp2ApgPfemWrmdLHqOoToc7tA4RdcCwHPT/RoPOCaVu/Fly
 6Uug==
X-Gm-Message-State: AO0yUKVrd/CgpQ2v+2g2NzPbU0EAmx7zwYNKJZ6upuww634lL+U9oVea
 tedpDj6lrPequi+2hyzee13gZ+g+59YusN/m3Ltazg==
X-Google-Smtp-Source: AK7set9FQsaQ4wwwGwa1iJ35QZxS7z/tqpoggFV3jIIY4bRVdaLuYXMbSLMPdYFq5+nMU1dh82/hbSINPKYjn7/TdoE=
X-Received: by 2002:a05:6102:570b:b0:3fc:58d:f90f with SMTP id
 dg11-20020a056102570b00b003fc058df90fmr2241014vsb.60.1677120241810; Wed, 22
 Feb 2023 18:44:01 -0800 (PST)
MIME-Version: 1.0
References: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com>
 <20230221153740.1620529-7-angelogioacchino.delregno@collabora.com>
 <CAGXv+5Ed-5Nq0zNzCGzez3fnW2yxW7zFx9B6k58Y4yb8P+hvpw@mail.gmail.com>
 <88a3fa09-60cb-bb3c-c392-286efd983627@collabora.com>
In-Reply-To: <88a3fa09-60cb-bb3c-c392-286efd983627@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 23 Feb 2023 10:43:50 +0800
Message-ID: <CAGXv+5H3XMF7ov_WfNFA=HC0frD003MRdVuBOFiBvu8zxE_rwg@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] dt-bindings: gpu: mali-bifrost: Add a compatible
 for MediaTek MT8186
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 22, 2023 at 5:13 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 22/02/23 09:37, Chen-Yu Tsai ha scritto:
> > On Tue, Feb 21, 2023 at 11:37 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Get GPU support on MT8186 by adding its compatible.
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >> ---
> >>   Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 +++++
> >>   1 file changed, 5 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> >> index be18b161959b..43a841d4e94d 100644
> >> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> >> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> >> @@ -15,6 +15,11 @@ properties:
> >>
> >>     compatible:
> >>       oneOf:
> >> +      - items:
> >> +          - enum:
> >> +              - mediatek,mt8186-mali
> >> +          - const: mediatek,mt8183b-mali
> >> +          - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
> >
> > The MT8186 has Mali-G52 MC2 2EE, while the MT8183 has Mali-G72 MP3.
>
> Keeping in mind the obvious - which is that G52 and G72 are both Bifrost....
>
> > So we actually need a new entry with two power domains.
> >
>
> ...This is my node for MT8186:
>
>                 gpu: gpu@13040000 {
>                         compatible = "mediatek,mt8186-mali",
>                                      "mediatek,mt8183b-mali",
>                                      "arm,mali-bifrost";
>                         reg = <0 0x13040000 0 0x4000>;
>
>                         clocks = <&mfgsys CLK_MFG_BG3D>;
>                         interrupts = <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH 0>,
>                                      <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH 0>,
>                                      <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH 0>;
>                         interrupt-names = "job", "mmu", "gpu";
>                         power-domains = <&spm MT8186_POWER_DOMAIN_MFG1>,
>                                         <&spm MT8186_POWER_DOMAIN_MFG2>,
>                                         <&spm MT8186_POWER_DOMAIN_MFG3>;
>                         power-domain-names = "core0", "core1", "core2";
>
>                         /* Please ignore speedbin, that's for another time :-) */
>                         nvmem-cells = <&gpu_volt_bin>;
>                         nvmem-cell-names = "speed-bin";
>                         #cooling-cells = <2>;
>                 };
>
> There are three MFG power domains... MFG2 and MFG3 are parents of MFG1, on that
> I agree, but we can avoid adding a new entry just for MT8186 and use the MT8183-b
> one while still being technically correct.
>
> Besides, Mali G52 and Mali G72 are both Bifrost... so I don't think that this
> commit is incorrect. For the sake of simplicity, I would push on getting this
> one picked.

I'm aware. In case it wasn't obvious, Mali-G52 MC2 2EE has 2 cores, while
Mali-G72 MP3 has 3 cores. I think that is reason enough to do a new entry.
Otherwise you are describing power domains for 3 cores for a GPU that only
has two.

> Unless there are any real-strong opinions against...

Yes.

ChenYu
