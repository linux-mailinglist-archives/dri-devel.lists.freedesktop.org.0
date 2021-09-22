Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4A2414DF9
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 18:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557CB6EC38;
	Wed, 22 Sep 2021 16:18:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21F26EC38
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 16:18:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C410661168
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 16:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632327532;
 bh=hBAsvrZV+yB9m6NQkJEZNKVRMGBNiMFtAVk+tAPOY9Q=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tvBDjXnxpOCJ0Q2yUYHVlM4RcUAK7bmcQrWaf8cpMP0CpMj4/OPX4tjAAbr01BJ6x
 hgFDhOzlOqA/hPGrQBVZ2ZjI9u2NDeJMI9z+yYYStOmB5YlB8aaaQBcfZnEsTTwq20
 BhW6M4sFyWb//tBKLuZ8vV/nTpl2f5hjQ4x7rq3g8qL4lQwsNG/AJVtoKTbG3C2BTg
 lMLlVqkgoDP3ZMrOvMIIjJ5/JHJS6GL0kEPH0Tt9QItD9mWS3XLH3u9zhEsHFKNjfC
 roXWTs2IpYgemMSg1fHCgnGhgewzQPuXb6AvhgzVSCmHiTtNXE2BNYcy2Hk3bdx3fS
 nkHEsWWaYdU2A==
Received: by mail-ed1-f49.google.com with SMTP id v10so7317411edj.10
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 09:18:52 -0700 (PDT)
X-Gm-Message-State: AOAM533wOl48qrgy/O604MjyQYjPDCHxORiP9raSl4MTEAHFkqFFLELu
 6J7Tf367MNFSg2AuVwua16nUwdkR54NGIC463A==
X-Google-Smtp-Source: ABdhPJz8tVsKtk6yn9u+71rcMAgS0BuyzKIk3KLCLhFxiOLPm8SNwNUm1S5K8ylJ5RD8JjnCsHo+3ja0ifSpdXbFmNM=
X-Received: by 2002:a17:906:3181:: with SMTP id 1mr455229ejy.388.1632327531346; 
 Wed, 22 Sep 2021 09:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210907083723.7725-1-granquet@baylibre.com>
 <20210907083723.7725-5-granquet@baylibre.com>
 <1631026304.913177.3958449.nullmailer@robh.at.kernel.org>
In-Reply-To: <1631026304.913177.3958449.nullmailer@robh.at.kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 23 Sep 2021 00:18:40 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8dpL2q4H9wHOusCtODAHos_rL2_p8BGhsGEkAFLeV1FQ@mail.gmail.com>
Message-ID: <CAAOTY_8dpL2q4H9wHOusCtODAHos_rL2_p8BGhsGEkAFLeV1FQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: display: mediatek: add MT8195 hdmi
 bindings
To: Rob Herring <robh@kernel.org>
Cc: Guillaume Ranquet <granquet@baylibre.com>, David Airlie <airlied@linux.ie>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 DTML <devicetree@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, CK Hu <ck.hu@mediatek.com>, 
 linux-kernel <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Daniel Vetter <daniel@ffwll.ch>, Jitao shi <jitao.shi@mediatek.com>,
 linux-phy@lists.infradead.org, 
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
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

Hi, Guillaume:

Rob Herring <robh@kernel.org> =E6=96=BC 2021=E5=B9=B49=E6=9C=887=E6=97=A5 =
=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8810:51=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, 07 Sep 2021 10:37:21 +0200, Guillaume Ranquet wrote:
> > Add Mediatek HDMI and HDMI-DDC bindings for MT8195 SoC.

Move this patch before the driver patch which refer to this patch.

> >
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > ---
> >  .../mediatek/mediatek,mt8195-hdmi-ddc.yaml    | 46 +++++++++
> >  .../mediatek/mediatek,mt8195-hdmi.yaml        | 99 +++++++++++++++++++
> >  2 files changed, 145 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/mediatek/=
mediatek,mt8195-hdmi-ddc.yaml

I think this file should be merged into mediatek,hdmi-ddc.yaml [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml?=
h=3Dv5.15-rc2

> >  create mode 100644 Documentation/devicetree/bindings/display/mediatek/=
mediatek,mt8195-hdmi.yaml

I think this file should be merged into mediatek,hdmi.yaml [2].

[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml?h=3D=
v5.15-rc2

Regards,
Chun-Kuang.

> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.e=
xample.dts:19:18: fatal error: dt-bindings/clock/mt8195-clk.h: No such file=
 or directory
>    19 |         #include <dt-bindings/clock/mt8195-clk.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:379: Documentation/devicetree/bindings=
/display/mediatek/mediatek,mt8195-hdmi.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1438: dt_binding_check] Error 2
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/patch/1525170
>
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit.
>
