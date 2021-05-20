Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C19338B782
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 21:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56CE06F511;
	Thu, 20 May 2021 19:25:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CAD06F510;
 Thu, 20 May 2021 19:25:44 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id u11so17448505oiv.1;
 Thu, 20 May 2021 12:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jP7V9on14Wbn9cVMjkYpwwbeii1k8feXDpcOLaFr/ZA=;
 b=qcjvQOaL6FVCN/qtvhskOg/KM52KS0jZicEMg+rFrj0xPFxkUMDJVwoj5hq4EP5rAY
 dwx7/Bye5cm40OO0t3CjjT6Ui8XjuolUyPYtrL25XM1RdoSIiDQ32rsQfoPUn10G8+fR
 cuL7rmfMeb8Lb6qeMd/5A9MQpUfzCUZN6Kmp45SnlrXi+qTrpLPeX5lzMMJsQIsapP4k
 w2xW+vB/SAUul57FbZ4+Nnk5JGdn8BckMe91jfo1aNwIoHqIldJMG+DXa05EznVv6RH4
 Q6wSlVI74UuV4Q0+rT0l94VsScXDRL7xh0RtOm3N/bNbYYg1uYMWbWCo5McxmK3Px/af
 Phpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jP7V9on14Wbn9cVMjkYpwwbeii1k8feXDpcOLaFr/ZA=;
 b=GCWX/TiZ1refhppDXOrMGsnbNc+V5cBBdomzJahjTxxd3x5EX3msY8IfRl6KueV5Qz
 BRqXPs9ionLbh/IZuGqBda2dNcpaPUkDKvshly+D3v1WqkqonXDEjQc/kbAU6URG2R+/
 IuBVFPovSv1VWS8wbU2CnidMIdYFXd5dinSvSL9ZU6MrIoNibhPWU6oBITed1RYPgPKw
 PJmh0uPCD9lDvFiQuiILXB4knhY+IA1NpiAW+9Sk3J+sbJSH9mWDU7Tmubd1kQMWZ2TO
 YyH+medZXFULszGZol2wc+iA/fcp/ud+2y4tIC16u5qYmcbsCV3N0Ql8Rm2dC/KfcAbd
 SLTg==
X-Gm-Message-State: AOAM5311hDTwqHImC+2B1nFdDwpQlFzKgvmrZjuFaohsvMGU4cOkr7tW
 4FuJYEWToK7yFQcGMxTDyhXty5NvC8/CrHBSff8=
X-Google-Smtp-Source: ABdhPJw/IRLYslkqMnEsahf4i98spgdQTKKRx48jW+eoP6/J47a/swlS5KwPFjt0AO1JUByC+7OoBBEUxd/D4/T5iBw=
X-Received: by 2002:a05:6808:1592:: with SMTP id
 t18mr2496065oiw.123.1621538743810; 
 Thu, 20 May 2021 12:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org>
 <20210520120248.3464013-37-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-37-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 May 2021 15:25:32 -0400
Message-ID: <CADnq5_OpCwYAJOX1wDSpkYFg8wt9VroU0PmPstcgSe=h7cw60A@mail.gmail.com>
Subject: Re: [PATCH 36/38] drm/amd/amdgpu/vcn_v1_0: Fix some function naming
 disparity
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, May 20, 2021 at 8:03 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c:775: warning: expecting prototype =
for vcn_v1_0_start(). Prototype was for vcn_v1_0_start_spg_mode() instead
>  drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c:1111: warning: expecting prototype=
 for vcn_v1_0_stop(). Prototype was for vcn_v1_0_stop_spg_mode() instead
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/=
amdgpu/vcn_v1_0.c
> index 0c1beefa3e498..2c9af18683feb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
> @@ -765,7 +765,7 @@ static void vcn_1_0_enable_static_power_gating(struct=
 amdgpu_device *adev)
>  }
>
>  /**
> - * vcn_v1_0_start - start VCN block
> + * vcn_v1_0_start_spg_mode - start VCN block
>   *
>   * @adev: amdgpu_device pointer
>   *
> @@ -1101,7 +1101,7 @@ static int vcn_v1_0_start(struct amdgpu_device *ade=
v)
>  }
>
>  /**
> - * vcn_v1_0_stop - stop VCN block
> + * vcn_v1_0_stop_spg_mode - stop VCN block
>   *
>   * @adev: amdgpu_device pointer
>   *
> --
> 2.31.1
>
