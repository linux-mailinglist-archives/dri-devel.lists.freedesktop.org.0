Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B50C722CEB
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 18:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDFD10E2FB;
	Mon,  5 Jun 2023 16:49:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5476910E2FA;
 Mon,  5 Jun 2023 16:49:23 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-65292f79456so2155118b3a.2; 
 Mon, 05 Jun 2023 09:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685983762; x=1688575762;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sUsPK5qT+Od/SIBa5UUhtpAmbErx2EC2+EeGGcYa5rU=;
 b=pDwMEPyJoAA8lMmEHYUYLZsisIj7HsovbQsQl9gBP48xOMjPyPDk4T0kiijl6wJMFh
 z5lk0xjWh4JzoZoye0OpuO2gOLj/ZCmMZxDq+OU2hIUxrRx4hunTp6cDWgONe5AqiZdE
 RhilP2TnXzxqCgbaTXL8ea5xZMmR326q6cgKXPDQNRblx4FfOSQrsDt7Jlk6Sa7w35yx
 ATc/zh47D9UhaQ/cYhTNHsg3x5PcGErv2abl1176V8y/fr6Gqovnvw+ZZco0EpCznKBS
 aLpw+mYyuvL5tRpGBsLSV082fQJmakJC2SXYe2yEgFvdGmnJX+6kSK/mL/yXzw49nq4i
 aFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685983762; x=1688575762;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sUsPK5qT+Od/SIBa5UUhtpAmbErx2EC2+EeGGcYa5rU=;
 b=BY/AHtAztIxAqLXcAy0KNydbttncy7pzr1mL9bVk0Ne2N7FSqHJvaaLSiTMD1wfzgZ
 4fMM+16kR0sgryAhL4iSLybxq1A+hrAJpz0RiFLge5r5cFl3xKTrPq4r7eCSvYL9AH7+
 FZcGhPr+t8Dtc6mHO8H4Xz7c8cDymeIC7THA21Qg3SqtObvuDg2UNms+oFa2JICOS5Ai
 f1eP249oTBfV2RXvBWUbxFUnKbymBUzXzwpRnexaKSM2tqgnF5rLAEBsM4VHlc2FnmFr
 Bm3PI7/pO7dVkfpcRJjyNJpTniFNnJXAumhYr3vHz8yjHk2bl1OmUVfaIJpkMN7cU+xK
 qg+Q==
X-Gm-Message-State: AC+VfDx8tEsuHoPR9BBJ7XziIGP8LSrzYwAsc/chEJ+jJBcpb0Iknol5
 eyGGd6D8hy6PQZLeyKi24LMLVRgAvvLjdg7mxsk83RNCn4T1PQ==
X-Google-Smtp-Source: ACHHUZ4nWngzkypU3Cg/zTok12gK4tc1J01/ofn+M2gks5evrM0O8c9OmbgYZugTUsYq5SSkq3R/lfhedJOdFeeOlkU=
X-Received: by 2002:a05:6870:3651:b0:19f:e1ed:4cc7 with SMTP id
 v17-20020a056870365100b0019fe1ed4cc7mr245378oak.0.1685983307836; Mon, 05 Jun
 2023 09:41:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230605105834.702945-1-arnd@kernel.org>
In-Reply-To: <20230605105834.702945-1-arnd@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 5 Jun 2023 12:41:36 -0400
Message-ID: <CADnq5_P08Mf1Vzsr_fgWodKWrXZyYB26=zwP8VXzyNvgAX2AYQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: mark som eclear_address_watch() callback
 static
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: Mukul Joshi <mukul.joshi@amd.com>, Jonathan Kim <jonathan.kim@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Le Ma <le.ma@amd.com>,
 Ramesh Errabolu <Ramesh.Errabolu@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Yifan Zha <Yifan.Zha@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 5, 2023 at 6:58=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wrot=
e:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Some of the newly introduced clear_address_watch callback handlers have
> no prototype because they are only used in one file, which causes a W=3D1
> warning:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c:164:10: error: no pr=
evious prototype for 'kgd_gfx_aldebaran_clear_address_watch' [-Werror=3Dmis=
sing-prototypes]
> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c:782:10: error: no prev=
ious prototype for 'kgd_gfx_v11_clear_address_watch' [-Werror=3Dmissing-pro=
totypes]
>
> Mark these ones static. If another user comes up in the future, that
> can be reverted along with adding the prototype.
>
> Fixes: cfd9715f741a1 ("drm/amdkfd: add debug set and clear address watch =
points operation")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks.  Srinivasan already sent out a fix for this.

Alex


> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c b/drive=
rs/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> index efd6a72aab4eb..bdda8744398fe 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> @@ -161,7 +161,7 @@ static uint32_t kgd_gfx_aldebaran_set_address_watch(
>         return watch_address_cntl;
>  }
>
> -uint32_t kgd_gfx_aldebaran_clear_address_watch(struct amdgpu_device *ade=
v,
> +static uint32_t kgd_gfx_aldebaran_clear_address_watch(struct amdgpu_devi=
ce *adev,
>                                         uint32_t watch_id)
>  {
>         return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c b/drivers=
/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
> index 52efa690a3c21..131859ce3e7e9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
> @@ -779,7 +779,7 @@ static uint32_t kgd_gfx_v11_set_address_watch(struct =
amdgpu_device *adev,
>         return watch_address_cntl;
>  }
>
> -uint32_t kgd_gfx_v11_clear_address_watch(struct amdgpu_device *adev,
> +static uint32_t kgd_gfx_v11_clear_address_watch(struct amdgpu_device *ad=
ev,
>                                         uint32_t watch_id)
>  {
>         return 0;
> --
> 2.39.2
>
