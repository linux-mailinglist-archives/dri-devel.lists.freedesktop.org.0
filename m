Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4529379CE47
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 12:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C31310E3E1;
	Tue, 12 Sep 2023 10:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA47110E3DC
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 10:28:45 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-501bd164fbfso8861812e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 03:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694514524; x=1695119324;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PqZA61AZZwHHDn1nGNrzumQDR9UPMkG/AB0OITt853E=;
 b=AGZPyF+lmhorEjjuvtcyfJthRG2BivZ2IFJ8E1ToDAt5TZm8NoAH5R2bmdS6KzDTvq
 jE4oNKvuyF+4RFEiTKre0sCn/j8SMPolPeasMQ+y5j4w7MiS1bbWGKd4uhcmoBeZRwo3
 51kPSKkdvM8SPfnGjpILhOIi48UVFOPyp+se0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694514524; x=1695119324;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PqZA61AZZwHHDn1nGNrzumQDR9UPMkG/AB0OITt853E=;
 b=MUrzGbIdwP04U2TivMBEH6rmQol1DBYbt67nYOdBoz+Of+GGu/DrdvT59KxfLeLi5G
 /gNvJda5b/aOgu5ZYm37hCMPjUHDA/Bq73v1sVx7+9mui3hLLCLeypcxaV2BdywxSnEk
 RlC8wyaV55L4taIQS0XaoMMsEbdiu0h8PxWSv1x3ARQ+mmhToaDpmgR93Ffo1Iza4OyI
 Fr1/A9Dh2WPU5D1zSWl8FqgtHXTemnIKwYE87F9S4z7Mpght7bznTDzcKeXcHvLQdq1J
 VnIBDZZDdAhfXMaegpA4EdGVBETyZ2OiA3Qk7+wYUYOVEKGW18/ur4ah2dDmGPBubYnb
 DV0A==
X-Gm-Message-State: AOJu0YySlGAu4eCyOVsw9n2ySVbmm2ccCeyEo1CxvBwcAmqKcjMtC/Ym
 Hl0Fc9zLSwZfP22fjoY18e/QWrrDe2SWQ2miWWkjGQ==
X-Google-Smtp-Source: AGHT+IGnsct1TtXsCOP9NVgGwPzYUd7tgDEeTfBIGRUc5NUgd7ZgNlHQ3BbdTYL88E8XR22jOxrW/3zQp9aoCA0z7sA=
X-Received: by 2002:a05:6512:2016:b0:500:a368:a962 with SMTP id
 a22-20020a056512201600b00500a368a962mr7798675lfb.43.1694514523798; Tue, 12
 Sep 2023 03:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230912075805.11432-1-moudy.ho@mediatek.com>
 <c0bd7428-1330-58c5-64d2-78af479dfcf4@collabora.com>
 <CAGXv+5FhsKVGwoJxLP=-gV+rSHbQ8DUX0YACy0mPxYw+MC85=g@mail.gmail.com>
 <d8bfbb5f-07a7-4beb-ac1c-049825caf934@collabora.com>
In-Reply-To: <d8bfbb5f-07a7-4beb-ac1c-049825caf934@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 12 Sep 2023 18:28:32 +0800
Message-ID: <CAGXv+5EJ6W6XCJR3busZ0HVQjLytZvzMMjUhhpR5g6Jc8sJQ+A@mail.gmail.com>
Subject: Re: [PATCH v5 00/14] add support MDP3 on MT8195 platform
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Moudy Ho <moudy.ho@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 12, 2023 at 5:43=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 12/09/23 11:37, Chen-Yu Tsai ha scritto:
> > On Tue, Sep 12, 2023 at 5:00=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 12/09/23 09:57, Moudy Ho ha scritto:
> >>> Changes since v4:
> >>> - Rebase on v6.6-rc1
> >>> - Remove any unnecessary DTS settings.
> >>> - Adjust the usage of MOD and clock in blending components.
> >>>
> >>> Changes since v3:
> >>> - Depend on :
> >>>     [1] https://patchwork.kernel.org/project/linux-media/list/?series=
=3D719841
> >>> - Suggested by Krzysztof, integrating all newly added bindings for
> >>>     the mt8195 MDP3 into the file "mediatek,mt8195-mdp3.yaml".
> >>> - Revise MDP3 nodes with generic names.
> >>>
> >>> Changes since v2:
> >>> - Depend on :
> >>>     [1] MMSYS/MUTEX: https://patchwork.kernel.org/project/linux-media=
tek/list/?series=3D711592
> >>>     [2] MDP3: https://patchwork.kernel.org/project/linux-mediatek/lis=
t/?series=3D711618
> >>> - Suggested by Rob to revise MDP3 bindings to pass dtbs check
> >>> - Add parallel paths feature.
> >>> - Add blended components settings.
> >>>
> >>> Changes since v1:
> >>> - Depend on :
> >>>     [1] MDP3 : https://patchwork.kernel.org/project/linux-mediatek/li=
st/?series=3D698872
> >>>     [2] MMSYS/MUTEX: https://patchwork.kernel.org/project/linux-media=
tek/list/?series=3D684959
> >>> - Fix compilation failure due to use of undeclared identifier in file=
 "mtk-mdp3-cmdq.c"
> >>>
> >>> Hello,
> >>>
> >>> This patch is used to add support for MDP3 on the MT8195 platform tha=
t
> >>> contains more picture quality components, and can arrange more pipeli=
nes
> >>> through two sets of MMSYS and MUTEX respectively.
> >>>
> >>> Moudy Ho (14):
> >>>     arm64: dts: mediatek: mt8183: correct MDP3 DMA-related nodes
> >>>     arm64: dts: mediatek: mt8195: add MDP3 nodes
> >>
> >> Please send the DTS patches separately, those go through a different m=
aintainer.
> >
> > I thought most people prefer the _full_ view in a patchset?
> >
>
> Yeah but those going through a different maintainer makes it more straigh=
tforward
> to pick; besides, essentially, you can also get a full view with dt-bindi=
ngs
> patches instead of devicetrees, as the latter are "constructed from" bind=
ings
> anyway.

Sure, but testing, especially by people not in the recipients or CC list,
is a bit painful when the full set of patches isn't bundled together.
Having them bundled together shows what the submitter tested and makes
it easier for others to reproduce.

AFAIK other ARM platforms have been sending patches all grouped together.
It's MediaTek that has been different, as they normally have (for Chromeboo=
ks)
a system integration engineer handling the device tree stuff, while compone=
nt
driver owners just handle the drivers, and by extension, the DT bindings.

> Moreover, it would be definitely nice to add a link to the devicetree ser=
ies
> in the cover letter of this series, so that people *do* get a full overvi=
ew
> by checking both series :-)

Most maintainers seem to know what to do: apply the subset destined for
their tree. At least the subsystems that frequently deal with DT-based
platforms anyway.


ChenYu

> Cheers!
>
> >> P.S.: The dt-bindings patch can be sent inside of this series, please =
do that.
> >>
> >> Thanks!
> >> Angelo
> >>
> >>
>
