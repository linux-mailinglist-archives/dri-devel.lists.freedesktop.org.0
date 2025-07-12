Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 137A6B02A02
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jul 2025 10:20:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A4B10E282;
	Sat, 12 Jul 2025 08:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="bryeh+uU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B347010E27F
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 08:19:58 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-455e6fb8057so13836615e9.3
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 01:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1752308397; x=1752913197;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7qvDr8K8ASqsZUPcq/duk4kJ/vCvMDS87IvVdEsGZFY=;
 b=bryeh+uUVh4hLZ2B4TbQeeGeu+9BTlGpKJ+F4HMoLQv8NI4xgJ03iAeFYN53/TvHaU
 ZIouiRNYYps2krvThnteX0YmKkwGqgy06UGlzNSJjO3PUWz1tSRdI0rAvbOc0t1LoXt8
 3sbpeOrEVgc854PwIGqm3e2vXzwuXUoPWluKGMK6v5xh2Wr2WCUnxWvvY0+fikDAxQRf
 jfgdjQvrTke0t/50qLlvGGS86wwJqhhdKuta1+Roggf2KPe3M7Ty7W3rQ6hleBDNSchR
 HgcIsQrVq5XmNTGprZdQzQD8VsthBQm7Gy+SOvgsH6WYOHlhNTUc8+9pg9uoqckg7dTo
 Abrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752308397; x=1752913197;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7qvDr8K8ASqsZUPcq/duk4kJ/vCvMDS87IvVdEsGZFY=;
 b=qsuVMMpw3dTLMLRKw2JicLtXcuVDrAPJTSea3zUWh4PCZYM5/2ghZWka1WigpicZF+
 n3tOdCEqLxBuJgrwwsLTt7pxek1jP+nmXpxmnOVzhtW4KTwdOBEXOaLU0XB98q+njYSF
 zY1gb8QT6EeMO5WuNz0Dn8lfnHoWqXOcgmK5wxk7iGDV59UIMYcZJCuWSwpxicoY3QIX
 HWfrl+RhuvKOxSefkuA8++ZFEUUvz9WqoKDIAPXjZyrnHVRdo0ViJ0B10KHo5G7fN1wG
 5xsOguqVfYw3gzY3PmFE+feyLN79V1dnveqbch/CCxHdt1rUYjDlMZzUO/uD0s6lem9G
 Pilg==
X-Gm-Message-State: AOJu0YwssiElOtC+XXGbUsDNW+EM0y07JQvg8MZWVoZJTlao7LgnKLW3
 7a2HmgW542iTuJ0ObpWNF+E3eiSlBVBNPvcwVt1MeZ3v0Wh729s8Xadof9wd+A==
X-Gm-Gg: ASbGncuc5GJD9G8kKpYZUiG9fDXiLyI3/N6OL27Q2Ko5NrJTzwUVAIjp1lkkaiJVwTw
 OARkhn9hH6hQ6RdR8Wnlbs5vNCzgOzT11tdWtcp7gSch1ekPIUh1GtULwN/KE2DxSEna3iJ83fl
 TJ7idEm/gCsbTAVWM9iSTnDR2HhfzRWlinx2iMa3JWQ0aPZdU4+bsRvj1cDikrZbaShqTCW3W+M
 FBzKB12m0lr97uosgKUKzbtsdUvHqGGUgWeMjngsSYvl5U/vKoTlV0Uwar7TZ14gSqC5yem706x
 DGrrsIi/bAtNdtRbDUnf7hTLy5/9SoNUy0dLlnM1IEYH9Ofw43C75yfb+YkyFBwWbu8V3hGtUKn
 03W97b4QGXTKIy4/fBusREKnGf0gV6S8a
X-Google-Smtp-Source: AGHT+IGHUszujIh4fEyF6vZdciQfpoUILSPSBhG3gzB75dabRQXymEWuCjOkSagowzXZwJMr5I+G1g==
X-Received: by 2002:a05:600c:3e83:b0:442:e9ec:4654 with SMTP id
 5b1f17b1804b1-454ec126e27mr51875705e9.8.1752308396469; 
 Sat, 12 Jul 2025 01:19:56 -0700 (PDT)
Received: from [192.168.1.10] ([176.25.125.80])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4560eb98a57sm1132535e9.33.2025.07.12.01.19.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Jul 2025 01:19:55 -0700 (PDT)
Message-ID: <ccfc22ad-0360-488d-a11a-bf5bb28b91d6@googlemail.com>
Date: Sat, 12 Jul 2025 09:19:49 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: Kernel 6.16-rc5+: New warning from drivers/gpu/drm/drm_gem.c
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
References: <ab1c1afc-f0fd-4108-9989-74f42233f4db@googlemail.com>
 <aHGIAdYuCx1fXoWv@phenom.ffwll.local>
Content-Language: en-GB
From: Chris Clayton <chris2553@googlemail.com>
In-Reply-To: <aHGIAdYuCx1fXoWv@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Thanks, Simona.

On 11/07/2025 22:54, Simona Vetter wrote:
> On Fri, Jul 11, 2025 at 01:34:19PM +0100, Chris Clayton wrote:
>> Hi
>>
>> I've built and installed 6.16 cloned from Linus' tree and am consistently getting a warning during system startup.
>> The warning is not produced by rc4 but is by rc5, so I've bisected between those two points abd the outcome is:
>>
>> 5307dce878d4126e1b375587318955bd019c3741 is the first bad commit
>> commit 5307dce878d4126e1b375587318955bd019c3741 (HEAD)
>> Author: Thomas Zimmermann <tzimmermann@suse.de>
>> Date:   Mon Jun 30 10:36:47 2025 +0200
>>
>>     drm/gem: Acquire references on GEM handles for framebuffers
> 
> Should be sorted with f6bfc9afc751 ("drm/framebuffer: Acquire internal
> references on GEM handles"), and I'll just about to type the PR summary to
> send that to Linus.
> -Sima
> 
I've just pulled, built and installed Linus's tree and can conform that the warning I reported is no longer being output.

Thanks again.

Chris>>
>>     A GEM handle can be released while the GEM buffer object is attached
>>     to a DRM framebuffer. This leads to the release of the dma-buf backing
>>     the buffer object, if any. [1] Trying to use the framebuffer in further
>>     mode-setting operations leads to a segmentation fault. Most easily
>>     happens with driver that use shadow planes for vmap-ing the dma-buf
>>     during a page flip. An example is shown below.
>>
>>     [  156.791968] ------------[ cut here ]------------
>>     [  156.796830] WARNING: CPU: 2 PID: 2255 at drivers/dma-buf/dma-buf.c:1527 dma_buf_vmap+0x224/0x430
>>     [...]
>>     [  156.942028] RIP: 0010:dma_buf_vmap+0x224/0x430
>>     [  157.043420] Call Trace:
>>     [  157.045898]  <TASK>
>>     [  157.048030]  ? show_trace_log_lvl+0x1af/0x2c0
>>     [  157.052436]  ? show_trace_log_lvl+0x1af/0x2c0
>>     [  157.056836]  ? show_trace_log_lvl+0x1af/0x2c0
>>     [  157.061253]  ? drm_gem_shmem_vmap+0x74/0x710
>>     [  157.065567]  ? dma_buf_vmap+0x224/0x430
>>     [  157.069446]  ? __warn.cold+0x58/0xe4
>>     [  157.073061]  ? dma_buf_vmap+0x224/0x430
>>     [  157.077111]  ? report_bug+0x1dd/0x390
>>     [  157.080842]  ? handle_bug+0x5e/0xa0
>>     [  157.084389]  ? exc_invalid_op+0x14/0x50
>>     [  157.088291]  ? asm_exc_invalid_op+0x16/0x20
>>     [  157.092548]  ? dma_buf_vmap+0x224/0x430
>>     [  157.096663]  ? dma_resv_get_singleton+0x6d/0x230
>>     [  157.101341]  ? __pfx_dma_buf_vmap+0x10/0x10
>>     [  157.105588]  ? __pfx_dma_resv_get_singleton+0x10/0x10
>>     [  157.110697]  drm_gem_shmem_vmap+0x74/0x710
>>     [  157.114866]  drm_gem_vmap+0xa9/0x1b0
>>     [  157.118763]  drm_gem_vmap_unlocked+0x46/0xa0
>>     [  157.123086]  drm_gem_fb_vmap+0xab/0x300
>>     [  157.126979]  drm_atomic_helper_prepare_planes.part.0+0x487/0xb10
>>     [  157.133032]  ? lockdep_init_map_type+0x19d/0x880
>>     [  157.137701]  drm_atomic_helper_commit+0x13d/0x2e0
>>     [  157.142671]  ? drm_atomic_nonblocking_commit+0xa0/0x180
>>     [  157.147988]  drm_mode_atomic_ioctl+0x766/0xe40
>>     [...]
>>     [  157.346424] ---[ end trace 0000000000000000 ]---
>>
>>     Acquiring GEM handles for the framebuffer's GEM buffer objects prevents
>>     this from happening. The framebuffer's cleanup later puts the handle
>>     references.
>>
>>     Commit 1a148af06000 ("drm/gem-shmem: Use dma_buf from GEM object
>>     instance") triggers the segmentation fault easily by using the dma-buf
>>     field more widely. The underlying issue with reference counting has
>>     been present before.
>>
>>     v2:
>>     - acquire the handle instead of the BO (Christian)
>>     - fix comment style (Christian)
>>     - drop the Fixes tag (Christian)
>>     - rename err_ gotos
>>     - add missing Link tag
>>
>>     Suggested-by: Christian König <christian.koenig@amd.com>
>>     Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>     Link: https://elixir.bootlin.com/linux/v6.15/source/drivers/gpu/drm/drm_gem.c#L241 # [1]
>>     Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>     Cc: Anusha Srivatsa <asrivats@redhat.com>
>>     Cc: Christian König <christian.koenig@amd.com>
>>     Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>     Cc: Maxime Ripard <mripard@kernel.org>
>>     Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>     Cc: "Christian König" <christian.koenig@amd.com>
>>     Cc: linux-media@vger.kernel.org
>>     Cc: dri-devel@lists.freedesktop.org
>>     Cc: linaro-mm-sig@lists.linaro.org
>>     Cc: <stable@vger.kernel.org>
>>     Reviewed-by: Christian König <christian.koenig@amd.com>
>>     Link: https://lore.kernel.org/r/20250630084001.293053-1-tzimmermann@suse.de
>>
>>  drivers/gpu/drm/drm_gem.c                    | 44 ++++++++++++++++++++++++++++++++++++++++----
>>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 16 +++++++++-------
>>  drivers/gpu/drm/drm_internal.h               |  2 ++
>>  3 files changed, 51 insertions(+), 11 deletions(-)
>>
>> I've attached files that contain a full dmesg and the bisect log.
>>
>> If you require any additional diagnostics, just let me know, but please cc me as I'm not subscribed.
>>
>> Chris
> 
>> [    0.000000] Linux version 6.16.0-rc1+ (chris@laptop) (gcc (GCC) 15.1.1 20250705, GNU ld (GNU Binutils) 2.44) #688 SMP PREEMPT_DYNAMIC Fri Jul 11 12:33:57 BST 2025
>> [    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-6.16.0-rc1+ ro root=PARTUUID=f927883a-e95c-4cdd-b64e-a0a778216b9f resume=PARTUUID=70ccedc5-d788-42bc-9f13-81e2beb61338 rootfstype=ext4 net.ifnames=0 video=1920x1080@60
>> [    0.000000] BIOS-provided physical RAM map:
>> [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009efff] usable
>> [    0.000000] BIOS-e820: [mem 0x000000000009f000-0x00000000000fffff] reserved
>> [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000007e1d8fff] usable
>> [    0.000000] BIOS-e820: [mem 0x000000007e1d9000-0x000000007ead8fff] reserved
>> [    0.000000] BIOS-e820: [mem 0x000000007ead9000-0x000000008cceefff] usable
>> [    0.000000] BIOS-e820: [mem 0x000000008ccef000-0x000000008eedefff] reserved
>> [    0.000000] BIOS-e820: [mem 0x000000008eedf000-0x000000008fbcefff] ACPI NVS
>> [    0.000000] BIOS-e820: [mem 0x000000008fbcf000-0x000000008fc4efff] ACPI data
>> [    0.000000] BIOS-e820: [mem 0x000000008fc4f000-0x000000008fc4ffff] usable
>> [    0.000000] BIOS-e820: [mem 0x000000008fc50000-0x000000009d7fffff] reserved
>> [    0.000000] BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] reserved
>> [    0.000000] BIOS-e820: [mem 0x00000000fe000000-0x00000000fe010fff] reserved
>> [    0.000000] BIOS-e820: [mem 0x00000000fed10000-0x00000000fed19fff] reserved
>> [    0.000000] BIOS-e820: [mem 0x00000000fed84000-0x00000000fed84fff] reserved
>> [    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reserved
>> [    0.000000] BIOS-e820: [mem 0x00000000ff400000-0x00000000ffffffff] reserved
>> [    0.000000] BIOS-e820: [mem 0x0000000100000000-0x00000008607fffff] usable
>> [    0.000000] NX (Execute Disable) protection: active
>> [    0.000000] APIC: Static calls initialized
>> [    0.000000] efi: EFI v2.7 by INSYDE Corp.
>> [    0.000000] efi: ACPI=0x8fc4e000 ACPI 2.0=0x8fc4e014 TPMFinalLog=0x8fbc5000 SMBIOS=0x8d1e4000 SMBIOS 3.0=0x8d1e2000 ESRT=0x8d1e5998 MEMATTR=0x79e9f018 INITRD=0x79e61b18 RNG=0x8fbf6018 TPMEventLog=0x8fbf2018 
>> [    0.000000] random: crng init done
>> [    0.000000] efi: Remove mem69: MMIO range=[0xe0000000-0xefffffff] (256MB) from e820 map
>> [    0.000000] e820: remove [mem 0xe0000000-0xefffffff] reserved
>> [    0.000000] efi: Not removing mem70: MMIO range=[0xfe000000-0xfe010fff] (68KB) from e820 map
>> [    0.000000] efi: Not removing mem71: MMIO range=[0xfed10000-0xfed19fff] (40KB) from e820 map
>> [    0.000000] efi: Not removing mem72: MMIO range=[0xfed84000-0xfed84fff] (4KB) from e820 map
>> [    0.000000] efi: Not removing mem73: MMIO range=[0xfee00000-0xfee00fff] (4KB) from e820 map
>> [    0.000000] efi: Remove mem74: MMIO range=[0xff400000-0xffffffff] (12MB) from e820 map
>> [    0.000000] e820: remove [mem 0xff400000-0xffffffff] reserved
>> [    0.000000] SMBIOS 3.2.0 present.
>> [    0.000000] DMI: Notebook                         NP50DE_DB                       /NP50DE_DB                       , BIOS 1.07.04 02/17/2020
>> [    0.000000] DMI: Memory slots populated: 2/2
>> [    0.000000] tsc: Detected 2600.000 MHz processor
>> [    0.000000] tsc: Detected 2599.992 MHz TSC
>> [    0.000007] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
>> [    0.000009] e820: remove [mem 0x000a0000-0x000fffff] usable
>> [    0.000017] last_pfn = 0x860800 max_arch_pfn = 0x400000000
>> [    0.000021] MTRR map: 5 entries (3 fixed + 2 variable; max 23), built from 10 variable MTRRs
>> [    0.000023] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
>> [    0.000320] last_pfn = 0x8fc50 max_arch_pfn = 0x400000000
>> [    0.008312] esrt: Reserving ESRT space from 0x000000008d1e5998 to 0x000000008d1e5a48.
>> [    0.008322] Using GB pages for direct mapping
>> [    0.008731] Secure boot disabled
>> [    0.008731] RAMDISK: [mem 0x79e43000-0x79e5afff]
>> [    0.008737] ACPI: Early table checksum verification disabled
>> [    0.008739] ACPI: RSDP 0x000000008FC4E014 000024 (v02 INSYDE)
>> [    0.008742] ACPI: XSDT 0x000000008FBF9188 0000DC (v01 INSYDE CML      00000002      01000013)
>> [    0.008747] ACPI: FACP 0x000000008FC37000 00010C (v05 INSYDE CML      00000002 ACPI 00040000)
>> [    0.008752] ACPI: DSDT 0x000000008FC00000 03337F (v02 INSYDE CML      00000002 ACPI 00040000)
>> [    0.008754] ACPI: FACS 0x000000008FB47000 000040
>> [    0.008756] ACPI: UEFI 0x000000008FBCE000 000236 (v01 INSYDE CML      00000001 ACPI 00040000)
>> [    0.008759] ACPI: SSDT 0x000000008FC4A000 002087 (v02 CpuRef CpuSsdt  00003000 INTL 20160422)
>> [    0.008761] ACPI: SSDT 0x000000008FC46000 003158 (v02 SaSsdt SaSsdt   00003000 INTL 20160422)
>> [    0.008764] ACPI: SSDT 0x000000008FC44000 001848 (v02 PegSsd PegSsdt  00001000 INTL 20160422)
>> [    0.008766] ACPI: SSDT 0x000000008FC43000 000790 (v02 INSYDE Tpm2Tabl 00001000 INTL 20160422)
>> [    0.008769] ACPI: TPM2 0x000000008FC42000 000034 (v04 INSYDE CML      00000002 ACPI 00040000)
>> [    0.008771] ACPI: LPIT 0x000000008FC40000 000094 (v01 INSYDE CML      00000002 ACPI 00040000)
>> [    0.008773] ACPI: WSMT 0x000000008FC3F000 000028 (v01 INSYDE CML      00000002 ACPI 00040000)
>> [    0.008776] ACPI: SSDT 0x000000008FC3D000 001616 (v02 INSYDE PtidDevc 00001000 INTL 20160422)
>> [    0.008778] ACPI: DBGP 0x000000008FC3C000 000034 (v01 INSYDE CML      00000002 ACPI 00040000)
>> [    0.008780] ACPI: DBG2 0x000000008FC3B000 00005C (v00 INSYDE CML      00000002 ACPI 00040000)
>> [    0.008783] ACPI: SSDT 0x000000008FC3A000 000502 (v02 Intel  PerfTune 00001000 INTL 20160422)
>> [    0.008785] ACPI: NHLT 0x000000008FC38000 001821 (v00 INSYDE CML      00000002 ACPI 00040000)
>> [    0.008788] ACPI: HPET 0x000000008FC36000 000038 (v01 INSYDE CML      00000002 ACPI 00040000)
>> [    0.008790] ACPI: APIC 0x000000008FC35000 000164 (v03 INSYDE CML      00000002 ACPI 00040000)
>> [    0.008792] ACPI: MCFG 0x000000008FC34000 00003C (v01 INSYDE CML      00000002 ACPI 00040000)
>> [    0.008795] ACPI: SSDT 0x000000008FBFF000 000E58 (v02 INSYDE ClevoRTD 00001000 INTL 20160422)
>> [    0.008797] ACPI: SSDT 0x000000008FBFA000 0039F7 (v01 Insyde NvdTable 00001000 INTL 20160422)
>> [    0.008799] ACPI: SSDT 0x000000008FC4D000 000164 (v01 INSYDE PcdTabl  00001000 INTL 20160422)
>> [    0.008802] ACPI: DMAR 0x000000008FBFE000 0000A8 (v01 INSYDE CML      00000002 ACPI 00040000)
>> [    0.008804] ACPI: FPDT 0x000000008FBF8000 000044 (v01 INSYDE CML      00000002 ACPI 00040000)
>> [    0.008806] ACPI: BGRT 0x000000008FBF7000 000038 (v01 INSYDE CML      00000001 ACPI 00040000)
>> [    0.008808] ACPI: Reserving FACP table memory at [mem 0x8fc37000-0x8fc3710b]
>> [    0.008810] ACPI: Reserving DSDT table memory at [mem 0x8fc00000-0x8fc3337e]
>> [    0.008811] ACPI: Reserving FACS table memory at [mem 0x8fb47000-0x8fb4703f]
>> [    0.008812] ACPI: Reserving UEFI table memory at [mem 0x8fbce000-0x8fbce235]
>> [    0.008812] ACPI: Reserving SSDT table memory at [mem 0x8fc4a000-0x8fc4c086]
>> [    0.008813] ACPI: Reserving SSDT table memory at [mem 0x8fc46000-0x8fc49157]
>> [    0.008814] ACPI: Reserving SSDT table memory at [mem 0x8fc44000-0x8fc45847]
>> [    0.008815] ACPI: Reserving SSDT table memory at [mem 0x8fc43000-0x8fc4378f]
>> [    0.008816] ACPI: Reserving TPM2 table memory at [mem 0x8fc42000-0x8fc42033]
>> [    0.008816] ACPI: Reserving LPIT table memory at [mem 0x8fc40000-0x8fc40093]
>> [    0.008817] ACPI: Reserving WSMT table memory at [mem 0x8fc3f000-0x8fc3f027]
>> [    0.008818] ACPI: Reserving SSDT table memory at [mem 0x8fc3d000-0x8fc3e615]
>> [    0.008819] ACPI: Reserving DBGP table memory at [mem 0x8fc3c000-0x8fc3c033]
>> [    0.008819] ACPI: Reserving DBG2 table memory at [mem 0x8fc3b000-0x8fc3b05b]
>> [    0.008820] ACPI: Reserving SSDT table memory at [mem 0x8fc3a000-0x8fc3a501]
>> [    0.008821] ACPI: Reserving NHLT table memory at [mem 0x8fc38000-0x8fc39820]
>> [    0.008822] ACPI: Reserving HPET table memory at [mem 0x8fc36000-0x8fc36037]
>> [    0.008823] ACPI: Reserving APIC table memory at [mem 0x8fc35000-0x8fc35163]
>> [    0.008823] ACPI: Reserving MCFG table memory at [mem 0x8fc34000-0x8fc3403b]
>> [    0.008824] ACPI: Reserving SSDT table memory at [mem 0x8fbff000-0x8fbffe57]
>> [    0.008825] ACPI: Reserving SSDT table memory at [mem 0x8fbfa000-0x8fbfd9f6]
>> [    0.008826] ACPI: Reserving SSDT table memory at [mem 0x8fc4d000-0x8fc4d163]
>> [    0.008827] ACPI: Reserving DMAR table memory at [mem 0x8fbfe000-0x8fbfe0a7]
>> [    0.008827] ACPI: Reserving FPDT table memory at [mem 0x8fbf8000-0x8fbf8043]
>> [    0.008828] ACPI: Reserving BGRT table memory at [mem 0x8fbf7000-0x8fbf7037]
>> [    0.008887] Zone ranges:
>> [    0.008888]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
>> [    0.008890]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
>> [    0.008891]   Normal   [mem 0x0000000100000000-0x00000008607fffff]
>> [    0.008893] Movable zone start for each node
>> [    0.008893] Early memory node ranges
>> [    0.008894]   node   0: [mem 0x0000000000001000-0x000000000009efff]
>> [    0.008895]   node   0: [mem 0x0000000000100000-0x000000007e1d8fff]
>> [    0.008896]   node   0: [mem 0x000000007ead9000-0x000000008cceefff]
>> [    0.008897]   node   0: [mem 0x000000008fc4f000-0x000000008fc4ffff]
>> [    0.008898]   node   0: [mem 0x0000000100000000-0x00000008607fffff]
>> [    0.008902] Initmem setup node 0 [mem 0x0000000000001000-0x00000008607fffff]
>> [    0.008907] On node 0, zone DMA: 1 pages in unavailable ranges
>> [    0.008935] On node 0, zone DMA: 97 pages in unavailable ranges
>> [    0.013025] On node 0, zone DMA32: 2304 pages in unavailable ranges
>> [    0.013117] On node 0, zone DMA32: 12128 pages in unavailable ranges
>> [    0.068370] On node 0, zone Normal: 944 pages in unavailable ranges
>> [    0.068612] On node 0, zone Normal: 30720 pages in unavailable ranges
>> [    0.068641] Reserving Intel graphics memory at [mem 0x99800000-0x9d7fffff]
>> [    0.068889] ACPI: PM-Timer IO Port: 0x1808
>> [    0.068896] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
>> [    0.068897] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
>> [    0.068898] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
>> [    0.068899] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
>> [    0.068899] ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
>> [    0.068900] ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
>> [    0.068901] ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
>> [    0.068901] ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
>> [    0.068902] ACPI: LAPIC_NMI (acpi_id[0x09] high edge lint[0x1])
>> [    0.068903] ACPI: LAPIC_NMI (acpi_id[0x0a] high edge lint[0x1])
>> [    0.068903] ACPI: LAPIC_NMI (acpi_id[0x0b] high edge lint[0x1])
>> [    0.068904] ACPI: LAPIC_NMI (acpi_id[0x0c] high edge lint[0x1])
>> [    0.068904] ACPI: LAPIC_NMI (acpi_id[0x0d] high edge lint[0x1])
>> [    0.068905] ACPI: LAPIC_NMI (acpi_id[0x0e] high edge lint[0x1])
>> [    0.068906] ACPI: LAPIC_NMI (acpi_id[0x0f] high edge lint[0x1])
>> [    0.068906] ACPI: LAPIC_NMI (acpi_id[0x10] high edge lint[0x1])
>> [    0.068907] ACPI: LAPIC_NMI (acpi_id[0x11] high edge lint[0x1])
>> [    0.068908] ACPI: LAPIC_NMI (acpi_id[0x12] high edge lint[0x1])
>> [    0.068908] ACPI: LAPIC_NMI (acpi_id[0x13] high edge lint[0x1])
>> [    0.068909] ACPI: LAPIC_NMI (acpi_id[0x14] high edge lint[0x1])
>> [    0.068948] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
>> [    0.068951] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
>> [    0.068955] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
>> [    0.068959] ACPI: Using ACPI (MADT) for SMP configuration information
>> [    0.068960] ACPI: HPET id: 0x8086a201 base: 0xfed00000
>> [    0.068962] TSC deadline timer available
>> [    0.068968] CPU topo: Max. logical packages:   1
>> [    0.068969] CPU topo: Max. logical dies:       1
>> [    0.068969] CPU topo: Max. dies per package:   1
>> [    0.068975] CPU topo: Max. threads per core:   2
>> [    0.068976] CPU topo: Num. cores per package:     6
>> [    0.068976] CPU topo: Num. threads per package:  12
>> [    0.068977] CPU topo: Allowing 12 present CPUs plus 0 hotplug CPUs
>> [    0.068993] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
>> [    0.068995] PM: hibernation: Registered nosave memory: [mem 0x0009f000-0x000fffff]
>> [    0.068997] PM: hibernation: Registered nosave memory: [mem 0x7e1d9000-0x7ead8fff]
>> [    0.068999] PM: hibernation: Registered nosave memory: [mem 0x8ccef000-0x8fc4efff]
>> [    0.069001] PM: hibernation: Registered nosave memory: [mem 0x8fc50000-0xffffffff]
>> [    0.069002] [mem 0x9d800000-0xfdffffff] available for PCI devices
>> [    0.069004] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
>> [    0.074948] setup_percpu: NR_CPUS:12 nr_cpumask_bits:12 nr_cpu_ids:12 nr_node_ids:1
>> [    0.075402] percpu: Embedded 42 pages/cpu s134680 r8192 d29160 u262144
>> [    0.075409] pcpu-alloc: s134680 r8192 d29160 u262144 alloc=1*2097152
>> [    0.075412] pcpu-alloc: [0] 00 01 02 03 04 05 06 07 [0] 08 09 10 11 -- -- -- -- 
>> [    0.075433] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-6.16.0-rc1+ ro root=PARTUUID=f927883a-e95c-4cdd-b64e-a0a778216b9f resume=PARTUUID=70ccedc5-d788-42bc-9f13-81e2beb61338 rootfstype=ext4 net.ifnames=0 video=1920x1080@60
>> [    0.075479] Unknown kernel command line parameters "BOOT_IMAGE=/boot/vmlinuz-6.16.0-rc1+", will be passed to user space.
>> [    0.075501] printk: log buffer data + meta data: 131072 + 458752 = 589824 bytes
>> [    0.078194] Dentry cache hash table entries: 4194304 (order: 13, 33554432 bytes, linear)
>> [    0.079542] Inode-cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
>> [    0.079679] software IO TLB: area num 16.
>> [    0.090589] Built 1 zonelists, mobility grouping on.  Total pages: 8309646
>> [    0.090591] mem auto-init: stack:off, heap alloc:off, heap free:off
>> [    0.141848] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=12, Nodes=1
>> [    0.142332] Dynamic Preempt: lazy
>> [    0.142374] rcu: Preemptible hierarchical RCU implementation.
>> [    0.142375] rcu: 	RCU event tracing is enabled.
>> [    0.142376] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
>> [    0.142387] NR_IRQS: 4352, nr_irqs: 2152, preallocated irqs: 16
>> [    0.142651] rcu: srcu_init: Setting srcu_struct sizes based on contention.
>> [    0.142899] Console: colour dummy device 80x25
>> [    0.142902] printk: legacy console [tty0] enabled
>> [    0.143161] ACPI: Core revision 20250404
>> [    0.143387] hpet: HPET dysfunctional in PC10. Force disabled.
>> [    0.143447] APIC: Switch to symmetric I/O mode setup
>> [    0.148476] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x257a34a6eea, max_idle_ns: 440795264358 ns
>> [    0.148483] Calibrating delay loop (skipped), value calculated using timer frequency.. 5199.98 BogoMIPS (lpj=10399968)
>> [    0.148513] CPU0: Thermal monitoring enabled (TM1)
>> [    0.148561] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
>> [    0.148564] Last level dTLB entries: 4KB 64, 2MB 32, 4MB 32, 1GB 4
>> [    0.148568] process: using mwait in idle threads
>> [    0.148574] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
>> [    0.148576] SRBDS: Mitigation: Microcode
>> [    0.148578] Spectre V2 : Mitigation: Enhanced / Automatic IBRS
>> [    0.148580] RETBleed: Mitigation: Enhanced IBRS
>> [    0.148582] ITS: Mitigation: Aligned branch/return thunks
>> [    0.148584] MMIO Stale Data: Mitigation: Clear CPU buffers
>> [    0.148586] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
>> [    0.148589] Spectre V2 : Spectre v2 / PBRSB-eIBRS: Retire a single CALL on VMEXIT
>> [    0.148591] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
>> [    0.148607] GDS: Mitigation: Microcode
>> [    0.148608] Spectre V2 : Spectre BHI mitigation: SW BHB clearing on syscall and VM exit
>> [    0.148615] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
>> [    0.148618] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
>> [    0.148620] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
>> [    0.148622] x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds registers'
>> [    0.148624] x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
>> [    0.148626] x86/fpu: Supporting XSAVE feature 0x200: 'Protection Keys User registers'
>> [    0.148629] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
>> [    0.148632] x86/fpu: xstate_offset[3]:  832, xstate_sizes[3]:   64
>> [    0.148634] x86/fpu: xstate_offset[4]:  896, xstate_sizes[4]:   64
>> [    0.148636] x86/fpu: xstate_offset[9]:  960, xstate_sizes[9]:    8
>> [    0.148638] x86/fpu: Enabled xstate features 0x21f, context size is 968 bytes, using 'compacted' format.
>> [    0.152481] Freeing SMP alternatives memory: 40K
>> [    0.152481] pid_max: default: 32768 minimum: 301
>> [    0.152481] Mount-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
>> [    0.152481] Mountpoint-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
>> [    0.152481] smpboot: CPU0: Intel(R) Core(TM) i7-10750H CPU @ 2.60GHz (family: 0x6, model: 0xa5, stepping: 0x2)
>> [    0.152481] Performance Events: PEBS fmt3+, Skylake events, 32-deep LBR, full-width counters, Intel PMU driver.
>> [    0.152481] ... version:                4
>> [    0.152481] ... bit width:              48
>> [    0.152481] ... generic registers:      4
>> [    0.152481] ... value mask:             0000ffffffffffff
>> [    0.152481] ... max period:             00007fffffffffff
>> [    0.152481] ... fixed-purpose events:   3
>> [    0.152481] ... event mask:             000000070000000f
>> [    0.152481] signal: max sigframe size: 3632
>> [    0.152481] Estimated ratio of average max frequency by base frequency (times 1024): 1811
>> [    0.152481] rcu: Hierarchical SRCU implementation.
>> [    0.152481] rcu: 	Max phase no-delay instances is 1000.
>> [    0.152481] Timer migration: 2 hierarchy levels; 8 children per group; 2 crossnode level
>> [    0.152481] smp: Bringing up secondary CPUs ...
>> [    0.152481] smpboot: x86: Booting SMP configuration:
>> [    0.152481] .... node  #0, CPUs:        #1  #2  #3  #4  #5  #6  #7  #8  #9 #10 #11
>> [    0.152804] MMIO Stale Data CPU bug present and SMT on, data leak possible. See https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/processor_mmio_stale_data.html for more details.
>> [    0.152804] smp: Brought up 1 node, 12 CPUs
>> [    0.152804] smpboot: Total of 12 processors activated (62399.80 BogoMIPS)
>> [    0.156542] Memory: 32559620K/33238584K available (14111K kernel code, 1186K rwdata, 4668K rodata, 2172K init, 736K bss, 669376K reserved, 0K cma-reserved)
>> [    0.157324] devtmpfs: initialized
>> [    0.157324] ACPI: PM: Registering ACPI NVS region [mem 0x8eedf000-0x8fbcefff] (13565952 bytes)
>> [    0.157324] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
>> [    0.157324] posixtimers hash table entries: 8192 (order: 5, 131072 bytes, linear)
>> [    0.157324] futex hash table entries: 4096 (262144 bytes on 1 NUMA nodes, total 256 KiB, linear).
>> [    0.157324] NET: Registered PF_NETLINK/PF_ROUTE protocol family
>> [    0.157324] thermal_sys: Registered thermal governor 'step_wise'
>> [    0.157324] thermal_sys: Registered thermal governor 'user_space'
>> [    0.157324] cpuidle: using governor ladder
>> [    0.157324] cpuidle: using governor menu
>> [    0.157324] PCI: Using configuration type 1 for base access
>> [    0.157324] ACPI: Added _OSI(Module Device)
>> [    0.157324] ACPI: Added _OSI(Processor Device)
>> [    0.157324] ACPI: Added _OSI(Processor Aggregator Device)
>> [    0.188703] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PCI0.XDCI], AE_NOT_FOUND (20250404/dswload2-162)
>> [    0.188712] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (20250404/psobject-220)
>> [    0.188715] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0010)
>> [    0.189692] ACPI: 10 ACPI AML tables successfully acquired and loaded
>> [    0.190649] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
>> [    0.194446] ACPI: Dynamic OEM Table Load:
>> [    0.194446] ACPI: SSDT 0xFFFF963000D68000 000400 (v02 PmRef  Cpu0Cst  00003001 INTL 20160422)
>> [    0.194446] ACPI: Dynamic OEM Table Load:
>> [    0.194446] ACPI: SSDT 0xFFFF963000D61000 000581 (v02 PmRef  Cpu0Ist  00003000 INTL 20160422)
>> [    0.194446] ACPI: Dynamic OEM Table Load:
>> [    0.194446] ACPI: SSDT 0xFFFF963000D16000 0000FC (v02 PmRef  Cpu0Psd  00003000 INTL 20160422)
>> [    0.194446] ACPI: Dynamic OEM Table Load:
>> [    0.194446] ACPI: SSDT 0xFFFF963000F58000 000137 (v02 PmRef  Cpu0Hwp  00003000 INTL 20160422)
>> [    0.194446] ACPI: Dynamic OEM Table Load:
>> [    0.194446] ACPI: SSDT 0xFFFF963000D70000 000BEA (v02 PmRef  HwpLvt   00003000 INTL 20160422)
>> [    0.195271] ACPI: Dynamic OEM Table Load:
>> [    0.195280] ACPI: SSDT 0xFFFF963000D62800 000778 (v02 PmRef  ApIst    00003000 INTL 20160422)
>> [    0.196181] ACPI: Dynamic OEM Table Load:
>> [    0.196188] ACPI: SSDT 0xFFFF963000D68400 0003D7 (v02 PmRef  ApHwp    00003000 INTL 20160422)
>> [    0.197072] ACPI: Dynamic OEM Table Load:
>> [    0.197080] ACPI: SSDT 0xFFFF963000D71000 000D22 (v02 PmRef  ApPsd    00003000 INTL 20160422)
>> [    0.198378] ACPI: Dynamic OEM Table Load:
>> [    0.198385] ACPI: SSDT 0xFFFF963000D68800 0003CA (v02 PmRef  ApCst    00003000 INTL 20160422)
>> [    0.201914] ACPI: EC: EC started
>> [    0.201917] ACPI: EC: interrupt blocked
>> [    0.203490] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
>> [    0.203494] ACPI: \_SB_.PCI0.LPCB.EC__: Boot DSDT EC used to handle transactions
>> [    0.203497] ACPI: Interpreter enabled
>> [    0.203537] ACPI: PM: (supports S0 S3 S4 S5)
>> [    0.203539] ACPI: Using IOAPIC for interrupt routing
>> [    0.203574] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
>> [    0.203577] PCI: Using E820 reservations for host bridge windows
>> [    0.203848] ACPI: Enabled 7 GPEs in block 00 to 7F
>> [    0.204570] ACPI: \_SB_.PCI0.PEG0.PG00: New power resource
>> [    0.229186] ACPI: \_SB_.PCI0.XHC_.RHUB.HS14.BTPR: New power resource
>> [    0.236156] ACPI: \_SB_.PCI0.SAT0.VOL0.V0PR: New power resource
>> [    0.236298] ACPI: \_SB_.PCI0.SAT0.VOL1.V1PR: New power resource
>> [    0.236432] ACPI: \_SB_.PCI0.SAT0.VOL2.V2PR: New power resource
>> [    0.237453] ACPI: \_SB_.PCI0.CNVW.WRST: New power resource
>> [    0.240067] ACPI: \PIN_: New power resource
>> [    0.244487] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-fe])
>> [    0.244487] acpi PNP0A08:00: _OSC: OS supports [ASPM ClockPM Segments MSI HPX-Type3]
>> [    0.244487] acpi PNP0A08:00: _OSC: not requesting OS control; OS requires [ExtendedConfig ASPM ClockPM MSI]
>> [    0.244487] PCI host bridge to bus 0000:00
>> [    0.244487] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
>> [    0.244487] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
>> [    0.244487] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
>> [    0.244487] pci_bus 0000:00: root bus resource [mem 0x9d800000-0xdfffffff window]
>> [    0.244487] pci_bus 0000:00: root bus resource [mem 0xfc800000-0xfe7fffff window]
>> [    0.244487] pci_bus 0000:00: root bus resource [bus 00-fe]
>> [    0.244487] pci 0000:00:00.0: [8086:9b54] type 00 class 0x060000 conventional PCI endpoint
>> [    0.244487] pci 0000:00:01.0: [8086:1901] type 01 class 0x060400 PCIe Root Port
>> [    0.244487] pci 0000:00:01.0: PCI bridge to [bus 01-05]
>> [    0.244487] pci 0000:00:01.0:   bridge window [io  0x4000-0x4fff]
>> [    0.244487] pci 0000:00:01.0:   bridge window [mem 0xc3000000-0xc4ffffff]
>> [    0.244487] pci 0000:00:01.0:   bridge window [mem 0xb0000000-0xc1ffffff 64bit pref]
>> [    0.244487] pci 0000:00:01.0: PME# supported from D0 D3hot D3cold
>> [    0.244487] pci 0000:00:02.0: [8086:9bc4] type 00 class 0x030000 PCIe Root Complex Integrated Endpoint
>> [    0.244487] pci 0000:00:02.0: BAR 0 [mem 0xc2000000-0xc2ffffff 64bit]
>> [    0.244487] pci 0000:00:02.0: BAR 2 [mem 0xa0000000-0xafffffff 64bit pref]
>> [    0.244487] pci 0000:00:02.0: BAR 4 [io  0x5000-0x503f]
>> [    0.244487] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
>> [    0.244487] pci 0000:00:12.0: [8086:06f9] type 00 class 0x118000 conventional PCI endpoint
>> [    0.244487] pci 0000:00:12.0: BAR 0 [mem 0xc539c000-0xc539cfff 64bit]
>> [    0.244487] pci 0000:00:14.0: [8086:06ed] type 00 class 0x0c0330 conventional PCI endpoint
>> [    0.244487] pci 0000:00:14.0: BAR 0 [mem 0xc5380000-0xc538ffff 64bit]
>> [    0.244487] pci 0000:00:14.0: PME# supported from D3hot D3cold
>> [    0.244487] pci 0000:00:14.2: [8086:06ef] type 00 class 0x050000 conventional PCI endpoint
>> [    0.244487] pci 0000:00:14.2: BAR 0 [mem 0xc5398000-0xc5399fff 64bit]
>> [    0.244487] pci 0000:00:14.2: BAR 2 [mem 0xc539d000-0xc539dfff 64bit]
>> [    0.244487] pci 0000:00:14.3: [8086:06f0] type 00 class 0x028000 PCIe Root Complex Integrated Endpoint
>> [    0.244487] pci 0000:00:14.3: BAR 0 [mem 0xc5390000-0xc5393fff 64bit]
>> [    0.244487] pci 0000:00:14.3: PME# supported from D0 D3hot D3cold
>> [    0.244487] pci 0000:00:15.0: [8086:06e8] type 00 class 0x0c8000 conventional PCI endpoint
>> [    0.244487] pci 0000:00:15.0: BAR 0 [mem 0x00000000-0x00000fff 64bit]
>> [    0.256706] pci 0000:00:15.1: [8086:06e9] type 00 class 0x0c8000 conventional PCI endpoint
>> [    0.256755] pci 0000:00:15.1: BAR 0 [mem 0x00000000-0x00000fff 64bit]
>> [    0.272722] pci 0000:00:16.0: [8086:06e0] type 00 class 0x078000 conventional PCI endpoint
>> [    0.272768] pci 0000:00:16.0: BAR 0 [mem 0xc53a0000-0xc53a0fff 64bit]
>> [    0.272817] pci 0000:00:16.0: PME# supported from D3hot
>> [    0.273114] pci 0000:00:17.0: [8086:06d3] type 00 class 0x010601 conventional PCI endpoint
>> [    0.273148] pci 0000:00:17.0: BAR 0 [mem 0xc539a000-0xc539bfff]
>> [    0.273151] pci 0000:00:17.0: BAR 1 [mem 0xc53a4000-0xc53a40ff]
>> [    0.273154] pci 0000:00:17.0: BAR 2 [io  0x5080-0x5087]
>> [    0.273157] pci 0000:00:17.0: BAR 3 [io  0x5088-0x508b]
>> [    0.273159] pci 0000:00:17.0: BAR 4 [io  0x5060-0x507f]
>> [    0.273162] pci 0000:00:17.0: BAR 5 [mem 0xc53a3000-0xc53a37ff]
>> [    0.273194] pci 0000:00:17.0: PME# supported from D3hot
>> [    0.273590] pci 0000:00:1d.0: [8086:06b0] type 01 class 0x060400 PCIe Root Port
>> [    0.273614] pci 0000:00:1d.0: PCI bridge to [bus 06]
>> [    0.273621] pci 0000:00:1d.0:   bridge window [mem 0xc5200000-0xc52fffff]
>> [    0.273676] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
>> [    0.274115] pci 0000:00:1d.5: [8086:06b5] type 01 class 0x060400 PCIe Root Port
>> [    0.274137] pci 0000:00:1d.5: PCI bridge to [bus 07]
>> [    0.274191] pci 0000:00:1d.5: PME# supported from D0 D3hot D3cold
>> [    0.274600] pci 0000:00:1d.6: [8086:06b6] type 01 class 0x060400 PCIe Root Port
>> [    0.274622] pci 0000:00:1d.6: PCI bridge to [bus 08]
>> [    0.274626] pci 0000:00:1d.6:   bridge window [io  0x3000-0x3fff]
>> [    0.274630] pci 0000:00:1d.6:   bridge window [mem 0xc5100000-0xc51fffff]
>> [    0.274680] pci 0000:00:1d.6: PME# supported from D0 D3hot D3cold
>> [    0.275107] pci 0000:00:1f.0: [8086:068d] type 00 class 0x060100 conventional PCI endpoint
>> [    0.275445] pci 0000:00:1f.3: [8086:06c8] type 00 class 0x040300 conventional PCI endpoint
>> [    0.275517] pci 0000:00:1f.3: BAR 0 [mem 0xc5394000-0xc5397fff 64bit]
>> [    0.275526] pci 0000:00:1f.3: BAR 4 [mem 0xc5000000-0xc50fffff 64bit]
>> [    0.275592] pci 0000:00:1f.3: PME# supported from D3hot D3cold
>> [    0.276041] pci 0000:00:1f.4: [8086:06a3] type 00 class 0x0c0500 conventional PCI endpoint
>> [    0.276086] pci 0000:00:1f.4: BAR 0 [mem 0xc53a1000-0xc53a10ff 64bit]
>> [    0.276098] pci 0000:00:1f.4: BAR 4 [io  0xefa0-0xefbf]
>> [    0.276285] pci 0000:00:1f.5: [8086:06a4] type 00 class 0x0c8000 conventional PCI endpoint
>> [    0.276328] pci 0000:00:1f.5: BAR 0 [mem 0xfe010000-0xfe010fff]
>> [    0.276425] pci 0000:01:00.0: [10de:1f95] type 00 class 0x030000 PCIe Legacy Endpoint
>> [    0.276488] pci 0000:01:00.0: BAR 0 [mem 0xc4000000-0xc4ffffff]
>> [    0.276494] pci 0000:01:00.0: BAR 1 [mem 0xb0000000-0xbfffffff 64bit pref]
>> [    0.276499] pci 0000:01:00.0: BAR 3 [mem 0xc0000000-0xc1ffffff 64bit pref]
>> [    0.276503] pci 0000:01:00.0: BAR 5 [io  0x4000-0x407f]
>> [    0.276507] pci 0000:01:00.0: ROM [mem 0xfff80000-0xffffffff pref]
>> [    0.276575] pci 0000:01:00.0: PME# supported from D0 D3hot D3cold
>> [    0.276602] pci 0000:01:00.0: 63.008 Gb/s available PCIe bandwidth, limited by 8.0 GT/s PCIe x8 link at 0000:00:01.0 (capable of 126.016 Gb/s with 8.0 GT/s PCIe x16 link)
>> [    0.276756] pci 0000:00:01.0: PCI bridge to [bus 01-05]
>> [    0.276835] pci 0000:06:00.0: [15b7:5009] type 00 class 0x010802 PCIe Endpoint
>> [    0.276881] pci 0000:06:00.0: BAR 0 [mem 0xc5200000-0xc5203fff 64bit]
>> [    0.276887] pci 0000:06:00.0: BAR 4 [mem 0xc5204000-0xc52040ff 64bit]
>> [    0.284555] pci 0000:00:1d.0: PCI bridge to [bus 06]
>> [    0.284601] pci 0000:00:1d.5: PCI bridge to [bus 07]
>> [    0.284664] pci 0000:08:00.0: [10ec:5287] type 00 class 0xff0000 PCIe Endpoint
>> [    0.284716] pci 0000:08:00.0: BAR 0 [mem 0xc5105000-0xc5105fff]
>> [    0.284727] pci 0000:08:00.0: ROM [mem 0x00000000-0x0000ffff pref]
>> [    0.284795] pci 0000:08:00.0: supports D1 D2
>> [    0.284797] pci 0000:08:00.0: PME# supported from D1 D2 D3hot D3cold
>> [    0.284905] pci 0000:08:00.1: [10ec:8168] type 00 class 0x020000 PCIe Endpoint
>> [    0.284961] pci 0000:08:00.1: BAR 0 [io  0x3000-0x30ff]
>> [    0.284967] pci 0000:08:00.1: BAR 2 [mem 0xc5104000-0xc5104fff 64bit]
>> [    0.284972] pci 0000:08:00.1: BAR 4 [mem 0xc5100000-0xc5103fff 64bit]
>> [    0.285040] pci 0000:08:00.1: supports D1 D2
>> [    0.285042] pci 0000:08:00.1: PME# supported from D0 D1 D2 D3hot D3cold
>> [    0.285161] pci 0000:00:1d.6: PCI bridge to [bus 08]
>> [    0.285185] pci_bus 0000:00: on NUMA node 0
>> [    0.287093] ACPI: EC: interrupt unblocked
>> [    0.287096] ACPI: EC: event unblocked
>> [    0.287115] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
>> [    0.287117] ACPI: EC: GPE=0x3
>> [    0.287119] ACPI: \_SB_.PCI0.LPCB.EC__: Boot DSDT EC initialization complete
>> [    0.287122] ACPI: \_SB_.PCI0.LPCB.EC__: EC: Used to handle transactions and events
>> [    0.287204] iommu: Default domain type: Translated
>> [    0.287206] iommu: DMA domain TLB invalidation policy: lazy mode
>> [    0.287213] SCSI subsystem initialized
>> [    0.287213] libata version 3.00 loaded.
>> [    0.287213] ACPI: bus type USB registered
>> [    0.287213] usbcore: registered new interface driver usbfs
>> [    0.287213] usbcore: registered new interface driver hub
>> [    0.287213] usbcore: registered new device driver usb
>> [    0.287213] mc: Linux media interface: v0.10
>> [    0.287213] videodev: Linux video capture interface: v2.00
>> [    0.287213] efivars: Registered efivars operations
>> [    0.287213] Advanced Linux Sound Architecture Driver Initialized.
>> [    0.287213] Bluetooth: Core ver 2.22
>> [    0.287213] NET: Registered PF_BLUETOOTH protocol family
>> [    0.287213] Bluetooth: HCI device and connection manager initialized
>> [    0.287213] Bluetooth: HCI socket layer initialized
>> [    0.287213] Bluetooth: L2CAP socket layer initialized
>> [    0.287213] Bluetooth: SCO socket layer initialized
>> [    0.287213] PCI: Using ACPI for IRQ routing
>> [    0.287213] PCI: pci_cache_line_size set to 64 bytes
>> [    0.287213] e820: reserve RAM buffer [mem 0x0009f000-0x0009ffff]
>> [    0.287213] e820: reserve RAM buffer [mem 0x7e1d9000-0x7fffffff]
>> [    0.287213] e820: reserve RAM buffer [mem 0x8ccef000-0x8fffffff]
>> [    0.287213] e820: reserve RAM buffer [mem 0x8fc50000-0x8fffffff]
>> [    0.287213] e820: reserve RAM buffer [mem 0x860800000-0x863ffffff]
>> [    0.287213] pci 0000:00:02.0: vgaarb: setting as boot VGA device
>> [    0.287213] pci 0000:00:02.0: vgaarb: bridge control possible
>> [    0.287213] pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
>> [    0.287213] pci 0000:01:00.0: vgaarb: bridge control possible
>> [    0.287213] pci 0000:01:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
>> [    0.287213] vgaarb: loaded
>> [    0.287213] wmi_bus wmi_bus-PNP0C14:01: [Firmware Info]: 00000000-0000-0000-0000-000000000000 has zero instances
>> [    0.287213] wmi_bus wmi_bus-PNP0C14:01: [Firmware Info]: 00000000-0000-0000-0000-000000000000 has zero instances
>> [    0.287213] wmi_bus wmi_bus-PNP0C14:01: [Firmware Info]: 00000000-0000-0000-0000-000000000000 has zero instances
>> [    0.287213] wmi_bus wmi_bus-PNP0C14:01: [Firmware Info]: 00000000-0000-0000-0000-000000000000 has zero instances
>> [    0.287213] clocksource: Switched to clocksource tsc-early
>> [    0.287213] pnp: PnP ACPI init
>> [    0.287213] system 00:00: [mem 0x40000000-0x403fffff] could not be reserved
>> [    0.287213] system 00:01: [io  0x1800-0x18fe] could not be reserved
>> [    0.287213] system 00:01: [mem 0xfd000000-0xfd69ffff] has been reserved
>> [    0.287213] system 00:01: [mem 0xfd6c0000-0xfd6cffff] has been reserved
>> [    0.287213] system 00:01: [mem 0xfd6f0000-0xfdffffff] has been reserved
>> [    0.287213] system 00:01: [mem 0xfe000000-0xfe01ffff] could not be reserved
>> [    0.287213] system 00:01: [mem 0xfe200000-0xfe7fffff] has been reserved
>> [    0.287213] system 00:01: [mem 0xff000000-0xffffffff] has been reserved
>> [    0.287213] system 00:02: [io  0x2000-0x20fe] has been reserved
>> [    0.287213] pnp 00:03: disabling [io  0x3322-0x3323] because it overlaps 0000:00:1d.6 BAR 7 [io  0x3000-0x3fff]
>> [    0.287213] system 00:03: [io  0x0680-0x069f] has been reserved
>> [    0.287213] system 00:03: [io  0x164e-0x164f] has been reserved
>> [    0.287213] system 00:07: [mem 0xfed10000-0xfed17fff] has been reserved
>> [    0.287213] system 00:07: [mem 0xfed18000-0xfed18fff] has been reserved
>> [    0.287213] system 00:07: [mem 0xfed19000-0xfed19fff] has been reserved
>> [    0.287213] system 00:07: [mem 0xe0000000-0xefffffff] has been reserved
>> [    0.287213] system 00:07: [mem 0xfed20000-0xfed3ffff] has been reserved
>> [    0.287213] system 00:07: [mem 0xfed90000-0xfed93fff] has been reserved
>> [    0.287213] system 00:07: [mem 0xfed45000-0xfed8ffff] could not be reserved
>> [    0.287213] system 00:07: [mem 0xfee00000-0xfeefffff] could not be reserved
>> [    0.287213] system 00:08: [mem 0xfe038000-0xfe038fff] has been reserved
>> [    0.287213] pnp: PnP ACPI: found 9 devices
>> [    0.291398] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
>> [    0.291423] NET: Registered PF_INET protocol family
>> [    0.291568] IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
>> [    0.294758] tcp_listen_portaddr_hash hash table entries: 16384 (order: 6, 262144 bytes, linear)
>> [    0.294789] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
>> [    0.294800] TCP established hash table entries: 262144 (order: 9, 2097152 bytes, linear)
>> [    0.295066] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes, linear)
>> [    0.295357] TCP: Hash tables configured (established 262144 bind 65536)
>> [    0.295387] UDP hash table entries: 16384 (order: 8, 1048576 bytes, linear)
>> [    0.295520] UDP-Lite hash table entries: 16384 (order: 8, 1048576 bytes, linear)
>> [    0.295685] NET: Registered PF_UNIX/PF_LOCAL protocol family
>> [    0.295699] pci 0000:01:00.0: ROM [mem 0xfff80000-0xffffffff pref]: can't claim; no compatible bridge window
>> [    0.295717] resource: avoiding allocation from e820 entry [mem 0x0009f000-0x000fffff]
>> [    0.295723] pci 0000:00:15.0: BAR 0 [mem 0x9d800000-0x9d800fff 64bit]: assigned
>> [    0.295739] resource: avoiding allocation from e820 entry [mem 0x0009f000-0x000fffff]
>> [    0.295744] pci 0000:00:15.1: BAR 0 [mem 0x9d801000-0x9d801fff 64bit]: assigned
>> [    0.295763] pci 0000:01:00.0: ROM [mem 0xc3000000-0xc307ffff pref]: assigned
>> [    0.295770] pci 0000:00:01.0: PCI bridge to [bus 01-05]
>> [    0.295774] pci 0000:00:01.0:   bridge window [io  0x4000-0x4fff]
>> [    0.295781] pci 0000:00:01.0:   bridge window [mem 0xc3000000-0xc4ffffff]
>> [    0.295787] pci 0000:00:01.0:   bridge window [mem 0xb0000000-0xc1ffffff 64bit pref]
>> [    0.295797] pci 0000:00:1d.0: PCI bridge to [bus 06]
>> [    0.295807] pci 0000:00:1d.0:   bridge window [mem 0xc5200000-0xc52fffff]
>> [    0.295817] pci 0000:00:1d.5: PCI bridge to [bus 07]
>> [    0.295830] pci 0000:08:00.0: ROM [mem 0xc5110000-0xc511ffff pref]: assigned
>> [    0.295836] pci 0000:00:1d.6: PCI bridge to [bus 08]
>> [    0.295845] pci 0000:00:1d.6:   bridge window [io  0x3000-0x3fff]
>> [    0.295852] pci 0000:00:1d.6:   bridge window [mem 0xc5100000-0xc51fffff]
>> [    0.295863] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
>> [    0.295868] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
>> [    0.295873] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
>> [    0.295879] pci_bus 0000:00: resource 7 [mem 0x9d800000-0xdfffffff window]
>> [    0.295885] pci_bus 0000:00: resource 8 [mem 0xfc800000-0xfe7fffff window]
>> [    0.295891] pci_bus 0000:01: resource 0 [io  0x4000-0x4fff]
>> [    0.295896] pci_bus 0000:01: resource 1 [mem 0xc3000000-0xc4ffffff]
>> [    0.295901] pci_bus 0000:01: resource 2 [mem 0xb0000000-0xc1ffffff 64bit pref]
>> [    0.295907] pci_bus 0000:06: resource 1 [mem 0xc5200000-0xc52fffff]
>> [    0.295913] pci_bus 0000:08: resource 0 [io  0x3000-0x3fff]
>> [    0.295918] pci_bus 0000:08: resource 1 [mem 0xc5100000-0xc51fffff]
>> [    0.298217] PCI: CLS 64 bytes, default 64
>> [    0.298256] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
>> [    0.298258] software IO TLB: mapped [mem 0x0000000087d15000-0x000000008bd15000] (64MB)
>> [    0.298281] Unpacking initramfs...
>> [    0.298282] RAPL PMU: API unit is 2^-32 Joules, 5 fixed counters, 655360 ms ovfl timer
>> [    0.298286] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
>> [    0.298288] RAPL PMU: hw unit of domain package 2^-14 Joules
>> [    0.298290] RAPL PMU: hw unit of domain dram 2^-14 Joules
>> [    0.298291] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
>> [    0.298293] RAPL PMU: hw unit of domain psys 2^-14 Joules
>> [    0.298370] Freeing initrd memory: 96K
>> [    0.298958] Initialise system trusted keyrings
>> [    0.298994] workingset: timestamp_bits=62 max_order=23 bucket_order=0
>> [    0.299325] Key type cifs.spnego registered
>> [    0.299329] Key type cifs.idmap registered
>> [    0.299389] fuse: init (API version 7.44)
>> [    0.299472] cryptd: max_cpu_qlen set to 1000
>> [    0.311210] NET: Registered PF_ALG protocol family
>> [    0.311217] Key type asymmetric registered
>> [    0.311219] Asymmetric key parser 'x509' registered
>> [    0.311232] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
>> [    0.311234] io scheduler mq-deadline registered
>> [    0.312127] Monitor-Mwait will be used to enter C-1 state
>> [    0.312137] Monitor-Mwait will be used to enter C-2 state
>> [    0.312145] Monitor-Mwait will be used to enter C-3 state
>> [    0.312747] ACPI: AC: AC Adapter [AC] (on-line)
>> [    0.312808] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
>> [    0.312855] ACPI: button: Power Button [PWRB]
>> [    0.312888] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input1
>> [    0.312925] ACPI: button: Sleep Button [SLPB]
>> [    0.312956] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input2
>> [    0.312990] ACPI: button: Lid Switch [LID0]
>> [    0.313022] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input3
>> [    0.313062] ACPI: button: Power Button [PWRF]
>> [    0.314498] ACPI: \_TZ_.TZ0_: _AL0 evaluation failure
>> [    0.314606] thermal LNXTHERM:00: registered as thermal_zone0
>> [    0.314610] ACPI: thermal: Thermal Zone [TZ0] (50 C)
>> [    0.315226] ACPI: battery: Slot [BAT0] (battery present)
>> [    0.318476] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
>> [    0.319031] Linux agpgart interface v0.103
>> [    0.319122] ACPI: bus type drm_connector registered
>> [    0.319243] i915 0000:00:02.0: [drm] Found cometlake (device ID 9bc4) integrated display version 9.00 stepping N/A
>> [    0.319931] i915 0000:00:02.0: vgaarb: deactivate vga console
>> [    0.321011] i915 0000:00:02.0: vgaarb: VGA decodes changed: olddecodes=io+mem,decodes=none:owns=io+mem
>> [    0.321410] i915 0000:00:02.0: Direct firmware load for i915/kbl_dmc_ver1_04.bin failed with error -2
>> [    0.321416] i915 0000:00:02.0: [drm] Failed to load DMC firmware i915/kbl_dmc_ver1_04.bin (-ENOENT). Disabling runtime power management.
>> [    0.321422] i915 0000:00:02.0: [drm] DMC firmware homepage: https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
>> [    0.365885] [drm] Initialized i915 1.6.0 for 0000:00:02.0 on minor 0
>> [    0.366347] ACPI: video: Video Device [PEGP] (multi-head: no  rom: yes  post: no)
>> [    0.366382] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:00/LNXVIDEO:00/input/input4
>> [    0.367582] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
>> [    0.367708] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:01/input/input5
>> [    0.380121] fbcon: i915drmfb (fb0) is primary device
>> [    1.330022] tsc: Refined TSC clocksource calibration: 2592.000 MHz
>> [    1.330031] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x255cb6cc5db, max_idle_ns: 440795203504 ns
>> [    1.330095] clocksource: Switched to clocksource tsc
>> [    2.093111] Console: switching to colour frame buffer device 240x67
>> [    2.109770] i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer device
>> [    2.110763] rtsx_pci 0000:08:00.0: enabling device (0000 -> 0002)
>> [    2.222493] nvme 0000:06:00.0: platform quirk: setting simple suspend
>> [    2.222585] nvme nvme0: pci function 0000:06:00.0
>> [    2.228641] nvme nvme0: allocated 32 MiB host memory buffer (8 segments).
>> [    2.229952] nvme nvme0: 12/0/0 default/read/poll queues
>> [    2.232752] ahci 0000:00:17.0: AHCI vers 0001.0301, 32 command slots, 6 Gbps, SATA mode
>> [    2.232769] ahci 0000:00:17.0: 1/1 ports implemented (port mask 0x10)
>> [    2.232777] ahci 0000:00:17.0: flags: 64bit ncq sntf pm clo only pio slum part ems deso sadm sds apst 
>> [    2.233159] scsi host0: ahci
>> [    2.233275] scsi host1: ahci
>> [    2.233376] scsi host2: ahci
>> [    2.233473] scsi host3: ahci
>> [    2.233567] scsi host4: ahci
>> [    2.233608] ata1: DUMMY
>> [    2.233613] ata2: DUMMY
>> [    2.233616] ata3: DUMMY
>> [    2.233620] ata4: DUMMY
>> [    2.233626] ata5: SATA max UDMA/133 abar m2048@0xc53a3000 port 0xc53a3300 irq 125 lpm-pol 0
>> [    2.233868]  nvme0n1: p1 p2 p3 p4 p5 p6 p7 p8
>> [    2.234114] xhci_hcd 0000:00:14.0: xHCI Host Controller
>> [    2.234134] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1
>> [    2.235215] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x110 quirks 0x0000000000009810
>> [    2.235424] xhci_hcd 0000:00:14.0: xHCI Host Controller
>> [    2.235433] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 2
>> [    2.235443] xhci_hcd 0000:00:14.0: Host supports USB 3.1 Enhanced SuperSpeed
>> [    2.235491] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.16
>> [    2.235504] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
>> [    2.235512] usb usb1: Product: xHCI Host Controller
>> [    2.235519] usb usb1: Manufacturer: Linux 6.16.0-rc1+ xhci-hcd
>> [    2.235526] usb usb1: SerialNumber: 0000:00:14.0
>> [    2.235680] hub 1-0:1.0: USB hub found
>> [    2.235706] hub 1-0:1.0: 16 ports detected
>> [    2.237401] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.16
>> [    2.237414] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
>> [    2.237422] usb usb2: Product: xHCI Host Controller
>> [    2.237429] usb usb2: Manufacturer: Linux 6.16.0-rc1+ xhci-hcd
>> [    2.237436] usb usb2: SerialNumber: 0000:00:14.0
>> [    2.237932] hub 2-0:1.0: USB hub found
>> [    2.238337] hub 2-0:1.0: 8 ports detected
>> [    2.239183] usb: port power management may be unreliable
>> [    2.240076] usbcore: registered new interface driver usb-storage
>> [    2.240478] usbcore: registered new interface driver ums-realtek
>> [    2.240909] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f03:PS2M] at 0x60,0x64 irq 1,12
>> [    2.864710] i8042: Detected active multiplexing controller, rev 1.1
>> [    2.868036] serio: i8042 KBD port at 0x60,0x64 irq 1
>> [    2.868423] serio: i8042 AUX0 port at 0x60,0x64 irq 12
>> [    2.868802] serio: i8042 AUX1 port at 0x60,0x64 irq 12
>> [    2.869173] serio: i8042 AUX2 port at 0x60,0x64 irq 12
>> [    2.869539] serio: i8042 AUX3 port at 0x60,0x64 irq 12
>> [    2.870083] mousedev: PS/2 mouse device common for all mice
>> [    2.870837] rtc_cmos 00:04: RTC can wake from S4
>> [    2.872190] rtc_cmos 00:04: registered as rtc0
>> [    2.872719] rtc_cmos 00:04: setting system clock to 2025-07-11T12:03:55 UTC (1752235435)
>> [    2.873084] rtc_cmos 00:04: alarms up to one month, y3k, 242 bytes nvram
>> [    2.873443] i2c_dev: i2c /dev entries driver
>> [    2.874764] intel_pstate: Intel P-state driver initializing
>> [    2.875239] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input6
>> [    2.875900] intel_pstate: HWP enabled
>> [    2.876262] NET: Registered PF_PACKET protocol family
>> [    2.876471] NET: Registered PF_KEY protocol family
>> [    2.876677] Key type dns_resolver registered
>> [    2.885858] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
>> [    2.886524] microcode: Current revision: 0x00000100
>> [    2.886735] microcode: Updated early from: 0x000000c8
>> [    2.887330] IPI shorthand broadcast: enabled
>> [    2.888740] sched_clock: Marking stable (2881675719, 5632127)->(2920355457, -33047611)
>> [    2.889154] registered taskstats version 1
>> [    2.889354] Loading compiled-in X.509 certificates
>> [    2.962838] ata5: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
>> [    2.994184] ata5.00: ATA-10: ST2000LM015-2E8174, 0001, max UDMA/133
>> [    3.066201] ata5.00: 3907029168 sectors, multi 16: LBA48 NCQ (depth 32), AA
>> [    3.089932] usb 1-8: new high-speed USB device number 2 using xhci_hcd
>> [    3.117001] ata5.00: configured for UDMA/133
>> [    3.117261] scsi 4:0:0:0: Direct-Access     ATA      ST2000LM015-2E81 0001 PQ: 0 ANSI: 5
>> [    3.117610] sd 4:0:0:0: Attached scsi generic sg0 type 0
>> [    3.117627] sd 4:0:0:0: [sda] 3907029168 512-byte logical blocks: (2.00 TB/1.82 TiB)
>> [    3.118076] sd 4:0:0:0: [sda] 4096-byte physical blocks
>> [    3.118269] sd 4:0:0:0: [sda] Write Protect is off
>> [    3.118454] sd 4:0:0:0: [sda] Mode Sense: 00 3a 00 00
>> [    3.118460] sd 4:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
>> [    3.118661] sd 4:0:0:0: [sda] Preferred minimum I/O size 4096 bytes
>> [    3.214333]  sda: sda1 sda2 sda3 sda4 sda5 sda6 sda7 sda8 sda9
>> [    3.215066] sd 4:0:0:0: [sda] Attached SCSI disk
>> [    3.237328] PM: Image not found (code -22)
>> [    3.237331] clk: Disabling unused clocks
>> [    3.237546] ALSA device list:
>> [    3.237756]   No soundcards found.
>> [    3.241828] EXT4-fs (nvme0n1p4): mounted filesystem b767471d-f668-40d4-a6e0-1b2a0a1725f0 ro with ordered data mode. Quota mode: disabled.
>> [    3.242084] VFS: Mounted root (ext4 filesystem) readonly on device 259:4.
>> [    3.242782] devtmpfs: mounted
>> [    3.243295] usb 1-8: New USB device found, idVendor=04f2, idProduct=b685, bcdDevice=54.04
>> [    3.243454] Freeing unused kernel image (initmem) memory: 2172K
>> [    3.243527] usb 1-8: New USB device strings: Mfr=2, Product=1, SerialNumber=0
>> [    3.243743] Write protecting the kernel read-only data: 20480k
>> [    3.243945] usb 1-8: Product: Chicony USB2.0 Camera
>> [    3.244424] usb 1-8: Manufacturer: Sonix Technology Co., Ltd.
>> [    3.245442] Freeing unused kernel image (text/rodata gap) memory: 224K
>> [    3.246063] Freeing unused kernel image (rodata/data gap) memory: 1476K
>> [    3.254556] x86/mm: Checked W+X mappings: passed, no W+X pages found.
>> [    3.254776] Run /sbin/init as init process
>> [    3.254993]   with arguments:
>> [    3.254994]     /sbin/init
>> [    3.254994]   with environment:
>> [    3.254995]     HOME=/
>> [    3.254995]     TERM=linux
>> [    3.254996]     BOOT_IMAGE=/boot/vmlinuz-6.16.0-rc1+
>> [    3.365667] usb 1-14: new full-speed USB device number 3 using xhci_hcd
>> [    3.430466] intel-lpss 0000:00:15.0: enabling device (0004 -> 0006)
>> [    3.432490] intel-lpss 0000:00:15.1: enabling device (0004 -> 0006)
>> [    3.433324] mei_me 0000:00:16.0: enabling device (0000 -> 0002)
>> [    3.433454] i801_smbus 0000:00:1f.4: SPD Write Disable is set
>> [    3.433988] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
>> [    3.435726] i2c i2c-6: Successfully instantiated SPD at 0x50
>> [    3.438784] mmc0: cannot verify signal voltage switch
>> [    3.456227] snd_hda_intel 0000:00:1f.3: enabling device (0000 -> 0002)
>> [    3.457334] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops 0xffffffffbc4a99c0)
>> [    3.459261] r8169 0000:08:00.1 eth0: RTL8411b, 80:fa:5b:84:b0:5f, XID 5c8, IRQ 141
>> [    3.459614] r8169 0000:08:00.1 eth0: jumbo features [frames: 9194 bytes, tx checksumming: ko]
>> [    3.503913] usb 1-14: New USB device found, idVendor=8087, idProduct=0026, bcdDevice= 0.02
>> [    3.504205] usb 1-14: New USB device strings: Mfr=0, Product=0, SerialNumber=0
>> [    3.512673] snd_hda_codec_realtek hdaudioC0D0: ALC293: picked fixup  for PCI SSID 1558:8668
>> [    3.513669] snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC293: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:speaker
>> [    3.514067] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
>> [    3.514463] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=1 (0x15/0x0/0x0/0x0/0x0)
>> [    3.514854] snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=0x0
>> [    3.515193] snd_hda_codec_realtek hdaudioC0D0:    inputs:
>> [    3.515564] snd_hda_codec_realtek hdaudioC0D0:      Internal Mic=0x12
>> [    3.515952] snd_hda_codec_realtek hdaudioC0D0:      Front Mic=0x18
>> [    3.516349] snd_hda_codec_realtek hdaudioC0D0:      Headset Mic=0x1a
>> [    3.527621] MXM: GUID detected in BIOS
>> [    3.528165] pci 0000:01:00.0: optimus capabilities: enabled, status dynamic power, hda bios codec supported
>> [    3.528512] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG0.PEGP handle
>> [    3.528882] nouveau: detected PR support, will not use DSM
>> [    3.529413] nouveau 0000:01:00.0: enabling device (0006 -> 0007)
>> [    3.529948] nouveau 0000:01:00.0: NVIDIA TU117 (167000a1)
>> [    3.535664] usb 1-8: Found UVC 1.00 device Chicony USB2.0 Camera (04f2:b685)
>> [    3.543565] usbcore: registered new interface driver uvcvideo
>> [    3.552562] usbcore: registered new interface driver btusb
>> [    3.553675] mmc0: new UHS-I speed SDR104 SDHC card at address aaaa
>> [    3.554074] mmcblk0: mmc0:aaaa SC32G 29.7 GiB
>> [    3.556268]  mmcblk0: p1
>> [    3.561631] Bluetooth: hci0: Found device firmware: intel/ibt-19-0-4.sfi
>> [    3.561918] Bluetooth: hci0: Boot Address: 0x24800
>> [    3.562149] Bluetooth: hci0: Firmware Version: 132-3.24
>> [    3.562379] Bluetooth: hci0: Firmware already loaded
>> [    3.565901] Bluetooth: hci0: HCI LE Coded PHY feature bit is set, but its usage is not supported.
>> [    3.577892] input: HDA Intel PCH Front Mic as /devices/pci0000:00/0000:00:1f.3/sound/card0/input11
>> [    3.578248] input: HDA Intel PCH Front Headphone as /devices/pci0000:00/0000:00:1f.3/sound/card0/input12
>> [    3.578574] input: HDA Intel PCH HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input13
>> [    3.578931] input: HDA Intel PCH HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input14
>> [    3.579244] input: HDA Intel PCH HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input15
>> [    3.613028] nouveau 0000:01:00.0: bios: version 90.17.42.00.36
>> [    3.614727] nouveau 0000:01:00.0: pmu: firmware unavailable
>> [    3.617275] nouveau 0000:01:00.0: fb: 4096 MiB GDDR6
>> [    3.662785] vga_switcheroo: enabled
>> [    3.663054] nouveau 0000:01:00.0: drm: VRAM: 4096 MiB
>> [    3.663258] nouveau 0000:01:00.0: drm: GART: 536870912 MiB
>> [    3.663461] nouveau 0000:01:00.0: drm: BIT table 'A' not found
>> [    3.663671] nouveau 0000:01:00.0: drm: BIT table 'L' not found
>> [    3.663871] nouveau 0000:01:00.0: drm: TMDS table version 2.0
>> [    3.664548] nouveau 0000:01:00.0: drm: MM: using COPY for buffer copies
>> [    3.665084] [drm] Initialized nouveau 1.4.0 for 0000:01:00.0 on minor 1
>> [    3.665312] nouveau 0000:01:00.0: [drm] No compatible format found
>> [    3.665513] nouveau 0000:01:00.0: [drm] Cannot find any crtc or sizes
>> [    3.665798] nouveau 0000:01:00.0: drm: Disabling PCI power management to avoid bug
>> [    5.867873] Adding 65535996k swap on /dev/sda5.  Priority:1 extents:1 across:65535996k 
>> [    5.910055] EXT4-fs (nvme0n1p4): re-mounted b767471d-f668-40d4-a6e0-1b2a0a1725f0.
>> [    5.940567] EXT4-fs (nvme0n1p4): re-mounted b767471d-f668-40d4-a6e0-1b2a0a1725f0 r/w.
>> [    6.038466] EXT4-fs (sda2): mounted filesystem 2c2b28d1-e737-40ab-9bd6-d0e29f0e6c1d r/w with ordered data mode. Quota mode: disabled.
>> [    6.310034] EXT4-fs (sda6): mounted filesystem 0cc4bd15-983d-4064-8479-ffd5757fbb12 r/w with ordered data mode. Quota mode: disabled.
>> [    6.394138] EXT4-fs (sda8): mounted filesystem cc547c90-65be-4279-a6bc-cd33137355ca r/w with ordered data mode. Quota mode: disabled.
>> [    6.521037] EXT4-fs (sda9): mounted filesystem c277df28-daed-4d3a-9c12-9009d53ad75e r/w with ordered data mode. Quota mode: disabled.
>> [    8.502114] Generic FE-GE Realtek PHY r8169-0-801:00: attached PHY driver (mii_bus:phy_addr=r8169-0-801:00, irq=MAC)
>> [    8.635903] r8169 0000:08:00.1 eth0: No native access to PCI extended config space, falling back to CSI
>> [    8.662295] r8169 0000:08:00.1 eth0: Link is Down
>> [   10.864929] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
>> [   10.864931] Bluetooth: BNEP filters: protocol multicast
>> [   10.864934] Bluetooth: BNEP socket layer initialized
>> [   10.866874] Bluetooth: MGMT ver 1.23
>> [   11.618226] r8169 0000:08:00.1 eth0: Link is Up - 1Gbps/Full - flow control rx/tx
>> [   12.230612] CIFS: enabling forceuid mount option implicitly because uid= option is specified
>> [   12.230614] CIFS: enabling forcegid mount option implicitly because gid= option is specified
>> [   12.230614] CIFS: Attempting to mount //nas/Share
>> [   14.540553] CIFS: enabling forceuid mount option implicitly because uid= option is specified
>> [   14.540555] CIFS: enabling forcegid mount option implicitly because gid= option is specified
>> [   14.540556] CIFS: Attempting to mount //nas/Media
>> [   17.823511] ------------[ cut here ]------------
>> [   17.823513] WARNING: CPU: 11 PID: 1236 at drivers/gpu/drm/drm_gem.c:286 drm_gem_object_handle_put_unlocked+0xa5/0xe0
>> [   17.823517] Modules linked in: bnep xt_MASQUERADE iptable_nat nf_nat xt_LOG nf_log_syslog xt_limit xt_multiport xt_conntrack iptable_filter nf_conntrack_ftp xt_CT nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_raw ip_tables ntfs3 snd_hda_codec_hdmi btusb btrtl btbcm btmtk btintel uvcvideo videobuf2_vmalloc uvc videobuf2_memops videobuf2_v4l2 videobuf2_common snd_hda_codec_realtek nouveau snd_hda_codec_generic snd_hda_scodec_component drm_ttm_helper gpu_sched snd_hda_intel coretemp snd_intel_dspcfg hwmon x86_pkg_temp_thermal wmi_bmof drm_gpuvm snd_hda_codec r8169 mei_me drm_exec snd_hwdep i2c_i801 intel_lpss_pci snd_hda_core mei i2c_smbus intel_lpss i2c_hid_acpi i2c_hid uhid hid uinput
>> [   17.823540] CPU: 11 UID: 0 PID: 1236 Comm: Xorg Not tainted 6.16.0-rc1+ #688 PREEMPT(lazy) 
>> [   17.823541] Hardware name: Notebook                         NP50DE_DB                       /NP50DE_DB                       , BIOS 1.07.04 02/17/2020
>> [   17.823542] RIP: 0010:drm_gem_object_handle_put_unlocked+0xa5/0xe0
>> [   17.823544] Code: 41 ce 5f 00 48 89 ef e8 89 5e 5f 00 eb d8 48 8b 43 08 48 8d b8 e8 05 00 00 e8 57 ed 5b 00 c7 83 e0 00 00 00 00 00 00 00 eb 98 <0f> 0b e9 14 ce 5f 00 48 8b 83 40 01 00 00 48 8b 00 48 85 c0 74 19
>> [   17.823545] RSP: 0018:ffff9b5ac1d5bd38 EFLAGS: 00010246
>> [   17.823546] RAX: 0000000000000000 RBX: ffff96300267cc00 RCX: 0000000000000001
>> [   17.823547] RDX: 000000000000447b RSI: ffffffffbd13df00 RDI: ffff96300267cc00
>> [   17.823548] RBP: ffff963002b59600 R08: ffff96300267ccc8 R09: ffffffffbbde3864
>> [   17.823549] R10: ffffdc3a8404b100 R11: ffff9630012c4940 R12: ffff96300bfd6800
>> [   17.823549] R13: ffffffffbbdbce10 R14: ffff9b5ac1d5be00 R15: 0000000000000001
>> [   17.823550] FS:  00007fcc29b9d080(0000) GS:ffff9637835a5000(0000) knlGS:0000000000000000
>> [   17.823551] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   17.823552] CR2: 00007fcc2afb2110 CR3: 0000000106ba9006 CR4: 00000000007706f0
>> [   17.823552] PKRU: 55555554
>> [   17.823553] Call Trace:
>> [   17.823554]  <TASK>
>> [   17.823555]  drm_gem_handle_delete+0x7f/0xd0
>> [   17.823556]  ? __pfx_drm_mode_destroy_dumb_ioctl+0x10/0x10
>> [   17.823558]  drm_ioctl_kernel+0x9d/0xf0
>> [   17.823560]  drm_ioctl+0x217/0x4c0
>> [   17.823561]  ? __pfx_drm_mode_destroy_dumb_ioctl+0x10/0x10
>> [   17.823562]  ? rpm_suspend+0x25e/0x5f0
>> [   17.823564]  nouveau_drm_ioctl+0x4f/0xa0 [nouveau]
>> [   17.823623]  __x64_sys_ioctl+0x7d/0xd0
>> [   17.823625]  do_syscall_64+0x4c/0x1d0
>> [   17.823627]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> [   17.823629] RIP: 0033:0x7fcc2ab14c87
>> [   17.823630] Code: 3c 1c e8 2c ff ff ff 85 c0 79 97 49 c7 c4 ff ff ff ff 5b 5d 4c 89 e0 41 5c c3 66 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b1 11 0d 00 f7 d8 64 89 01 48
>> [   17.823630] RSP: 002b:00007fff6650e808 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>> [   17.823632] RAX: ffffffffffffffda RBX: 000000000e74dcc0 RCX: 00007fcc2ab14c87
>> [   17.823633] RDX: 00007fff6650e85c RSI: 00000000c00464b4 RDI: 0000000000000013
>> [   17.823633] RBP: 00007fff6650e830 R08: 0000000000000020 R09: 0000000000000100
>> [   17.823634] R10: 00007fcc2ac4a800 R11: 0000000000000246 R12: 00007fff6650e85c
>> [   17.823635] R13: 00000000c00464b4 R14: 0000000000000013 R15: 000000000e72f390
>> [   17.823636]  </TASK>
>> [   17.823636] ---[ end trace 0000000000000000 ]---
>> [   24.701841] nvme nvme0: using unchecked data buffer
>> [   24.707904] block nvme0n1: No UUID available providing old NGUID
>> [   25.044868] EXT4-fs (mmcblk0p1): mounted filesystem 4029118a-5c99-4829-a3e0-8e266348e8f5 r/w with ordered data mode. Quota mode: disabled.
>> [   26.850485] input: LOGI M240 Mouse as /devices/virtual/misc/uhid/0005:046D:B03A.0001/input/input16
>> [   26.850535] hid-generic 0005:046D:B03A.0001: input: BLUETOOTH HID v0.09 Mouse [LOGI M240] on 34:7d:f6:df:83:1e
>> [   27.317702] Bluetooth: RFCOMM TTY layer initialized
>> [   27.317708] Bluetooth: RFCOMM socket layer initialized
>> [   27.317712] Bluetooth: RFCOMM ver 1.11
> 
>> # bad: [d7b8f8e20813f0179d8ef519541a3527e7661d3a] Linux 6.16-rc5
>> # good: [d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af] Linux 6.16-rc4
>> git bisect start 'v6.16-rc5' 'v6.16-rc4'
>> # good: [923d401238c590f39833a2015f6f9493f146d98f] Merge tag 'iommu-fixes-v6.16-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux
>> git bisect good 923d401238c590f39833a2015f6f9493f146d98f
>> # bad: [3c2bd251d2039ce2778c35ced5ef47b3a379f5df] Merge tag 'usb-6.16-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb
>> git bisect bad 3c2bd251d2039ce2778c35ced5ef47b3a379f5df
>> # bad: [da8d8e9001c6a3741e9bec26a6cdcfd75ecabc88] Merge tag 'drm-xe-fixes-2025-07-03' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
>> git bisect bad da8d8e9001c6a3741e9bec26a6cdcfd75ecabc88
>> # bad: [b91e11ec5cd972dc39121496c3a0cf2ec2e9a393] Merge tag 'drm-misc-fixes-2025-07-03' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
>> git bisect bad b91e11ec5cd972dc39121496c3a0cf2ec2e9a393
>> # good: [8af39ec5cf2be522c8eb43a3d8005ed59e4daaee] drm/sched: Increment job count before swapping tail spsc queue
>> git bisect good 8af39ec5cf2be522c8eb43a3d8005ed59e4daaee
>> # good: [34659c1a1f4fd4c148ab13e13b11fd64df01ffcd] drm/amdkfd: add hqd_sdma_get_doorbell callbacks for gfx7/8
>> git bisect good 34659c1a1f4fd4c148ab13e13b11fd64df01ffcd
>> # good: [bf906c988d77d9cdfb52a7d19ad9b183991271a3] Merge tag 'amd-drm-fixes-6.16-2025-07-01' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
>> git bisect good bf906c988d77d9cdfb52a7d19ad9b183991271a3
>> # bad: [226862f50a7a88e4e4de9abbf36c64d19acd6fd0] drm/v3d: Disable interrupts before resetting the GPU
>> git bisect bad 226862f50a7a88e4e4de9abbf36c64d19acd6fd0
>> # bad: [5307dce878d4126e1b375587318955bd019c3741] drm/gem: Acquire references on GEM handles for framebuffers
>> git bisect bad 5307dce878d4126e1b375587318955bd019c3741
>> # first bad commit: [5307dce878d4126e1b375587318955bd019c3741] drm/gem: Acquire references on GEM handles for framebuffers
> 
> 

