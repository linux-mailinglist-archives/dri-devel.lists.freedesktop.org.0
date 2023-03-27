Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D19136CA8C5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 17:17:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBEE910E111;
	Mon, 27 Mar 2023 15:17:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E5A10E111
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 15:17:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6EC63B81618
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 15:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 318E2C4339E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 15:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679930240;
 bh=WxXjXDVt250Dzp30WluOUfbIb760o1vY2QBgR+3iufI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DgSCKdzHtd3A8JummnAbCF0GnDlwtgZE6oSuVEtby2k6dFHawi07+eYzwPhFI/zPn
 1IqdQXp31wiy/gxtYX6xIXwHsgB7dDWGbPo6yynzdtMX0Vzh+sZ7ApcD4v6Hrd7yJM
 xTrafTzK5Qq9V8l3zkkyJ+yxFjRh4x26wz388XcMmrfyf1YhaCvtQo9lmQT6pcvAcA
 bMYMFdx1Gz2tsb/AYwR47c26nxs8JIX5KkB8g9NdHo8PqeB5MQ2sLpGsRviMSYsdYc
 EOg4Jv1ldxV8sUCYxJzAt8ZpOKQIeoGcrTIh8+8rqmOATAeYbhPniEhhLGy8a0zYPU
 3q5KeUrdBoIzg==
Received: by mail-lj1-f182.google.com with SMTP id by8so9381448ljb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 08:17:20 -0700 (PDT)
X-Gm-Message-State: AAQBX9eq1oo7TS7ZEhCqERBlFLBc/1i8fw7W9V8EBiRmQZroAow5mB6z
 E8xakR96ksBW09KxOfnqKEAy0Tu41kzG+2t6zA==
X-Google-Smtp-Source: AKy350ZJD8lXrATp34gVJQNtWOp95oG2v0KcgMEyjZm8N9VS0wqsbCWLENkFgqU2pL5ANEjL4W1+rI8dl98MGCb+WEw=
X-Received: by 2002:a2e:a304:0:b0:2a1:627a:70bb with SMTP id
 l4-20020a2ea304000000b002a1627a70bbmr3582823lje.10.1679930238193; Mon, 27 Mar
 2023 08:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230321121859.2355-1-nancy.lin@mediatek.com>
 <17831605-5c9d-9c92-d190-04f91060ace4@collabora.com>
 <CAAOTY_8ZAxVSLnJ1u5snsRgkszV7ixwhjUS2nDimE_Lpj=cUCA@mail.gmail.com>
 <97a5f383-38f5-e8ea-e1d8-489b690e4521@collabora.com>
In-Reply-To: <97a5f383-38f5-e8ea-e1d8-489b690e4521@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 27 Mar 2023 23:17:06 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9_vn-m2jTaaHkFDV+v2-LeaAxtCLNNnOxZq5Httb-TAQ@mail.gmail.com>
Message-ID: <CAAOTY_9_vn-m2jTaaHkFDV+v2-LeaAxtCLNNnOxZq5Httb-TAQ@mail.gmail.com>
Subject: Re: [PATCH v30 0/7] Add MediaTek SoC DRM (vdosys1) support for mt8195
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org,
 singo.chang@mediatek.com, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, "Nancy.Lin" <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 krzysztof.kozlowski+dt@linaro.org, clang-built-linux@googlegroups.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Angelo:

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2023=E5=B9=B43=E6=9C=8824=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:3=
8=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Il 24/03/23 00:25, Chun-Kuang Hu ha scritto:
> > Hi, Angelo:
> >
> > AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =
=E6=96=BC
> > 2023=E5=B9=B43=E6=9C=8823=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=
=884:58=E5=AF=AB=E9=81=93=EF=BC=9A
> >>
> >> Il 21/03/23 13:18, Nancy.Lin ha scritto:
> >>> The hardware path of vdosys1 with DPTx output need to go through by s=
everal modules, such as, OVL_ADAPTOR and MERGE.
> >>>
> >>> Add DRM and these modules support by the patches below:
> >>>
> >>
> >> I've tested v30 again on MT8173, MT8192 and MT8195 based Chromebooks.
> >> Green light from me.
> >
> > I'm curious about how you build code and test on Chromebooks. Do you
> > build in cros environment or pure linux
> > (https://archlinuxarm.org/platforms/armv8/mediatek/acer-chromebook-r13)=
.
> > I've a MT8183 based Chromebook (HP 11a) and I've tried to run a
> > upstream kernel on it. cros is too heavy for me and I doubt I could
> > use it. I've tried the pure linux and could boot up with console, but
> > display does not work. If you use the pure linux environment, could
> > you share how it works?
> >
>
> I haven't tested MT8183 (I don't actually have any 8183 machine in my han=
ds)... but
> yes, I can share my test environment.
>
> I have one MicroSD that I use either in the MicroSD slot of the target ma=
chine, or
> in a USB reader; this *single* system is what I boot on *all* Chromebooks=
 that I
> have: one kernel, multiple devicetrees, same Debian-based userspace.
>
> What we have to prepare this bootable media can be found at [1], but bewa=
re that
> it currently uses an outdated kernel, so, what I have locally is a symlin=
k to my
> kernel tree.
> You can change/add/remove the devicetree blobs that will get added to the=
 image
> by modifying `chromebook-setup.sh`; before tampering with kernel tree sym=
link,
> please run that script for the first time, as it will download a cross-co=
mpiler,
> a kernel tree (that you will replace for sure) and the (very old) Debian =
rootfs
> that you can update with `apt-get dist-upgrade` after booting the Chromeb=
ook.
>
> If you want to check about possible kernel configuration differences, wha=
t I use
> is at [2], so that you can compare.

Thanks for the information, I would try to compare the kernel config first.

>
> [1]: https://gitlab.collabora.com/google/chromebooks/-/tree/mtk-av1
> [2]:
> https://gitlab.collabora.com/google/chromeos-kernel/-/blob/mt8195-trackin=
g-master-rolling/arch/arm64/configs/defconfig
>
> Regards,
> Angelo
