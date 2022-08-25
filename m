Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B46C5A1D3D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 01:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B728210E584;
	Thu, 25 Aug 2022 23:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C66810E584
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 23:39:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CDF11B82F3F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 23:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A2FDC43140
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 23:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661470744;
 bh=VUu5XtDzSApD4jLb7/Kt0DoXKUHclEkJ4teSyXFURGA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rD8xvt2pteiCf7B0fVx16f3admXr98oUj03A6jJl33zd/hBrlyoBzEuf62ecPkzn1
 d0O2JYJRpVthX+cP8GQX4aDEhfPUPAGLYEqnMtUJQhX0X1ATcMMIbHcrG4u2ifqSd9
 AS2QUhvdNqdXaPwM/0ymaqSZjsCFX12KFHxcqPACKrSID0C98MAfl3L9Bcz8zRtMg+
 oOqcgpK7sC1h1V331+rE2xU0iTl1/hkYCD1QXXbYdkFujycqruC9LZuXmEvX4+ij20
 KAMSIQN2C19FDrJAHSwg9naMe0mux8v59pzsDyN6moWW9VoigbqT7oAsMdB/Y4YD8u
 NjkGnIHGUCdQw==
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-11c5505dba2so79286fac.13
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 16:39:04 -0700 (PDT)
X-Gm-Message-State: ACgBeo1XnPEP9RynODs4Tbybgr1w5GEu/BiEk8/pNXzcKuXK5ji/TdmQ
 XEY5TuBnmXwbv6Hkw2c0oabKUIXryXhp8LvgnQ==
X-Google-Smtp-Source: AA6agR4yMz40Tc+owCwkA0C1natVNZY/C/63StQqXp7qxYkhIoBcWs+BRlYcrECKpE6WFMhpawFp3BSWiY7+jb/YoyY=
X-Received: by 2002:a05:6870:4690:b0:11c:d599:4f41 with SMTP id
 a16-20020a056870469000b0011cd5994f41mr634922oap.69.1661470743518; Thu, 25 Aug
 2022 16:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220825072335.228921-1-ye.xingchen@zte.com.cn>
In-Reply-To: <20220825072335.228921-1-ye.xingchen@zte.com.cn>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 26 Aug 2022 07:38:51 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-oP0QOpk0Zo_VGrdBoUgn78PhXeYUr-WPvpVcAHx+rEg@mail.gmail.com>
Message-ID: <CAAOTY_-oP0QOpk0Zo_VGrdBoUgn78PhXeYUr-WPvpVcAHx+rEg@mail.gmail.com>
Subject: Re: [PATCH linux-next v2] drm/mediatek: Remove the unneeded result
To: cgel.zte@gmail.com
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 ye xingchen <ye.xingchen@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, cgel:

<cgel.zte@gmail.com> =E6=96=BC 2022=E5=B9=B48=E6=9C=8825=E6=97=A5 =E9=80=B1=
=E5=9B=9B =E4=B8=8B=E5=8D=883:24=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: ye xingchen <ye.xingchen@zte.com.cn>
>
> Return the value drm_mode_config_helper_suspend() directly instead of
>  storing it in another redundant variable.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> ---
> v1 -> v2
> Add all the mailinglists that get_maintainers.pl give.
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 5f02f8d0e4fc..91f58db5915f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -833,11 +833,8 @@ static int mtk_drm_sys_prepare(struct device *dev)
>  {
>         struct mtk_drm_private *private =3D dev_get_drvdata(dev);
>         struct drm_device *drm =3D private->drm;
> -       int ret;
> -
> -       ret =3D drm_mode_config_helper_suspend(drm);
>
> -       return ret;
> +       return drm_mode_config_helper_suspend(drm);
>  }
>
>  static void mtk_drm_sys_complete(struct device *dev)
> --
> 2.25.1
