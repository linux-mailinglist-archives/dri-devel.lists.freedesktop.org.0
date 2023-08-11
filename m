Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0349B7793FC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 18:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50D510E6AF;
	Fri, 11 Aug 2023 16:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2986810E6AE;
 Fri, 11 Aug 2023 16:11:33 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-2680edb9767so497901a91.0; 
 Fri, 11 Aug 2023 09:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691770293; x=1692375093;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eZQA5/xKvteq7d/YjupYKiBqSmOz26WgUcCuQqOi/3c=;
 b=DwnL3ZgNYUmYNghO3V4XuqSvTVSIs7ciOt6OWTzi0+cJ5kR1qxfdfBo+PRU6SrGbE+
 YAZtWtwi7jReiawqGVJ+rUEJ1yH8FZW0Jc8gQzwSL18iakMoSNZ+0xHmMeOy77DW9GMN
 YuHyTLgR9xG1AigXdP8PcG1kA2IsAUv50JpUbm+2czNPPAF/HMtzFe6dLXQDgGMeXh4l
 ewq3FXtuGkcPTgM+bYMkq0v4buUQ+mVvs2ABvjw/CmBVLh9E3cwlMZAhcds/CklOsuh8
 MY13buzMk8DYkBWOM7D5s+zsCAsGRzqqFRCU3Y3/Hz+hWxonOPOuEeJJtyf2qCOr/Z8a
 SUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691770293; x=1692375093;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eZQA5/xKvteq7d/YjupYKiBqSmOz26WgUcCuQqOi/3c=;
 b=W1C+c53jmkCb6HoDv1KR5ouMzVbNzPS3A56JU0DOqYjOba57xLOnXNoIlHz4ou1L/D
 g1FPGAcSjy0/qFMiteN6XFw7SW3e6cheQazVHMP+5hWs2MOfKw84rEQAdDIIZIDqLK4I
 G6zLMNQQEOXG6ciAUo/Nph40DYrBCdh/J1EhIlTVJDrInF3hlYD88iPhmQ6LOeufon3I
 08EGX2/1gvzJaiGZojxyMxgzG2QMv0j0VbVOF+DasPYNyoP5BCOY770RMn+OCCAzs8ws
 hp3oMai0OIIL2izJz/2R7wqop2sJvnLVrdnA/PzVks5qtam1H2f/hj2mvlTwqU6IGBOq
 iXCw==
X-Gm-Message-State: AOJu0YwkDtb/745fIqU9Z0QUtlV2bN5d6kCr4YpgRVYwii7XvEuMRuXq
 HwMH2/zSxiOImjRUxrRvwB2TiZJ+ylD/c+DMPdKxRfo8
X-Google-Smtp-Source: AGHT+IGMwIe0C2BOcHP3SkIYc8J3GWYyU9E1K0sAoOIy93sRpUo7LeLsrqTF/JifpXp/olg8473PalLRIYy/EDQZEEk=
X-Received: by 2002:a17:90a:2f86:b0:268:38a7:842e with SMTP id
 t6-20020a17090a2f8600b0026838a7842emr1892308pjd.2.1691770292536; Fri, 11 Aug
 2023 09:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230620232319.991918-1-festevam@gmail.com>
 <33390a7a-f6f6-f2c5-1574-970ed1dc3a20@linaro.org>
 <CAOMZO5AYWpTPGuUEpXzGoH_Rr1=Xaz1BnJiRjdhvyWuoHq+1XQ@mail.gmail.com>
In-Reply-To: <CAOMZO5AYWpTPGuUEpXzGoH_Rr1=Xaz1BnJiRjdhvyWuoHq+1XQ@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 11 Aug 2023 13:11:20 -0300
Message-ID: <CAOMZO5COpKCy=mqF2=P40EHo=sM9z4897OPna98Rgh_4fbfTwA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/a2xx: Call adreno_gpu_init() earlier
To: robdclark@gmail.com
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Fabio Estevam <festevam@denx.de>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, jonathan@marek.ca
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Any comments, please?

On Mon, Jul 24, 2023 at 5:28=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> Hi Rob,
>
> A gentle ping.
>
> On Thu, Jun 22, 2023 at 3:37=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On 21/06/2023 02:23, Fabio Estevam wrote:
> > > From: Fabio Estevam <festevam@denx.de>
> > >
> > > The adreno_is_a20x() and adreno_is_a225() functions rely on the
> > > GPU revision, but such information is retrieved inside adreno_gpu_ini=
t(),
> > > which is called afterwards.
> > >
> > > Fix this problem by caling adreno_gpu_init() earlier, so that
> > > the GPU information revision is available when adreno_is_a20x()
> > > and adreno_is_a225() run.
> > >
> > > Tested on a imx53-qsb board.
> > >
> > > Fixes: 21af872cd8c6 ("drm/msm/adreno: add a2xx")
> > > Signed-off-by: Fabio Estevam <festevam@denx.de>
> > > ---
> > > Hi,
> > >
> > > This error has been exposed by a recent commit in linux-next:
> > >
> > > cc943f43ece7 ("drm/msm/adreno: warn if chip revn is verified before b=
eing set")
> > >
> > > , but the error has been present since the very first a2xx commit.
> > >
> > > Changes since v2:
> > > - Call adreno_gpu_init() earlier.
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> >
> > >
> > >   drivers/gpu/drm/msm/adreno/a2xx_gpu.c | 8 ++++----
> > >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> >
> > --
> > With best wishes
> > Dmitry
> >
