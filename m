Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C626768F23
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 09:45:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D3C10E1BC;
	Mon, 31 Jul 2023 07:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B7310E1BC
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 07:45:36 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id
 ada2fe7eead31-44768737671so1192431137.2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 00:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1690789535; x=1691394335;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=22dgMCtWHoGRp3L6I5f3wjv02rKDR0f0so1LEHQbsXU=;
 b=ahXKYr4TKCLqWJFuj3b20DKDNwo5Qi2XyUaajGlvbcn9HT/Q6mejeT28iIvAA6AXPw
 l8uGXI9uln00btX5GeUdxnVDJ6EdE0Nnt8I0DWDwMgt45L9Gx+o+zQiBMUdkdrW1SkSz
 wH2+YTjdF5TROccqPIFQntDqwcovuOrMWNiSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690789535; x=1691394335;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=22dgMCtWHoGRp3L6I5f3wjv02rKDR0f0so1LEHQbsXU=;
 b=Pf37YKsrRpXZHgeXxpXk3d5XeC186/fXJUxlal9MvoH4cOymKIQdLdChX9odLGtQoQ
 KS/aLxn7xznf6wTAamQrmkM59MAce1yvXep4GrtOP+msoFqwShu8AHPrE0FJIp8Kj309
 DlxernQJnVnX9r2xG08fcl5sRyQmH/wss6iDG2RU3SpjcwDPfZVS1BP5SFTHCjAp57Zd
 +PYZNSwRijjeDK9/7MPmamIXl/iqmHHyO2lm3KjPzkJkBzpc+F1dMlLMmosB/Vdm56sj
 VOUp+75uBXdMvUdX4wPAnBKJJbUwSCy644QKXx5lIZCRnjMcodZeMWG5yBTrPOZdzlLf
 zr3g==
X-Gm-Message-State: ABy/qLYlWls+KjCfRibZIWMbAvCNnPa05DYmcMyhEdEZHb2DtMzkyXV7
 lACQKezDWdhDuG8x9HGrRcYY678o7+CdT3p4mYGgGg==
X-Google-Smtp-Source: APBJJlGI7nC5RInk4NCkL4t/A+8pldPOAUPq2c4alpydNW0zTJfPcA+O65xaxhK9ihY9XA7sbSh/dFL/3wZQ+aGRk10=
X-Received: by 2002:a67:ee16:0:b0:443:83ef:1919 with SMTP id
 f22-20020a67ee16000000b0044383ef1919mr4278773vsp.30.1690789535586; Mon, 31
 Jul 2023 00:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230726195232.1369289-1-greenjustin@chromium.org>
 <47101b2026e0419cff265de25e8a110b19a1e8b8.camel@mediatek.com>
In-Reply-To: <47101b2026e0419cff265de25e8a110b19a1e8b8.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 31 Jul 2023 15:45:24 +0800
Message-ID: <CAGXv+5Em2ROBW=NvhN0Xwk2mJ95V21ux73ghUiWaFBpoNvCY2Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Add valid modifier check
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
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
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "greenjustin@chromium.org" <greenjustin@chromium.org>,
 "fshao@chromium.org" <fshao@chromium.org>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?UTF-8?B?SnVzdGluIFllaCAo6JGJ6Iux6IyCKQ==?= <Justin.Yeh@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 27, 2023 at 11:04=E2=80=AFAM CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89=
) <ck.hu@mediatek.com> wrote:
>
> Hi, Justin:
>
> On Wed, 2023-07-26 at 15:52 -0400, Justin Green wrote:
> >
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  Add a check to mtk_drm_mode_fb_create() that rejects any modifier
> > that
> > is not the AFBC mode supported by MT8195's display overlays.
> >
> > Tested by booting ChromeOS and verifying the UI works, and by running
> > the ChromeOS kms_addfb_basic binary, which has a test called
> > "addfb25-bad-modifier" that attempts to create a framebuffer with the
> > modifier DRM_FORMAT_MOD_INVALID and verifies the ADDFB2 ioctl returns
> > EINVAL.
>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>
> >
> > Signed-off-by: Justin Green <greenjustin@chromium.org>
> > Tested-by: Fei Shao <fshao@chromium.org>


Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

with IGT on Hayato with this patch backported to v6.1 downstream kernel.

> > ---
> > v2:
> >  * Replace zero check with comparison to DRM_FORMAT_MOD_LINEAR.
> >
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > index cd5b18ef7951..2719a1e3163a 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > @@ -51,6 +51,13 @@ mtk_drm_mode_fb_create(struct drm_device *dev,
> >       if (info->num_planes !=3D 1)
> >               return ERR_PTR(-EINVAL);
> >
> > +     if (cmd->modifier[0] !=3D DRM_FORMAT_MOD_LINEAR &&
> > +         cmd->modifier[0] !=3D DRM_FORMAT_MOD_ARM_AFBC(
> > +                                     AFBC_FORMAT_MOD_BLOCK_SIZE_32x8
> > |
> > +                                     AFBC_FORMAT_MOD_SPLIT |
> > +                                     AFBC_FORMAT_MOD_SPARSE))
> > +             return ERR_PTR(-EINVAL);
> > +
> >       return drm_gem_fb_create(dev, file, cmd);
> >  }
> >
> > --
> > 2.41.0.487.g6d72f3e995-goog
