Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C34A8455150
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 00:54:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14696E08E;
	Wed, 17 Nov 2021 23:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B68E6E08E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 23:54:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4112B61AD2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 23:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637193263;
 bh=J1GPu/7DId0gFFkAF/P1ZlWlsNgfqyTW7Xxtk5MAF78=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eglD8/Ff5UExZHvtAFulo93AlGR43TOwdfXGjlTXeh6JfTwcn4YQkqkcchR7fPxJB
 aoqrwRBeUbGzum0m3nLLSoyn5kXZhD25QcjZlxiTcRijP/DvTdofvA0cr3YglS5jhc
 mmlBqRys0LBvZfYYJrMbZ9ouFRLM7xF90zzWpy6dAnLaisMP6vswM/F/Sgguxp3Rr5
 LI6S+ntLyY96hMIphcQSpg0wqHjgjvGAMfQUml9oCwcAbDXpBY1EoamjfA1mgBBmgN
 JxkqlRJK+SmWafGVDHo9lqO+mFuo8OYK157544WRjNQneSPsBEY3Sueglp8fABMgPl
 w/Rucl0ER6DYg==
Received: by mail-ed1-f50.google.com with SMTP id l25so2100453eda.11
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 15:54:23 -0800 (PST)
X-Gm-Message-State: AOAM531FUbpqwWdWM6713N5NG+56f5PytHhR4IySkEJTPQN93+vdx/W+
 /1WETjDWgWzh9yAPOvXpLLxFDxxpkC7HvmMSNg==
X-Google-Smtp-Source: ABdhPJwDL01kt5145UOy/pd+bJ15+XrqohhADaSRLR5cZZfZhmsCH9yL9NqWbY7R0W20QsYKqPS3G6fDF3LYKeGoFVI=
X-Received: by 2002:a17:906:7955:: with SMTP id
 l21mr28765790ejo.6.1637193261641; 
 Wed, 17 Nov 2021 15:54:21 -0800 (PST)
MIME-Version: 1.0
References: <20211028101912.4624-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20211028101912.4624-1-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 18 Nov 2021 07:54:10 +0800
X-Gmail-Original-Message-ID: <CAAOTY__ZbHGef_nVA9N0cXNN5xNwdVGE9DCSo04KZvDiowbgww@mail.gmail.com>
Message-ID: <CAAOTY__ZbHGef_nVA9N0cXNN5xNwdVGE9DCSo04KZvDiowbgww@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] CMDQ refinement of Mediatek DRM driver
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Fei Shao <fshao@chromium.org>,
 David Airlie <airlied@linux.ie>, singo.chang@mediatek.com,
 Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Nancy Lin <nancy.lin@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Jason:

For this series except [v6,3/6] drm/mediatek: Detect CMDQ execution
timeout (I pick v5), applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

jason-jh.lin <jason-jh.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B410=E6=9C=88=
28=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:19=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Change in v6:
> 1. Drop the redundant checking of cmdq_vblank_cnt .
> 2. fix the indent.
>
> Change in v5:
> 1. Move mbox_free_channel to a independent patch.
>
> Change in v4:
> 1. Add cmdq_vblank_cnt initial value to 3.
> 2. Move mtk_drm_cmdq_pkt_create to the same define scope with
>    mtk_drm_cmdq_pkt_destroy.
>
> Change in v3:
> 1. Revert "drm/mediatek: clear pending flag when cmdq packet is done"
>    and add it after the CMDQ refinement patches.
> 2. Change the remove of struct cmdq_client to remove the pointer of
>    struct cmdq_client.
> 3. Fix pkt buf alloc once but free many times.
>
> Changes in v2:
> 1. Define mtk_drm_cmdq_pkt_create() and mtk_drm_cmdq_pkt_destroy()
>    when CONFIG_MTK_CMDQ is reachable.
>
> Chun-Kuang Hu (4):
>   drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb
>   drm/mediatek: Remove the pointer of struct cmdq_client
>   drm/mediatek: Detect CMDQ execution timeout
>   drm/mediatek: Add cmdq_handle in mtk_crtc
>
> Yongqiang Niu (1):
>   drm/mediatek: Clear pending flag when cmdq packet is done
>
> jason-jh.lin (1):
>   drm/mediatek: Add mbox_free_channel in mtk_drm_crtc_destroy
>
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 175 ++++++++++++++++++++----
>  1 file changed, 151 insertions(+), 24 deletions(-)
>
> --
> 2.18.0
>
