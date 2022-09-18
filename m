Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B265BBB44
	for <lists+dri-devel@lfdr.de>; Sun, 18 Sep 2022 05:18:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B116210E321;
	Sun, 18 Sep 2022 03:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 040EB10E399
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 03:17:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 38BB0B80E4C
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 03:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54131C43144
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 03:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663471070;
 bh=qb00ImaXysZJpvsHrO2c88a7Ds3dOjpngNqFrczjjDQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hr03nYXFeceAHqZ7u2VGyT81QKhjeSwZRNCObxkGdX9jD3isSngUsiQl5UcFBS8gN
 y8RF4zWKYuZYJnmjgoTSzSyW3xw8p8M9VqadfqWChJcOY2TzS9u8vXsYJo+yM4wrAd
 CjawLOZ/BPCd5PV5zRmR6iRSQrN+lWn21I43pM1IEymhBZw5EVBFX0hdCxlCkg3aUw
 CON7xaXVf89B/jgtrahFQyCxY1zAfiGvx2S62fjVGwb6VY43rM6aOgqFCoynME0qI+
 MK7SOCETpDcBVQ/qxoqGEvrCOzbWR/osrWOQMWT+2Y/zYMwZEYnMYJW4EIMnGDvSly
 c2jim1coxXuaQ==
Received: by mail-ot1-f51.google.com with SMTP id
 cm7-20020a056830650700b006587fe87d1aso7120727otb.10
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 20:17:50 -0700 (PDT)
X-Gm-Message-State: ACrzQf1mrezXQj6dI/i+QQPwMSafZZYyaPLTGyPbH+bGk/J/lGvojaQl
 LtoHk1Telw4Q6KZnHRStiZofI1FQSJgJqrUphg==
X-Google-Smtp-Source: AMsMyM58ezG8msguUMeAH2Le2boc4pMXZ12Yr7cvpd704aw17iSXBXWn9Gr0znIRuo886rusNYTI49u//14DleuHyj8=
X-Received: by 2002:a05:6830:6999:b0:61d:26f8:94c1 with SMTP id
 cy25-20020a056830699900b0061d26f894c1mr5435523otb.278.1663471069381; Sat, 17
 Sep 2022 20:17:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220916133821.27980-1-rex-bc.chen@mediatek.com>
In-Reply-To: <20220916133821.27980-1-rex-bc.chen@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 18 Sep 2022 11:17:36 +0800
X-Gmail-Original-Message-ID: <CAAOTY__g=s_ACd+zTJZT1HBbrLo-JpHbrwLsy1zKjxbM5c21uA@mail.gmail.com>
Message-ID: <CAAOTY__g=s_ACd+zTJZT1HBbrLo-JpHbrwLsy1zKjxbM5c21uA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Refactor MediaTek DP drivers
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
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
 Guillaume Ranquet <granquet@baylibre.com>, Jitao Shi <jitao.shi@mediatek.com>,
 David Airlie <airlied@linux.ie>, liangxu.xu@mediatek.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dmitry:

My tree has no mtk-dp driver yet. Would you like to pick this series?

Regards,
Chun-Kuang.

Bo-Chen Chen <rex-bc.chen@mediatek.com> =E6=96=BC 2022=E5=B9=B49=E6=9C=8816=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E6=99=9A=E4=B8=8A9:38=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> For this series, we do some clean-up and fix a build warning.
> This series is based on linux-next-20220915.
>
> Changes for v2:
> 1. Update commit message in "drm/mediatek: dp: Reduce indentation in mtk_=
dp_bdg_detect()".
> 2. Add fix tag for "drm/mediatek: dp: Fix warning in mtk_dp_video_mute()"=
.
>
> Bo-Chen Chen (3):
>   drm/mediatek: dp: Reduce indentation in mtk_dp_bdg_detect()
>   drm/mediatek: dp: Remove unused register definitions
>   drm/mediatek: dp: Fix warning in mtk_dp_video_mute()
>
>  drivers/gpu/drm/mediatek/mtk_dp.c     | 70 ++++++++++++++-------------
>  drivers/gpu/drm/mediatek/mtk_dp_reg.h |  6 ---
>  2 files changed, 36 insertions(+), 40 deletions(-)
>
> --
> 2.18.0
>
