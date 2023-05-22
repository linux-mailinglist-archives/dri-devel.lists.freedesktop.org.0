Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C739770C20B
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 17:11:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C65E10E353;
	Mon, 22 May 2023 15:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D0710E353;
 Mon, 22 May 2023 15:11:32 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-b9a6eec8611so5433909276.0; 
 Mon, 22 May 2023 08:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684768291; x=1687360291;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DTJnTOSBsJdXxwudOgHDRynaphl008jVXxiS43MOx6A=;
 b=OjzMYV7FB/u87mx5iCndMOolICZ+awcR65uiYxd2r+5DoA8Fzi1mcEn7jmNNRsM5aO
 Hx0dXZ0Rotbhoo77WvEwqMkXG+AxskMEisTrQbPA5SRlHWM6QUDKtfWcaPO8GwQt5zqe
 naNvC5tb5mjCjv0V0GTeKJ9xsiFxYdrFZJV3wIiHI3wJJGUvZIEEyVaJQeqHhssu3lLb
 YRDspCVKo8x8JzSaCLkR1NyMjjE6LCCAQLLI0HDosu+2YYZqY2YuCMg7BqsFCIR4FEwr
 ytqyKHU1opANj1xICHWv+voTqSuBJOn817lek4h9jgHnxaCLLZ6yEPkWaSovAmWfmwZT
 WK3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684768291; x=1687360291;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DTJnTOSBsJdXxwudOgHDRynaphl008jVXxiS43MOx6A=;
 b=TD7zXn/jNbDSLtaS7nPDh39vHViaoeOnebeT2hXSQH0KR+ZA73HQQTku6tJ0/CJ1Op
 O/mEgQ/Iu9C1N79f6DwlVNh4PRCle/n8rRTiiBA5CYdUS44krvNQD18Vq9IJVKlt9R2r
 Mtu8xG1u3S1gu8DiotgSv+aIfLA0T7ZxTgEYlfjqz8Cin/EtDrxq/CXkFJzMbGjdwjNp
 YHXUcT6FZry3pZPWdJ1zgAFsr0anhQ559lECgEsGoPm57jpZ9xYrEMF90MWkN1sXnA03
 YW1Wq2iqqj8QTrXGxQvUXgjvOR3yb6Fc8HakJAXEy9KbVUcRscTrHCpiFM0wd6MCynCA
 XJqw==
X-Gm-Message-State: AC+VfDzXwmjYUFFIou+EDX3Mb+BDT426AQhypQXeudhDcmshFHmBoj0n
 VRQCUBxWu6o8/4Y0gyYRGzG6SOrHZ/JWEahL/QNSPZfb
X-Google-Smtp-Source: ACHHUZ7a9CC/BJ1/5Uahg1uci41+efd+P2PhLAf72v4ugAcuf/SpYmFxwV9zyHFfsS0YrZ/uT3+SL/iFf3MoM+Qv1yQ=
X-Received: by 2002:aca:d806:0:b0:38e:e5b5:493e with SMTP id
 p6-20020acad806000000b0038ee5b5493emr7140299oig.11.1684768270110; Mon, 22 May
 2023 08:11:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230522123013.1065975-1-trix@redhat.com>
In-Reply-To: <20230522123013.1065975-1-trix@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 22 May 2023 11:10:58 -0400
Message-ID: <CADnq5_Pc+3YNT0Ymf77zPDKt9Nr2mBYgxgcyqT4PZLQhrD+iRA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: remove unused variable num_xcc
To: Tom Rix <trix@redhat.com>
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
Cc: lijo.lazar@amd.com, amd-gfx@lists.freedesktop.org, Xinhui.Pan@amd.com,
 tao.zhou1@amd.com, shiwu.zhang@amd.com, linux-kernel@vger.kernel.org,
 le.ma@amd.com, dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, May 22, 2023 at 8:30=E2=80=AFAM Tom Rix <trix@redhat.com> wrote:
>
> gcc with W=3D1 reports
> drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:2138:13: error: variable
>   =E2=80=98num_xcc=E2=80=99 set but not used [-Werror=3Dunused-but-set-va=
riable]
>  2138 |         int num_xcc;
>       |             ^~~~~~~
>
> This variable is not used so remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/am=
d/amdgpu/gfx_v9_4_3.c
> index e5cfb3adb3b3..63718cf02aa1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
> @@ -2135,9 +2135,6 @@ static void gfx_v9_4_3_ring_emit_gds_switch(struct =
amdgpu_ring *ring,
>  static int gfx_v9_4_3_early_init(void *handle)
>  {
>         struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> -       int num_xcc;
> -
> -       num_xcc =3D NUM_XCC(adev->gfx.xcc_mask);
>
>         adev->gfx.num_compute_rings =3D min(amdgpu_gfx_get_num_kcq(adev),
>                                           AMDGPU_MAX_COMPUTE_RINGS);
> --
> 2.27.0
>
