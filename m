Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4C75B63FC
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 01:19:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C4910E465;
	Mon, 12 Sep 2022 23:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF5810E465
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 23:19:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 1625BCE10B5
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 23:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FB9DC433D7
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 23:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663024736;
 bh=Cbxm+wScoYOf9uPveDUFKU8DcvePcdgz86AWflGIWGY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rvTMuQ7WeoupNppQh23rMin98zJBenTTh0ffkK+vAqBMaNLE4c3BzIakEvwtytdTA
 zcFFV8BbKHNLWAnAEwG4o6mYHbTnzD8r+6TIc3Jtz8aS3S68BRvkIuSIZWRX0to0SQ
 orZAAg64mcK9WhsBrPW7i3PyHosRp13pm9ouNzxRhF4B5sF6sZdTQoiPaTr7A6HIpd
 h/XBvDcW7OPYMf73P3PGafLlm+/TLf/b045wwxLeFUhZ+8xcuG2LoLX6CQiFxQ24L2
 J5h91f5jmTXwzBtnKBaq7HAmlrhOvhtIC5x6wjWHGeDgc1An/6BW8XgjlxRxqIND5+
 3Humv28P1fyGQ==
Received: by mail-ot1-f50.google.com with SMTP id
 v2-20020a056830090200b006397457afecso6906734ott.13
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 16:18:56 -0700 (PDT)
X-Gm-Message-State: ACgBeo1p9fgtdumF3V1Wz618Ps2RtR0oXVIPMqXq36WIc2gVxvXwXIa1
 yujxuFVsPapcXP/pYpAy2qv2Ak6qxRGLpKtuGw==
X-Google-Smtp-Source: AA6agR55s+Nptinq02WALbixXv8dp5IISYyISRrmH3F234MXAeWMGzIeiugX1fRAbtZ5vhUEAsCawoybA9uXwAw5ejc=
X-Received: by 2002:a05:6830:6999:b0:61d:26f8:94c1 with SMTP id
 cy25-20020a056830699900b0061d26f894c1mr11827454otb.278.1663024735220; Mon, 12
 Sep 2022 16:18:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220908141205.18256-1-allen-kh.cheng@mediatek.com>
In-Reply-To: <20220908141205.18256-1-allen-kh.cheng@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 13 Sep 2022 07:18:39 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9=cNCLhvCAEnPsw3Y4iBE=g9aTS+QLZXDVZH8N3cj+xQ@mail.gmail.com>
Message-ID: <CAAOTY_9=cNCLhvCAEnPsw3Y4iBE=g9aTS+QLZXDVZH8N3cj+xQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Fix wrong dither settings
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
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
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Allen:

Allen-KH Cheng <allen-kh.cheng@mediatek.com> =E6=96=BC 2022=E5=B9=B49=E6=9C=
=888=E6=97=A5 =E9=80=B1=E5=9B=9B =E6=99=9A=E4=B8=8A10:12=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> The width and height arguments in the cmdq packet for mtk_dither_config()
> are inverted. We fix the incorrect width and height for dither settings
> in mtk_dither_config().

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 73d3724745db ("drm/mediatek: Adjust to the alphabetic order for me=
diatek-drm")
> Co-developed-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.c
> index 2d72cc5ddaba..6b6d5335c834 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -157,7 +157,7 @@ static void mtk_dither_config(struct device *dev, uns=
igned int w,
>  {
>         struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
>
> -       mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,=
 DISP_REG_DITHER_SIZE);
> +       mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs,=
 DISP_REG_DITHER_SIZE);
>         mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv-=
>regs,
>                       DISP_REG_DITHER_CFG);
>         mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, DISP_REG_=
DITHER_CFG,
> --
> 2.18.0
>
