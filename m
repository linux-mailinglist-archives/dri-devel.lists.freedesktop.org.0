Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0793911FC
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86726E499;
	Wed, 26 May 2021 08:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D656E499
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:08:29 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id z17so70204wrq.7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yVcIsLaop0xFTxRezXJ3MSLuEhLYr+XKBNJbxOwir5s=;
 b=WYbaBVSv16q5MTWMzaif39kIsCho53bHWXwf9Z/KMlYAAxCZtALxyQhWH7Gg2eWYd7
 6nIhK9oO6tCBAo0juIZBBzEjU9QtK64YV6Azt2YNR9VGCRWQx1lrkX9agrTnGVlRgrm9
 2L0hOPcam6w7yvn7vfkiNshrSVNvUNPYw5tRd5UvKNQ/eTdNhO+UIPFdy+wzBGHK1zKf
 pMBmBj8Fmq6Z1i1B19jl3skq2f//GGGJ/dFr5YkSnFvA9pyH6H2NjU+/QFvFSDZCmawD
 wMYJ3tL5Sz1ifLpT2cbzTnLzdnoLMICiKJIRQx7o6Yx9zM4Ppfa9XTfAy/B9Wrg5bNqN
 Uy7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yVcIsLaop0xFTxRezXJ3MSLuEhLYr+XKBNJbxOwir5s=;
 b=mneQYAKML8I4yq58DLlwI1D5TbWl8qkrb2/ycTeXvb7JMOHaNuxqLgVRPv7WOmSOBm
 tazzlL+Tq7caBYiufaOtePftXAlwc5s/R1BAfbDH2CLiZ0+gsDK/lVOylVWnV5N0aQM+
 NuO8WWEfY9PglXBnQpciAyLfC/5LWodzR/rlYehKEk7vSIZUBwd6mnFZC1Ytm2moNzIl
 xHzNSbgKLrfMFGmQsrDHfjk5wyTYzxdQa82cwAlJddAMUg0eNYpT3tHLKCAcSzVe1d1R
 pOehM5Mpt/OFRaxfXLdnrtn9jQAHRpkPB9jzRs0X2Q6KyEWO3ar3QxBBQNa+m1w99XXN
 r8fQ==
X-Gm-Message-State: AOAM5307L8P0SfEjC1Q9WrujKPofvvC2/Am8JPidZsYGQJv4EBbaJJyr
 u5vHOfXohTrpbUknSI0Y50nS8IRmJsNM5zygdBI=
X-Google-Smtp-Source: ABdhPJzpuvOh0m7CXA37jLlei4+4VCuO9+LSYcUU5crIHmY5LaVh8NoHsVAadYTaqLaToEjoFwwVSXWkbmaHkBcqU40=
X-Received: by 2002:a5d:43cb:: with SMTP id v11mr1351884wrr.198.1622016508091; 
 Wed, 26 May 2021 01:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210425123607.26537-1-kevin3.tang@gmail.com>
 <20210425123607.26537-5-kevin3.tang@gmail.com>
 <20210430092249.n75to2das5m6p4zb@gilmour>
 <CAFPSGXYJxWJDo1cz+kJB8J9YayGx1hYa=04K5OJ3DHh9ifbuRQ@mail.gmail.com>
 <YKI26bZGAA+ZNLLj@8bytes.org> <bc0e3025-60bd-c6b4-117f-592dc1c1a2f0@arm.com>
 <CAAfSe-ughdeZ7YaVsXuWeGNq-+Q+_z+P=aeKpj957kE6d-hLmQ@mail.gmail.com>
In-Reply-To: <CAAfSe-ughdeZ7YaVsXuWeGNq-+Q+_z+P=aeKpj957kE6d-hLmQ@mail.gmail.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Wed, 26 May 2021 16:07:51 +0800
Message-ID: <CAAfSe-sRjSw=7vAX21OPL5+OfLXJNS9RNf8Lg5Hy56LZwPBwCA@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] drm/sprd: add Unisoc's drm display controller
 driver
To: Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Kevin Tang <kevin3.tang@gmail.com>, David Airlie <airlied@linux.ie>,
 Joerg Roedel <joro@8bytes.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Orson Zhai <orsonzhai@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

resend for switching to plain text mode.

On Wed, 26 May 2021 at 15:59, Chunyan Zhang <zhang.lyra@gmail.com> wrote:
>
> Hi Robin,
>
> On Tue, 18 May 2021 at 00:35, Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> On 2021-05-17 10:27, Joerg Roedel wrote:
>> > On Fri, Apr 30, 2021 at 08:20:10PM +0800, Kevin Tang wrote:
>> >> Cc  Robin & Joerg
>> >
>> > This is just some GPU internal MMU being used here, it seems. It doesn=
't
>> > use the IOMMU core code, so no Ack needed from the IOMMU side.
>>
>> Except the actual MMU being used is drivers/iommu/sprd_iommu.c - this is
>
> Yes, it is using drivers/iommu/sprd_iommu.c.
>
>>
>>
>> just the display driver poking directly at the interrupt registers of
>> its associated IOMMU instance.
>
>
> Actually the display driver is poking its own interrupt registers in whic=
h some interrupts are caused by using IOMMU, others are purely its own ones=
:
> +/* Interrupt control & status bits */
> +#define BIT_DPU_INT_DONE               BIT(0)
> +#define BIT_DPU_INT_TE                 BIT(1)
> +#define BIT_DPU_INT_ERR                        BIT(2)
> +#define BIT_DPU_INT_UPDATE_DONE                BIT(4)
> +#define BIT_DPU_INT_VSYNC              BIT(5)
> +#define BIT_DPU_INT_MMU_VAOR_RD                BIT(16)
> +#define BIT_DPU_INT_MMU_VAOR_WR                BIT(17)
> +#define BIT_DPU_INT_MMU_INV_RD         BIT(18)
> +#define BIT_DPU_INT_MMU_INV_WR         BIT(19)
>
> From what I see in the product code, along with the information my collea=
gues told me, these _INT_MMU_ interrupts only need to be dealt with by clie=
nt devices(i.e. display). IOMMU doesn't even have the INT_STS register for =
some early products which we're trying to support in the mainstream kernel.
>
>>
>> I still think this is wrong, and that it
>> should be treated as a shared interrupt, with the IOMMU driver handling
>> its own registers and reporting to the client through the standard
>> report_iommu_fault() API, especially since there are apparently more
>> blocks using these IOMMU instances than just the display.
>
> For the next generation IOMMU, we will handle interrupts in IOMMU drivers=
 like you say here.
> But like I explained above, we have to leave interrupt handling in the cl=
ient device driver since the IOMMU we 're using in this display device does=
n't have an INT_STS register in the IOMMU register range.
>
> Thanks for the review,
> Chunyan
>
>>
>> Robin.
