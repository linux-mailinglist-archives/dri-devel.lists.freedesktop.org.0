Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BDA5A1503
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 17:02:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671E810E59A;
	Thu, 25 Aug 2022 15:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6DB810E59A
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 15:02:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 622E161983
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 15:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6472C4347C
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 15:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661439734;
 bh=wjzgRFEte1JYnIbn0TO9+w6aujcip3bCGZB7ym5Hwqc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HkRRkzc9iafdkf9TMuKnfqx+MEHwzecpp3cFlYHeVXNhCy0CydbQiOhMjHVpUe1oY
 z8ppkiRKmmBFXy8f/xvVskAEuR1DQ1GbwTz1qoYisg/Y8P4wll3wAnJK/wKYTf0nXf
 xsJRoaTa+1V6PkhjmQOey5EARkduy8bSNR2rHEEQDuXpbw3h2n92Z92JFsPqEHUa/0
 1jKFsx0C/45mNLfBD0fpSBeWj375DsH5odKJKfTgMGAhCTSA93C0jFG1ptbeqrC8fr
 N2BvGI2buJudq0B41JKkljHZXQK/DCwDHSvY+vz7rLCQM2dc+APZ8lGhH/E0tvXNZM
 /qTPFWo3Z3XIw==
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-11d7a859b3aso14018971fac.4
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 08:02:14 -0700 (PDT)
X-Gm-Message-State: ACgBeo3PkcPFnt3mHtbJupBJCvsxThnYQraZC5mbSae0iYhVLlgaAqrM
 MrobPGagEYd02RkL6dWDCLxw9eStGb4Dmz8YuQ==
X-Google-Smtp-Source: AA6agR70oWHotJ5zvAGB1qZOQksOWhU541/A7VrzrBgK6KvY/ErP5FdHQ4RJbVcMw2k+yzFchbHSwLv1yStFufhZmaA=
X-Received: by 2002:a05:6870:4690:b0:11c:d599:4f41 with SMTP id
 a16-20020a056870469000b0011cd5994f41mr5866261oap.69.1661439733913; Thu, 25
 Aug 2022 08:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220721172727.14624-1-angelogioacchino.delregno@collabora.com>
 <CAGXv+5H+BQcT=JTD3Y1necym=6uLHD8HgWpjjpyTLSin9D1KNA@mail.gmail.com>
In-Reply-To: <CAGXv+5H+BQcT=JTD3Y1necym=6uLHD8HgWpjjpyTLSin9D1KNA@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 25 Aug 2022 23:01:54 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-KS8XTqcaNRpzc0xfO23KfdTy8Gx=yGtGWLQJEcgsWjw@mail.gmail.com>
Message-ID: <CAAOTY_-KS8XTqcaNRpzc0xfO23KfdTy8Gx=yGtGWLQJEcgsWjw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dsi: Add atomic {destroy, duplicate}_state, 
 reset callbacks
To: Chen-Yu Tsai <wenst@chromium.org>
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
 xinlei.lee@mediatek.com, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Chen-Yu Tsai <wenst@chromium.org> =E6=96=BC 2022=E5=B9=B48=E6=9C=8819=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E6=99=9A=E4=B8=8A9:29=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Fri, Jul 22, 2022 at 1:27 AM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Add callbacks for atomic_destroy_state, atomic_duplicate_state and
> > atomic_reset to restore functionality of the DSI driver: this solves
> > vblank timeouts when another bridge is present in the chain.
> >
> > Tested bridge chain: DSI <=3D> ANX7625 =3D> aux-bus panel
> >

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

> > Fixes: 7f6335c6a258 ("drm/mediatek: Modify dsi funcs to atomic operatio=
ns")
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
>
> This patch is now needed on top of v6.0-rc1, otherwise booting will
> stall for a while waiting for display vblank, which never happens
> because the DSI pipeline is not configured correctly.
>
> ChenYu
>
> > ---
> >
> > Note: The commit that has been mentioned in the Fixes tag should
> >       *not* have my Reviewed-by tag, as the author changed it but
> >       erroneously retained the tag that I had released for an
> >       earlier version of that commit (which was fine, but the new
> >       version broke mtk_dsi!).
> >
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/media=
tek/mtk_dsi.c
> > index 9cc406e1eee1..5b624e0f5b0a 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -808,10 +808,13 @@ static void mtk_dsi_bridge_atomic_post_disable(st=
ruct drm_bridge *bridge,
> >
> >  static const struct drm_bridge_funcs mtk_dsi_bridge_funcs =3D {
> >         .attach =3D mtk_dsi_bridge_attach,
> > +       .atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_stat=
e,
> >         .atomic_disable =3D mtk_dsi_bridge_atomic_disable,
> > +       .atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_=
state,
> >         .atomic_enable =3D mtk_dsi_bridge_atomic_enable,
> >         .atomic_pre_enable =3D mtk_dsi_bridge_atomic_pre_enable,
> >         .atomic_post_disable =3D mtk_dsi_bridge_atomic_post_disable,
> > +       .atomic_reset =3D drm_atomic_helper_bridge_reset,
> >         .mode_set =3D mtk_dsi_bridge_mode_set,
> >  };
> >
> > --
> > 2.35.1
> >
