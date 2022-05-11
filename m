Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D7C5235AD
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 16:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C80A810F131;
	Wed, 11 May 2022 14:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49FE210F131
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 14:36:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 66A7C612AC
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 14:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD456C34118
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 14:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652279807;
 bh=CFhh69pRRTRkzZMswQTkxgZWxD/YArFAjT9FIgk+yio=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gEiSBSsGKR+8BwK8haoPAsMJZYD8XCaC46lJnoHPerCMp1g6l9P3xZteEOsKk2MUo
 ZELEJ1mhPuDhJmP3W+BmC6+m5Y+12EYvpGP8QstJEZBeHL/AVpMiFpf493GaDnSS/M
 OkGALA59NNBTMT1eUG/2thE3TNfy8FjzAreDuz/5UUhAKiLbdQr/l3+ZqdH+XWYymp
 ZaPf2ZqzoiiKqUBpg+UMK5SZ278kFIWfvi1QQqMzqxhTdHy3Vb7OtHLdD9l3RgV0d5
 dQsiJXbqdK5Y2Rs8nGNZwhzkcD3yr374Vzpk+l1sKqylC3lo1EteelNQbN23gaG6vA
 yN18XzCLNNY/A==
Received: by mail-pf1-f177.google.com with SMTP id i24so2161454pfa.7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 07:36:47 -0700 (PDT)
X-Gm-Message-State: AOAM5326HKI6KHjbMNO5IFrUvz8hRdxRHamNOtSj5kQ4xrzDLa39g7gj
 J0HYkK/4KCmmkXLErWqs62NOzmGsld4WJU4x+w==
X-Google-Smtp-Source: ABdhPJzuQsnkqZbdNusjFeMctKvTdpkvefeyuXEUsA0fTySx0Vw8lpkWlOD30zEX2dqbf4Ozf1dDOiJd7nqvDOobbuc=
X-Received: by 2002:aa7:9519:0:b0:510:5175:7649 with SMTP id
 b25-20020aa79519000000b0051051757649mr25841856pfp.15.1652279807276; Wed, 11
 May 2022 07:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220504091923.2219-1-rex-bc.chen@mediatek.com>
 <20220504091923.2219-2-rex-bc.chen@mediatek.com>
 <e45e68c76775edbf935418ca4f75dc83591805cd.camel@mediatek.com>
In-Reply-To: <e45e68c76775edbf935418ca4f75dc83591805cd.camel@mediatek.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 11 May 2022 09:36:35 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLcZ69-WPk6Oq54EgXPZo-wviu5-SrKEaAYRQ5LZU0rcw@mail.gmail.com>
Message-ID: <CAL_JsqLcZ69-WPk6Oq54EgXPZo-wviu5-SrKEaAYRQ5LZU0rcw@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: display: mediatek: dsi: Convert
 dsi_dtbinding to .yaml
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 "xinlei.lee" <xinlei.lee@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 11, 2022 at 2:24 AM Rex-BC Chen <rex-bc.chen@mediatek.com> wrote:
>
> On Wed, 2022-05-04 at 17:19 +0800, Rex-BC Chen wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> >
> > Convert mediatek,dsi.txt to mediatek,dsi.yaml format
> >
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  .../display/mediatek/mediatek,dsi.txt         |  62 ----------
> >  .../display/mediatek/mediatek,dsi.yaml        | 115
> > ++++++++++++++++++
> >  2 files changed, 115 insertions(+), 62 deletions(-)
> >  delete mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml

[...]

> Hello Rob and Krzysztof,
>
> Can you give us some suggestions for this conversion patch?
> Thanks!

You can check status for yourself by looking at PW[1] where you will
see the review queue is currently ~120 patches and goes back to 5/3.
If it is in the queue, I will get to it.

Rob

[1] https://patchwork.ozlabs.org/project/devicetree-bindings/list/
