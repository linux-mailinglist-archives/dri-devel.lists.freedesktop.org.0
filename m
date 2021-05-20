Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCA738B77E
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 21:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C456F50B;
	Thu, 20 May 2021 19:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED866F50B;
 Thu, 20 May 2021 19:25:04 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id v22so17468245oic.2;
 Thu, 20 May 2021 12:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lVeE6IXTSZq52YIMiJlL2kagzPEUqCZI6X+G12sjjFk=;
 b=NppzDjpIoyI0AJgaBtwTYOMbeW6j7IM2/FKF5wmpjpVAf4XOhG1i+aZmXpKAYWmrEZ
 QWZu3sRp244vQJASQrXoVgkbhZuCUAaCF6K7KeYAl3q3jfA6FFjH+Iov8R72ZT+bT+np
 xHilSrgDF4womkZkKuDJEbZwxHL6nvz/aBrqYIdcJUuue2K+fqt4216E4zwAsVwffm9N
 0HNP7n+XXlKXVG8UjfrGU6/bH+2Jw2Sl7hjQw7Y6fhmOJz0Vms9S9GCRJEvOQ1MP2/bp
 sYANxZ5PRJ4jVNRVha7NGZFm9xcZ3PDPiOo/1nhCvjvP9Bq0yA9qx27hNa2Nm3usoL4e
 SsjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lVeE6IXTSZq52YIMiJlL2kagzPEUqCZI6X+G12sjjFk=;
 b=CbtGNrhZbEeVqwp5+lstTX+Z9TmN3aqBI70GkqDgrFkFoY2Gj2T/iS9InmRxXtfNyx
 04K1TE6ujJcZUdxDAnw8ysJMVFqsKvzSvRM1xn0CNUDIEuM9giJo5N0nf2Itseaz4K9d
 umHpK9JHS1/omptKbuenc60sLKFaMWQRyLyrz973n/AwJW05jsempioPgzm30TJE619W
 /9zlhLbp97O/2JSDa0DrJyhFLNXqva4Raz4Cfb50j83eN6BpVZUNo/p19Pcjw/XmjeUJ
 4s592k1sd34dj0mKvrQZaXH8Ax2xMbvJ9Dl0kjFnXPCUXq96hFKKU6FsODXnlL54A+IW
 RZNQ==
X-Gm-Message-State: AOAM532/vDUkK0SGvAgNeDUAOI8d+7SCBiSPzZ97zLpgsw/hHE9kifGl
 MJQhDF++zo+S4NP+TpoHkx+2rT9AN+/Ms3f3nsZn3jUE
X-Google-Smtp-Source: ABdhPJwUTj/6hABxGzsumBBPCdBSvbVvUey+E+MnywXwN4uKu+7momw2GO2WmgYigcRZgt26sng4UQTTieCnXeyCtKo=
X-Received: by 2002:a05:6808:1592:: with SMTP id
 t18mr2494803oiw.123.1621538704376; 
 Thu, 20 May 2021 12:25:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org>
 <20210520120248.3464013-36-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-36-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 May 2021 15:24:53 -0400
Message-ID: <CADnq5_Pk9ez0e46DD=zZzUOnORh6JX1QCow7hCZvT-UucwJ9Tg@mail.gmail.com>
Subject: Re: [PATCH 35/38] drm/amd/amdgpu/sdma_v5_2: Repair typo in function
 name
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
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:501: warning: expecting prototype=
 for sdma_v_0_ctx_switch_enable(). Prototype was for sdma_v5_2_ctx_switch_e=
nable() instead
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
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd=
/amdgpu/sdma_v5_2.c
> index ecb82c39b1062..deb907f960906 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> @@ -517,7 +517,7 @@ static void sdma_v5_2_rlc_stop(struct amdgpu_device *=
adev)
>  }
>
>  /**
> - * sdma_v_0_ctx_switch_enable - stop the async dma engines context switc=
h
> + * sdma_v5_2_ctx_switch_enable - stop the async dma engines context swit=
ch
>   *
>   * @adev: amdgpu_device pointer
>   * @enable: enable/disable the DMA MEs context switch.
> --
> 2.31.1
>
