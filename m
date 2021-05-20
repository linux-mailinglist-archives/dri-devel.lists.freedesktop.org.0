Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2D538B76C
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 21:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A39E6F504;
	Thu, 20 May 2021 19:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999E26F4F7;
 Thu, 20 May 2021 19:22:42 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 i8-20020a4aa1080000b0290201edd785e7so4035250ool.1; 
 Thu, 20 May 2021 12:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EjT7GiCfXinEXUQOvKuQzFUPIz+xSQbJvdKQn8o730Q=;
 b=J6JyotW8A4NEMe3rO8EdKpWc6K9L6dzZQkTX0VlmudWLmoDYuUe1tk0R8L7q1mX4TQ
 FBcSeqnfkGJfo8dGTyRhTqmwKd3RILGOJCAWKF/7IXWgtXAkDsJIq4r5/QCzxdnIXazc
 eDyMEcRlY7Yo+Uskm8PGaxYeX8xn69LQFccSZeUK15taQP5c68EwbFWncAUBDODaz7eR
 8VlbWsit1MeEyvAUdqCBsEX6hZ9zYNFaYuxZ4a02XOcsrTu5JULnfRVfn6WdEaOYFucY
 7TmeSo55tUz0A2Yr5aA932q8UN1XfomsuSFKtzX6EoMUVDzwgrPpgFud6yVdL+JBRIrw
 tvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EjT7GiCfXinEXUQOvKuQzFUPIz+xSQbJvdKQn8o730Q=;
 b=luLCZZFJCMUEr6DrKPfRYtve30+DIhcq8EfI6UoK3rVGo72+a/4Qg4RhOe4Sk9ABj+
 m1v506pFNkX4S8qwuhavTA8SinVBqt2kG4Ta5F5n/D7xHFY6Uf9ON5xAI2K6idNuez1c
 FDvIiRsea25+zz/BAKHOs/rbzh0ldQpUtCvgIDEsGOi4tD734h3VvmPL+7DHFwOjHcqA
 CQO5UXDOzYSwJzAQz2yFUOPu95wPvWeD/5qQzboMUiTwN1RAeISuXX6ziCkythEssPBE
 P2FXq8XViEMUiHwtEA4vpp8fFnvOArhxwnQLoi+5uW0Ev/w552EYcDdxkw51IqB52IpA
 4Dfw==
X-Gm-Message-State: AOAM530qDgAsY86FJ8iwduiuQIG9kzI3kwtzsZsa6ErdBV1KAEjKhuCe
 rUp41F76eLKR6Eb9prIGl+zMPdj6en6Ejg+zOeA=
X-Google-Smtp-Source: ABdhPJy68VS+3Rrx6xIOPNbBqW0+PFwgP19t6GdE0mfrNGhJU9QeDmXfAw6Wqvfqhk5v26syXxUUfcLiuaYFjHe73Nw=
X-Received: by 2002:a4a:d543:: with SMTP id q3mr4949388oos.72.1621538562024;
 Thu, 20 May 2021 12:22:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org>
 <20210520120248.3464013-32-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-32-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 May 2021 15:22:30 -0400
Message-ID: <CADnq5_NMkxBTOe535wAjmpjT0VH2Xu4v6VRs0gn=Hp3g9y+sbA@mail.gmail.com>
Subject: Re: [PATCH 31/38] drm/amd/amdgpu/sdma_v2_4: Correct misnamed function
 'sdma_v2_4_ring_emit_hdp_flush()'
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

On Thu, May 20, 2021 at 8:03 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:281: warning: expecting prototype=
 for sdma_v2_4_hdp_flush_ring_emit(). Prototype was for sdma_v2_4_ring_emit=
_hdp_flush() instead
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
>  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd=
/amdgpu/sdma_v2_4.c
> index 9f0dda040ec88..4509bd4cce2d6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
> @@ -271,7 +271,7 @@ static void sdma_v2_4_ring_emit_ib(struct amdgpu_ring=
 *ring,
>  }
>
>  /**
> - * sdma_v2_4_hdp_flush_ring_emit - emit an hdp flush on the DMA ring
> + * sdma_v2_4_ring_emit_hdp_flush - emit an hdp flush on the DMA ring
>   *
>   * @ring: amdgpu ring pointer
>   *
> --
> 2.31.1
>
