Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 992787022D8
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 06:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DCEB10E120;
	Mon, 15 May 2023 04:17:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8EF10E120
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 04:17:09 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-50bc0117683so21679334a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 14 May 2023 21:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684124227; x=1686716227;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iUag73btUuB8LmzKHUfEj0izB5dA8C+cF7zWWtW7WKM=;
 b=ExyvUQYU1tuyY35h0jfdinlYAVsQKQxoEVzcLVTkK4o5Zr2rgAuMRES0ix8cEY06oJ
 HLALJwcBmzrcI/1VOnC0G2tOk/l0jV+waE8IptWGDdzN6LZz5eMuZK9SdtCPDqO171YA
 Cj+xNNu/CfvMWEzBfGc804G3CI/hGZFuTku5qx239SnRLdALTpHnG78O8el1baFK4h9L
 goHqFSJMpceKqRsZZ/mC1dgsxWjCj+vOB9clOyfdDSLTTM2J3/UQq2Isw/tNXbqdb2Ud
 Y5TMcR2FirW2d6kTUtlkBflktxxeLN0C8ovzv05mWkHIbFhBw+fUkD6Aau3blP/5z6Fz
 Cb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684124227; x=1686716227;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iUag73btUuB8LmzKHUfEj0izB5dA8C+cF7zWWtW7WKM=;
 b=gkWJl04wS0oFlV3XLQYTpSnESm/D+D8Rsf7TKDEUHWFbba2HkSGU8bxDww3aBXIBCG
 DncyvlkUrabA0/r/bNCrED+ERr9tFHLnhZTGPzurhRsImOcoREdMS+YOHZ6QeUYcmuS5
 5gU2bzLOm6bMmG2AmEh8NCyZ9rCFdM4fnFRBDYwneYAKF97GDtTRDKsCnin1kUKAnus4
 d9G8sMa7nmCBJ/0kdxgSN4BFGRk/AF4l3Y4r7ewVu/ymgp+RryTvuv/KX79RXgPLd8EQ
 RdbxTQNnOf7TzbHWhctNeoeIH74lXTI5SHO3nscsMFsc40OuNHNdLtJM8gDAjhbPI012
 xSnQ==
X-Gm-Message-State: AC+VfDz6ciKX1E3jkVlpfxPCOjlvpsmJYsA0a2NZ3Wwg2IYbSHaxXUWJ
 oi0raQSP3ul3P7p+MywcW3gUv8boK4WanJyqyYc=
X-Google-Smtp-Source: ACHHUZ6r2BzwpIgitKkdrxJvQRqzaXlHpTU+BnUZs8GvPdgtATRrC8nS67ISzTWLFCUxIM49EI9Yj2sxhXviVj/dx6I=
X-Received: by 2002:a05:6402:886:b0:50d:b7e5:fde8 with SMTP id
 e6-20020a056402088600b0050db7e5fde8mr14816027edy.26.1684124227281; Sun, 14
 May 2023 21:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230507144753.192959-1-krzysztof.kozlowski@linaro.org>
 <CAAQKjZNx2xp-tzfpEhA4ET94bTtaV_P6P+P6bQiDTnR_4zG3Ew@mail.gmail.com>
In-Reply-To: <CAAQKjZNx2xp-tzfpEhA4ET94bTtaV_P6P+P6bQiDTnR_4zG3Ew@mail.gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 15 May 2023 13:16:30 +0900
Message-ID: <CAAQKjZP7T6864R4V9GAGbL60-e-VFohPqONB7V=fTXVSX+=jWw@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: g2d: staticize stubs in header
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: linux-samsung-soc@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

2023=EB=85=84 5=EC=9B=94 15=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 1:13, I=
nki Dae <daeinki@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi Krzysztof,
>
> 2023=EB=85=84 5=EC=9B=94 7=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 11:48,=
 Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
> >
> > Stubs for !CONFIG_DRM_EXYNOS_G2D case in the header should be static
> > inline:
>
> Same patch[1] was posted before so I picked up the previous one.
>
> [1] [PATCH] drm/exynos: fix g2d_open/close helper function definitions
> (kernel.org)

[1] https://lore.kernel.org/lkml/20230425165618.2ztg4mecuvpkdg3a@intel.inte=
l/T/

Just corrected the link.

>
> Thanks,
> Inki Dae
>
> >
> >   drivers/gpu/drm/exynos/exynos_drm_g2d.h:37:5: warning: no previous pr=
ototype for =E2=80=98g2d_open=E2=80=99 [-Wmissing-prototypes]
> >   drivers/gpu/drm/exynos/exynos_drm_g2d.h:42:6: warning: no previous pr=
ototype for =E2=80=98g2d_close=E2=80=99 [-Wmissing-prototypes]
> >
> > Fixes: eb4d9796fa34 ("drm/exynos: g2d: Convert to driver component API"=
)
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_g2d.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.h b/drivers/gpu/drm/=
exynos/exynos_drm_g2d.h
> > index 74ea3c26dead..1a5ae781b56c 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.h
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.h
> > @@ -34,11 +34,11 @@ static inline int exynos_g2d_exec_ioctl(struct drm_=
device *dev, void *data,
> >         return -ENODEV;
> >  }
> >
> > -int g2d_open(struct drm_device *drm_dev, struct drm_file *file)
> > +static inline int g2d_open(struct drm_device *drm_dev, struct drm_file=
 *file)
> >  {
> >         return 0;
> >  }
> >
> > -void g2d_close(struct drm_device *drm_dev, struct drm_file *file)
> > +static inline void g2d_close(struct drm_device *drm_dev, struct drm_fi=
le *file)
> >  { }
> >  #endif
> > --
> > 2.34.1
> >
