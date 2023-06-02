Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C36E97208FD
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 20:20:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A682C10E0E9;
	Fri,  2 Jun 2023 18:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC87C10E0C4;
 Fri,  2 Jun 2023 18:19:56 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-5585f2f070bso1674322eaf.0; 
 Fri, 02 Jun 2023 11:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685729995; x=1688321995;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ruVVANUt1rkl2YltnY0VMnFPVn2MSLuHPa/KLfddOQI=;
 b=ng8Zqz9Z1hgelGexfypABP0OmFAOwn+FoLkBQJd5NubPZMrM6+uBJiBoyyxH4BOvos
 gXUAg+J0ixJRyACe9gc/XHgRTcbbWfpjreSweek+yLKHG82udvA4jS53ng3vPPCWF8cb
 2OfIRljPQApekAOT8I34NH4XTqPFUd6e6E5T8xcPtWFzh7UVhD+xQOgjurqNeqon9rI2
 Iedhm67TNOQxmGvOkuZzEuB/uLn7dHAn61ZCELCGpyZ10nVhPtnrW2+jBYP1DvMJJ3tZ
 0STizNX+zxJ6L/pz1Vuay0HpvBCbA30MautyELFz6Wuw8OcdP8fFvcobTW5fOrF1LB+O
 L1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685729995; x=1688321995;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ruVVANUt1rkl2YltnY0VMnFPVn2MSLuHPa/KLfddOQI=;
 b=XXfaqZWf7EKW41RD63qX5uCg69Kxx1FoFQsUPwalGBJFOb3aQnpTg3nynjnC+Rm6r9
 FtDUgQXLXWeyYLxC1wmHJbyiS3PJReco8RVrnOrel7PNdm+jy5lYqr3lBqufd9Mswk8k
 oEMMwsMGsbSwh9cwPUW+tEAJH67fEd38nrtkB9YiJTZ6NBVzQvfpCbhyEdeQqHKCEf3G
 72NKR9Vv66KZybFhewGE4mPo3OXMzkppPi8oe9vUib75vEbiLGyYkENcRdzK5na0Afmu
 S+qmLPJRqZk36pX35LoO+A0YinFXY9mavfZCXT9frOnVNlSw4sWQgOSGW5LGVIc+eN6W
 VEaA==
X-Gm-Message-State: AC+VfDwmhw2dO9uFUGWrdH0TgcAqppxnMSVF5lMqenqkun5eJTfWYKrx
 uY3WKMkrXK4wjnVUD5LFJRF4wBCww+H0Zhz95vE4ae+C
X-Google-Smtp-Source: ACHHUZ7udrYG+H6UGxo37tXKpSQPyugKYQKqTppilBeQayTPvyvZhtfN9IhTZ+FTexkc9dCzuPanBmgoQnRmCXMNvjM=
X-Received: by 2002:a4a:45c7:0:b0:555:991b:b340 with SMTP id
 y190-20020a4a45c7000000b00555991bb340mr7608913ooa.6.1685729995619; Fri, 02
 Jun 2023 11:19:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230601214814.2329224-1-olvaffe@gmail.com>
In-Reply-To: <20230601214814.2329224-1-olvaffe@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 2 Jun 2023 14:19:43 -0400
Message-ID: <CADnq5_NQ2zgvRDZ8NWUsCm-8JO6PZSEmQ+WrbjYqjv3vTLfinw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix xclk freq on CHIP_STONEY
To: Chia-I Wu <olvaffe@gmail.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Le Ma <le.ma@amd.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Jun 1, 2023 at 5:48=E2=80=AFPM Chia-I Wu <olvaffe@gmail.com> wrote:
>
> According to Alex, most APUs from that time seem to have the same issue
> (vbios says 48Mhz, actual is 100Mhz).  I only have a CHIP_STONEY so I
> limit the fixup to CHIP_STONEY
> ---
>  drivers/gpu/drm/amd/amdgpu/vi.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu=
/vi.c
> index 770f2d7a371fc..6a8494f98d3ef 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
> @@ -542,8 +542,15 @@ static u32 vi_get_xclk(struct amdgpu_device *adev)
>         u32 reference_clock =3D adev->clock.spll.reference_freq;
>         u32 tmp;
>
> -       if (adev->flags & AMD_IS_APU)
> -               return reference_clock;
> +       if (adev->flags & AMD_IS_APU) {
> +               switch (adev->asic_type) {
> +               case CHIP_STONEY:
> +                       /* vbios says 48Mhz, but the actual freq is 100Mh=
z */
> +                       return 10000;
> +               default:
> +                       return reference_clock;
> +               }
> +       }
>
>         tmp =3D RREG32_SMC(ixCG_CLKPIN_CNTL_2);
>         if (REG_GET_FIELD(tmp, CG_CLKPIN_CNTL_2, MUX_TCLK_TO_XCLK))
> --
> 2.41.0.rc0.172.g3f132b7071-goog
>
