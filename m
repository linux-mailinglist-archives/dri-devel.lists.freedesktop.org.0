Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0AB38B792
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 21:28:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0DE6F517;
	Thu, 20 May 2021 19:28:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0992C6F516;
 Thu, 20 May 2021 19:28:02 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 v13-20020a4ac00d0000b029020b43b918eeso4039301oop.9; 
 Thu, 20 May 2021 12:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4k80R92raKX44try8NOlI5SNEciXr8tCWt15U235ZOY=;
 b=u5HMyC2dzOhRwetk6bFz5gxLMOhluu4CAuFx5YJ9V3fbc/xw/CgL5YRqYjhGiyTW5n
 3AqF3gy2HlXhnwJ0kZfowlu0bDBzz2toiJdGn95DqPqVNTsAq0ZvJ8Q+HfHXnQFAJuEF
 B+gCJPmEySu7ANm9VWs7g6r1aM2vci0dafOoH+ksiVn0CwsVL6/mH8ppdwz8MJ+DT1dH
 cN2WQhb020RIVtBZqgNHNS43F6T9b8ou7Tw2j7gfAgwHfcUZzHUmMxfsECPsBFofyL2r
 nzo8wZzOG+rq6dVItNbWteQlyBTRaS5mpPUPrcawglZWe15fu50Our5mUlnK1SJ8Yxdo
 NrVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4k80R92raKX44try8NOlI5SNEciXr8tCWt15U235ZOY=;
 b=XNNeTunGN9J3S58R5ygvSPe52uDTGD4mmgU38AwB+tNWzcCa0RjfK3KCKiZygD9YBb
 baguhCmE7mzkfmmWPkI8CnFy64dU/HZVlbI1O6gTfIgsN7ksAOxGb1PryAOnqLdWp79h
 mj1LyzClvTUlIvcrR/xPYG039u3B33wSsIkvdvdnlZkBigXOFAkLtjyg8JUCEM7G6zSq
 XHHCjdLIiVnSR3+0vx3IALX/cXcUaiyOp2W+hy/TDJkKntqA7Tf1nHD2asr/0Tcw4MaH
 iQV8JEmL4laIIMSMP226tt4t1NbAazvIrduGPf1151gYC7jsChYgmJK5KqGrz8Z0En9z
 tZfA==
X-Gm-Message-State: AOAM5323Hl4lEvqWVpbzufa8QEMfUZkKj0doxtsPKCh2l2yXlf5V1HZT
 Bv1y5qm27J2Pt6Oji/7/oKJbbaYG3v1xugFewCuboUuw
X-Google-Smtp-Source: ABdhPJw/G1SAe+q/1vmFaWI1wZ9doKKFcivmwBNweNkYvrpMqu9DHVkQfhze30Eo9Oia8iZcUi5SWEhoaNXsk7+gfII=
X-Received: by 2002:a4a:d085:: with SMTP id i5mr4993114oor.61.1621538882348;
 Thu, 20 May 2021 12:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org>
 <20210520120248.3464013-35-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-35-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 May 2021 15:27:51 -0400
Message-ID: <CADnq5_NqMsveaWdJGzGzx4OZ3wkHso=3T+r2RXwYBAbsFSLSOg@mail.gmail.com>
Subject: Re: [PATCH 34/38] drm/amd/amdgpu/amdgpu_vce: Fix a few incorrectly
 named functions
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, May 20, 2021 at 8:04 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:98: warning: expecting prototype=
 for amdgpu_vce_init(). Prototype was for amdgpu_vce_sw_init() instead
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:214: warning: expecting prototyp=
e for amdgpu_vce_fini(). Prototype was for amdgpu_vce_sw_fini() instead
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:590: warning: expecting prototyp=
e for amdgpu_vce_cs_validate_bo(). Prototype was for amdgpu_vce_validate_bo=
() instead
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:724: warning: expecting prototyp=
e for amdgpu_vce_cs_parse(). Prototype was for amdgpu_vce_ring_parse_cs() i=
nstead
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:960: warning: expecting prototyp=
e for amdgpu_vce_cs_parse_vm(). Prototype was for amdgpu_vce_ring_parse_cs_=
vm() instead
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_vce.c
> index ea6a62f67e380..7ad83da613edd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> @@ -87,7 +87,7 @@ static int amdgpu_vce_get_destroy_msg(struct amdgpu_rin=
g *ring, uint32_t handle,
>                                       bool direct, struct dma_fence **fen=
ce);
>
>  /**
> - * amdgpu_vce_init - allocate memory, load vce firmware
> + * amdgpu_vce_sw_init - allocate memory, load vce firmware
>   *
>   * @adev: amdgpu_device pointer
>   * @size: size for the new BO
> @@ -204,7 +204,7 @@ int amdgpu_vce_sw_init(struct amdgpu_device *adev, un=
signed long size)
>  }
>
>  /**
> - * amdgpu_vce_fini - free memory
> + * amdgpu_vce_sw_fini - free memory
>   *
>   * @adev: amdgpu_device pointer
>   *
> @@ -574,7 +574,7 @@ static int amdgpu_vce_get_destroy_msg(struct amdgpu_r=
ing *ring, uint32_t handle,
>  }
>
>  /**
> - * amdgpu_vce_cs_validate_bo - make sure not to cross 4GB boundary
> + * amdgpu_vce_validate_bo - make sure not to cross 4GB boundary
>   *
>   * @p: parser context
>   * @ib_idx: indirect buffer to use
> @@ -715,7 +715,7 @@ static int amdgpu_vce_validate_handle(struct amdgpu_c=
s_parser *p,
>  }
>
>  /**
> - * amdgpu_vce_cs_parse - parse and validate the command stream
> + * amdgpu_vce_ring_parse_cs - parse and validate the command stream
>   *
>   * @p: parser context
>   * @ib_idx: indirect buffer to use
> @@ -951,7 +951,7 @@ int amdgpu_vce_ring_parse_cs(struct amdgpu_cs_parser =
*p, uint32_t ib_idx)
>  }
>
>  /**
> - * amdgpu_vce_cs_parse_vm - parse the command stream in VM mode
> + * amdgpu_vce_ring_parse_cs_vm - parse the command stream in VM mode
>   *
>   * @p: parser context
>   * @ib_idx: indirect buffer to use
> --
> 2.31.1
>
