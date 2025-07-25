Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D91B11DC5
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 13:43:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4BB510E9DB;
	Fri, 25 Jul 2025 11:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="arVlR8n6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416C410E1BF
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 11:43:43 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-6fac7147cb8so27016986d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 04:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753443822; x=1754048622;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PlkE41QL6s4x1GqYESsGC6jimQ+2xKl71+VqMJsnR/Q=;
 b=arVlR8n6xx2CkSvoIHYWhV+9+OwkZLTIS3CEYUkfROkzS6aAUhdOYHIXJYt7cOVhVA
 NphAoG3jhKDVXfAGpb8m9a77plK95Kz7VE5M3TLuPW0oZtsk0FxEYNXjTLRe7T4XtD8s
 2vJwDiFj+PKJyFET9AuTVgjNJ9homPz1mggM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753443822; x=1754048622;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PlkE41QL6s4x1GqYESsGC6jimQ+2xKl71+VqMJsnR/Q=;
 b=iKMH9qXAeFAPRNvQzXwledqinGUMlNj35+cNqLjLB6Zn6TyKT+at+rMcKCpvE6g318
 btYXBzoXgEr0STnMOWwZtslwpuSXr/T7IIJhZwxtKf3iHCK6096uHHBeH1IdH9i+YrSH
 P8cOKYwUxxppJ0zX27x4d8InGs7Al5JpJRMLIaQ+vNv9cOKnXU0lVhBpujw8evE2dgDU
 iB+fNgFFm1nuWlIC6xsRwFqav6sIsisZNFju6zD6AYwM0SVjGqEBKN0cOphpoL3eMjjE
 9nrwgy4tE4l378G7sPj6rX+T8zEprc5Vpw8hNiTAlgnGnEU/M98+IJKfHrYqytd3UiVk
 /lLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2tBHH3QPBTyBU6+6e/OdDEcBC6lxPYtHI5xBmWZcKIZYilkgs9nDabcunZsPL5/K0QIEzOjvvjZk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNZtcpatw+KFoFKx77fCTnE96GHnHNi0Bt+HrJbZBLz3phDIe2
 m4QpdJdjTsYtkOT2dur1O+A3R09PrDxyeRAej3aKXfs05tKcn+eLmWkAuldS7scnsLmeOtMGRWU
 VlBbeJ86s
X-Gm-Gg: ASbGncud19mmKb3cl4lvKZr+Ho7LbcLKyr+3kgX4/efMrT1wiVqdDmCY977mRzAmdko
 CrtxknYuGyhk9F4TMv7aiB/br3hY6BHyhf5cM6y4j1qwfqbpGKNGjJQE80ZZQHT75TinzaY2m9R
 352oDmMh7cQDobYF3yN75Nkp6uIFlJX/DipoWrunBBAD35xtmEGJIjCwxgXThj7tiUEuFKyqeCr
 foOXiftTeX4RutnyOTam3YqQuxNh8pvkSZTlXX62aCAlHbuIU/OjxVqzOV1r1la8h0iuE6Sqsu9
 i9o1bQdnou+rXzEUUf1ww8bT4M8u4DDU/D0wfLm0Y7Y9lqqFpfoN5LpvCu96Oqz5rvarQO+iObB
 Tcjxbv3KVzRmXs1jQ7XaMwRP4AgpthpqfjlkMU32eA2bnxW0UIcyZ/MSJxQ==
X-Google-Smtp-Source: AGHT+IEbRawXYcMe2vfzXXqBKvVeXn/WXAR7CNrZcdhxNWHdEpPEjdai9yqlC4kYgdabrBrdwmfcOQ==
X-Received: by 2002:a05:6214:f66:b0:707:765:4041 with SMTP id
 6a1803df08f44-707205a6f6cmr23620736d6.23.1753443821802; 
 Fri, 25 Jul 2025 04:43:41 -0700 (PDT)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com.
 [209.85.219.42]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7070fc9e3b9sm25710506d6.61.2025.07.25.04.43.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 04:43:41 -0700 (PDT)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-707204de185so6116316d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 04:43:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVbJ4A1KmbW2SYL2sujLtYTtmDNWQFh07SO6PFKFNFsRS20SEiaRv61zaI7xXMz5+rkrXEzT82pANE=@lists.freedesktop.org
X-Received: by 2002:a05:6102:4a8f:b0:4e9:a2bd:b456 with SMTP id
 ada2fe7eead31-4fa3feb1976mr334393137.12.1753439957846; Fri, 25 Jul 2025
 03:39:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-39-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-39-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:38:40 +0800
X-Gmail-Original-Message-ID: <CAC=S1njc7_+EhDA_HrVsPfhYsrFEmeb5TQ55X+YOKE=NrpoCaA@mail.gmail.com>
X-Gm-Features: Ac12FXzORC58mPF_B982fHDjnhtiL_-5O2nAq5PI4bkUJDNwvq8vw0VlaVEnRW8
Message-ID: <CAC=S1njc7_+EhDA_HrVsPfhYsrFEmeb5TQ55X+YOKE=NrpoCaA@mail.gmail.com>
Subject: Re: [PATCH 38/38] arm64: dts: mediatek: mt8516-pumpkin: Fix machine
 compatible
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

On Thu, Jul 24, 2025 at 5:51=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> This devicetree contained only the SoC compatible but lacked the
> machine specific one: add a "mediatek,mt8516-pumpkin" compatible
> to the list to fix dtbs_check warnings.
>
> Fixes: 9983822c8cf9 ("arm64: dts: mediatek: add pumpkin board dts")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dts b/arch/arm64=
/boot/dts/mediatek/mt8516-pumpkin.dts
> index cce642c53812..3d3db33a64dc 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dts
> @@ -11,7 +11,7 @@
>
>  / {
>         model =3D "Pumpkin MT8516";
> -       compatible =3D "mediatek,mt8516";
> +       compatible =3D "mediatek,mt8516-pumpkin", "mediatek,mt8516";
>
>         memory@40000000 {
>                 device_type =3D "memory";
> --
> 2.50.1
>
>
