Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B35C1421AE0
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 01:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E326E296;
	Mon,  4 Oct 2021 23:53:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4DB6E296
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 23:53:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id ADC1C615A6
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 23:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633391596;
 bh=KacuFmoUGvcXzM9fllt69Pg7UBDWLYu7j2eBaHhQ04c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=t3GtKPhlMlF01/ThMVlitLmMDrfl19dhlT7zN6/NvKndee70E/iTNLDAh2lokJ62O
 ADwVmTCbHSzMXX1Ns6ReI3hD1Fxkcg9YzGKazko9ndwU841j9O7n3m/whWVjD3smN3
 qa4+wp6n/3Qr3j8ONaFHbCKRCRIX4NcmKcQJtgJsFaaLJTr3hnUOVXpzdZ3zcvQ1rK
 S84jpNZks49oyomLxJ25h3pFfKSUU3cPI+s1pvEayUXePzHyktrIx4LY00WKUAhchF
 SDKZdsgcXmeqC1PkIOAdqHGWqVONA+l6FFsZv0WkZWCuo2fo9Gr1KEy3ZOm7PgP2uO
 iWLsbEXhhN0+w==
Received: by mail-ed1-f45.google.com with SMTP id r18so71128066edv.12
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 16:53:16 -0700 (PDT)
X-Gm-Message-State: AOAM532ny87v6/B0l1sTWs4t1YDmsE3IFge+52u/3N8di6GdZU2aGLOx
 P2KtAPZw3cbIa+1mhKCFyHPG4F30CGLUXUREaw==
X-Google-Smtp-Source: ABdhPJwGp2DqpTNo0P4lu0bDreSkPUWiH27/pIjz21Rlva5heOvqliI+Up3iksR2Jw2wostBa8zwm00N0d1+Hs27N/U=
X-Received: by 2002:a17:906:3181:: with SMTP id
 1mr21316647ejy.388.1633391595236; 
 Mon, 04 Oct 2021 16:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210915223117.7857-1-jitao.shi@mediatek.com>
 <20210915223117.7857-2-jitao.shi@mediatek.com>
In-Reply-To: <20210915223117.7857-2-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 5 Oct 2021 07:53:04 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8H=TE8574xB3FFcGVgN_fTb_83+FT8ei1CDuB4k4-Oew@mail.gmail.com>
Message-ID: <CAAOTY_8H=TE8574xB3FFcGVgN_fTb_83+FT8ei1CDuB4k4-Oew@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] drm/dsi: transer dsi hs packet aligned
To: Jitao Shi <jitao.shi@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, CK Hu <ck.hu@mediatek.com>, 
 stonea168@163.com, huijuan.xie@mediatek.com, 
 Rex-BC Chen <rex-bc.chen@mediatek.com>, shuijing.li@mediatek.com
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

Hi, Jitao:

Jitao Shi <jitao.shi@mediatek.com> =E6=96=BC 2021=E5=B9=B49=E6=9C=8816=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=886:31=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Some DSI devices reqire the hs packet starting and ending
> at same time on all dsi lanes. So use a flag to those devices.
>

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  include/drm/drm_mipi_dsi.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index af7ba8071eb0..8e8563792682 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -177,6 +177,7 @@ struct mipi_dsi_device_info {
>   * @lp_rate: maximum lane frequency for low power mode in hertz, this sh=
ould
>   * be set to the real limits of the hardware, zero is only accepted for
>   * legacy drivers
> + * @hs_packet_end_aligned: transfer dsi hs packet ending aligned
>   */
>  struct mipi_dsi_device {
>         struct mipi_dsi_host *host;
> @@ -189,6 +190,7 @@ struct mipi_dsi_device {
>         unsigned long mode_flags;
>         unsigned long hs_rate;
>         unsigned long lp_rate;
> +       bool hs_packet_end_aligned;
>  };
>
>  #define MIPI_DSI_MODULE_PREFIX "mipi-dsi:"
> --
> 2.25.1
