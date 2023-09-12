Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B7079CBFD
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 11:37:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F5C10E107;
	Tue, 12 Sep 2023 09:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ABF910E107
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 09:37:30 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-502b1bbe5c3so4000716e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 02:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694511449; x=1695116249;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rzOy9+i/I3/0IAop11I8QZ9KuzjqNEblUBdj8hE/TNs=;
 b=JaRvRTGw5AeESargHZwLDIRPOLHiHTIL27o3VoCnTrywDIu5q4QHAg8hL/zKSocMA9
 /xSfNU4WhSeHiMqU/A6G1YHuZnUFrk6MfJEIz6Dk2l3T4wXmya8TkfRBFoCoxk7ZJ1SO
 9dIxEtjMc6ZJRQWpAm1sqbLQCGjuMUq+Y3TrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694511449; x=1695116249;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rzOy9+i/I3/0IAop11I8QZ9KuzjqNEblUBdj8hE/TNs=;
 b=sJ91M/Ddp6trGOm6KaF6QnNr0znYwEHndVjXsphwqNwqdPlRQHsXXppWQpR2z23KJ7
 0HuLwzvTf8c/MzUZHe0L3z9NAMi4ZX1T/pEMzuxT6Qvle9fCcxWbc5Y6f+t17uTe0cBa
 uk27SI1NRfa+X+GfD0/a8CXunkmzrG0173YhF2xpxbXNWE8AxVyjNSQFCu2XNtjQr2RB
 g93UMdfWzBZOHcImZkm+gcgu9x7QHtwSY4wVkTBIA7/pEdSZOiRG7aslvfvbgwwKr2Zu
 T84Mzrw9V0USVWZANPS58iHSChLHlTU+gfxApsotn8FDJV3eaIu7E3HNiL0+GieVeFHM
 zXRA==
X-Gm-Message-State: AOJu0YznEbDUIs1+scK2CpvSKf3emjLy/ZOB85zsGjmowGOFkiHIy2cT
 fKvgX7d97cFXOWNCkAfPf1YtCSQBr9K8P8buB5BsXg==
X-Google-Smtp-Source: AGHT+IE5nYxQfZ/p5JEjeqA28AdkacyPuXzw3SozYcbXSTHvYQRz83ev3q6BCV7+1dnYJ4QqMVA8anjAE8x57wQR11Q=
X-Received: by 2002:a05:6512:2829:b0:4fd:fecf:5d57 with SMTP id
 cf41-20020a056512282900b004fdfecf5d57mr10819604lfb.39.1694511448719; Tue, 12
 Sep 2023 02:37:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230912075805.11432-1-moudy.ho@mediatek.com>
 <c0bd7428-1330-58c5-64d2-78af479dfcf4@collabora.com>
In-Reply-To: <c0bd7428-1330-58c5-64d2-78af479dfcf4@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 12 Sep 2023 17:37:17 +0800
Message-ID: <CAGXv+5FhsKVGwoJxLP=-gV+rSHbQ8DUX0YACy0mPxYw+MC85=g@mail.gmail.com>
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

On Tue, Sep 12, 2023 at 5:00=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 12/09/23 09:57, Moudy Ho ha scritto:
> > Changes since v4:
> > - Rebase on v6.6-rc1
> > - Remove any unnecessary DTS settings.
> > - Adjust the usage of MOD and clock in blending components.
> >
> > Changes since v3:
> > - Depend on :
> >    [1] https://patchwork.kernel.org/project/linux-media/list/?series=3D=
719841
> > - Suggested by Krzysztof, integrating all newly added bindings for
> >    the mt8195 MDP3 into the file "mediatek,mt8195-mdp3.yaml".
> > - Revise MDP3 nodes with generic names.
> >
> > Changes since v2:
> > - Depend on :
> >    [1] MMSYS/MUTEX: https://patchwork.kernel.org/project/linux-mediatek=
/list/?series=3D711592
> >    [2] MDP3: https://patchwork.kernel.org/project/linux-mediatek/list/?=
series=3D711618
> > - Suggested by Rob to revise MDP3 bindings to pass dtbs check
> > - Add parallel paths feature.
> > - Add blended components settings.
> >
> > Changes since v1:
> > - Depend on :
> >    [1] MDP3 : https://patchwork.kernel.org/project/linux-mediatek/list/=
?series=3D698872
> >    [2] MMSYS/MUTEX: https://patchwork.kernel.org/project/linux-mediatek=
/list/?series=3D684959
> > - Fix compilation failure due to use of undeclared identifier in file "=
mtk-mdp3-cmdq.c"
> >
> > Hello,
> >
> > This patch is used to add support for MDP3 on the MT8195 platform that
> > contains more picture quality components, and can arrange more pipeline=
s
> > through two sets of MMSYS and MUTEX respectively.
> >
> > Moudy Ho (14):
> >    arm64: dts: mediatek: mt8183: correct MDP3 DMA-related nodes
> >    arm64: dts: mediatek: mt8195: add MDP3 nodes
>
> Please send the DTS patches separately, those go through a different main=
tainer.

I thought most people prefer the _full_ view in a patchset?

> P.S.: The dt-bindings patch can be sent inside of this series, please do =
that.
>
> Thanks!
> Angelo
>
>
