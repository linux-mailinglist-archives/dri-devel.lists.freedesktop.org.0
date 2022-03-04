Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6564F4CE134
	for <lists+dri-devel@lfdr.de>; Sat,  5 Mar 2022 00:49:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FD410E983;
	Fri,  4 Mar 2022 23:49:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D4E10E983
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 23:49:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AD98761F0F
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 23:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9322DC340F5
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 23:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646437770;
 bh=4ELZp74PMU7CcPVa1I6hOUB32VqfOzoIpZtL5yF8JJM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bH8Y9/qdfdmdEHqoPRStJ7/fyR414JEoPT8jqsRV7LWELkcJMkLjrB6qlTo4SvWoO
 rkqZduxODORdeDwBSek+U6J7GS+DpuEq8APBgOyPkiLAfMEYExBoFr4CYdJWOQmUsC
 7d4g/jAurqDNgogC57b3sMARoQgqA+7lizXuxw8Jt9YuAycE8UAdVw46OFZqnNIrRm
 DXTblS8GaC04L+TmYEeojPB5v8Ol1JQZVLSsJn2sMHrB4iWJGVf4Ec0QB4TrB02F7E
 1rysmAvGAHVeSdhPPHABHD6KFG3l9s9PTNZzRf2ytP6wApzGyBdpczY6EeYoGVsvj2
 6tz6mXbSMcQnQ==
Received: by mail-ej1-f54.google.com with SMTP id d10so20492610eje.10
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Mar 2022 15:49:30 -0800 (PST)
X-Gm-Message-State: AOAM530MBmmqGB7sjIoM/I15Mi+0Tzw6DNgB3qb2GHlCTBgVHSfHR+IO
 2Li/Z8ynRUXhCpGMwNtT4jWNh5o5s+i1hHswqw==
X-Google-Smtp-Source: ABdhPJwKzfXlFjDAMAwtLcoz0QtxWyjlL5WxxrHe/cElb7iEak4IuABWyNlIa9tTLPAXSXTcst+Vdbv+PcgD7ZHGvOs=
X-Received: by 2002:a17:907:e87:b0:6da:8de2:ce94 with SMTP id
 ho7-20020a1709070e8700b006da8de2ce94mr959302ejc.406.1646437768870; Fri, 04
 Mar 2022 15:49:28 -0800 (PST)
MIME-Version: 1.0
References: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 5 Mar 2022 07:49:17 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8CTewRw2Le9RjXoCrqF8AyHD0_p01EMiJ2QQ63yf-HKQ@mail.gmail.com>
Message-ID: <CAAOTY_8CTewRw2Le9RjXoCrqF8AyHD0_p01EMiJ2QQ63yf-HKQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Fix MediaTek display dt-bindings issues
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 krzysztof.kozlowski@canonical.com, David Airlie <airlied@linux.ie>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Rob:

Would you like to take this series into your tree, or I take this
series into my tree?

Regards,
Chun-Kuang.

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2022=E5=B9=B43=E6=9C=884=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=885:55=
=E5=AF=AB=E9=81=93=EF=BC=9A
>
> The vdosys0 series carried a nice dt-bindings conversion of the old
> txt documentation for the entire mediatek-drm driver, but some of
> the issues in there weren't seen.
>
> This series is fixing all of the issues pointed out by a
> `dt_binding_check` run, followed by `dtbs_check`.
>
> AngeloGioacchino Del Regno (3):
>   dt-bindings: display: mediatek,mutex: Fix mediatek,gce-events type
>   dt-bindings: display: mediatek,ovl: Fix 'iommu' required property typo
>   dt-bindings: display: mediatek: Fix examples on new bindings
>
>  .../display/mediatek/mediatek,aal.yaml        | 24 +++--
>  .../display/mediatek/mediatek,ccorr.yaml      | 23 +++--
>  .../display/mediatek/mediatek,color.yaml      | 23 +++--
>  .../display/mediatek/mediatek,dither.yaml     | 23 +++--
>  .../display/mediatek/mediatek,dpi.yaml        |  3 +-
>  .../display/mediatek/mediatek,dsc.yaml        | 23 +++--
>  .../display/mediatek/mediatek,ethdr.yaml      | 99 ++++++++++---------
>  .../display/mediatek/mediatek,gamma.yaml      | 23 +++--
>  .../display/mediatek/mediatek,merge.yaml      | 49 +++++----
>  .../display/mediatek/mediatek,mutex.yaml      | 27 +++--
>  .../display/mediatek/mediatek,od.yaml         | 14 ++-
>  .../display/mediatek/mediatek,ovl-2l.yaml     | 26 +++--
>  .../display/mediatek/mediatek,ovl.yaml        | 28 ++++--
>  .../display/mediatek/mediatek,postmask.yaml   | 23 +++--
>  .../display/mediatek/mediatek,rdma.yaml       | 28 ++++--
>  .../display/mediatek/mediatek,split.yaml      | 17 +++-
>  .../display/mediatek/mediatek,ufoe.yaml       | 19 ++--
>  .../display/mediatek/mediatek,wdma.yaml       | 26 +++--
>  18 files changed, 318 insertions(+), 180 deletions(-)
>
> --
> 2.35.1
>
