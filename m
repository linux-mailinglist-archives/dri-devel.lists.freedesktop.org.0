Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E6D4133E2
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 15:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A963B6E97E;
	Tue, 21 Sep 2021 13:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DC06E977
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 13:15:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 52BDD611C5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 13:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632230108;
 bh=iZqPsCMg2X8Aef7G1+KUsPh8b0qsPVUuFvS5wZqe3BM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tafmannM/RTxwrsCieXbTdU6RdU7MtZl5NfSR+548et6YkLW/guH2DSk/qPWCWfls
 QE5+KpN0U3+BYHe5X8ploQkXhqXfsIklfmV36LeJGD5s9xJs5SzUMwRXxaTjWOtVtI
 Cln1lnLLQ1EhZOMstDff6btm0euAZlKA5PaktFfnF5Ua7RqmgY72zi9beJnjKjwtoa
 am2oA+tmp+g3ukVwIUF03S4MenZkaScAxV/L48fvTZR3ILxz4+j0JNLCS6pPnIkgPc
 xlwz7wA4GTac00klwbkSb7WdzzaGI+ReO0/A8fmIrCMnKDkN2RX4AsegUHOu+iUxBW
 5MatNDly+KbUA==
Received: by mail-ed1-f47.google.com with SMTP id h17so74322450edj.6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 06:15:08 -0700 (PDT)
X-Gm-Message-State: AOAM532Pwh1a70NeILeFOJS0WNy+KO1wvfl7OFzXs5sr4OZhuuGuuw+D
 WoItYuwaYXfVumvh+GpfEKmVVUU3kc5nRQaC8A==
X-Google-Smtp-Source: ABdhPJzaQNMtEpU87qL4MJS8buFNHtKvHR7CLm3B8cBLx5LTsELv+5n4wF+8USFNS/0L8V+CNT/arQ73tExqtgeNbFA=
X-Received: by 2002:a17:907:995a:: with SMTP id
 kl26mr35090782ejc.6.1632230052399; 
 Tue, 21 Sep 2021 06:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210808234733.14782-1-chunkuang.hu@kernel.org>
 <CAAOTY_9LstZegE_Gyibov5tLo5eEqiPfoAcnyj_uoS=8xLLhnA@mail.gmail.com>
 <CAFqH_53M2OO8DpkPa3L7cwppVRYiUgEDjrLjK7JJNgKgxnQpVA@mail.gmail.com>
In-Reply-To: <CAFqH_53M2OO8DpkPa3L7cwppVRYiUgEDjrLjK7JJNgKgxnQpVA@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 21 Sep 2021 21:14:01 +0800
X-Gmail-Original-Message-ID: <CAAOTY__4ZKf8YwJWMHkiZRjbcnDuf4tcVPO=AG1V3pv9_-4bVw@mail.gmail.com>
Message-ID: <CAAOTY__4ZKf8YwJWMHkiZRjbcnDuf4tcVPO=AG1V3pv9_-4bVw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] CMDQ refinement of Mediatek DRM driver
To: Enric Balletbo Serra <eballetbo@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
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

Hi, Enric:

Enric Balletbo Serra <eballetbo@gmail.com> =E6=96=BC 2021=E5=B9=B49=E6=9C=
=8821=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=884:36=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> Hi Chun-Kuang,
>
> (again without html format, sorry for the noise)
>
> Missatge de Chun-Kuang Hu <chunkuang.hu@kernel.org> del dia dj., 12
> d=E2=80=99ag. 2021 a les 2:13:
> >
> > Chun-Kuang Hu <chunkuang.hu@kernel.org> =E6=96=BC 2021=E5=B9=B48=E6=9C=
=889=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=887:47=E5=AF=AB=E9=81=93=
=EF=BC=9A
> > >
> > > These refinements include using standard mailbox callback interface,
> > > timeout detection, and a fixed cmdq_handle.
> >
> > For this series, applied to mediatek-drm-next [1].
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.=
git/log/?h=3Dmediatek-drm-next
> >
>
> These patches seem to break the display on the Acer Chromebook R 13
> (MT8173) in the current mainline. After running a bisection it pointed
> me to the following commit
>
> commit f4be17cd5b14dd73545b0e014a63ebe9ab5ef837
> Author: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Date:   Sun Jul 4 15:36:48 2021 +0800
>
>     drm/mediatek: Remove struct cmdq_client
>
> Reverting this patch alone is not trivial, so I ended up reverting the
> full series, and I can confirm that reverting the full series makes
> the display work again.

I think you could not just revert "drm/mediatek: Remove struct
cmdq_client", you should also revert the patches after it, such as

"drm/mediatek: Clear pending flag when cmdq packet is done"
"drm/mediatek: Add cmdq_handle in mtk_crtc"
"drm/mediatek: Detect CMDQ execution timeout"

If "drm/mediatek: Remove struct cmdq_client" is the patch cause
display abnormal, I think you could compare code w/ and w/o this
patch. Focus on the value accuracy, such as cmdq_cl and cmdq_chan. And
focus on the flow accuracy, such as mtk_drm_crtc_update_config() and
ddp_cmdq_cb(). If this could not find the problem, I think the latest
way is to break this patch into small patches, changes little in each
small patches and we could finally find out the problem.

Regards,
Chun-Kuang.

>
> Unfortunately, after the merge window, different things broke for this
> device, and I didn't finish isolating them, and it is not clear to me
> yet whether the logs I'm getting are useful for this specific issue or
> not. Basically with this series merged the kernel seems to be stuck,
> and the display is not working. Latest message is
>
> [   12.329173] mtk-iommu 10205000.iommu: Partial TLB flush timed out,
> falling back to full flush
>
> Without the series, the kernel goes far and display works, however
> there are other issues affecting the cros-ec, but I think that's
> another issue.
>
> I'll try to dig a bit more, but, meanwhile, if you have any idea
> please let me know.
>
> Thanks,
>  Enric
>
>
> > Regards,
> > Chun-Kuang.
> >
> > >
> > > Changes in v2:
> > > 1. Define mtk_drm_cmdq_pkt_create() and mtk_drm_cmdq_pkt_destroy()
> > >    when CONFIG_MTK_CMDQ is reachable.
> > >
> > > Chun-Kuang Hu (4):
> > >   drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb
> > >   drm/mediatek: Remove struct cmdq_client
> > >   drm/mediatek: Detect CMDQ execution timeout
> > >   drm/mediatek: Add cmdq_handle in mtk_crtc
> > >
> > >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 110 ++++++++++++++++++++--=
--
> > >  1 file changed, 91 insertions(+), 19 deletions(-)
> > >
> > > --
> > > 2.25.1
> > >
