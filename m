Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A11A5BBB67
	for <lists+dri-devel@lfdr.de>; Sun, 18 Sep 2022 05:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B92C10E44F;
	Sun, 18 Sep 2022 03:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE5410E44F
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 03:56:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 64CAACE0B61
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 03:56:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB64EC43140
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 03:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663473396;
 bh=zQBJ7g2dqPG3Wawo+dvaGCD0KbnK53uZvn6GoJzaFIw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=E5oC4XqGGp/sVSgGqAhm7E22u2KyApjDGDuUC6RU892A/kOWmAiV0BhvnAJgAC3cq
 bGpUIrDr9Ldryu1IUCmrhdrE/1TcCozKd1sPYxm2wfu5996kvhrC1pUlXqAGoHfNqq
 DvYmQ1Mc5hQXbiNY0hdXpm4JfRWEVwhY0Dty1cfY2RCBSWl8Gm8k75bwoPsmtgfUNb
 ejjvxUz3C/swtapFoN3o6UngAnsVdo9cU5sgjQekauR+W3lIaY2dNj/wnDvR/EFIkZ
 L84rmG7j7yYf49OZGaKo65FXVVn7guMgWsM0ICK6QytyNLZ9rdCiJotdVZ3/R39qHk
 FwsSOfmfn/gtg==
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-1274ec87ad5so57671118fac.0
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 20:56:36 -0700 (PDT)
X-Gm-Message-State: ACgBeo3qVWBBCB+tPCKGrtrqRKPIWh/oZiYjmHQmk5ujiU1517LV9YDD
 e3vodbvPtArO/mNpI74UGfuVKhrueStUVGzKOg==
X-Google-Smtp-Source: AA6agR72JrAxWr7yPtw1xlQbAjWKiFgKegrMAxPQ0bdLhuwUE3ebcH4uk0sky4W+STGpW400sMmg5/ZC5SSkXM+uc08=
X-Received: by 2002:a05:6871:799:b0:11e:a2a3:dcae with SMTP id
 o25-20020a056871079900b0011ea2a3dcaemr11745800oap.69.1663473395662; Sat, 17
 Sep 2022 20:56:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220913134929.1970187-1-yangyingliang@huawei.com>
 <6051fab8-e198-fd58-2dfe-b2b344b67c15@collabora.com>
In-Reply-To: <6051fab8-e198-fd58-2dfe-b2b344b67c15@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 18 Sep 2022 11:56:23 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8yTkkBNEv=MgRj2+JQM0=bD+z2wFsTT7n6uEC0ay1L9g@mail.gmail.com>
Message-ID: <CAAOTY_8yTkkBNEv=MgRj2+JQM0=bD+z2wFsTT7n6uEC0ay1L9g@mail.gmail.com>
Subject: Re: [PATCH -next] drm/mediatek: dp: change mtk_dp_driver to static
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yang Yingliang <yangyingliang@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dmity:

My tree has no mtk dp driver yet. Would you like to pick this patch?

Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Dmitry Osipenko <dmitry.osipenko@collabora.com> =E6=96=BC 2022=E5=B9=B49=E6=
=9C=8815=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=885:04=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> On 9/13/22 16:49, Yang Yingliang wrote:
> > mtk_dp_driver is only used in mtk_dp.c now, change it
> > to static.
> >
> > Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort dri=
ver")
> > Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediat=
ek/mtk_dp.c
> > index dfa942ca62da..6a8c0f4c5c09 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> > @@ -2642,7 +2642,7 @@ static const struct of_device_id mtk_dp_of_match[=
] =3D {
> >  };
> >  MODULE_DEVICE_TABLE(of, mtk_dp_of_match);
> >
> > -struct platform_driver mtk_dp_driver =3D {
> > +static struct platform_driver mtk_dp_driver =3D {
> >       .probe =3D mtk_dp_probe,
> >       .remove =3D mtk_dp_remove,
> >       .driver =3D {
>
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>
> --
> Best regards,
> Dmitry
>
