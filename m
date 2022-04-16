Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CAD50370F
	for <lists+dri-devel@lfdr.de>; Sat, 16 Apr 2022 16:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4D010E4A6;
	Sat, 16 Apr 2022 14:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7124E10E4A6
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Apr 2022 14:20:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EE8DAB82412
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Apr 2022 14:20:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90439C385AA
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Apr 2022 14:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650118847;
 bh=cWFwLZ0gsVucA5Es4p84LruYFLWbrqoMEwSN0TuIkzU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XDzfBSksXEI8qGNWOHFtln3WMB9rNV8dHxdESNVd28Tycyp8gxI14j+GAueK0vdoo
 x52nmuvKOi1hSqYc4FyW+ZiFl8k9MsO6fSGIxXICkqa6xj2UgMJf5g8fpAvC7hc3Qm
 6rf3JtbNezGuA1rUkmYwsSVbkciLwK3jKixYXM7M3VFWOjiTTOM7OJuwHxIGmN6cKe
 7SmTLyrYHEoJrDm01TEbyaZQsSC4a+KXjSLcnqqvQOz2juxXRUqxltuzwlYBj2pg7S
 jFrMzs+50pBrPEHMhJYcpE1TjyCDemN3Sd0etL4BxaocQo/aNlKeyMr6pZhU2jH7Rr
 TxBv3XBppqQgA==
Received: by mail-ed1-f48.google.com with SMTP id u18so12896570eda.3
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Apr 2022 07:20:47 -0700 (PDT)
X-Gm-Message-State: AOAM533OkMuTzhkPCGIq57Eh4xl/zy3/mfwtvkoqqSHTM8YDijlfoV2d
 VCs5+wkHQZ7NDl9Lr8gpRGULVWauHXDGN7u1Og==
X-Google-Smtp-Source: ABdhPJwQkbTe35To395M3KGFQV4l935J7hGJqs1dYrMx9rEk+J0ELzSpWfOjk+VIW7myhFOyzkXfRd5cnptK29wlYcI=
X-Received: by 2002:a05:6402:350d:b0:419:547f:134a with SMTP id
 b13-20020a056402350d00b00419547f134amr3964452edd.405.1650118845815; Sat, 16
 Apr 2022 07:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220411035843.19847-1-rex-bc.chen@mediatek.com>
 <20220411035843.19847-2-rex-bc.chen@mediatek.com>
 <YldWhNA6SwNBGXa8@robh.at.kernel.org>
In-Reply-To: <YldWhNA6SwNBGXa8@robh.at.kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 16 Apr 2022 22:20:38 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8L1EVvAOvD757o3kTq=AKf20yAsDGbuHFQ_mdkfoKwOg@mail.gmail.com>
Message-ID: <CAAOTY_8L1EVvAOvD757o3kTq=AKf20yAsDGbuHFQ_mdkfoKwOg@mail.gmail.com>
Subject: Re: [PATCH V2 1/3] dt-bindings: display: mediatek: Update disp_aal
 binding for MT8183
To: Rob Herring <robh@kernel.org>
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
Cc: DTML <devicetree@vger.kernel.org>, allen-kh.cheng@mediatek.com,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Nancy Lin <nancy.lin@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, krzk+dt@kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rob Herring <robh@kernel.org> =E6=96=BC 2022=E5=B9=B44=E6=9C=8814=E6=97=A5 =
=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=887:02=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, 11 Apr 2022 11:58:41 +0800, Rex-BC Chen wrote:
> > The driver data of MT8183 and MT8173 are different.
> >
> > For MT8173, the gamma module is inside disp_aal. When we need to adjust
> > gamma value, we need to use "has_gamma" to control gamma function
> > inside disp_aal to adjust the gamma value.
> >
> > For successors like MT8183, disp_gamma is separated from disp_aal. We
> > just need to control disp_gamma directly and don't need to control gamm=
a
> > function inside disp_aal.
> >
> > With this modification, the driver doesn't require any functional chang=
es.
> > We only update the dt-binding and DTS node to make it clear.
> >
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> > ---
> >  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml  | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
>
> Acked-by: Rob Herring <robh@kernel.org>

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.
