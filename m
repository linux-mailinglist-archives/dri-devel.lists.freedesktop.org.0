Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B15672A2CC
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 21:06:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E26510E0AE;
	Fri,  9 Jun 2023 19:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A39D10E0AE;
 Fri,  9 Jun 2023 19:06:00 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-55ab0f777acso1416735eaf.1; 
 Fri, 09 Jun 2023 12:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686337558; x=1688929558;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mOMvkZnPwmIO9rUDsynYpLezUNy31X65xq+c1pvLo/s=;
 b=qZOElJiJqsKIUEZ/4W0bxkDQ5IRO6XWZ6HMgsZGzbdLDwGFlP8zIRzDsmMxJtJo7Pe
 Y4UETOwCudj6NWjmm7+KDVKQfjAYazbUTknxg0t5NnA507jCMfqAN3BSzj58nh2qc5pd
 iIZh207kPMaMO3BRRGpb112M5J1ecsBzRgTER5+J5ssAK06rgNPIFwHWP4XhcLgOfhUl
 YhaciTgZAMas7YjpyOaloenbzB//wX2oLsEDsbKNcbDvULoWO9ZD0HrI1wI2fvTtAyUD
 kbUUZo/e53fFxOtLofLZ8GfIad4ItQDHVSdX/2SckLjjnRy0ePQwdB1u4XKX56trxTkt
 btOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686337558; x=1688929558;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mOMvkZnPwmIO9rUDsynYpLezUNy31X65xq+c1pvLo/s=;
 b=M92lyk7HgeqWTtd6BA+PXKIKeWUiVGKMbMHhMt5M+C/nBMS1k7DLN+1PDKDg5/ARwX
 nJXoFBSjyIja8H5+Zkyf6EuG8hAdMAF1bNL7/oc2rff5Y7PspDsaq96ZJwBNRhFI4f43
 LQu8kPptcP87y68gCkOI79KQWahfk/1yn3R4mmB2tpxb2Z3ah5abq8mcoBFkqov0xJiW
 pW3YooLvRJjPZ1thp7TSUAm3M8ppmA3XZMhaLrQFl8WAcoOzloOk9ZjYQ1LByFvR3zGi
 VeZLsnymw8u3fU7mlocVVVR56ri4nqKUSNC441d76Do9RjFEUmqGZs7+AXJYmXOB9YMd
 12Eg==
X-Gm-Message-State: AC+VfDzm8i6pZZzHXqEpLHdRsot+o+LxnUiZ/ZUR6O713P4xgMD32xUP
 qi+9oEwXOu5JGhFcwHY4Mly7jWLAXfyMf0kmBGY=
X-Google-Smtp-Source: ACHHUZ7VVOVGPYkQhvxHXzRFN2Pvvtu5u5tXb4+ByJD8vIVQa6VfmTrN8dYJvKeI4gq0hQCaGTm4nZTtEr62J0fBLcY=
X-Received: by 2002:a4a:e708:0:b0:555:9b48:93de with SMTP id
 y8-20020a4ae708000000b005559b4893demr1382251oou.5.1686337558655; Fri, 09 Jun
 2023 12:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230609081732.3842341-1-lee@kernel.org>
 <20230609081732.3842341-16-lee@kernel.org>
In-Reply-To: <20230609081732.3842341-16-lee@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 9 Jun 2023 15:05:47 -0400
Message-ID: <CADnq5_OVMwV80XbTpdRECa54iDLK8+SGz==KWpWTJN+hs1QAkA@mail.gmail.com>
Subject: Re: [RESEND 15/15] drm/amd/amdgpu/sdma_v6_0: Demote a bunch of
 half-completed function headers
To: Lee Jones <lee@kernel.org>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Stanley Yang <Stanley.Yang@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These have already been fixed up.

Thanks!

Alex

On Fri, Jun 9, 2023 at 4:18=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c:248: warning: Function parameter =
or member 'job' not described in 'sdma_v6_0_ring_emit_ib'
>  drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c:248: warning: Function parameter =
or member 'flags' not described in 'sdma_v6_0_ring_emit_ib'
>  drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c:945: warning: Function parameter =
or member 'timeout' not described in 'sdma_v6_0_ring_test_ib'
>  drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c:1124: warning: Function parameter=
 or member 'ring' not described in 'sdma_v6_0_ring_pad_ib'
>  drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c:1175: warning: Function parameter=
 or member 'vmid' not described in 'sdma_v6_0_ring_emit_vm_flush'
>  drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c:1175: warning: Function parameter=
 or member 'pd_addr' not described in 'sdma_v6_0_ring_emit_vm_flush'
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Stanley Yang <Stanley.Yang@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd=
/amdgpu/sdma_v6_0.c
> index 3b03dda854fdc..8cd7abe74e6c4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> @@ -233,7 +233,7 @@ static void sdma_v6_0_ring_insert_nop(struct amdgpu_r=
ing *ring, uint32_t count)
>                         amdgpu_ring_write(ring, ring->funcs->nop);
>  }
>
> -/**
> +/*
>   * sdma_v6_0_ring_emit_ib - Schedule an IB on the DMA engine
>   *
>   * @ring: amdgpu ring pointer
> @@ -936,7 +936,7 @@ static int sdma_v6_0_ring_test_ring(struct amdgpu_rin=
g *ring)
>         return r;
>  }
>
> -/**
> +/*
>   * sdma_v6_0_ring_test_ib - test an IB on the DMA engine
>   *
>   * @ring: amdgpu_ring structure holding ring information
> @@ -1118,7 +1118,7 @@ static void sdma_v6_0_vm_set_pte_pde(struct amdgpu_=
ib *ib,
>         ib->ptr[ib->length_dw++] =3D count - 1; /* number of entries */
>  }
>
> -/**
> +/*
>   * sdma_v6_0_ring_pad_ib - pad the IB
>   * @ib: indirect buffer to fill with padding
>   * @ring: amdgpu ring pointer
> @@ -1167,7 +1167,7 @@ static void sdma_v6_0_ring_emit_pipeline_sync(struc=
t amdgpu_ring *ring)
>                           SDMA_PKT_POLL_REGMEM_DW5_INTERVAL(4)); /* retry=
 count, poll interval */
>  }
>
> -/**
> +/*
>   * sdma_v6_0_ring_emit_vm_flush - vm flush using sDMA
>   *
>   * @ring: amdgpu_ring pointer
> --
> 2.41.0.162.gfafddb0af9-goog
>
