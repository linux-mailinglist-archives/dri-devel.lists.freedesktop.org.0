Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDE87331A6
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 14:53:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54FB810E61C;
	Fri, 16 Jun 2023 12:53:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA4510E61B;
 Fri, 16 Jun 2023 12:53:32 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-55b069a7cf4so425889eaf.3; 
 Fri, 16 Jun 2023 05:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686920011; x=1689512011;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w2DJZHQdpL3IJvZ92o0uwtsAvPZ4lFxeVkbvKVjLF2k=;
 b=G2jhokx/Sp5VaGnIqNNzlNJglrUvkLJZaIecSn9/uufexFl4+Ee3VdCfVXxUa9RPS8
 gkRFKWnnZfbsXDlRtFE8/1fYQPXmebqpe5r1H2UsWSqUSfeUkjabsRXRK6itzy6GcxGk
 5yKcFtFa+DutHhgH0msvkJR62Og7HQldi7IunNtle3MiEd5lMNhfot09q3vbL7yWXLWC
 DdUOm+v1Hdy6j0c/NBcj7uj5ZNipYeZ3LHYWiNAr7gQWXVZyF6kJz8IzeMNIdqG6OZ4i
 fTH0ODq6T02jBO94XZWO0epnPg4RKVDpsSES0AzAFxdTxQzJKtkUffPwf5NNSHJXzHiy
 G5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686920011; x=1689512011;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w2DJZHQdpL3IJvZ92o0uwtsAvPZ4lFxeVkbvKVjLF2k=;
 b=RG83b9nohUCgA0PNCy83x+ujPZCg2uRqC56vY8YiEEF37IpYrRBC2sigAHt1If5NoI
 V3cfaVuCtREXU5tW7wVVkqLVwBg7mKO6ytduOILLjKnGN6lqBR/Pm/C9FCwJyL3D/50e
 49PzxTaK3gRf34TrWATMS06/VoeU7pfB/PZAKGzS95wDSW1c3vO6yie6jsrRoiz2ogQf
 PrHQXhDjLBXk/4TsOMCEtKpwwPJsWJfIWQZs+a3eQ3EYrcg3O6uoT9O/drTC1fVjWrpj
 LVevuKUFb/J8NrKQW4fwRNoBXdZKq+cfY20X7+j/NOSl8Og0ZvUGrpBlUPi7K41adYsp
 0doQ==
X-Gm-Message-State: AC+VfDx9ltFSL0EgEI285xIGmxJqIjyzJp24NZOGjT4LGKuqC424bqZk
 NCLwOGwIqYjN6b61+mxnvdYFxLlo1E7PEjzS+9Q=
X-Google-Smtp-Source: ACHHUZ5NBPESqSOu9Tlh+n7Ja0S8R1Op1Kj+waIDTv5fiswEzzwvfI2N6skIa+NWpULVJfDnOVfXGXPSNksyloMfkrk=
X-Received: by 2002:a4a:a2c3:0:b0:558:a3c5:86cd with SMTP id
 r3-20020a4aa2c3000000b00558a3c586cdmr1734874ool.6.1686920011040; Fri, 16 Jun
 2023 05:53:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230616121116.1031336-1-juerg.haefliger@canonical.com>
In-Reply-To: <20230616121116.1031336-1-juerg.haefliger@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 16 Jun 2023 08:53:20 -0400
Message-ID: <CADnq5_Nnr=BO2y3O3_x+sX-93CtY7g52m9DHva7WWqeeO5xqMA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Add missing MODULE_FIRMWARE macro
To: Juerg Haefliger <juerg.haefliger@canonical.com>
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
Cc: lijo.lazar@amd.com, Bokun.Zhang@amd.com, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 YiPeng.Chai@amd.com, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, Likun.Gao@amd.com, Hawking.Zhang@amd.com,
 christian.koenig@amd.com, mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 16, 2023 at 8:11=E2=80=AFAM Juerg Haefliger
<juerg.haefliger@canonical.com> wrote:
>
> Add the missing MODULE_FIRMWARE macro for "amdgpu/fiji_smc.bin".
>
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index 5c7d40873ee2..1f83a939d641 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -92,6 +92,7 @@ MODULE_FIRMWARE("amdgpu/picasso_gpu_info.bin");
>  MODULE_FIRMWARE("amdgpu/raven2_gpu_info.bin");
>  MODULE_FIRMWARE("amdgpu/arcturus_gpu_info.bin");
>  MODULE_FIRMWARE("amdgpu/navi12_gpu_info.bin");
> +MODULE_FIRMWARE("amdgpu/fiji_smc.bin");

This is already specified in smumgr.c.

Alex

>
>  #define AMDGPU_RESUME_MS               2000
>  #define AMDGPU_MAX_RETRY_LIMIT         2
> --
> 2.37.2
>
