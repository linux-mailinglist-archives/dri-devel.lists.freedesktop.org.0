Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5155BBB3A
	for <lists+dri-devel@lfdr.de>; Sun, 18 Sep 2022 05:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 170A610E0F2;
	Sun, 18 Sep 2022 03:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E4D10E0D5
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 03:13:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E2782CE0AAE
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 03:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26108C433B5
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 03:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663470796;
 bh=LRQ7Yn7Y2hxNvjahNUw/EecsH7SQAePJuUfRRGZjyEE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pwmEzUYU5zClcC49iQSpvFDYP0PbyfpfRH1onQjuu1YB8D+oyqSPPDQAxxk+nJ92D
 BFgjiwordBrm4+RhwRFgjzvaE4ZoxkduRwVFl/MQMUUMgPrb/2DT6eLS+dILYUhL5o
 0nOeiDOK3JzD4QfPmWJcXDPvgwaXKJvAFYw217wADdzgyGsOsCrnwafQH6SUNC4wGs
 l0019ryNYcZVcuGUQh+7+OYoFcWwz8WwiJ2D1MbJGaU9RsbRnSA8yu8ysuRE6GBfHp
 nWxwyLMECAY7hMW6Q9DDow2Q8x7G7SwJ+U7k5hrP7O6EF5Mi4pDbneRFSWVcqOxI62
 XR8l5cMdv389Q==
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-1225219ee46so57533577fac.2
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 20:13:16 -0700 (PDT)
X-Gm-Message-State: ACgBeo2P0DxPcC3oKfd+HPbz18At5y0TWrWxntHBdktp+pV06u0uQNfB
 rWk2ueocrGi2LkBPcmqU0I8771Wia7BOF/M2Xw==
X-Google-Smtp-Source: AA6agR6eXe+fq7iUDggV9hXjR/lSX8dNsrfPvDT/6tur1J+cOglhQeQXkQqPmPKbPiqoI36tXYVl2ajUMYeCBwV7dls=
X-Received: by 2002:a05:6871:799:b0:11e:a2a3:dcae with SMTP id
 o25-20020a056871079900b0011ea2a3dcaemr11699691oap.69.1663470795260; Sat, 17
 Sep 2022 20:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220916133821.27980-1-rex-bc.chen@mediatek.com>
 <20220916133821.27980-2-rex-bc.chen@mediatek.com>
In-Reply-To: <20220916133821.27980-2-rex-bc.chen@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 18 Sep 2022 11:13:01 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-6HD9KYd66+PSKkgL_++0ka+-wg8_+WsGOmKcX8y2LCA@mail.gmail.com>
Message-ID: <CAAOTY_-6HD9KYd66+PSKkgL_++0ka+-wg8_+WsGOmKcX8y2LCA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/mediatek: dp: Reduce indentation in
 mtk_dp_bdg_detect()
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Guillaume Ranquet <granquet@baylibre.com>, Jitao Shi <jitao.shi@mediatek.com>,
 David Airlie <airlied@linux.ie>, liangxu.xu@mediatek.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Bo-Chen Chen <rex-bc.chen@mediatek.com> =E6=96=BC 2022=E5=B9=B49=E6=9C=8816=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E6=99=9A=E4=B8=8A9:38=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> In order to improve human readability, reduce the indentation by
> returning early if the dp/edp cable is not plugged in.

Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 66 ++++++++++++++++---------------
>  1 file changed, 34 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index dfa942ca62da..c72c646e25e9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -1933,39 +1933,41 @@ static enum drm_connector_status mtk_dp_bdg_detec=
t(struct drm_bridge *bridge)
>         bool enabled =3D mtk_dp->enabled;
>         u8 sink_count =3D 0;
>
> -       if (mtk_dp->train_info.cable_plugged_in) {
> -               if (!enabled) {
> -                       /* power on aux */
> -                       mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> -                                          DP_PWR_STATE_BANDGAP_TPLL_LANE=
,
> -                                          DP_PWR_STATE_MASK);
> -
> -                       /* power on panel */
> -                       drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP=
_SET_POWER_D0);
> -                       usleep_range(2000, 5000);
> -               }
> -               /*
> -                * Some dongles still source HPD when they do not connect=
 to any
> -                * sink device. To avoid this, we need to read the sink c=
ount
> -                * to make sure we do connect to sink devices. After this=
 detect
> -                * function, we just need to check the HPD connection to =
check
> -                * whether we connect to a sink device.
> -                */
> -               drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_coun=
t);
> -               if (DP_GET_SINK_COUNT(sink_count))
> -                       ret =3D connector_status_connected;
> -
> -               if (!enabled) {
> -                       /* power off panel */
> -                       drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP=
_SET_POWER_D3);
> -                       usleep_range(2000, 3000);
> -
> -                       /* power off aux */
> -                       mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> -                                          DP_PWR_STATE_BANDGAP_TPLL,
> -                                          DP_PWR_STATE_MASK);
> -               }
> +       if (!mtk_dp->train_info.cable_plugged_in)
> +               return ret;
> +
> +       if (!enabled) {
> +               /* power on aux */
> +               mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> +                                  DP_PWR_STATE_BANDGAP_TPLL_LANE,
> +                                  DP_PWR_STATE_MASK);
> +
> +               /* power on panel */
> +               drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POW=
ER_D0);
> +               usleep_range(2000, 5000);
>         }
> +       /*
> +        * Some dongles still source HPD when they do not connect to any
> +        * sink device. To avoid this, we need to read the sink count
> +        * to make sure we do connect to sink devices. After this detect
> +        * function, we just need to check the HPD connection to check
> +        * whether we connect to a sink device.
> +        */
> +       drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_count);
> +       if (DP_GET_SINK_COUNT(sink_count))
> +               ret =3D connector_status_connected;
> +
> +       if (!enabled) {
> +               /* power off panel */
> +               drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POW=
ER_D3);
> +               usleep_range(2000, 3000);
> +
> +               /* power off aux */
> +               mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> +                                  DP_PWR_STATE_BANDGAP_TPLL,
> +                                  DP_PWR_STATE_MASK);
> +       }
> +
>         return ret;
>  }
>
> --
> 2.18.0
>
