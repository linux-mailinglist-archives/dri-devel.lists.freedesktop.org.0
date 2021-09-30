Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E48F41DD79
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 17:30:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75C16EBA5;
	Thu, 30 Sep 2021 15:30:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE446E43F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 15:30:18 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 o59-20020a9d2241000000b0054745f28c69so7729672ota.13
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 08:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=zJkkp22/IAI2R8aDFw4G310ZlYY7OpVYcJ/n8BDtGkQ=;
 b=yQqRbZ7xozCrtDE2O5hkFMhfXkgp1cPeh+mBKtqmqQCG4/dCmvY6OK+JWdiTFpuAmc
 I2+EL7Y650RTlRStK8lVS7cSleUFGFzZYnbxzfGlvkUX+KksaH3Noe1ID+iIscg6ccg3
 gd+Riy5j65DVpSTyo3ssn8VUSSHyxQuLQdxYIopZe7/p6IdvaQMV++WfluKfOmQNxRlS
 4qY8za8Gvf0nxJfc1M23uZQ1SpxYK/mg7Dyk/+AehHRrnqP8oelfuyjy8ooL6EjKCHIc
 hWKueB4dcKS+icrMi04gzpUlRYyfBWK/eEYyVscT/wuOYhCsn8nhCezp+D51C40E/6yY
 5VaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=zJkkp22/IAI2R8aDFw4G310ZlYY7OpVYcJ/n8BDtGkQ=;
 b=lRgsnW6QX9DdJZjbR90USpl7czr9NCR1ZdST8BNsliqlSzWAZCqRkmmGb8HVG1INj9
 2yEsXcIXVzgFtrqQre32xCG+PUze8bB8RGdEkjn+iMLB9aLOq/dxJWlgLJBLAfvE4tVK
 9oFKUErv8GUZsOSX2Hmnw7FfCXDLXVbxu1cb95y6j2CQPpCeZUvuMewpVmZJblnVvp+M
 5N2gFUGqdcDiYJTZPX9ZJWV/ug5WLFjNCtzjDLPLN7U30OTZsBwUdxBV24b+e9Etugij
 s8OPbAQXgmPoh6RWL7wMLaTe9Voym/DtZGdhLZV8qUTiHFuVuBC3oPTXJeXf4ann8rmv
 9Xqw==
X-Gm-Message-State: AOAM532wL8syZ/FPI+b/lNVDysx9/k9pDPMduSX/qf0KCOK/sSVOrDaD
 iSE8Pj7fH5cAiQXSrxzIck1Jc3vwwwAerkfIKiGG29EomkRR9Q==
X-Google-Smtp-Source: ABdhPJw4duoEzfaZH9gxczHD7C1DIZIGYVGg5tbc/IyPmMKn0Vhn8x2i7oAgmd7uAXON1ZmsThevvtfiBiKjKpEOP2I=
MIME-Version: 1.0
X-Received: by 2002:a9d:a61:: with SMTP id 88mr3394474otg.152.1633015817520;
 Thu, 30 Sep 2021 08:30:17 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Sep 2021 11:30:16 -0400
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Thu, 30 Sep 2021 11:30:16 -0400
Message-ID: <CABnWg9th7ZFqa48jKcjqs4u+27t663H-zD7yn3oFRMEsGzbMGg@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] drm/mediatek: add mt8195 hdmi TX support
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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

Hi Chun-Kuang.

Thank you for your input.
I have tried to find commonalities between the two drivers but I didn't
find enough shared code to warrant that architecture.
I'll have another look, especially now that I'm more familiar with the
driver.

Regarding 2, I have removed as much functionalities as I could from the
original vendor tree (like hdcp, hdr, cec...) to keep only HDMI audio and
video TX.

There might be some more things to remove, but I'm no expert in the domain
and I'm working without access to mediatek datasheets and documentation.

Though, at this stage I could split the patch in two with video first and
then audio.

I will try to work something out for a V2.

Thx,
Guillaume.

Quoting Chun-Kuang Hu (2021-09-30 15:36:42)
> Hi, Guillaume:
>
> This is a big patch, and I'm not familiar with this driver, so the
> review process would be long. So I tell you about how I review this
> patch, and if you could process according to my way, the process would
> be more short.
>
> 1. Find the common part of all hdmi driver.
> Even though mt8195 hdmi has many difference with other mediatek soc
> hdmi driver, I would like to find the common part and have just one
> copy of the common part. I expect there would three file finally:
>
> mtk_hdmi.c               (the common part)
> mtk_hdmi_mt8173.c (each soc special part)
> mtk_hdmi_mt8195.c (each soc special part)
>
> But this would be difficult in this stage, so you could temporarily
> have these three file:
>
> mtk_hdmi_common.c (the common part)
> mtk_hdmi.c                 (each soc special part)
> mtk_hdmi_mt8195.c   (each soc special part)
>
> When review is almost done, then change the file name as I wish.
>
> 2. The first patch has only basic function, separate advance function
> to another patch.
> When comparing mt8195 hdmi driver with other hdmi driver, if mt8195
> hdmi driver has some function that other hdmi does not have, I would
> think that function is advance function and should be separate to
> another patch.
>
> If you follow this way, I think the review process would be short.
> Because this patch is big, I would just review partial part each time.
>
> Regards,
> Chun-Kuang.
>
>
> Guillaume Ranquet <granquet@baylibre.com> =E6=96=BC 2021=E5=B9=B49=E6=9C=
=8829=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:47=E5=AF=AB=E9=81=93=
=EF=BC=9A
> >
> > Add basic hdmi TX support for the mediatek mt8195 SoCs
> >
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > ---
> >  drivers/gpu/drm/mediatek/Kconfig              |   10 +
> >  drivers/gpu/drm/mediatek/Makefile             |    4 +-
> >  drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c    | 2293 +++++++++++++++++
> >  drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h    |  128 +
> >  .../gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c    |  530 ++++
> >  .../gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.h    |   20 +
> >  .../gpu/drm/mediatek/mtk_mt8195_hdmi_regs.h   |  329 +++
> >  7 files changed, 3313 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
> >  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h
> >  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c
> >  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.h
> >  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_regs.h
> >
> > diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediate=
k/Kconfig
> > index 2976d21e9a34a..517d065f0511b 100644
> > --- a/drivers/gpu/drm/mediatek/Kconfig
> > +++ b/drivers/gpu/drm/mediatek/Kconfig
> > @@ -28,3 +28,13 @@ config DRM_MEDIATEK_HDMI
> >         select PHY_MTK_HDMI
> >         help
> >           DRM/KMS HDMI driver for Mediatek SoCs
> > +
> > +config DRM_MEDIATEK_HDMI_MT8195_SUSPEND_LOW_POWER
> > +       tristate "DRM HDMI SUSPEND LOW POWER Support for Mediatek mt819=
5 SoCs"
> > +       depends on DRM_MEDIATEK_HDMI
> > +       help
> > +         DRM/KMS HDMI SUSPEND_LOW_POWER for Mediatek SoCs.
> > +         Choose this option if you want to disable/enable
> > +         clock and power domain when platform enter suspend,
> > +         and this config depends on DRM_MEDIATEK_HDMI.
> > +
> > diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediat=
ek/Makefile
> > index 29098d7c8307c..736f0816083d0 100644
> > --- a/drivers/gpu/drm/mediatek/Makefile
> > +++ b/drivers/gpu/drm/mediatek/Makefile
> > @@ -18,6 +18,8 @@ obj-$(CONFIG_DRM_MEDIATEK) +=3D mediatek-drm.o
> >
> >  mediatek-drm-hdmi-objs :=3D mtk_cec.o \
> >                           mtk_hdmi.o \
> > -                         mtk_hdmi_ddc.o
> > +                         mtk_hdmi_ddc.o \
> > +                         mtk_mt8195_hdmi.o \
> > +                         mtk_mt8195_hdmi_ddc.o \
> >
> >  obj-$(CONFIG_DRM_MEDIATEK_HDMI) +=3D mediatek-drm-hdmi.o
> > diff --git a/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c b/drivers/gpu/d=
rm/mediatek/mtk_mt8195_hdmi.c
> > new file mode 100644
> > index 0000000000000..46c7c8af524ac
> > --- /dev/null
> >
