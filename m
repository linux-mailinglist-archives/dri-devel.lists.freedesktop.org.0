Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4905168CE
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 00:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9764B10EC60;
	Sun,  1 May 2022 22:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6490D10EC60
 for <dri-devel@lists.freedesktop.org>; Sun,  1 May 2022 22:54:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 891C56112B
 for <dri-devel@lists.freedesktop.org>; Sun,  1 May 2022 22:54:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC2B7C385B3
 for <dri-devel@lists.freedesktop.org>; Sun,  1 May 2022 22:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651445687;
 bh=XYah/6Osmyojc17k6cqZ+vX1jwgljOTNKYJ/JeSQBfk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=px2suCI3Pu/bkCRbO5tygyBgCnMM71GOuMyeL9LyUC+OsRZ4FVjr/8GI6djLshrvc
 M19tpJz53lIURMRhXPy2XW85ZAeHo7k74/Oy2bhXdQVTSPw6UIEz6iBkcW0n4OEGuc
 SaRoGwLbS3qfyOEVT2ycxXzpFEqlwxiWGPFYsGEPzCagLtS4lZaENeuXI3lFeMNtS7
 Vck9W34Ic6AROOfxEwL89jMHFFypiHlT/chDQNttnQTa/mJMgZNyERq0ioqK61Lwc4
 GFuttc2DxKBcnMDQw89NpfG1DJ82UTeiCdmMi6tbiSSm5DOnpRgbA/VuH0chgtxE71
 49iYHjxXsDnog==
Received: by mail-yb1-f180.google.com with SMTP id m128so23501232ybm.5
 for <dri-devel@lists.freedesktop.org>; Sun, 01 May 2022 15:54:47 -0700 (PDT)
X-Gm-Message-State: AOAM533qgImF8OsBqGGIohiZR/dF+IJBeBoHE7W5LuBdCAOlU88VkMPF
 kyZDvBX2JViVzrN09eSar4UDh7hKSxT6OdRa/Q==
X-Google-Smtp-Source: ABdhPJyuplDBOy1HzgzBEurySzDISvnf65i4g3J7NP8mPSls5NwNyrHXj98ge6hOrTKJlam+L9WwpviYEfc1OEFPVok=
X-Received: by 2002:a25:d194:0:b0:645:7892:43b0 with SMTP id
 i142-20020a25d194000000b00645789243b0mr8501223ybg.35.1651445686885; Sun, 01
 May 2022 15:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220419094143.9561-1-jason-jh.lin@mediatek.com>
 <20220419094143.9561-9-jason-jh.lin@mediatek.com>
 <402f0e60-8d3c-850d-84ff-af5424b72b73@gmail.com>
In-Reply-To: <402f0e60-8d3c-850d-84ff-af5424b72b73@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 2 May 2022 06:54:35 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-jiX_BhaZ5+skRu4RSZLjcHJerVtwH34fz4N6_jbVK0w@mail.gmail.com>
Message-ID: <CAAOTY_-jiX_BhaZ5+skRu4RSZLjcHJerVtwH34fz4N6_jbVK0w@mail.gmail.com>
Subject: Re: [PATCH v20 8/8] soc: mediatek: remove DDP_DOMPONENT_DITHER from
 enum
To: Matthias Brugger <matthias.bgg@gmail.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, DTML <devicetree@vger.kernel.org>,
 "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Matthias:

Matthias Brugger <matthias.bgg@gmail.com> =E6=96=BC 2022=E5=B9=B44=E6=9C=88=
22=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=888:42=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
>
>
> On 19/04/2022 11:41, jason-jh.lin wrote:
> > After mmsys and drm change DITHER enum to DDP_COMPONENT_DITHER0,
> > mmsys header can remove the useless DDP_COMPONENT_DITHER enum.
> >
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
>
> Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
>
> Chun-Kuang, I think it would make sense to take that through your tree as=
 it
> depends on the previous patches.
>
> I provide you a stable tag so that you can take it:
> v5.18-next-vdso0-stable-tag

After I take this tag, I find one checkpatch warning:

WARNING: DT compatible string "mediatek,mt8195-mmsys" appears
un-documented -- check ./Documentation/devicetree/bindings/
#670: FILE: drivers/soc/mediatek/mtk-mmsys.c:390:
+               .compatible =3D "mediatek,mt8195-mmsys",

I think this tag lost one binding patch, it's better that this tag has
no this warning.

Regards,
Chun-Kuang.

>
> Regards,
> Matthias
>
> > ---
> >   include/linux/soc/mediatek/mtk-mmsys.h | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc=
/mediatek/mtk-mmsys.h
> > index 59117d970daf..fb719fd1281c 100644
> > --- a/include/linux/soc/mediatek/mtk-mmsys.h
> > +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> > @@ -16,8 +16,7 @@ enum mtk_ddp_comp_id {
> >       DDP_COMPONENT_CCORR,
> >       DDP_COMPONENT_COLOR0,
> >       DDP_COMPONENT_COLOR1,
> > -     DDP_COMPONENT_DITHER,
> > -     DDP_COMPONENT_DITHER0 =3D DDP_COMPONENT_DITHER,
> > +     DDP_COMPONENT_DITHER0,
> >       DDP_COMPONENT_DITHER1,
> >       DDP_COMPONENT_DP_INTF0,
> >       DDP_COMPONENT_DP_INTF1,
