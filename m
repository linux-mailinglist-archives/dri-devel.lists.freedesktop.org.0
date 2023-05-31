Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AED971892D
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 20:15:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E5110E1E1;
	Wed, 31 May 2023 18:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47B589131;
 Wed, 31 May 2023 18:14:57 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-19f8af9aa34so52509fac.1; 
 Wed, 31 May 2023 11:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685556896; x=1688148896;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TOjgEWvwqOSLkRLIiuS2NJw+MXNXGqiosejLTNJu5vU=;
 b=soPHOBB4jHzHFfwz3KJjM09ZP+miNz/BrB86CXB2+gGE11VZtMaxV9Tb345meFmKMH
 EM40FDkASZl2Z0I55kF61yV4mSC3ghEZCIlChW3ufqLrxl2lgdS2JJD5x0UjkeI6V58M
 Q7+6+Vt/KH1Uu5Xse4gMog9fjLmikAAsuJNKvABcMBWvWVLn9es5LS+679+uj16LRppj
 couDvL5DG8+jZ6IWCQfeXOx+IVRkVqEabPuVgPJ7qmPiDnO7GnxU/krl6MsqVp88uHwn
 R3BxPk9afnuz4WqQJp4Y3mtM2EN86vqwdB0e7cXRXjEz25X4AusUoZ8+CG7BuxBZAQPu
 4sDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685556896; x=1688148896;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TOjgEWvwqOSLkRLIiuS2NJw+MXNXGqiosejLTNJu5vU=;
 b=iSvHF3HtXAU/49PeUZnS57+0KaWKM0oAw3LjaIICmkeebs4cTJgQiwQzTOeq2/q7XP
 EqVF5Zm9RbeQYOtV0f9g8iLKXpytMJtWgwtJOwts4zdEnSjt0bladjA7J04MusSdR3ug
 BGTVUV0vfNeoXTkANqdrcWmF0DEGDB0P/x1kAQSFid+quHKoYS23is8lARj+h5HPTZ3k
 NLffFeUPjCcSdblHWpL2qceQTuo97NCKgdwhenQI6pBKxhWfsJaVIiNySpA8I2qVcA3P
 AIYSd+e+bEBjfAlqJyHTsO3CyWV+B+Z8vfhAFKtnvJRu8G3ZcBSmGA+ws5XiUuQO4pTs
 oxUg==
X-Gm-Message-State: AC+VfDw4ZMyM6fD3E/RcxVKYZ0mn53vJhbZUGNPU79fTZ3jhBQp4p6xf
 RU6opyoBwiU02dYNA0/md6fLFJmhsHiMP8VnQzWnWeji
X-Google-Smtp-Source: ACHHUZ5WSyOoDiT+c2aOYYnLpXcn4q13TNvlNf+Fs6XlyYZaoQmmGpkXlB/HTVi37i6xXCxIWEVgvXQEhAZ+p+8cagI=
X-Received: by 2002:a05:6870:a8b0:b0:19f:5764:dfb8 with SMTP id
 eb48-20020a056870a8b000b0019f5764dfb8mr4285085oab.3.1685556895472; Wed, 31
 May 2023 11:14:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230525172745.702700-1-jonathan.kim@amd.com>
 <31f9f782-3d68-0fd6-1a68-9ca0b2e730a9@amd.com>
In-Reply-To: <31f9f782-3d68-0fd6-1a68-9ca0b2e730a9@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 31 May 2023 14:14:44 -0400
Message-ID: <CADnq5_PV8sxjrUU4JaHxdHpO5ZKqjxoTcns2CL3_kUw-=v8OeA@mail.gmail.com>
Subject: Re: [PATCH 01/33] drm/amdkfd: add debug and runtime enable interface
To: Felix Kuehling <felix.kuehling@amd.com>
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
Cc: Jinhuieric.Huang@amd.com, Jonathan Kim <jonathan.kim@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 30, 2023 at 3:17=E2=80=AFPM Felix Kuehling <felix.kuehling@amd.=
com> wrote:
>
> Am 2023-05-25 um 13:27 schrieb Jonathan Kim:
> > Introduce the GPU debug operations interface.
> >
> > For ROCm-GDB to extend the GNU Debugger's ability to inspect the AMD GP=
U
> > instruction set, provide the necessary interface to allow the debugger
> > to HW debug-mode set and query exceptions per HSA queue, process or
> > device.
> >
> > The runtime_enable interface coordinates exception handling with the
> > HSA runtime.
> >
> > Usage is available in the kern docs at uapi/linux/kfd_ioctl.h.
> >
> > v2: add num_xcc to device snapshot entry.
> > fixup missing EC_QUEUE_PACKET_RESERVED mask.
> >
> > Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
>
> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>

Can you provide a link to the userspace which uses this?

Alex

>
>
> > ---
> >   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  48 ++
> >   include/uapi/linux/kfd_ioctl.h           | 668 ++++++++++++++++++++++=
-
> >   2 files changed, 715 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm=
/amd/amdkfd/kfd_chardev.c
> > index 88fe1f31739d..f4b50b74818e 100644
> > --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> > @@ -2729,6 +2729,48 @@ static int kfd_ioctl_criu(struct file *filep, st=
ruct kfd_process *p, void *data)
> >       return ret;
> >   }
> >
> > +static int kfd_ioctl_runtime_enable(struct file *filep, struct kfd_pro=
cess *p, void *data)
> > +{
> > +     return 0;
> > +}
> > +
> > +static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_pro=
cess *p, void *data)
> > +{
> > +     struct kfd_ioctl_dbg_trap_args *args =3D data;
> > +     int r =3D 0;
> > +
> > +     if (sched_policy =3D=3D KFD_SCHED_POLICY_NO_HWS) {
> > +             pr_err("Debugging does not support sched_policy %i", sche=
d_policy);
> > +             return -EINVAL;
> > +     }
> > +
> > +     switch (args->op) {
> > +     case KFD_IOC_DBG_TRAP_ENABLE:
> > +     case KFD_IOC_DBG_TRAP_DISABLE:
> > +     case KFD_IOC_DBG_TRAP_SEND_RUNTIME_EVENT:
> > +     case KFD_IOC_DBG_TRAP_SET_EXCEPTIONS_ENABLED:
> > +     case KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_OVERRIDE:
> > +     case KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_MODE:
> > +     case KFD_IOC_DBG_TRAP_SUSPEND_QUEUES:
> > +     case KFD_IOC_DBG_TRAP_RESUME_QUEUES:
> > +     case KFD_IOC_DBG_TRAP_SET_NODE_ADDRESS_WATCH:
> > +     case KFD_IOC_DBG_TRAP_CLEAR_NODE_ADDRESS_WATCH:
> > +     case KFD_IOC_DBG_TRAP_SET_FLAGS:
> > +     case KFD_IOC_DBG_TRAP_QUERY_DEBUG_EVENT:
> > +     case KFD_IOC_DBG_TRAP_QUERY_EXCEPTION_INFO:
> > +     case KFD_IOC_DBG_TRAP_GET_QUEUE_SNAPSHOT:
> > +     case KFD_IOC_DBG_TRAP_GET_DEVICE_SNAPSHOT:
> > +             pr_warn("Debugging not supported yet\n");
> > +             r =3D -EACCES;
> > +             break;
> > +     default:
> > +             pr_err("Invalid option: %i\n", args->op);
> > +             r =3D -EINVAL;
> > +     }
> > +
> > +     return r;
> > +}
> > +
> >   #define AMDKFD_IOCTL_DEF(ioctl, _func, _flags) \
> >       [_IOC_NR(ioctl)] =3D {.cmd =3D ioctl, .func =3D _func, .flags =3D=
 _flags, \
> >                           .cmd_drv =3D 0, .name =3D #ioctl}
> > @@ -2841,6 +2883,12 @@ static const struct amdkfd_ioctl_desc amdkfd_ioc=
tls[] =3D {
> >
> >       AMDKFD_IOCTL_DEF(AMDKFD_IOC_EXPORT_DMABUF,
> >                               kfd_ioctl_export_dmabuf, 0),
> > +
> > +     AMDKFD_IOCTL_DEF(AMDKFD_IOC_RUNTIME_ENABLE,
> > +                     kfd_ioctl_runtime_enable, 0),
> > +
> > +     AMDKFD_IOCTL_DEF(AMDKFD_IOC_DBG_TRAP,
> > +                     kfd_ioctl_set_debug_trap, 0),
> >   };
> >
> >   #define AMDKFD_CORE_IOCTL_COUNT     ARRAY_SIZE(amdkfd_ioctls)
> > diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_io=
ctl.h
> > index 2a9671e1ddb5..dfe745ee427e 100644
> > --- a/include/uapi/linux/kfd_ioctl.h
> > +++ b/include/uapi/linux/kfd_ioctl.h
> > @@ -110,6 +110,32 @@ struct kfd_ioctl_get_available_memory_args {
> >       __u32 pad;
> >   };
> >
> > +struct kfd_dbg_device_info_entry {
> > +     __u64 exception_status;
> > +     __u64 lds_base;
> > +     __u64 lds_limit;
> > +     __u64 scratch_base;
> > +     __u64 scratch_limit;
> > +     __u64 gpuvm_base;
> > +     __u64 gpuvm_limit;
> > +     __u32 gpu_id;
> > +     __u32 location_id;
> > +     __u32 vendor_id;
> > +     __u32 device_id;
> > +     __u32 revision_id;
> > +     __u32 subsystem_vendor_id;
> > +     __u32 subsystem_device_id;
> > +     __u32 fw_version;
> > +     __u32 gfx_target_version;
> > +     __u32 simd_count;
> > +     __u32 max_waves_per_simd;
> > +     __u32 array_count;
> > +     __u32 simd_arrays_per_engine;
> > +     __u32 num_xcc;
> > +     __u32 capability;
> > +     __u32 debug_prop;
> > +};
> > +
> >   /* For kfd_ioctl_set_memory_policy_args.default_policy and alternate_=
policy */
> >   #define KFD_IOC_CACHE_POLICY_COHERENT 0
> >   #define KFD_IOC_CACHE_POLICY_NONCOHERENT 1
> > @@ -775,6 +801,640 @@ struct kfd_ioctl_set_xnack_mode_args {
> >       __s32 xnack_enabled;
> >   };
> >
> > +/* Wave launch override modes */
> > +enum kfd_dbg_trap_override_mode {
> > +     KFD_DBG_TRAP_OVERRIDE_OR =3D 0,
> > +     KFD_DBG_TRAP_OVERRIDE_REPLACE =3D 1
> > +};
> > +
> > +/* Wave launch overrides */
> > +enum kfd_dbg_trap_mask {
> > +     KFD_DBG_TRAP_MASK_FP_INVALID =3D 1,
> > +     KFD_DBG_TRAP_MASK_FP_INPUT_DENORMAL =3D 2,
> > +     KFD_DBG_TRAP_MASK_FP_DIVIDE_BY_ZERO =3D 4,
> > +     KFD_DBG_TRAP_MASK_FP_OVERFLOW =3D 8,
> > +     KFD_DBG_TRAP_MASK_FP_UNDERFLOW =3D 16,
> > +     KFD_DBG_TRAP_MASK_FP_INEXACT =3D 32,
> > +     KFD_DBG_TRAP_MASK_INT_DIVIDE_BY_ZERO =3D 64,
> > +     KFD_DBG_TRAP_MASK_DBG_ADDRESS_WATCH =3D 128,
> > +     KFD_DBG_TRAP_MASK_DBG_MEMORY_VIOLATION =3D 256,
> > +     KFD_DBG_TRAP_MASK_TRAP_ON_WAVE_START =3D (1 << 30),
> > +     KFD_DBG_TRAP_MASK_TRAP_ON_WAVE_END =3D (1 << 31)
> > +};
> > +
> > +/* Wave launch modes */
> > +enum kfd_dbg_trap_wave_launch_mode {
> > +     KFD_DBG_TRAP_WAVE_LAUNCH_MODE_NORMAL =3D 0,
> > +     KFD_DBG_TRAP_WAVE_LAUNCH_MODE_HALT =3D 1,
> > +     KFD_DBG_TRAP_WAVE_LAUNCH_MODE_DEBUG =3D 3
> > +};
> > +
> > +/* Address watch modes */
> > +enum kfd_dbg_trap_address_watch_mode {
> > +     KFD_DBG_TRAP_ADDRESS_WATCH_MODE_READ =3D 0,
> > +     KFD_DBG_TRAP_ADDRESS_WATCH_MODE_NONREAD =3D 1,
> > +     KFD_DBG_TRAP_ADDRESS_WATCH_MODE_ATOMIC =3D 2,
> > +     KFD_DBG_TRAP_ADDRESS_WATCH_MODE_ALL =3D 3
> > +};
> > +
> > +/* Additional wave settings */
> > +enum kfd_dbg_trap_flags {
> > +     KFD_DBG_TRAP_FLAG_SINGLE_MEM_OP =3D 1,
> > +};
> > +
> > +/* Trap exceptions */
> > +enum kfd_dbg_trap_exception_code {
> > +     EC_NONE =3D 0,
> > +     /* per queue */
> > +     EC_QUEUE_WAVE_ABORT =3D 1,
> > +     EC_QUEUE_WAVE_TRAP =3D 2,
> > +     EC_QUEUE_WAVE_MATH_ERROR =3D 3,
> > +     EC_QUEUE_WAVE_ILLEGAL_INSTRUCTION =3D 4,
> > +     EC_QUEUE_WAVE_MEMORY_VIOLATION =3D 5,
> > +     EC_QUEUE_WAVE_APERTURE_VIOLATION =3D 6,
> > +     EC_QUEUE_PACKET_DISPATCH_DIM_INVALID =3D 16,
> > +     EC_QUEUE_PACKET_DISPATCH_GROUP_SEGMENT_SIZE_INVALID =3D 17,
> > +     EC_QUEUE_PACKET_DISPATCH_CODE_INVALID =3D 18,
> > +     EC_QUEUE_PACKET_RESERVED =3D 19,
> > +     EC_QUEUE_PACKET_UNSUPPORTED =3D 20,
> > +     EC_QUEUE_PACKET_DISPATCH_WORK_GROUP_SIZE_INVALID =3D 21,
> > +     EC_QUEUE_PACKET_DISPATCH_REGISTER_INVALID =3D 22,
> > +     EC_QUEUE_PACKET_VENDOR_UNSUPPORTED =3D 23,
> > +     EC_QUEUE_PREEMPTION_ERROR =3D 30,
> > +     EC_QUEUE_NEW =3D 31,
> > +     /* per device */
> > +     EC_DEVICE_QUEUE_DELETE =3D 32,
> > +     EC_DEVICE_MEMORY_VIOLATION =3D 33,
> > +     EC_DEVICE_RAS_ERROR =3D 34,
> > +     EC_DEVICE_FATAL_HALT =3D 35,
> > +     EC_DEVICE_NEW =3D 36,
> > +     /* per process */
> > +     EC_PROCESS_RUNTIME =3D 48,
> > +     EC_PROCESS_DEVICE_REMOVE =3D 49,
> > +     EC_MAX
> > +};
> > +
> > +/* Mask generated by ecode in kfd_dbg_trap_exception_code */
> > +#define KFD_EC_MASK(ecode)   (1ULL << (ecode - 1))
> > +
> > +/* Masks for exception code type checks below */
> > +#define KFD_EC_MASK_QUEUE    (KFD_EC_MASK(EC_QUEUE_WAVE_ABORT) |     \
> > +                              KFD_EC_MASK(EC_QUEUE_WAVE_TRAP) |      \
> > +                              KFD_EC_MASK(EC_QUEUE_WAVE_MATH_ERROR) | =
       \
> > +                              KFD_EC_MASK(EC_QUEUE_WAVE_ILLEGAL_INSTRU=
CTION) |       \
> > +                              KFD_EC_MASK(EC_QUEUE_WAVE_MEMORY_VIOLATI=
ON) |  \
> > +                              KFD_EC_MASK(EC_QUEUE_WAVE_APERTURE_VIOLA=
TION) |        \
> > +                              KFD_EC_MASK(EC_QUEUE_PACKET_DISPATCH_DIM=
_INVALID) |    \
> > +                              KFD_EC_MASK(EC_QUEUE_PACKET_DISPATCH_GRO=
UP_SEGMENT_SIZE_INVALID) |     \
> > +                              KFD_EC_MASK(EC_QUEUE_PACKET_DISPATCH_COD=
E_INVALID) |   \
> > +                              KFD_EC_MASK(EC_QUEUE_PACKET_RESERVED) | =
       \
> > +                              KFD_EC_MASK(EC_QUEUE_PACKET_UNSUPPORTED)=
 |     \
> > +                              KFD_EC_MASK(EC_QUEUE_PACKET_DISPATCH_WOR=
K_GROUP_SIZE_INVALID) |        \
> > +                              KFD_EC_MASK(EC_QUEUE_PACKET_DISPATCH_REG=
ISTER_INVALID) |       \
> > +                              KFD_EC_MASK(EC_QUEUE_PACKET_VENDOR_UNSUP=
PORTED)        |       \
> > +                              KFD_EC_MASK(EC_QUEUE_PREEMPTION_ERROR) |=
       \
> > +                              KFD_EC_MASK(EC_QUEUE_NEW))
> > +#define KFD_EC_MASK_DEVICE   (KFD_EC_MASK(EC_DEVICE_QUEUE_DELETE) |   =
       \
> > +                              KFD_EC_MASK(EC_DEVICE_RAS_ERROR) |      =
       \
> > +                              KFD_EC_MASK(EC_DEVICE_FATAL_HALT) |     =
       \
> > +                              KFD_EC_MASK(EC_DEVICE_MEMORY_VIOLATION) =
|      \
> > +                              KFD_EC_MASK(EC_DEVICE_NEW))
> > +#define KFD_EC_MASK_PROCESS  (KFD_EC_MASK(EC_PROCESS_RUNTIME) |      \
> > +                              KFD_EC_MASK(EC_PROCESS_DEVICE_REMOVE))
> > +
> > +/* Checks for exception code types for KFD search */
> > +#define KFD_DBG_EC_TYPE_IS_QUEUE(ecode)                               =
       \
> > +                     (!!(KFD_EC_MASK(ecode) & KFD_EC_MASK_QUEUE))
> > +#define KFD_DBG_EC_TYPE_IS_DEVICE(ecode)                             \
> > +                     (!!(KFD_EC_MASK(ecode) & KFD_EC_MASK_DEVICE))
> > +#define KFD_DBG_EC_TYPE_IS_PROCESS(ecode)                            \
> > +                     (!!(KFD_EC_MASK(ecode) & KFD_EC_MASK_PROCESS))
> > +
> > +
> > +/* Runtime enable states */
> > +enum kfd_dbg_runtime_state {
> > +     DEBUG_RUNTIME_STATE_DISABLED =3D 0,
> > +     DEBUG_RUNTIME_STATE_ENABLED =3D 1,
> > +     DEBUG_RUNTIME_STATE_ENABLED_BUSY =3D 2,
> > +     DEBUG_RUNTIME_STATE_ENABLED_ERROR =3D 3
> > +};
> > +
> > +/* Runtime enable status */
> > +struct kfd_runtime_info {
> > +     __u64 r_debug;
> > +     __u32 runtime_state;
> > +     __u32 ttmp_setup;
> > +};
> > +
> > +/* Enable modes for runtime enable */
> > +#define KFD_RUNTIME_ENABLE_MODE_ENABLE_MASK  1
> > +#define KFD_RUNTIME_ENABLE_MODE_TTMP_SAVE_MASK       2
> > +
> > +/**
> > + * kfd_ioctl_runtime_enable_args - Arguments for runtime enable
> > + *
> > + * Coordinates debug exception signalling and debug device enablement =
with runtime.
> > + *
> > + * @r_debug - pointer to user struct for sharing information between R=
OCr and the debuggger
> > + * @mode_mask - mask to set mode
> > + *   KFD_RUNTIME_ENABLE_MODE_ENABLE_MASK - enable runtime for debuggin=
g, otherwise disable
> > + *   KFD_RUNTIME_ENABLE_MODE_TTMP_SAVE_MASK - enable trap temporary se=
tup (ignore on disable)
> > + * @capabilities_mask - mask to notify runtime on what KFD supports
> > + *
> > + * Return - 0 on SUCCESS.
> > + *     - EBUSY if runtime enable call already pending.
> > + *     - EEXIST if user queues already active prior to call.
> > + *       If process is debug enabled, runtime enable will enable debug=
 devices and
> > + *       wait for debugger process to send runtime exception EC_PROCES=
S_RUNTIME
> > + *       to unblock - see kfd_ioctl_dbg_trap_args.
> > + *
> > + */
> > +struct kfd_ioctl_runtime_enable_args {
> > +     __u64 r_debug;
> > +     __u32 mode_mask;
> > +     __u32 capabilities_mask;
> > +};
> > +
> > +/* Queue information */
> > +struct kfd_queue_snapshot_entry {
> > +     __u64 exception_status;
> > +     __u64 ring_base_address;
> > +     __u64 write_pointer_address;
> > +     __u64 read_pointer_address;
> > +     __u64 ctx_save_restore_address;
> > +     __u32 queue_id;
> > +     __u32 gpu_id;
> > +     __u32 ring_size;
> > +     __u32 queue_type;
> > +     __u32 ctx_save_restore_area_size;
> > +     __u32 reserved;
> > +};
> > +
> > +/* Queue status return for suspend/resume */
> > +#define KFD_DBG_QUEUE_ERROR_BIT              30
> > +#define KFD_DBG_QUEUE_INVALID_BIT    31
> > +#define KFD_DBG_QUEUE_ERROR_MASK     (1 << KFD_DBG_QUEUE_ERROR_BIT)
> > +#define KFD_DBG_QUEUE_INVALID_MASK   (1 << KFD_DBG_QUEUE_INVALID_BIT)
> > +
> > +/* Context save area header information */
> > +struct kfd_context_save_area_header {
> > +     struct {
> > +             __u32 control_stack_offset;
> > +             __u32 control_stack_size;
> > +             __u32 wave_state_offset;
> > +             __u32 wave_state_size;
> > +     } wave_state;
> > +     __u32 debug_offset;
> > +     __u32 debug_size;
> > +     __u64 err_payload_addr;
> > +     __u32 err_event_id;
> > +     __u32 reserved1;
> > +};
> > +
> > +/*
> > + * Debug operations
> > + *
> > + * For specifics on usage and return values, see documentation per ope=
ration
> > + * below.  Otherwise, generic error returns apply:
> > + *   - ESRCH if the process to debug does not exist.
> > + *
> > + *   - EINVAL (with KFD_IOC_DBG_TRAP_ENABLE exempt) if operation
> > + *            KFD_IOC_DBG_TRAP_ENABLE has not succeeded prior.
> > + *            Also returns this error if GPU hardware scheduling is no=
t supported.
> > + *
> > + *   - EPERM (with KFD_IOC_DBG_TRAP_DISABLE exempt) if target process =
is not
> > + *            PTRACE_ATTACHED.  KFD_IOC_DBG_TRAP_DISABLE is exempt to =
allow
> > + *            clean up of debug mode as long as process is debug enabl=
ed.
> > + *
> > + *   - EACCES if any DBG_HW_OP (debug hardware operation) is requested=
 when
> > + *            AMDKFD_IOC_RUNTIME_ENABLE has not succeeded prior.
> > + *
> > + *   - ENODEV if any GPU does not support debugging on a DBG_HW_OP cal=
l.
> > + *
> > + *   - Other errors may be returned when a DBG_HW_OP occurs while the =
GPU
> > + *     is in a fatal state.
> > + *
> > + */
> > +enum kfd_dbg_trap_operations {
> > +     KFD_IOC_DBG_TRAP_ENABLE =3D 0,
> > +     KFD_IOC_DBG_TRAP_DISABLE =3D 1,
> > +     KFD_IOC_DBG_TRAP_SEND_RUNTIME_EVENT =3D 2,
> > +     KFD_IOC_DBG_TRAP_SET_EXCEPTIONS_ENABLED =3D 3,
> > +     KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_OVERRIDE =3D 4,  /* DBG_HW_OP */
> > +     KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_MODE =3D 5,      /* DBG_HW_OP */
> > +     KFD_IOC_DBG_TRAP_SUSPEND_QUEUES =3D 6,            /* DBG_HW_OP */
> > +     KFD_IOC_DBG_TRAP_RESUME_QUEUES =3D 7,             /* DBG_HW_OP */
> > +     KFD_IOC_DBG_TRAP_SET_NODE_ADDRESS_WATCH =3D 8,    /* DBG_HW_OP */
> > +     KFD_IOC_DBG_TRAP_CLEAR_NODE_ADDRESS_WATCH =3D 9,  /* DBG_HW_OP */
> > +     KFD_IOC_DBG_TRAP_SET_FLAGS =3D 10,
> > +     KFD_IOC_DBG_TRAP_QUERY_DEBUG_EVENT =3D 11,
> > +     KFD_IOC_DBG_TRAP_QUERY_EXCEPTION_INFO =3D 12,
> > +     KFD_IOC_DBG_TRAP_GET_QUEUE_SNAPSHOT =3D 13,
> > +     KFD_IOC_DBG_TRAP_GET_DEVICE_SNAPSHOT =3D 14
> > +};
> > +
> > +/**
> > + * kfd_ioctl_dbg_trap_enable_args
> > + *
> > + *     Arguments for KFD_IOC_DBG_TRAP_ENABLE.
> > + *
> > + *     Enables debug session for target process. Call @op KFD_IOC_DBG_=
TRAP_DISABLE in
> > + *     kfd_ioctl_dbg_trap_args to disable debug session.
> > + *
> > + *     @exception_mask (IN)  - exceptions to raise to the debugger
> > + *     @rinfo_ptr      (IN)  - pointer to runtime info buffer (see kfd=
_runtime_info)
> > + *     @rinfo_size     (IN/OUT)      - size of runtime info buffer in =
bytes
> > + *     @dbg_fd              (IN)     - fd the KFD will nofify the debu=
gger with of raised
> > + *                             exceptions set in exception_mask.
> > + *
> > + *     Generic errors apply (see kfd_dbg_trap_operations).
> > + *     Return - 0 on SUCCESS.
> > + *           Copies KFD saved kfd_runtime_info to @rinfo_ptr on enable=
.
> > + *           Size of kfd_runtime saved by the KFD returned to @rinfo_s=
ize.
> > + *            - EBADF if KFD cannot get a reference to dbg_fd.
> > + *            - EFAULT if KFD cannot copy runtime info to rinfo_ptr.
> > + *            - EINVAL if target process is already debug enabled.
> > + *
> > + */
> > +struct kfd_ioctl_dbg_trap_enable_args {
> > +     __u64 exception_mask;
> > +     __u64 rinfo_ptr;
> > +     __u32 rinfo_size;
> > +     __u32 dbg_fd;
> > +};
> > +
> > +/**
> > + * kfd_ioctl_dbg_trap_send_runtime_event_args
> > + *
> > + *
> > + *     Arguments for KFD_IOC_DBG_TRAP_SEND_RUNTIME_EVENT.
> > + *     Raises exceptions to runtime.
> > + *
> > + *     @exception_mask (IN) - exceptions to raise to runtime
> > + *     @gpu_id              (IN) - target device id
> > + *     @queue_id       (IN) - target queue id
> > + *
> > + *     Generic errors apply (see kfd_dbg_trap_operations).
> > + *     Return - 0 on SUCCESS.
> > + *         - ENODEV if gpu_id not found.
> > + *           If exception_mask contains EC_PROCESS_RUNTIME, unblocks p=
ending
> > + *           AMDKFD_IOC_RUNTIME_ENABLE call - see kfd_ioctl_runtime_en=
able_args.
> > + *           All other exceptions are raised to runtime through err_pa=
yload_addr.
> > + *           See kfd_context_save_area_header.
> > + */
> > +struct kfd_ioctl_dbg_trap_send_runtime_event_args {
> > +     __u64 exception_mask;
> > +     __u32 gpu_id;
> > +     __u32 queue_id;
> > +};
> > +
> > +/**
> > + * kfd_ioctl_dbg_trap_set_exceptions_enabled_args
> > + *
> > + *     Arguments for KFD_IOC_SET_EXCEPTIONS_ENABLED
> > + *     Set new exceptions to be raised to the debugger.
> > + *
> > + *     @exception_mask (IN) - new exceptions to raise the debugger
> > + *
> > + *     Generic errors apply (see kfd_dbg_trap_operations).
> > + *     Return - 0 on SUCCESS.
> > + */
> > +struct kfd_ioctl_dbg_trap_set_exceptions_enabled_args {
> > +     __u64 exception_mask;
> > +};
> > +
> > +/**
> > + * kfd_ioctl_dbg_trap_set_wave_launch_override_args
> > + *
> > + *     Arguments for KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_OVERRIDE
> > + *     Enable HW exceptions to raise trap.
> > + *
> > + *     @override_mode             (IN)     - see kfd_dbg_trap_override=
_mode
> > + *     @enable_mask       (IN/OUT) - reference kfd_dbg_trap_mask.
> > + *                                   IN is the override modes requeste=
d to be enabled.
> > + *                                   OUT is referenced in Return below=
.
> > + *     @support_request_mask (IN/OUT) - reference kfd_dbg_trap_mask.
> > + *                                   IN is the override modes requeste=
d for support check.
> > + *                                   OUT is referenced in Return below=
.
> > + *
> > + *     Generic errors apply (see kfd_dbg_trap_operations).
> > + *     Return - 0 on SUCCESS.
> > + *           Previous enablement is returned in @enable_mask.
> > + *           Actual override support is returned in @support_request_m=
ask.
> > + *         - EINVAL if override mode is not supported.
> > + *         - EACCES if trap support requested is not actually supporte=
d.
> > + *           i.e. enable_mask (IN) is not a subset of support_request_=
mask (OUT).
> > + *           Otherwise it is considered a generic error (see kfd_dbg_t=
rap_operations).
> > + */
> > +struct kfd_ioctl_dbg_trap_set_wave_launch_override_args {
> > +     __u32 override_mode;
> > +     __u32 enable_mask;
> > +     __u32 support_request_mask;
> > +     __u32 pad;
> > +};
> > +
> > +/**
> > + * kfd_ioctl_dbg_trap_set_wave_launch_mode_args
> > + *
> > + *     Arguments for KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_MODE
> > + *     Set wave launch mode.
> > + *
> > + *     @mode (IN) - see kfd_dbg_trap_wave_launch_mode
> > + *
> > + *     Generic errors apply (see kfd_dbg_trap_operations).
> > + *     Return - 0 on SUCCESS.
> > + */
> > +struct kfd_ioctl_dbg_trap_set_wave_launch_mode_args {
> > +     __u32 launch_mode;
> > +     __u32 pad;
> > +};
> > +
> > +/**
> > + * kfd_ioctl_dbg_trap_suspend_queues_ags
> > + *
> > + *     Arguments for KFD_IOC_DBG_TRAP_SUSPEND_QUEUES
> > + *     Suspend queues.
> > + *
> > + *     @exception_mask       (IN) - raised exceptions to clear
> > + *     @queue_array_ptr (IN) - pointer to array of queue ids (u32 per =
queue id)
> > + *                          to suspend
> > + *     @num_queues   (IN) - number of queues to suspend in @queue_arra=
y_ptr
> > + *     @grace_period (IN) - wave time allowance before preemption
> > + *                          per 1K GPU clock cycle unit
> > + *
> > + *     Generic errors apply (see kfd_dbg_trap_operations).
> > + *     Destruction of a suspended queue is blocked until the queue is
> > + *     resumed.  This allows the debugger to access queue information =
and
> > + *     the its context save area without running into a race condition=
 on
> > + *     queue destruction.
> > + *     Automatically copies per queue context save area header informa=
tion
> > + *     into the save area base
> > + *     (see kfd_queue_snapshot_entry and kfd_context_save_area_header)=
.
> > + *
> > + *     Return - Number of queues suspended on SUCCESS.
> > + *   .       KFD_DBG_QUEUE_ERROR_MASK and KFD_DBG_QUEUE_INVALID_MASK m=
asked
> > + *           for each queue id in @queue_array_ptr array reports unsuc=
cessful
> > + *           suspend reason.
> > + *           KFD_DBG_QUEUE_ERROR_MASK =3D HW failure.
> > + *           KFD_DBG_QUEUE_INVALID_MASK =3D queue does not exist, is n=
ew or
> > + *           is being destroyed.
> > + */
> > +struct kfd_ioctl_dbg_trap_suspend_queues_args {
> > +     __u64 exception_mask;
> > +     __u64 queue_array_ptr;
> > +     __u32 num_queues;
> > +     __u32 grace_period;
> > +};
> > +
> > +/**
> > + * kfd_ioctl_dbg_trap_resume_queues_args
> > + *
> > + *     Arguments for KFD_IOC_DBG_TRAP_RESUME_QUEUES
> > + *     Resume queues.
> > + *
> > + *     @queue_array_ptr (IN) - pointer to array of queue ids (u32 per =
queue id)
> > + *                          to resume
> > + *     @num_queues   (IN) - number of queues to resume in @queue_array=
_ptr
> > + *
> > + *     Generic errors apply (see kfd_dbg_trap_operations).
> > + *     Return - Number of queues resumed on SUCCESS.
> > + *           KFD_DBG_QUEUE_ERROR_MASK and KFD_DBG_QUEUE_INVALID_MASK m=
ask
> > + *           for each queue id in @queue_array_ptr array reports unsuc=
cessful
> > + *           resume reason.
> > + *           KFD_DBG_QUEUE_ERROR_MASK =3D HW failure.
> > + *           KFD_DBG_QUEUE_INVALID_MASK =3D queue does not exist.
> > + */
> > +struct kfd_ioctl_dbg_trap_resume_queues_args {
> > +     __u64 queue_array_ptr;
> > +     __u32 num_queues;
> > +     __u32 pad;
> > +};
> > +
> > +/**
> > + * kfd_ioctl_dbg_trap_set_node_address_watch_args
> > + *
> > + *     Arguments for KFD_IOC_DBG_TRAP_SET_NODE_ADDRESS_WATCH
> > + *     Sets address watch for device.
> > + *
> > + *     @address      (IN)  - watch address to set
> > + *     @mode    (IN)  - see kfd_dbg_trap_address_watch_mode
> > + *     @mask    (IN)  - watch address mask
> > + *     @gpu_id  (IN)  - target gpu to set watch point
> > + *     @id      (OUT) - watch id allocated
> > + *
> > + *     Generic errors apply (see kfd_dbg_trap_operations).
> > + *     Return - 0 on SUCCESS.
> > + *           Allocated watch ID returned to @id.
> > + *         - ENODEV if gpu_id not found.
> > + *         - ENOMEM if watch IDs can be allocated
> > + */
> > +struct kfd_ioctl_dbg_trap_set_node_address_watch_args {
> > +     __u64 address;
> > +     __u32 mode;
> > +     __u32 mask;
> > +     __u32 gpu_id;
> > +     __u32 id;
> > +};
> > +
> > +/**
> > + * kfd_ioctl_dbg_trap_clear_node_address_watch_args
> > + *
> > + *     Arguments for KFD_IOC_DBG_TRAP_CLEAR_NODE_ADDRESS_WATCH
> > + *     Clear address watch for device.
> > + *
> > + *     @gpu_id  (IN)  - target device to clear watch point
> > + *     @id      (IN) - allocated watch id to clear
> > + *
> > + *     Generic errors apply (see kfd_dbg_trap_operations).
> > + *     Return - 0 on SUCCESS.
> > + *         - ENODEV if gpu_id not found.
> > + *         - EINVAL if watch ID has not been allocated.
> > + */
> > +struct kfd_ioctl_dbg_trap_clear_node_address_watch_args {
> > +     __u32 gpu_id;
> > +     __u32 id;
> > +};
> > +
> > +/**
> > + * kfd_ioctl_dbg_trap_set_flags_args
> > + *
> > + *     Arguments for KFD_IOC_DBG_TRAP_SET_FLAGS
> > + *     Sets flags for wave behaviour.
> > + *
> > + *     @flags (IN/OUT) - IN =3D flags to enable, OUT =3D flags previou=
sly enabled
> > + *
> > + *     Generic errors apply (see kfd_dbg_trap_operations).
> > + *     Return - 0 on SUCCESS.
> > + *         - EACCESS if any debug device does not allow flag options.
> > + */
> > +struct kfd_ioctl_dbg_trap_set_flags_args {
> > +     __u32 flags;
> > +     __u32 pad;
> > +};
> > +
> > +/**
> > + * kfd_ioctl_dbg_trap_query_debug_event_args
> > + *
> > + *     Arguments for KFD_IOC_DBG_TRAP_QUERY_DEBUG_EVENT
> > + *
> > + *     Find one or more raised exceptions. This function can return mu=
ltiple
> > + *     exceptions from a single queue or a single device with one call=
. To find
> > + *     all raised exceptions, this function must be called repeatedly =
until it
> > + *     returns -EAGAIN. Returned exceptions can optionally be cleared =
by
> > + *     setting the corresponding bit in the @exception_mask input para=
meter.
> > + *     However, clearing an exception prevents retrieving further info=
rmation
> > + *     about it with KFD_IOC_DBG_TRAP_QUERY_EXCEPTION_INFO.
> > + *
> > + *     @exception_mask (IN/OUT) - exception to clear (IN) and raised (=
OUT)
> > + *     @gpu_id              (OUT)    - gpu id of exceptions raised
> > + *     @queue_id       (OUT)    - queue id of exceptions raised
> > + *
> > + *     Generic errors apply (see kfd_dbg_trap_operations).
> > + *     Return - 0 on raised exception found
> > + *              Raised exceptions found are returned in @exception mas=
k
> > + *              with reported source id returned in @gpu_id or @queue_=
id.
> > + *            - EAGAIN if no raised exception has been found
> > + */
> > +struct kfd_ioctl_dbg_trap_query_debug_event_args {
> > +     __u64 exception_mask;
> > +     __u32 gpu_id;
> > +     __u32 queue_id;
> > +};
> > +
> > +/**
> > + * kfd_ioctl_dbg_trap_query_exception_info_args
> > + *
> > + *     Arguments KFD_IOC_DBG_TRAP_QUERY_EXCEPTION_INFO
> > + *     Get additional info on raised exception.
> > + *
> > + *     @info_ptr     (IN)     - pointer to exception info buffer to co=
py to
> > + *     @info_size    (IN/OUT) - exception info buffer size (bytes)
> > + *     @source_id    (IN)     - target gpu or queue id
> > + *     @exception_code       (IN)     - target exception
> > + *     @clear_exception      (IN)     - clear raised @exception_code e=
xception
> > + *                              (0 =3D false, 1 =3D true)
> > + *
> > + *     Generic errors apply (see kfd_dbg_trap_operations).
> > + *     Return - 0 on SUCCESS.
> > + *              If @exception_code is EC_DEVICE_MEMORY_VIOLATION, copy=
 @info_size(OUT)
> > + *           bytes of memory exception data to @info_ptr.
> > + *              If @exception_code is EC_PROCESS_RUNTIME, copy saved
> > + *              kfd_runtime_info to @info_ptr.
> > + *              Actual required @info_ptr size (bytes) is returned in =
@info_size.
> > + */
> > +struct kfd_ioctl_dbg_trap_query_exception_info_args {
> > +     __u64 info_ptr;
> > +     __u32 info_size;
> > +     __u32 source_id;
> > +     __u32 exception_code;
> > +     __u32 clear_exception;
> > +};
> > +
> > +/**
> > + * kfd_ioctl_dbg_trap_get_queue_snapshot_args
> > + *
> > + *     Arguments KFD_IOC_DBG_TRAP_GET_QUEUE_SNAPSHOT
> > + *     Get queue information.
> > + *
> > + *     @exception_mask        (IN)     - exceptions raised to clear
> > + *     @snapshot_buf_ptr (IN)          - queue snapshot entry buffer (=
see kfd_queue_snapshot_entry)
> > + *     @num_queues    (IN/OUT) - number of queue snapshot entries
> > + *         The debugger specifies the size of the array allocated in @=
num_queues.
> > + *         KFD returns the number of queues that actually existed. If =
this is
> > + *         larger than the size specified by the debugger, KFD will no=
t overflow
> > + *         the array allocated by the debugger.
> > + *
> > + *     @entry_size    (IN/OUT) - size per entry in bytes
> > + *         The debugger specifies sizeof(struct kfd_queue_snapshot_ent=
ry) in
> > + *         @entry_size. KFD returns the number of bytes actually popul=
ated per
> > + *         entry. The debugger should use the KFD_IOCTL_MINOR_VERSION =
to determine,
> > + *         which fields in struct kfd_queue_snapshot_entry are valid. =
This allows
> > + *         growing the ABI in a backwards compatible manner.
> > + *         Note that entry_size(IN) should still be used to stride the=
 snapshot buffer in the
> > + *         event that it's larger than actual kfd_queue_snapshot_entry=
.
> > + *
> > + *     Generic errors apply (see kfd_dbg_trap_operations).
> > + *     Return - 0 on SUCCESS.
> > + *              Copies @num_queues(IN) queue snapshot entries of size =
@entry_size(IN)
> > + *              into @snapshot_buf_ptr if @num_queues(IN) > 0.
> > + *              Otherwise return @num_queues(OUT) queue snapshot entri=
es that exist.
> > + */
> > +struct kfd_ioctl_dbg_trap_queue_snapshot_args {
> > +     __u64 exception_mask;
> > +     __u64 snapshot_buf_ptr;
> > +     __u32 num_queues;
> > +     __u32 entry_size;
> > +};
> > +
> > +/**
> > + * kfd_ioctl_dbg_trap_get_device_snapshot_args
> > + *
> > + *     Arguments for KFD_IOC_DBG_TRAP_GET_DEVICE_SNAPSHOT
> > + *     Get device information.
> > + *
> > + *     @exception_mask        (IN)     - exceptions raised to clear
> > + *     @snapshot_buf_ptr (IN)          - pointer to snapshot buffer (s=
ee kfd_dbg_device_info_entry)
> > + *     @num_devices   (IN/OUT) - number of debug devices to snapshot
> > + *         The debugger specifies the size of the array allocated in @=
num_devices.
> > + *         KFD returns the number of devices that actually existed. If=
 this is
> > + *         larger than the size specified by the debugger, KFD will no=
t overflow
> > + *         the array allocated by the debugger.
> > + *
> > + *     @entry_size    (IN/OUT) - size per entry in bytes
> > + *         The debugger specifies sizeof(struct kfd_dbg_device_info_en=
try) in
> > + *         @entry_size. KFD returns the number of bytes actually popul=
ated. The
> > + *         debugger should use KFD_IOCTL_MINOR_VERSION to determine, w=
hich fields
> > + *         in struct kfd_dbg_device_info_entry are valid. This allows =
growing the
> > + *         ABI in a backwards compatible manner.
> > + *         Note that entry_size(IN) should still be used to stride the=
 snapshot buffer in the
> > + *         event that it's larger than actual kfd_dbg_device_info_entr=
y.
> > + *
> > + *     Generic errors apply (see kfd_dbg_trap_operations).
> > + *     Return - 0 on SUCCESS.
> > + *              Copies @num_devices(IN) device snapshot entries of siz=
e @entry_size(IN)
> > + *              into @snapshot_buf_ptr if @num_devices(IN) > 0.
> > + *              Otherwise return @num_devices(OUT) queue snapshot entr=
ies that exist.
> > + */
> > +struct kfd_ioctl_dbg_trap_device_snapshot_args {
> > +     __u64 exception_mask;
> > +     __u64 snapshot_buf_ptr;
> > +     __u32 num_devices;
> > +     __u32 entry_size;
> > +};
> > +
> > +/**
> > + * kfd_ioctl_dbg_trap_args
> > + *
> > + * Arguments to debug target process.
> > + *
> > + *     @pid - target process to debug
> > + *     @op  - debug operation (see kfd_dbg_trap_operations)
> > + *
> > + *     @op determines which union struct args to use.
> > + *     Refer to kern docs for each kfd_ioctl_dbg_trap_*_args struct.
> > + */
> > +struct kfd_ioctl_dbg_trap_args {
> > +     __u32 pid;
> > +     __u32 op;
> > +
> > +     union {
> > +             struct kfd_ioctl_dbg_trap_enable_args enable;
> > +             struct kfd_ioctl_dbg_trap_send_runtime_event_args send_ru=
ntime_event;
> > +             struct kfd_ioctl_dbg_trap_set_exceptions_enabled_args set=
_exceptions_enabled;
> > +             struct kfd_ioctl_dbg_trap_set_wave_launch_override_args l=
aunch_override;
> > +             struct kfd_ioctl_dbg_trap_set_wave_launch_mode_args launc=
h_mode;
> > +             struct kfd_ioctl_dbg_trap_suspend_queues_args suspend_que=
ues;
> > +             struct kfd_ioctl_dbg_trap_resume_queues_args resume_queue=
s;
> > +             struct kfd_ioctl_dbg_trap_set_node_address_watch_args set=
_node_address_watch;
> > +             struct kfd_ioctl_dbg_trap_clear_node_address_watch_args c=
lear_node_address_watch;
> > +             struct kfd_ioctl_dbg_trap_set_flags_args set_flags;
> > +             struct kfd_ioctl_dbg_trap_query_debug_event_args query_de=
bug_event;
> > +             struct kfd_ioctl_dbg_trap_query_exception_info_args query=
_exception_info;
> > +             struct kfd_ioctl_dbg_trap_queue_snapshot_args queue_snaps=
hot;
> > +             struct kfd_ioctl_dbg_trap_device_snapshot_args device_sna=
pshot;
> > +     };
> > +};
> > +
> >   #define AMDKFD_IOCTL_BASE 'K'
> >   #define AMDKFD_IO(nr)                       _IO(AMDKFD_IOCTL_BASE, nr=
)
> >   #define AMDKFD_IOR(nr, type)                _IOR(AMDKFD_IOCTL_BASE, n=
r, type)
> > @@ -889,7 +1549,13 @@ struct kfd_ioctl_set_xnack_mode_args {
> >   #define AMDKFD_IOC_EXPORT_DMABUF            \
> >               AMDKFD_IOWR(0x24, struct kfd_ioctl_export_dmabuf_args)
> >
> > +#define AMDKFD_IOC_RUNTIME_ENABLE            \
> > +             AMDKFD_IOWR(0x25, struct kfd_ioctl_runtime_enable_args)
> > +
> > +#define AMDKFD_IOC_DBG_TRAP                  \
> > +             AMDKFD_IOWR(0x26, struct kfd_ioctl_dbg_trap_args)
> > +
> >   #define AMDKFD_COMMAND_START                0x01
> > -#define AMDKFD_COMMAND_END           0x25
> > +#define AMDKFD_COMMAND_END           0x27
> >
> >   #endif
