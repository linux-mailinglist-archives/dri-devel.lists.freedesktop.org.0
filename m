Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E728B11DF1
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 13:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806C110E1BF;
	Fri, 25 Jul 2025 11:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="bIekI2BB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37BC10E1BF
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 11:52:36 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-4ab93f24dc3so37209711cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 04:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753444356; x=1754049156;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5hJBa13s79OQWhYLxMwSe1UwJVG9FUdchi7fOARwLxY=;
 b=bIekI2BBYu8kMtcuC4ejTi7lc2baH8NAyoV51CF0Qpqj/2jsnqJFTV9eymHXnKFA0l
 4zsg6x4xwhCH8YPvkGd1wi5457Nw+Jrn5udwJEEkrS08+4ID9hazLqFa6xucuU4CkU5/
 h2dbskR7IhIhnIUZTlnFzaSvFNMBjbcdoqbks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753444356; x=1754049156;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5hJBa13s79OQWhYLxMwSe1UwJVG9FUdchi7fOARwLxY=;
 b=knesaSpk4SGs10uxvBLmOZ36xR3/JPOLnxgTYmuA36wPDZQF8xLC/gaOBPePxxXD6f
 ZjkOeGuoUOIS+OBsZvaFNa402Mbtqit6K9upHTUWqq3XZ9xupTBV5GL7IHrOzd8+ECtD
 hLA6i0CbTQWvcjJVg4QkjrQz33jYd+f/aPuSGmvbm9UgxQB5H8QXFSws7OL2psjE+nE8
 /pdXF9uXeCM9y+Ppxbb5rx4sBP9DNkaf+uTf2cfkxeqWAtjHsFegjVfcuGpUf7ZGtitq
 VCsdp7cpO0dkNKp+yVJw1b1DZnqdcGbnsUXcUOv6rAHaM8jUA+btSeIUMvlT6tejsTU4
 wLdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUibfOaGRUA6lx1fGs2hdy/S6PJcFdgtonW0GQzJZAvahLJpmJ4K1b5uew7Hdb4WfNioB5ZiJDdJm8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHjVdhDqC+Ru5Gy9LnDboLKEqIJDNjV0aBSGInKgMVL3xrNH98
 lVoBwdGxMFFSC4KKo9KTxEzQBQMMaSU5zfH8uUFF0S9ViIP5DJiFbJbehv26kG54MbSTYQUrlxV
 LySo=
X-Gm-Gg: ASbGncs8c3NZ4TK41KtOyoWbXj/yYMeBCKpspRgIGskzNDGhaxiTGfYBRkbz0OHonfg
 iuhWneLhdthn78RZyjfaDCKIRmYC4KW1AWwVi3a815va0wspJhxDJc9alAphxTBWSj5/IJJay/4
 2np4mNNOuldsqml42dp+pY3bq6EZrArQK7zkdtkyBLQjchMx4pfzCYqMVbRVgeC21U6uNAJ1PVT
 B7tdwuGRCkk9zQbiu+PL8hWQytXbIxSOS1/lgMz9MqJpxe0MWnZGnkWbDxRHtjfIwy3UoXAPyOG
 GBEY5Oke/iYc24osk8lHaTgMmJAYXxG4xXFtnrl8dv06g2Hv8xPi649QW0MStlTpyPEKH54EDwQ
 nBoY9oVoSLhvVUjFKOm3l7kvsi+safeCOdfhHt+NVqZi4n51ajZo9BRPlCw6e5w==
X-Google-Smtp-Source: AGHT+IGgplAjFGwUhoGMUG5/NRU+bLzleL9Bx0E05a7LWrzmvxlJJ79zHKyNYD+/utKEuRI7N7wRnQ==
X-Received: by 2002:a05:622a:1654:b0:4ab:7e22:8553 with SMTP id
 d75a77b69052e-4ae8ef89ebfmr14786611cf.12.1753444355421; 
 Fri, 25 Jul 2025 04:52:35 -0700 (PDT)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com.
 [209.85.222.172]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7070fc9f711sm25711636d6.63.2025.07.25.04.52.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 04:52:35 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-7e62a1cbf81so287335185a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 04:52:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWqZe033w8KXt/mJHLyOAp6W5iC01PXJtGRlqBNwHZK9Rs1Go8Rau5y6JawIsRH4RXGk0bkkvL0C1g=@lists.freedesktop.org
X-Received: by 2002:a05:6102:6891:b0:4dd:b82d:e0de with SMTP id
 ada2fe7eead31-4fa3ff44195mr316348137.17.1753440787376; Fri, 25 Jul 2025
 03:53:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-20-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-20-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:52:31 +0800
X-Gmail-Original-Message-ID: <CAC=S1nguRWyG3ubmSFE95_zgsCjjq4dxGWr5ErV9-Yu2+mTmpw@mail.gmail.com>
X-Gm-Features: Ac12FXzhNEGCOc6TL2wVpoG5kEXhC599YdNWu941VvXlO0dL7_W9Jc4if8EyMHA
Message-ID: <CAC=S1nguRWyG3ubmSFE95_zgsCjjq4dxGWr5ErV9-Yu2+mTmpw@mail.gmail.com>
Subject: Re: [PATCH 19/38] arm64: dts: mediatek: mt6795: Add mediatek, infracfg
 to iommu node
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
 daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, 
 linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, 
 linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, 
 herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, 
 andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, 
 chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, 
 p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, 
 kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, 
 tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, 
 broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, 
 matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, 
 linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, 
 sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, 
 andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, 
 lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, 
 tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, 
 linux-media@vger.kernel.org, davem@davemloft.net
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 24, 2025 at 5:49=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The "M4U" IOMMU requires a handle to the infracfg to switch to
> the 4gb/pae addressing mode: add it.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt6795.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt6795.dtsi
> index e5e269a660b1..38f65aad2802 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> @@ -427,6 +427,7 @@ iommu: iommu@10205000 {
>                         clocks =3D <&infracfg CLK_INFRA_M4U>;
>                         clock-names =3D "bclk";
>                         interrupts =3D <GIC_SPI 146 IRQ_TYPE_LEVEL_LOW>;
> +                       mediatek,infracfg =3D <&infracfg>;
>                         mediatek,larbs =3D <&larb0 &larb1 &larb2 &larb3>;
>                         power-domains =3D <&spm MT6795_POWER_DOMAIN_MM>;
>                         #iommu-cells =3D <1>;
> --
> 2.50.1
>
>
