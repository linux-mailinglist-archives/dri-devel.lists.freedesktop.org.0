Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7394038B6E8
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 21:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E03B6E42A;
	Thu, 20 May 2021 19:13:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DBC56E42A;
 Thu, 20 May 2021 19:13:55 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 69-20020a9d0a4b0000b02902ed42f141e1so15843378otg.2; 
 Thu, 20 May 2021 12:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4e2VdgTFJlvcvj2P7xFhk2OWf2Vw8hURmKQ/jkEZ8DQ=;
 b=ezXgqYpyUEE3k6E23Z2w5y+7QpfYLuVRb58W1d8LCGCQ0rI4n/+xcn5pEOnD2XEwGc
 ZFESJRjhrzmvYJypAz7kjFxjWWm69x1rgmsg1M5+byOvCbkqD42Kily+y/V2v7FJzoQG
 GfDqsptBHJ0Uxc3A6wre9aw1x4UCQx+8I5G1vOLiof5atKnNOO6XN1iNHxqQb2vMGBLf
 53GGvgIlVVnteholUZOzNBuxzJhcv7wvIo/t18cbb5lbKHntcgUKW4U+Z9clRT/TAcLx
 dc+jUzXPwbm/yPvryNh3KuiOLNobxwyIFoHHpPTE3KtW7XcCnOXgmMGaZ4+7xbGqHpjI
 R8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4e2VdgTFJlvcvj2P7xFhk2OWf2Vw8hURmKQ/jkEZ8DQ=;
 b=OqsA5gDq8LKQTnQOL3p53IoTjE2ptws1N13K9QOZ9tkw/LZrIupYfAA8mRpzhlENb3
 xHPWMfOe2ho2C/QKeNU7aNynHD0RrwsNZoud5frYfDWreO1a3uLU89eS+6xL2SpddZa+
 +JRJh1QPlLgJHVNdSxKhjdX07MdeJaEmWmji7WoiKz73SjW2yn159UfsPviiXVIgMSw6
 7m6vvNiAe3z4f7sDA9ghsLVsT8nLSqvWHu3uj+GOYBC2I6tukvehm3jBlDf78FPJQEf4
 DVbIsBaTh3PPpsQEIDpf57ZrYjpJtHmiwUezdnovwx3sjBmVGSpzOl0ikn97rXhlL1Cs
 i7YA==
X-Gm-Message-State: AOAM531VdvpIoRlUwR5eeQ9DkFJuEL7WPM++yceW97mXhDNY4Wukikl3
 k111Q0qK6vADk8wmbo4wWuzFE/GCRNQ2czkBBGGxRlwY
X-Google-Smtp-Source: ABdhPJzAKzYxXdp5xq0MqY9EcXKxblI7UDxmIIZsPw8Bd2K9JzAYaNM6nwJLxQjNQ1GW6s2RE+yFoJXI7ECtaUP0+68=
X-Received: by 2002:a9d:57cd:: with SMTP id q13mr5101139oti.23.1621538034833; 
 Thu, 20 May 2021 12:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org>
 <20210520120248.3464013-15-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-15-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 May 2021 15:13:43 -0400
Message-ID: <CADnq5_Mpddbb4FX0FX+6NAhhOH0iQ3ZnP37-jOkWupqdmWwmrA@mail.gmail.com>
Subject: Re: [PATCH 14/38] drm/amd/amdgpu/gfx_v7_0: Repair function names in
 the documentation
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

Alex

On Thu, May 20, 2021 at 8:03 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2126: warning: expecting prototype=
 for gfx_v7_0_ring_emit_hdp(). Prototype was for gfx_v7_0_ring_emit_hdp_flu=
sh() instead
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2262: warning: expecting prototype=
 for gfx_v7_0_ring_emit_ib(). Prototype was for gfx_v7_0_ring_emit_ib_gfx()=
 instead
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3207: warning: expecting prototype=
 for gfx_v7_0_ring_emit_vm_flush(). Prototype was for gfx_v7_0_ring_emit_pi=
peline_sync() instead
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
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c b/drivers/gpu/drm/amd/=
amdgpu/gfx_v7_0.c
> index c35fdd2ef2d4d..685212c3ddae5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> @@ -2116,7 +2116,7 @@ static int gfx_v7_0_ring_test_ring(struct amdgpu_ri=
ng *ring)
>  }
>
>  /**
> - * gfx_v7_0_ring_emit_hdp - emit an hdp flush on the cp
> + * gfx_v7_0_ring_emit_hdp_flush - emit an hdp flush on the cp
>   *
>   * @ring: amdgpu_ring structure holding ring information
>   *
> @@ -2242,7 +2242,7 @@ static void gfx_v7_0_ring_emit_fence_compute(struct=
 amdgpu_ring *ring,
>   * IB stuff
>   */
>  /**
> - * gfx_v7_0_ring_emit_ib - emit an IB (Indirect Buffer) on the ring
> + * gfx_v7_0_ring_emit_ib_gfx - emit an IB (Indirect Buffer) on the ring
>   *
>   * @ring: amdgpu_ring structure holding ring information
>   * @job: job to retrieve vmid from
> @@ -3196,7 +3196,7 @@ static int gfx_v7_0_cp_resume(struct amdgpu_device =
*adev)
>  }
>
>  /**
> - * gfx_v7_0_ring_emit_vm_flush - cik vm flush using the CP
> + * gfx_v7_0_ring_emit_pipeline_sync - cik vm flush using the CP
>   *
>   * @ring: the ring to emit the commands to
>   *
> --
> 2.31.1
>
