Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EAF709D16
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 19:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE6210E545;
	Fri, 19 May 2023 17:00:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C4D10E545;
 Fri, 19 May 2023 17:00:21 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-5523bd97c64so688573eaf.0; 
 Fri, 19 May 2023 10:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684515620; x=1687107620;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pQuIkMy/HPKv97ahyctrHLhGA05/LEVhydcSsEpZ0SI=;
 b=Y3SbFGSh5Jl8RXdDUZC7CLWwQDVmTszasfOjXuIzMo6Bbs9xiZvrv7E3O69fnWMl5/
 Vfo+rnaDQnTwJxqlES9RS9l14+rVpxMl1XQpRchGexAzF35r1sFy1A7/xPHkTrzwjLj5
 MxUC74Mu2BiNhVQfdnRiO3PZI6J8/qqGPvgJI1g/CqiBlpQOoWKd2ljk4VColeJAz303
 bziUdHw8s7UCzDvVKUQx89ZoubQfKYD2z6SMWEotgzINwDZP+9Ndun9AysDty8uqiS0K
 pm3H7JOqPwE+cykBRNlN6bWroft+DRF/UjCyPrwKFWjh1fMjsUYyFHhc8TICH1+ieAH3
 AbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684515620; x=1687107620;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pQuIkMy/HPKv97ahyctrHLhGA05/LEVhydcSsEpZ0SI=;
 b=Kt0nh20J8NMIlGkCVaNB+FHGGu/AeodF4ipZ1piq13afULYu5FHBOnEn0DbWSkic24
 7+AEPdMCaaNPgjzEm7Jb9mv8n2amiYhN5Gro/IGq0HzAsWw361CBebZ5EcFQseO9/j4R
 CSD1ySSAPFWCdL68DmDe7UU5HyzGFWnm1TLPmY+YjU0GsHXguSkMsU4t49YTDNru0SCg
 MUspVvHizrVhPj6Hl6BcDC+1AJy22vTq4zjOd5RSu/ToxARk4xfRNuhVK9eg8Ym4ukC9
 mY1ytNJSlScnd1ZiAPdXM3af4JL91L/CAPCChU5SnHmSPY3HeKxCrG1cA6Hy5r/WHMki
 rlyQ==
X-Gm-Message-State: AC+VfDzjxHZLxP4i4P28zm2WV+rOLTND/UFkFyqAjpYbO+d5sYBZzb6r
 H+S8I7Z+H+7WdpNFg16vldaL9+5lJGAS+QzHgLo=
X-Google-Smtp-Source: ACHHUZ6yzfco7XPAo7FXX9wEXzy6Ov3/G3qkO//oLRDznuAjUp1H30ypStrE4c+rMYx6Zrqk9STT8pcfGLSo/hBy+CI=
X-Received: by 2002:a4a:d24d:0:b0:541:87fe:5b75 with SMTP id
 e13-20020a4ad24d000000b0054187fe5b75mr1254701oos.1.1684515620580; Fri, 19 May
 2023 10:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230518135138.990475-1-hch@lst.de>
In-Reply-To: <20230518135138.990475-1-hch@lst.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 19 May 2023 13:00:09 -0400
Message-ID: <CADnq5_N-5F+jRe1PTPcPs7wZPXxnV4nm=MfxJAoxzpRkY0CTeQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: stop including swiotlb.h
To: Christoph Hellwig <hch@lst.de>
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
Cc: alexander.deucher@amd.com, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, May 18, 2023 at 9:52=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> amdgpu does not need swiotlb.h, so stop including it.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index 2cd081cbf70621..385e04612e4e9b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -38,7 +38,6 @@
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
>  #include <linux/swap.h>
> -#include <linux/swiotlb.h>
>  #include <linux/dma-buf.h>
>  #include <linux/sizes.h>
>  #include <linux/module.h>
> --
> 2.39.2
>
