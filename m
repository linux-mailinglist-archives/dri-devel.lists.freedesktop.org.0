Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B45CA46C36
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 21:22:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A490C10E9DF;
	Wed, 26 Feb 2025 20:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jnqUWs1V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A87210E9DF
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 20:22:19 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5dca468c5e4so183525a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 12:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740601338; x=1741206138; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P1vDmtIQrMsy1qqwpZWxFUiy2B26yzWBbUqZcyfJHmc=;
 b=jnqUWs1VjZbF0bhpB+6pfZMvWfkgbShR9VXimZrOPRYqutTFGusp63SyB26gjeiDin
 rsOR8qoifl1XpoHZC4lzx92SRAW+TCAae3Asot05dnxdjOsLE1waqY6OSPA+Q9Csw/eT
 WDuHm0ZBIy6eNn4Sd383SK7w1f4fD28Ey8910o9KwmgemjPFVzfszWt3/H3OaiWzKSpV
 AjmMjtovF4huE4Q5kfl2SKRg46kwh75HXnbmPDvklauUPKXGZEBz7w/pLQDtBHtTIvlA
 bji/HRXJkjVOq20WxDx/9JQDc+L71HMPjcA6CGN+NkiGocRo5wJPUOD93EjvDC3+Yk7I
 GBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740601338; x=1741206138;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P1vDmtIQrMsy1qqwpZWxFUiy2B26yzWBbUqZcyfJHmc=;
 b=vHaeUTM0sCgU7XMcznDe0HzsTUq3XJihJJhxf2cv6ue9W/beRzUizHa2IEWKxfKhiJ
 5ccWSPQ7j4KDo04iIJ4q9QBp3IGX4aTnbOvzzUPQOWDmI9KhmJVKxUJG+uzS2GOvb+Xv
 gQvdaOQSjX61wxsQMpqpSQHnjJvHMbgxIGiiMu9edYT0OhtWuf1DxUG1qVQa8gYfSfYY
 Be0QjO5HoJuubJj3fMhBzDghwtxo/pSCj+bcSFTGxeqdjPOYIf+rTeOTnUbnvkD29Ahp
 0wHhPlUfS6RoM9tEVPFsnEsnS8JoRcwEJ9ZgTQBt9mZ+PLO19xoOyfewJf9QgVsdID/D
 Nxjw==
X-Gm-Message-State: AOJu0YxKnmd8A/AopY3l6LUQrY6e06JdatZxNPJxjfGxD95VpBB/ujjs
 Kyr27fPnnE1WpHKOG0G2O7SP3ngDrOmBrh1YDLtCvrugFA75BARewcVC5iDX2rZOhCy0UefuAXa
 Zm37jMpbmZKNrbPjyqb+Jay/eqE0=
X-Gm-Gg: ASbGnct2Fkd2/nrVguSjW/7D56xte28kM0kuOZs9pCr6G9VURXmIbq+QxPZ6xw9o3g3
 dNqVNT5sC+QZzrNzzZvh4gXp3KM9OVXoRLVcqWFxPHkF6esETXqQ7oMJ3de51RY4VonGEAuI4/E
 MN/Tk6GEQ7AA==
X-Google-Smtp-Source: AGHT+IG4/LTA9VORKAh51/6AHK540icwK8yAJ1ehhOtvAKagYtTRj15neS+9RcboR5sP60eFuY0oWpHLuLOCjG2ILAc=
X-Received: by 2002:a05:6402:3587:b0:5de:3c29:e834 with SMTP id
 4fb4d7f45d1cf-5e44b7635damr10190157a12.27.1740601337838; Wed, 26 Feb 2025
 12:22:17 -0800 (PST)
MIME-Version: 1.0
References: <20250217053719.442644-1-vignesh.raman@collabora.com>
 <20250217053719.442644-3-vignesh.raman@collabora.com>
In-Reply-To: <20250217053719.442644-3-vignesh.raman@collabora.com>
From: Helen Mae Koike Fornazier <helen.fornazier@gmail.com>
Date: Wed, 26 Feb 2025 17:22:05 -0300
X-Gm-Features: AQ5f1JonnkitWo-lyzBGKGAx2v3pmOJ4LrXR_AOBnSKv7RbGNmxa-AbuRJBkKFQ
Message-ID: <CAPW4XYaGgfck58HQy_Y3y4YTjCHOYHFDofJR_8k56i3Cj1U1tA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/ci: enable CONFIG_DEBUG_WW_MUTEX_SLOWPATH
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com, 
 jani.nikula@linux.intel.com, dmitry.baryshkov@linaro.org, mripard@kernel.org, 
 boqun.feng@gmail.com, linux-kernel@vger.kernel.org
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

Em seg., 17 de fev. de 2025 =C3=A0s 02:37, Vignesh Raman
<vignesh.raman@collabora.com> escreveu:
>
> Enable CONFIG_DEBUG_WW_MUTEX_SLOWPATH for mutex
> slowpath debugging.
>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Acked-by: Helen Koike <helen.fornazier@gmail.com>

> ---
>
> v2:
>   - New patch in the series.
>
> v3:
>   - No changes.
>
> ---
>  drivers/gpu/drm/ci/build.yml | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/ci/build.yml b/drivers/gpu/drm/ci/build.yml
> index 274f118533a7..6c0dc10b547c 100644
> --- a/drivers/gpu/drm/ci/build.yml
> +++ b/drivers/gpu/drm/ci/build.yml
> @@ -67,7 +67,7 @@ testing:arm32:
>      #
>      # db410c and db820c don't boot with KASAN_INLINE, probably due to th=
e kernel
>      # becoming too big for their bootloaders.
> -    ENABLE_KCONFIGS: "PROVE_LOCKING DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT"
> +    ENABLE_KCONFIGS: "PROVE_LOCKING DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT D=
EBUG_WW_MUTEX_SLOWPATH"
>      UPLOAD_TO_MINIO: 1
>      MERGE_FRAGMENT: arm.config
>
> @@ -79,7 +79,7 @@ testing:arm64:
>      #
>      # db410c and db820c don't boot with KASAN_INLINE, probably due to th=
e kernel
>      # becoming too big for their bootloaders.
> -    ENABLE_KCONFIGS: "PROVE_LOCKING DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT"
> +    ENABLE_KCONFIGS: "PROVE_LOCKING DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT D=
EBUG_WW_MUTEX_SLOWPATH"
>      UPLOAD_TO_MINIO: 1
>      MERGE_FRAGMENT: arm64.config
>
> @@ -91,7 +91,7 @@ testing:x86_64:
>      #
>      # db410c and db820c don't boot with KASAN_INLINE, probably due to th=
e kernel
>      # becoming too big for their bootloaders.
> -    ENABLE_KCONFIGS: "PROVE_LOCKING DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT"
> +    ENABLE_KCONFIGS: "PROVE_LOCKING DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT D=
EBUG_WW_MUTEX_SLOWPATH"
>      UPLOAD_TO_MINIO: 1
>      MERGE_FRAGMENT: x86_64.config
>
> --
> 2.43.0
>


--=20
Helen Koike
