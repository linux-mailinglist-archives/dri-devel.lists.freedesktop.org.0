Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9718B6F36BE
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 21:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FAD10E2FE;
	Mon,  1 May 2023 19:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D888610E274;
 Mon,  1 May 2023 19:27:13 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-38e0a003abdso1868710b6e.3; 
 Mon, 01 May 2023 12:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682969233; x=1685561233;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LhcRiR9DgObJ3GdLW40F4CvWyOT47X9xzO/pYnogYMs=;
 b=F+ArsapDPq5RZ5zvaLU8u/e8hoBxlXH+1e5bvV+7sRKgY2lt+OVswEqd+6+q3vwcMT
 DD1dr/M0LUiTbZ/SXXSrAfWbpT8S9AZhldRaVMGjtnn4oGZxUhEJhhGeIu+2NyIWeibI
 HkX42Ip6LIIO+FwTNPTR8DMs8gndfdHTmCsvtqGCuBO2EiwdBvqqF3K7n6w3/33pi8b2
 PHGud4U1BsLOO772C8Cdr1nnGSzQG13uQOmHeoQCDlsTSImNzoNXicj6JlLbrNm2LR4Y
 N4KzensikeGi+QLHXRQbduF33qAu/HgypysHJLG32i4L/AG4ia24T6JZPAn7u5SZ5k67
 ls+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682969233; x=1685561233;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LhcRiR9DgObJ3GdLW40F4CvWyOT47X9xzO/pYnogYMs=;
 b=CJkzOAbE9IbabglokIsjr+S3FO119hwDOP0ditRCQCYLUHUI/b0i9ETWPaboBA62X+
 IrMNjekycCl0AQLjI3KV/o8d+A8oQKKhtbi7SUjdQP14t3AGmH0zBuV+HLB+bp6O7ppP
 ogoGizmdQ428MFladtTLKHhz0h3i9tT0DUAbJ6dd1LVkJZ4GWWaLYEP6Fl5UJ0QhIUPa
 sgZL7QbVG6h0NMkjkMU/mHNr2iZrjlMv1MZ2UPymOg/qsbas5yQHP04+hh99Zx++PFiX
 qrdb/Q0T8ScwYtHQjwdaYvGA3UpplQ17S1S4ZDjAN1fSgfISravCHKUhokhq3vTzDiu0
 b9QA==
X-Gm-Message-State: AC+VfDzNkagDcNSwsApWnkeL7EO1U8af78/96kz96F66AD1oRBsZkhX5
 vBw652pyVL3Cc+C1qJgQGSTqMHpr/I3vXckH4rk=
X-Google-Smtp-Source: ACHHUZ6xi1EGGZS+pR4jOWXxsMTWfZUKBLyQolBoK28Ao042gAqUYxDmtKJIRBIDUGtitG6OtXEsGEdErhhPmk4Ixfo=
X-Received: by 2002:a05:6808:98c:b0:38b:e6:3d95 with SMTP id
 a12-20020a056808098c00b0038b00e63d95mr6718432oic.40.1682969232681; Mon, 01
 May 2023 12:27:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230501185747.33519-1-andrealmeid@igalia.com>
 <20230501185747.33519-2-andrealmeid@igalia.com>
In-Reply-To: <20230501185747.33519-2-andrealmeid@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 1 May 2023 15:27:01 -0400
Message-ID: <CADnq5_OBf9W-VikF-Psd87YXxB9=rE5qCnM8FfE13RKkR7Y51A@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] drm/amdgpu: Add interface to dump guilty IB on
 GPU hang
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 michel.daenzer@mailbox.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 1, 2023 at 2:58=E2=80=AFPM Andr=C3=A9 Almeida <andrealmeid@igal=
ia.com> wrote:
>
> Add an interface to point out to userspace the guilty indirect buffer
> when a GPU reset happens, so the usermode driver can dump just the right
> IB for debug investigation.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h      |  3 +++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  3 +++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c  |  7 ++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h |  1 +
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c   | 29 ++++++++++++++++++++++++
>  include/uapi/drm/amdgpu_drm.h            |  7 ++++++
>  7 files changed, 52 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/am=
dgpu/amdgpu.h
> index 02b827785e39..89345e49ba20 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1050,6 +1050,9 @@ struct amdgpu_device {
>
>         bool                            job_hang;
>         bool                            dc_enabled;
> +
> +       /* TODO: Maybe this should be a per-ring info */
> +       struct drm_amdgpu_info_guilty_app       info;
>  };
>
>  static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index b400d598b75a..818bcd2c9b5d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -110,9 +110,10 @@
>   *   3.52.0 - Add AMDGPU_IDS_FLAGS_CONFORMANT_TRUNC_COORD, add device_in=
fo fields:
>   *            tcp_cache_size, num_sqc_per_wgp, sqc_data_cache_size, sqc_=
inst_cache_size,
>   *            gl1c_cache_size, gl2c_cache_size, mall_size, enabled_rb_pi=
pes_mask_hi
> + *   3.53.0 - Add AMDGPU_INFO_GUILTY_APP IOCTL
>   */
>  #define KMS_DRIVER_MAJOR       3
> -#define KMS_DRIVER_MINOR       52
> +#define KMS_DRIVER_MINOR       53
>  #define KMS_DRIVER_PATCHLEVEL  0
>
>  unsigned int amdgpu_vram_limit =3D UINT_MAX;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_job.c
> index c3d9d75143f4..a15162f8c812 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -48,6 +48,9 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(stru=
ct drm_sched_job *s_job)
>                 return DRM_GPU_SCHED_STAT_ENODEV;
>         }
>
> +       if (ring->funcs->get_reset_data)
> +               ring->funcs->get_reset_data(ring, job);
> +
>         memset(&ti, 0, sizeof(struct amdgpu_task_info));
>         adev->job_hang =3D true;
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_kms.c
> index a5bae7eb993a..dc6cc94b6847 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -1149,6 +1149,13 @@ int amdgpu_info_ioctl(struct drm_device *dev, void=
 *data, struct drm_file *filp)
>                 return copy_to_user(out, max_ibs,
>                                     min((size_t)size, sizeof(max_ibs))) ?=
 -EFAULT : 0;
>         }
> +       case AMDGPU_INFO_GUILTY_APP: {
> +               struct drm_amdgpu_info_guilty_app info;
> +               info.ib_addr =3D adev->info.ib_addr;
> +               info.vmid =3D adev->info.vmid;
> +               info.ib_size =3D adev->info.ib_size;
> +               return copy_to_user(out, &info, min((size_t)size, sizeof(=
info))) ? -EFAULT : 0;
> +       }
>         default:
>                 DRM_DEBUG_KMS("Invalid request %d\n", info->query);
>                 return -EINVAL;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_ring.h
> index 8eca6532ed19..0993c7ec74c6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> @@ -227,6 +227,7 @@ struct amdgpu_ring_funcs {
>         int (*preempt_ib)(struct amdgpu_ring *ring);
>         void (*emit_mem_sync)(struct amdgpu_ring *ring);
>         void (*emit_wave_limit)(struct amdgpu_ring *ring, bool enable);
> +       void (*get_reset_data)(struct amdgpu_ring *ring, struct amdgpu_jo=
b *job);
>  };
>
>  struct amdgpu_ring {
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd=
/amdgpu/gfx_v10_0.c
> index 8bd07ff59671..12763ff8c83c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -9226,6 +9226,34 @@ static void gfx_v10_0_emit_mem_sync(struct amdgpu_=
ring *ring)
>         amdgpu_ring_write(ring, gcr_cntl); /* GCR_CNTL */
>  }
>
> +static void gfx_v10_0_get_reset_data(struct amdgpu_ring *ring,
> +                                    struct amdgpu_job *job)
> +{
> +       int i;
> +
> +       struct amdgpu_device *adev =3D ring->adev;
> +       u64 ib_addr;
> +       u32 ib_addr_lo;
> +
> +       ib_addr =3D RREG32_SOC15(GC, 0, mmCP_IB1_BASE_HI);
> +       ib_addr =3D ib_addr << 32;
> +       ib_addr_lo =3D RREG32_SOC15(GC, 0, mmCP_IB1_BASE_LO);
> +       ib_addr +=3D ib_addr_lo;

You'll need to disable gfxoff when you access these otherwise you can
hang the GPU if you read them when gfx is off.  See
amdgpu_gfx_off_ctrl().

Alex

> +
> +       adev->info.ib_addr =3D ib_addr;
> +       adev->info.vmid =3D job->vmid;
> +
> +       for (i =3D 0; i < job->num_ibs; i++) {
> +               if (lower_32_bits(job->ibs[i].gpu_addr) =3D=3D ib_addr_lo=
) {
> +                       adev->info.ib_size =3D job->ibs[i].length_dw;
> +                       break;
> +               }
> +       }
> +
> +       DRM_INFO("Guilty app info: IB addr 0x%llx IB size 0x%x VM id %u",
> +                 adev->info.ib_addr, adev->info.ib_size, adev->info.vmid=
);
> +}
> +
>  static const struct amd_ip_funcs gfx_v10_0_ip_funcs =3D {
>         .name =3D "gfx_v10_0",
>         .early_init =3D gfx_v10_0_early_init,
> @@ -9297,6 +9325,7 @@ static const struct amdgpu_ring_funcs gfx_v10_0_rin=
g_funcs_gfx =3D {
>         .emit_reg_write_reg_wait =3D gfx_v10_0_ring_emit_reg_write_reg_wa=
it,
>         .soft_recovery =3D gfx_v10_0_ring_soft_recovery,
>         .emit_mem_sync =3D gfx_v10_0_emit_mem_sync,
> +       .get_reset_data =3D gfx_v10_0_get_reset_data,
>  };
>
>  static const struct amdgpu_ring_funcs gfx_v10_0_ring_funcs_compute =3D {
> diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.=
h
> index 6981e59a9401..4136d04bfb57 100644
> --- a/include/uapi/drm/amdgpu_drm.h
> +++ b/include/uapi/drm/amdgpu_drm.h
> @@ -878,6 +878,7 @@ struct drm_amdgpu_cs_chunk_data {
>         #define AMDGPU_INFO_VIDEO_CAPS_ENCODE           1
>  /* Query the max number of IBs per gang per submission */
>  #define AMDGPU_INFO_MAX_IBS                    0x22
> +#define AMDGPU_INFO_GUILTY_APP                 0x23
>
>  #define AMDGPU_INFO_MMR_SE_INDEX_SHIFT 0
>  #define AMDGPU_INFO_MMR_SE_INDEX_MASK  0xff
> @@ -1195,6 +1196,12 @@ struct drm_amdgpu_info_video_caps {
>         struct drm_amdgpu_info_video_codec_info codec_info[AMDGPU_INFO_VI=
DEO_CAPS_CODEC_IDX_COUNT];
>  };
>
> +struct drm_amdgpu_info_guilty_app {
> +       __u64 ib_addr;
> +       __u32 ib_size;
> +       __u32 vmid;
> +};
> +
>  /*
>   * Supported GPU families
>   */
> --
> 2.40.1
>
