Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 438B1772CE0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5909810E35A;
	Mon,  7 Aug 2023 17:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC0A10E35A;
 Mon,  7 Aug 2023 17:27:35 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-6bcbb0c40b1so3629314a34.3; 
 Mon, 07 Aug 2023 10:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691429254; x=1692034054;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uy8OaIJgFMpn7QR7vmhG8Oa1kwr3LNfFFiT4wDabSGs=;
 b=aNzTBw0dQkfFi6QOd1CtTyKHTFBTA1odulG1qsOqUcuP7ajAukURSRCe7lf2vO3C7u
 B+juC6Somiij0/9+xUOI72Wrj/gTkGw4IZn6Ro6xOdYIFqeGed1fz2Cqh0rxvUjGi8BD
 J5VnqvdCPyFm+mCuc7KuwjoqhTVY53Ro78yibGYRC6npSeROyqV7bi3xtxCWh1SWXq0S
 ArqhENY6nI5uE6LL/7PuUZwt/00uJ7YFUQFI3Y0FEcdFDdCqQxF0X0KUYj8CkRZ5vrxw
 2yp34KzaUyqkqt1whMbtrhaboFO4XekoYwr6Ka7MzVengX9vH7yXjfH+otJn8YFhbBdG
 dVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691429254; x=1692034054;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uy8OaIJgFMpn7QR7vmhG8Oa1kwr3LNfFFiT4wDabSGs=;
 b=ANMiY6dY/C4HqI+CoB/T9HAg9s3VnIOEc5B5wsBDwr6VldWslOI/TLq8Jmm/1gUQPX
 lneTBCV7usyNa7f29R9nzfxBRehzK6HJYtUhoSP37mQbbeO5mDSxiA/3aWiMn6PYmWvW
 ckMY8sa2+uHTlhlN/sBSw9wagssJtQhu2QeONhmMQ1X4kGjnwHHxMYPXvXSGvXhFQSZ0
 Fgz9UBs/O5puBnPUNHmDEOHt9OdHwiQqKDkpuFbxdmTAlScTNHDoa2OdQ4Jo4BhQ4vYJ
 Oya/OE6ZEPb2KqjeKUymHNzsCVaEW1hb8psi7YluM+C8eofU4UvzCIHxS6EWaRcv3gOu
 Gq1Q==
X-Gm-Message-State: AOJu0YyCylvGa393+zF+ERX0AaMUAnu6nKazWR3P5ds5V4LWChBn0kqg
 is8nu5kxtmInZpxACjYqkdQCAlybLTwhp438N9U4Gvnm
X-Google-Smtp-Source: AGHT+IF9twltV5H6cpjANiMAhCIRdMwPSczCeycCQvUJnSN1tfjwNZHEhKHRe4cYFPryGugJn7iU7fc63rzPR4cUpnI=
X-Received: by 2002:a05:6870:65a0:b0:1ba:caf2:acc3 with SMTP id
 fp32-20020a05687065a000b001bacaf2acc3mr12280535oab.5.1691429254628; Mon, 07
 Aug 2023 10:27:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230802072440.13073-1-sunran001@208suo.com>
In-Reply-To: <20230802072440.13073-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:27:23 -0400
Message-ID: <CADnq5_OOd_VbWQZC1NoGLa70riT490PTATf2yumWvwndJh8LcQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Clean up errors in mes_v11_0.c
To: Ran Sun <sunran001@208suo.com>
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Aug 2, 2023 at 3:24=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: else should follow close brace '}'
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/mes_v11_0.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd=
/amdgpu/mes_v11_0.c
> index 11fda318064f..6827d547042e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
> @@ -788,8 +788,7 @@ static int mes_v11_0_mqd_init(struct amdgpu_ring *rin=
g)
>                                     DOORBELL_SOURCE, 0);
>                 tmp =3D REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
>                                     DOORBELL_HIT, 0);
> -       }
> -       else
> +       } else
>                 tmp =3D REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
>                                     DOORBELL_EN, 0);
>         mqd->cp_hqd_pq_doorbell_control =3D tmp;
> --
> 2.17.1
>
