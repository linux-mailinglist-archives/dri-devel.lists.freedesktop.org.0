Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB90E6BF259
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 21:23:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0856210E402;
	Fri, 17 Mar 2023 20:23:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CC710E402;
 Fri, 17 Mar 2023 20:23:19 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id bd36so4660622oib.12;
 Fri, 17 Mar 2023 13:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679084599;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qPeNQSs2ItWGIsCHdX7Ugj2NVfLobu8XDfoPlATYzgs=;
 b=mDdjHCSVr++s/eQK+Jq0bYlbFXC5oczx+qcfvDkcnhjaGekCwD9TrkxzwggrQLoIf5
 V9fd8pD++Sd0E6aI13d9qZuPoDv/02BUVRB/gr7ZmVCKwHJkrneQm6BOgRf7czeFErxD
 J2uVJkH+DZGyLMnFgHeoK3zKqthYdcTKGbW/shCNgvG+91lhPDgndyA+xuTtYtWjPDFa
 vRK3NwRKQxMFxuirKTRmtVr/HOF4A1uim1Ilr6XogZdeqV5cDC+MKQcMpZnUWtd5QGbi
 dcHY1enstU3fbox9ZXOPndO4FmoKeUvXl0T/+Qin/jKVHclaeEwNjhjKceXa2rhwL3o5
 2D3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679084599;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qPeNQSs2ItWGIsCHdX7Ugj2NVfLobu8XDfoPlATYzgs=;
 b=MfoNd/FbIQa2EeFZfZP/XVS9SNgH6GwuTCn90xQgQYfWq1yCEUBKcrNWqs7G+u4VBw
 BOUqhr4JLKWpsWNKKezvyhkzXr+U1oMxC042pnDe1T0W6mijkc5YXvTAZlVqs9RZ68wT
 Fu46O1wV2KPkjITk0o7MrkPKNSui330GKD+sGW48wV4dSCL2tL1cInKIe7ScwkDSegsD
 znkevu/E1AZE/6Mj+xho+PEa6g/3xX4rFsFFcGnHU3M4/j1YhQKswabLBuQzquQLzt9W
 8kbXuOM4Wd6u12ZtkNC9LLRBqZLoP/2pvEeE+yCRucfyGrDYNx3QHco6ba+3x2p/8atS
 VvVg==
X-Gm-Message-State: AO0yUKVXDHoetXFZP2iaoaFO2WTfxul/F+PMarYwvMpCiFvH3WuyPuTw
 8KjQ0OEdwneFSOFI8Bn8bgGshUSLK5V/uv4+cHUPdXKZ
X-Google-Smtp-Source: AK7set8KBw4gi6U1rhE0sOeJ7AJ+L7QYd4rhRrr5yEZopo/hyaziXVNE56KhBTazVarqxhghVvBYYH+p9AIHxy65DWU=
X-Received: by 2002:a05:6808:6384:b0:386:9c6c:ebc with SMTP id
 ec4-20020a056808638400b003869c6c0ebcmr3713144oib.3.1679084599294; Fri, 17 Mar
 2023 13:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-17-lee@kernel.org>
In-Reply-To: <20230317081718.2650744-17-lee@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 Mar 2023 16:23:07 -0400
Message-ID: <CADnq5_McaONYTi6XOGi3wO-ObXhTZvMJ7Gor+0MM3NcwR1ES2A@mail.gmail.com>
Subject: Re: [PATCH 16/37] drm/amd/amdgpu/ih_v6_0: Repair misspelling and
 provide descriptions for 'ih'
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Fri, Mar 17, 2023 at 4:23=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/ih_v6_0.c:392: warning: Function parameter or=
 member 'ih' not described in 'ih_v6_0_get_wptr'
>  drivers/gpu/drm/amd/amdgpu/ih_v6_0.c:432: warning: Function parameter or=
 member 'ih' not described in 'ih_v6_0_irq_rearm'
>  drivers/gpu/drm/amd/amdgpu/ih_v6_0.c:458: warning: Function parameter or=
 member 'ih' not described in 'ih_v6_0_set_rptr'
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Hawking Zhang <Hawking.Zhang@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/ih_v6_0.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c b/drivers/gpu/drm/amd/a=
mdgpu/ih_v6_0.c
> index 7cd79a3844b24..b02e1cef78a76 100644
> --- a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
> @@ -119,7 +119,7 @@ force_update_wptr_for_self_int(struct amdgpu_device *=
adev,
>   * ih_v6_0_toggle_ring_interrupts - toggle the interrupt ring buffer
>   *
>   * @adev: amdgpu_device pointer
> - * @ih: amdgpu_ih_ring pointet
> + * @ih: amdgpu_ih_ring pointer
>   * @enable: true - enable the interrupts, false - disable the interrupts
>   *
>   * Toggle the interrupt ring buffer (IH_V6_0)
> @@ -381,6 +381,7 @@ static void ih_v6_0_irq_disable(struct amdgpu_device =
*adev)
>   * ih_v6_0_get_wptr - get the IH ring buffer wptr
>   *
>   * @adev: amdgpu_device pointer
> + * @ih: amdgpu_ih_ring pointer
>   *
>   * Get the IH ring buffer wptr from either the register
>   * or the writeback memory buffer.  Also check for
> @@ -425,6 +426,7 @@ static u32 ih_v6_0_get_wptr(struct amdgpu_device *ade=
v,
>   * ih_v6_0_irq_rearm - rearm IRQ if lost
>   *
>   * @adev: amdgpu_device pointer
> + * @ih: amdgpu_ih_ring pointer
>   *
>   */
>  static void ih_v6_0_irq_rearm(struct amdgpu_device *adev,
> @@ -450,6 +452,7 @@ static void ih_v6_0_irq_rearm(struct amdgpu_device *a=
dev,
>   * ih_v6_0_set_rptr - set the IH ring buffer rptr
>   *
>   * @adev: amdgpu_device pointer
> + * @ih: amdgpu_ih_ring pointer
>   *
>   * Set the IH ring buffer rptr.
>   */
> --
> 2.40.0.rc1.284.g88254d51c5-goog
>
