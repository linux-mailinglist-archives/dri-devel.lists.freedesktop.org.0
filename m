Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 031BD7AC9EB
	for <lists+dri-devel@lfdr.de>; Sun, 24 Sep 2023 16:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B9610E065;
	Sun, 24 Sep 2023 14:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 094C510E065
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 14:09:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 485DCCE0ADA
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 14:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 578D9C433CA
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 14:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695564569;
 bh=hzaEJsc/MvyTSiwHDbUNHX3pHjivtFFehSFljD3hx+8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JM4HtDoi5L9D14lI5GjMrgBYkePbSfp+99S9Vxtv2UgpN6rzsdjlKCjQQ3Ot9n34Y
 tMMnyMNOz6LtOPhj3Jy2SurZw80l3tQUw36I8sua/AgmCkMdj5SCrCTgk1ZdTkGu3v
 GB2O6xlqj3GT01oaMFF5LLs9BrvuZASKoIlXlFVQCj5XFNM/h42GWVCQ10pr4cozh1
 y23Uw1Lw8PMUyefeFQsBVlxUThZjxCEejfo4Gm3jhmZSWb6riwO7WAfxK4hC1R0chU
 xjhOrfjk+wTonCh0qL5tty5G9ZA3OuJLUYlpioJ1CnV+hLPgV8e4aMAeCVoWpeVBCR
 NyTpgJBHn4JPA==
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2c131ddfc95so68094081fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 07:09:29 -0700 (PDT)
X-Gm-Message-State: AOJu0YzOMUWsXZydt4Lon6BFZh7PtL+oZBxSe9PRw4pyUHnjjeU17FXL
 FmxcqtDeNEYYjV4L2VtcofTlj9DqJW3UnkUFWA==
X-Google-Smtp-Source: AGHT+IGJ8a+c8899BJiT8DoTZkR0LqKr6jfxQvm+fUmHwVYOOXPzJ4ByxiWLhAZmxxEqpxpqDluyHoh50ZPqstltjjY=
X-Received: by 2002:a19:3803:0:b0:4fb:89b3:3373 with SMTP id
 f3-20020a193803000000b004fb89b33373mr3292427lfa.43.1695564567547; Sun, 24 Sep
 2023 07:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230822024155.26670-1-shuijing.li@mediatek.com>
In-Reply-To: <20230822024155.26670-1-shuijing.li@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 24 Sep 2023 22:09:12 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-xEunh0AOKTYEWn6BV5DM9zU81gsP38P1x1a-3FnpQXg@mail.gmail.com>
Message-ID: <CAAOTY_-xEunh0AOKTYEWn6BV5DM9zU81gsP38P1x1a-3FnpQXg@mail.gmail.com>
Subject: Re: [PATCH v6,0/4] Add compatible to increase MT8188 audio control
To: Shuijing Li <shuijing.li@mediatek.com>
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
Cc: chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Shuijing:

Shuijing Li <shuijing.li@mediatek.com> =E6=96=BC 2023=E5=B9=B48=E6=9C=8822=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8810:41=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Add dt-binding documentation of dp-tx for MediaTek MT8188 SoC.
> Mainly add the following two flag:
>
> 1.The audio packet arrangement function is to only arrange audio
> packets into the Hblanking area. In order to align with the HW
> default setting of g1200, this function needs to be turned off.
>
> 2.Due to the difference of HW, different dividers need to be set.
>
> Base on the branch of linus/master v6.4.

For this series, applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Shuijing Li (4):
>   dt-bindings: display: mediatek: dp: Add compatible for MediaTek MT8188
>   drm/mediatek: dp: Add the audio packet flag to mtk_dp_data struct
>   drm/mediatek: dp: Add the audio divider to mtk_dp_data struct
>   drm/mediatek: dp: Add support MT8188 dp/edp function
>
>  .../display/mediatek/mediatek,dp.yaml         |  2 ++
>  drivers/gpu/drm/mediatek/mtk_dp.c             | 36 ++++++++++++++++++-
>  drivers/gpu/drm/mediatek/mtk_dp_reg.h         | 23 ++++++++----
>  3 files changed, 54 insertions(+), 7 deletions(-)
>
> --
> 2.40.1
>
