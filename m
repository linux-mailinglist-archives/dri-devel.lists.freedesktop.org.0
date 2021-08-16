Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A192D3ECE6C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 08:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B918589854;
	Mon, 16 Aug 2021 06:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E12D989854
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 06:07:37 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id cq23so7347287edb.12
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Aug 2021 23:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bcOvsnlJT1d9dnAvkvlt9SnlAkz5cg5CVjHW24mnbcE=;
 b=AG+wHQzsAHB+HuRiJtUUMh7y6KP3xdzMNs92u+0qQvnW9mpHu3geRUFi0cGiJqCWVC
 lOQJe5gN75pXtd6xYHRmLlvBztwyxDTL4CnGtxFafb7/3/UaLsr8t15DFZTPYWQl5cOn
 gnj8ipGHgfMRcyk1CIYdHav+1KDPuPxsz4CjZ1w9Mdv82z35Apd4KTp+gS6e8lmmt1Th
 UF4yn9MU1hva5c+RW7SuiGELsWHRCCClOWj6hIZOllTG/+BoFXVTMVEzttUtlxHaWFuQ
 Ddw67WZsgCjHXxS50C3eymvErKj2R0YC9EaFF37EeUcZspV7CiVnjP1prNwn7rr13oDP
 8C1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bcOvsnlJT1d9dnAvkvlt9SnlAkz5cg5CVjHW24mnbcE=;
 b=sHoiR9SIJL5hekb6wkpaaTjtue6rn5mN4/WVoHae3H3wi2c620oMaoXpLYGaSHQocj
 ipeT3AncIg+tvZ49onmAwQOOqVuft1une3LATfY+54CoJS5k31MP9fSIDOcTChOc0vTQ
 cXgn5dDg3q2uiCfGvKAe1JUOKU/rQYA4tfyYo+D5NIzVT0+0j4h5826ogmNrO4NI0yIZ
 aAmJXRdnbUt1n1HDg1mQH+dvhpJDS/11q+luGdcu2S5UojeZUTtZQzZJyd9XLk483o/o
 O//xmBxJ7XDwGN4rMA4uDO8m0pZtgEoiuTGeU0TOeKSyYJOuDu/zutCn8xNlEuXismAs
 v4ZQ==
X-Gm-Message-State: AOAM530g7ZbPKYO20oePi7Q3Sba03uNZzKpsYlCTXDd9yZsdXdZqI4pe
 almZjAitBYjrPLArqHVuSIzO6Ye98CdOPA87ZoM=
X-Google-Smtp-Source: ABdhPJzjH/bcVlrWEjvOvIrfgzEulvl7moPHxOgh+Jw4+FFyxhZG6hKHe3xD8eHYYGlOK2PUPTLKfneuQhOPL7L1VrI=
X-Received: by 2002:aa7:d40f:: with SMTP id z15mr18018364edq.113.1629094056370; 
 Sun, 15 Aug 2021 23:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210815235510.6597-1-chunkuang.hu@kernel.org>
In-Reply-To: <20210815235510.6597-1-chunkuang.hu@kernel.org>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 16 Aug 2021 16:07:24 +1000
Message-ID: <CAPM=9tzRt6vtxxWAcRThk9gSoqJoiTOq=j3obCdUjxGPumu=Dg@mail.gmail.com>
Subject: Re: [GIT PULL] mediatek drm next for 5.15
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
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

  CC [M]  drivers/gpu/drm/mediatek/mtk_disp_aal.o
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/mediatek/mtk_drm_crtc.c:=
257:13:
warning: =E2=80=98mtk_drm_cmdq_pkt_destroy=E2=80=99 defined but not used
[-Wunused-function]
  257 | static void mtk_drm_cmdq_pkt_destroy(struct mbox_chan *chan,
struct cmdq_pkt *pkt)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/mediatek/mtk_drm_crtc.c:=
229:12:
warning: =E2=80=98mtk_drm_cmdq_pkt_create=E2=80=99 defined but not used
[-Wunused-function]
  229 | static int mtk_drm_cmdq_pkt_create(struct mbox_chan *chan,
struct cmdq_pkt *pkt,
      |            ^~~~~~~~~~~~~~~~~~~~~~~
  LD [M]  drivers/gpu/drm/mediatek/mediatek-drm.o

Warning when built with CONFIG_MTK_CMDQ turned off. Can you please fix
that and resend?

Dave.

On Mon, 16 Aug 2021 at 09:55, Chun-Kuang Hu <chunkuang.hu@kernel.org> wrote=
:
>
> Hi, Dave & Daniel:
>
> This includes:
>
> 1. MT8133 AAL support, adjust rdma fifo threshold formula.
> 2. Implement mmap as GEM object function.
> 3. Add support for MT8167.
> 4. Test component initialization earlier in the function mtk_drm_crtc_cre=
ate.
> 5. CMDQ refinement.
>
> Regards,
> Chun-Kuang.
>
>
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58=
d3:
>
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git =
tags/mediatek-drm-next-5.15
>
> for you to fetch changes up to 6e7dcd92644baebdb137e3af900064ceebcaca23:
>
>   drm/mediatek: Clear pending flag when cmdq packet is done (2021-08-12 0=
8:16:24 +0800)
>
> ----------------------------------------------------------------
> Mediatek DRM Next for Linux 5.15
>
> 1. MT8133 AAL support, adjust rdma fifo threshold formula.
> 2. Implement mmap as GEM object function.
> 3. Add support for MT8167.
> 4. Test component initialization earlier in the function mtk_drm_crtc_cre=
ate.
> 5. CMDQ refinement.
>
> ----------------------------------------------------------------
> Chun-Kuang Hu (4):
>       drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb
>       drm/mediatek: Remove struct cmdq_client
>       drm/mediatek: Detect CMDQ execution timeout
>       drm/mediatek: Add cmdq_handle in mtk_crtc
>
> Dafna Hirschfeld (1):
>       drm/mediatek: Test component initialization earlier in the function=
 mtk_drm_crtc_create
>
> Fabien Parent (2):
>       dt-bindings: display: mediatek: dsi: add documentation for MT8167 S=
oC
>       drm/mediatek: Add support for main DDP path on MT8167
>
> Thomas Zimmermann (1):
>       drm/mediatek: Implement mmap as GEM object function
>
> Yongqiang Niu (4):
>       drm/mediatek: Adjust rdma fifo threshold calculate formula
>       drm/mediatek: Separate aal sub driver
>       drm/mediatek: Add mt8183 aal support
>       drm/mediatek: Clear pending flag when cmdq packet is done
>
>  .../bindings/display/mediatek/mediatek,dsi.txt     |   2 +-
>  drivers/gpu/drm/mediatek/Makefile                  |   3 +-
>  drivers/gpu/drm/mediatek/mtk_disp_aal.c            | 167 +++++++++++++++=
+++++
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h            |   9 ++
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |   6 +-
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c            | 173 +++++++++++++++=
++----
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |  42 +----
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  59 +++++--
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h             |   1 +
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c             |  44 ++----
>  drivers/gpu/drm/mediatek/mtk_drm_gem.h             |   3 -
>  11 files changed, 386 insertions(+), 123 deletions(-)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_aal.c
