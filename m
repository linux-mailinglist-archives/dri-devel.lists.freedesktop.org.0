Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA046BF257
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 21:22:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40D010E401;
	Fri, 17 Mar 2023 20:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E47F10E401;
 Fri, 17 Mar 2023 20:22:28 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id bk32so4666093oib.10;
 Fri, 17 Mar 2023 13:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679084547;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vu9FEPDbzyGLlECMc2aGYaFPIGLvzNJrO43JlAS13RQ=;
 b=ekA+YU0yAqC1U1gReZKCODIm18NQaGslCP4mC+ru3AHqIYEiCYlKMKFja6SsLFZxT3
 fh3lb+8+qdx4ik8gUCYlt+SOkuvVOHYBUCjGWbMW4jYmsYNCPc3CbQPdhyCGMX0m0/3h
 P2nxpgZYnCSlc5ymMZWIB6EX3ZbryqlkOaSoE+p3DRddHNJ8FNKunJ5vTn5fska/Z05M
 oa9J6P6GtJ1HQ/+8iWt62GY/re25iUnIYPHbj4u02cWqxowc6RC3r05lA5/6b6Ked8bs
 HgbQTua517CS8hDI14H75nUk0BuShCbeySFOpbKcyU+NhMlQSH3TRHitWCIuJerbxmqk
 ca/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679084547;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vu9FEPDbzyGLlECMc2aGYaFPIGLvzNJrO43JlAS13RQ=;
 b=I0ykTegyM+gowEUu385p61W6S/pTg5ca18QlvTgzaAiDk3YH8MHls37wB4Z4hXglXR
 CdG9SjDayxFZr2UBN+95aKPN3y0kXNSqKP4whZylmoPu0Z04ADyhHCjtOH0v0UI13nNq
 VbqOdn9tv+qYvp8nBnGkijlt8ho/0mntyqR7rPK5tFbO2DUGpgUIuRplvh9a3QRDWzCP
 T8JwvDU9DWSnuY2TcuBgg4+kA5JuDzXKERSpgvt+FMiDEDfMieFBpI5sxN6Nj3oOFJCI
 4uSfniEwSWXMXUQfGDz5KWLwr6gcR8WgEquDAtxMNbBNQuPKY+rmUx/pt9GgLHUeRfcj
 Oxag==
X-Gm-Message-State: AO0yUKVTRt8n+qAST2qncZCFQ00rpbHJRZu2wWgs4gP8jNkm/DUzbjT9
 tNSj7u7lpUn3nCgJooqnCgR3uxJDyC7+ad+GfyE=
X-Google-Smtp-Source: AK7set+8FK0AR04WJhBPP7BsOsQys7+Jy2T4vWiqBjFA/tCxMnTIC2HZ6Z88h6kfzBcIZkHHy5KnhP4BFHmodIHRdu0=
X-Received: by 2002:a05:6808:2b0a:b0:384:893:a924 with SMTP id
 fe10-20020a0568082b0a00b003840893a924mr3612499oib.3.1679084547380; Fri, 17
 Mar 2023 13:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-16-lee@kernel.org>
In-Reply-To: <20230317081718.2650744-16-lee@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 Mar 2023 16:22:15 -0400
Message-ID: <CADnq5_OF=Nkx6h2F-qqBajWcqn2AupHUu2GgJnx_NzuE3t0swg@mail.gmail.com>
Subject: Re: [PATCH 15/37] drm/amd/amdgpu/gmc_v11_0: Provide a few missing
 param descriptions relating to hubs and flushes
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
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Mar 17, 2023 at 4:23=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c:282: warning: Function parameter =
or member 'vmhub' not described in 'gmc_v11_0_flush_gpu_tlb'
>  drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c:282: warning: Function parameter =
or member 'flush_type' not described in 'gmc_v11_0_flush_gpu_tlb'
>  drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c:322: warning: Function parameter =
or member 'flush_type' not described in 'gmc_v11_0_flush_gpu_tlb_pasid'
>  drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c:322: warning: Function parameter =
or member 'all_hub' not described in 'gmc_v11_0_flush_gpu_tlb_pasid'
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c b/drivers/gpu/drm/amd=
/amdgpu/gmc_v11_0.c
> index fad199ed15f38..9f4f28192c601 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
> @@ -274,6 +274,8 @@ static void gmc_v11_0_flush_vm_hub(struct amdgpu_devi=
ce *adev, uint32_t vmid,
>   *
>   * @adev: amdgpu_device pointer
>   * @vmid: vm instance to flush
> + * @vmhub: which hub to flush
> + * @flush_type: the flush type
>   *
>   * Flush the TLB for the requested page table.
>   */
> @@ -313,6 +315,8 @@ static void gmc_v11_0_flush_gpu_tlb(struct amdgpu_dev=
ice *adev, uint32_t vmid,
>   *
>   * @adev: amdgpu_device pointer
>   * @pasid: pasid to be flush
> + * @flush_type: the flush type
> + * @all_hub: flush all hubs
>   *
>   * Flush the TLB for the requested pasid.
>   */
> --
> 2.40.0.rc1.284.g88254d51c5-goog
>
