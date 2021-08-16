Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6AA3EE069
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 01:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545626E077;
	Mon, 16 Aug 2021 23:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9C26E077
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 23:27:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7DA6160FA0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 23:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629156439;
 bh=U+MTjFl11/u6xWB5BtdpYzmlHyUzJu+Q8daScItw0Cg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=A2RgO34IRtApOCJOXYxbRBREd17xQ2HUWdu10XS8ulaG8rBlRUDGRZ+R+qUqfODfI
 gjb866yPoy4xFUhm2NAxTmIwRsgD1Ay1MQdbR0elSi/I2xIZpVNMCGS1QuiPHOXaj2
 mLT61UTKGrRyNB4Z6Oev6mTD0RBz2ckCFalLhNx/S/nhCP7w6MsHZ7XNwQSGzWNWog
 4+LSv/a4stoSL7cbQRXavL54lH/oQRyRxoXZOVM1TQTcgLWNK8XJ58fpTIxV8s1BIV
 7f8jZmxAKe1zuzuzmHM6AwtsI2VLr8M2V+wj+yxPuShuzOyySYkF35I2QMcdHFbH57
 tZx21rKK9lfXA==
Received: by mail-ej1-f54.google.com with SMTP id hs10so34970244ejc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 16:27:19 -0700 (PDT)
X-Gm-Message-State: AOAM531iT+mxaGNyi8Uw1Aur/61gvi7gs/R9LYAK512RmiZzPH5t26G3
 fduHY4ayjyZB43u93sHBK7V1+/uhZM2SanGwAw==
X-Google-Smtp-Source: ABdhPJyD+UWc6ujt6+2QoBzqcFvrFIljTxCdUtCJLgv8gpSXwT3xdKp5M8OnSqQNETP997kqpRL9qHCiH/UBZd1uGUk=
X-Received: by 2002:a17:906:4156:: with SMTP id
 l22mr579077ejk.75.1629156438042; 
 Mon, 16 Aug 2021 16:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210815235510.6597-1-chunkuang.hu@kernel.org>
 <CAPM=9tzRt6vtxxWAcRThk9gSoqJoiTOq=j3obCdUjxGPumu=Dg@mail.gmail.com>
In-Reply-To: <CAPM=9tzRt6vtxxWAcRThk9gSoqJoiTOq=j3obCdUjxGPumu=Dg@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 17 Aug 2021 07:27:07 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8LZDtrM8QBN01q++tcMo0eTHv2GB=QO834L9XJo-vZEw@mail.gmail.com>
Message-ID: <CAAOTY_8LZDtrM8QBN01q++tcMo0eTHv2GB=QO834L9XJo-vZEw@mail.gmail.com>
Subject: Re: [GIT PULL] mediatek drm next for 5.15
To: Dave Airlie <airlied@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Fabien Parent <fparent@baylibre.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
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

Hi, Dave:

Dave Airlie <airlied@gmail.com> =E6=96=BC 2021=E5=B9=B48=E6=9C=8816=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=882:07=E5=AF=AB=E9=81=93=EF=BC=9A
>
>   CC [M]  drivers/gpu/drm/mediatek/mtk_disp_aal.o
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/mediatek/mtk_drm_crtc.=
c:257:13:
> warning: =E2=80=98mtk_drm_cmdq_pkt_destroy=E2=80=99 defined but not used
> [-Wunused-function]
>   257 | static void mtk_drm_cmdq_pkt_destroy(struct mbox_chan *chan,
> struct cmdq_pkt *pkt)
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/mediatek/mtk_drm_crtc.=
c:229:12:
> warning: =E2=80=98mtk_drm_cmdq_pkt_create=E2=80=99 defined but not used
> [-Wunused-function]
>   229 | static int mtk_drm_cmdq_pkt_create(struct mbox_chan *chan,
> struct cmdq_pkt *pkt,
>       |            ^~~~~~~~~~~~~~~~~~~~~~~
>   LD [M]  drivers/gpu/drm/mediatek/mediatek-drm.o
>
> Warning when built with CONFIG_MTK_CMDQ turned off. Can you please fix
> that and resend?

I've resent the v2 request. Sorry for the inconvenient.

Regards,
Chun-Kuang.

>
> Dave.
>
> On Mon, 16 Aug 2021 at 09:55, Chun-Kuang Hu <chunkuang.hu@kernel.org> wro=
te:
> >
> > Hi, Dave & Daniel:
> >
> > This includes:
> >
> > 1. MT8133 AAL support, adjust rdma fifo threshold formula.
> > 2. Implement mmap as GEM object function.
> > 3. Add support for MT8167.
> > 4. Test component initialization earlier in the function mtk_drm_crtc_c=
reate.
> > 5. CMDQ refinement.
> >
> > Regards,
> > Chun-Kuang.
> >
> >
> > The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba=
58d3:
> >
> >   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> >
> > are available in the Git repository at:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.gi=
t tags/mediatek-drm-next-5.15
> >
> > for you to fetch changes up to 6e7dcd92644baebdb137e3af900064ceebcaca23=
:
> >
> >   drm/mediatek: Clear pending flag when cmdq packet is done (2021-08-12=
 08:16:24 +0800)
> >
> > ----------------------------------------------------------------
> > Mediatek DRM Next for Linux 5.15
> >
> > 1. MT8133 AAL support, adjust rdma fifo threshold formula.
> > 2. Implement mmap as GEM object function.
> > 3. Add support for MT8167.
> > 4. Test component initialization earlier in the function mtk_drm_crtc_c=
reate.
> > 5. CMDQ refinement.
> >
> > ----------------------------------------------------------------
> > Chun-Kuang Hu (4):
> >       drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb
> >       drm/mediatek: Remove struct cmdq_client
> >       drm/mediatek: Detect CMDQ execution timeout
> >       drm/mediatek: Add cmdq_handle in mtk_crtc
> >
> > Dafna Hirschfeld (1):
> >       drm/mediatek: Test component initialization earlier in the functi=
on mtk_drm_crtc_create
> >
> > Fabien Parent (2):
> >       dt-bindings: display: mediatek: dsi: add documentation for MT8167=
 SoC
> >       drm/mediatek: Add support for main DDP path on MT8167
> >
> > Thomas Zimmermann (1):
> >       drm/mediatek: Implement mmap as GEM object function
> >
> > Yongqiang Niu (4):
> >       drm/mediatek: Adjust rdma fifo threshold calculate formula
> >       drm/mediatek: Separate aal sub driver
> >       drm/mediatek: Add mt8183 aal support
> >       drm/mediatek: Clear pending flag when cmdq packet is done
> >
> >  .../bindings/display/mediatek/mediatek,dsi.txt     |   2 +-
> >  drivers/gpu/drm/mediatek/Makefile                  |   3 +-
> >  drivers/gpu/drm/mediatek/mtk_disp_aal.c            | 167 +++++++++++++=
+++++++
> >  drivers/gpu/drm/mediatek/mtk_disp_drv.h            |   9 ++
> >  drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |   6 +-
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c            | 173 +++++++++++++=
++++----
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |  42 +----
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  59 +++++--
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.h             |   1 +
> >  drivers/gpu/drm/mediatek/mtk_drm_gem.c             |  44 ++----
> >  drivers/gpu/drm/mediatek/mtk_drm_gem.h             |   3 -
> >  11 files changed, 386 insertions(+), 123 deletions(-)
> >  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_aal.c
