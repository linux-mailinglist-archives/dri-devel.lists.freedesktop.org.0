Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C410EB11E57
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 14:20:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E7410E206;
	Fri, 25 Jul 2025 12:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="m+3T9Hv1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C1D010E206
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 12:20:03 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-74931666cbcso1858584b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 05:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753446002; x=1754050802;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t63BOHgVickClQUeVRs7VclE4TnB0fFJ8koSEGsWT2s=;
 b=m+3T9Hv1OiraQqWirZl3eeZJob1ZqHSwkmOi5kv4ZD3z2nObuqinOW9ucIIe+EiYAU
 YJcdT8lr2ObG75zzQ5sueO1lByJ8n/3U4izw/YfFdkUFvSTSMNrfOHEQnnHQqwY0sgtk
 TUwreqQ1s2I5mBXeRwSLSCJJrf6dQXhpOPxLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753446002; x=1754050802;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t63BOHgVickClQUeVRs7VclE4TnB0fFJ8koSEGsWT2s=;
 b=ViX0cGkQDvWZjz3I2PX9fp38rAdXhJNraBiO3lGSVmO1HZndGaaXWGjgbvCrNjV4Mr
 sqq0xADzoCY7tGgBd66KWvCY7LVRX3VC1z6D1a+9QqgHHXPlcKaao4aefD8asOB3+Qmg
 63hEzoyxnpkd1tRXdPkP+dWAMngDhRUJxZ5yUi7P0GERb601ki8pd/0AH+lawIee72FD
 q8BkMvfT6cU2Sy6NGvJ0XL9Igjrp839gEibLtAcapWHfc1ZzEu+VNQkQTjLwLCHDE5iy
 tvS7JDFGKEoLwRfw+nmF1KlPYhCKoTE3jCwPg/M4SjrY9ogNpxaat43uYwf2nfs7M/f4
 M4rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHWOOjjJBX5chplHa6+c2xSFlND3R9yIZ2zA+lfm1LXcJo4XkT/5RqBk8QyIa3/6bW0InD6GvnASM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6vT5hnA7MWw/nqpcfhxAtebwwRbNF7n7KdFmo19HToezoysa5
 tX6Haq6ju7jv87ZAHolTTRYCIYR7HPkkuMvDeUwulibqeQtJMbltyt4kPQvz/ga0rWQm/Urvqhj
 JmiHzqQ==
X-Gm-Gg: ASbGncsPEA6XcjXYCfNieZ0Jf4i4dZiN9jaxmlQBW2C//rqU8iptY+Kjoj1XXjp3CjL
 abF4Saip5bduchNESjd98/R5ww+c0D31J/rd7F8rYvwLNlZ46ysQmzXBTSWPk4YAM+88yRjMUNJ
 PQdOExQHz0d01g6IQycfvwCqF/TRdnHvGJgvSemAlJ3nnOctp7p8YifqnFCR/nY8KRM6T1o0O89
 6RZupjg/sxzPhh2hz5mIGilT5m5DoG1HDKUCSJqDbSEC+ppl1xr10l2p8WMUQJBe6+NsKeeApzD
 O37auM56YU0SMR2X6XYrEeFTpIkScS2i+PwjDzUJ5wJvciBoGRoYeVL/7+9RpDpGZOC/LmGq55R
 m12TXTsVOOuxYvkb/uGRL7C0FQ29q3UrJaoMhHThzsBRVa+wgKRtEf3XDo1TOxrxNuoEukjLm
X-Google-Smtp-Source: AGHT+IGQve5yE4EhBQbUP7oKI2ZWp2qDoiH7UbpcKl9Bo9BZiFEw5KEowhmsEkgiLYtf5ZdymZkEPg==
X-Received: by 2002:a05:6a20:6a23:b0:233:f0c6:a8a4 with SMTP id
 adf61e73a8af0-23d701a8a06mr3297963637.31.1753446002492; 
 Fri, 25 Jul 2025 05:20:02 -0700 (PDT)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com.
 [209.85.214.173]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f6c08493asm3277079a12.1.2025.07.25.05.20.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 05:20:02 -0700 (PDT)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-23dc5bcf49eso26641005ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 05:20:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVPHsNWO2rqKP2z3j2gKZ1Fm/nudqBSElEy6FaKaKU42g/cIE3sRqsv8DhLOLu3+ZPl/TtbyHm3aC4=@lists.freedesktop.org
X-Received: by 2002:a05:6102:3053:b0:4e6:67f6:e9af with SMTP id
 ada2fe7eead31-4fa3fa71860mr256656137.9.1753440125688; Fri, 25 Jul 2025
 03:42:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-27-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-27-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:41:29 +0800
X-Gmail-Original-Message-ID: <CAC=S1ni_6YRK0RWheKZJDgCknaZzPsde0J4dFdmkNhY7HMMD+w@mail.gmail.com>
X-Gm-Features: Ac12FXwspafB6XO0s33DaaDCIfXTapXC0TbPbPDsXvwxpmO6Wfy_iIb8kWhO-Rk
Message-ID: <CAC=S1ni_6YRK0RWheKZJDgCknaZzPsde0J4dFdmkNhY7HMMD+w@mail.gmail.com>
Subject: Re: [PATCH 26/38] arm64: dts: mediatek: acelink-ew-7886cax: Remove
 unnecessary cells in spi-nand
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

On Thu, Jul 24, 2025 at 5:50=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> There is no need to specify #address-cells and #size-cells in a
> node that has only one non-addressable subnode, and this is the
> case of the flash@0 node in this devicetree, as it has only one
> "partitions" subnode.
>
> Remove those to suppress an avoid_unnecessary_addr_size warning.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts =
b/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
> index 08b3b0827436..30805a610262 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
> @@ -98,8 +98,6 @@ &spi0 {
>         flash@0 {
>                 compatible =3D "spi-nand";
>                 reg =3D <0>;
> -               #address-cells =3D <1>;
> -               #size-cells =3D <1>;
>                 spi-max-frequency =3D <52000000>;
>                 spi-rx-bus-width =3D <4>;
>                 spi-tx-bus-width =3D <4>;
> --
> 2.50.1
>
>
