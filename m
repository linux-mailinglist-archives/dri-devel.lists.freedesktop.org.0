Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2146D0276
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 13:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF22A10E238;
	Thu, 30 Mar 2023 11:05:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CAAD10E238
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 11:05:24 +0000 (UTC)
Received: by mail-ua1-x933.google.com with SMTP id e12so13510016uaa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 04:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1680174323;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZBDBg0HH1y2Gx5yNNGEH03tfCHf1/oZeA1OHg/lrfwY=;
 b=AGTDkYKmFIkU7h3W8pUDAThR19VjWhlbEZrEPvdb2Yx2vCg94ZjAqrG6KdUMC8h8K9
 maVYRHf3bch+/BMgpjdex5tmMlxiaHr9BpXNIAMOOceA02T9oM2ZGmhDxqSEzYWNVdql
 UsNbJGx8nES0tVzze1xqgvpmHa7rthlXUKm+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680174323;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZBDBg0HH1y2Gx5yNNGEH03tfCHf1/oZeA1OHg/lrfwY=;
 b=iWMKYW6l6dhnzYRZnnx/ydPLqa46AHzcPqCI7kbttdNE0PIeL3hBhkSJqUS68TtldW
 zezG7NsblsUvhaQbg1p6q7Aq5di9W1yO1JAJcoob8OQ4iAdrWEQSAeqUUeqO6bVa3+UQ
 CrgUlN72DLZx6mqcB4dCzeROFsoiYyK/LJxy/tVgJax1dKLyCinY8A1NfmfdgdYcKSIh
 /uVX0eswh2J/v+gxNp3hyIYGfImN0yqGyvrgU3LCOHspzUI470GZFSKxPYCwgE16ChCJ
 ZijNjSStww8rjPtRnFBBPQR7GyBunbe7hvJMOw0OvKxe3190fBvwPylB/0qf1xS7GOuO
 +qdA==
X-Gm-Message-State: AAQBX9ftrs4bYQlKp5EZinchfG+RwqrIVwY6P/rVeLHugZcFGz64U5b3
 ETPpNXNMBAw4cbbxq2ceVYmjEI0ctEckYxewcONIfg==
X-Google-Smtp-Source: AKy350bewD4+8aznFs09qngdmj+I714IP108YtnCD/KyMgmvOAvShWr4aIllQZPLnAcwidqQtErpuKM8c+DotdjwoF4=
X-Received: by 2002:ab0:2019:0:b0:765:8f29:d679 with SMTP id
 v25-20020ab02019000000b007658f29d679mr3245687uak.1.1680174323569; Thu, 30 Mar
 2023 04:05:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230321121859.2355-1-nancy.lin@mediatek.com>
 <17831605-5c9d-9c92-d190-04f91060ace4@collabora.com>
 <CAAOTY_8ZAxVSLnJ1u5snsRgkszV7ixwhjUS2nDimE_Lpj=cUCA@mail.gmail.com>
 <97a5f383-38f5-e8ea-e1d8-489b690e4521@collabora.com>
 <CAAOTY_9_vn-m2jTaaHkFDV+v2-LeaAxtCLNNnOxZq5Httb-TAQ@mail.gmail.com>
In-Reply-To: <CAAOTY_9_vn-m2jTaaHkFDV+v2-LeaAxtCLNNnOxZq5Httb-TAQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 30 Mar 2023 19:05:12 +0800
Message-ID: <CAGXv+5FJCuG_zHnaKZ=baNzKAWKLEe3jZnghNAxuGv7i7L6e7Q@mail.gmail.com>
Subject: Re: [PATCH v30 0/7] Add MediaTek SoC DRM (vdosys1) support for mt8195
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
Cc: devicetree@vger.kernel.org, singo.chang@mediatek.com,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 clang-built-linux@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "Nancy.Lin" <nancy.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 27, 2023 at 11:17=E2=80=AFPM Chun-Kuang Hu <chunkuang.hu@kernel=
.org> wrote:
>
> Hi, Angelo:
>
> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=
=96=BC
> 2023=E5=B9=B43=E6=9C=8824=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884=
:38=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > Il 24/03/23 00:25, Chun-Kuang Hu ha scritto:
> > > Hi, Angelo:
> > >
> > > AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =
=E6=96=BC
> > > 2023=E5=B9=B43=E6=9C=8823=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=
=884:58=E5=AF=AB=E9=81=93=EF=BC=9A
> > >>
> > >> Il 21/03/23 13:18, Nancy.Lin ha scritto:
> > >>> The hardware path of vdosys1 with DPTx output need to go through by=
 several modules, such as, OVL_ADAPTOR and MERGE.
> > >>>
> > >>> Add DRM and these modules support by the patches below:
> > >>>
> > >>
> > >> I've tested v30 again on MT8173, MT8192 and MT8195 based Chromebooks=
.
> > >> Green light from me.
> > >
> > > I'm curious about how you build code and test on Chromebooks. Do you
> > > build in cros environment or pure linux
> > > (https://archlinuxarm.org/platforms/armv8/mediatek/acer-chromebook-r1=
3).
> > > I've a MT8183 based Chromebook (HP 11a) and I've tried to run a
> > > upstream kernel on it. cros is too heavy for me and I doubt I could
> > > use it. I've tried the pure linux and could boot up with console, but
> > > display does not work. If you use the pure linux environment, could
> > > you share how it works?
> > >
> >
> > I haven't tested MT8183 (I don't actually have any 8183 machine in my h=
ands)... but
> > yes, I can share my test environment.
> >
> > I have one MicroSD that I use either in the MicroSD slot of the target =
machine, or
> > in a USB reader; this *single* system is what I boot on *all* Chromeboo=
ks that I
> > have: one kernel, multiple devicetrees, same Debian-based userspace.
> >
> > What we have to prepare this bootable media can be found at [1], but be=
ware that
> > it currently uses an outdated kernel, so, what I have locally is a syml=
ink to my
> > kernel tree.
> > You can change/add/remove the devicetree blobs that will get added to t=
he image
> > by modifying `chromebook-setup.sh`; before tampering with kernel tree s=
ymlink,
> > please run that script for the first time, as it will download a cross-=
compiler,
> > a kernel tree (that you will replace for sure) and the (very old) Debia=
n rootfs
> > that you can update with `apt-get dist-upgrade` after booting the Chrom=
ebook.
> >
> > If you want to check about possible kernel configuration differences, w=
hat I use
> > is at [2], so that you can compare.
>
> Thanks for the information, I would try to compare the kernel config firs=
t.

Hi CK,

Would you consider adding your repo to linux-next? That would let everyone
do integration testing, especially automated ones, earlier, before you send
your PRs to drm maintainers.

You can do so by sending an email to Stephen Rothwell to do so.


ChenYu

> >
> > [1]: https://gitlab.collabora.com/google/chromebooks/-/tree/mtk-av1
> > [2]:
> > https://gitlab.collabora.com/google/chromeos-kernel/-/blob/mt8195-track=
ing-master-rolling/arch/arm64/configs/defconfig
> >
> > Regards,
> > Angelo
