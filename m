Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B574341303B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 10:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E05AB6E910;
	Tue, 21 Sep 2021 08:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 872436E920
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 08:36:52 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id s69so21166414oie.13
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 01:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bg3GdEDta4alq5EcpFnKMHpnaJigutsFTYZs6RKXRos=;
 b=ZcFBBgvctstgt5BhYORG28cC2JeYUdHavEY11rLRXIZvTkm8Yu5uJVKhUXDjwFImiZ
 r/axHGTlAB+yxUTSTbKqOhuVqpsHspq+986dff4TH6985kUVPib7cXfSjIB+G7pVNBzn
 dMtirIg9a9z4Cg58clgML0lnqbFg9H7GuwArqrNOEowK0V+S3oN75xO8adhAugIfY4Uj
 2QXgCUbmQGJ2KqCwDfSscJiIn/MWaqf7s69HTZlNS1Eq4zO10K3NSaHZzNYjQ9O4ASoF
 K7VirpStOPOKGScn4nNYRoG2AC6YuDVoR6wEf57DeA0h8DQsGJeKqCQdY+nBxCw55Aey
 IMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bg3GdEDta4alq5EcpFnKMHpnaJigutsFTYZs6RKXRos=;
 b=r+pctGN4un5LeVg5q5iMxIAEhqeHAmUM+j6y/2sbHDpN45UEAcVHvHfYDeg3o5TSpC
 Pzjr5LrpusCHN9L6rd9M0QhSDeEYAPHDYVIvTjhCaU6twuNjsML0k1tzipwip0QINNHO
 aCOddXqBC/K9U+u/4UucWFI2swic8KkyyYaAKQYYZbyRYRL7F3R6BvRIA1DNAp/GJndd
 QerO6N+80IF3rSz8Xes2UJewd41RanK5SAi2rCC+5WQmsaz9FaElIXG5vi6ZyysU3jmw
 mqIMMrPc7WD+pHGTfL8Q7g4cgHhEM4G9S7X1Te9dr3lhxEb79oJn1DwARpM+RnhGqhhm
 T5/g==
X-Gm-Message-State: AOAM533IfCRoo9UZf19+t8yCPmM9foJMCJME1El5077hkN76To9RKj0C
 33Ys8sCgYxE4hfgTh2LpKwr3AFCjsu93HVY4QHI=
X-Google-Smtp-Source: ABdhPJz5b/t20bc16VMoDEDAs3Czo0etpYXIUTXIwcba8wdCT/5iOp8lmpW35rcqNJGzZ/xm3fh6WNrdzNR/tqD3mxs=
X-Received: by 2002:aca:210d:: with SMTP id 13mr2651010oiz.47.1632213411694;
 Tue, 21 Sep 2021 01:36:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210808234733.14782-1-chunkuang.hu@kernel.org>
 <CAAOTY_9LstZegE_Gyibov5tLo5eEqiPfoAcnyj_uoS=8xLLhnA@mail.gmail.com>
In-Reply-To: <CAAOTY_9LstZegE_Gyibov5tLo5eEqiPfoAcnyj_uoS=8xLLhnA@mail.gmail.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Tue, 21 Sep 2021 10:36:39 +0200
Message-ID: <CAFqH_53M2OO8DpkPa3L7cwppVRYiUgEDjrLjK7JJNgKgxnQpVA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] CMDQ refinement of Mediatek DRM driver
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
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

Hi Chun-Kuang,

(again without html format, sorry for the noise)

Missatge de Chun-Kuang Hu <chunkuang.hu@kernel.org> del dia dj., 12
d=E2=80=99ag. 2021 a les 2:13:
>
> Chun-Kuang Hu <chunkuang.hu@kernel.org> =E6=96=BC 2021=E5=B9=B48=E6=9C=88=
9=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=887:47=E5=AF=AB=E9=81=93=EF=
=BC=9A
> >
> > These refinements include using standard mailbox callback interface,
> > timeout detection, and a fixed cmdq_handle.
>
> For this series, applied to mediatek-drm-next [1].
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.gi=
t/log/?h=3Dmediatek-drm-next
>

These patches seem to break the display on the Acer Chromebook R 13
(MT8173) in the current mainline. After running a bisection it pointed
me to the following commit

commit f4be17cd5b14dd73545b0e014a63ebe9ab5ef837
Author: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date:   Sun Jul 4 15:36:48 2021 +0800

    drm/mediatek: Remove struct cmdq_client

Reverting this patch alone is not trivial, so I ended up reverting the
full series, and I can confirm that reverting the full series makes
the display work again.

Unfortunately, after the merge window, different things broke for this
device, and I didn't finish isolating them, and it is not clear to me
yet whether the logs I'm getting are useful for this specific issue or
not. Basically with this series merged the kernel seems to be stuck,
and the display is not working. Latest message is

[   12.329173] mtk-iommu 10205000.iommu: Partial TLB flush timed out,
falling back to full flush

Without the series, the kernel goes far and display works, however
there are other issues affecting the cros-ec, but I think that's
another issue.

I'll try to dig a bit more, but, meanwhile, if you have any idea
please let me know.

Thanks,
 Enric


> Regards,
> Chun-Kuang.
>
> >
> > Changes in v2:
> > 1. Define mtk_drm_cmdq_pkt_create() and mtk_drm_cmdq_pkt_destroy()
> >    when CONFIG_MTK_CMDQ is reachable.
> >
> > Chun-Kuang Hu (4):
> >   drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb
> >   drm/mediatek: Remove struct cmdq_client
> >   drm/mediatek: Detect CMDQ execution timeout
> >   drm/mediatek: Add cmdq_handle in mtk_crtc
> >
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 110 ++++++++++++++++++++----
> >  1 file changed, 91 insertions(+), 19 deletions(-)
> >
> > --
> > 2.25.1
> >
