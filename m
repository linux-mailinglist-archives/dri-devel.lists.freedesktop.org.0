Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC8DA074EF
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 12:40:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4D110ED66;
	Thu,  9 Jan 2025 11:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bcu5+lxr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 935C310E366;
 Thu,  9 Jan 2025 11:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736422847; x=1767958847;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=T80S+yxQ/RqsGrGT1wR4sGgHuW6WyFlx/IXOevajixg=;
 b=bcu5+lxrXH7weEOEn/0vVeegbFTOasxiOE07Yql4S6ij15qeKQgWNjaC
 gDnSD1/a6YIkGIEtv/nlVtpd78cHx96+XcWwMb3auc7R02519oZybiswe
 b56lrbnjx89eVH26icVaI8GT0fblsZlBAX3fLW845WekJ1bjkD4OxyEiY
 jYI1Doacfzo3e6mRPDzN8ruApbZURE+dJ6n0KpBeOJJThGFiTtaXLuc88
 d2c24aX3oKsu366632SZd/XBBchn6us+jyIx+G6ZVytc553WgckUUUeuU
 H0JhNfLmx5p54WStAkmIJJL9/plP0kQn9u3oC6My0GSYn0MVVD9w2BFCz w==;
X-CSE-ConnectionGUID: NsBUEdeQTbOzYxH3edQGyw==
X-CSE-MsgGUID: hz/K5Y7kScqhQc3Rfz+MEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="35902086"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; d="scan'208";a="35902086"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 03:40:47 -0800
X-CSE-ConnectionGUID: bIGVgS6TQYKghfkCO2GGQA==
X-CSE-MsgGUID: rO8phZF5Q0CnHrFOFvb74Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; d="scan'208";a="103451015"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.195])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 03:40:41 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250108105346.240103-1-jacek.lawrynowicz@linux.intel.com>
References: <20250108105346.240103-1-jacek.lawrynowicz@linux.intel.com>
Subject: Re: [PATCH] drm/i915: Add VM_DONTEXPAND to exported buffers
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, karol.wachowski@intel.com,
 tomasz.rusinowicz@intel.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 09 Jan 2025 13:40:37 +0200
Message-ID: <173642283773.28201.13348625605034220367@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.10
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Could you elaborate a bit more on which testcase or usecase this pops up wi=
th?

The check has been in place since 2019 so quite surprising that it's
only popping up now.

Regards, Joonas

Quoting Jacek Lawrynowicz (2025-01-08 12:53:46)
> drm_gem_mmap_obj() expects VM_DONTEXPAND flag to be set after mmap
> callback is executed. Set this flag at the end of i915_gem_dmabuf_mmap()
> to prevent WARN on mmap in buffers imported from i915 e.g.,
>=20
> [  283.623215] WARNING: CPU: 1 PID: 12693 at drivers/gpu/drm/drm_gem.c:10=
87 drm_gem_mmap_obj+0x196/0x1c0
> [  283.623221] Modules linked in: intel_vpu(OE) cmac nls_utf8 cifs cifs_a=
rc4 nls_ucs2_utils cifs_md4 netfs overlay nls_iso8859_1 binfmt_misc intel_u=
ncore_frequency intel_uncore_frequency_common x86_pkg_temp_thermal intel_po=
werclamp intel_rapl_msr coretemp rapl intel_cstate kvm_intel wmi_bmof input=
_leds kvm processor_thermal_device_pci processor_thermal_device processor_t=
hermal_wt_hint processor_thermal_rfim processor_thermal_rapl intel_rapl_com=
mon processor_thermal_wt_req intel_vsec processor_thermal_stc processor_the=
rmal_power_floor igen6_edac processor_thermal_mbox pac1934 industrialio int=
3403_thermal int340x_thermal_zone intel_pmc_core int3400_thermal pmt_teleme=
try intel_hid pmt_class acpi_thermal_rel sparse_keymap acpi_tad acpi_pad ef=
i_pstore autofs4 btrfs blake2b_generic raid10 raid456 async_raid6_recov asy=
nc_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c raid1 raid0 xe=
 drm_ttm_helper drm_suballoc_helper drm_gpuvm drm_exec hid_sensor_custom hi=
d_sensor_hub intel_ishtp_hid hid_generic usbhid hid i915
> [  283.623254]  crct10dif_pclmul i2c_algo_bit crc32_pclmul drm_buddy ghas=
h_clmulni_intel ttm sha512_ssse3 sha256_ssse3 e1000e drm_display_helper nvm=
e sha1_ssse3 intel_lpss_pci thunderbolt intel_ish_ipc intel_lpss vmd intel_=
ishtp idma64 nvme_core drm_kms_helper video wmi pinctrl_meteorlake backligh=
t pinctrl_intel aesni_intel crypto_simd cryptd [last unloaded: intel_vpu(OE=
)]
> [  283.623267] CPU: 1 UID: 0 PID: 12693 Comm: npu-kmd-test Tainted: G    =
 U     OE      6.12.0-performance-20241122-11972534541 #1 f86ee8132c283cf15=
8e9fd89cc84f4adeb3b79b7
> [  283.623269] Tainted: [U]=3DUSER, [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODU=
LE
> [  283.623270] Hardware name: Intel Corporation Meteor Lake Client Platfo=
rm/MTL-P DDR5 SODIMM SBS RVP, BIOS MTLPFWI1.R00.4122.D21.2408281317 08/28/2=
024
> [  283.623271] RIP: 0010:drm_gem_mmap_obj+0x196/0x1c0
> [  283.623273] Code: 49 8b 94 24 40 01 00 00 48 8b 12 48 85 d2 74 31 89 4=
5 ec 4c 89 e7 ff d2 0f 1f 00 8b 45 ec e9 f8 fe ff ff 0f 0b e9 54 ff ff ff <=
0f> 0b e9 ea fe ff ff b8 ea ff ff ff 31 d2 31 f6 31 ff c3 cc cc cc
> [  283.623274] RSP: 0018:ffffc90004103b20 EFLAGS: 00010246
> [  283.623275] RAX: 0000000000000000 RBX: ffff888313ebafd0 RCX: 000000000=
0000000
> [  283.623276] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000000000=
0000000
> [  283.623276] RBP: ffffc90004103b38 R08: 0000000000000000 R09: ffffc9000=
4103bd8
> [  283.623277] R10: 0000000000000000 R11: 0000000000000000 R12: ffff88810=
8b95400
> [  283.623277] R13: ffff888108b95400 R14: ffff88815ee50000 R15: ffff88830=
133b000
> [  283.623278] FS:  00007fcbf9063740(0000) GS:ffff88846fe40000(0000) knlG=
S:0000000000000000
> [  283.623279] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  283.623280] CR2: 00007fcbeb15d460 CR3: 00000001076a2002 CR4: 000000000=
0f72ef0
> [  283.623280] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000000=
0000000
> [  283.623281] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 000000000=
0000400
> [  283.623281] PKRU: 55555554
> [  283.623282] Call Trace:
> [  283.623283]  <TASK>
> [  283.623285]  ? show_regs+0x75/0x90
> [  283.623289]  ? __warn+0x91/0x150
> [  283.623291]  ? drm_gem_mmap_obj+0x196/0x1c0
> [  283.623292]  ? report_bug+0x1af/0x1c0
> [  283.623295]  ? handle_bug+0x6e/0xb0
> [  283.623297]  ? exc_invalid_op+0x1d/0x90
> [  283.623298]  ? asm_exc_invalid_op+0x1f/0x30
> [  283.623302]  ? drm_gem_mmap_obj+0x196/0x1c0
> [  283.623304]  drm_gem_mmap+0x125/0x200
> [  283.623305]  __mmap_region+0x7bc/0xc30
> [  283.623310]  mmap_region+0x96/0xd0
> [  283.623311]  do_mmap+0x526/0x650
> [  283.623313]  vm_mmap_pgoff+0xec/0x1c0
> [  283.623315]  ? __count_memcg_events+0x89/0x160
> [  283.623317]  ksys_mmap_pgoff+0x175/0x230
> [  283.623318]  __x64_sys_mmap+0x37/0x70
> [  283.623320]  x64_sys_call+0x1c1d/0x2790
> [  283.623322]  do_syscall_64+0x62/0x180
> [  283.623324]  entry_SYSCALL_64_after_hwframe+0x71/0x79
> [  283.623325] RIP: 0033:0x7fcbf8b1ea27
> [  283.623327] Code: 00 00 00 89 ef e8 59 ae ff ff eb e4 e8 42 7b 01 00 6=
6 90 f3 0f 1e fa 41 89 ca 41 f7 c1 ff 0f 00 00 75 10 b8 09 00 00 00 0f 05 <=
48> 3d 00 f0 ff ff 77 21 c3 48 8b 05 d9 b3 0f 00 64 c7 00 16 00 00
> [  283.623328] RSP: 002b:00007fff157ded78 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000009
> [  283.623329] RAX: ffffffffffffffda RBX: 00007fff157dedf0 RCX: 00007fcbf=
8b1ea27
> [  283.623330] RDX: 0000000000000003 RSI: 0000000000002000 RDI: 000000000=
0000000
> [  283.623330] RBP: 00007fff157def80 R08: 0000000000000004 R09: 000000010=
418a000
> [  283.623331] R10: 0000000000000001 R11: 0000000000000246 R12: 00007fff1=
57dee70
> [  283.623331] R13: 0000644e2fb203f8 R14: 00007fff157deef0 R15: 00007fff1=
57deeb0
> [  283.623333]  </TASK>
> [  283.623333] ---[ end trace 0000000000000000 ]---
>=20
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm=
/i915/gem/i915_gem_dmabuf.c
> index 9473050ac8425..809018265e36f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> @@ -110,6 +110,7 @@ static int i915_gem_dmabuf_mmap(struct dma_buf *dma_b=
uf, struct vm_area_struct *
>         if (ret)
>                 return ret;
> =20
> +       vm_flags_set(vma, VM_DONTEXPAND);
>         vma_set_file(vma, obj->base.filp);
> =20
>         return 0;
> --=20
> 2.45.1
>
