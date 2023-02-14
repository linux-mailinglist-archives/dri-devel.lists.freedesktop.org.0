Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FB7696C01
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 18:49:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C5510E93F;
	Tue, 14 Feb 2023 17:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9EA10E0EC;
 Tue, 14 Feb 2023 17:49:37 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id 20so13615355oix.5;
 Tue, 14 Feb 2023 09:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hEDXuxAg9TT0Fx4vRU/ZLPwFT25XXPHo5JM1/qKHsEs=;
 b=Z4P57xz36EWgF96rWT156S0MsUf9MTglRoVk6p1tY9Gz8fl5TtvsQE1UwmfxBm8opD
 P47mB8opeUQlIi4EP5Lj3u2t0oG/rP/MgoTFhh6EgfAjMeDdgV1NafOEKLRF2vxQERs2
 i3sq0/KJymTwnxQ2BluVrL69kissmF3wuf4lvw7J0xyxwCo3iWk55Ylbv0Bck5qlBF0C
 IDuzbMANTo0IZwU79h30p315Z57hhX+dDE5MDf7r3iOVLi3l6n1GcK9cd4jo/vb0e23Q
 Zx+wMEZ4n9zuMgvu7UHDf+CHlizmOW+1feDlZ+UES/83tQ8GwGUDo7T811Kw4Zd3upgA
 cqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hEDXuxAg9TT0Fx4vRU/ZLPwFT25XXPHo5JM1/qKHsEs=;
 b=3fojfDzTWBaASQpoivj+sGGxkmc1JZLJ/kkIMhB1ZwzN+uuCbR3KMKiLHePAr8ryrQ
 nUQNPKNre+5i2eOWGHPEbyIRzwMBYAQd0piKumjHy7VPI9FBmdwC8cpBCx57d/RwMP6V
 Jmut6dsHv9lzNnz3NHrLhLe545a37UyQGYXhYy6USuMV7CgvD0CTmZzXSn2F8kOMygpT
 ABxOv24IihRSOB7x06UPEBZR6adwxWyed33C57Wg0Y3uCcYeyb3f/XTEaf1lolcXzzOU
 mUzzpYjRpm0Zcg5y51y2zfkeaq14O7saWLe+OrTCbh2EdrNEG47X5EGv/gg33ihziLiS
 hSnw==
X-Gm-Message-State: AO0yUKW0TyZ0CxGeKs7wrUTzkpOE7iubRwmv/8huAHius/+vurKvhpVJ
 3uWWXqijL7vo4wyerrjwtIbpD+Cq370jXdFPjNM=
X-Google-Smtp-Source: AK7set8S8khpMYdDUuJLhjY+6NI0z6WaO1Y454c9uh8sYY9oxPlyvOePYg+4ROA0EVF1BGXeV7zxn767uty18HaoYms=
X-Received: by 2002:a05:6808:a10:b0:35b:d93f:cbc4 with SMTP id
 n16-20020a0568080a1000b0035bd93fcbc4mr25550oij.96.1676396977252; Tue, 14 Feb
 2023 09:49:37 -0800 (PST)
MIME-Version: 1.0
References: <20230213204923.111948-1-arthurgrillo@riseup.net>
 <20230213204923.111948-6-arthurgrillo@riseup.net>
In-Reply-To: <20230213204923.111948-6-arthurgrillo@riseup.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 14 Feb 2023 12:49:25 -0500
Message-ID: <CADnq5_PobFJwP3JmZnLXRkLXaOUHa7ukxRSBO7YNaR3wW28Whg@mail.gmail.com>
Subject: Re: [PATCH 05/10] drm/amd/display: Fix excess arguments on kernel-doc
To: Arthur Grillo <arthurgrillo@riseup.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: sunpeng.li@amd.com, tales.aparecida@gmail.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, andrealmeid@riseup.net, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Feb 13, 2023 at 3:50 PM Arthur Grillo <arthurgrillo@riseup.net> wrote:
>
> Remove arguments present on kernel-doc that are not present on the
> function declaration and add the new ones if present.
>
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c            | 15 +++++++--------
>  drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c      |  2 +-
>  .../gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c |  2 +-
>  3 files changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> index 3d36329be384..40e6b22daa22 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> @@ -273,8 +273,6 @@ static void sdma_v6_0_ring_emit_ib(struct amdgpu_ring *ring,
>   * sdma_v6_0_ring_emit_mem_sync - flush the IB by graphics cache rinse
>   *
>   * @ring: amdgpu ring pointer
> - * @job: job to retrieve vmid from
> - * @ib: IB object to schedule
>   *
>   * flush the IB by graphics cache rinse.
>   */
> @@ -326,7 +324,9 @@ static void sdma_v6_0_ring_emit_hdp_flush(struct amdgpu_ring *ring)
>   * sdma_v6_0_ring_emit_fence - emit a fence on the DMA ring
>   *
>   * @ring: amdgpu ring pointer
> - * @fence: amdgpu fence object
> + * @addr: address
> + * @seq: fence seq number
> + * @flags: fence flags
>   *
>   * Add a DMA fence packet to the ring to write
>   * the fence seq number and DMA trap packet to generate
> @@ -1060,10 +1060,9 @@ static void sdma_v6_0_vm_copy_pte(struct amdgpu_ib *ib,
>   *
>   * @ib: indirect buffer to fill with commands
>   * @pe: addr of the page entry
> - * @addr: dst addr to write into pe
> + * @value: dst addr to write into pe
>   * @count: number of page entries to update
>   * @incr: increase next addr by incr bytes
> - * @flags: access flags
>   *
>   * Update PTEs by writing them manually using sDMA.
>   */
> @@ -1167,7 +1166,6 @@ static void sdma_v6_0_ring_emit_pipeline_sync(struct amdgpu_ring *ring)
>   * sdma_v6_0_ring_emit_vm_flush - vm flush using sDMA
>   *
>   * @ring: amdgpu_ring pointer
> - * @vm: amdgpu_vm pointer
>   *
>   * Update the page table base and flush the VM TLB
>   * using sDMA.
> @@ -1591,10 +1589,11 @@ static void sdma_v6_0_set_irq_funcs(struct amdgpu_device *adev)
>  /**
>   * sdma_v6_0_emit_copy_buffer - copy buffer using the sDMA engine
>   *
> - * @ring: amdgpu_ring structure holding ring information
> + * @ib: indirect buffer to fill with commands
>   * @src_offset: src GPU address
>   * @dst_offset: dst GPU address
>   * @byte_count: number of bytes to xfer
> + * @tmz: if a secure copy should be used
>   *
>   * Copy GPU buffers using the DMA engine.
>   * Used by the amdgpu ttm implementation to move pages if
> @@ -1620,7 +1619,7 @@ static void sdma_v6_0_emit_copy_buffer(struct amdgpu_ib *ib,
>  /**
>   * sdma_v6_0_emit_fill_buffer - fill buffer using the sDMA engine
>   *
> - * @ring: amdgpu_ring structure holding ring information
> + * @ib: indirect buffer to fill
>   * @src_data: value to write to buffer
>   * @dst_offset: dst GPU address
>   * @byte_count: number of bytes to xfer
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
> index 6ccf477d1c4d..c2092775ca88 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
> +++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
> @@ -698,7 +698,7 @@ static void populate_subvp_cmd_pipe_info(struct dc *dc,
>   *
>   * @dc: [in] current dc state
>   * @context: [in] new dc state
> - * @cmd: [in] DMUB cmd to be populated with SubVP info
> + * @enable: [in] if true enables the pipes population
>   *
>   * This function loops through each pipe and populates the DMUB SubVP CMD info
>   * based on the pipe (e.g. SubVP, VBLANK).
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c
> index f607a0e28f14..f62368da875d 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c
> @@ -581,7 +581,7 @@ static void dpp1_dscl_set_manual_ratio_init(
>   * dpp1_dscl_set_recout - Set the first pixel of RECOUT in the OTG active area
>   *
>   * @dpp: DPP data struct
> - * @recount: Rectangle information
> + * @recout: Rectangle information
>   *
>   * This function sets the MPC RECOUT_START and RECOUT_SIZE registers based on
>   * the values specified in the recount parameter.
> --
> 2.39.1
>
