Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3083F3757
	for <lists+dri-devel@lfdr.de>; Sat, 21 Aug 2021 01:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2026EB3C;
	Fri, 20 Aug 2021 23:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494B96EB3C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 23:37:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 04616611C0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 23:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629502669;
 bh=OxoHRSxJUs/DBlJkRYNoMKiQU91unoLQ5Gw7U19zjro=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iutSkFHMi5IM7UGKgwlUCO6Rvp8RsehZouuXbR0LnvuWxu7EGGjB3JznVkOLUDnTI
 ZnzSp7r8BVQBIyFRiM6bqLknfCxlnlg9JBv5SRUK+E7Qet3AtFhdqZtFj45uF91VqZ
 0Snkc85VJijOSkdnI4tqD42gwqXoWHBRZ3uqp3K3ch9vJnmjCTRIxTpZv7nCAD2KKU
 reVkbWX7GIgfiZkRVQlmtqXQJqPc6xgOjVWPSCB9SdXWHMLG4FHUlJCv8swtDPhFz5
 lPvjgTnqa7fE8qZ7e/nGHrIhDOBELVocOCSth2LrmeK2et+5tLIzYDtyNE07lEnmDe
 2kQ2/mkDn6+0w==
Received: by mail-ej1-f54.google.com with SMTP id ia27so1014526ejc.10
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 16:37:48 -0700 (PDT)
X-Gm-Message-State: AOAM530SMSexDEXnTpz0JsjfN69BfVewJcDkwEtRrL8I6LBqjGeBrQ6W
 gR9LUuRn7C1f7HpHgosmCDcqwCWKDOc8ARIwlQ==
X-Google-Smtp-Source: ABdhPJyoX0rsifcLfFn0ncpSIxDlcJSTh5JTTO8orl9BlrUHsW13D079t4m+j2HQ+MYksTHDBQ3wtRBxiw+0NGaDS1Y=
X-Received: by 2002:a17:906:81cb:: with SMTP id
 e11mr1673753ejx.310.1629502667599; 
 Fri, 20 Aug 2021 16:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210818091847.8060-1-nancy.lin@mediatek.com>
 <20210818091847.8060-16-nancy.lin@mediatek.com>
In-Reply-To: <20210818091847.8060-16-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 21 Aug 2021 07:37:36 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8UUyT1u1bNqK-rNjKaFUo5=MVVrfMF6CUXmcXDb-xV1w@mail.gmail.com>
Message-ID: <CAAOTY_8UUyT1u1bNqK-rNjKaFUo5=MVVrfMF6CUXmcXDb-xV1w@mail.gmail.com>
Subject: Re: [PATCH v3 15/15] drm/mediatek: add mediatek-drm of vdosys1
 support for MT8195
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, singo.chang@mediatek.com, 
 srv_heupstream <srv_heupstream@mediatek.com>
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

Hi, Nancy:

Nancy.Lin <nancy.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B48=E6=9C=8818=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:18=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Add driver data of mt8195 vdosys1 to mediatek-drm and modify drm for
> multi-mmsys support. The two mmsys (vdosys0 and vdosys1) will bring
> up two drm drivers, only one drm driver register as the drm device.
> Each drm driver binds its own component. The first bind drm driver
> will allocate the drm device, and the last bind drm driver registers
> the drm device to drm core. Each crtc path is created with the
> corresponding drm driver data.

Separate this patch to two patch. One is support two mmsys, and
another one is support mt8195 vdosys1.

Regards,
Chun-Kuang.

>
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_merge.c   |   4 +
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  25 +-
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |   3 +-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  15 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 372 ++++++++++++++++----
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   8 +-
>  7 files changed, 354 insertions(+), 74 deletions(-)
>
>
