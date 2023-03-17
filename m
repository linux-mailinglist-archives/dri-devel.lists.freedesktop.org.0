Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F22956BF237
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 21:16:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E18910E28A;
	Fri, 17 Mar 2023 20:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B979E10E28A;
 Fri, 17 Mar 2023 20:16:50 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-17aa62d0a4aso6957268fac.4; 
 Fri, 17 Mar 2023 13:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679084210;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UU4zAnrBSArmTn9XkYtMm4tlOOONjI66zlgaRxaRc2U=;
 b=h+Tg1fUeV3dUAxs/Bi8Ma5z5YKbULT93DkXk4MknB11o0s7K7bUtw7WwiTCGmzLO1N
 9rtPg85SUNu6+lcO2OTXDMyZdS5dM2epOg0pdSBBlejUGWWO403qdX2irSX+8WFDmqzG
 JGg+oyLM7HV8qGS6befsvU6P3GFyAlGjfWPaxg9+V/grsoPbxH5SCNX7Ev59ArGj9VWr
 4H06WZ66Id9hZ7xfDH0cjguCzaZEQcN5hMcR1HA0cxm1Ow/vl6aSXI3cVLrCUQJi3StQ
 SJE9RcSZR0gsqMA9i7j7Qe/a7+BsWrW1bfQpj66JJlHsHeHLkdYAPihwIzXNKEIkql4c
 Zgog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679084210;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UU4zAnrBSArmTn9XkYtMm4tlOOONjI66zlgaRxaRc2U=;
 b=JHc0tJeZWINUU7S/veZfq8xJYf9uGGvjgZwEDjJkaXJMbnrhAG3OPlHluIxFFZJGke
 yUWzrEti1yf6p43WaJIF0gyfTuKRjeUjnNHAOxPJe/lxnNDIC3IICaQ/EIjl1wapZ6HA
 UmCwQW42KDuKvYHHAfPLEtJsbNZBVskiZhQiYL6baueZHu6uQOTyXyVfvK6fdlrSP3+N
 6nW1/4jRKalGktrMrKxTYUQX6vJJAkT/TUQlDxVjYNgvYaIKGsgPq/1IDX96KJTvIPG9
 ojedtiRfsGtnoeibGZGPFCfb5lBQ1/3YVnhKNpgh5dJpP0/Kc8ylOKBjqfpgRvuy4f5p
 X3NA==
X-Gm-Message-State: AO0yUKVa6iidr+7O7W322icVnzkaivXAjMuzY0Oti2Z5eZF2MeeXubxi
 K3AnbgeiBZ3S50F6dbECxSzYVbXeeysq98LhC8M=
X-Google-Smtp-Source: AK7set+hgyDIxODQ1HpKvvctXRdJYouhJjfOaV7GujAUKXtOOfVz7wx7IEd/zYgoBBSWvGbON6Dc74JDF6R5s/Xnr+M=
X-Received: by 2002:a05:6870:1099:b0:17c:29d8:61ee with SMTP id
 25-20020a056870109900b0017c29d861eemr1596oaq.3.1679084208509; Fri, 17 Mar
 2023 13:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-4-lee@kernel.org>
In-Reply-To: <20230317081718.2650744-4-lee@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 Mar 2023 16:16:37 -0400
Message-ID: <CADnq5_PV2O3txzF7a2J4XYM6DWDPNqXWbBdJW8hi9ShS7L8EtA@mail.gmail.com>
Subject: Re: [PATCH 03/37] drm/amd/amdgpu/amdgpu_device: Provide missing
 kerneldoc entry for 'reset_context'
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
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Fri, Mar 17, 2023 at 4:22=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:5152:
>    warning: Function parameter or member 'reset_context' not described in=
 'amdgpu_device_gpu_recover'
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index d4519fbd526f2..ef0b2787796da 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -5145,6 +5145,7 @@ static inline void amdgpu_device_stop_pending_reset=
s(struct amdgpu_device *adev)
>   *
>   * @adev: amdgpu_device pointer
>   * @job: which job trigger hang
> + * @reset_context: amdgpu reset context pointer
>   *
>   * Attempt to reset the GPU if it has hung (all asics).
>   * Attempt to do soft-reset or full-reset and reinitialize Asic
> --
> 2.40.0.rc1.284.g88254d51c5-goog
>
