Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6D2A8B9A1
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 14:54:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D6E10E8EC;
	Wed, 16 Apr 2025 12:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XgxN7RF6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458CF10E8EC
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 12:54:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D6894A4971A
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 12:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA6B6C4CEED
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 12:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744808056;
 bh=comiGzp0yJ4uJILmejSmpCuv8WNkCrKJ9fiuAA5Eobw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XgxN7RF6ckFVEbhTn4I+sUZDqecs+mp3hGbLLci+Upkk2MPH7CIQvlQFKOyjI4/3P
 nGB24udzu5O62ORPQlrRwyyGveOHGDOrMF38yJfdtVsFhOZ8wLNu7luUFZqyLvsVOU
 6lkI1ew3WMP9j5VUysZEDaKWSUyImO63a14HdAbC+GHfk49ZspnHGRcdMvil/jTsjP
 AZ7OhS/a8bSP43LawW46zSOqSlkawiBkad4nxwPsBjJNhSIhgv5X0vLfdE2iz3QE7X
 NxVajwcnP/1YaLNgnD5Yuc9Y3/EqUo2z2Mp5X+QRlMaVXqeEVUsZwUaB+eRqr6L+Lv
 P8iQx/wPt2Kow==
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-ac2af2f15d1so861895866b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 05:54:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUBf4rwvyxSytgRfmVfQrVZ/GOftrG4OcM1R7I0a2ygIZtDYGa6T44ZzV76Ab8um3AZeDM3PIWrzps=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzfmGDR9t+mRXJncnrCps/FS2F0WE6z54Wtx//TXvU5yYPmAZR
 hn0VqyIkyYSSsWqyaAxNoChmn2ULZhbUh07iUDzotIksn0tWPot5ZgFj/tvtlMJ9F6kpkWd7Q2U
 di3w1jtadlkay/VV7wuI3OYM37w==
X-Google-Smtp-Source: AGHT+IHKUgTFGckVUkYUIXHvq2dBr0rCYxoZR8dZi86QjoaRiJl8+SbX5WOjSc7+LpPbHbXBjdpbz7ajUIvfSATF50o=
X-Received: by 2002:a17:907:2da5:b0:ac4:751:5f16 with SMTP id
 a640c23a62f3a-acb429e409fmr172840366b.30.1744808055323; Wed, 16 Apr 2025
 05:54:15 -0700 (PDT)
MIME-Version: 1.0
References: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
 <174470268964.14740.2655102858243748239.b4-ty@collabora.com>
In-Reply-To: <174470268964.14740.2655102858243748239.b4-ty@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 16 Apr 2025 07:54:03 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKZN6PxsThZtcCBLaLKgC2Dd1kxfgWhK6RK8DxY6_2X0g@mail.gmail.com>
X-Gm-Features: ATxdqUFMIZ7R44fK-lMlhaa-MPGGZB7R6M_caVCgAn6SeZBUMV0t64nOdSZ5Dr4
Message-ID: <CAL_JsqKZN6PxsThZtcCBLaLKgC2Dd1kxfgWhK6RK8DxY6_2X0g@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] MediaTek MT8188 MDP3 Enablement
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, krzk+dt@kernel.org, conor+dt@kernel.org, 
 mchehab@kernel.org, matthias.bgg@gmail.com, moudy.ho@mediatek.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, sebastian.fricke@collabora.com, 
 macpaul.lin@mediatek.com
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

On Tue, Apr 15, 2025 at 2:38=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On Wed, 18 Dec 2024 11:53:17 +0100, AngeloGioacchino Del Regno wrote:
> > This series adds the necessary bindings and devicetree nodes to enable
> > the entire Multimedia Data Path 3 (MDP3) macro-block, found in MediaTek=
's
> > MT8188 SoC.
> >
> > This was tested on a MediaTek Genio 700 EVK board.
> >
> > AngeloGioacchino Del Regno (3):
> >   dt-bindings: display: mediatek: Add compatibles for MT8188 MDP3
> >   dt-bindings: media: mediatek: mdp3: Add compatibles for MT8188 MDP3
> >   arm64: dts: mediatek: mt8188: Add all Multimedia Data Path 3 nodes
> >
> > [...]
>
> Applied to v6.15-next/dts64, thanks!
>
> [1/3] dt-bindings: display: mediatek: Add compatibles for MT8188 MDP3
>       commit: 2971de063fa56c18b2720ab19bdebca23cd96471
> [2/3] dt-bindings: media: mediatek: mdp3: Add compatibles for MT8188 MDP3
>       commit: cfb00dfa1b778a8037faf6973cca226e5ad4f45a
> [3/3] arm64: dts: mediatek: mt8188: Add all Multimedia Data Path 3 nodes
>       commit: f0935480253ede5405045a4e733f4476343cbb91

A couple of warnings added with this:

     33 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
     33 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match
any of the regexes: 'pinctrl-[0-9]+'
     33 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any
of the regexes: 'pinctrl-[0-9]+'
     33 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required pro=
perty
     33 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional
failed, one must be fixed:
     33 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any
of the regexes: 'pinctrl-[0-9]+'
     33 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any
of the regexes: 'pinctrl-[0-9]+'
     33 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one
must be fixed:
     33 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one
must be fixed:
     11 (mediatek,mt8188-mdp3-tcc): 'power-domains' does not match any
of the regexes: 'pinctrl-[0-9]+'
     11 (mediatek,mt8188-mdp3-ovl): 'oneOf' conditional failed, one
must be fixed:
     11 (mediatek,mt8188-mdp3-ovl): 'iommus' is a required property
      8 (mediatek,mt8188-mdp3-rdma): clocks: [[51, 12], [46, 186],
[46, 191]] is too long
      8 (mediatek,mt8188-mdp3-rdma): clocks: [[51, 10], [46, 186],
[46, 191]] is too long
      8 (mediatek,mt8188-mdp3-rdma): clocks: [[50, 12], [45, 186],
[45, 191]] is too long
      8 (mediatek,mt8188-mdp3-rdma): clocks: [[50, 10], [45, 186],
[45, 191]] is too long
      8 (mediatek,mt8188-mdp3-rdma): clocks: [[49, 24], [46, 185],
[46, 190], [49, 4], [49, 41], [49, 42], [49, 7], [51, 41], [51, 42],
[49, 8]] is too long
      8 (mediatek,mt8188-mdp3-rdma): clocks: [[48, 24], [45, 185],
[45, 190], [48, 4], [48, 41], [48, 42], [48, 7], [50, 41], [50, 42],
[48, 8]] is too long
      4 (mediatek,mt8188-mdp3-rsz): clocks: [[51, 24], [51, 25]] is too lon=
g
      4 (mediatek,mt8188-mdp3-rsz): clocks: [[51, 20], [51, 21]] is too lon=
g
      4 (mediatek,mt8188-mdp3-rsz): clocks: [[50, 24], [50, 25]] is too lon=
g
      4 (mediatek,mt8188-mdp3-rsz): clocks: [[50, 20], [50, 21]] is too lon=
g
      4 (mediatek,mt8188-mdp3-rdma): power-domains: [[67, 15], [67,
20]] is too long
      4 (mediatek,mt8188-mdp3-rdma): power-domains: [[66, 15], [66,
20]] is too long
      2 (mediatek,mt8188-mdp3-rdma): mboxes: [[121, 13, 1], [121, 14,
1], [121, 16, 1], [121, 21, 1]] is too short
      2 (mediatek,mt8188-mdp3-rdma): mboxes: [[120, 13, 1], [120, 14,
1], [120, 16, 1], [120, 21, 1]] is too short
      2 (mediatek,mt8188-mdp3-rdma): mboxes: [[119, 13, 1], [119, 14,
1], [119, 16, 1], [119, 21, 1]] is too short
      2 (mediatek,mt8188-mdp3-rdma): mboxes: [[118, 13, 1], [118, 14,
1], [118, 16, 1], [118, 21, 1]] is too short
      2 (mediatek,mt8188-mdp3-rdma): iommus: [[132, 164], [132, 166]]
is too long
      2 (mediatek,mt8188-mdp3-rdma): iommus: [[131, 164], [131, 166]]
is too long
      2 (mediatek,mt8188-mdp3-rdma): iommus: [[130, 164], [130, 166]]
is too long
      2 (mediatek,mt8188-mdp3-rdma): iommus: [[129, 164], [129, 166]]
is too long
      2 (mediatek,mt8188-mdp3-rdma): iommus: [[122, 192], [122, 194]]
is too long
      2 (mediatek,mt8188-mdp3-rdma): iommus: [[122, 128], [122, 131]]
is too long
      2 (mediatek,mt8188-mdp3-rdma): iommus: [[121, 192], [121, 194]]
is too long
      2 (mediatek,mt8188-mdp3-rdma): iommus: [[121, 128], [121, 131]]
is too long
      2 (mediatek,mt8188-mdp3-rdma): iommus: [[120, 192], [120, 194]]
is too long
      2 (mediatek,mt8188-mdp3-rdma): iommus: [[120, 128], [120, 131]]
is too long
      2 (mediatek,mt8188-mdp3-rdma): iommus: [[119, 192], [119, 194]]
is too long
      2 (mediatek,mt8188-mdp3-rdma): iommus: [[119, 128], [119, 131]]
is too long
      2 (mediatek,mt8188-mdp3-rdma): clocks: [[44, 12], [39, 186],
[39, 191]] is too long
      2 (mediatek,mt8188-mdp3-rdma): clocks: [[44, 10], [39, 186],
[39, 191]] is too long
      2 (mediatek,mt8188-mdp3-rdma): clocks: [[42, 24], [39, 185],
[39, 190], [42, 4], [42, 41], [42, 42], [42, 7], [44, 41], [44, 42],
[42, 8]] is too long
      2 (mediatek,mt8188-mdp3-rdma): clocks: [[42, 12], [37, 186],
[37, 191]] is too long
      2 (mediatek,mt8188-mdp3-rdma): clocks: [[42, 10], [37, 186],
[37, 191]] is too long
      2 (mediatek,mt8188-mdp3-rdma): clocks: [[40, 24], [37, 185],
[37, 190], [40, 4], [40, 41], [40, 42], [40, 7], [42, 41], [42, 42],
[40, 8]] is too long
      2 (mediatek,mt8188-mdp3-rdma): clocks: [[38, 12], [34, 186],
[34, 191]] is too long
      2 (mediatek,mt8188-mdp3-rdma): clocks: [[38, 10], [34, 186],
[34, 191]] is too long
      2 (mediatek,mt8188-mdp3-rdma): clocks: [[42, 24], [39, 185],
[39, 190], [42, 4], [42, 41], [42, 42], [42, 7], [44, 41], [44, 42],
[42, 8]] is too long
      2 (mediatek,mt8188-mdp3-rdma): clocks: [[42, 12], [37, 186],
[37, 191]] is too long
      2 (mediatek,mt8188-mdp3-rdma): clocks: [[42, 10], [37, 186],
[37, 191]] is too long
      2 (mediatek,mt8188-mdp3-rdma): clocks: [[40, 24], [37, 185],
[37, 190], [40, 4], [40, 41], [40, 42], [40, 7], [42, 41], [42, 42],
[40, 8]] is too long
      2 (mediatek,mt8188-mdp3-rdma): clocks: [[38, 12], [34, 186],
[34, 191]] is too long
      2 (mediatek,mt8188-mdp3-rdma): clocks: [[38, 10], [34, 186],
[34, 191]] is too long
      2 (mediatek,mt8188-mdp3-rdma): clocks: [[36, 24], [34, 185],
[34, 190], [36, 4], [36, 41], [36, 42], [36, 7], [38, 41], [38, 42],
[36, 8]] is too long
      1 (mediatek,mt8188-mdp3-rsz): clocks: [[44, 24], [44, 25]] is too lon=
g
      1 (mediatek,mt8188-mdp3-rsz): clocks: [[44, 20], [44, 21]] is too lon=
g
      1 (mediatek,mt8188-mdp3-rsz): clocks: [[42, 24], [42, 25]] is too lon=
g
      1 (mediatek,mt8188-mdp3-rsz): clocks: [[42, 20], [42, 21]] is too lon=
g
      1 (mediatek,mt8188-mdp3-rsz): clocks: [[38, 24], [38, 25]] is too lon=
g
      1 (mediatek,mt8188-mdp3-rsz): clocks: [[38, 20], [38, 21]] is too lon=
g
      1 (mediatek,mt8188-mdp3-rdma): power-domains: [[60, 15], [60,
20]] is too long
      1 (mediatek,mt8188-mdp3-rdma): power-domains: [[58, 15], [58,
20]] is too long
      1 (mediatek,mt8188-mdp3-rdma): power-domains: [[54, 15], [54,
20]] is too long
      1 (mediatek,mt8188-mdp3-rdma): mboxes: [[92, 13, 1], [92, 14,
1], [92, 16, 1], [92, 21, 1]] is too short
      1 (mediatek,mt8188-mdp3-rdma): mboxes: [[130, 13, 1], [130, 14,
1], [130, 16, 1], [130, 21, 1]] is too short
      1 (mediatek,mt8188-mdp3-rdma): mboxes: [[128, 13, 1], [128, 14,
1], [128, 16, 1], [128, 21, 1]] is too short
      1 (mediatek,mt8188-mdp3-rdma): iommus: [[93, 192], [93, 194]] is too =
long
      1 (mediatek,mt8188-mdp3-rdma): iommus: [[93, 128], [93, 131]] is too =
long
      1 (mediatek,mt8188-mdp3-rdma): iommus: [[141, 164], [141, 166]]
is too long
      1 (mediatek,mt8188-mdp3-rdma): iommus: [[139, 164], [139, 166]]
is too long
      1 (mediatek,mt8188-mdp3-rdma): iommus: [[131, 192], [131, 194]]
is too long
      1 (mediatek,mt8188-mdp3-rdma): iommus: [[131, 128], [131, 131]]
is too long
      1 (mediatek,mt8188-mdp3-rdma): iommus: [[129, 192], [129, 194]]
is too long
      1 (mediatek,mt8188-mdp3-rdma): iommus: [[129, 128], [129, 131]]
is too long
      1 (mediatek,mt8188-mdp3-rdma): iommus: [[103, 164], [103, 166]]
is too long
