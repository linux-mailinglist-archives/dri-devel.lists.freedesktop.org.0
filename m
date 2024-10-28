Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8129B2E20
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 12:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E629110E346;
	Mon, 28 Oct 2024 11:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="m9kq2bDJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874ED10E346
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 11:08:58 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id
 a1e0cc1a2514c-84fc0209e87so1059071241.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 04:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1730113737; x=1730718537;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ANRl9fyJhN3L3pKsYoqtRh0fyM37Mr+toNEHHpk2z1g=;
 b=m9kq2bDJL9WVqamWQD/h3MhnMGBx6vDxNTge1iOuLitY18ZiAqNFYloxQsFCiGFCmL
 gwfnd5HbVoYhb3CPaQcFyvBpueIFAaU7FAuqVIMCIFytHQ7FdZs8NfkQBMn13zJ4l/EN
 48p5icDNhnnnJrAL7tECi8QwhKJZB/6VXwSX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730113737; x=1730718537;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ANRl9fyJhN3L3pKsYoqtRh0fyM37Mr+toNEHHpk2z1g=;
 b=qefoNNRIn2053vgwcHXLSkX9mS0OhCQ7h+3NmGP21Hbvqd8LA0HQrs8Ioz3n9FaCp8
 3zW+YWclZWXItenEetenabyc8dlwybvMBuo3PVIGbJ1FZq7/68S+prRSkiNGUAPmpXxD
 ARwcwAUkzP8VrmzUfS0CKeGlfXR97Gr/nIbUSz/4oMOH0ucwF+zb2CWO5VwufoAQK7FI
 7Iip0vdEkOInQwD96ZcYoG03+rzZOqbXck1Y3OMk40/NobLjq7TAE6pdhS574hA1UXQ1
 8jfVJr16Pbxu+5/RA4NPP66R+K74/vJKqV7Qj9KyU2BEDF0V0A6zzqSf7SUw1LpLGpHW
 YQ6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnYsq+jLSkNYnw9tZ8IIlHzHb0Un+RPsJQUnhZwu5718QOQm6FRKTIrRLqfSBXEEUHS0yBJr/q7as=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNW1Z38v4waNN5fuGXtMuYj9EBE0nmFveLULseoJ+q0iJM4dbp
 yzXtYGutvLMgvduKTb2sc6N1mOc9O3rb4w8WQBsBJwpLvebx9eYUlzYN8rjm2s/idz7/jQ7irlQ
 =
X-Google-Smtp-Source: AGHT+IH+1oW9m37C74p1FzHGvzYneMLHu8mcnkPkC7Q65bgU2OU5cSrzEVnZg6elGaul5WoSH2b/Wg==
X-Received: by 2002:a05:6102:3e82:b0:4a7:4972:2ed6 with SMTP id
 ada2fe7eead31-4a8cfd711fdmr5409571137.28.1730113736863; 
 Mon, 28 Oct 2024 04:08:56 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com.
 [209.85.221.173]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4a8c4ef9f47sm1084883137.0.2024.10.28.04.08.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 04:08:55 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id
 71dfb90a1353d-50d3d2d0775so1283355e0c.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 04:08:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUMetHmRPjEfMOdWhEuiYdvGU0v3q5HG6aMosaFvkHoUFP0UA1+F9Q9XB8ie6JdUca6Lmi/K3nT21k=@lists.freedesktop.org
X-Received: by 2002:a05:6122:2a41:b0:50d:5f75:f7d9 with SMTP id
 71dfb90a1353d-51015109f5dmr4172633e0c.9.1730113723870; Mon, 28 Oct 2024
 04:08:43 -0700 (PDT)
MIME-Version: 1.0
References: <20241025104310.1210946-1-fshao@chromium.org>
 <5vjaxo652w5hici5hxi3t6o2r5vkggrz25lqvm3or5fip3svke@fttqk5wabxqb>
In-Reply-To: <5vjaxo652w5hici5hxi3t6o2r5vkggrz25lqvm3or5fip3svke@fttqk5wabxqb>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 28 Oct 2024 19:08:05 +0800
X-Gmail-Original-Message-ID: <CAC=S1ng7zRR-Ek1AQ7W6DhhB82=yVpMZq6JfzPEbWWb67knCVg@mail.gmail.com>
Message-ID: <CAC=S1ng7zRR-Ek1AQ7W6DhhB82=yVpMZq6JfzPEbWWb67knCVg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: mediatek: dp: Add #sound-dai-cells
 property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Jitao shi <jitao.shi@mediatek.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
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

On Mon, Oct 28, 2024 at 4:52=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Oct 25, 2024 at 06:42:45PM +0800, Fei Shao wrote:
> > The MediaTek DP hardware supports audio, and the "#sound-dai-cells"
> > property is required to describe DAI links and audio routing.
> >
> > Add "#sound-dai-cells" property to the binding and filter out non-DP
> > compatibles, as MediaTek eDP doesn't support audio.
> >
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> > ---
> >
> >  .../bindings/display/mediatek/mediatek,dp.yaml   | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediate=
k,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.=
yaml
> > index 2aef1eb32e11..c05c2b409780 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.ya=
ml
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.ya=
ml
> > @@ -42,6 +42,9 @@ properties:
> >    interrupts:
> >      maxItems: 1
> >
> > +  "#sound-dai-cells":
> > +    const: 0
> > +
> >    ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> >      properties:
> > @@ -87,6 +90,19 @@ required:
> >
>
> You need to reference dai-common instead, since this is DAI.

I'll add that. And if I understand your feedback in another patch
correctly, I assume I need to reference dai-common and also keep the
original #sound-dai-cells lines for the number of DAIs, so I'll keep
that. Please correct me if I'm wrong.

>
> >  additionalProperties: false
>
> and this becomes unevaluatedProperties: false

Acknowledged.

Regards,
Fei

>
> Best regards,
> Krzysztof
>
