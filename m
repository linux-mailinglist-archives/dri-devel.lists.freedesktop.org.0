Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC938772CF6
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B4E10E360;
	Mon,  7 Aug 2023 17:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4655410E360;
 Mon,  7 Aug 2023 17:29:27 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-3a76cbd4bbfso3710059b6e.3; 
 Mon, 07 Aug 2023 10:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691429366; x=1692034166;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PxI0sX/bHlGbroOhST0CXWhe2PjX6mn9rOX1bspgZeg=;
 b=nOpV9SIadaALQmP0ifWEr7qPnFSJIkJd9WZ23kL2xPTbBQqAPj35vBqi15sMJz8bgg
 a5DpmNmj8XeIjFYjY+/V2HcBntXuEj2qrhBOAcGsEwSEvZ9CHcNiQNCSnwhKXMN5qQnj
 uEnUUswP63K6zEEve6BJMUgxBMfFDhcOUtDMpplf7QqT6nBkpxb7kthRF6DiN8WdSvVl
 v9XCV6dFDGLYKD4vQIL/UHo2AWfxgH2ehTrNeGigczm7J34W+HooAwglepVIwUg93rSq
 e8hIMcFJh0O+0yu09qrbZygv86gwAiY2y9d4crxafZbtnIaZXUjtsvonsoTQ3n5h+2jX
 GlnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691429366; x=1692034166;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PxI0sX/bHlGbroOhST0CXWhe2PjX6mn9rOX1bspgZeg=;
 b=QyTz5mDyhcjnjc++AMCD7A/7jddsqyKe49RyAdXMrTwukjImDbga0tjahOVrlTsq7a
 p090NnKOh5apO8kFkyKGnWEt+QHFJ/Lp/u6Jl9YvuU5iPHpG6M1XStAo8VJifycYMu5h
 tpbV90obzcJu7q4KlQUy5XaDCzbG9BxAbYrBqeN0SHJTClPO8aeeIsuRxk5Yoeae/bgX
 bMAAHBW2ChMFHcfNLzJJmmgeNsNhB7pduPBgbXLgXh3IA/Hzh2BuU/eia8rsbFRFsHzi
 8imNhAn+Ieynv1+3TNVFcqyRbP92nzAq9JDyayKw38onWdNI9z+hSahF56CBvlln1pU0
 9PWA==
X-Gm-Message-State: AOJu0YymjEYy0a9zgbSmWJb1iEoXRaJYNmFezj6xJe3h70nwtopOARpa
 5qdzJP7dtedUlsV8Kg8v7HcGR1waORSK5SrzvS8=
X-Google-Smtp-Source: AGHT+IHTHPuDthKALX7K16Uo8m13HAqVVIHgxWMlhIydeR+iCjkwJIf9vCVCJ/5qaOiKuAUOJxUWwYfsSD4tVucjRRs=
X-Received: by 2002:a05:6808:1204:b0:3a7:2621:2d9e with SMTP id
 a4-20020a056808120400b003a726212d9emr12156773oil.27.1691429366520; Mon, 07
 Aug 2023 10:29:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230802073141.13343-1-sunran001@208suo.com>
In-Reply-To: <20230802073141.13343-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:29:15 -0400
Message-ID: <CADnq5_PyBm7AhC_QNnFeoHGHXuqPXomHC_8EkMNUQrb7wmhHWg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Clean up errors in amdgpu_virt.c
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

On Wed, Aug 2, 2023 at 3:31=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: space required before the open parenthesis '('
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_virt.c
> index ec044f711eb9..96857ae7fb5b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> @@ -520,7 +520,7 @@ static int amdgpu_virt_read_pf2vf_data(struct amdgpu_=
device *adev)
>                         tmp =3D ((struct amd_sriov_msg_pf2vf_info *)pf2vf=
_info)->mm_bw_management[i].encode_max_frame_pixels;
>                         adev->virt.encode_max_frame_pixels =3D max(tmp, a=
dev->virt.encode_max_frame_pixels);
>                 }
> -               if((adev->virt.decode_max_dimension_pixels > 0) || (adev-=
>virt.encode_max_dimension_pixels > 0))
> +               if ((adev->virt.decode_max_dimension_pixels > 0) || (adev=
->virt.encode_max_dimension_pixels > 0))
>                         adev->virt.is_mm_bw_enabled =3D true;
>
>                 adev->unique_id =3D
> --
> 2.17.1
>
