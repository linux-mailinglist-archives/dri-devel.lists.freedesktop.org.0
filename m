Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B432B176B7
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 21:38:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3F110E3A2;
	Thu, 31 Jul 2025 19:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k1sQ8Uxu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9A210E3A2;
 Thu, 31 Jul 2025 19:38:25 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-23ffa774f00so1812225ad.1; 
 Thu, 31 Jul 2025 12:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753990704; x=1754595504; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+nJQHYUhisfV5M90eMTD+0GiV2DAMpDGvtFOZlc232Y=;
 b=k1sQ8Uxu5PMfVm71RneWoccNAvZPMLRhi/x2czaTyBQ0z8Ng4ewTwb2lygxjDxJYZZ
 XaLXjWgUuQ85zoMIqVfSakN2fr6IuOOYCJ9yxESqHiSbFQ3c5meSEom8Qr6IVCTHRag8
 bXwMaVXENwbSi+OWZ1NxPmIohNAoNakWStAxJUDFfGKklZrzT2rcU3uN1Zy7w01sSjXy
 5ct2zrgwG2phQJB+vidawPeobT5HER20Rd8QxRymJ0OoR1OJaoYc6X7BAfOMLbTBzMQ1
 ZEDY1R6mnS0Zmd7zd6WsWTZYhmfmXKkszDJxBkumdofHDvYl6sz4aCgEk/JpVnb64yu8
 jQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753990704; x=1754595504;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+nJQHYUhisfV5M90eMTD+0GiV2DAMpDGvtFOZlc232Y=;
 b=hn3N9ZqfiKwSa+aYL0NT9F01gJlkh9DYcLBj3/ZF3QEEKCgCdUfjyIVP8N3jndl9UO
 9Iz0uEvOa2Lnlkp/Qdh3wAd5fjzE0wQjpYzOhk09JXbByP7jorbAKEc1w8GgsSbj9iOG
 n7cu6HxeuHoejGmwSSRf0ZuhUfAXR/MGLb04cyJHbG76xwS7uv24+AWH7KV473t49nRE
 u/nr4uvps2nUpwbsl8bgliJu17GaYYVlOI8fwGAUw001swih8Ygu1zVtApen2pgPmY6M
 tP+0eyPfUB/yaJYaTEiHMyCVgY3fKHqjJMMPLu6v/SEWCMbIUM6IPFR8uyXS7cOztJWB
 04kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVixYTzGDe2b8lvnAOtaI55cDsYmssKVGKb7nzYEFhWA2KbXiwToq5Shr7MOexWVozQXdfHxqlj@lists.freedesktop.org,
 AJvYcCXWebgVDzP7DemlATOY1g0Pbllkn20TbGSdb5IDDLqh/2a5q+98vNcLYuqn/nHEoxZFbXf0HYAkQjol@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzdFsUCT1UF9M0NJXeW24sbb2lvNeg2IJ1KNFlRPHgZ9+ibDYk
 a4m8AOAfFKVXP+wOPpEtvnfom3/1heAZo/EA4gFNNsnlgDtzCadqZUSUKk9Z5KLEycjHQ+JpzzX
 PVgKIt43QM7t6BVwry0MeFgNqSkpz5zA=
X-Gm-Gg: ASbGnctAELnF+N97MgQLwxAPCFJMUpMd8Xvn/d3HiQ53V7s9AQVzyUNvmVAOFsTP89k
 REmQX1l9eHGi6ZVfpAISmhisX4mEcA29hsbhI61IQeJ4GNbzws3gTkrRnzSTDhwvm5r6VWexTrW
 6qwC+8UWGrZiTFp17g5SwBRDy+sCdz89pRCItFNZCqJPVDrwgqnBbbMu7+N4PpA0+6nTH9u+p1o
 Tr5OWW8
X-Google-Smtp-Source: AGHT+IHKraBiPAHAtmlxuZVn9jWMYVcl9dhr5+Dedao236F5TgJPt1RO39w04aZoFh8q/WQ0FU/W2AyRP7EdmZD4wuw=
X-Received: by 2002:a17:902:8a97:b0:234:8f5d:e3a0 with SMTP id
 d9443c01a7336-24096a45d8cmr40459695ad.2.1753990704517; Thu, 31 Jul 2025
 12:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250731-b4-dont-wake-next-v1-0-e51bdc347fa3@gmail.com>
 <20250731-b4-dont-wake-next-v1-5-e51bdc347fa3@gmail.com>
In-Reply-To: <20250731-b4-dont-wake-next-v1-5-e51bdc347fa3@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 31 Jul 2025 15:38:13 -0400
X-Gm-Features: Ac12FXyBjD3ItO0dcnGXh1AljGbawzz44WIJXOmQ_0Y5C-recG2hknJWWCHTF8M
Message-ID: <CADnq5_PG1Am4OGkfKo9o9cfnvSdzwRFeYudbvw220+P1AHO4xA@mail.gmail.com>
Subject: Re: [PATCH RFC 5/6] drm/amdgpu: don't wake up the GPU for
 mmGB_ADDR_CONFIG register read
To: Philipp Zabel <philipp.zabel@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Philipp Zabel <p.zabel@pengutronix.de>
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

On Thu, Jul 31, 2025 at 3:33=E2=80=AFAM Philipp Zabel <philipp.zabel@gmail.=
com> wrote:
>
> Don't wake the GPU if libdrm queries the mmGB_ADDR_CONFIG register
> value during amdgpu_query_gpu_info_init(). Instead, return the already
> cached value adev->gfx.config.gb_addr_config.
>
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2295
> Signed-off-by: Philipp Zabel <philipp.zabel@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_kms.c
> index fe1347a4075c4..ed4d7d72f2065 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -883,6 +883,16 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *=
data, struct drm_file *filp)
>
>                 alloc_size =3D info->read_mmr_reg.count * sizeof(*regs);
>
> +               if (info->read_mmr_reg.dword_offset =3D=3D 0x263e &&

I think the offset of this register varies across chip families.
You'll need some way to determine what the offset is for each family.

Alex

> +                   info->read_mmr_reg.count =3D=3D 1) {
> +                       /* Return cached value of mmGB_ADDR_CONFIG */
> +                       regs[0] =3D adev->gfx.config.gb_addr_config;
> +
> +                       n =3D copy_to_user(out, regs, min(size, alloc_siz=
e));
> +                       kfree(regs);
> +                       return n ? -EFAULT : 0;
> +               }
> +
>                 ret =3D pm_runtime_get_sync(dev->dev);
>                 if (ret < 0) {
>                         pm_runtime_put_autosuspend(dev->dev);
>
> --
> 2.50.1
>
