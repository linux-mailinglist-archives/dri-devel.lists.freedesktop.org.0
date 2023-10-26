Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 627E87D8894
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 20:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC76010E08C;
	Thu, 26 Oct 2023 18:53:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C9910E08C;
 Thu, 26 Oct 2023 18:53:53 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1e9d3cc6e7aso755056fac.2; 
 Thu, 26 Oct 2023 11:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698346432; x=1698951232; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uyVfaAYqNM9Hinvf6pmM3RdI7YP8gZdIU+LpEO3D4HQ=;
 b=AGfK3TLRUIv7r8tHgkJ5HUn3g6PSQYOplmZXfSlxnMDBC8ENsikcVZTEmJzF18FbY4
 nRMQ9g23BBwhX3EfTyCaCgAmBTN8fSbA23dgzHLGiFWa0/TktWuIOWu4oR4Oem78yLAG
 9Mr8iRskpFU/mxqYeFUS4E6AM9BU7te4+bsJOwF4zdHovtyo5YNpAqyROxDYIIx/xYWI
 f3HdZLATz6UoIA3nWsnjZ2BmaUPdCPmpUxgI4+1eHCWtvB7aPZf/5Y3zMDibqkQFNJ5V
 RKw8XtP91Rxrwc+RGxYWTFJx/+U7sJLciuamM4o/5i84XppS2x6mXz7Xg6PjRzBj0VVf
 E38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698346432; x=1698951232;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uyVfaAYqNM9Hinvf6pmM3RdI7YP8gZdIU+LpEO3D4HQ=;
 b=LYEssMX19USC+DgQANMKmwOyQtYV01hPNORdSt1CEFjesMAO+9NICy/N5zWPbIoxiH
 cNTPy4qwOk4g/2JSY1mKzpvFiaYxevfOhTxkdZofHL6MPm0UL0JlWb72kqZNfZLWNjXo
 JdtVkz01zGsq6fyEEc5jtS13BhWFMkZaLNikI5WzC20yiihNd8iPPMKZWPhY8+aZnc2K
 QXASaAkGLJs0dB0BpSpqzE1IK0sZ/NEnCXL99PzbseL+eJjqzJcG8tiQpDewkvIuYZfR
 fGAN3Yi63Nzf9gFL1P/m7Qn66OElO4NMPmbCQsarYpld9/qF2gzIoy5UHCfe+hgmOYda
 yYgg==
X-Gm-Message-State: AOJu0YwU5DNLakNlUoVZDr5s5+vq9xlrpMociwRGuX2WmhQo4BxF4MJT
 JurRtiieP8Jnu5NJndD1ygjiphJBCDJyQriS5GUCgLQl7w4=
X-Google-Smtp-Source: AGHT+IEYQav6rvqY9tK51pH2f/JrNf0mFDfUa2LaJ9U8+iKF4gk6El35NOBLIN9zJMjQNXPmMDRo+GaY5Lvt7SjteHg=
X-Received: by 2002:a05:6870:11cc:b0:1e9:ba42:76bb with SMTP id
 12-20020a05687011cc00b001e9ba4276bbmr355832oav.39.1698346431913; Thu, 26 Oct
 2023 11:53:51 -0700 (PDT)
MIME-Version: 1.0
References: <20231026173320.552430-1-alexey.klimov@linaro.org>
In-Reply-To: <20231026173320.552430-1-alexey.klimov@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 26 Oct 2023 14:53:40 -0400
Message-ID: <CADnq5_PFHZnR2aT0+iTgQE5vob9JqLk031JVY42Mx_u55D986g@mail.gmail.com>
Subject: Re: [REGRESSION] rx7600 stopped working after "1cfb4d612127
 drm/amdgpu: put MQDs in VRAM"
To: Alexey Klimov <alexey.klimov@linaro.org>
Content-Type: multipart/mixed; boundary="000000000000c7b4c10608a3177c"
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
Cc: mathieu.poirier@linaro.org, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, klimov.linux@gmail.com, luben.tuikov@amd.com,
 amd-gfx@lists.freedesktop.org, leo.yan@linaro.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000c7b4c10608a3177c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 26, 2023 at 1:33=E2=80=AFPM Alexey Klimov <alexey.klimov@linaro=
.org> wrote:
>
> #regzbot introduced: 1cfb4d612127
> #regzbot title: rx7600 stopped working after "1cfb4d612127 drm/amdgpu: pu=
t MQDs in VRAM"
>
> Hi all,
>
> I've been playing with RX7600 and it was observed that amdgpu stopped wor=
king between kernel 6.2 and 6.5.
> Then I narrowed it down to 6.4 <-> 6.5-rc1 and finally bisect pointed at =
1cfb4d6121276a829aa94d0e32a7f5e1830ebc21
> And I manually checked if it boots/works on the previous commit and the m=
entioned one.
>
> I guess the log also reveals warning in error path. Please see below.
>
> I didn't check any further. This is simple debian testing system with the=
 following cmdline options:
> root@avadebian:~# cat /proc/cmdline
> BOOT_IMAGE=3D/boot/vmlinuz-6.6-rc7+ ignore_loglevel root=3D/dev/nvme1n1p2=
 ro nr_cpus=3D32
>
> So far simple revert (patch is below) returns things back to normal-ish: =
there are huge graphics artifacts on Xorg/X11 under 6.1 to upstream kernel.=
 Wayland-based sway works great without issues. Not sure where should I rep=
ort this.
>
> Please let me know if I can help debugging, testing or provide some other=
 logs regarding 1cfb4d612127? Any cmdline options to collect more info?

Please make sure you have this patch as well:
e602157ec089240861cd641ee2c7c64eeaec09bf ("drm/amdgpu: fix S3 issue if
MQD in VRAM")
Please open a ticket here so we can track this:
https://gitlab.freedesktop.org/drm/amd/-/issues/
I think I see the problem.  Please see if attached patch 1 fixes the
issue.  If this fixes it, that would also explain the issues you are
seeing with Xorg.  It would appear there are limitations around MMIO
access on your platform and unfortunately most graphics APIs require
unaligned access to MMIO space with the CPU.  We can fix the kernel
side pretty easily, but userspace will be a problem.

More below.

>
> Thanks,
> Alexey
>
>
>
> From 214372d5cedcf8757dd80d5f4d058377a3d92c52 Mon Sep 17 00:00:00 2001
> From: Alexey Klimov <alexey.klimov@linaro.org>
> Date: Thu, 26 Oct 2023 17:01:02 +0100
> Subject: [PATCH] drm/amdgpu: Revert "drm/amdgpu: put MQDs in VRAM"
>
> This reverts commit 1cfb4d6121276a829aa94d0e32a7f5e1830ebc21.
>
> amdgpu driver fails during initialisation with RX7600/gfx11 on
> ADLINK Ampere Altra Developer Platform (AVA developer platform)
> with mentioned commit:
>
> [   12.559893] [drm] Display Core v3.2.247 initialized on DCN 3.2.1
> [   12.565906] [drm] DP-HDMI FRL PCON supported
> [   12.572192] [drm] DMUB hardware initialized: version=3D0x07000C00
> [   12.582541] snd_hda_intel 000d:03:00.1: bound 000d:03:00.0 (ops amdgpu=
_dm_audio_component_bind_ops [amdgpu])
> [   12.625357] [drm] kiq ring mec 3 pipe 1 q 0
> [   12.857087] amdgpu 000d:03:00.0: [drm:amdgpu_ring_test_helper [amdgpu]=
] *ERROR* ring comp_1.0.0 test failed (-110)
> [   12.867930] [drm:amdgpu_device_init [amdgpu]] *ERROR* hw_init of IP bl=
ock <gfx_v11_0> failed -110
> [   12.877289] amdgpu 000d:03:00.0: amdgpu: amdgpu_device_ip_init failed
> [   12.883723] amdgpu 000d:03:00.0: amdgpu: Fatal error during GPU init
> [   12.890070] amdgpu 000d:03:00.0: amdgpu: amdgpu: finishing device.
> [   12.896586] [drm] DSC precompute is not needed.
> [   12.901142] ------------[ cut here ]------------
> [   12.905747] WARNING: CPU: 0 PID: 212 at drivers/gpu/drm/amd/amdgpu/amd=
gpu_irq.c:615 amdgpu_irq_put+0xa8/0xc8 [amdgpu]
> [   12.916841] Modules linked in: hid_generic(E) usbhid(E) hid(E) qrtr(E)=
 iptable_nat(E) amdgpu(E+) nf_nat(E) nf_conntrack(E) snd_hda_codec_hdmi(E) =
nf_defrag_ipv6(E) nf_defrag_ipv4(E) libcrc32c(E) iptable_mangle(E) iptable_=
filter(E) amdxcp(E) drm_exec(E) gpu_sched(E) snd_hda_intel(E) aes_ce_blk(E)=
 snd_intel_dspcfg(E) drm_buddy(E) aes_ce_cipher(E) snd_hda_codec(E) xhci_pc=
i(E) video(E) crct10dif_ce(E) polyval_ce(E) snd_hda_core(E) xhci_hcd(E) drm=
_suballoc_helper(E) snd_hwdep(E) polyval_generic(E) drm_ttm_helper(E) snd_p=
cm(E) ghash_ce(E) ast(E) ttm(E) gf128mul(E) snd_timer(E) ipmi_ssif(E) drm_d=
isplay_helper(E) drm_shmem_helper(E) sha2_ce(E) sha256_arm64(E) ipmi_devint=
f(E) usbcore(E) snd(E) drm_kms_helper(E) igb(E) sha1_ce(E) sbsa_gwdt(E) ipm=
i_msghandler(E) arm_spe_pmu(E) soundcore(E) usb_common(E) i2c_algo_bit(E) c=
ppc_cpufreq(E) i2c_designware_platform(E) arm_dsu_pmu(E) arm_cmn(E) xgene_h=
wmon(E) i2c_designware_core(E) evdev(E) binfmt_misc(E) loop(E) fuse(E) efi_=
pstore(E) drm(E) dm_mod(E) dax(E) configfs(E) efivarfs(E)
> [   12.916916]  ip_tables(E) x_tables(E) autofs4(E)
> [   13.011111] CPU: 0 PID: 212 Comm: kworker/0:2 Tainted: G            E =
     6.6.0-rc7+ #23
> [   13.019277] Hardware name: ADLINK Ampere Altra Developer Platform/Ampe=
re Altra Developer Platform, BIOS TianoCore 2.04.100.10 (SYS: 2.06.20220308=
) 04/18/2
> [   13.033084] Workqueue: events work_for_cpu_fn
> [   13.037434] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [   13.044384] pc : amdgpu_irq_put+0xa8/0xc8 [amdgpu]
> [   13.049652] lr : amdgpu_fence_driver_hw_fini+0x118/0x160 [amdgpu]
> [   13.056220] sp : ffff80008012bc10
> [   13.059522] x29: ffff80008012bc20 x28: 0000000000000000 x27: 000000000=
0000000
> [   13.066647] x26: 0000000000000000 x25: ffff07ff98580010 x24: ffff07ff9=
8580000
> [   13.073772] x23: ffff07ff985a78f0 x22: ffff07ff98580010 x21: ffff07ff9=
85904c8
> [   13.080896] x20: ffff07ff985900e8 x19: ffff07ff98598580 x18: 000000000=
0000006
> [   13.088020] x17: 0000000000000020 x16: ffffbb510d0d7140 x15: fffffffff=
ffffefb
> [   13.095145] x14: 0000000000000000 x13: 2e64656465656e20 x12: ffff07ff8=
c7fd9e0
> [   13.102268] x11: 00000000000003e8 x10: ffff07ff8c7fd9e0 x9 : ffffbb50a=
c3345e0
> [   13.109392] x8 : ffffbb50abf18000 x7 : 0000000000000000 x6 : 000000007=
a456104
> [   13.116516] x5 : 0000000000000000 x4 : ffff07ff98580000 x3 : 000000000=
0000000
> [   13.123641] x2 : 0000000000000000 x1 : ffff07ff985a78f0 x0 : ffff07ffc=
5fd4000
> [   13.130765] Call trace:
> [   13.133200]  amdgpu_irq_put+0xa8/0xc8 [amdgpu]
> [   13.138121]  amdgpu_device_fini_hw+0xb8/0x380 [amdgpu]
> [   13.143732]  amdgpu_driver_unload_kms+0x54/0x80 [amdgpu]
> [   13.149517]  amdgpu_driver_load_kms+0x100/0x1c0 [amdgpu]
> [   13.155301]  amdgpu_pci_probe+0x134/0x428 [amdgpu]
> [   13.160564]  local_pci_probe+0x48/0xb8
> [   13.164305]  work_for_cpu_fn+0x24/0x40
> [   13.168043]  process_one_work+0x170/0x3d0
> [   13.172042]  worker_thread+0x2bc/0x3e0
> [   13.175781]  kthread+0x118/0x128
> [   13.178999]  ret_from_fork+0x10/0x20
> [   13.182564] ---[ end trace 0000000000000000 ]---
> ...
> [   16.984679] amdgpu: probe of 000d:03:00.0 failed with error -110
>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Fixes: 1cfb4d612127 drm/amdgpu: put MQDs in VRAM
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 9 ++-------
>  drivers/gpu/drm/amd/amdgpu/mes_v10_1.c  | 1 -
>  drivers/gpu/drm/amd/amdgpu/mes_v11_0.c  | 1 -
>  3 files changed, 2 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gfx.c
> index 2382921710ec..1f2d8be0fc44 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> @@ -382,11 +382,6 @@ int amdgpu_gfx_mqd_sw_init(struct amdgpu_device *ade=
v,
>         int r, i, j;
>         struct amdgpu_kiq *kiq =3D &adev->gfx.kiq[xcc_id];
>         struct amdgpu_ring *ring =3D &kiq->ring;
> -       u32 domain =3D AMDGPU_GEM_DOMAIN_GTT;
> -
> -       /* Only enable on gfx10 and 11 for now to avoid changing behavior=
 on older chips */
> -       if (adev->ip_versions[GC_HWIP][0] >=3D IP_VERSION(10, 0, 0))
> -               domain |=3D AMDGPU_GEM_DOMAIN_VRAM;

Just removing the addition of the AMDGPU_GEM_DOMAIN_VRAM domain here
will revert the behavior.  Since this is an important optimization and
we aren't seeing any issues on x86, I'd prefer to just limit your arch
to GTT if we can't resolve it some other way.

Try patch 1 and if that doesn't work we can fall back to some variant
of patch 2.

Alex

>
>         /* create MQD for KIQ */
>         if (!adev->enable_mes_kiq && !ring->mqd_obj) {
> @@ -421,7 +416,7 @@ int amdgpu_gfx_mqd_sw_init(struct amdgpu_device *adev=
,
>                         ring =3D &adev->gfx.gfx_ring[i];
>                         if (!ring->mqd_obj) {
>                                 r =3D amdgpu_bo_create_kernel(adev, mqd_s=
ize, PAGE_SIZE,
> -                                                           domain, &ring=
->mqd_obj,
> +                                                           AMDGPU_GEM_DO=
MAIN_GTT, &ring->mqd_obj,
>                                                             &ring->mqd_gp=
u_addr, &ring->mqd_ptr);
>                                 if (r) {
>                                         dev_warn(adev->dev, "failed to cr=
eate ring mqd bo (%d)", r);
> @@ -445,7 +440,7 @@ int amdgpu_gfx_mqd_sw_init(struct amdgpu_device *adev=
,
>                 ring =3D &adev->gfx.compute_ring[j];
>                 if (!ring->mqd_obj) {
>                         r =3D amdgpu_bo_create_kernel(adev, mqd_size, PAG=
E_SIZE,
> -                                                   domain, &ring->mqd_ob=
j,
> +                                                   AMDGPU_GEM_DOMAIN_GTT=
, &ring->mqd_obj,
>                                                     &ring->mqd_gpu_addr, =
&ring->mqd_ptr);
>                         if (r) {
>                                 dev_warn(adev->dev, "failed to create rin=
g mqd bo (%d)", r);
> diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c b/drivers/gpu/drm/amd=
/amdgpu/mes_v10_1.c
> index eb06d749876f..080e7eb3f98d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
> @@ -898,7 +898,6 @@ static int mes_v10_1_mqd_sw_init(struct amdgpu_device=
 *adev,
>                 return 0;
>
>         r =3D amdgpu_bo_create_kernel(adev, mqd_size, PAGE_SIZE,
> -                                   AMDGPU_GEM_DOMAIN_VRAM |
>                                     AMDGPU_GEM_DOMAIN_GTT, &ring->mqd_obj=
,
>                                     &ring->mqd_gpu_addr, &ring->mqd_ptr);
>         if (r) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd=
/amdgpu/mes_v11_0.c
> index 6827d547042e..0608710306b8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
> @@ -1004,7 +1004,6 @@ static int mes_v11_0_mqd_sw_init(struct amdgpu_devi=
ce *adev,
>                 return 0;
>
>         r =3D amdgpu_bo_create_kernel(adev, mqd_size, PAGE_SIZE,
> -                                   AMDGPU_GEM_DOMAIN_VRAM |
>                                     AMDGPU_GEM_DOMAIN_GTT, &ring->mqd_obj=
,
>                                     &ring->mqd_gpu_addr, &ring->mqd_ptr);
>         if (r) {
> --
> 2.42.0
>

--000000000000c7b4c10608a3177c
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-drm-amdgpu-gfx10-11-use-memcpy_to-fromio-for-MQDs.patch"
Content-Disposition: attachment; 
	filename="0001-drm-amdgpu-gfx10-11-use-memcpy_to-fromio-for-MQDs.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lo7jkusv1>
X-Attachment-Id: f_lo7jkusv1

RnJvbSA1MzIxOWY4Y2JjZjUwNTIxODUwYzU0MjE2MzEzMjY3OGIyMTE0MjY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkRhdGU6IFRodSwgMjYgT2N0IDIwMjMgMTQ6NDc6NTcgLTA0MDAKU3ViamVjdDogW1BBVENI
IDEvMl0gZHJtL2FtZGdwdS9nZngxMCwxMTogdXNlIG1lbWNweV90by9mcm9taW8gZm9yIE1RRHMK
ClNpbmNlIHRoZXkgd2VyZSBtb3ZlZCB0byBWUkFNLCB3ZSBuZWVkIHRvIHVzZSB0aGUgSU8KdmFy
aWFudHMgb2YgbWVtY3B5LgoKRml4ZXM6IDFjZmI0ZDYxMjEyNyAoImRybS9hbWRncHU6IHB1dCBN
UURzIGluIFZSQU0iKQpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMg
fCAxMiArKysrKystLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTFfMC5j
IHwgMTIgKysrKysrLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dm
eF92MTBfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKaW5kZXgg
OTAzMmQ3YTI0ZDdjLi4zMDYyNTJjZDY3ZmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dmeF92MTBfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dm
eF92MTBfMC5jCkBAIC02NDU3LDExICs2NDU3LDExIEBAIHN0YXRpYyBpbnQgZ2Z4X3YxMF8wX2dm
eF9pbml0X3F1ZXVlKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykKIAkJbnZfZ3JibV9zZWxlY3Qo
YWRldiwgMCwgMCwgMCwgMCk7CiAJCW11dGV4X3VubG9jaygmYWRldi0+c3JibV9tdXRleCk7CiAJ
CWlmIChhZGV2LT5nZngubWUubXFkX2JhY2t1cFttcWRfaWR4XSkKLQkJCW1lbWNweShhZGV2LT5n
ZngubWUubXFkX2JhY2t1cFttcWRfaWR4XSwgbXFkLCBzaXplb2YoKm1xZCkpOworCQkJbWVtY3B5
X2Zyb21pbyhhZGV2LT5nZngubWUubXFkX2JhY2t1cFttcWRfaWR4XSwgbXFkLCBzaXplb2YoKm1x
ZCkpOwogCX0gZWxzZSB7CiAJCS8qIHJlc3RvcmUgbXFkIHdpdGggdGhlIGJhY2t1cCBjb3B5ICov
CiAJCWlmIChhZGV2LT5nZngubWUubXFkX2JhY2t1cFttcWRfaWR4XSkKLQkJCW1lbWNweShtcWQs
IGFkZXYtPmdmeC5tZS5tcWRfYmFja3VwW21xZF9pZHhdLCBzaXplb2YoKm1xZCkpOworCQkJbWVt
Y3B5X3RvaW8obXFkLCBhZGV2LT5nZngubWUubXFkX2JhY2t1cFttcWRfaWR4XSwgc2l6ZW9mKCpt
cWQpKTsKIAkJLyogcmVzZXQgdGhlIHJpbmcgKi8KIAkJcmluZy0+d3B0ciA9IDA7CiAJCSpyaW5n
LT53cHRyX2NwdV9hZGRyID0gMDsKQEAgLTY3MzUsNyArNjczNSw3IEBAIHN0YXRpYyBpbnQgZ2Z4
X3YxMF8wX2tpcV9pbml0X3F1ZXVlKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykKIAlpZiAoYW1k
Z3B1X2luX3Jlc2V0KGFkZXYpKSB7IC8qIGZvciBHUFVfUkVTRVQgY2FzZSAqLwogCQkvKiByZXNl
dCBNUUQgdG8gYSBjbGVhbiBzdGF0dXMgKi8KIAkJaWYgKGFkZXYtPmdmeC5raXFbMF0ubXFkX2Jh
Y2t1cCkKLQkJCW1lbWNweShtcWQsIGFkZXYtPmdmeC5raXFbMF0ubXFkX2JhY2t1cCwgc2l6ZW9m
KCptcWQpKTsKKwkJCW1lbWNweV90b2lvKG1xZCwgYWRldi0+Z2Z4LmtpcVswXS5tcWRfYmFja3Vw
LCBzaXplb2YoKm1xZCkpOwogCiAJCS8qIHJlc2V0IHJpbmcgYnVmZmVyICovCiAJCXJpbmctPndw
dHIgPSAwOwpAQCAtNjc1OCw3ICs2NzU4LDcgQEAgc3RhdGljIGludCBnZnhfdjEwXzBfa2lxX2lu
aXRfcXVldWUoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQogCQltdXRleF91bmxvY2soJmFkZXYt
PnNyYm1fbXV0ZXgpOwogCiAJCWlmIChhZGV2LT5nZngua2lxWzBdLm1xZF9iYWNrdXApCi0JCQlt
ZW1jcHkoYWRldi0+Z2Z4LmtpcVswXS5tcWRfYmFja3VwLCBtcWQsIHNpemVvZigqbXFkKSk7CisJ
CQltZW1jcHlfZnJvbWlvKGFkZXYtPmdmeC5raXFbMF0ubXFkX2JhY2t1cCwgbXFkLCBzaXplb2Yo
Km1xZCkpOwogCX0KIAogCXJldHVybiAwOwpAQCAtNjc3OSwxMSArNjc3OSwxMSBAQCBzdGF0aWMg
aW50IGdmeF92MTBfMF9rY3FfaW5pdF9xdWV1ZShzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpCiAJ
CW11dGV4X3VubG9jaygmYWRldi0+c3JibV9tdXRleCk7CiAKIAkJaWYgKGFkZXYtPmdmeC5tZWMu
bXFkX2JhY2t1cFttcWRfaWR4XSkKLQkJCW1lbWNweShhZGV2LT5nZngubWVjLm1xZF9iYWNrdXBb
bXFkX2lkeF0sIG1xZCwgc2l6ZW9mKCptcWQpKTsKKwkJCW1lbWNweV9mcm9taW8oYWRldi0+Z2Z4
Lm1lYy5tcWRfYmFja3VwW21xZF9pZHhdLCBtcWQsIHNpemVvZigqbXFkKSk7CiAJfSBlbHNlIHsK
IAkJLyogcmVzdG9yZSBNUUQgdG8gYSBjbGVhbiBzdGF0dXMgKi8KIAkJaWYgKGFkZXYtPmdmeC5t
ZWMubXFkX2JhY2t1cFttcWRfaWR4XSkKLQkJCW1lbWNweShtcWQsIGFkZXYtPmdmeC5tZWMubXFk
X2JhY2t1cFttcWRfaWR4XSwgc2l6ZW9mKCptcWQpKTsKKwkJCW1lbWNweV90b2lvKG1xZCwgYWRl
di0+Z2Z4Lm1lYy5tcWRfYmFja3VwW21xZF9pZHhdLCBzaXplb2YoKm1xZCkpOwogCQkvKiByZXNl
dCByaW5nIGJ1ZmZlciAqLwogCQlyaW5nLT53cHRyID0gMDsKIAkJYXRvbWljNjRfc2V0KChhdG9t
aWM2NF90ICopcmluZy0+d3B0cl9jcHVfYWRkciwgMCk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nZnhfdjExXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dmeF92MTFfMC5jCmluZGV4IDc2MmQ3YTE5ZjFiZS4uNDNkMDY2YmM1MjQ1IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjExXzAuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nZnhfdjExXzAuYwpAQCAtMzY4NCwxMSArMzY4NCwxMSBAQCBzdGF0
aWMgaW50IGdmeF92MTFfMF9nZnhfaW5pdF9xdWV1ZShzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcp
CiAJCXNvYzIxX2dyYm1fc2VsZWN0KGFkZXYsIDAsIDAsIDAsIDApOwogCQltdXRleF91bmxvY2so
JmFkZXYtPnNyYm1fbXV0ZXgpOwogCQlpZiAoYWRldi0+Z2Z4Lm1lLm1xZF9iYWNrdXBbbXFkX2lk
eF0pCi0JCQltZW1jcHkoYWRldi0+Z2Z4Lm1lLm1xZF9iYWNrdXBbbXFkX2lkeF0sIG1xZCwgc2l6
ZW9mKCptcWQpKTsKKwkJCW1lbWNweV9mcm9taW8oYWRldi0+Z2Z4Lm1lLm1xZF9iYWNrdXBbbXFk
X2lkeF0sIG1xZCwgc2l6ZW9mKCptcWQpKTsKIAl9IGVsc2UgewogCQkvKiByZXN0b3JlIG1xZCB3
aXRoIHRoZSBiYWNrdXAgY29weSAqLwogCQlpZiAoYWRldi0+Z2Z4Lm1lLm1xZF9iYWNrdXBbbXFk
X2lkeF0pCi0JCQltZW1jcHkobXFkLCBhZGV2LT5nZngubWUubXFkX2JhY2t1cFttcWRfaWR4XSwg
c2l6ZW9mKCptcWQpKTsKKwkJCW1lbWNweV90b2lvKG1xZCwgYWRldi0+Z2Z4Lm1lLm1xZF9iYWNr
dXBbbXFkX2lkeF0sIHNpemVvZigqbXFkKSk7CiAJCS8qIHJlc2V0IHRoZSByaW5nICovCiAJCXJp
bmctPndwdHIgPSAwOwogCQkqcmluZy0+d3B0cl9jcHVfYWRkciA9IDA7CkBAIC0zOTc3LDcgKzM5
NzcsNyBAQCBzdGF0aWMgaW50IGdmeF92MTFfMF9raXFfaW5pdF9xdWV1ZShzdHJ1Y3QgYW1kZ3B1
X3JpbmcgKnJpbmcpCiAJaWYgKGFtZGdwdV9pbl9yZXNldChhZGV2KSkgeyAvKiBmb3IgR1BVX1JF
U0VUIGNhc2UgKi8KIAkJLyogcmVzZXQgTVFEIHRvIGEgY2xlYW4gc3RhdHVzICovCiAJCWlmIChh
ZGV2LT5nZngua2lxWzBdLm1xZF9iYWNrdXApCi0JCQltZW1jcHkobXFkLCBhZGV2LT5nZngua2lx
WzBdLm1xZF9iYWNrdXAsIHNpemVvZigqbXFkKSk7CisJCQltZW1jcHlfdG9pbyhtcWQsIGFkZXYt
PmdmeC5raXFbMF0ubXFkX2JhY2t1cCwgc2l6ZW9mKCptcWQpKTsKIAogCQkvKiByZXNldCByaW5n
IGJ1ZmZlciAqLwogCQlyaW5nLT53cHRyID0gMDsKQEAgLTQwMDAsNyArNDAwMCw3IEBAIHN0YXRp
YyBpbnQgZ2Z4X3YxMV8wX2tpcV9pbml0X3F1ZXVlKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykK
IAkJbXV0ZXhfdW5sb2NrKCZhZGV2LT5zcmJtX211dGV4KTsKIAogCQlpZiAoYWRldi0+Z2Z4Lmtp
cVswXS5tcWRfYmFja3VwKQotCQkJbWVtY3B5KGFkZXYtPmdmeC5raXFbMF0ubXFkX2JhY2t1cCwg
bXFkLCBzaXplb2YoKm1xZCkpOworCQkJbWVtY3B5X2Zyb21pbyhhZGV2LT5nZngua2lxWzBdLm1x
ZF9iYWNrdXAsIG1xZCwgc2l6ZW9mKCptcWQpKTsKIAl9CiAKIAlyZXR1cm4gMDsKQEAgLTQwMjEs
MTEgKzQwMjEsMTEgQEAgc3RhdGljIGludCBnZnhfdjExXzBfa2NxX2luaXRfcXVldWUoc3RydWN0
IGFtZGdwdV9yaW5nICpyaW5nKQogCQltdXRleF91bmxvY2soJmFkZXYtPnNyYm1fbXV0ZXgpOwog
CiAJCWlmIChhZGV2LT5nZngubWVjLm1xZF9iYWNrdXBbbXFkX2lkeF0pCi0JCQltZW1jcHkoYWRl
di0+Z2Z4Lm1lYy5tcWRfYmFja3VwW21xZF9pZHhdLCBtcWQsIHNpemVvZigqbXFkKSk7CisJCQlt
ZW1jcHlfZnJvbWlvKGFkZXYtPmdmeC5tZWMubXFkX2JhY2t1cFttcWRfaWR4XSwgbXFkLCBzaXpl
b2YoKm1xZCkpOwogCX0gZWxzZSB7CiAJCS8qIHJlc3RvcmUgTVFEIHRvIGEgY2xlYW4gc3RhdHVz
ICovCiAJCWlmIChhZGV2LT5nZngubWVjLm1xZF9iYWNrdXBbbXFkX2lkeF0pCi0JCQltZW1jcHko
bXFkLCBhZGV2LT5nZngubWVjLm1xZF9iYWNrdXBbbXFkX2lkeF0sIHNpemVvZigqbXFkKSk7CisJ
CQltZW1jcHlfdG9pbyhtcWQsIGFkZXYtPmdmeC5tZWMubXFkX2JhY2t1cFttcWRfaWR4XSwgc2l6
ZW9mKCptcWQpKTsKIAkJLyogcmVzZXQgcmluZyBidWZmZXIgKi8KIAkJcmluZy0+d3B0ciA9IDA7
CiAJCWF0b21pYzY0X3NldCgoYXRvbWljNjRfdCAqKXJpbmctPndwdHJfY3B1X2FkZHIsIDApOwot
LSAKMi40MS4wCgo=
--000000000000c7b4c10608a3177c
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0002-drm-amdgpu-don-t-put-MQDs-in-VRAM-on-ARM-ARM64.patch"
Content-Disposition: attachment; 
	filename="0002-drm-amdgpu-don-t-put-MQDs-in-VRAM-on-ARM-ARM64.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lo7jkus30>
X-Attachment-Id: f_lo7jkus30

RnJvbSA1YWU3OTFjNzlkZTVjYjA1NWYzODFmOWMyN2ExYWVjM2I3ZjAwMTYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkRhdGU6IFRodSwgMjYgT2N0IDIwMjMgMTQ6Mzc6MzEgLTA0MDAKU3ViamVjdDogW1BBVENI
IDIvMl0gZHJtL2FtZGdwdTogZG9uJ3QgcHV0IE1RRHMgaW4gVlJBTSBvbiBBUk0gfCBBUk02NAoK
U2VlbXMgdG8gYmUgc29tZSBjb2hlcmVuY3kgaXNzdWU/CgpGaXhlczogMWNmYjRkNjEyMTI3ICgi
ZHJtL2FtZGdwdTogcHV0IE1RRHMgaW4gVlJBTSIpClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZ2Z4LmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5jCmluZGV4IDIzODI5MjE3MTBl
Yy4uZWY0Y2I5MjE3ODFkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZ2Z4LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5j
CkBAIC0zODQsOSArMzg0LDExIEBAIGludCBhbWRncHVfZ2Z4X21xZF9zd19pbml0KHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LAogCXN0cnVjdCBhbWRncHVfcmluZyAqcmluZyA9ICZraXEtPnJp
bmc7CiAJdTMyIGRvbWFpbiA9IEFNREdQVV9HRU1fRE9NQUlOX0dUVDsKIAorI2lmICFkZWZpbmVk
KENPTkZJR19BUk0pICYmICFkZWZpbmVkKENPTkZJR19BUk02NCkKIAkvKiBPbmx5IGVuYWJsZSBv
biBnZngxMCBhbmQgMTEgZm9yIG5vdyB0byBhdm9pZCBjaGFuZ2luZyBiZWhhdmlvciBvbiBvbGRl
ciBjaGlwcyAqLwogCWlmIChhZGV2LT5pcF92ZXJzaW9uc1tHQ19IV0lQXVswXSA+PSBJUF9WRVJT
SU9OKDEwLCAwLCAwKSkKIAkJZG9tYWluIHw9IEFNREdQVV9HRU1fRE9NQUlOX1ZSQU07CisjZW5k
aWYKIAogCS8qIGNyZWF0ZSBNUUQgZm9yIEtJUSAqLwogCWlmICghYWRldi0+ZW5hYmxlX21lc19r
aXEgJiYgIXJpbmctPm1xZF9vYmopIHsKLS0gCjIuNDEuMAoK
--000000000000c7b4c10608a3177c--
