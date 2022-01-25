Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3CF49B8F0
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 17:44:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0794F10E209;
	Tue, 25 Jan 2022 16:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D60F10E209
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 16:44:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AA21BB8187C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 16:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C92DFC340F3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 16:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643129067;
 bh=H5RYWVHLEF7hBelXtGAmQjOOxTr3ZKC1AcfdG0LUWzQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=R47mX52drvUrlL7Q4Y1Xr/wgrPFoMWxfnAVyTwN8ZPMCrjei5okuL+nvvnTE7ZV1o
 jFYDNH9Nj3wF2y9utevaVkPsJwxcOOphtSbFpHHjd8uCRudn3bYQtXSX/qGoJtb8yG
 8XnxU/QomCPTJs0vq1Vgsx9wyOwmAX1VrHFGn1KacteXhtqCWF6AuYXyKOu/Ma5eoT
 XTO59/RhXsDPs88sGwJtLSUwOFCBsP6heBGrZKjRBKb6W1+CritisMTBtYLhEEK+Ud
 eWkKfmpxMYUKN3pJBE2ZQnnVw3JvlpEnzSxwMR1JH29bVDbOYHZS5Tt3pJtr5Wabe2
 hVArpzFshBJaA==
Received: by mail-ej1-f45.google.com with SMTP id d10so31732107eje.10
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 08:44:27 -0800 (PST)
X-Gm-Message-State: AOAM532/qpeSknnNlVT7LUpiaV94jbKFHw4PFR8O7Y3KnmA8GFXmAt4+
 4XjB5+8zus0U9OTYkYDEN4LkG2XByzx9ZX61hA==
X-Google-Smtp-Source: ABdhPJxZ+7OI1k1HlLK70kQOOUHF/t4avWi15FYddefD8ktBIzegy6VbLiDBFPwtobYR8uak011eNfvkJALGQFkgLvs=
X-Received: by 2002:a17:906:4785:: with SMTP id
 cw5mr11543421ejc.406.1643129066032; 
 Tue, 25 Jan 2022 08:44:26 -0800 (PST)
MIME-Version: 1.0
References: <20220112150133.11275-1-jitao.shi@mediatek.com>
In-Reply-To: <20220112150133.11275-1-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 26 Jan 2022 00:44:14 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8v6UvcVcLL2ba-pOXD2UwF=qoTNNk9FNtK7CYDBQOfhQ@mail.gmail.com>
Message-ID: <CAAOTY_8v6UvcVcLL2ba-pOXD2UwF=qoTNNk9FNtK7CYDBQOfhQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: DP HPD Detect with debounce
To: Jitao Shi <jitao.shi@mediatek.com>
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
 Rex-BC Chen <rex-bc.chen@mediatek.com>, shuijing.li@mediatek.com,
 David Airlie <airlied@linux.ie>, huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 DTML <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Guillaume Ranquet <granquet@baylibre.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Jitao:

Jitao Shi <jitao.shi@mediatek.com> =E6=96=BC 2022=E5=B9=B41=E6=9C=8812=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8811:01=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> DP Spec 1.4a 3.3 requires dp detect the hpd with debounce.
>
> Upstream implementations should implement HPD signal de-bouncing on
> an external connection. A period of 100ms should be used for
> detecting an HPD connect event (i.e., the event, =E2=80=9CHPD high,=E2=80=
=9D is
> confirmed only after HPD has been continuously asserted for 100ms).
> Care should be taken to not implement de-bouncing on an IRQ_HPD and
> on a downstream device-generated pair of HPD disconnect/reconnect
> events (typically HPD shall be de-asserted for more than 2ms, but
> less than 100ms in this case). To cover these cases, HPD de-bounce
> should be implemented only after HPD low has been detected for 100ms.
>  Timing requirements in this Standard related to the detection of
> HPD high are to be interpreted as applying from the completion of an
> implementation-dependent de-bounce period.
>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---

mtk dp driver has not been upstreamed yet. This patch seems depend on
another series [1]. Please describe the dependency information here.

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D5974=
85

Regards,
Chun-Kuang.

>  drivers/gpu/drm/mediatek/mtk_dp.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index a256d55346a2..05f401a024a4 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -193,6 +193,8 @@ struct mtk_dp {
>         struct mutex eld_lock;
>         u8 connector_eld[MAX_ELD_BYTES];
>         struct drm_connector *conn;
> +       bool need_debounce;
> +       struct timer_list debounce_timer;
>  };
>
>  enum mtk_dp_sdp_type {
> @@ -2217,6 +2219,9 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd,=
 void *dev)
>         if (event < 0)
>                 return IRQ_HANDLED;
>
> +       if (mtk_dp->need_debounce && mtk_dp->train_info.cable_plugged_in)
> +               msleep(100);
> +
>         if (mtk_dp->drm_dev) {
>                 dev_info(mtk_dp->dev, "drm_helper_hpd_irq_event\n");
>                 drm_helper_hpd_irq_event(mtk_dp->bridge.dev);
> @@ -2296,6 +2301,14 @@ static irqreturn_t mtk_dp_hpd_isr_handler(struct m=
tk_dp *mtk_dp)
>                 mtk_dp->train_state =3D MTK_DP_TRAIN_STATE_STARTUP;
>         }
>         train_info->cable_state_change =3D true;
> +
> +       if (train_info->cable_state_change) {
> +               if (!train_info->cable_plugged_in) {
> +                       mod_timer(&mtk_dp->debounce_timer, jiffies + msec=
s_to_jiffies(100) - 1);
> +                       mtk_dp->need_debounce =3D false;
> +               }
> +       }
> +
>         return IRQ_WAKE_THREAD;
>  }
>
> @@ -2903,6 +2916,13 @@ static int mtk_dp_register_audio_driver(struct dev=
ice *dev)
>         return 0;
>  }
>
> +static void mtk_dp_debounce_timer(struct timer_list *t)
> +{
> +       struct mtk_dp *mtk_dp =3D from_timer(mtk_dp, t, debounce_timer);
> +
> +       mtk_dp->need_debounce =3D true;
> +}
> +
>  static int mtk_dp_probe(struct platform_device *pdev)
>  {
>         struct mtk_dp *mtk_dp;
> @@ -2990,6 +3010,9 @@ static int mtk_dp_probe(struct platform_device *pde=
v)
>         else
>                 mtk_dp->bridge.type =3D DRM_MODE_CONNECTOR_DisplayPort;
>
> +       mtk_dp->need_debounce =3D true;
> +       timer_setup(&mtk_dp->debounce_timer, mtk_dp_debounce_timer, 0);
> +
>         mtk_dp->bridge.ops =3D
>                 DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP=
_HPD;
>         drm_bridge_add(&mtk_dp->bridge);
> @@ -3008,6 +3031,7 @@ static int mtk_dp_remove(struct platform_device *pd=
ev)
>
>         mtk_dp_video_mute(mtk_dp, true);
>         mtk_dp_audio_mute(mtk_dp, true);
> +       del_timer_sync(&mtk_dp->debounce_timer);
>
>         pm_runtime_disable(&pdev->dev);
>
> --
> 2.12.5
>
