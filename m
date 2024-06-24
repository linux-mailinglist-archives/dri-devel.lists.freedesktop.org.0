Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8DB9150A9
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 16:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8DE10E490;
	Mon, 24 Jun 2024 14:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JAiBJ9+C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A622310E480;
 Mon, 24 Jun 2024 14:47:36 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2c85ca2dc5cso1011507a91.0; 
 Mon, 24 Jun 2024 07:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719240456; x=1719845256; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KBn1Q+iZWIRv0A+I80kD3XYsNEFwO5sfzz2jLKLOUCE=;
 b=JAiBJ9+ChQzXaFpCofNkvLFNlCxkt1QI7hclxv8no5t0qe+E6OD9bCJgh+LKkQBpmt
 bXeQTxySVEKOobPsTtfUL+X5nkgiNcWAdgEzuSCmNozA6iZbfM7qEPawWrf+1vN6Dezf
 3qFTLzSdYFMJWEjYSGm2RLDw6lugp6/QciusNn2FwKJJjbVfRbc5Ehu82XDV20b0P56v
 4XsyNRGgnaMA1uUNtU9+re5lifgO1oud+QigRnLKuQ+JDbbJdlogDg93vk+WiNpXU7dg
 vipeCtMP0RJclDzTopoi/4SwSSVBSEhOJ0xM3uYjuuiLFGgkbPTLMR7xpKXZhO4VnB4R
 Y4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719240456; x=1719845256;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KBn1Q+iZWIRv0A+I80kD3XYsNEFwO5sfzz2jLKLOUCE=;
 b=nrX7b0w6BfPqaV+nUe5ystBrCawJn7qQuBfVpc0032Hs5nDHIRLhLqVg4+c1xzaqGS
 BH+XnJbw4S2tkvXRZexnENfPhCKLMHjJj8zisvMVeFhlo41lno9PE8osnoO7xKNTkET5
 kUF+7g5qXf0ps7anRiH9VjFQBx7shDtKBmg0HU+hfWZzXynVxd2JyFuuoeIYDBYpUuMd
 ooHJ1lZAq0EInDykKJTiZ9AexkRlAEWz9YEaXlXU5M28JdKUIghSxXdjT9HTuylkPMtk
 Mv/xuGun7zOqVD5ccvaQQzvHaXhWmp+wgoP53T8KZxAZCmizEvIS3e+kogikk7DPN4EN
 clnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjpfO2oXZvRNpO0aER3H3pStKvf2b0ia1Iaa3D8CLJCpDGSDxI5Vh4Gd7IwGiWSzrml0LYKGWBUlYsumXW3L/Mn56UW+XTVHiOzoJEf4lLuoirjRsOZiE8QvDzch5N4U+B2MzmYp5ClTJkBYHj/g==
X-Gm-Message-State: AOJu0YxyEsSUJn+ShowdSxtGEaUK2LMZRjQmEZS6sFsIVoZvr9cs+gNL
 ijIbaszNSb1rzpc57mhpQ3z2HWy5YCI2tmNC+en3RLvxomCpi8gOF6zVNOB61HdwnD1/jX9xATF
 YoRYMHcom8yyQQlVKmOuaPg7S3rQ=
X-Google-Smtp-Source: AGHT+IGvKrhZtClxc1QzR2rA26guU9NSp5NVu4sGuwHBa4tzlglkdOxFnTljJBijc7tWG6aqbNG3U6xVfJPmK1zCzoY=
X-Received: by 2002:a17:90b:f02:b0:2c4:e2d6:8de6 with SMTP id
 98e67ed59e1d1-2c8a23bf31cmr1060708a91.21.1719240456007; Mon, 24 Jun 2024
 07:47:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240624022225.28655-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20240624022225.28655-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Jun 2024 10:47:24 -0400
Message-ID: <CADnq5_PzZMNmJGnxMh88owr59erSHaOZpgtwrVWjjdoNvC++YQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove unused function
 reverse_planes_order
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Abaci Robot <abaci@linux.alibaba.com>
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

On Mon, Jun 24, 2024 at 4:07=E2=80=AFAM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> The function are defined in the amdgpu_dm.c file, but not called
> anywhere, so delete the unused function.
>
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:371:20: warni=
ng: unused function 'reverse_planes_order'.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D9402
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 4b86b30eddc4..1e0e33b565f1 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -368,15 +368,6 @@ static inline bool is_dc_timing_adjust_needed(struct=
 dm_crtc_state *old_state,
>                 return false;
>  }
>
> -static inline void reverse_planes_order(struct dc_surface_update *array_=
of_surface_update,
> -                                       int planes_count)
> -{
> -       int i, j;
> -
> -       for (i =3D 0, j =3D planes_count - 1; i < j; i++, j--)
> -               swap(array_of_surface_update[i], array_of_surface_update[=
j]);
> -}
> -
>  /*
>   * DC will program planes with their z-order determined by their orderin=
g
>   * in the dc_surface_updates array. This comparator is used to sort them
> --
> 2.20.1.7.g153144c
>
