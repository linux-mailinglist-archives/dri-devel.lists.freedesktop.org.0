Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC19C822CC
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 19:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58EAC10E1EC;
	Mon, 24 Nov 2025 18:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jaJZZFHd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B56310E1EC
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 18:54:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4501A44410
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 18:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E0FC2BCB3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 18:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764010458;
 bh=TEK7y+I345Za9ATxX+knyA/Uh489WPY9Dd1JCZP1I5g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jaJZZFHd9EbEwx/HXqWrnJzLLWTmDsjeCYIq0msXegrh1uOLQsYkLcGsOqDhYGYa1
 ulVE7WOFxgFtpE2/6TkwNTfV+9Rh0FSoTOohVIha1MYp1K5u2GOOF4aS+plyAfBAle
 vAZP1pWHSc2BhkypnD2nz0a3oVcYZoWGxiPrhyCwtfso6TjC0ca6YjyLVtMdloPCZj
 YjsoUkmPkN4DfXzzlBmRG07pBRUjbMkoJH5hAhMxXKO6mhdkj9L8ykHTsvk6JpcSId
 e4dHeGWi1OOrSvjb2TfH3swea0z/yg8jzYuM1iQ+XmmH3i9ds4f6wja6p20TfYTyKh
 Wz2iE90nWxrRA==
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-64198771a9bso8323542a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 10:54:18 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUcA4Y2aHqHDy2zD7Aq3d4YI9GW6bf5BVC0+gSoKkoA4HGecpDVDQjXoCA/UoafRCkPVWhaRWUXKNI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtgoAIUZfUbyIjtMtNz7JdzaONPu/aBlTCYIx5CV7kqrZfyMPB
 G8XReNV+A7nNnGPCxM4dmz0xul/wSpFfFmrl8rYviC3dqsJi109kRKyfI6eLob3IUZIUsw4R8Aw
 Fs9PO2PrrbzlcG2zCQk2d4X7IFlY2KQ==
X-Google-Smtp-Source: AGHT+IFReAtDFuSFDhp918Ohx2vHaiN5KlMAX/uodATZY6O/YB75rQVqkELqtwQbH271c/8FxbJ2Dkum3f0Uu3OWMzM=
X-Received: by 2002:a05:6402:5252:b0:643:4e9c:d166 with SMTP id
 4fb4d7f45d1cf-6455443ed4cmr10891528a12.8.1764010456224; Mon, 24 Nov 2025
 10:54:16 -0800 (PST)
MIME-Version: 1.0
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-4-ariel.dalessandro@collabora.com>
 <20250912140619.GA1293647-robh@kernel.org>
 <fb20e4fe-df0a-4089-a7cf-e82bfe1f8e00@collabora.com>
In-Reply-To: <fb20e4fe-df0a-4089-a7cf-e82bfe1f8e00@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 24 Nov 2025 12:54:04 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+eeiw9oaqQPWt2=rZSX98Pak_oB=tfQFvEehwLZ=S52g@mail.gmail.com>
X-Gm-Features: AWmQ_blUF-g1qhHGkKsa6U6HY_V7mtf4Q-WkpVuhZVm09t2HSWt6-IOrweXVTPs
Message-ID: <CAL_Jsq+eeiw9oaqQPWt2=rZSX98Pak_oB=tfQFvEehwLZ=S52g@mail.gmail.com>
Subject: Re: [PATCH v2 03/12] dt-bindings: net: Convert Marvell 8897/8997
 bindings to DT schema
To: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch, 
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com, 
 broonie@kernel.org, chunkuang.hu@kernel.org, conor+dt@kernel.org, 
 davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com, 
 flora.fu@mediatek.com, heiko@sntech.de, houlong.wei@mediatek.com, 
 jeesw@melfas.com, kernel@collabora.com, krzk+dt@kernel.org, kuba@kernel.org, 
 lgirdwood@gmail.com, linus.walleij@linaro.org, 
 louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com, 
 maarten.lankhorst@linux.intel.com, marcel@holtmann.org, 
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com, 
 mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com, 
 sean.wang@kernel.org, simona@ffwll.ch, support.opensource@diasemi.com, 
 tiffany.lin@mediatek.com, tzimmermann@suse.de, yunfei.dong@mediatek.com, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
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

On Wed, Oct 1, 2025 at 12:28=E2=80=AFPM Ariel D'Alessandro
<ariel.dalessandro@collabora.com> wrote:
>
> Rob,
>
> On 9/12/25 11:06 AM, Rob Herring wrote:
> > On Thu, Sep 11, 2025 at 12:09:52PM -0300, Ariel D'Alessandro wrote:
> >> Convert the existing text-based DT bindings for Marvell 8897/8997
> >> (sd8897/sd8997) bluetooth devices controller to a DT schema.
> >>
> >> While here:
> >>
> >> * bindings for "usb1286,204e" (USB interface) are dropped from the DT
> >>    schema definition as these are currently documented in file [0].
> >> * DT binding users are updated to use bluetooth generic name
> >>    recommendation.
> >>
> >> [0] Documentation/devicetree/bindings/net/btusb.txt
> >>
> >> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> >> ---
> >>   .../net/bluetooth/marvell,sd8897-bt.yaml      | 79 +++++++++++++++++=
+
> >>   .../devicetree/bindings/net/btusb.txt         |  2 +-
> >>   .../bindings/net/marvell-bt-8xxx.txt          | 83 -----------------=
--
> >
> >>   .../dts/rockchip/rk3288-veyron-fievel.dts     |  2 +-
> >>   .../boot/dts/rockchip/rk3288-veyron-jaq.dts   |  2 +-
> >>   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  2 +-
> >
> > .dts files should be separate patches. Please send the bindings patches
> > separately per subsystem so subsystem maintainers can apply them. All
> > the Mediatek dts changes can be 1 series.
>
> Ack, will fix in v3.

Are you going to send v3 still?

Rob
