Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJZvCc84jGlZjgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 09:07:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E441220E1
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 09:07:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB9D10E219;
	Wed, 11 Feb 2026 08:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mH8GxnQq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1ABC10E06F
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 07:26:17 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-896f82e5961so28086696d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 23:26:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770794776; cv=none;
 d=google.com; s=arc-20240605;
 b=XM6xhuv5p38yeho1aWY2r80JTdg77ZmLh6icP+0ILjq4h/qeUBfL25kzsDVvFASZCr
 6dOhN2C7IJ53Aj3kSPHv2VHECjPAnaxPA6hA3jqtWyZVDOFg2ghzNWNQ0QLR6Ya0zh3R
 bFjGMQxz30HmLvifznsJwzWxUAV7DfaV5JjnJtSaMCXfYpBaFzPW0ZR5Eytsw1hPQvTR
 Y7djf2RGdBV5xtCums7CbOhI+0mwJ3ycjW5/cKZtkhx4o5OeUglA83jQMuumY5iyUT2D
 ygMZEau0094Z4ExXUIOdjOPC7eJFAjF6nljg0IhOGDENqy4p1ISke4uivjgwra/1HZQP
 TDtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:dkim-signature;
 bh=RFaU2NRQRDYSNUDUGGxX8dRYuGFkNvmUVJZW3WIq35A=;
 fh=A08XZwmmb57jzirbgTkluPSvjDeiJMkkojF1n6qDmTk=;
 b=JFFOIuIA0PUS5UTQxcrbO4fJPNlmKqEqeY44ZlMeW8+SIazYBOf3Si53vaM+FYjR0K
 8uiSYa5gOJqqsQ3fpPeAv33u8fcmabPl0+x5lOVad4V2vWFF1VVnnN6ZS09Dd63ZWQ2j
 v0afXEbjqx++k7Ruc6B164vI0L8ROIN14llkg/hVfQFoB5FYy6p5/LxtDiBOPfotBErs
 KCN8799UeI+5I8Uemklijh//EBoS4Qeo+zNPQzPcl3Z09fLscGBIzkzTifW76U23f7df
 CJ1E3/GrQVZmLao4vI1mKHWMXQCshxsBNBZYdx0+3BJYST0FFu74e6iqpeYkU9M/LgMD
 r2QQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770794776; x=1771399576; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RFaU2NRQRDYSNUDUGGxX8dRYuGFkNvmUVJZW3WIq35A=;
 b=mH8GxnQqjAqm/N4NI3tUG4KoqDoHDGSfDq/ZA5VH5j8UtPbPIW7CN0ix0K/wjWjpXb
 5vVUQ0F4qL80jTD2Sgiot42/pWj3j8uHEb7lmHsChGehaNaR3TS37Kylk3zYMTt+w0LA
 I9SqWjXRPiUgp3tpdV07wjTaFtfiFGYPpKolFueGc9lOaDWtD50AzpoI5ovEr4qlSVK9
 E+Bq2CDwmVCqHanVWCawxWzMvqWqvIy6z1rrGOPgD1GXSDiZWjSiK82/G11K/erRxti3
 hICVJ9QDMWqm6bJZShT5ijjj8BdH6sApiCHOeTmX+vdaNx8ye7YFzw9iEUprLJmU3Clg
 O9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770794776; x=1771399576;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RFaU2NRQRDYSNUDUGGxX8dRYuGFkNvmUVJZW3WIq35A=;
 b=JLsA0ygxBNhybcqQXqT5v3ldt3JXYI32jw6LJrlCYywPsGurhqqxoaWUxWlpqxgcJQ
 Po/4eKAS1526B+dLTQYKmUamdQz99DlTMQHdVwmvXd6CaJtZKNg5aRXWSteqQYqfkAjJ
 wCC3C32G6LTiID2qhs+ZWCKDDePtBwKkeD+GPB6IBGvSK813cNvCuc1nvOyA1sH6B+SW
 l8Q+Oqsqp3AP+BvdsvNJM+tj/dq31FHHlN5OJF2AxQi6gUJElsyaol3z83ilxlwIhirs
 PaYjcwOyv1UO7uusQU0yDCy8odanIPufej+YzYiH0kLigOtvEbjUwUk804wnE2udja46
 rAuA==
X-Gm-Message-State: AOJu0YxUkX1CGKHh8ijlo0cCrc/UIuligGHin0jJHahDcsRiuYUZu+/N
 1EU98wkkbMrBoaKhGelHePwS4JFkPY7Z4CnfX1Z3hRaolSsY/tL+wMD7cFTEn5+ZV0IVtt6OlKc
 C/XnpvbK2zu5KddmLrkIt7gsYKQcUaUw=
X-Gm-Gg: AZuq6aKL3cETSVRmR83mme6wIaWGlgu/idKynkhHX9bwhwTkcE3f0Oop4JHgCdnVF4U
 6ARRAEWptxJraSvz2RjCDn7cHeZzKEwyrvR1MZLY1P2V6ztx51/uxsq9Q3Tj/3ERYw/f+ySTZoa
 9Z9m73NsvRSnL1VMtnYKQASvnSxomtpc2ZPDNBGXfP3SEVIKPnm4jfjXPzxPqpHZSg7nSLsfTLg
 XcB56ZLtINugRk53Nu4F+YhvmZK036r9LRpb2GVs5mkofXthFIQulsw6lX3vac2YRZTWiOCoW5Z
 hmSoxtXhkLYahNgoxUVeBiAspmFkuGjfWcSSr1cxZICfKImA/sBPAVJvyY+buyqrqU4=
X-Received: by 2002:a05:6214:4008:b0:897:1ff:a6c with SMTP id
 6a1803df08f44-8971ae7750amr23675426d6.10.1770794775491; Tue, 10 Feb 2026
 23:26:15 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 11 Feb 2026 17:26:03 +1000
X-Gm-Features: AZwV_QixaCVx-pxIi9_rDuKlyxSHZ2VfpZdim7kBGsxYvRcCyoRkokAWowOwT4U
Message-ID: <CAPM=9tzgmO1PWeuxjAxqOmS5PTsOe8jHP9Poy23q6tvY66B1KQ@mail.gmail.com>
Subject: [git pull] drm for 7.0-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 11 Feb 2026 08:07:28 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 08E441220E1
X-Rspamd-Action: no action

Hi Linus,

This is the main drm pull request for 7.0.

Conflicts:
There are a number of easy to solve conflicts in amdgpu and xe, and
one silent one in xe,

/tmp/next/build/drivers/gpu/drm/xe/xe_survivability_mode.c: In
function 'xe_survivability_mode_fini':
/tmp/next/build/drivers/gpu/drm/xe/xe_survivability_mode.c:241:17:
error: implicit declaration of function 'xe_nvm_fini'; did you mean
'xe_nvm_init'? [-Wimplicit-function-declaration]
  241 |                 xe_nvm_fini(xe);
      |                 ^~~~~~~~~~~
      |                 xe_nvm_init

You can just drop the two lines.

I've pushed my likely messed up attempt at a merge here:
https://github.com/airlied/linux/tree/drm-next-7.0-rc1-merged

Highlights:
- amdgpu support for lots of new IP blocks which means newer GPUs.
- xe has a lot of SR-IOV and SVM improvements
- lots of intel display refactoring across i915/xe
- msm has more support for gen8 platforms
- Given up on kgdb/kms integration, it's too hard on modern hw

Otherwise the full summary is below.

Let me know if there are any problems,
Dave.

drm-next-2026-02-11:
drm for 7.0-rc1

core:
- drop kgdb support
- replace system workqueue with percpu
- account for property blobs in memcg
- MAINTAINERS updates for xe + buddy

rust:
- Fix documentation for Registration constructors.
- Use pin_init::zeroed() for fops initialization.
- Annotate DRM helpers with __rust_helper.
- Improve safety documentation for gem::Object::new().
- Update AlwaysRefCounted imports.
- mm: Prevent integer overflow in page_align().

atomic:
- add drm_device pointer to drm_private_obj
- introduce gamma/degamma LUT size check

buddy:
- fix free_trees memory leak
- prevent BUG_ON

bridge:
- introduce drm_bridge_unplug/enter/exit
- add connector argument to .hpd_notify
- lots of recounting conversions
- convert rockchip inno hdmi to bridge
- lontium-lt9611uxc: switch to HDMI audio helpers
- dw-hdmi-qp: add support for HPD-less setups
- Algoltek AG6311 support

panels:
- edp: CSW MNE007QB3-1, AUO B140HAN06.4, AUO B140QAX01.H
- st75751: add SPI support
- Sitronix ST7920, Samsung LTL106HL02
- LG LH546WF1-ED01, HannStar HSD156J
- BOE NV130WUM-T08
- Innolux G150XGE-L05
- Anbernic RG-DS

dma-buf:
- improve sg_table debugging
- add tracepoints
- call clear_page instead of memset
- start to introduce cgroup memory accounting in heaps
- remove sysfs stats

dma-fence:
- add new helpers

dp:
- mst: avoid oob access with vcpi=3D0

hdmi:
- limit infoframes exposure to userspace

gem:
- reduce page table overhead with THP
- fix leak in drm_gem_get_unmapped_area

gpuvm:
- API sanitation for rust bindings

sched:
- introduce new helpers

panic:
- report invalid panic modes
- add kunit tests

i915/xe display:
- Expose sharpness only if num_scalers is >=3D 2
- Add initial Xe3P_LPD for NVL
- BMG FBC support
- Add MTL+ platforms to support dpll framework
_ fix DIMM_S DRM decoding on ICL
- Return to using AUX interrupts
- PSR/Panel replay refactoring
- use consolidation HDMI tables
- Xe3_LPD CD2X dividier changes

xe:
- vfio: add vfio_pci for intel GPU
- multi queue support
- dynamic pagemaps and multi-device SVM
- expose temp attribs in hwmon
- NO_COMPRESSION bo flag
- expose MERT OA unit
- sysfs survivability refactor
- SRIOV PF: add MERT support
- enable SR-IOV VF migration
- Enable I2C/NVM on Crescent Island
- Xe3p page reclaimation support
- introduce SRIOV scheduler groups
- add SoC remappt support in system controller
- insert compiler barriers in GuC code
- define NVL GuC firmware
- handle GT resume failure
- fix drm scheduler layering violations
- enable GSC loading and PXP for PTL
- disable GuC Power DCC strategy on PTL
- unregister drm device on probe error

i915:
- move to kernel standard fault injection
- bump recommended GuC version for DG2 and MTL

amdgpu:
- SMUIO 15.x, PSP 15.x support
- IH 6.1.1/7.1 support
- MMHUB 3.4/4.2 support
- GC 11.5.4/12.1 support
- SDMA 6.1.4/7.1/7.11.4 support
- JPEG 5.3 support
- UserQ updates
- GC 9 gfx queue reset support
- TTM memory ops parallelization
- convert legacy logging to new helpers
- DC analog fixes

amdkfd:
- GC 11.5.4/12.1 suppport
- SDMA 6.1.4/7.1 support
- per context support
- increase kfd process hash table
- Reserved SDMA rework

radeon:
- convert legacy logging to new helpers
- use devm for i2c adapters

msm:
- GPU
  - Document a612/RGMU dt bindings
  - UBWC 6.0 support (for A840 / Kaanapali)
  - a225 support
- DPU:
  - Switched to use virtual planes by default
  - Fixed DSI CMD panels on DPU 3.x
  - Rewrote format handling to remove intermediate representation
  - Fixed watchdog on DPU 8.x+
  - Fixed TE / Vsync source setting on DPU 8.x+
  - Added 3D_Mux on SC7280
  - Kaanapali platform support
  - Fixed UBWC register programming
  - Made RM reserve DSPP-enabled mixers for CRTCs with LMs.
  - Gamma correction support
- DP:
  - Enabled support for eDP 1.4+ link rate tables
  - Fixed MDSS1 DP indices on SA8775P, making them to work
  - Fixed msm_dp_ctrl_config_msa() to work with LLVM 20
- DSI:
  - Documented QCS8300 as compatible with SA8775P
  - Kaanapali platform support
- DSI PHY:
  - switched to divider_determine_rate()
- MDP5:
  - Dropped support for MSM8998, SDM660 and SDM630 (switched over
    to DPU)
-  MDSS:
  - Kaanapali platform support
  - Fixed UBWC register programming

nova-core:
- Prepare for Turing support. This includes parsing and handling
  Turing-specific firmware headers and sections as well as a Turing
  Falcon HAL implementation.
- Get rid of the Result<impl PinInit<T, E>> anti-pattern.
- Relocate initializer-specific code into the appropriate initializer.
- Use CStr::from_bytes_until_nul() to remove custom helpers.
- Improve handling of unexpected firmware values.
- Clean up redundant debug prints.
- Replace c_str!() with native Rust C-string literals.
- Update nova-core task list.

nova:
- Align GEM object size to system page size.

tyr:
- Use generated uAPI bindings for GpuInfo.
- Replace manual sleeps with read_poll_timeout().
- Replace c_str!() with native Rust C-string literals.
- Suppress warnings for unread fields.
- Fix incorrect register name in print statement.

nouveau:
- fix big page table support races in PTE management
- improve reclocking on tegra 186+

amdxdna:
- fix suspend race conditions
- improve handling of zero tail pointers
- fix cu_idx overwritten during command setup
- enable hardware context priority
- remove NPU2 support
- update message buffer allocation requirements
- update firmware version check

ast:
- support imported cursor buffers
- big endian fixes

etnaviv:
- add PPU flop reset support

imagination:
- add AM62P support
- introduce hw version checks

ivpu:
- implement warm boot flow

panfrost:
- add bo sync ioctl
- add GPU_PM_RT support for RZ/G3E SoC

panthor:
- add bo sync ioctl
- enable timestamp propagation
- scheduler robustness improvements
- VM termination fixes
- huge page support

rockchip:
- RK3368 HDMI Support
- get rid of atomic_check fixups
- RK3506 support
- RK3576/RK3588 improved HPD handling

rz-du:
- RZ/V2H(P) MIPI-DSI Support

v3d:
- fix DMA segment size
- convert to new logging helpers

mediatek:
- move DP training to hotplug thread
- convert logging to new helpers
- add support for HS speed DSI
- Genio 510/700/1200-EVK, Radxa NIO-12L HDMI support

atmel-hlcdc:
- switch to drmm resource
- support nomodeset
- use newer helpers

hisilicon:
- fix various DP bugs

renesas:
- fix kernel panic on reboot

exynos:
- fix vidi_connection_ioctl using wrong device
- fix vidi_connection deref user ptr
- fix concurrency regression with vidi_context

vkms:
- add configfs support for display configuration
The following changes since commit 63804fed149a6750ffd28610c5c1c98cce6bd377=
:

  Linux 6.19-rc7 (2026-01-25 14:11:24 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2026-02-11

for you to fetch changes up to 2f5db9b4002470ea19380326c5a390647c56e780:

  Merge tag 'drm-xe-next-fixes-2026-02-05' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2026-02-06
13:02:44 +1000)

----------------------------------------------------------------
drm for 7.0-rc1

core:
- drop kgdb support
- replace system workqueue with percpu
- account for property blobs in memcg
- MAINTAINERS updates for xe + buddy

rust:
- Fix documentation for Registration constructors.
- Use pin_init::zeroed() for fops initialization.
- Annotate DRM helpers with __rust_helper.
- Improve safety documentation for gem::Object::new().
- Update AlwaysRefCounted imports.
- mm: Prevent integer overflow in page_align().

atomic:
- add drm_device pointer to drm_private_obj
- introduce gamma/degamma LUT size check

buddy:
- fix free_trees memory leak
- prevent BUG_ON

bridge:
- introduce drm_bridge_unplug/enter/exit
- add connector argument to .hpd_notify
- lots of recounting conversions
- convert rockchip inno hdmi to bridge
- lontium-lt9611uxc: switch to HDMI audio helpers
- dw-hdmi-qp: add support for HPD-less setups
- Algoltek AG6311 support

panels:
- edp: CSW MNE007QB3-1, AUO B140HAN06.4, AUO B140QAX01.H
- st75751: add SPI support
- Sitronix ST7920, Samsung LTL106HL02
- LG LH546WF1-ED01, HannStar HSD156J
- BOE NV130WUM-T08
- Innolux G150XGE-L05
- Anbernic RG-DS

dma-buf:
- improve sg_table debugging
- add tracepoints
- call clear_page instead of memset
- start to introduce cgroup memory accounting in heaps
- remove sysfs stats

dma-fence:
- add new helpers

dp:
- mst: avoid oob access with vcpi=3D0

hdmi:
- limit infoframes exposure to userspace

gem:
- reduce page table overhead with THP
- fix leak in drm_gem_get_unmapped_area

gpuvm:
- API sanitation for rust bindings

sched:
- introduce new helpers

panic:
- report invalid panic modes
- add kunit tests

i915/xe display:
- Expose sharpness only if num_scalers is >=3D 2
- Add initial Xe3P_LPD for NVL
- BMG FBC support
- Add MTL+ platforms to support dpll framework
_ fix DIMM_S DRM decoding on ICL
- Return to using AUX interrupts
- PSR/Panel replay refactoring
- use consolidation HDMI tables
- Xe3_LPD CD2X dividier changes

xe:
- vfio: add vfio_pci for intel GPU
- multi queue support
- dynamic pagemaps and multi-device SVM
- expose temp attribs in hwmon
- NO_COMPRESSION bo flag
- expose MERT OA unit
- sysfs survivability refactor
- SRIOV PF: add MERT support
- enable SR-IOV VF migration
- Enable I2C/NVM on Crescent Island
- Xe3p page reclaimation support
- introduce SRIOV scheduler groups
- add SoC remappt support in system controller
- insert compiler barriers in GuC code
- define NVL GuC firmware
- handle GT resume failure
- fix drm scheduler layering violations
- enable GSC loading and PXP for PTL
- disable GuC Power DCC strategy on PTL
- unregister drm device on probe error

i915:
- move to kernel standard fault injection
- bump recommended GuC version for DG2 and MTL

amdgpu:
- SMUIO 15.x, PSP 15.x support
- IH 6.1.1/7.1 support
- MMHUB 3.4/4.2 support
- GC 11.5.4/12.1 support
- SDMA 6.1.4/7.1/7.11.4 support
- JPEG 5.3 support
- UserQ updates
- GC 9 gfx queue reset support
- TTM memory ops parallelization
- convert legacy logging to new helpers
- DC analog fixes

amdkfd:
- GC 11.5.4/12.1 suppport
- SDMA 6.1.4/7.1 support
- per context support
- increase kfd process hash table
- Reserved SDMA rework

radeon:
- convert legacy logging to new helpers
- use devm for i2c adapters

msm:
- GPU
  - Document a612/RGMU dt bindings
  - UBWC 6.0 support (for A840 / Kaanapali)
  - a225 support
- DPU:
  - Switched to use virtual planes by default
  - Fixed DSI CMD panels on DPU 3.x
  - Rewrote format handling to remove intermediate representation
  - Fixed watchdog on DPU 8.x+
  - Fixed TE / Vsync source setting on DPU 8.x+
  - Added 3D_Mux on SC7280
  - Kaanapali platform support
  - Fixed UBWC register programming
  - Made RM reserve DSPP-enabled mixers for CRTCs with LMs.
  - Gamma correction support
- DP:
  - Enabled support for eDP 1.4+ link rate tables
  - Fixed MDSS1 DP indices on SA8775P, making them to work
  - Fixed msm_dp_ctrl_config_msa() to work with LLVM 20
- DSI:
  - Documented QCS8300 as compatible with SA8775P
  - Kaanapali platform support
- DSI PHY:
  - switched to divider_determine_rate()
- MDP5:
  - Dropped support for MSM8998, SDM660 and SDM630 (switched over
    to DPU)
-  MDSS:
  - Kaanapali platform support
  - Fixed UBWC register programming

nova-core:
- Prepare for Turing support. This includes parsing and handling
  Turing-specific firmware headers and sections as well as a Turing
  Falcon HAL implementation.
- Get rid of the Result<impl PinInit<T, E>> anti-pattern.
- Relocate initializer-specific code into the appropriate initializer.
- Use CStr::from_bytes_until_nul() to remove custom helpers.
- Improve handling of unexpected firmware values.
- Clean up redundant debug prints.
- Replace c_str!() with native Rust C-string literals.
- Update nova-core task list.

nova:
- Align GEM object size to system page size.

tyr:
- Use generated uAPI bindings for GpuInfo.
- Replace manual sleeps with read_poll_timeout().
- Replace c_str!() with native Rust C-string literals.
- Suppress warnings for unread fields.
- Fix incorrect register name in print statement.

nouveau:
- fix big page table support races in PTE management
- improve reclocking on tegra 186+

amdxdna:
- fix suspend race conditions
- improve handling of zero tail pointers
- fix cu_idx overwritten during command setup
- enable hardware context priority
- remove NPU2 support
- update message buffer allocation requirements
- update firmware version check

ast:
- support imported cursor buffers
- big endian fixes

etnaviv:
- add PPU flop reset support

imagination:
- add AM62P support
- introduce hw version checks

ivpu:
- implement warm boot flow

panfrost:
- add bo sync ioctl
- add GPU_PM_RT support for RZ/G3E SoC

panthor:
- add bo sync ioctl
- enable timestamp propagation
- scheduler robustness improvements
- VM termination fixes
- huge page support

rockchip:
- RK3368 HDMI Support
- get rid of atomic_check fixups
- RK3506 support
- RK3576/RK3588 improved HPD handling

rz-du:
- RZ/V2H(P) MIPI-DSI Support

v3d:
- fix DMA segment size
- convert to new logging helpers

mediatek:
- move DP training to hotplug thread
- convert logging to new helpers
- add support for HS speed DSI
- Genio 510/700/1200-EVK, Radxa NIO-12L HDMI support

atmel-hlcdc:
- switch to drmm resource
- support nomodeset
- use newer helpers

hisilicon:
- fix various DP bugs

renesas:
- fix kernel panic on reboot

exynos:
- fix vidi_connection_ioctl using wrong device
- fix vidi_connection deref user ptr
- fix concurrency regression with vidi_context

vkms:
- add configfs support for display configuration

----------------------------------------------------------------
Abhishek Rajput (2):
      drm/radeon: Convert legacy DRM logging in evergreen.c to drm_* helper=
s
      drm/mediatek: Convert legacy DRM logging to drm_* helpers in mtk_crtc=
.c

Adri=C3=A1n Larumbe (1):
      drm/panthor: Support partial unmaps of huge pages

Akash Goel (1):
      drm/panthor: Remove redundant call to disable the MCU

Akhil P Oommen (4):
      drm/msm/a6xx: Retrieve gmu core range by index
      dt-bindings: display/msm: gpu: Simplify conditional schema logic
      dt-bindings: display/msm: gpu: Document A612 GPU
      drm/msm/a8xx: Add UBWC v6 support

Alan Liu (1):
      drm/amdgpu: Fix query for VPE block_type and ip_count

Alex Deucher (35):
      drm/amdgpu: fix spelling in gmc9/10 code
      drm/amdgpu: add a helper for processing recoverable GPUVM faults
      drm/amd/display: Use GFP_ATOMIC in dc_create_plane_state()
      drm/amdgpu: don't attach the tlb fence for SI
      drm/amdgpu/gfx: add eop size and alignment to shadow info
      drm/amdgpu/sdma: add query for CSA size and alignment
      drm/amdgpu: fix a job->pasid access race in gpu recovery
      drm/amdgpu: Update AMDGPU_INFO_UQ_FW_AREAS query for compute
      drm/amdgpu: Update AMDGPU_INFO_UQ_FW_AREAS query for sdma
      drm/radeon: Remove __counted_by from ClockInfoArray.clockInfo[]
      drm/amdgpu: add VCN 5.3.0 headers
      drm/amdgpu: add queue reset support for jpeg 5.3
      drm/amdgpu: add MP 15.0.0 headers
      drm/amdgpu: don't reemit ring contents more than once
      drm/amdgpu: always backup and reemit fences
      drm/amdgpu: use dma_fence_get_status() for adapter reset
      drm/amdgpu: avoid a warning in timedout job handler
      drm/amdgpu/gfx9: rework pipeline sync packet sequence
      drm/amdgpu/gfx9: Implement KGQ ring reset
      drm/amdgpu: add SMUIO 15.0.0 headers
      drm/amdgpu: Add THM 15.0.0 headers
      drm/amdgpu: make sure userqs are enabled in userq IOCTLs
      drm/amdgpu/jpeg4.0.3: remove redundant sr-iov check
      drm/amdgpu: fix error handling in ib_schedule()
      drm/amdgpu: add new job ids
      drm/amdgpu: fix type for wptr in ring backup
      drm/amdgpu: rename amdgpu_fence_driver_guilty_force_completion()
      Revert "drm/amd/display: pause the workload setting in dm"
      drm/amdgpu/soc21: fix xclk for APUs
      drm/amdgpu: Fix cond_exec handling in amdgpu_ib_schedule()
      drm/amdgpu/gfx10: fix wptr reset in KGQ init
      drm/amdgpu/gfx11: fix wptr reset in KGQ init
      drm/amdgpu/gfx12: fix wptr reset in KGQ init
      drm/amdgpu/gfx11: adjust KGQ reset sequence
      drm/amdgpu/gfx12: adjust KGQ reset sequence

Alex Hung (8):
      drm/amd/display: Refactor dml_core_mode_support to reduce stack frame
      drm/amd/display: Update function name to
link_detect_connection_type_analog
      drm/amd/display: Update dc_connection_dac_load to
dc_connection_analog_load
      drm/amd/display: Check NULL before calling dac_load_detection
      drm/amd/display: Replace log macro for analog display detection
      drm/amd/display: Check NULL before accessing a variable
      drm/amd/display: Initialize a default to phyd32clk
      drm/amd/display: Remove coverity comments and fix spaces

Alex Sierra (2):
      drm/amd: include rrmt mode for mes_v12_1
      drm/amdgpu: update sh mem base offsets for gfx 12.1

Alexander Usyskin (1):
      drm/xe/nvm: enable cri platform

Alexandre Courbot (1):
      gpu: nova-core: align LibosMemoryRegionInitArgument size to page size

Alexandru Dadu (1):
      drm/imagination: Add gpuid module parameter

Alexey Klimov (1):
      gpu/panel-edp: add AUO panel entry for B140HAN06.4

Alice Ryhl (5):
      rust: drm: add __rust_helper to helpers
      drm/gpuvm: drm_gpuvm_bo_obtain() requires lock and staged mode
      drm/gpuvm: use const for drm_gpuva_op_* ptrs
      drm/gpuvm: fix name in kernel doc of drm_gpuvm_bo_obtain_locked()
      drm/tyr: rename pad0 to selected_coherency

Amin GATTOUT (1):
      drm/panel: otm8009a: Switch to mipi_dsi_multi_context helpers

Andrew Martin (1):
      drm/amdkfd: Uninitialized and Unused variables

Andy Yan (3):
      drm/rockchip: inno-hdmi: Convert to drm bridge
      MAINTAINERS: Add entry for Innosilicon hdmi bridge library
      drm/rockchip: vop2: Add mode valid callback for crtc

AngeloGioacchino Del Regno (2):
      drm/mediatek: mtk_dsi: Add support for High Speed (HS) mode
      dt-bindings: phy: mediatek,hdmi-phy: Fix clock output names for MT819=
5

Ankit Nautiyal (17):
      drm/i915/dp: Restrict max source rate for WCL to HBR3
      drm/i915/vdsc: Account for DSC slice overhead in intel_vdsc_min_cdclk=
()
      drm/i915/display: Abstract pipe/trans/cursor offset calculation
      drm/i915/display: Add APIs to be used by gvt to get the register offs=
ets
      drm/i915/gvt: Add header to use display offset functions in macros
      drm/i915/gvt: Change for_each_pipe to use pipe_valid API
      drm/i915/gvt: Use the appropriate header for the DPLL macro
      drm/i915/gvt/display_helper: Get rid of #ifdef/#undefs
      drm/i915/intel_alpm: Fix the SPDX identifier comment
      drm/i915/intel_cx0_phy: Fix the SPDX identifier comment
      drm/i915/intel_cx0_phy_regs: Fix the SPDX identifier comment
      drm/i915/intel_display_params: Fix the SPDX identifier comment
      drm/i915/intel_dsb: Fix the SPDX identifier comment
      drm/i915/intel_dsb_buffer: Fix the SPDX identifier comment
      drm/i915/intel_gvt_api: Fix the SPDX identifier comment
      drm/i915/intel_lt_phy: Fix the SPDX identifier comment
      drm/i915/lt_phy_regs: Fix the SPDX identifier comment

Anton Bambura (1):
      gpu/drm: panel: add Samsung LTL106HL02 MIPI DSI panel driver

Ard Biesheuvel (2):
      drm/i915: Fix format string truncation warning
      drm/amd/display: Permit DC_FP_START/END only in non-FP compilation un=
its

Arnd Bergmann (3):
      drm/xe/pf: fix VFIO link error
      drm/xe: fix drm_gpusvm_init() arguments
      drm: pl111: fix build regression

Arunpravin Paneer Selvam (1):
      MAINTAINERS: drm: add maintainers for DRM buddy allocator

Asad Kamal (7):
      drm/amd/pm: Update pmfw headers for smu_v13_0_12
      drm/amd/pm: Add sysfs node for ubb power
      drm/amd/pm: Fetch ubb power for smu_v13_0_12
      drm/amd/pm: Enable system power caps for smu_v13_0_12
      drm/amdgpu/ras: Move ras data alloc before bad page check
      drm/amd/amdgpu: Move enum for VDD board
      drm/amdgpu: Add sysfs up clean for gfx_v12_1

Ashley Smith (1):
      drm/panthor: Enable timestamp propagation

Ashutosh Dixit (11):
      drm/xe/oa: Use explicit struct initialization for struct xe_oa_regs
      drm/xe/oa/uapi: Add gt_id to struct drm_xe_oa_unit
      drm/xe/oa: Allow exec_queue's to be specified only for OAG OA unit
      drm/xe/rtp: Refactor OAG MMIO trigger register whitelisting
      drm/xe/rtp: Whitelist OAM MMIO trigger registers
      drm/xe/oa/uapi: Expose MERT OA unit
      drm/xe/rtp: Whitelist OAMERT MMIO trigger registers
      drm/xe/oa: Always set OAG_OAGLBCTXCTRL_COUNTER_RESUME
      drm/xe/oa: Move default oa unit assignment earlier during stream open
      drm/xe/oa: Disallow 0 OA property values
      drm/xe/eustall: Disallow 0 EU stall property values

Atharv Dubey (1):
      rust: drm: use `pin_init::zeroed()` for file operations initializatio=
n

Aurabindo Pillai (3):
      drm/amd/display: switch to drm_dbg_kms() from DRM_DEBUG_KMS
      drm/amd/display: switch to drm_dbg_ macros instead of DRM_DEBUG_ vari=
ants
      drm/amd/display: perform clear update flags for all DCN asics

Ausef Yousof (1):
      drm/amd/display: correct clip x assignment in cursor programming

Austin Zheng (1):
      drm/amd/display: Fix presentation of Z8 efficiency

Ayushi Makhija (3):
      dt-bindings: display: msm-dsi-phy-7nm: document the QCS8300 DSI PHY
      dt-bindings: msm: dsi-controller-main: document the QCS8300 DSI CTRL
      dt-bindings: display: msm: document DSI controller and phy on QCS8300

Bagas Sanjaya (2):
      drm/amd/display: Don't use kernel-doc comment in
dc_register_software_state struct
      drm/amdgpu: Describe @AMD_IP_BLOCK_TYPE_RAS in amd_ip_block_type enum

Baihan Li (4):
      drm/hisilicon/hibmc: fix dp probabilistical detect errors after HPD i=
rq
      drm/hisilicon/hibmc: add dp mode valid check
      drm/hisilicon/hibmc: fix no showing problem with loading hibmc manual=
ly
      drm/hisilicon/hibmc: Adding reset colorbar cfg in dp init.

Balasubramani Vivekanandan (2):
      drm/xe/xe3_lpg: Apply Wa_16028005424
      drm/xe/device: Convert wait for lmem init into an assert

Ben Dooks (2):
      drm/radeon: fix signed v unsigned print formats
      drm/i915/guc: make 'guc_hw_reg_state' static as it isn't exported

Bhuvanachandra Pinninti (1):
      drm/amd/display: Migrate HUBBUB register access from hwseq to
hubbub component.

Biju Das (1):
      drm/panfrost: Add GPU_PM_RT support for RZ/G3E SoC

Bokun Zhang (1):
      drm/amdgpu: RLC-G VF Register Access Interface

Boris Brezillon (29):
      drm/panthor: Always wait after sending a command to an AS
      drm/panthor: Kill lock_region()
      drm/panthor: Recover from panthor_gpu_flush_caches() failures
      drm/panthor: Add support for atomic page table updates
      drm/panthor: Make panthor_vm_[un]map_pages() more robust
      drm/panthor: Relax a check in panthor_sched_pre_reset()
      drm/panthor: Simplify group idleness tracking
      drm/panthor: Don't try to enable extract events
      drm/panthor: Fix the full_tick check
      drm/panthor: Fix the group priority rotation logic
      drm/panthor: Fix immediate ticking on a disabled tick
      drm/panthor: Fix the logic that decides when to stop ticking
      drm/panthor: Make sure we resume the tick when new jobs are submitted
      drm/panthor: Kill panthor_sched_immediate_tick()
      drm/panthor: Drop a WARN_ON() in group_free_queue()
      drm/panthor: Make sure caches are flushed/invalidated when an AS
is recycled
      drm/panthor: Unlock the locked region before disabling an AS
      drm/panthor: Provide a custom dma_buf implementation
      drm/panthor: Fix panthor_gpu_coherency_set()
      drm/panthor: Expose the selected coherency protocol to the UMD
      drm/panthor: Add a PANTHOR_BO_SYNC ioctl
      drm/panthor: Add an ioctl to query BO flags
      drm/panfrost: Provide a custom dma_buf implementation
      drm/panfrost: Expose the selected coherency protocol to the UMD
      drm/panfrost: Add an ioctl to query BO flags
      drm/gem: Fix builds with CONFIG_MMU=3Dn
      drm/panthor: Fix kerneldoc in uAPI header
      drm/gem: Fix a GEM leak in drm_gem_get_unmapped_area()
      drm/panfrost: Fix a page leak in panfrost_mmu_map_fault_addr()
when THP is on

Brendan Shephard (2):
      rust: Return Option from page_align and ensure no usize overflow
      drm/nova: Align GEM memory allocation to system page size

Brian Kocoloski (1):
      drm/amdkfd: Fix improper NULL termination of queue restore SMI
event string

Brian Masney (1):
      drm/msm/dsi_phy_14nm: convert from divider_round_rate() to
divider_determine_rate()

Brian Nguyen (12):
      drm/xe/xe_tlb_inval: Modify fence interface to support PPC flush
      drm/xe/guc: Add page reclamation interface to GuC
      drm/xe: Create page reclaim list on unbind
      drm/xe: Suballocate BO for page reclaim
      drm/xe: Prep page reclaim in tlb inval job
      drm/xe: Append page reclamation action to tlb inval
      drm/xe: Optimize flushing of L2$ by skipping unnecessary page reclaim
      drm/xe: Add debugfs support for page reclamation
      drm/xe: Remove debug comment in page reclaim
      drm/xe: Add explicit abort page reclaim list
      drm/xe: Fix page reclaim entry handling for large pages
      drm/xe: Add page reclamation related stats

Calvin Owens (1):
      drm/xe: Don't use absolute path in generated header comment

Candice Li (2):
      drm/amdgpu: Add vram_type to ras init_flags
      drm/amd/ras: Add vram_type to ras_ta_init_flags

Chaitanya Kumar Borah (1):
      drm/xe/guc: Fix kernel-doc warning in GuC scheduler ABI header

Chaoyi Chen (5):
      dt-bindings: display: rockchip,dw-mipi-dsi: Add compatible for rk3506
      dt-bindings: display: rockchip,vop: Add compatible for rk3506
      drm/rockchip: dsi: Add support for rk3506
      drm/rockchip: vop: Add support for rk3506
      drm/rockchip: Drop ROCKCHIP_IOMMU depend for DRM_ROCKCHIP

Charlene Liu (7):
      drm/amd/display: add register definitions in dcn_hubbub_registers
      drm/amd/display: Fix DP no audio issue
      drm/amd/display: DPP low mem pwr related adjustment -Part I
      drm/amd/display: Fix dsc eDP issue
      drm/amd/display: Remove unused code
      drm/amd/display: Enable vstateup hook for DCN401 to be reused
      drm/amd/display: add setup_stereo for dcn4x or later

Chen Ni (1):
      drm/mediatek: mtk_hdmi_v2: Remove unneeded semicolon

Chia-I Wu (2):
      drm/panthor: fix queue_reset_timeout_locked
      drm/panthor: fix for dma-fence safe access rules

Chris Morgan (5):
      dt-bindings: display: rockchip: Add no-hpd for dw-hdmi-qp controller
      drm/bridge: dw-hdmi-qp: Add support for missing HPD
      drm: panel: jd9365da: Use gpiod_set_value_cansleep()
      dt-bindings: display: panel: Add compatible for Anbernic RG-DS
      drm/panel: jd9365da: Support for Anbernic RG-DS Panel

Christian K=C3=B6nig (5):
      dma-buf: replace "#if" with just "if"
      dma-buf: improve sg_table debugging hack v4
      dma-buf: enable DMABUF_DEBUG by default on DEBUG kernels
      dma-buf/selftests: drop the mock_wait implementation
      drm/amdgpu: Drop MMIO_REMAP domain bit and keep it Internal

Christophe JAILLET (1):
      drm/amdgpu: Slightly simplify base_addr_show()

ChunTao Tso (2):
      drm/amd/display: Replay Video Conferencing V2
      drm/amd/display: Add frame skip feature support flag

Clay King (1):
      drm/amd/display: Update timing source enums

Colin Ian King (1):
      drm/amdkfd: Fix a couple of spelling mistakes

Cristian Ciocaltea (2):
      drm/rockchip: dw_hdmi_qp: Fix RK3576 HPD interrupt handling
      drm/rockchip: dw_hdmi_qp: Optimize RK3588 HPD interrupt handling

Cruise Hung (2):
      drm/amd/display: Remove unnecessary divider update flag
      drm/amd/display: Always update divider settings for DP tunnel

Dale Whinham (1):
      drm/msm/dp: Enable support for eDP v1.4+ link rates table

Dan Carpenter (5):
      drm/plane: Fix IS_ERR() vs NULL bug
drm_plane_create_color_pipeline_property()
      drm/xe/vf: fix return type in vf_migration_init_late()
      drm/xe/xe_sriov_vfio: Fix return value in
xe_sriov_vfio_migration_supported()
      drm/panthor: unlock on error in panthor_ioctl_bo_create()
      drm/msm: remove some dead code

Daniel Stone (8):
      drm/rockchip: vop2: Switch impossible format conditional to WARN_ON
      drm/rockchip: vop2: Switch impossible pos conditional to WARN_ON
      drm/rockchip: vop2: Fix Esmart test condition
      drm/rockchip: vop2: Enforce scaling workaround in plane_check
      drm/rockchip: vop2: Enforce AFBC source alignment in plane_check
      drm/rockchip: vop2: Enforce AFBC transform stride align in plane_chec=
k
      drm/rockchip: vop2: Use drm_is_afbc helper function
      drm/rockchip: vop2: Simplify format_mod_supported

Daniele Ceraolo Spurio (17):
      drm/xe/pf: Add handling for MLRC adverse event threshold
      drm/xe/gt: Add engine masks for each class
      drm/gt/guc: extract scheduler-related defines from guc_fwif.h
      drm/xe/pf: Initialize scheduler groups
      drm/xe/pf: Add support for enabling scheduler groups
      drm/xe/pf: Scheduler groups are incompatible with multi-lrc
      drm/xe/vf: Check if scheduler groups are enabled
      drm/xe/pf: Add debugfs to enable scheduler groups
      drm/xe/pf: Add debugfs with scheduler groups information
      drm/xe/pf: Prep for multiple exec quantums and preemption timeouts
      drm/xe/pf: Add functions to set exec quantums for each group
      drm/xe/pf: Add functions to set preempt timeouts for each group
      drm/xe/pf: Add debugfs to set EQ and PT for scheduler groups
      drm/xe/gsc: Make GSC FW load optional for newer platforms
      drm/xe/ptl: Define GSC for PTL
      drm/xe/ptl: Enable PXP for PTL
      drm/xe/guc: Fix CFI violation in debugfs access.

Danilo Krummrich (7):
      gpu: nova-core: fw: get rid of redundant Result in GspFirmware::new()
      gpu: nova-core: fw: move appropriate code into pin initializer
      gpu: nova-core: gsp: get rid of redundant Result in Gsp::new()
      gpu: nova-core: gsp: move appropriate code into pin initializer
      Merge tag 'v6.19-rc5' into drm-rust-next
      Documentation: nova: remove completed tasks
      Documentation: nova: update pending tasks

Dave Airlie (30):
      Merge tag 'drm-misc-next-2025-12-12' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-misc-next-2025-12-19' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-intel-next-2025-12-19' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-xe-next-2025-12-19' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'drm-xe-next-2025-12-30' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'drm-misc-next-2026-01-08' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'amd-drm-next-6.20-2026-01-09' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-misc-next-2026-01-15' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-intel-next-2026-01-15' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-xe-next-2026-01-15' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'amd-drm-next-6.20-2026-01-16' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-intel-gt-next-2026-01-16' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'mediatek-drm-next-20260117' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-next
      Merge tag 'drm-intel-next-fixes-2026-01-22' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-misc-next-2026-01-22' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'amd-drm-next-6.20-2026-01-23' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      BackMerge tag 'v6.19-rc7' into drm-next
      Merge tag 'drm-msm-next-2026-01-23' of
https://gitlab.freedesktop.org/drm/msm into drm-next
      Merge tag 'drm-rust-next-2026-01-26' of
https://gitlab.freedesktop.org/drm/rust/kernel into drm-next
      Merge tag 'drm-intel-next-fixes-2026-01-29' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-misc-next-fixes-2026-01-29' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-xe-next-fixes-2026-01-29' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'amd-drm-next-6.20-2026-01-30' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'exynos-drm-next-for-v6.20' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-next
      nouveau/vmm: rewrite pte tracker using a struct and bitfields.
      nouveau/vmm: increase size of vmm pte tracker struct to u32 (v2)
      nouveau/vmm: start tracking if the LPT PTE is valid. (v6)
      Merge tag 'drm-intel-next-fixes-2026-02-05' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-misc-next-fixes-2026-02-05' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-xe-next-fixes-2026-02-05' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next

David Heidelberg (7):
      dt-bindings: panel: s6e3fc2x01: Sort and remove unnecessary propertie=
s
      dt-bindings: panel: sw43408: adjust to reflect the DDIC and panel use=
d
      drm/panel: sw43408: Introduce LH546WF1-ED01 panel compatible
      drm/panel: sw43408: Separate reset sequence into own function
      drm/panel: sw43408: Remove manual invocation of unprepare at remove
      drm/panel: sw43408: Switch to devm_regulator_bulk_get_const
      drm/panel: sw43408: Improve wording when reset-gpios aren't available

David Yat Sin (1):
      drm/amdkfd: Add metadata ring buffer for compute

Deborah Brouwer (3):
      drm/tyr: use generated bindings for GpuInfo
      drm/tyr: use read_poll_timeout
      drm/tyr: suppress unread field warnings

Derek Lai (2):
      drm/amd/display: Write default Vesa Aux backlight control in dmub
      drm/amd/display: revert "write default Vesa Aux backlight control in =
dmub"

Dibin Moolakadan Subrahmanian (1):
      drm/i915/fbdev: Hold runtime PM ref during fbdev BO creation

Dillon Varone (4):
      drm/amd/display: Guard FAMS2 configuration updates
      drm/amd/display: Remove periodic detection callbacks from dcn35+
      drm/amd/display: Consolidate dmub fb info to a single struct
      drm/amd/display: Add new fields to fams2 config

Dirk Behme (1):
      drm/tyr: fix register name in error print

Dmitry Baryshkov (43):
      drm/bridge: add connector argument to .hpd_notify callback
      drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers
      drm/msm/dpu: fix WD timer handling on DPU 8.x
      drm/msm/disp: set num_planes to 1 for interleaved YUV formats
      drm/msm/disp: set num_planes and fetch_mode in INTERLEAVED_RGB_FMT
      drm/msm/disp: set num_planes, fetch_mode and tile_height in
INTERLEAVED_RGB_FMT_TILED
      drm/msm/disp: simplify RGB{,A,X} formats definitions
      drm/msm/disp: simplify tiled RGB{,A,X} formats definitions
      drm/msm/disp: pull in common YUV format parameters
      drm/msm/disp: pull in common tiled YUV format parameters
      drm/msm/disp: drop PSEUDO_YUV_FMT_LOOSE_TILED
      drm/msm/dpu: simplify _dpu_format_populate_plane_sizes_*
      drm/msm/dpu: drop redundant num_planes assignment in
_dpu_format_populate_plane_sizes*()
      drm/msm/dpu: rewrite _dpu_format_populate_plane_sizes_ubwc()
      drm/msm/dpu: use standard functions in
_dpu_format_populate_plane_sizes_ubwc()
      drm/msm/dpu: drop intr_start from DPU 3.x catalog files
      drm/msm/dpu: fix CMD panels on DPU 1.x - 3.x
      drm/msm/mdp5: drop support for MSM8998, SDM630 and SDM660
      drm/mode_object: add drm_object_immutable_property_get_value()
      drm/atomic: add max_size check to drm_property_replace_blob_from_id()
      drm/atomic: verify that gamma/degamma LUTs are not too big
      drm/msm/a2xx: fix pixel shader start on A225
      drm/msm/a2xx: add A225 entry to catalog
      drm/tests: hdmi: check the infoframes behaviour
      drm/vc4: hdmi: implement clear_infoframe
      drm/sun4i: hdmi_enc: implement clear_infoframe stub
      drm/connector: make clear_infoframe callback mandatory for HDMI conne=
ctors
      drm/bridge: refactor HDMI InfoFrame callbacks
      drm/display: hdmi_state_helper: split InfoFrame functions per type
      drm/display: hdmi_state_helper: reject Audio IF updates if it's
not supported
      drm/display: hdmi_state_helper: don't generate unsupported InfoFrames
      drm/display: bridge_connector: dynamically generate HDMI callbacks
      drm/debug: don't register files for unsupported HDMI InfoFrames
      drm/tests: hdmi: fix build failure
      Merge tag 'v6.19-rc1' into msm-next
      drm/msm/mdss: correct HBB programmed on UBWC 5.x and 6.x devices
      drm/msm/dpu: offset HBB values written to DPU by -13
      drm/msm/dpu: program correct register for UBWC config on DPU 8.x+
      drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL programming on UBWC 5.x+
      drm/msm/dpu: correct error messages in RM
      drm/msm/dpu: try reserving the DSPP-less LM first
      drm/ci: ignore Gamma test failures on Qualcomm SC7180
      drm/display: bridge_connector: move audio_infoframe checks to OP_HDMI

Dmytro Laktyushkin (3):
      drm/amd/display: refactor HPD to increase flexibility
      drm/amd/display: Add signal type check for dcn401 get_phyd32clk_src
      drm/amd/display: only power down dig on phy endpoints

Dominik Kaszewski (2):
      drm/amd/display: Split update_planes_and_stream_v3 into parts (V2)
      drm/amd/display: Fix and reenable UPDATE_V3_FLOW_NEW_CONTEXT_MINIMAL

Donet Tom (3):
      drm/amdkfd: Relax size checking during queue buffer get
      drm/amdkfd: Fix SVM map/unmap address conversion for non-4k page size=
s
      drm/amdkfd: Fix GART PTE for non-4K pagesize in svm_migrate_gart_map(=
)

Ed Maste (1):
      drm/amd/amdgpu: Add missing newline in DRM_DEBUG_DRIVER message

Eric Chanudet (2):
      dma-buf: heaps: add parameter to account allocations using cgroup
      dma-buf: system_heap: account for system heap allocation in memcg

Erick Karanja (1):
      drm/radeon : Use devm_i2c_add_adapter instead of i2c_add_adapter

Eslam Khafagy (1):
      drm: pl111: replace dev_* print functions with drm_* variants

Ewan Chorynski (1):
      rust: drm: Improve safety comment when using `Pin::into_inner_uncheck=
ed`

Fabio Estevam (2):
      dt-bindings: display: simple: Add Innolux G150XGE-L05 panel
      drm/panel: simple: Add Innolux G150XGE-L05 panel entry

Faith Ekstrand (4):
      drm/panthor: Bump the driver version to 1.7
      drm/panfrost: Add a PANFROST_SYNC_BO ioctl
      drm/panfrost: Add flag to map GEM object Write-Back Cacheable
      drm/panfrost: Bump the driver version to 1.6

Federico Amedeo Izzo (1):
      drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT DRM property

Fei Yang (1):
      drm/xe: vram addr range is expanded to bit[17:8]

Feifei Xu (3):
      drm/amdgpu: Add rlcv firmware for frontdoor loading.
      drm/amdgpu: update psp_get_fw_type() function
      drm/amdgpu: init RS64_MEC_P2/P3_STACK for gfx12.1

Francesco Valla (3):
      drm/draw: add drm_draw_can_convert_from_xrgb8888
      drm/log: avoid WARN when searching for usable format
      drm/panic: avoid WARN when checking format support

Francois Dugast (2):
      drm/xe/hw_engine_group: Add stats for mode switching
      drm/xe/migrate: Configure migration queue as low latency

Fudong Wang (1):
      drm/amd/display: Set enable_legacy_fast_update to false for DCN35/351

Gang Ba (2):
      drm/amdkfd: Set SDMA_QUEUEx_IB_CNTL/SWITCH_INSIDE_IB
      drm/amdkfd: Add SDMA queue quantum support for GFX12.1

Gangliang Xie (2):
      drm/amdgpu: only check critical address when it is not reserved
      drm/amdgpu: mark invalid records with U64_MAX

Geert Uytterhoeven (1):
      drm/rockchip: DRM_ROCKCHIP should depend on ARCH_ROCKCHIP

Gert Wollny (5):
      drm/etnaviv: Add command stream definitions required for a PPU flop r=
eset
      drm/etnaviv: move some functions to a header to be able to use
them externally
      drm/etnaviv: Add a new function to emit a series of states to cmd str=
eam
      drm/etnaviv: Add PPU flop reset
      drm/etnaviv: Add module parameter to force PPU flop reset

Gustavo Sousa (12):
      drm/i915/vbt: Add fields dedicated_external and dyn_port_over_tc
      drm/i915/power: Use intel_encoder_is_tc()
      drm/i915/display: Handle dedicated external ports in intel_encoder_is=
_tc()
      drm/i915/xe3p_lpd: Handle underrun debug bits
      drm/i915/display: Use platform check in HAS_LT_PHY()
      drm/i915/display: Move HAS_LT_PHY() to intel_display_device.h
      drm/i915/display: Use HAS_LT_PHY() for LT PHY AUX power
      drm/i915/cx0: Use a more accurate message for powerdown change failur=
e
      drm/i915/cx0: Toggle powerdown states for C10 on HDMI
      drm/i915/display_wa: Keep enum intel_display_wa sorted
      drm/i915/cdclk: Implement Wa_13012396614
      drm/i915/cdclk: Incorporate Xe3_LPD changes for CD2X divider

Hans de Goede (1):
      drm/panel: edp: add BOE NV140WUM-T08 panel

Haoxiang Li (1):
      drm/amdkfd: fix a memory leak in device_queue_manager_init()

Harish Chegondi (2):
      drm/xe: Fix conversion from clock ticks to milliseconds
      drm/xe/xe3: Remove graphics IP 30.01 from Wa_18041344222 IP list

Harish Kasiviswanathan (1):
      drm/amdkfd: No need to suspend whole MES to evict process

Harry Wentland (4):
      drm/amd/display: Rename dml2_wrapper.c to dml2_wrapper_fpu.c
      drm/amd/display: Move dml2_validate to the non-FPU dml2_wrapper
      drm/amd/display: Move dml2_create and init to the non-FPU dml2_wrappe=
r
      drm/amd/display: Drop FPU flags from dml21_wrapper.c

Hawking Zhang (43):
      drm/amdgpu: Increase the maximum number of IP instances
      drm/amdgpu: Add hwid for ATU
      drm/amdgpu: Add hwid for AIGC
      drm/amdgpu: Verify dpm setting for enabling smu with direct fw loadin=
g
      drm/amdgpu: Move XCP_INST_MASK amdgpu_xcp.h
      drm/amdgpu: update VRAM types
      drm/amdgpu: Add soc v1_0 enum header
      drm/amdgpu: Add smuio v15_0_8 ip headers v4
      drm/amdgpu: Add smuio v15_0_8 support v4
      drm/amdgpu: Initialize smuio functions for smuio v15_0_8
      drm/amdgpu: Add mp v15_0_8 ip headers v4
      drm/amdgpu: Set skip_tmr to true for psp v15_0_8
      drm/amdgpu: Upload a single sdma fw copy when using psp v15.0.8
      drm/amdgpu: Use ih v7_0 ip block for ih v7_1
      drm/amdgpu: Add mmhub v4_2_0 ip headers v5
      drm/amdgpu: Add osssys v7_1_0 ip headers v3
      drm/amdgpu: Add gc v12_1_0 ip headers v4
      drm/amdgpu: Add gfxhub v12_1 support
      drm/amdgpu: Add gmc v12_1 gmc callbacks
      drm/amdgpu: Add soc v1_0 support
      drm/amdgpu: Include the correct pkt header for gfx v12_1
      drm/amdgpu: Init single mes instance if xcc_mask is unset
      drm/amdgpu: Remove redundant pmfw backdoor loading
      drm/amdgpu: Remove redundant check for async_gfx_ring
      drm/amdgpu: Implement gfx_v12_1_get_xccs_per_xcp
      drm/amdgpu: Add switch_compute_partition callback for imu v12_1
      drm/amdgpu: Export gfx_v12_1_xcp_func
      drm/amdgpu: Export sdma_v7_1_xcp_funcs
      drm/amdgpu: Add soc_v1_0_xcp_funcs
      drm/amdgpu: Initialize xcp manager for soc v1_0
      drm/amdgpu: Enable atomics for all the available xcc
      drm/amdgpu: Initialize memory partition callbacks for gmc v12_1
      drm/amdgpu: Initialize memory ranges for gmc v12_1
      drm/amdgpu: Init compute partition mode for gfx v12_1
      drm/amdgpu: Initialize vram_info for gmc v12_1
      drm/amdgpu: Init partition_mode and xcc_mask for GFX_IMU_PARTITION_SW=
ITCH
      drm/amdgpu: Set xcp id for mes ring
      drm/amdgpu: Add soc v1_0 ih client id table
      drm/amdgpu: Add gfx v12_1 interrupt source header
      drm/amdgpu: Do not initialize imu callback for vf
      drm/amdgpu: Fix xcc_id input for soc_v1_0_grbm_select
      drm/amdgpu: Init mcm_addr look up table
      drm/amdgpu: Extend psp_skip_tmr for bare-metal and sriov

Heiko Stuebner (2):
      dt-bindings: display: rockchip: dw-hdmi: Add compatible for RK3368 HD=
MI
      drm/rockchip: hdmi: add RK3368 controller variant

Himal Prasad Ghimiray (5):
      drm/xe: Add helper to extend CPU-mirrored VMA range for merge
      drm/xe: Merge adjacent default-attribute VMAs during garbage collecti=
on
      drm/xe/svm: Extend MAP range to reduce vma fragmentation
      drm/xe/svm: Enable UNMAP for VMA merging operations
      drm/xe/vm: Skip ufence association for CPU address mirror VMA during =
MAP

Hugo Villeneuve (1):
      drm: renesas: rz-du: mipi_dsi: fix kernel panic when rebooting
for some panels

Iker Pedrosa (3):
      dt-bindings: display: sitronix,st7920: Add DT schema
      drm: Add driver for Sitronix ST7920 LCD displays
      MAINTAINERS: Add entry for Sitronix ST7920 driver

Imre Deak (56):
      drm/i915/cx0: Factor out C10 msgbus access start/end helpers
      drm/i915/cx0: Sanitize setting the Cx0 PLL use_c10 flag
      drm/i915/cx0: Sanitize calculating C20 PLL state from tables
      drm/i915/cx0: Track the C20 PHY VDR state in the PLL state
      drm/i915/cx0: Move definition of Cx0 PHY functions earlier
      drm/i915/cx0: Add macro to get DDI port width from a register value
      drm/i915/cx0: Track the Cx0 PHY enabled lane count in the PLL state
      drm/i915/cx0: Sanitize C10 PHY PLL SSC register setup
      drm/i915/cx0: Read out the Cx0 PHY SSC enabled state
      drm/i915/cx0: Determine Cx0 PLL DP mode from PLL state
      drm/i915/cx0: Determine Cx0 PLL port clock from PLL state
      drm/i915/cx0: Zero Cx0 PLL state before compute and HW readout
      drm/i915/cx0: Print additional Cx0 PLL HW state
      drm/i915/cx0: PLL verify debug state print
      drm/i915/cx0: Add MTL+ Thunderbolt PLL hooks
      drm/i915/cx0: Fix port to PLL ID mapping on BMG
      drm/i915/tc: Add separate intel_tc_phy_port_to_tc() for TC DDI/PHY po=
rts
      drm/i915/cx0: Use intel_port_to_tc() instead of open coding it
      drm/i915/cx0: Read out power-down state of both TXs in PHY lane 0
      drm/i915/cx0: Read out power-down state of both PHY lanes for
reversed lanes
      drm/i915/cx0: Convert C10 PHY PLL SSC state mismatch WARN to a
debug message
      drm/dp: Parse all DSC slice count caps for eDP 1.5
      drm/dp: Add drm_dp_dsc_sink_slice_count_mask()
      drm/i915/dp: Fix DSC sink's slice count capability check
      drm/i915/dp: Return a fixed point BPP value from intel_dp_output_bpp(=
)
      drm/i915/dp: Use a mode's crtc_clock vs. clock during state computati=
on
      drm/i915/dp: Factor out intel_dp_link_bw_overhead()
      drm/i915/dp: Fix BW check in is_bw_sufficient_for_dsc_config()
      drm/i915/dp: Use the effective data rate for DP BW calculation
      drm/i915/dp: Use the effective data rate for DP compressed BW calcula=
tion
      drm/i915/dp: Account with MST, SSC BW overhead for uncompressed
DP-MST stream BW
      drm/i915/dp: Account with DSC BW overhead for compressed DP-SST strea=
m BW
      drm/i915/dp: Account with pipe joiner max compressed BPP limit
for DP-MST and eDP
      drm/i915/dp: Fail state computation for invalid min/max link BPP valu=
es
      drm/i915/dp: Fail state computation for invalid max throughput BPP va=
lue
      drm/i915/dp: Fail state computation for invalid max sink
compressed BPP value
      drm/i915/dp: Fail state computation for invalid DSC source input
BPP values
      drm/i915/dp: Drop unused timeslots param from dsc_compute_link_config=
()
      drm/i915/dp: Factor out align_max_sink_dsc_input_bpp()
      drm/i915/dp: Factor out align_max_vesa_compressed_bpp_x16()
      drm/i915/dp: Align min/max DSC input BPPs to sink caps
      drm/i915/dp: Align min/max compressed BPPs when calculating BPP limit=
s
      drm/i915/dp: Drop intel_dp parameter from
intel_dp_compute_config_link_bpp_limits()
      drm/i915/dp: Pass intel_output_format to
intel_dp_dsc_sink_{min_max}_compressed_bpp()
      drm/i915/dp: Pass mode clock to dsc_throughput_quirk_max_bpp_x16()
      drm/i915/dp: Factor out compute_min_compressed_bpp_x16()
      drm/i915/dp: Factor out compute_max_compressed_bpp_x16()
      drm/i915/dp: Add intel_dp_mode_valid_with_dsc()
      drm/i915/dp: Unify detect and compute time DSC mode BW validation
      drm/i915/dp: Use helpers to align min/max compressed BPPs
      drm/i915/dp: Simplify computing DSC BPPs for eDP
      drm/i915/dp: Simplify computing DSC BPPs for DP-SST
      drm/i915/dp: Simplify computing forced DSC BPP for DP-SST
      drm/i915/dp: Unify computing compressed BPP for DP-SST and eDP
      drm/i915/dp: Simplify eDP vs. DP compressed BPP computation
      drm/i915/dp: Simplify computing the DSC compressed BPP for DP-MST

Ivan Lipski (5):
      drm/amd/display: Improve HDMI info retrieval
      drm/amd/display: Remove unused encoder types
      drm/amd/display: Use local variable for analog_engine initialization
      drm/amd/display: Add an hdmi_hpd_debounce_delay_ms module
      drm/amd/display: Clear HDMI HPD pending work only if it is enabled

Jack Chang (9):
      drm/amd/display: Refactor panel replay set dmub cmd flow
      drm/amd/display: Add AS-SDP v2 support for eDP feature
      drm/amd/display: Parse debug flag to PR FW
      drm/amd/display: Fix sending redundant enable command to dmub
      drm/amd/display: Revise VSC SDP header for Panel Replay
      drm/amd/display: Refactor panel replay dc libs
      drm/amd/display: DPCD for Selective Update
      drm/amd/display: PR error HPD_IRQ handling
      drm/amd/display: Add FR skipping CTS functions

Jack Xiao (7):
      drm/amdgpu/mes: add multi-xcc support
      drm/amdgpu: add new compute/mes mqd structure
      drm/amdgpu/mes_v12_1: initial support for mes_v12_1
      drm/amdgpu: Add mes v12_1_0 to discovery list
      drm/amdgpu/mes12_1: add cooperative dispatch support
      drm/amdgpu/mes_v12_1: fix mes access xcd register
      drm/amdgpu/gfx_v12_1: add mqd_stride_size input parameter

Jagmeet Randhawa (1):
      drm/xe: Increase TDF timeout

James Zhu (1):
      drm/amdkfd: refactor rlc/gfx spm

Jan Maslak (1):
      drm/xe: Restore engine registers before restarting schedulers
after GT reset

Jani Nikula (102):
      drm/{i915, xe}/display: duplicate gen2 irq/error init/reset in displa=
y irq
      drm/i915/display: convert the display irq interfaces to struct
intel_display
      drm/{i915,xe}/display: move irq calls to parent interface
      drm/i915: add .vgpu_active to parent interface
      drm/i915: add .has_fenced_regions to parent interface
      drm/i915/rps: store struct dma_fence in struct wait_rps_boost
      drm/i915/rps: call RPS functions via the parent interface
      drm/i915/rps: postpone i915 fence check to boost
      drm/i915: add .fence_priority_display to parent interface
      drm/xe/rps: build RPS as part of xe
      drm/i915/edram: extract i915_edram.[ch] for edram detection
      drm/i915: split out i915_freq.[ch]
      drm/i915: move intel_dram.[ch] from soc/ to display/
      drm/xe: remove MISSING_CASE() from compat i915_utils.h
      drm/i915/dram: convert to struct intel_display
      drm/i915: move dram_info to struct intel_display
      drm/i915: move intel_rom.[ch] from soc/ to display/
      drm/xe: remove remaining platform checks from compat i915_drv.h
      drm/i915/gmch: split out i915_gmch.[ch] from soc
      drm/i915/gmch: switch to use pci_bus_{read,write}_config_word()
      drm/i915/gmch: convert intel_gmch.c to struct intel_display
      drm/i915: merge soc/intel_gmch.[ch] to display/intel_vga.c
      drm/xe/vga: use the same intel_gmch_vga_set_decode() as i915
      drm/i915/cdclk: drop i915_drv.h include
      drm/i915: use struct drm_device for clock gating funcs
      drm/i915/hdcp: move i915 specific HDCP GSC implementation to i915
      drm/{i915,xe}/hdcp: use parent interface for HDCP GSC calls
      drm/{i915, xe}/dsb: make {intel, xe}_dsb_buffer.c independent of disp=
lay
      drm/{i915, xe}/dsb: allocate struct intel_dsb_buffer dynamically
      drm/{i915,xe}/dsb: make struct intel_dsb_buffer opaque
      drm/xe/dsb: drop the unnecessary struct i915_vma
      drm/i915/pps: drop wakeref parameter from with_intel_pps_lock()
      drm/i915/pps: convert intel_wakeref_t to struct ref_tracker *
      drm/i915/power: drop wakeref parameter from with_intel_display_power*=
()
      drm/i915/power: convert intel_wakeref_t to struct ref_tracker *
      drm/{i915,xe}/display: drop intel_wakeref.h usage
      drm/xe/compat: remove unused i915_active.h and i915_active_types.h
      drm/{i915, xe}/display: make pxp key check part of bo interface
      Merge drm/drm-next into drm-intel-next
      drm/i915/crtc: move crtc initialization loop to intel_crtc.c
      drm/hyperv: move Kconfig under driver directory
      drm/vgem: move Kconfig under driver directory
      drm/Kconfig: move generic Kconfig options above drivers
      drm/Kconfig: sort driver Kconfig source list
      drm/i915/fbc: let to_intel_display() do its generic magic
      drm/xe/stolen: unify interface with i915
      drm/{i915, xe}/stolen: move stolen memory handling to display
parent interface
      drm/{i915, xe}/stolen: make insert_node, area_address, area_size opti=
onal
      drm/vblank: remove drm_wait_one_vblank() completely
      drm/vblank: remove superfluous pipe check
      drm/vblank: add return value to drm_crtc_wait_one_vblank()
      drm/vblank: limit vblank variable scope to atomic
      drm/vblank: use the drm_vblank_crtc() and drm_crtc_vblank_crtc()
helpers more
      drm/vblank: prefer drm_crtc_vblank_crtc() over drm_vblank_crtc()
      drm/i915/panic: move i915 specific panic implementation to i915
      drm/{i915, xe}/panic: move panic handling to parent interface
      drm/intel: fix parent interface kernel-doc
      drm/intel: group individual funcs in parent interface
      drm/intel: sort parent interface struct definitions and members
      drm/i915: sort parent interface initialization
      drm/xe: sort parent interface initialization
      drm/i915/display: group and sort the parent interface wrappers better
      drm/gem: fix build for mm_get_unmapped_area() call after backmerge
      drm/i915/wakeref: clean up INTEL_WAKEREF_PUT_* flag macros
      drm/i915/colorop: do not include headers from headers
      drm/i915: move display/intel_plane_initial.c to i915_initial_plane.c
      drm/xe/display: rename xe_plane_initial.c to xe_initial_plane.c
      drm/i915: rename intel_plane_initial.h to intel_initial_plane.h
      drm/{i915, xe}: move initial plane calls to parent interface
      drm/{i915, xe}: deduplicate intel_initial_plane_config() between
i915 and xe
      drm/{i915, xe}: deduplicate plane_config_fini() between i915 and xe
      drm/{i915, xe}: start deduplicating
intel_find_initial_plane_obj() between i915 and xe
      drm/i915: return plane_state from intel_reuse_initial_plane_obj()
      drm/xe: return plane_state from intel_reuse_initial_plane_obj()
      drm/i915: further deduplicate intel_find_initial_plane_obj()
      drm/{i915, xe}: deduplicate intel_alloc_initial_plane_obj() FB
modifier checks
      drm/{i915,xe}: deduplicate initial plane setup
      drm/{i915, xe}: pass struct drm_plane_state instead of struct
drm_crtc to ->setup
      drm/{i915, xe}: pass struct drm_device instead of drm_device to
->alloc_obj
      drm/i915: drop dependency on struct intel_display from i915 initial p=
lane
      drm/xe/display: drop i915_utils.h
      drm/atomic: convert drm_atomic_get_{old, new}_colorop_state()
into proper functions
      drm/i915: remove unused dev_priv local variable
      drm/xe/compat: remove unused forcewake get/put macros
      drm/xe/compat: convert uncore macro to static inlines
      drm/i915/display: use to_intel_uncore() to avoid i915_drv.h
      drm/i915: drop i915 param from i915_fence{, _context}_timeout()
      drm/xe: remove compat i915_drv.h and -Ddrm_i915_private=3Dxe_device h=
ack
      drm/i915/utils: drop unnecessary ifdefs
      drm/i915/display: remove accidentally added empty file
      drm/i915/gvt: sort and group include directives
      drm/i915/gvt: include sched_policy.h only where needed
      drm/i915/gvt: reduce include of gt/intel_engine_regs.h
      drm/i915/gvt: reduce include of vfio.h
      drm/i915/gvt: include intel_display_limits.h where needed
      mei: late_bind: fix struct intel_lb_component_ops kernel-doc
      drm/xe/guc: fix struct guc_lfd_file_header kernel-doc
      drm/xe/vf: fix struct xe_gt_sriov_vf_migration kernel-doc
      drm/xe/xe_late_bind_fw: fix enum xe_late_bind_fw_id kernel-doc
      drm/xe/vm: fix xe_vm_validation_exec() kernel-doc
      drm/xe: improve header check
      drm/rockchip: inno-hdmi: make inno_hdmi.h header self-contained

Jay Cornwall (8):
      drm/amdkfd: Trap handler support for expert scheduling mode
      drm/amdkfd: Fix VGPR bank state save in gfx12.1 trap handler
      drm/amdkfd: Apply VGPR bank state fixup on gfx12.1 trap exit
      drm/amdkfd: Sync trap handler binary with source
      drm/amdkfd: Fix scalar load ordering in gfx12.1 trap handler
      drm/amdkfd: gfx12.1 cluster barrier context save workaround
      drm/amdkfd: gfx12.1 trap handler support for expert scheduling mode
      drm/amdkfd: gfx12.1 trap handler instruction fixup for VOP3PX

Jeongjun Park (3):
      drm/exynos: vidi: use priv->vidi_dev for ctx lookup in
vidi_connection_ioctl()
      drm/exynos: vidi: fix to avoid directly dereferencing user pointer
      drm/exynos: vidi: use ctx->lock to protect struct vidi_context
member variables related to memory alloc/free

Jesse.Zhang (6):
      drm/amd/amdgpu: Add independent hang detect work for user queue fence
      drm/amdgpu/vcn4.0.3: implement DPG pause mode handling for VCN 4.0.3
      drm/amdgpu/vcn4.0.3: rework reset handling
      drm/amdgpu/vcn5.0.1: rework reset handling
      drm/amdgpu: Fix jpeg ring test order in vcn_v4_0_3
      drm/amdgpu: validate user queue size constraints

Jessica Zhang (1):
      mailmap: Update Jessica Zhang's email address

Jie Zhang (1):
      dt-bindings: display/msm/rgmu: Document A612 RGMU

Jing Zhou (1):
      drm/amd/display: Correct FIXED_VS Link Rate Toggle Condition

Jinzhou Su (4):
      drm/amd/ras: Support physical address convert
      drm/amdgpu: Add address checking for uniras
      drm/amd/ras: Replace NPS flags in ras module
      drm/amd/pm: Fix null pointer dereference issue

Jiqian Chen (1):
      drm/amdgpu: free hw_vm_fence when fail in amdgpu_job_alloc

Jocelyn Falempe (2):
      drm/panic: Rename draw_panic_static_* to draw_panic_screen_*
      drm/panic: Add kunit tests for drm_panic

Johan Hovold (2):
      drm/tegra: dsi: fix device leak on probe
      drm/msm/a6xx: fix bogus hwcg register updates

John Hubbard (4):
      gpu: nova-core: use CStr::from_bytes_until_nul() and remove util.rs
      gpu: nova-core: use CStr::from_bytes_until_nul() in elf64_section()
      gpu: nova-core: preserve error information in gpu_name()
      gpu: nova-core: don't print raw PMU table entries

Jon Doron (1):
      drm/amdgpu: fix NULL pointer dereference in
amdgpu_gmc_filter_faults_remove

Jonathan Cavitt (4):
      drm/xe/xe_sriov_packet: Return int from pf_descriptor_init
      drm/xe/guc: READ/WRITE_ONCE g2h_fence->done
      drm/xe/guc: READ/WRITE_ONCE ct->state
      drm/i915/display: Prevent u64 underflow in intel_fbc_stolen_end

Jonathan Kim (7):
      drm/amdkfd: bump minimum vgpr size for gfx1151
      drm/amdkfd: disable shader message vgpr deallocation on gc 12.1
      drm/amdkfd: allow debug subscription to lds violations on gfx 1250
      drm/amdkfd: fix partitioned gfx12 address watch enablement
      drm/amdkfd: enable precise memory operations for gfx1250
      drm/amdkfd: fix gfx11 restrictions on debugging cooperative launch
      drm/amdkfd: add extended capabilities to device snapshot

Joshua Aberback (2):
      drm/amd/display: Defer transitions from minimal state to final state
      drm/amd/display: Re-implement minimal transition deferral

Jouni H=C3=B6gander (13):
      drm/i915/psr: Add panel granularity information into intel_connector
      drm/i915/psr: Use SU granularity information available in intel_conne=
ctor
      drm/i915/psr: Compute Panel Replay/Adaptive Sync coexistence behavior
      drm/i915/psr: Move pr_dpcd and psr_dpcd to intel_connector
      drm/i915/psr: Clear pr_dpcd as well on disconnect
      drm/i915/psr: Move Panel Replay DSC sink support data to intel_connec=
tor
      drm/i915/psr: Move sink PSR and Panel Replay booleans to intel_connec=
tor
      drm/i915/psr: Move sink_sync_latency to intel_connector
      drm/i915/psr: Set plane id bit in crtc_state->async_flip_planes for P=
SR
      drm/i915/psr: Perform full frame update on async flip
      drm/i915/psr: Allow async flip when Selective Fetch enabled
      drm/i915/display: Allow async flip when Selective Fetch is enabled
      drm/i915/psr: Don't enable Panel Replay on sink if globally disabled

Juha-Pekka Heikkila (2):
      drm/i915: switch to use kernel standard error injection
      drm/i915: Add intel_gvt_driver_remove() onto error cleanup path

Julia Filipchuk (3):
      drm/xe/guc: Recommend GuC v70.53.0 for MTL, DG2, LNL
      drm/xe/guc: Recommend GuC v70.54.0 for BMG, PTL
      drm/i915/guc: Recommend GuC v70.53.0 for DG2, MTL

Julia Lawall (2):
      drm/amdgpu: update outdated comment
      drm/amdkfd: update outdated comment

Junxiao Chang (1):
      drm/me/gsc: mei interrupt top half should be in irq disabled context

Kaier Hsueg (1):
      drm/amd/display: Fix P010, NV12, YUY2 scale down by four times failur=
e

Karol Wachowski (2):
      accel/ivpu: Validate scatter-gather size against buffer size
      accel/ivpu: Implement warm boot flow for NPU6 and unify boot handling

Karthik Poosa (5):
      drm/xe/hwmon: Expose temperature limits
      drm/xe/hwmon: Expose memory controller temperature
      drm/xe/hwmon: Expose GPU PCIe temperature
      drm/xe/hwmon: Expose individual VRAM channel temperature
      drm/xe/pm: Disable D3Cold for BMG only on specific platforms

Karunika Choo (1):
      drm/panthor: Fix NULL pointer dereference on panthor_fw_unplug

Kent Russell (1):
      drm/amdgpu: Send RMA CPER at bad page loading

Ketil Johnsen (1):
      drm/panthor: Evict groups before VM termination

Konrad Dybcio (1):
      dt-bindings: display/msm/gpu: Straighten out reg-names on A619L/610/7=
02

Krzysztof Niemiec (1):
      drm/i915/gem: Zero-initialize the eb.vma array in i915_gem_do_execbuf=
fer

Lad Prabhakar (3):
      dt-bindings: display: bridge: renesas,dsi: Document RZ/V2H(P) and RZ/=
V2N
      drm: renesas: rz-du: mipi_dsi: Add LPCLK clock support
      drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC

Lancelot Six (1):
      drm/amdkfd: Do not include VGPR MSBs in saved PC during save

Lang Yu (7):
      drm/amdgpu/gfx12.1: Don't fetch default register values from
hardware in mqd init
      drm/amdgpu/mes: Simplify hqd mask initialization
      drm/amdkfd: Switch to using GC VERSION to decide LDS/Scratch base
      drm/amdgpu: Add a helper macro to align mqd size
      drm/amdgpu: Use AMDGPU_MQD_SIZE_ALIGN in KGD
      drm/amdkfd: Adjust parameter of allocate_mqd
      drm/amdkfd: Use AMDGPU_MQD_SIZE_ALIGN in gfx11+ kfd mqd manager

Langyan Ye (2):
      drm/panel-edp: Add CSW MNE007QB3-1
      drm/panel: ilitek-ili9882t: Switch Tianma TL121BVMS07 to DSC 120Hz mo=
de

Le Ma (9):
      drm/amdgpu: Add psp v15.0.8 ip block v3
      drm/amdgpu: Set psp ip block and funcs for v15.0.8
      drm/amdgpu: add soc v1_0 common block for IP discovery
      drm/amdgpu: remove hdp flush/invalidation completely for
gfx12.1.0/sdma7.1.0
      drm/amdgpu: Use AMDGPU_IS_GFXHUB to screen out GFXHUB for GMC v12.1
      drm/amdgpu: flush tlb properly for GMC v12.1 in early phase
      drm/amdgpu: enable CP interrupt for gfx v12_1 in frontdoor loading ca=
se
      drm/amdgpu: reserve umf hole size at vram high end for gfx v12.1
      drm/amdgpu: add helpers to access cross-die registers smn addr
for soc v1_0

Leo Chen (1):
      drm/amd/display: Add global fgcg function prototype to DCCG

Liankun Yang (1):
      drm/mediatek: Move DP training to hotplug thread

Lijo Lazar (84):
      drm/amdgpu: Change user queue interface signatures
      drm/amdgpu: Clean up userq helper functions
      drm/amdgpu: Rename userq_mgr_xa to userq_xa
      drm/amdgpu: Make pre_asic_init optional
      drm/amd/pm: Remove print_clk_levels from navi10
      drm/amd/pm: Use emit_clk_levels in sienna_cichild
      drm/amd/pm: Use emit_clk_levels in cyan skillfish
      drm/amd/pm: Use emit_clk_levels in vangogh
      drm/amd/pm: Use emit_clk_levels in renoir
      drm/amd/pm: Use emit_clk_levels in SMUv13.0.0
      drm/amd/pm: Use emit_clk_levels in SMUv13.0.4
      drm/amd/pm: Use emit_clk_levels in SMUv13.0.5
      drm/amd/pm: Use emit_clk_levels in SMUv13.0.6
      drm/amd/pm: Use emit_clk_levels in SMUv13.0.7
      drm/amd/pm: Use emit_clk_levels in yellow carp
      drm/amd/pm: Use emit_clk_levels in SMUv14.0.0
      drm/amd/pm: Use emit_clk_levels in SMUv14.0.2
      drm/amd/pm: Use emit_clock_levels in SMUv7.0
      drm/amd/pm: Use emit_clock_levels in SMUv8.0
      drm/amd/pm: Use emit_clock_levels in SMUv10.0
      drm/amd/pm: Use emit_clock_levels in vega10
      drm/amd/pm: Use emit_clock_levels in vega12
      drm/amd/pm: Use emit_clock_levels in vega20
      drm/amd/pm: Deprecate print_clock_levels interface
      drm/amd/pm: Add clock table structure
      drm/amd/pm: Use generic dpm table for SMUv11 SOCs
      drm/amd/pm: Use generic dpm table for SMUv13 SOCs
      drm/amd/pm: Use generic dpm table for SMUv14 SOCs
      drm/amd/pm: Add generic pcie dpm table
      drm/amd/pm: Use generic pcie dpm table for SMUv11
      drm/amd/pm: Use generic pcie dpm table for SMUv13
      drm/amd/pm: Use generic pcie dpm table for SMUv14
      drm/amd/pm: Add a helper to show dpm table
      drm/amd/pm: Use common helper for arcturus dpm
      drm/amd/pm: Use common helper for navi10 dpm table
      drm/amd/pm: Use common helper for sienna dpm table
      drm/amd/pm: Use common helper for aldebaran dpm table
      drm/amd/pm: Use common helper for smuv13.0.0 dpm
      drm/amd/pm: Use common helper for smuv13.0.6 dpm
      drm/amd/pm: Use common helper for smuv13.0.7 dpm
      drm/amd/pm: Use common helper for smuv14.0.2 dpm
      drm/amdgpu: Move ip block related functions
      drm/amdgpu: Use helper to get ip block
      drm/amdgpu: Change set ip clock/power gating param
      drm/amd/pm: Add smu driver table structure
      drm/amd/pm: Use driver table structure in smuv11
      drm/amd/pm: Use driver table structure in smuv12
      drm/amd/pm: Use driver table structure in smuv13
      drm/amd/pm: Use driver table structure in smuv14
      drm/amd/pm: Use cached gpu metrics table
      drm/amd/pm: Use driver table for board temperature
      drm/amd/pm: Return right size for gpuboard metrics
      drm/amd/pm: Add smu message control block
      drm/amd/pm: Add message control for SMUv11
      drm/amd/pm: Add message control for SMUv12
      drm/amd/pm: Add message control for SMUv13
      drm/amd/pm: Add message control for SMUv14
      drm/amd/pm: Add message control for SMUv15
      drm/amd/pm: Use message control in messaging
      drm/amd/pm: Add async message call support
      drm/amd/pm: Replace without wait with async calls
      drm/amd/pm: Remove unused legacy message functions
      drm/amd/pm: Drop legacy message fields from SMUv11
      drm/amd/pm: Drop legacy message fields from SMUv12
      drm/amd/pm: Drop legacy message fields from SMUv13
      drm/amd/pm: Drop legacy message fields from SMUv14
      drm/amd/pm: Drop legacy message fields from SMUv15
      drm/amd/pm: Drop legacy message related fields
      drm/amd/pm: Drop unused ppt callback from SMUv11
      drm/amd/pm: Drop unused ppt callback from SMUv12
      drm/amd/pm: Drop unused ppt callback from SMUv13
      drm/amd/pm: Drop unused ppt callback from SMUv14
      drm/amd/pm: Drop unused ppt callback from SMUv15
      drm/amd/pm: Drop unused ppt callback definitions
      drm/amd/pm: Add debug message callback
      drm/amd/pm: Use message control for debug mailbox
      drm/amd/pm: Use emit clock levels in SMU v15.0.0
      drm/amd/pm: Deprecate print_clk_levels callback
      drm/amd/pm: Fix unneeded semicolon warning
      drm/amdgpu: Avoid excessive dmesg log
      drm/amd/pm: Add smu feature bits data struct
      drm/amd/pm: Add smu feature interface functions
      drm/amd/pm: Remove unused logic in SMUv14.0.2
      drm/amd/pm: Initialize allowed feature list

Likun Gao (45):
      drm/amdgpu: fix NULL pointer issue buffer funcs
      drm/amdgpu: fix NULL pointer issue for supports_baco
      drm/amdgpu: Add initial support for mmhub v4_2
      drm/amdgpu: Add gmc v12_1 support
      drm/amdgpu: Add gmc v12_1_0 to discovery list
      drm/amdgpu: create pkt header for sdma v7_1
      drm/amdgpu: Add sdma v7_1_0 support
      drm/amdgpu: add support for sdma v7_1
      drm/amdgpu: Set GC family for GC 12.1
      drm/amdgpu: create pm4 header for gc v12_1
      drm/amdgpu: Add initial support for gfx v12_1
      drm/amdgpu: Add gfx v12_1_0 to discovery list
      drm/amdgpu: update rlc autoload function
      drm/amdgpu: only set XCC 0 related reg for rlc autoload
      drm/amdgpu: skip SDMA autoload copy if not initialized
      drm/amdgpu: add soc config init for GC v12_1
      drm/amdgpu: add xcc info for compute ring name
      drm/amdgpu: set gfxhub according xcc_mask for gfx 12_1
      drm/amdgpu/gmc12: set MMHUBs based on aid_mask
      drm/amdgpu: fix mes code error for muti-xcc
      drm/amdgpu: add imu support for gc 12_1
      drm/amdgpu: revision doorbel range for gfx v12_1
      drm/amdgpu: enable unmap doorbell handle for gfx v12_1
      drm/amdgpu: disable graphics doorbell range for gfx v12_1
      drm/amdgpu: update sdma configuration for soc v1_0
      drm/amdgpu: support rlc autoload for muti-xcc
      drm/amdgpu: only copy ucode for enabled xcc
      drm/amdgpu: enable gpu tlb flush for gfxhub
      drm/amdgpu: Correct xcc_id input to GET_INST from physical to logic
      drm/amdgpu: use physical xcc id to get rrmt
      drm/amdgpu: Correct inst_id input from physical to logic
      drm/amdgpu: support xcc harvest for ih translate
      drm/amdgpu: normalize reg addr as local xcc for gfx v12_1
      drm/amdgpu: add gfx sysfs support for gfx_v12_1
      drm/amdgpu: correct rlc autoload for xcc harvest
      drm/amdgpu: disable burst for gfx v12_1
      drm/amdgpu: adjust xcc_cp_resume function for gfx_v12_1
      drm/amdgpu: adjust xcc logic for gfxhub v12_1
      drm/amdgpu: adjust xcc_id program logic for sdma v7_1
      drm/amdgpu: make normalize reg addr to common func for soc v1
      drm/amdgpu: update mcm_addr_lut data for imu v12_1
      drm/amdkfd: Add gfx_v12_1_kfd2kgd interface for GFX12_1
      drm/amdgpu: skip gfxhub tlb flush if gfx is power off
      drm/amdgpu: set aid_mask for soc v1
      drm/amdgpu: remove frame cntl for gfx v12

LinCheng Ku (1):
      drm/amd/display: Add USB-C DP Alt Mode lane limitation in DCN32

Linus Walleij (1):
      dma-buf: heaps: Clear CMA pages with clear_page()

Liu Ying (3):
      drm/bridge: imx8qxp-ldb: Fix NULL pointer dereference in
imx8qxp_ldb_bridge_destroy()
      drm/bridge: imx8qxp-pxl2dpi: Fix NULL pointer dereference in
imx8qxp_pxl2dpi_bridge_destroy()
      drm/bridge: imx8qxp-pixel-combiner: Fix bailout for
imx8qxp_pc_bridge_probe()

Lizhi Hou (19):
      accel/amdxdna: Poll MPNPU_PWAITMODE after requesting firmware suspend
      accel/amdxdna: Fix tail-pointer polling in mailbox_get_msg()
      accel/amdxdna: Fix race condition when checking rpm_on
      accel/amdxdna: Fix cu_idx being cleared by memset() during command se=
tup
      accel/amdxdna: Fix race where send ring appears full due to
delayed head update
      accel/amdxdna: Fix potential NULL pointer dereference in context clea=
nup
      accel/amdxdna: Remove amdxdna_flush()
      accel/amdxdna: Remove NPU2 support
      accel/amdxdna: Enable temporal sharing only mode
      accel/amdxdna: Enable hardware context priority
      accel/amdxdna: Update message DMA buffer allocation
      accel/amdxdna: Update firmware version check for latest firmware
      accel/amdxdna: Fix notifier_wq flushing warning
      accel/amdxdna: Hold mm structure across iommu_sva_unbind_device()
      accel/amdxdna: Stop job scheduling across aie2_release_resource()
      accel/amdxdna: Remove hardware context status
      accel/amdxdna: Fix incorrect error code returned for failed chain com=
mand
      accel/amdxdna: Fix incorrect DPM level after suspend/resume
      accel/amdxdna: Move RPM resume into job run function

Loic Poulain (1):
      drm/bridge: anx7625: Fix invalid EDID size

Louis-Alexis Eyraud (1):
      dt-bindings: phy: mediatek,hdmi-phy: Add support for MT8188 SoC

Lo=C3=AFc Molinari (13):
      drm/shmem-helper: Simplify page offset calculation in fault handler
      drm/shmem-helper: Map huge pages in fault handler
      drm/gem: Introduce drm_gem_get_unmapped_area() fop
      drm/gem: Add huge tmpfs mountpoint helpers
      drm/i915: Use huge tmpfs mountpoint helpers
      drm/v3d: Use huge tmpfs mountpoint helpers
      drm/gem: Get rid of *_with_mnt helpers
      drm/panthor: Introduce huge tmpfs mountpoint option
      drm/panfrost: Introduce huge tmpfs mountpoint option
      Documentation/gpu/drm-mm: Add THP paragraph to GEM mapping section
      drm/panthor: Add flag to map GEM object Write-Back Cacheable
      drm/i915: Fix BO alloc flags
      drm/gem: Fix kerneldoc warnings

Lu Yao (1):
      drm/amdgpu: fix drm panic null pointer when driver not support atomic

Luca Ceresoli (39):
      drm/bridge: add drm_bridge_unplug() and drm_bridge_enter/exit()
      drm/bridge: ti-sn65dsi83: protect device resources on unplug
      drm/bridge: add of_drm_find_and_get_bridge()
      drm/bridge: deprecate of_drm_find_bridge()
      drm/todo: add entry about converting to of_drm_find_and_get_bridge()
      drm/bridge: make of_drm_find_bridge() a wrapper of
of_drm_find_and_get_bridge()
      drm/arcpgu: convert to of_drm_find_and_get_bridge()
      drm/bridge: add next_bridge pointer to struct drm_bridge
      drm/bridge: ite-it66121: get/put the next bridge
      drm/bridge: imx8qxp-pixel-combiner: get/put the next bridge
      drm/bridge: simple-bridge: get/put the next bridge
      drm/meson: encoder_cvbs: get/put the next bridge
      drm/meson: encoder_dsi: get/put the next bridge
      drm/meson: encoder_hdmi: get/put the next bridge
      drm/bridge: imx8qxp-pxl2dpi: simplify put of device_node pointers
      drm/bridge: imx8qxp-pxl2dpi: remove excess error message
      drm/bridge: imx8qxp-pxl2dpi: imx8qxp_pxl2dpi_find_next_bridge:
return int, not ERR_PTR
      drm/bridge: imx8qxp-pxl2dpi: get/put the next bridge
      drm/bridge: imx8qxp-pxl2dpi: get/put the companion bridge
      drm/bridge: imx8qxp-pixel-link: remove excess error message
      drm: of: drm_of_panel_bridge_remove(): fix device_node leak
      drm: of: drm_of_panel_bridge_remove(): convert to
of_drm_find_and_get_bridge()
      drm/bridge: sii902x: convert to of_drm_find_and_get_bridge()
      drm/bridge: thc63lvd1024: convert to of_drm_find_and_get_bridge()
      drm/bridge: tfp410: convert to of_drm_find_and_get_bridge()
      drm/bridge: tpd12s015: convert to of_drm_find_and_get_bridge()
      drm/bridge: lt8912b: convert to of_drm_find_and_get_bridge()
      drm/bridge: imx8mp-hdmi-pvi: convert to of_drm_find_and_get_bridge()
      drm/bridge: imx8qxp-ldb: convert to of_drm_find_and_get_bridge()
      drm/bridge: samsung-dsim: samsung_dsim_host_attach: use a
temporary variable for the next bridge
      drm/bridge: samsung-dsim: samsung_dsim_host_attach: don't use
the bridge pointer as an error indicator
      drm/bridge: samsung-dsim: samsung_dsim_host_attach: convert to
of_drm_find_and_get_bridge()
      drm/bridge: dw-hdmi: convert to of_drm_find_and_get_bridge()
      drm/meson/dw-hdmi: convert to of_drm_find_and_get_bridge()
      drm/imx/dw-hdmi: convert to of_drm_find_and_get_bridge()
      drm/mediatek: mtk_hdmi*: convert to of_drm_find_and_get_bridge()
      drm/exynos: hdmi: convert to of_drm_find_and_get_bridge()
      drm: rcar-du: lvds: convert to of_drm_find_and_get_bridge()
      drm/bridge: fix kdoc syntax

Lucas De Marchi (5):
      drm/xe/guc: Fix stack_depot usage
      drm/xe/guc_ct: Cleanup ifdef'ry
      MAINTAINERS: Remove myself from xe maintainers
      drm/xe: Move rebar to its own file
      drm/xe: Improve rebar log messages

Ludovic Desroches (11):
      drm/atmel-hlcdc: use managed device resources for the display control=
ler
      drm/atmel-hlcdc: add support for the nomodeset kernel parameter
      drm/atmel-hlcdc: use drmm_simple_encoder_alloc()
      drm/atmel-hlcdc: use drm_crtc_mask()
      drm/atmel-hlcdc: use devm_drm_of_get_bridge()
      drm/atmel-hlcdc: use drmm_crtc_alloc_with_planes()
      drm/atmel-hlcdc: use drmm_universal_plane_alloc()
      drm/atmel-hlcdc: destroy properly the plane state in the reset callba=
ck
      drm/atmel-hlcdc: fix memory leak from the atomic_destroy_state callba=
ck
      drm/atmel-hlcdc: fix use-after-free of drm_crtc_commit after release
      drm/atmel-hlcdc: don't reject the commit if the src rect has
fractional parts

Lukasz Laguna (8):
      drm/xe: Add device flag to indicate standalone MERT
      drm/xe/pf: Configure LMTT in MERT
      drm/xe/pf: Add TLB invalidation support for MERT
      drm/xe/pf: Handle MERT catastrophic errors
      drm/xe: Validate wedged_mode parameter and define enum for modes
      drm/xe: Update wedged.mode only after successful reset policy change
      drm/xe/vf: Disallow setting wedged mode to upon-any-hang
      drm/xe/pf: Allow upon-any-hang wedged mode only in debug config

Lyude Paul (1):
      rust/drm: Fix Registration::{new,new_foreign_owned}() docs

Maarten Lankhorst (7):
      drm/xe: Start using ggtt->start in preparation of balloon removal
      drm/xe: Convert xe_fb_pin to use a callback for insertion into GGTT
      drm/xe: Add xe_ggtt_node_addr() to avoid dereferencing xe_ggtt_node
      drm/xe/display: Avoid dereferencing xe_ggtt_node
      drm/xe: Do not dereference ggtt_node in xe_bo.c
      drm/xe: Improve xe_gt_sriov_pf_config GGTT handling
      drm/xe: Privatize xe_ggtt_node

Madhur Kumar (1):
      drm/xe/pmu: Replace sprintf() with sysfs_emit()

Mahadevan P (1):
      drm/msm/disp/dpu: add merge3d support for sc7280

Mani Chandana Ballary Kuntumalla (1):
      drm/msm/dp: Update msm_dp_controller IDs for sa8775p

Marco Crivellari (4):
      drm/xe: fix WQ_MEM_RECLAIM passed as max_active to alloc_workqueue()
      drm/rockchip: replace use of system_unbound_wq with system_dfl_wq
      drm/rockchip: replace use of system_wq with system_percpu_wq
      drm/xe: Replace use of system_wq with tlb_inval->timeout_wq

Marcus Folkesson (7):
      drm/sitronix/st7571-i2c: rename 'struct drm_device' in st7571_device
      drm/sitronix/st7571-i2c: add 'struct device' to st7571_device
      drm/sitronix/st7571-i2c: move common structures to st7571.h
      drm/sitronix/st7571-i2c: make probe independent of hw interface
      drm/sitronix/st7571: split up the driver into a common and an i2c par=
t
      drm/sitronix/st7571-spi: add support for SPI interface
      dt-bindings: display: sitronix,st7571: add example for SPI

Mario Limonciello (5):
      amdkfd: Bump ABI to indicate presence of Trap handler support
for expert scheduling
      drm/amdkfd: Export the cwsr_size and ctl_stack_size to userspace
      Revert "drm/amd/display: Fix pbn to kbps Conversion"
      drm/amd/display: Bump the HDMI clock to 340MHz
      drm/amd: Update IP versions for Gorgon Point products

Mario Limonciello (AMD) (18):
      drm/amd/display: Improve readability of link_detect_sink_signal_type
      drm/amd/display: Move CONNECTOR_ID_PCIE into switch/case
      drm/amd/display: Drop needless check for link->link_id.id
      drm/amd/display: Correct comment style
      drm/amd: Fix unbind/rebind for VCN 4.0.5
      drm/amd: Resume the device in thaw() callback when console
suspend is disabled
      drm/amd: Drop "amdgpu kernel modesetting enabled" message
      drm/amdkfd: Correct the topology message for APUs
      drm/amd: Add correct prefix for VBIOS message
      drm/amd: Pass `adev` to amdgpu_gfx_parse_disable_cu()
      drm/amd: Drop dev_fmt prefix
      drm/amd/display: Fix DPMS log printing
      drm/amd: Convert amdgpu_display from DRM_* to drm_ macros
      drm/amd: Drop amdgpu prefix from message prints
      drm/amd: Convert DRM_*() to drm_*()
      drm/amd: Clean up kfd node on surprise disconnect
      drm/amd/display: Show link name in PSR status message
      drm/amd/display: Detect panel type from VSDB

Martin Blumenstingl (1):
      drm/meson: venc: add support for HDMI DMT modes up to 3840x2160

Matt Coster (5):
      drm/imagination: Simplify module parameters
      drm/imagination: Validate fw trace group_mask
      drm/imagination: Load FW trace config at init
      drm/imagination: KUnit test for pvr_gpuid_decode_string()
      drm/imagination: Warn or error on unsupported hardware

Matt Roper (34):
      drm/xe/kunit: Fix forcewake assertion in mocs test
      drm/xe/vm: Use for_each_tlb_inval() to calculate invalidation fences
      drm/xe/forcewake: Add scope-based cleanup for forcewake
      drm/xe/pm: Add scope-based cleanup helper for runtime PM
      drm/xe/gt: Use scope-based cleanup
      drm/xe/gt_idle: Use scope-based cleanup
      drm/xe/guc: Use scope-based cleanup
      drm/xe/guc_pc: Use scope-based cleanup
      drm/xe/mocs: Use scope-based cleanup
      drm/xe/pat: Use scope-based forcewake
      drm/xe/pxp: Use scope-based cleanup
      drm/xe/gsc: Use scope-based cleanup
      drm/xe/device: Use scope-based cleanup
      drm/xe/devcoredump: Use scope-based cleanup
      drm/xe/display: Use scoped-cleanup
      drm/xe: Return forcewake reference type from force_wake_get_any_engin=
e()
      drm/xe/drm_client: Use scope-based cleanup
      drm/xe/gt_debugfs: Use scope-based cleanup
      drm/xe/huc: Use scope-based forcewake
      drm/xe/query: Use scope-based forcewake
      drm/xe/reg_sr: Use scope-based forcewake
      drm/xe/vram: Use scope-based forcewake
      drm/xe/bo: Use scope-based runtime PM
      drm/xe/ggtt: Use scope-based runtime pm
      drm/xe/hwmon: Use scope-based runtime PM
      drm/xe/sriov: Use scope-based runtime PM
      drm/xe/tests: Use scope-based runtime PM
      drm/xe/sysfs: Use scope-based runtime power management
      drm/xe/debugfs: Use scope-based runtime PM
      drm/xe/sync: Use for_each_tlb_inval() to calculate invalidation fence=
s
      drm/xe: Track pre-production workaround support
      drm/xe/lnl: Drop pre-production workaround support
      drm/xe/nvls: Define GuC firmware for NVL-S
      drm/xe: Cleanup unused header includes

Matthew Brost (37):
      drm/xe/vf: Start re-emission from first unsignaled job during VF migr=
ation
      drm/gpusvm: Limit the number of retries in drm_gpusvm_get_pages
      drm/xe: Covert return of -EBUSY to -ENOMEM in VM bind IOCTL
      drm/xe: Add properties line to VM snapshot capture
      drm/xe: Add "null_sparse" type to VM snap properties
      drm/xe: Add mem_region to properties line in VM snapshot capture
      drm/xe: Add pat_index to properties line in VM snapshot capture
      drm/xe: Add cpu_caching to properties line in VM snapshot capture
      drm/xe: Add VM.uapi_flags to VM snapshot capture
      drm/xe/uapi: Add DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
      drm/xe: Add replay_offset and replay_length lines to LRC HWCTX snapsh=
ot
      drm/xe: Implement DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
      drm/xe: Do not reference loop variable directly
      drm/xe: Do not forward invalid TLB invalidation seqnos to upper layer=
s
      drm/sched: Add several job helpers to avoid drivers touching
scheduler state
      drm/sched: Add pending job list iterator
      drm/xe: Adjust long-running workload timeslices to reasonable values
      drm/xe: Use usleep_range for accurate long-running workload timeslici=
ng
      drm/xe: Add debugfs knobs to control long running workload timeslicin=
g
      drm/xe: Skip exec queue schedule toggle if queue is idle during suspe=
nd
      drm/xe: Wait on in-syncs when swicthing to dma-fence mode
      drm/xe: Add GT stats ktime helpers
      drm/xe: Add more GT stats around pagefault mode switch flows
      drm/xe: Increase log level for unhandled page faults
      drm/xe: Print GuC queue submission state on engine reset
      drm/xe: Validate preferred system memory placement in
xe_svm_range_validate
      drm/xe: Adjust page count tracepoints in shrinker
      drm/pagemap Fix error paths in drm_pagemap_migrate_to_devmem
      drm/pagemap: Disable device-to-device migration
      drm/xe: Add dedicated message lock
      drm/xe: Stop abusing DRM scheduler internals
      drm/xe: Only toggle scheduling in TDR if GuC is running
      drm/xe: Do not deregister queues in TDR
      drm/xe: Remove special casing for LR queues in submission
      drm/xe: Disable timestamp WA on VFs
      drm/xe: Avoid toggling schedule state to check LRC timestamp in TDR
      drm/xe: Reduce LRC timestamp stuck message on VFs to notice

Matthew Stewart (1):
      drm/amd/display: Fix GFX12 family constant checks

Maxime Ripard (2):
      drm/atomic: Add dev pointer to drm_private_obj
      Merge drm/drm-next into drm-misc-next

Ma=C3=ADra Canal (2):
      drm/v3d: Consolidate CPU job validation in a function
      drm/v3d: Convert v3d logging to device-based DRM helpers

Michael Chen (2):
      drm/amdgpu/mes12_1: set multi-xcc mes log address
      drm/amdgpu: Fix CP_MEC_MDBASE in multi-xcc for gfx v12_1

Michael Strauss (1):
      drm/amd/display: Add debug flag to override min dispclk

Michael Walle (1):
      dt-bindings: gpu: img: Add AM62P SoC specific compatible

Michal Wajdeczko (12):
      drm/xe/pf: Use div_u64 when calculating GGTT profile
      drm/xe/pf: Fix .bulk_profile/sched_priority description
      drm/xe/guc: Fix version check for page-reclaim feature
      drm/xe: Introduce IF_ARGS macro utility
      drm/xe/guc: Introduce GUC_FIRMWARE_VER_AT_LEAST helper
      drm/xe/pf: Prepare for new threshold KLVs
      drm/xe/mert: Normalize xe_mert.h include guards
      drm/xe/mert: Fix kernel-doc for struct xe_mert
      drm/xe/mert: Always refer to MERT using xe_device
      drm/xe/mert: Use local mert variable to simplify the code
      drm/xe/mert: Move MERT initialization to xe_mert.c
      drm/xe/mert: Improve handling of MERT CAT errors

Micha=C5=82 Grzelak (2):
      i915/display/intel_ddi: Reduce severity of failed FEC enabling
      drm/buddy: release free_trees array on buddy mm teardown

Micha=C5=82 Winiarski (7):
      drm/xe/pf: Fix kernel-doc warning in migration_save_consume
      drm/xe/pf: Drop the VF VRAM BO reference on successful restore
      drm/xe/pf: Check for fence error on VRAM save/restore
      drm/xe/pf: Enable SR-IOV VF migration
      drm/xe/pci: Introduce a helper to allow VF access to PF xe_device
      drm/xe/pf: Export helpers for VFIO
      vfio/xe: Add device specific vfio_pci driver variant for Intel graphi=
cs

Mika Kahola (17):
      drm/i915/cx0: Rename TBT functions to be ICL specific
      drm/i915/cx0: Remove state verification
      drm/i915/cx0: Add PLL information for MTL+
      drm/i915/cx0: Update C10/C20 state calculation
      drm/i915/cx0: Compute plls for MTL+ platform
      drm/i915/cx0: Add MTL+ .get_dplls hook
      drm/i915/cx0: Add MTL+ .put_dplls hook
      drm/i915/cx0: Add MTL+ .update_active_dpll hook
      drm/i915/cx0: Add MTL+ .update_dpll_ref_clks hook
      drm/i915/cx0: Add MTL+ .dump_hw_state hook
      drm/i915/cx0: Add .compare_hw_state hook
      drm/i915/cx0: Add MTL+ .get_hw_state hook
      drm/i915/cx0: Add MTL+ .get_freq hook
      drm/i915/cx0: Add MTL+ .crtc_get_dpll hook
      drm/i915/cx0: Add MTL+ .enable_clock/.disable clock hooks on DDI
      drm/i915/cx0: Get encoder configuration for C10 and C20 PHY PLLs
      drm/i915/cx0: Enable dpll framework for MTL+

Mika Kuoppala (1):
      drm/xe: Fix memory leak when handling pagefault vma

Mitul Golani (12):
      drm/i915/display: Add source param for dc balance
      drm/i915/vrr: Add VRR DC balance registers
      drm/i915/vrr: Add DC Balance params to crtc_state
      drm/i915/vrr: Add state dump for DC Balance params
      drm/i915/vrr: Add compute config for DC Balance params
      drm/i915/vrr: Add function to check if DC Balance Possible
      drm/i915/vrr: Add function to reset DC balance accumulated params
      drm/i915/display: Add DC Balance flip count operations
      drm/i915/vrr: Write DC balance params to hw registers
      drm/i915/display: Wait for VRR PUSH status update
      drm/i915/display: Add function to configure event for dc balance
      drm/i915/vrr: Enable DC Balance

Muaaz Nisar (1):
      drm/amd/display: mouse event trigger to boost RR when idle

Mukesh Ogare (3):
      drm/radeon: Convert logging in radeon_display.c to drm_* helpers
      drm/radeon: convert UVD v1.0 logging to drm_* helpers
      drm/radeon: convert VCE logging to drm_* helpers

Mukul Joshi (45):
      drm/amdkfd: Rework reserved SDMA queue handling
      drm/amdgpu: update soc15 IH client ids
      drm/amdgpu: add PCIe atomics bit in PTE
      drm/amdgpu: Generalize HQD and VMID mask calculation for MES
      drm/amdgpu: Enable IH CAM on IH 7.1.0
      drm/amdgpu: Add per-ASIC PTE init flag
      drm/amdgpu: Always set snoop bit in PDE on GFX 12.1
      drm/amdgpu: Enable PDE.C usage on GFX 12.1
      drm/amdkfd: Fix PTE clearing during SVM unmap on GFX 12.1
      drm/amdgpu: Update Generate PTE/PDE SDMA packet for SDMA 7.1
      drm/amdkfd: Add SDMA 7.1.0 support in KFD
      drm/amdgpu: Fix golden register init for GFX 12.1.0
      drm/amdgpu: Setup Atomics enable in TCP UTCL0 for GFX 12.1.0
      drm/amdgpu: Setup PCIe atomics bit in PTE on GFX 12.1.0
      drm/amdkfd: Add GFX 12.1.0 support in KFD
      drm/amdkfd: Add MQD manager for GFX 12.1.0
      drm/amdkfd: Add interrupt handling for GFX 12.1.0
      drm/amdgpu: Fix SHMEM alignment mode for GFX 12.1.0
      drm/amdgpu: Setup MTYPEs for GFX 12.1.0
      drm/amdgpu: Revert retry based thrashing prevention on GFX 12.1.0
      drm/amdgpu: Add UTCL2 Retry fault interrupt for GFX 12.1
      drm/amdgpu: Add interrupt handler for GFX 12.1.0
      drm/amdgpu: Add IH node-id to XCC mapping
      drm/amdgpu: Enable retry faults for GFX 12.1
      drm/amdkfd: Enable per-process XNACK for GFX 12.1.0
      drm/amdgpu: Update MES VM_CNTX_CNTL for XNACK off for GFX 12.1
      drm/amdgpu: Flush TLB on all XCCs on GFX 12.1
      drm/amdkfd: Update CWSR area calculations for GFX 12.1
      drm/amdgpu: Fix CU info calculations for GFX 12.1
      drm/amdkfd: Override KFD SVM mappings for GFX 12.1
      drm/amdgpu: Program IH_VMID_LUT_INDEX register on GFX 12.1
      drm/amdgpu: Setup Retry based thrashing prevention on GFX 12.1
      drm/amdgpu: Use correct MES pipe in non-SPX mode on GFX 12.1
      drm/amdgpu: Rework MES initialization on GFX 12.1
      drm/amdkfd: Don't partition VMID space on GFX 12.1
      drm/amdkfd: Add/remove queues on the correct XCC on GFX 12.1
      drm/amdkfd: Send MES packets on correct XCC on GFX 12.1
      drm/amdgpu: Report correct compute partition mode on GFX 12.1
      drm/amdgpu: Setup MTYPE on SOC models for GFX 12.1
      drm/amdgpu: Always set PTE.B for device memory on GFX 12.1
      drm/amdkfd: Implement CU Masking for GFX 12.1
      drm/amdgpu: Disable TCP Early Write Ack for GFX 12.1
      drm/amdgpu: Cleanup gmc_v12_1 after 6.16 merge
      drm/amdkfd: Add back CWSR trap handler for GFX 12.1
      drm/amdgpu: Update TCP Control register on GFX 12.1

Nathan Chancellor (7):
      drm/amd/display: Apply e4479aecf658 to dml
      drm/amd/display: Reduce number of arguments of dcn30's
CalculatePrefetchSchedule()
      drm/amd/display: Reduce number of arguments of dcn30's
CalculateWatermarksAndDRAMSpeedChangeSupport()
      drm/panic: Ensure drm_panic_type is initialized to a valid value
      drm/panic: Fix expected string for QR_CODE in drm_panic_type_map
      drm/msm/dp: Avoid division by zero in msm_dp_ctrl_config_msa()
      drm/panel: ilitek-ili9882t: Remove duplicate initializers in
tianma_il79900a_dsc

Navid Assadian (1):
      drm/amd/display: Add configurable SPL namespace prefix

Nemesa Garg (1):
      drm/i915/crtc: Expose sharpness only if num_scalers is >=3D 2

Nevenko Stupar (2):
      drm/amd/display: Add additional info from DML
      drm/amd/display: Additional info from DML for DMU

Nicholas Kazlauskas (7):
      drm/amd/display: Fix wrong x_pos and y_pos for cursor offload
      drm/amd/display: Reset pipe mask at beginning of cursor offload
      drm/amd/display: Fix mismatched unlock for DMUB HW lock in HWSS fast =
path
      drm/amd/display: Adjust PHY FSM transition to TX_EN-to-PLL_ON
for TMDS on DCN35
      drm/amd/display: Add pwait status to DMCUB debug logging
      drm/amd/display: Ensure link output is disabled in backend reset
for PLL_ON
      drm/amd/display: Add DMU crash recovery callback to DM

Nicolas Frattaroli (2):
      dt-bindings: gpu: mali-valhall-csf: Add shader-present nvmem cell
      drm/panthor: Implement reading shader_present from nvmem

Niranjana Vishwanathapura (20):
      drm/xe/xe3p_xpc: Enable Indirect Ring State for xe3p_xpc
      drm/xe/multi_queue: Add multi_queue_enable_mask to gt information
      drm/xe/multi_queue: Add user interface for multi queue support
      drm/xe/multi_queue: Add GuC interface for multi queue support
      drm/xe/multi_queue: Add multi queue priority property
      drm/xe/multi_queue: Handle invalid exec queue property setting
      drm/xe/multi_queue: Add exec_queue set_property ioctl support
      drm/xe/multi_queue: Add support for multi queue dynamic priority chan=
ge
      drm/xe/multi_queue: Add multi queue information to guc_info dump
      drm/xe/multi_queue: Handle tearing down of a multi queue
      drm/xe/multi_queue: Set QUEUE_DRAIN_MODE for Multi Queue batches
      drm/xe/multi_queue: Handle CGP context error
      drm/xe/multi_queue: Reset GT upon CGP_SYNC failure
      drm/xe/multi_queue: Teardown group upon job timeout
      drm/xe/multi_queue: Tracepoint support
      drm/xe/multi_queue: Support active group after primary is destroyed
      drm/xe/doc: Add documentation for Multi Queue Group
      drm/xe/doc: Add documentation for Multi Queue Group GuC interface
      Revert "drm/xe/multi_queue: Support active group after primary
is destroyed"
      drm/xe/doc: Remove KEEP_ACTIVE feature

N=C3=ADcolas F. R. A. Prado (1):
      dt-bindings: phy: mediatek,hdmi-phy: Document extra clocks for MT8195

Oak Zeng (1):
      drm/xe: Add page reclamation info to device info

Oleh Kuzhylnyi (1):
      drm/amd/display: Add use_max_lsw parameter

Osama Abdelkader (1):
      drm/xe: Add missing newlines to drm_warn messages

Ovidiu Bunea (3):
      drm/amd/display: Add additional checks for PSP footer size
      drm/amd/display: Fixes for S0i3 exit
      drm/amd/display: Disable FEC when powering down encoders

Peichen Huang (5):
      drm/amd/display: Don't disable DPCD mst_en if sink connected
      drm/amd/display: move panel replay out from edp
      drm/amd/display: init code for external panel replay
      drm/amd/display: Add replay_events in replay settings
      drm/amd/display: panel inst for monitors

Perry Yuan (2):
      drm/amd/pm: Disable MMIO access during SMU Mode 1 reset
      drm/amdgpu: Improve IP discovery checksum failure logging

Peter Colberg (1):
      Revert duplicate "drm/amdgpu: disable peer-to-peer access for
DCC-enabled GC12 VRAM surfaces"

Philip Yang (11):
      drm/amdgpu: GPU vm support 5-level page table
      drm/amdgpu: Update vm start, end, hole to support 57bit address
      drm/amdkfd: Handle GPU reset and drain retry fault race
      drm/amdgpu: Enable 5-level page table for GFX 12.1.0
      drm/amdkfd: Update LDS, Scratch base for 57bit address
      drm/amdgpu: Add pde3 table invalidation request for GFX 12.1.0
      drm/amdgpu: Support 57bit fault address for GFX 12.1.0
      drm/amdgpu: Fix gfx9 update PTE mtype flag
      drm/amdgpu: Add helper to alloc GART entries
      drm/amdkfd: Add domain parameter to alloc kernel BO
      drm/amdkfd: Move gfx9.4.3 and gfx 9.5 MQD to HBM

Philipp Stanner (9):
      drm/todo: Add section with task for GPU scheduler
      drm/todo: Add entry for unlocked drm/sched rq readers
      dma-buf/dma-fence: Add dma_fence_test_signaled_flag()
      dma-buf/dma-fence: Add dma_fence_check_and_signal()
      amd/amdkfd: Use dma_fence_check_and_signal()
      drm/xe: Use dma_fence_check_and_signal_locked()
      dma-buf: Don't misuse dma_fence_signal()
      drm/ttm: Use dma_fence_check_and_signal()
      dma-buf/dma-fence: Remove return code of signaling-functions

Pierre-Eric Pelloux-Prayer (7):
      drm/amdgpu: remove direct_submit arg from amdgpu_copy_buffer
      drm/amdgpu: remove the ring param from ttm functions
      drm/amdgpu: introduce amdgpu_ttm_buffer_entity
      drm/amdgpu: add amdgpu_ttm_job_submit helper
      drm/amdgpu: fix error handling in amdgpu_copy_buffer
      drm/amdgpu: pass the entity to use to amdgpu_ttm_map_buffer
      drm/amdgpu: pass the entity to use to ttm public functions

Piotr Pi=C3=B3rkowski (1):
      drm/xe: Move VRAM MM debugfs creation to tile level

Pratap Nirujogi (1):
      drm/amd/amdgpu: Fix SMU warning during isp suspend-resume

Pratik Vishwakarma (4):
      drm/amdgpu: Enable support for PSP 15_0_0
      drm/amd: Enable SMUIO 15_0_0 support
      drm/amd: Enable SMU 15_0_0 firmware headers
      drm/amd: Enable SMU 15_0_0 support

Prike Liang (2):
      drm/amdgpu: validate the flush_gpu_tlb_pasid()
      Revert "drm/amdgpu: don't attach the tlb fence for SI"

Quentin Schulz (3):
      accel/rocket: fix unwinding in error path in rocket_core_init
      accel/rocket: fix unwinding in error path in rocket_probe
      accel/rocket: factor out code with find_core_for_dev in rocket_remove

Raag Jadav (10):
      drm/xe/vf: Update pause/unpause() helpers with VF naming
      drm/xe/guc_submit: Introduce pause/unpause() helpers for PF
      drm/xe/pm: Assert on runtime suspend if VFs are enabled
      drm/xe/gt: Introduce runtime suspend/resume
      drm/xe/gt: Use scope-based forcewake
      drm/xe/guc_ct: Assert on credits mismatch during runtime suspend
      drm/xe/throttle: Skip reason prefix while emitting array
      drm/xe/cri: Enable I2C controller
      drm/xe/i2c: Force polling mode in survivability
      drm/xe/pm: Handle GT resume failure

Randy Dunlap (2):
      drm/amd/display: correct kernel-doc in dml21_wrapper.h
      accel/rocket: rocket_accel.h: fix kernel-doc warnings

Ray Wu (4):
      drm/amd/display: Fix scratch registers offsets for DCN35
      drm/amd/display: Fix scratch registers offsets for DCN351
      drm/amd/display: disable replay when crc source is enabled
      drm/amd/display: Add IPS residency info to debugfs

Relja Vojvodic (1):
      drm/amd/display: Correct DSC padding accounting

Renjun Wang (2):
      dt-bindings: display: simple: Add HannStar HSD156JUW2
      drm/panel: simple: Add HannStar HSD156JUW2

Ren=C3=A9 Rebe (1):
      drm/ast: Swap framebuffer writes on big-endian machines

Riana Tauro (5):
      drm/xe/xe_survivability: Redesign survivability mode
      drm/xe/xe_survivability: Add support for survivability mode v2
      drm/xe/xe_survivability: Remove unused index
      drm/xe/xe_survivability: Use static for survivability info attributes
      drm/xe/xe_survivability: Add index bound check

Richard Chiang (1):
      drm/amd/display: sink EDID data null check

Rob Clark (2):
      drm/msm: Fix x2-85 TPL1_DBG_ECO_CNTL1
      drm/msm: Fix GMEM_BASE for gen8

Rob Herring (Arm) (1):
      dt-bindings: display: panel-simple: Allow "data-mapping" for
"yes-optoelectronics,ytc700tlag-05-201c"

Robin Chen (1):
      drm/amd/display: Remove unused DMUB replay commands

Rodrigo Siqueira (5):
      drm/amdgpu: Expand kernel-doc in amdgpu_ring
      Documentation/gpu: Add new glossary entries from UMR
      Documentation/gpu: Expand generic block information
      Documentation/gpu: Add more information about GC
      Documentation/gpu: Add documentation about ring buffer

Rodrigo Vivi (3):
      Merge drm/drm-next into drm-intel-next
      MAINTAINERS: Update Xe driver maintainers
      Merge drm/drm-next into drm-xe-next

Rosen Penev (1):
      drm/amd/display: shrink struct members

Runrun Liu (1):
      drm/amd/display: fix misspelling of "minimum" in dc_dsc.c

Sai Teja Pottumuttu (1):
      drm/i915/nvls: Add NVL-S display support

Saleemkhan Jamadar (3):
      drm/amdgpu: do not use amdgpu_bo_gpu_offset_no_check individually
      drm/amdgpu/jpeg: Add jpeg 5.3.0 support
      drm/amdgpu/discovery: add vcn and jpeg ip block

Sanjay Yadav (4):
      drm/xe/oa: Fix potential UAF in xe_oa_add_config_ioctl()
      drm/xe/uapi: Add NO_COMPRESSION BO flag and query capability
      drm/buddy: Prevent BUG_ON by validating rounded allocation
      drm/tests/drm_buddy: Add tests for allocations exceeding max_order

Satyanarayana K V P (8):
      drm/xe/sa: Shadow buffer support in the sub-allocator pool
      drm/xe/vf: Shadow buffer management for CCS read/write operations
      drm/xe/vf: Enable VF migration only on supported GuC versions
      drm/xe/vf: Introduce RESFIX start marker support
      drm/xe/vf: Requeue recovery on GuC MIGRATION error during VF
post-migration
      drm/xe/vf: Add debugfs entries to test VF double migration
      drm/xe/vf: Fix queuing of recovery work
      drm/xe/vf: Reset recovery_queued after issuing RESFIX_START

Sebastian Brzezinka (1):
      drm/i915/gt: use designated initializers for intel_gt_debugfs_file

Sebastian Krzyszkowiak (5):
      drm/panel: mantix: Enable DSI LPM
      drm/panel: mantix: Improve power on sequence timings
      drm/panel: mantix: Improve power off sequence
      drm/panel: mantix: Drop bank 9 initialization
      drm/panel: mantix: Don't turn on MIPI peripheral

Shankari Anand (2):
      drivers: gpu: Update ARef imports from sync::aref
      rust: drm: Update AlwaysRefCounted imports to use sync::aref

Shaoyun Liu (5):
      drm/amd/include : Update MES v12 API header
      drm/amd/include : Update MES v12 comments on RESET API
      drm/amd/include : Update MES v12 API header
      drm/amd/amdgpu : Use the MES INV_TLBS API for tlb invalidation on gfx=
12_1
      drm/amd/include : Update MES v12 API header - SUSPEND

Shuicheng Lin (11):
      drm/xe: Prevent BIT() overflow when handling invalid prefetch region
      drm/xe: Remove duplicate DRM_EXEC selection from Kconfig
      drm/xe/guc: Fix resource leak in xe_guc_ct_init_noalloc()
      drm/xe: Fix freq kobject leak on sysfs_create_files failure
      drm/xe: Limit num_syncs to prevent oversized allocations
      drm/xe/oa: Limit num_syncs to prevent oversized allocations
      drm/xe: Unregister drm device on probe error
      drm/xe/query: Fix topology query pointer advance
      drm/xe: Fix kerneldoc for xe_migrate_exec_queue
      drm/xe: Fix kerneldoc for xe_gt_tlb_inval_init_early
      drm/xe: Fix kerneldoc for xe_tlb_inval_job_alloc_dep

Sk Anirban (1):
      drm/i915/selftest: Add throttle reason diagnostics to RPS selftests

Sreekant Somasekharan (1):
      drm/amdkfd: Remove hard=E2=80=91coded GC IP version checks from
kfd_node_by_irq_ids

Srinivasan Shanmugam (12):
      drm/amdgpu/ttm: Pin 4K MMIO_REMAP Singleton BO at Init v2
      drm/amdgpu: Map/Unmap MMIO_REMAP as BAR register window; add TTM
sg helpers; wire dma-buf
      drm/amdgpu/sdma_v7_1: Add missing inst_mask entry in
sdma_v7_1_inst_gfx_resume()
      drm/amd/ras: Reduce stack usage in ras_umc_handle_bad_pages()
      drm/amdgpu/acpi: Reduce amdgpu_acpi_detect stack usage
      drm/amd/ras: Reduce stack usage in amdgpu_virt_ras_get_cper_records()
      drm/amd/display: Fix 64-bit state pointer passed as 32-bit GPINT
response buffer
      drm/amdkfd: Fix signal_eviction_fence() bool return value
      drm/amdgpu: Use explicit VCN instance 0 in SR-IOV init
      drm/amdgpu: Refactor amdgpu_gem_va_ioctl for Handling Last Fence
Update and Timeline Management v4
      drm/amdgpu: Refactor amdgpu_gem_va_ioctl for Handling Last Fence
Update and Timeline Management v7
      drm/amdgpu/userq: Fix fence reference leak on queue teardown v2

Suraj Kandpal (5):
      drm/display/dp_mst: Add protection against 0 vcpi
      drm/i915/cx0: Use the consolidated HDMI tables
      drm/i915/ltphy: Remove state verification for LT PHY fields
      drm/i915/ltphy: Compare only certain fields in state verify function
      drm/i915/ltphy: Provide protection against unsupported modes

Svyatoslav Ryhel (1):
      dt-bindings: display: panel: document Samsung LTL106HL02 MIPI DSI pan=
el

Swaraj Gaikwad (2):
      drm/xe: Fix documentation heading levels in xe_guc_pc.c
      drm/msm: Replace custom dumb_map_offset with generic helper

T.J. Mercier (1):
      dma-buf: Remove DMA-BUF sysfs stats

Taimur Hassan (12):
      drm/amd/display: [FW Promotion] Release 0.1.37.0
      drm/amd/display: Promote DC to 3.2.360
      drm/amd/display: Promote DC to 3.2.361
      drm/amd/display: Promote DC to 3.2.362
      drm/amd/display: [FW Promotion] Release 0.1.40.0
      drm/amd/display: Promote DC to 3.2.363
      drm/amd/display: Promote DC to 3.2.364
      drm/amd/display: [FW Promotion] Release 0.1.42.0
      drm/amd/display: Promote DC to 3.2.365
      drm/amd/display: Promote DC to 3.2.366
      drm/amd/display: [FW Promotion] Release 0.1.44.0
      drm/amd/display: Promote DC to 3.2.367

Tamir Duberstein (2):
      gpu: nova: replace `kernel::c_str!` with C-Strings
      drm: tyr: replace `kernel::c_str!` with C-Strings

Tao Zhou (1):
      drm/amdgpu: fix the calculation of RAS bad page number

Tapani P=C3=A4lli (1):
      drm/xe: Fix NULL pointer dereference in xe_exec_ioctl

Teguh Sobirin (1):
      drm/msm/dpu: Set vsync source irrespective of mdp top support

Thomas Hellstr=C3=B6m (28):
      Merge drm/drm-next into drm-xe-next
      drm/xe/bo: Don't include the CCS metadata in the dma-buf sg-table
      drm/xe: Drop preempt-fences when destroying imported dma-bufs.
      Merge drm/drm-next into drm-xe-next
      drm/xe/svm: Fix a debug printout
      drm/pagemap: Remove some dead code
      drm/pagemap, drm/xe: Ensure that the devmem allocation is idle before=
 use
      drm/pagemap, drm/xe: Add refcounting to struct drm_pagemap
      drm/pagemap: Add a refcounted drm_pagemap backpointer to struct
drm_pagemap_zdd
      drm/pagemap, drm/xe: Manage drm_pagemap provider lifetimes
      drm/pagemap: Add a drm_pagemap cache and shrinker
      drm/xe: Use the drm_pagemap cache and shrinker
      drm/pagemap: Remove the drm_pagemap_create() interface
      drm/pagemap_util: Add a utility to assign an owner to a set of
interconnected gpus
      drm/xe: Use the drm_pagemap_util helper to get a svm pagemap owner
      drm/xe: Pass a drm_pagemap pointer around with the memory advise
attributes
      drm/xe: Use the vma attibute drm_pagemap to select where to migrate
      drm/xe: Simplify madvise_preferred_mem_loc()
      drm/xe/uapi: Extend the madvise functionality to support foreign
pagemap placement for svm
      drm/xe: Support pcie p2p dma as a fast interconnect
      drm/xe/vm: Add a couple of VM debug printouts
      drm/xe/svm: Document how xe keeps drm_pagemap references
      drm/pagemap, drm/xe: Clean up the use of the device-private page owne=
r
      drm/gpusvm: Introduce a function to scan the current migration state
      drm/xe: Use drm_gpusvm_scan_mm()
      drm/pagemap, drm/xe: Support destination migration over interconnect
      drm/pagemap: Support source migration over interconnect
      drm/xe/svm: Serialize migration to device if racing

Thomas Zimmermann (16):
      drm/ast: Move cursor format conversion into helper function
      drm/ast: Support cursor buffers objects in I/O memory
      drm/ast: Wrap cursor framebuffer access in
drm_gem_fb_begin/end_cpu_access()
      drm/amdgpu: Do not implement mode_set_base_atomic callback
      drm/nouveau: Do not implement mode_set_base_atomic callback
      drm/radeon: Do not implement mode_set_base_atomic callback
      drm/fbdev-helper: Remove drm_fb_helper_debug_enter/_leave()
      fbcon: Remove fb_debug_enter/_leave from struct fb_ops
      drm/vblank: Unexport drm_wait_one_vblank()
      drm/tests: shmem: Swap names of export tests
      drm/tests: shmem: Add clean-up action to unpin pages
      drm/tests: shmem: Hold reservation lock around vmap/vunmap
      drm/tests: shmem: Hold reservation lock around madvise
      drm/tests: shmem: Hold reservation lock around purge
      vt: Remove trailing whitespace
      vt: Remove con_debug_enter/_leave from struct consw

Tim Huang (6):
      drm/amdgpu: add support for GC IP version 11.5.4
      drm/amdgpu: add support for SDMA IP version 6.1.4
      drm/amdgpu: add support for NBIO IP version 7.11.4
      drm/amdgpu: add support for IH IP version 6.1.1
      drm/amdgpu: add support for HDP IP version 6.1.1
      drm/amdgpu: add support for MMHUB IP version 3.4.0

Timur Krist=C3=B3f (13):
      drm/amdgpu/uapi: Clarify comment on AMDGPU_VM_PAGE_PRT
      Documentation/gpu: Add PRT, PTE, PDE to amdgpu glossary (v2)
      drm/amd/display: Pass proper DAC encoder ID to VBIOS
      drm/amd/display: Correct color depth for SelectCRTC_Source
      drm/amd/display: Add missing encoder setup to DACnEncoderControl
      drm/amd/display: Don't repeat DAC load detection
      drm/amd/display: Only poll analog connectors
      drm/amd/pm: Fix si_dpm mmCG_THERMAL_INT setting
      drm/amd/pm: Don't clear SI SMC table when setting power limit
      drm/amd/pm: Workaround SI powertune issue on Radeon 430 (v2)
      drm/amd/pm: Return -EOPNOTSUPP when can't read power limit
      drm/amd/pm: Correct comment above power2_cap attributes
      drm/amdgpu: Fix validating flush_gpu_tlb_pasid()

Timur Tabi (12):
      gpu: nova-core: check for overflow to DMATRFBASE1
      gpu: nova-core: add missing newlines to several print strings
      gpu: nova-core: rename Imem to ImemSecure
      gpu: nova-core: add ImemNonSecure section infrastructure
      gpu: nova-core: support header parsing on Turing/GA100
      gpu: nova-core: add support for Turing/GA100 fwsignature
      gpu: nova-core: add NV_PFALCON_FALCON_DMATRFCMD::with_falcon_mem()
      gpu: nova-core: move some functions into the HAL
      gpu: nova-core: Add basic Turing HAL
      gpu: nova-core: add NV_PFALCON_FALCON_ENGINE::reset_engine()
      gpu: nova-core: add Falcon HAL method load_method()
      gpu: nova-core: add FalconUCodeDescV2 support

Tom St Denis (1):
      drm/amd/amdgpu: Port over some missing registers and bits from
GC 10.1 to 10.3 (v2)

Tomasz Lis (2):
      drm/xe: Protect against unset LRC when pausing submissions
      drm/xe/vf: Stop waiting for ring space on VF post migration recovery

Tuo Li (1):
      drm/panel: Fix a possible null-pointer dereference in
jdi_panel_dsi_remove()

Tvrtko Ursulin (10):
      drm/panic: Report invalid or unsupported panic modes
      drm/ttm: Make ttm_bo_init_validate safe against
ttm_operation_ctx re-ordering
      drm/ttm: Resource cannot be NULL in ttm_resource_intersects
      drm/ttm: Tidy ttm_operation_ctx initialization
      drm/ttm: Tidy usage of local variables a little bit
      drm/i915/display: Detect AuxCCS support via display parent interface
      drm/syncobj: Convert syncobj idr to xarray
      drm/xe: Fix ggtt fb alignment
      drm/amdgpu/mes: Remove idr leftovers v2
      drm/amdgpu: Simplify sorting of the bo list

Umesh Nerlige Ramappa (3):
      drm/xe/soc_remapper: Initialize SoC remapper during Xe probe
      drm/xe/soc_remapper: Use SoC remapper helper from VSEC code
      drm/xe/soc_remapper: Add system controller config for SoC remapper

Uwe Kleine-K=C3=B6nig (2):
      host1x: Make remove callback return void
      host1x: Convert to bus methods

Val Packett (4):
      drm/panel-edp: Add AUO B140QAX01.H panel
      dt-bindings: vendor-prefixes: Add AlgolTek
      dt-bindings: display: bridge: simple: document the Algoltek
AG6311 DP-to-HDMI bridge
      drm/bridge: simple: add the Algoltek AG6311 DP-to-HDMI bridge

Venkata Ramana Nayana (1):
      drm/xe/irq: Handle msix vector0 interrupt

Ville Syrj=C3=A4l=C3=A4 (21):
      drm/i915/dram: Use REG_GENMASK() & co. for the SKL+ DIMM regs
      drm/i915/dram: Sort SKL+ DIMM register bits
      drm/i915/dram: Fix ICL DIMM_S decoding
      drm/i915/psr: Reject async flips when selective fetch is enabled
      drm/i915: Use the proper (hw.crtc) for the cursor unpin vblank worker
      drm/i915/psr: Use hw.crtc instead of uapi.crtc
      drm/i915/psr: Use hw.rotation instead of uapi.rotation
      drm/i915: Use hw.active instead of uapi.active in the initial
plane readout
      drm/i915/panic: Get the crtc from the correct place
      drm/i915/panic: Clean up the variables
      drm/i915: Expose the IN_FORMATS_ASYNC blob for all planes
      drm/i915: Eliminate one more frequent drm_format_info()
      drm/i915: Enable DDI A/B AUX interrupts on LNL+
      Revert "drm/i915/dp: change aux_ctl reg read to polling read"
      drm/i915/pc8: Add parent interface for PC8 forcewake tricks
      drm/i915/dmc: Add pipe dmc registers and bits for DC Balance
      drm/i915/vrr: Add functions to read out vmin/vmax stuff
      drm/i915/vblank: Extract vrr_vblank_start()
      drm/i915/vrr: Implement vblank evasion with DC balancing
      drm/i915/dsb: Add pipedmc dc balance enable/disable
      drm/i915/vrr: Pause DC Balancing for DSB commits

Vinay Belgaumkar (2):
      drm/xe: Apply Wa_14020316580 in xe_gt_idle_enable_pg()
      drm/xe/ptl: Disable DCC on PTL

Vinod Govindapillai (5):
      drm/i915/fbc: Apply Wa_15018326506
      drm/i915/display: Use a sub-struct for fbc operations in intel_displa=
y
      drm/i915/xe3p_lpd: Enable display use of system cache for FBC
      drm/i915/fbc: Apply Wa_14025769978
      drm/i915/display: fix the pixel normalization handling for xe3p_lpd

Vivek Das Mohapatra (1):
      drm/amd/display: Initialise backlight level values from hw

Vladimir Yakovlev (1):
      drm/panel: himax-hx83102: change to gpiod_set_value_cansleep

Wang, Sung-huai (2):
      drm/amd/display: Revert "init dispclk from bootup clock for DCN314"
      drm/amd/display: Revert "init dispclk from bootup clock for DCN315"

Wayne Lin (2):
      drm/amd/display: Enable bootcrc on FW side
      drm/amd/display: Remove unnecessary DC FP guard

Weiguang Li (1):
      drm/amd/display: Support DRR granularity

Wenjing Liu (2):
      drm/amd/display: add dc interface for query QoS information
      drm/amd/display: update memory QoS measurement interface

Xiao Kan (1):
      drm: Account property blob allocations to memcg

Xiaogang Chen (4):
      drm/amdgpu: Don't send warning when close drm obj if drm device
has been unplug
      drm/amdkfd: Use huge page size to check split svm range alignment
      drm/amdgpu: Use correct address to setup gart page table for vram acc=
ess
      drm/amdkfd: kfd driver supports hot unplug/replug amdgpu devices

Xiaolei Wang (1):
      drm/v3d: Set DMA segment size to avoid debug warnings

Xin Wang (4):
      drm/xe/pat: Add helper to query compression enable status
      drm/xe: Refactor PAT dump to use shared helpers
      drm/xe: expose PAT software config to debugfs
      drm/xe: Allow compressible surfaces to be 1-way coherent

Yang Wang (11):
      drm/amd/pm: fix wrong pcie parameter on navi1x
      drm/amd/pm: force send pcie parmater on navi1x
      drm/amd/pm: add smu pcie dpm cap & width convert helper
      drm/amd/pm: fix pp_dpm_pcie wrong state issue for smu v14.0.2
      drm/amd/pm: fix pp_dpm_pcie wrong state issue for smu v13.0.7
      drm/amd/pm: fix pp_dpm_pcie wrong state issue for smu v13.0.0
      drm/amd/pm: fix issue of missing '*' on pp_dpm_xxx nodes
      drm/amd/pm: fix smu overdrive data type wrong issue on smu 14.0.2
      drm/amd/pm: fix smu v13 soft clock frequency setting issue
      drm/amd/pm: fix smu v14 soft clock frequency setting issue
      drm/amd/pm: fix race in power state check before mutex lock

YiPeng Chai (7):
      drm/amdgpu: Add virt command to send VF ras command
      drm/amd/ras: sriov supports handling VF ras commands.
      drm/amd/ras: Support sriov uniras to obtain cper data
      drm/amd/ras: Add ras command to retrieve cper data from sriov host
      drm/amd/ras: Support high-frequency querying sriov ras block error co=
unt
      drm/amd/ras: Add sriov ras preprocessing before gpu reset
      drm/amd/ras: Compatible with legacy sriov host

Yo-Jung Leo Lin (AMD) (5):
      drm/amdgpu: parse UMA size-getting/setting bits in ATCS mask
      drm/amdgpu: add helper to read UMA carveout info
      drm/amdgpu: add UMA allocation setting helpers
      drm/amdgpu: add UMA allocation interfaces to sysfs
      Documentation/amdgpu: Add UMA carveout details

YuBiao Wang (1):
      drm/amdgpu: Skip loading SDMA_RS64 in VF

Yuanjie Yang (12):
      dt-bindings: display/msm: qcom, kaanapali-dpu: Add Kaanapali
      dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali DSI PHY
      dt-bindings: display/msm: dsi-controller-main: Add Kaanapali
      dt-bindings: display/msm: qcom, kaanapali-mdss: Add Kaanapali
      drm/msm/mdss: Add support for Kaanapali
      drm/msm/dsi/phy: Add support for Kaanapali
      drm/msm/dsi: Add support for Kaanapali
      drm/msm/dpu: Add interrupt registers for DPU 13.0.0
      drm/msm/dpu: Refactor SSPP to compatible DPU 13.0.0
      drm/msm/dpu: Add Kaanapali SSPP sub-block support
      drm/msm/dpu: Add Kaanapali WB support
      drm/msm/dpu: Add support for Kaanapali DPU

Yury Norov (1):
      drm/amdkfd: simplify svm_range_unmap_from_gpus()

Zbigniew Kempczy=C5=84ski (1):
      drm/xe: Add caching pagetable flag

Zhanjun Dong (8):
      drm/xe/guc: Cleanup GuC log buffer macros and helpers
      drm/xe/uc: Change assertion to error on huc authentication failure
      drm/xe/guc: Add log init config abi definitions
      drm/xe/guc: Add LFD related abi definitions
      drm/xe/guc: Add GuC log init config in LFD format
      drm/xe/guc: Add GuC log event buffer output in LFD format
      drm/xe/guc: Only add GuC crash dump if available
      drm/xe/guc: Add new debugfs entry for lfd format output

Zhongwei (1):
      drm/amd/display: avoid dig reg access timeout on usb4 link training f=
ail

Zhu Lingshan (18):
      amdkfd: enlarge the hashtable of kfd_process
      amdkfd: mark the first kfd_process as the primary one
      amdkfd: find_process_by_mm always return the primary context
      amdkfd: Introduce kfd_create_process_sysfs as a separate function
      amdkfd: destroy kfd secondary contexts through fd close
      amdkfd: process svm ioctl only on the primary kfd process
      amdkfd: process USERPTR allocation only on the primary kfd process
      amdkfd: identify a secondary kfd process by its id
      amdkfd: find kfd_process by filep->private_data in kfd_mmap
      amdkfd: remove DIQ support
      amdkfd: process pointer of a HIQ should be NULL
      amdkfd: remove test_kq
      amdkfd: introduce new helper kfd_lookup_process_by_id
      amdkfd: record kfd context id into kfd process_info
      amdkfd: record kfd context id in amdkfd_fence
      amdkfd: fence handler evict and restore a kfd process by its context =
id
      amdkfd: process debug trap ioctl only on a primary context
      amdkfd: introduce new ioctl AMDKFD_IOC_CREATE_PROCESS

Zishun Yi (1):
      accel/amdxdna: Fix memory leak in amdxdna_ubuf_map

chong li (3):
      drm/amdgpu: reduce the full gpu access time in amdgpu_device_init.
      drm/amdgpu: fix mes packet params issue when flush hdp.
      drm/amdgpu: fix issue when switch NPS1 to NPSX

gaoxiang17 (2):
      dma-buf: add some tracepoints to debug.
      dma-buf: add some tracepoints to debug.

mythilam (1):
      drm/amd/pm: restore SCLK settings after S0ix resume

 .mailmap                                           |     5 +-
 .../ABI/testing/sysfs-driver-intel-xe-hwmon        |   110 +
 .../ABI/testing/sysfs-driver-intel-xe-sriov        |     2 +-
 .../ABI/testing/sysfs-kernel-dmabuf-buffers        |    24 -
 .../bindings/display/bridge/renesas,dsi.yaml       |   120 +-
 .../bindings/display/bridge/simple-bridge.yaml     |     1 +
 .../bindings/display/msm/dsi-controller-main.yaml  |     7 +
 .../bindings/display/msm/dsi-phy-7nm.yaml          |    31 +-
 .../devicetree/bindings/display/msm/gpu.yaml       |    81 +-
 .../bindings/display/msm/qcom,adreno-rgmu.yaml     |   126 +
 .../bindings/display/msm/qcom,kaanapali-mdss.yaml  |   297 +
 .../bindings/display/msm/qcom,qcs8300-mdss.yaml    |   102 +-
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |     1 +
 .../bindings/display/panel/jadard,jd9365da-h3.yaml |     2 +
 .../bindings/display/panel/lg,sw43408.yaml         |    13 +-
 .../bindings/display/panel/panel-simple-dsi.yaml   |     2 +
 .../bindings/display/panel/panel-simple.yaml       |     8 +-
 .../bindings/display/panel/samsung,s6e3fc2x01.yaml |    20 +-
 .../display/rockchip/rockchip,dw-hdmi.yaml         |     1 +
 .../display/rockchip/rockchip,dw-mipi-dsi.yaml     |     2 +
 .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml       |     6 +
 .../bindings/display/rockchip/rockchip-vop.yaml    |     1 +
 .../bindings/display/sitronix,st7571.yaml          |    25 +
 .../bindings/display/sitronix,st7920.yaml          |    58 +
 .../bindings/gpu/arm,mali-valhall-csf.yaml         |    14 +
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml |     2 +
 .../devicetree/bindings/phy/mediatek,hdmi-phy.yaml |    29 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |     2 +
 Documentation/driver-api/dma-buf.rst               |     5 -
 Documentation/gpu/amdgpu/amd_overview_block.svg    |   687 +
 Documentation/gpu/amdgpu/amdgpu-glossary.rst       |    48 +
 Documentation/gpu/amdgpu/apu-asic-info-table.csv   |     3 +
 Documentation/gpu/amdgpu/display/dc-glossary.rst   |     3 -
 Documentation/gpu/amdgpu/driver-core.rst           |    31 +
 Documentation/gpu/amdgpu/driver-misc.rst           |    26 +
 Documentation/gpu/amdgpu/enforce_isolation.svg     |   654 +
 Documentation/gpu/amdgpu/gc/index.rst              |    24 +-
 Documentation/gpu/amdgpu/gfx_pipeline_seq.svg      |   413 +
 Documentation/gpu/amdgpu/index.rst                 |     1 +
 Documentation/gpu/amdgpu/no_enforce_isolation.svg  |   707 +
 Documentation/gpu/amdgpu/process-isolation.rst     |     1 +
 Documentation/gpu/amdgpu/ring-buffer.rst           |    95 +
 Documentation/gpu/amdgpu/ring_buffers.svg          |  1633 +
 Documentation/gpu/amdgpu/userq.rst                 |     2 +
 Documentation/gpu/drm-mm.rst                       |    29 +-
 Documentation/gpu/nova/core/todo.rst               |    59 +-
 Documentation/gpu/todo.rst                         |    61 +
 Documentation/gpu/xe/xe_exec_queue.rst             |    14 +
 Documentation/process/debugging/kgdb.rst           |    28 -
 MAINTAINERS                                        |    33 +-
 drivers/accel/amdxdna/Makefile                     |     1 -
 drivers/accel/amdxdna/aie2_ctx.c                   |    66 +-
 drivers/accel/amdxdna/aie2_error.c                 |    10 +-
 drivers/accel/amdxdna/aie2_message.c               |   128 +-
 drivers/accel/amdxdna/aie2_msg_priv.h              |     8 +-
 drivers/accel/amdxdna/aie2_pci.c                   |    38 +-
 drivers/accel/amdxdna/aie2_pci.h                   |    14 +-
 drivers/accel/amdxdna/aie2_pm.c                    |    20 +-
 drivers/accel/amdxdna/aie2_psp.c                   |    15 +
 drivers/accel/amdxdna/aie2_smu.c                   |    29 +-
 drivers/accel/amdxdna/amdxdna_ctx.h                |     6 +-
 drivers/accel/amdxdna/amdxdna_mailbox.c            |    46 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.c            |    35 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.h            |     3 +-
 drivers/accel/amdxdna/amdxdna_pm.c                 |    22 +-
 drivers/accel/amdxdna/amdxdna_ubuf.c               |    10 +-
 drivers/accel/amdxdna/npu1_regs.c                  |     8 +-
 drivers/accel/amdxdna/npu2_regs.c                  |   115 -
 drivers/accel/amdxdna/npu4_regs.c                  |    12 +-
 drivers/accel/amdxdna/npu5_regs.c                  |     4 +-
 drivers/accel/amdxdna/npu6_regs.c                  |     4 +-
 drivers/accel/ivpu/ivpu_debugfs.c                  |     4 +-
 drivers/accel/ivpu/ivpu_drv.c                      |     4 +-
 drivers/accel/ivpu/ivpu_fw.c                       |    13 +-
 drivers/accel/ivpu/ivpu_fw.h                       |     9 +-
 drivers/accel/ivpu/ivpu_gem.c                      |     2 +-
 drivers/accel/ivpu/ivpu_hw_40xx_reg.h              |     6 +
 drivers/accel/ivpu/ivpu_hw_ip.c                    |    84 +-
 drivers/accel/ivpu/ivpu_hw_ip.h                    |     1 -
 drivers/accel/ivpu/ivpu_mmu_context.c              |    20 +-
 drivers/accel/ivpu/ivpu_mmu_context.h              |     5 +-
 drivers/accel/ivpu/ivpu_pm.c                       |    13 +-
 drivers/accel/ivpu/ivpu_pm.h                       |     1 -
 drivers/accel/rocket/rocket_core.c                 |     7 +-
 drivers/accel/rocket/rocket_drv.c                  |    30 +-
 drivers/crypto/tegra/tegra-se-main.c               |     4 +-
 drivers/dma-buf/Kconfig                            |    17 +-
 drivers/dma-buf/Makefile                           |     1 -
 drivers/dma-buf/dma-buf-sysfs-stats.c              |   202 -
 drivers/dma-buf/dma-buf-sysfs-stats.h              |    35 -
 drivers/dma-buf/dma-buf.c                          |   141 +-
 drivers/dma-buf/dma-fence.c                        |   100 +-
 drivers/dma-buf/dma-heap.c                         |     5 +
 drivers/dma-buf/heaps/cma_heap.c                   |     2 +-
 drivers/dma-buf/heaps/system_heap.c                |     7 +-
 drivers/dma-buf/st-dma-fence.c                     |    55 +-
 drivers/gpu/drm/Kconfig                            |   213 +-
 drivers/gpu/drm/Makefile                           |     3 +-
 drivers/gpu/drm/amd/amdgpu/Makefile                |    27 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   184 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |    73 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |    20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |    27 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c   |    10 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12_1.c   |   387 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |    13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |    77 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h   |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c      |     8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c        |     8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c            |     7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |    34 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c           |     6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c            |    12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |    14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |    12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c   |     5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   516 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   110 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |    40 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |    18 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h       |    30 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c   |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |     5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |     6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c |    11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   148 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |    83 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |    10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |    62 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |    27 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |    48 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |     5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_imu.h            |     4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c             |   315 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ip.h             |   125 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |    37 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h            |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |     3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |     4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |    62 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |   172 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |   111 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    43 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |     2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |    85 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |    10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |    41 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |     4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |    17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.c            |    37 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h            |    16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |    17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_smuio.h          |     3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   347 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |    45 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |    34 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |    12 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          |   212 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h          |    30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c    |    12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |     7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   160 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |    13 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |    22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |     5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c            |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.h            |     3 +
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |     3 +-
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |     3 -
 drivers/gpu/drm/amd/amdgpu/atom.c                  |     2 +-
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c     |     6 +-
 drivers/gpu/drm/amd/amdgpu/cik.c                   |    13 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |    35 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |    35 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |    35 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |    42 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |    94 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |    76 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c             |  4066 ++
 drivers/gpu/drm/amd/amdgpu/gfx_v12_1.h             |    31 +
 drivers/gpu/drm/amd/amdgpu/gfx_v12_1_pkt.h         |   475 +
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |     8 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |    68 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |    82 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   208 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |    39 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c          |   893 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.h          |    31 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |     2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |    27 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |    30 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |   132 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_1.c             |   637 +
 drivers/gpu/drm/amd/amdgpu/gmc_v12_1.h             |    30 +
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |     2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |     2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |     4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |    57 +-
 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c               |    30 +-
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |     1 +
 drivers/gpu/drm/amd/amdgpu/imu_v12_1.c             |   166 +
 drivers/gpu/drm/amd/amdgpu/imu_v12_1.h             |    30 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |     4 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |     4 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |     4 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |    11 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c           |    11 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_3_0.c           |   714 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_3_0.h           |    35 +
 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c         |    68 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |    14 +-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |    16 +-
 drivers/gpu/drm/amd/amdgpu/mes_v12_1.c             |  1968 +
 drivers/gpu/drm/amd/amdgpu/mes_v12_1.h             |    29 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.c            |    34 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v4_2_0.c          |   916 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v4_2_0.h          |    28 +
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |    17 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.h              |     4 +-
 drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.c           |    73 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c            |     1 +
 drivers/gpu/drm/amd/amdgpu/nv.c                    |     5 -
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h            |     2 +
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c             |     2 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |     2 +-
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c             |     6 +-
 drivers/gpu/drm/amd/amdgpu/psp_v15_0.c             |   202 +
 drivers/gpu/drm/amd/amdgpu/psp_v15_0.h             |    30 +
 drivers/gpu/drm/amd/amdgpu/psp_v15_0_8.c           |   342 +
 drivers/gpu/drm/amd/amdgpu/psp_v15_0_8.h           |    30 +
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c              |     6 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |    26 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |    30 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |    23 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |    24 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c             |  1806 +
 drivers/gpu/drm/amd/amdgpu/sdma_v7_1.h             |    31 +
 drivers/gpu/drm/amd/amdgpu/sdma_v7_1_0_pkt_open.h  |  5673 +++
 drivers/gpu/drm/amd/amdgpu/si.c                    |    13 +-
 drivers/gpu/drm/amd/amdgpu/si_dma.c                |     2 +-
 drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c         |     8 +-
 drivers/gpu/drm/amd/amdgpu/smuio_v15_0_0.c         |    50 +
 drivers/gpu/drm/amd/amdgpu/smuio_v15_0_0.h         |    30 +
 drivers/gpu/drm/amd/amdgpu/smuio_v15_0_8.c         |   213 +
 drivers/gpu/drm/amd/amdgpu/smuio_v15_0_8.h         |    30 +
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |     1 -
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |    52 +-
 drivers/gpu/drm/amd/amdgpu/soc24.c                 |     5 -
 drivers/gpu/drm/amd/amdgpu/soc_v1_0.c              |   862 +
 drivers/gpu/drm/amd/amdgpu/soc_v1_0.h              |    37 +
 drivers/gpu/drm/amd/amdgpu/ta_ras_if.h             |     1 +
 drivers/gpu/drm/amd/amdgpu/umc_v6_1.c              |     9 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c              |     8 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c              |     4 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c              |     6 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c              |    16 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |    10 +-
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c              |     6 +-
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c              |     8 +-
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c              |     6 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |     1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |    45 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |     1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |     1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |   134 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c            |    93 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |     5 -
 drivers/gpu/drm/amd/amdkfd/Makefile                |     3 +
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     |  1453 +-
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx12.asm |   980 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |    97 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |     2 +
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c             |    17 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   182 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |    47 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |     2 +
 .../amd/amdkfd/kfd_device_queue_manager_v12_1.c    |    98 +
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |    29 +
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c       |    10 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v12_1.c |   391 +
 drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c      |    65 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |    20 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |    23 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h       |     6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c   |     3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c   |     3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |    25 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12.c   |    19 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12_1.c |   725 +
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |    41 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c    |     3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c |     4 -
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_vi.c |     5 -
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |    41 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   267 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |    54 +-
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c             |    76 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |    67 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |    67 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h          |     6 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   145 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |    19 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |     3 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |    29 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |    73 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |     8 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |     6 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |    22 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c   |     9 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h     |     8 +
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |   133 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.h |     5 -
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |    90 +-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.h |     1 -
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |     2 -
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   648 +-
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |    10 +-
 .../gpu/drm/amd/display/dc/core/dc_link_exports.c  |    23 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |    44 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |    95 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |    54 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |    35 +-
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |     6 +
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |    31 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |    29 +-
 .../gpu/drm/amd/display/dc/dce/dce_link_encoder.c  |    49 +-
 .../gpu/drm/amd/display/dc/dce/dce_link_encoder.h  |     8 +-
 .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c  |     2 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |    13 -
 .../amd/display/dc/dcn201/dcn201_link_encoder.c    |     3 +
 .../drm/amd/display/dc/dcn21/dcn21_link_encoder.c  |     3 +
 .../amd/display/dc/dio/dcn10/dcn10_link_encoder.c  |    43 +
 .../amd/display/dc/dio/dcn10/dcn10_link_encoder.h  |    11 +-
 .../amd/display/dc/dio/dcn20/dcn20_link_encoder.c  |     3 +
 .../display/dc/dio/dcn30/dcn30_dio_link_encoder.c  |     3 +
 .../dc/dio/dcn301/dcn301_dio_link_encoder.c        |     3 +
 .../display/dc/dio/dcn31/dcn31_dio_link_encoder.c  |     3 +
 .../display/dc/dio/dcn32/dcn32_dio_link_encoder.c  |    18 +-
 .../dc/dio/dcn321/dcn321_dio_link_encoder.c        |     3 +
 .../display/dc/dio/dcn35/dcn35_dio_link_encoder.c  |     4 +-
 .../dc/dio/dcn401/dcn401_dio_link_encoder.c        |     3 +
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |     1 +
 drivers/gpu/drm/amd/display/dc/dml2_0/Makefile     |     8 +-
 .../drm/amd/display/dc/dml2_0/dml21/dml21_utils.c  |     3 +-
 .../amd/display/dc/dml2_0/dml21/dml21_wrapper.h    |     7 +-
 .../dml2_0/dml21/inc/dml_top_display_cfg_types.h   |     1 +
 .../display/dc/dml2_0/dml21/inc/dml_top_types.h    |     1 +
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |     5 +-
 .../dml21/src/dml2_core/dml2_core_shared_types.h   |     1 +
 .../gpu/drm/amd/display/dc/dml2_0/dml2_wrapper.c   |   599 +-
 .../gpu/drm/amd/display/dc/dml2_0/dml2_wrapper.h   |     9 +
 .../drm/amd/display/dc/dml2_0/dml2_wrapper_fpu.c   |   604 +
 .../drm/amd/display/dc/dml2_0/dml2_wrapper_fpu.h   |    25 +
 .../gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp.h   |     1 +
 .../gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.h |     9 +
 .../amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c    |    96 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |     2 +-
 .../drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.c |    18 +
 .../drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.h |    10 +-
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c   |    14 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |    58 +-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |    11 +-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.h    |     2 +
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |    18 +-
 .../drm/amd/display/dc/hwss/dcn201/dcn201_hwseq.c  |     1 +
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |     1 +
 .../gpu/drm/amd/display/dc/hwss/dcn30/dcn30_init.c |     1 -
 .../drm/amd/display/dc/hwss/dcn301/dcn301_init.c   |     1 -
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |    17 +-
 .../gpu/drm/amd/display/dc/hwss/dcn31/dcn31_init.c |     1 -
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c  |     2 +-
 .../drm/amd/display/dc/hwss/dcn314/dcn314_init.c   |     1 -
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |     8 +-
 .../gpu/drm/amd/display/dc/hwss/dcn32/dcn32_init.c |     1 -
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |    56 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.h    |     3 +
 .../gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c |     3 +-
 .../drm/amd/display/dc/hwss/dcn351/dcn351_init.c   |     1 -
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |    28 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_init.c   |     1 -
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |    13 +-
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |     8 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |     1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |    28 +-
 .../gpu/drm/amd/display/dc/inc/hw/link_encoder.h   |     6 +
 drivers/gpu/drm/amd/display/dc/inc/link_service.h  |    11 +-
 drivers/gpu/drm/amd/display/dc/link/Makefile       |     2 +-
 .../amd/display/dc/link/accessories/link_dp_cts.c  |     3 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |    79 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   141 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |   310 +-
 .../display/dc/link/protocols/link_dp_capability.c |    54 +-
 .../dc/link/protocols/link_dp_irq_handler.c        |    43 +
 .../dc/link/protocols/link_dp_panel_replay.c       |   353 +
 .../dc/link/protocols/link_dp_panel_replay.h       |    38 +
 .../link_dp_training_fixed_vs_pe_retimer.c         |     2 +-
 .../dc/link/protocols/link_edp_panel_control.c     |   147 +-
 .../dc/link/protocols/link_edp_panel_control.h     |     3 +-
 .../drm/amd/display/dc/link/protocols/link_hpd.c   |   171 +-
 .../drm/amd/display/dc/link/protocols/link_hpd.h   |     1 -
 drivers/gpu/drm/amd/display/dc/os_types.h          |     2 -
 .../display/dc/resource/dce110/dce110_resource.c   |     2 +
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |     8 +-
 .../amd/display/dc/resource/dcn21/dcn21_resource.c |     2 -
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |    11 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.h |     5 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |     2 +-
 .../display/dc/resource/dcn351/dcn351_resource.c   |     2 +-
 .../display/dc/resource/dcn401/dcn401_resource.c   |     2 +-
 .../display/dc/resource/dcn401/dcn401_resource.h   |     3 +
 drivers/gpu/drm/amd/display/dc/sspl/dc_spl.c       |   189 +-
 drivers/gpu/drm/amd/display/dc/sspl/dc_spl.h       |     8 -
 .../gpu/drm/amd/display/dc/sspl/dc_spl_filters.c   |     4 +-
 .../gpu/drm/amd/display/dc/sspl/dc_spl_filters.h   |     4 +-
 .../amd/display/dc/sspl/dc_spl_isharp_filters.c    |    31 +-
 .../amd/display/dc/sspl/dc_spl_isharp_filters.h    |    16 +-
 .../amd/display/dc/sspl/dc_spl_scl_easf_filters.c  |   155 +-
 .../amd/display/dc/sspl/dc_spl_scl_easf_filters.h  |    35 +-
 .../drm/amd/display/dc/sspl/dc_spl_scl_filters.c   |    27 +-
 .../drm/amd/display/dc/sspl/dc_spl_scl_filters.h   |     3 +-
 .../gpu/drm/amd/display/dc/sspl/spl_custom_float.c |    11 +-
 .../gpu/drm/amd/display/dc/sspl/spl_custom_float.h |     4 +-
 .../gpu/drm/amd/display/dc/sspl/spl_fixpt31_32.c   |    78 +-
 .../gpu/drm/amd/display/dc/sspl/spl_fixpt31_32.h   |    56 +-
 drivers/gpu/drm/amd/display/dc/sspl/spl_os_types.h |     9 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |    49 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   194 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.c  |     6 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn30.c  |     6 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |     6 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c  |     6 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |     9 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.c |     6 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |    64 +-
 drivers/gpu/drm/amd/display/include/dpcd_defs.h    |    32 +
 .../drm/amd/display/modules/inc/mod_info_packet.h  |     6 +
 .../amd/display/modules/info_packet/info_packet.c  |   369 +-
 .../drm/amd/display/modules/power/power_helpers.c  |     8 +-
 drivers/gpu/drm/amd/include/amd_acpi.h             |    34 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |     1 +
 .../drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h |    16 +
 .../amd/include/asic_reg/gc/gc_10_3_0_sh_mask.h    |    27 +
 .../drm/amd/include/asic_reg/gc/gc_12_1_0_offset.h | 12418 ++++++
 .../amd/include/asic_reg/gc/gc_12_1_0_sh_mask.h    | 44638 +++++++++++++++=
++++
 .../include/asic_reg/mmhub/mmhub_4_2_0_offset.h    |   802 +
 .../include/asic_reg/mmhub/mmhub_4_2_0_sh_mask.h   |  3013 ++
 .../drm/amd/include/asic_reg/mp/mp_15_0_0_offset.h |   423 +
 .../amd/include/asic_reg/mp/mp_15_0_0_sh_mask.h    |   626 +
 .../drm/amd/include/asic_reg/mp/mp_15_0_8_offset.h |   868 +
 .../amd/include/asic_reg/mp/mp_15_0_8_sh_mask.h    |   616 +
 .../amd/include/asic_reg/oss/osssys_7_1_0_offset.h |   280 +
 .../include/asic_reg/oss/osssys_7_1_0_sh_mask.h    |  1024 +
 .../include/asic_reg/smuio/smuio_15_0_0_offset.h   |   100 +
 .../include/asic_reg/smuio/smuio_15_0_0_sh_mask.h  |   190 +
 .../include/asic_reg/smuio/smuio_15_0_8_offset.h   |   512 +
 .../include/asic_reg/smuio/smuio_15_0_8_sh_mask.h  |  1113 +
 .../amd/include/asic_reg/thm/thm_15_0_0_offset.h   |   157 +
 .../amd/include/asic_reg/thm/thm_15_0_0_sh_mask.h  |   567 +
 .../amd/include/asic_reg/vcn/vcn_5_3_0_offset.h    |  1783 +
 .../amd/include/asic_reg/vcn/vcn_5_3_0_sh_mask.h   |  8262 ++++
 .../amd/include/ivsrcid/gfx/irqsrcs_gfx_12_1_0.h   |   136 +
 .../drm/amd/include/ivsrcid/vmc/irqsrcs_vmc_1_0.h  |     2 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |     5 +-
 drivers/gpu/drm/amd/include/mes_v12_api_def.h      |    69 +-
 drivers/gpu/drm/amd/include/soc15_hw_ip.h          |     2 +
 drivers/gpu/drm/amd/include/soc15_ih_clientid.h    |     1 +
 drivers/gpu/drm/amd/include/soc_v1_0_enum.h        |    38 +
 drivers/gpu/drm/amd/include/soc_v1_0_ih_clientid.h |    52 +
 drivers/gpu/drm/amd/include/v12_structs.h          |  2054 +
 drivers/gpu/drm/amd/pm/Makefile                    |     1 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |    48 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |    83 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |     5 +-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |    23 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   |    65 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |    87 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c    |    29 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |   141 -
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c  |    52 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c  |   211 +-
 drivers/gpu/drm/amd/pm/swsmu/Makefile              |     2 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   111 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   432 +-
 .../pm/swsmu/inc/pmfw_if/smu15_driver_if_v15_0_0.h |   231 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_12_pmfw.h   |     8 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v15_0_0_pmfw.h    |   160 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v15_0_0_ppsmc.h   |   133 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |     6 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h       |    52 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v12_0.h       |     3 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |    51 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0.h       |    54 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v15_0.h       |   245 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |   220 +-
 .../drm/amd/pm/swsmu/smu11/cyan_skillfish_ppt.c    |    37 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |   515 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   342 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |    64 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |   104 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |    84 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c     |    20 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   307 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   124 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   306 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c  |   112 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   |    63 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c   |    67 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   452 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.h   |     4 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |   325 +-
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |    49 +-
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |   101 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   |    64 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |   331 +-
 drivers/gpu/drm/amd/pm/swsmu/smu15/Makefile        |    30 +
 drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0.c     |  1846 +
 .../gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_0_ppt.c   |  1361 +
 .../gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_0_ppt.h   |    28 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   913 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |    38 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h        |     4 +-
 drivers/gpu/drm/amd/ras/ras_mgr/Makefile           |     1 +
 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_cmd.c   |     5 +
 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.c   |    60 +-
 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.h   |     3 +
 .../gpu/drm/amd/ras/ras_mgr/amdgpu_virt_ras_cmd.c  |   469 +
 .../gpu/drm/amd/ras/ras_mgr/amdgpu_virt_ras_cmd.h  |    57 +
 drivers/gpu/drm/amd/ras/rascore/ras.h              |     2 +
 drivers/gpu/drm/amd/ras/rascore/ras_cmd.h          |    33 +
 drivers/gpu/drm/amd/ras/rascore/ras_core.c         |    23 +
 drivers/gpu/drm/amd/ras/rascore/ras_psp.c          |     1 +
 drivers/gpu/drm/amd/ras/rascore/ras_psp.h          |     1 +
 drivers/gpu/drm/amd/ras/rascore/ras_ta_if.h        |     1 +
 drivers/gpu/drm/amd/ras/rascore/ras_umc.c          |    63 +-
 drivers/gpu/drm/amd/ras/rascore/ras_umc.h          |     3 +
 drivers/gpu/drm/ast/ast_cursor.c                   |    94 +-
 drivers/gpu/drm/ast/ast_mode.c                     |    11 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c     |    32 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |    40 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h       |     1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c   |    50 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c    |    98 +-
 drivers/gpu/drm/bridge/Kconfig                     |     7 +
 drivers/gpu/drm/bridge/Makefile                    |     1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   166 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |     2 +-
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c       |    15 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c           |    15 +-
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |     9 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    |     9 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       |    66 +-
 .../{rockchip/inno_hdmi.c =3D> bridge/inno-hdmi.c}   |   525 +-
 drivers/gpu/drm/bridge/ite-it6263.c                |    87 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |     7 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |    31 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |   145 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   125 +-
 drivers/gpu/drm/bridge/samsung-dsim.c              |    37 +-
 drivers/gpu/drm/bridge/sii902x.c                   |     7 +-
 drivers/gpu/drm/bridge/simple-bridge.c             |    20 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |   146 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |     7 +-
 drivers/gpu/drm/bridge/thc63lvd1024.c              |     7 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |    86 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |    27 +-
 drivers/gpu/drm/bridge/ti-tpd12s015.c              |     8 +-
 .../xfails/msm-sc7180-trogdor-kingoftown-fails.txt |     4 +
 .../msm-sc7180-trogdor-lazor-limozeen-fails.txt    |     4 +
 drivers/gpu/drm/clients/drm_log.c                  |     2 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     |   193 +-
 drivers/gpu/drm/display/drm_dp_helper.c            |   103 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |     3 +-
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |   114 +-
 drivers/gpu/drm/drm_atomic.c                       |    33 +
 drivers/gpu/drm/drm_atomic_helper.c                |     1 +
 drivers/gpu/drm/drm_atomic_uapi.c                  |    32 +-
 drivers/gpu/drm/drm_bridge.c                       |   134 +-
 drivers/gpu/drm/drm_buddy.c                        |    10 +
 drivers/gpu/drm/drm_connector.c                    |     6 +
 drivers/gpu/drm/drm_debugfs.c                      |     7 +
 drivers/gpu/drm/drm_draw.c                         |    29 +
 drivers/gpu/drm/drm_draw_internal.h                |     2 +
 drivers/gpu/drm/drm_fb_helper.c                    |   108 -
 drivers/gpu/drm/drm_gem.c                          |   205 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |   146 +-
 drivers/gpu/drm/drm_gpusvm.c                       |   127 +
 drivers/gpu/drm/drm_gpuvm.c                        |    26 +-
 drivers/gpu/drm/drm_mode_object.c                  |    25 +
 drivers/gpu/drm/drm_pagemap.c                      |   564 +-
 drivers/gpu/drm/drm_pagemap_util.c                 |   568 +
 drivers/gpu/drm/drm_panic.c                        |   104 +-
 drivers/gpu/drm/drm_plane.c                        |     4 +-
 drivers/gpu/drm/drm_property.c                     |    13 +-
 drivers/gpu/drm/drm_syncobj.c                      |    65 +-
 drivers/gpu/drm/drm_vblank.c                       |    52 +-
 drivers/gpu/drm/etnaviv/Makefile                   |     1 +
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c           |    75 +-
 drivers/gpu/drm/etnaviv/etnaviv_buffer.h           |    99 +
 drivers/gpu/drm/etnaviv/etnaviv_drv.c              |     3 +
 drivers/gpu/drm/etnaviv/etnaviv_drv.h              |     3 +
 drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c       |   224 +
 drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h       |    21 +
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c              |    11 +
 drivers/gpu/drm/etnaviv/state_3d.xml.h             |    95 +
 drivers/gpu/drm/exynos/exynos_drm_drv.h            |     1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c           |    74 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c               |     4 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h       |     4 +
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h     |     2 +
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c         |    38 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h         |     8 +
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h        |     3 +
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c     |    71 +-
 drivers/gpu/drm/hyperv/Kconfig                     |    14 +
 drivers/gpu/drm/i915/Makefile                      |    29 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |     5 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |     2 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c          |     9 +-
 drivers/gpu/drm/i915/display/i9xx_wm.c             |    22 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |     4 +-
 drivers/gpu/drm/i915/display/intel_alpm.c          |     6 +-
 drivers/gpu/drm/i915/display/intel_alpm.h          |     4 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |     6 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |    76 +-
 drivers/gpu/drm/i915/display/intel_bios.h          |     2 +
 drivers/gpu/drm/i915/display/intel_bo.c            |     6 +
 drivers/gpu/drm/i915/display/intel_bo.h            |     1 +
 drivers/gpu/drm/i915/display/intel_bw.c            |    24 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |    73 +-
 drivers/gpu/drm/i915/display/intel_cmtg.c          |     3 +-
 drivers/gpu/drm/i915/display/intel_colorop.c       |     2 +
 drivers/gpu/drm/i915/display/intel_colorop.h       |     4 +-
 drivers/gpu/drm/i915/display/intel_connector.c     |    16 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |     6 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          |    31 +-
 drivers/gpu/drm/i915/display/intel_crtc.h          |     2 +-
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |     8 +
 drivers/gpu/drm/i915/display/intel_cursor.c        |     5 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |  1094 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.h       |    31 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h  |     4 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |   116 +-
 drivers/gpu/drm/i915/display/intel_display.c       |   148 +-
 drivers/gpu/drm/i915/display/intel_display.h       |     1 +
 drivers/gpu/drm/i915/display/intel_display_core.h  |    18 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |     2 +-
 .../gpu/drm/i915/display/intel_display_device.c    |     5 +
 .../gpu/drm/i915/display/intel_display_device.h    |    28 +-
 .../gpu/drm/i915/display/intel_display_driver.c    |    22 +-
 drivers/gpu/drm/i915/display/intel_display_irq.c   |   203 +-
 drivers/gpu/drm/i915/display/intel_display_irq.h   |     2 +
 .../gpu/drm/i915/display/intel_display_params.h    |     2 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |    51 +-
 drivers/gpu/drm/i915/display/intel_display_power.h |    48 +-
 .../drm/i915/display/intel_display_power_well.c    |    64 +-
 .../gpu/drm/i915/display/intel_display_reg_defs.h  |    15 +-
 drivers/gpu/drm/i915/display/intel_display_regs.h  |    23 +-
 drivers/gpu/drm/i915/display/intel_display_reset.c |     5 +-
 drivers/gpu/drm/i915/display/intel_display_rps.c   |    31 +-
 drivers/gpu/drm/i915/display/intel_display_rps.h   |    21 -
 drivers/gpu/drm/i915/display/intel_display_types.h |    64 +-
 drivers/gpu/drm/i915/display/intel_display_utils.h |     4 -
 drivers/gpu/drm/i915/display/intel_display_wa.c    |    10 +-
 drivers/gpu/drm/i915/display/intel_display_wa.h    |    10 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |    27 +-
 drivers/gpu/drm/i915/display/intel_dmc.h           |     5 +
 drivers/gpu/drm/i915/display/intel_dmc_regs.h      |    60 +
 drivers/gpu/drm/i915/display/intel_dp.c            |   723 +-
 drivers/gpu/drm/i915/display/intel_dp.h            |    26 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |    16 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |     4 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   110 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |    24 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |   336 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |    11 +-
 drivers/gpu/drm/i915/{soc =3D> display}/intel_dram.c |   421 +-
 drivers/gpu/drm/i915/{soc =3D> display}/intel_dram.h |    12 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           |    73 +-
 drivers/gpu/drm/i915/display/intel_dsb.h           |     4 +-
 drivers/gpu/drm/i915/display/intel_dsb_buffer.c    |    43 +-
 drivers/gpu/drm/i915/display/intel_dsb_buffer.h    |    17 +-
 drivers/gpu/drm/i915/display/intel_dsi.h           |     7 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |     6 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |   303 +-
 drivers/gpu/drm/i915/display/intel_fbc.h           |     6 +-
 drivers/gpu/drm/i915/display/intel_fbc_regs.h      |    12 +
 drivers/gpu/drm/i915/display/intel_fifo_underrun.c |   109 +
 drivers/gpu/drm/i915/display/intel_gmbus.c         |    10 +-
 drivers/gpu/drm/i915/display/intel_gvt_api.c       |    43 +
 drivers/gpu/drm/i915/display/intel_gvt_api.h       |    21 +
 drivers/gpu/drm/i915/display/intel_hdcp.c          |     4 +-
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.h      |    22 -
 .../gpu/drm/i915/display/intel_hdcp_gsc_message.c  |    78 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |     4 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c       |     8 +-
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |     5 +-
 drivers/gpu/drm/i915/display/intel_initial_plane.c |   193 +
 ...intel_plane_initial.h =3D> intel_initial_plane.h} |     6 +-
 drivers/gpu/drm/i915/display/intel_lpe_audio.c     |     1 -
 drivers/gpu/drm/i915/display/intel_lt_phy.c        |    72 +-
 drivers/gpu/drm/i915/display/intel_lt_phy.h        |     6 +-
 drivers/gpu/drm/i915/display/intel_lt_phy_regs.h   |     4 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |     2 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |     2 +-
 .../gpu/drm/i915/display/intel_modeset_verify.c    |     1 -
 drivers/gpu/drm/i915/display/intel_panic.c         |    27 -
 drivers/gpu/drm/i915/display/intel_panic.h         |    14 -
 drivers/gpu/drm/i915/display/intel_parent.c        |   214 +
 drivers/gpu/drm/i915/display/intel_parent.h        |    70 +
 drivers/gpu/drm/i915/display/intel_pipe_crc.c      |     8 +-
 drivers/gpu/drm/i915/display/intel_plane.c         |    96 +-
 drivers/gpu/drm/i915/display/intel_plane.h         |     4 +-
 drivers/gpu/drm/i915/display/intel_plane_initial.c |   440 -
 drivers/gpu/drm/i915/display/intel_pps.c           |    63 +-
 drivers/gpu/drm/i915/display/intel_pps.h           |    14 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |   324 +-
 drivers/gpu/drm/i915/display/intel_psr.h           |     5 +-
 drivers/gpu/drm/i915/{soc =3D> display}/intel_rom.c  |     8 +-
 drivers/gpu/drm/i915/{soc =3D> display}/intel_rom.h  |     0
 drivers/gpu/drm/i915/display/intel_sprite.c        |     9 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |    40 +-
 drivers/gpu/drm/i915/display/intel_vblank.c        |    46 +-
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |     3 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          |    37 +-
 drivers/gpu/drm/i915/display/intel_vga.c           |    44 +-
 drivers/gpu/drm/i915/display/intel_vrr.c           |   281 +-
 drivers/gpu/drm/i915/display/intel_vrr.h           |    10 +
 drivers/gpu/drm/i915/display/intel_vrr_regs.h      |    68 +
 drivers/gpu/drm/i915/display/skl_universal_plane.c |    55 +-
 drivers/gpu/drm/i915/display/skl_watermark.c       |     8 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |     2 +-
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c        |     2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |    10 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |    58 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |    52 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h         |    21 +-
 drivers/gpu/drm/i915/gem/i915_gemfs.c              |    71 -
 drivers/gpu/drm/i915/gem/i915_gemfs.h              |    14 -
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    |    15 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |     4 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 |     9 +-
 drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c     |     4 +-
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c         |     4 +-
 drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.c |     2 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |    15 +-
 drivers/gpu/drm/i915/gt/intel_gt_print.h           |     5 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |     4 -
 drivers/gpu/drm/i915/gt/intel_rps.c                |    40 +-
 drivers/gpu/drm/i915/gt/intel_rps.h                |     2 +
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c       |     4 +-
 drivers/gpu/drm/i915/gt/intel_wopcm.c              |     3 -
 drivers/gpu/drm/i915/gt/selftest_rps.c             |    34 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.c  |     2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          |     8 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c     |    13 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c |     8 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             |     4 -
 drivers/gpu/drm/i915/gt/uc/intel_huc_debugfs.c     |     2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |    17 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c      |     2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |    64 +-
 drivers/gpu/drm/i915/gvt/aperture_gm.c             |     5 +-
 drivers/gpu/drm/i915/gvt/cfg_space.c               |     2 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |    26 +-
 drivers/gpu/drm/i915/gvt/debugfs.c                 |     4 +-
 drivers/gpu/drm/i915/gvt/display.c                 |    23 +-
 drivers/gpu/drm/i915/gvt/display.h                 |     2 +-
 drivers/gpu/drm/i915/gvt/display_helpers.h         |    37 +
 drivers/gpu/drm/i915/gvt/dmabuf.c                  |     6 +-
 drivers/gpu/drm/i915/gvt/dmabuf.h                  |     7 +-
 drivers/gpu/drm/i915/gvt/edid.c                    |     1 +
 drivers/gpu/drm/i915/gvt/execlist.c                |     2 +-
 drivers/gpu/drm/i915/gvt/fb_decoder.c              |    14 +-
 drivers/gpu/drm/i915/gvt/fb_decoder.h              |     2 -
 drivers/gpu/drm/i915/gvt/firmware.c                |     4 +-
 drivers/gpu/drm/i915/gvt/gtt.c                     |     9 +-
 drivers/gpu/drm/i915/gvt/gvt.h                     |    26 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |    21 +-
 drivers/gpu/drm/i915/gvt/interrupt.c               |     5 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c                   |    24 +-
 drivers/gpu/drm/i915/gvt/mmio.c                    |    13 +-
 drivers/gpu/drm/i915/gvt/mmio_context.h            |     5 -
 drivers/gpu/drm/i915/gvt/opregion.c                |     3 +-
 drivers/gpu/drm/i915/gvt/page_track.c              |     3 +-
 drivers/gpu/drm/i915/gvt/sched_policy.c            |     3 +-
 drivers/gpu/drm/i915/gvt/scheduler.c               |     8 +-
 drivers/gpu/drm/i915/gvt/trace.h                   |     2 +-
 drivers/gpu/drm/i915/gvt/trace_points.c            |     2 +
 drivers/gpu/drm/i915/gvt/vgpu.c                    |     6 +-
 drivers/gpu/drm/i915/i915_config.c                 |     3 +-
 drivers/gpu/drm/i915/i915_config.h                 |    10 +-
 drivers/gpu/drm/i915/i915_display_pc8.c            |    31 +
 drivers/gpu/drm/i915/i915_display_pc8.h            |     9 +
 drivers/gpu/drm/i915/i915_driver.c                 |    77 +-
 drivers/gpu/drm/i915/i915_drv.h                    |     8 -
 drivers/gpu/drm/i915/i915_edram.c                  |    44 +
 drivers/gpu/drm/i915/i915_edram.h                  |    11 +
 drivers/gpu/drm/i915/i915_freq.c                   |   111 +
 drivers/gpu/drm/i915/i915_freq.h                   |    13 +
 drivers/gpu/drm/i915/i915_gem.c                    |     4 +-
 .../gpu/drm/i915/{soc/intel_gmch.c =3D> i915_gmch.c} |    61 +-
 drivers/gpu/drm/i915/i915_gmch.h                   |    13 +
 .../{display/intel_hdcp_gsc.c =3D> i915_hdcp_gsc.c}  |    22 +-
 drivers/gpu/drm/i915/i915_hdcp_gsc.h               |     9 +
 drivers/gpu/drm/i915/i915_initial_plane.c          |   290 +
 drivers/gpu/drm/i915/i915_initial_plane.h          |     9 +
 drivers/gpu/drm/i915/i915_irq.c                    |    16 +
 drivers/gpu/drm/i915/i915_irq.h                    |     2 +
 drivers/gpu/drm/i915/i915_panic.c                  |    35 +
 drivers/gpu/drm/i915/i915_panic.h                  |     9 +
 drivers/gpu/drm/i915/i915_params.c                 |     5 -
 drivers/gpu/drm/i915/i915_params.h                 |     1 -
 drivers/gpu/drm/i915/i915_pci.c                    |     6 +-
 drivers/gpu/drm/i915/i915_request.c                |     3 +-
 drivers/gpu/drm/i915/i915_utils.c                  |    30 +-
 drivers/gpu/drm/i915/i915_utils.h                  |    26 +-
 drivers/gpu/drm/i915/intel_clock_gating.c          |    10 +-
 drivers/gpu/drm/i915/intel_clock_gating.h          |     6 +-
 drivers/gpu/drm/i915/intel_gvt.c                   |    16 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |     4 +-
 drivers/gpu/drm/i915/intel_mchbar_regs.h           |    68 +-
 drivers/gpu/drm/i915/intel_uncore.c                |     4 +-
 drivers/gpu/drm/i915/intel_wakeref.c               |     2 +-
 drivers/gpu/drm/i915/intel_wakeref.h               |    14 +-
 drivers/gpu/drm/i915/soc/intel_gmch.h              |    20 -
 drivers/gpu/drm/i915/vlv_suspend.c                 |     2 +-
 drivers/gpu/drm/imagination/Kconfig                |    12 +
 drivers/gpu/drm/imagination/Makefile               |     3 +-
 drivers/gpu/drm/imagination/pvr_debugfs.c          |     2 -
 drivers/gpu/drm/imagination/pvr_device.c           |   200 +-
 drivers/gpu/drm/imagination/pvr_device.h           |    24 +-
 drivers/gpu/drm/imagination/pvr_fw_trace.c         |   125 +-
 drivers/gpu/drm/imagination/pvr_fw_trace.h         |     3 -
 drivers/gpu/drm/imagination/pvr_params.c           |   147 -
 drivers/gpu/drm/imagination/pvr_params.h           |    72 -
 drivers/gpu/drm/imagination/pvr_test.c             |    73 +
 drivers/gpu/drm/imagination/pvr_vm.c               |     2 +-
 drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c            |     7 +-
 drivers/gpu/drm/mediatek/mtk_crtc.c                |    24 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |    57 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |     4 +
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |     4 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c         |    12 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h         |     1 -
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c             |   116 +-
 drivers/gpu/drm/meson/meson_dw_hdmi.c              |     6 +-
 drivers/gpu/drm/meson/meson_encoder_cvbs.c         |     7 +-
 drivers/gpu/drm/meson/meson_encoder_dsi.c          |     7 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         |    10 +-
 drivers/gpu/drm/meson/meson_venc.c                 |     4 +-
 drivers/gpu/drm/msm/Makefile                       |     1 +
 drivers/gpu/drm/msm/adreno/a2xx_catalog.c          |    12 +
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |     5 +-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |     4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |    14 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              |     4 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |     3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h |   492 +
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |     5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |     5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |     5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |    14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |    86 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |    18 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |     7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        |   178 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |    45 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |    19 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |     3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |    54 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h        |    26 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |    89 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |    49 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |     3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   180 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |    56 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c    |   321 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |     7 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c        |    18 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h        |    10 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |    17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |     1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |    72 +-
 drivers/gpu/drm/msm/disp/dpu1/msm_media_info.h     |  1155 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           |   314 -
 drivers/gpu/drm/msm/disp/mdp_format.c              |   772 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |    80 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |     7 +-
 drivers/gpu/drm/msm/dp/dp_drm.h                    |     3 +-
 drivers/gpu/drm/msm/dp/dp_link.h                   |     3 +
 drivers/gpu/drm/msm/dp/dp_panel.c                  |    93 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |    13 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |     1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |     2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |     1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |     7 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |    23 +
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |   195 +-
 drivers/gpu/drm/msm/msm_drv.c                      |    24 +-
 drivers/gpu/drm/msm/msm_gem.c                      |    49 -
 drivers/gpu/drm/msm/msm_gem.h                      |     5 +-
 drivers/gpu/drm/msm/msm_gem_vma.c                  |    10 +-
 drivers/gpu/drm/msm/msm_mdss.c                     |    12 +-
 drivers/gpu/drm/nouveau/dispnv04/crtc.c            |    24 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h              |     4 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c             |     2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c      |    82 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h      |    16 +-
 drivers/gpu/drm/nova/driver.rs                     |    18 +-
 drivers/gpu/drm/nova/gem.rs                        |     6 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c                |     1 +
 drivers/gpu/drm/panel/Kconfig                      |    13 +
 drivers/gpu/drm/panel/Makefile                     |     1 +
 drivers/gpu/drm/panel/panel-edp.c                  |    10 +
 drivers/gpu/drm/panel/panel-himax-hx83102.c        |    12 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c      |   143 +-
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c   |   281 +-
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c      |     4 +-
 drivers/gpu/drm/panel/panel-lg-sw43408.c           |    64 +-
 drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c   |    35 +-
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c   |   175 +-
 drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c   |   179 +
 drivers/gpu/drm/panel/panel-simple.c               |    57 +
 drivers/gpu/drm/panfrost/panfrost_device.c         |     3 +
 drivers/gpu/drm/panfrost/panfrost_device.h         |     1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c            |   112 +-
 drivers/gpu/drm/panfrost/panfrost_drv.h            |     9 +
 drivers/gpu/drm/panfrost/panfrost_gem.c            |   257 +
 drivers/gpu/drm/panfrost/panfrost_gem.h            |    12 +
 drivers/gpu/drm/panfrost/panfrost_gpu.c            |    26 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c            |    40 +-
 drivers/gpu/drm/panfrost/panfrost_regs.h           |    10 +-
 drivers/gpu/drm/panthor/panthor_device.c           |    13 +-
 drivers/gpu/drm/panthor/panthor_drv.c              |    89 +-
 drivers/gpu/drm/panthor/panthor_drv.h              |     9 +
 drivers/gpu/drm/panthor/panthor_fw.c               |     8 +-
 drivers/gpu/drm/panthor/panthor_gem.c              |   258 +-
 drivers/gpu/drm/panthor/panthor_gem.h              |     8 +
 drivers/gpu/drm/panthor/panthor_gpu.c              |    21 +-
 drivers/gpu/drm/panthor/panthor_hw.c               |    36 +-
 drivers/gpu/drm/panthor/panthor_mmu.c              |   406 +-
 drivers/gpu/drm/panthor/panthor_sched.c            |   270 +-
 drivers/gpu/drm/panthor/panthor_sched.h            |     1 +
 drivers/gpu/drm/pl111/pl111_display.c              |     4 +-
 drivers/gpu/drm/pl111/pl111_drv.c                  |    29 +-
 drivers/gpu/drm/pl111/pl111_nomadik.c              |     5 +-
 drivers/gpu/drm/pl111/pl111_nomadik.h              |     4 +-
 drivers/gpu/drm/pl111/pl111_versatile.c            |    53 +-
 drivers/gpu/drm/pl111/pl111_versatile.h            |     2 +-
 drivers/gpu/drm/radeon/atombios_crtc.c             |    74 +-
 drivers/gpu/drm/radeon/evergreen.c                 |   112 +-
 drivers/gpu/drm/radeon/radeon_display.c            |    66 +-
 drivers/gpu/drm/radeon/radeon_gem.c                |     6 +-
 drivers/gpu/drm/radeon/radeon_i2c.c                |    15 +-
 drivers/gpu/drm/radeon/radeon_legacy_crtc.c        |    23 +-
 drivers/gpu/drm/radeon/radeon_mode.h               |    10 +-
 drivers/gpu/drm/radeon/radeon_vce.c                |     5 +-
 drivers/gpu/drm/radeon/uvd_v1_0.c                  |    26 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c        |    10 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c     |   461 +
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h    |    34 +
 drivers/gpu/drm/rockchip/Kconfig                   |     5 +-
 drivers/gpu/drm/rockchip/Makefile                  |     2 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |    20 +
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |    16 +
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c     |    17 +-
 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c      |   189 +
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |    47 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |     2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |   163 +-
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |    57 +
 drivers/gpu/drm/rockchip/rockchip_vop_reg.h        |    14 +
 drivers/gpu/drm/scheduler/sched_main.c             |    40 +-
 drivers/gpu/drm/sitronix/Kconfig                   |    48 +-
 drivers/gpu/drm/sitronix/Makefile                  |     3 +
 drivers/gpu/drm/sitronix/st7571-i2c.c              |  1003 +-
 drivers/gpu/drm/sitronix/st7571-spi.c              |    76 +
 drivers/gpu/drm/sitronix/st7571.c                  |   918 +
 drivers/gpu/drm/sitronix/st7571.h                  |    91 +
 drivers/gpu/drm/sitronix/st7920.c                  |   867 +
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |    42 +-
 drivers/gpu/drm/tegra/drm.c                        |     4 +-
 drivers/gpu/drm/tegra/dsi.c                        |     6 +-
 drivers/gpu/drm/tests/drm_buddy_test.c             |    35 +
 drivers/gpu/drm/tests/drm_client_modeset_test.c    |     3 +
 drivers/gpu/drm/tests/drm_connector_test.c         |    19 +
 drivers/gpu/drm/tests/drm_gem_shmem_test.c         |    30 +-
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |   667 +
 drivers/gpu/drm/tests/drm_kunit_edid.h             |   119 +
 drivers/gpu/drm/tests/drm_panic_test.c             |   221 +
 drivers/gpu/drm/tiny/arcpgu.c                      |     5 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c   |     2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |    64 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |    57 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |    12 +-
 drivers/gpu/drm/ttm/ttm_device.c                   |     5 +-
 drivers/gpu/drm/ttm/ttm_pool.c                     |    26 +-
 drivers/gpu/drm/ttm/ttm_resource.c                 |    14 +-
 drivers/gpu/drm/ttm/ttm_tt.c                       |     2 +-
 drivers/gpu/drm/tyr/driver.rs                      |    55 +-
 drivers/gpu/drm/tyr/gpu.rs                         |    68 +-
 drivers/gpu/drm/v3d/Makefile                       |     3 +-
 drivers/gpu/drm/v3d/v3d_bo.c                       |    14 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |    10 +-
 drivers/gpu/drm/v3d/v3d_drv.h                      |    11 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      |    37 +-
 drivers/gpu/drm/v3d/v3d_gemfs.c                    |    62 -
 drivers/gpu/drm/v3d/v3d_irq.c                      |     8 +-
 drivers/gpu/drm/v3d/v3d_mmu.c                      |     6 +-
 drivers/gpu/drm/v3d/v3d_sched.c                    |     6 +-
 drivers/gpu/drm/v3d/v3d_submit.c                   |   140 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   105 +-
 drivers/gpu/drm/vgem/Kconfig                       |     9 +
 drivers/gpu/drm/vkms/vkms_composer.c               |     1 +
 drivers/gpu/drm/vkms/vkms_drv.c                    |     1 +
 drivers/gpu/drm/xe/Makefile                        |    32 +-
 drivers/gpu/drm/xe/abi/guc_actions_abi.h           |     6 +
 drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h     |    67 +-
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h              |    73 +
 drivers/gpu/drm/xe/abi/guc_lfd_abi.h               |   170 +
 drivers/gpu/drm/xe/abi/guc_lic_abi.h               |    77 +
 drivers/gpu/drm/xe/abi/guc_log_abi.h               |    42 +-
 drivers/gpu/drm/xe/abi/guc_scheduler_abi.h         |    57 +
 .../xe/compat-i915-headers/gem/i915_gem_object.h   |    13 -
 .../xe/compat-i915-headers/gem/i915_gem_stolen.h   |    40 -
 .../drm/xe/compat-i915-headers/gt/intel_gt_types.h |    11 -
 .../gpu/drm/xe/compat-i915-headers/i915_active.h   |    22 -
 .../drm/xe/compat-i915-headers/i915_active_types.h |    13 -
 .../gpu/drm/xe/compat-i915-headers/i915_config.h   |     5 +-
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |    37 -
 drivers/gpu/drm/xe/compat-i915-headers/i915_irq.h  |     6 -
 .../gpu/drm/xe/compat-i915-headers/i915_utils.h    |    13 -
 drivers/gpu/drm/xe/compat-i915-headers/i915_vgpu.h |    18 -
 drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h  |     4 +-
 .../gpu/drm/xe/compat-i915-headers/intel_uncore.h  |    11 +-
 .../gpu/drm/xe/compat-i915-headers/intel_wakeref.h |    10 -
 .../gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h |    29 -
 .../drm/xe/compat-i915-headers/soc/intel_dram.h    |     6 -
 .../drm/xe/compat-i915-headers/soc/intel_gmch.h    |     6 -
 .../gpu/drm/xe/compat-i915-headers/soc/intel_rom.h |     6 -
 drivers/gpu/drm/xe/display/ext/i915_irq.c          |    85 -
 drivers/gpu/drm/xe/display/intel_bo.c              |     8 +-
 drivers/gpu/drm/xe/display/xe_display.c            |    30 +-
 drivers/gpu/drm/xe/display/xe_display_misc.c       |    16 -
 drivers/gpu/drm/xe/display/xe_display_rpm.c        |     3 +
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c         |    49 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c             |   113 +-
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c           |    60 +-
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.h           |     9 +
 drivers/gpu/drm/xe/display/xe_initial_plane.c      |   189 +
 drivers/gpu/drm/xe/display/xe_initial_plane.h      |     9 +
 drivers/gpu/drm/xe/display/xe_panic.c              |    16 +-
 drivers/gpu/drm/xe/display/xe_panic.h              |     9 +
 drivers/gpu/drm/xe/display/xe_plane_initial.c      |   319 -
 drivers/gpu/drm/xe/display/xe_stolen.c             |    64 +-
 drivers/gpu/drm/xe/display/xe_stolen.h             |     9 +
 drivers/gpu/drm/xe/instructions/xe_gpu_commands.h  |     1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h               |     9 +
 drivers/gpu/drm/xe/regs/xe_gtt_defs.h              |     1 +
 drivers/gpu/drm/xe/regs/xe_guc_regs.h              |     3 +
 drivers/gpu/drm/xe/regs/xe_irq_regs.h              |     1 +
 drivers/gpu/drm/xe/regs/xe_mert_regs.h             |    23 +
 drivers/gpu/drm/xe/regs/xe_oa_regs.h               |    17 +
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h            |     3 +
 drivers/gpu/drm/xe/regs/xe_pmt.h                   |     3 -
 drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h     |    14 +
 drivers/gpu/drm/xe/tests/xe_args_test.c            |    54 +
 drivers/gpu/drm/xe/tests/xe_bo.c                   |    11 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c              |     3 +-
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c        |     2 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c              |    10 +-
 drivers/gpu/drm/xe/tests/xe_mocs.c                 |    27 +-
 drivers/gpu/drm/xe/xe_args.h                       |    27 +
 drivers/gpu/drm/xe/xe_bb.c                         |     3 +-
 drivers/gpu/drm/xe/xe_bo.c                         |    40 +-
 drivers/gpu/drm/xe/xe_bo.h                         |     9 +-
 drivers/gpu/drm/xe/xe_debugfs.c                    |   144 +-
 drivers/gpu/drm/xe/xe_devcoredump.c                |    33 +-
 drivers/gpu/drm/xe/xe_device.c                     |   253 +-
 drivers/gpu/drm/xe/xe_device.h                     |     9 +
 drivers/gpu/drm/xe/xe_device_sysfs.c               |    33 +-
 drivers/gpu/drm/xe/xe_device_types.h               |    62 +-
 drivers/gpu/drm/xe/xe_drm_client.c                 |    67 +-
 drivers/gpu/drm/xe/xe_exec.c                       |    10 +-
 drivers/gpu/drm/xe/xe_exec_queue.c                 |   422 +-
 drivers/gpu/drm/xe/xe_exec_queue.h                 |    66 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h           |    58 +
 drivers/gpu/drm/xe/xe_execlist.c                   |     5 +-
 drivers/gpu/drm/xe/xe_force_wake.c                 |     7 +
 drivers/gpu/drm/xe/xe_force_wake.h                 |    40 +
 drivers/gpu/drm/xe/xe_gen_wa_oob.c                 |     3 +-
 drivers/gpu/drm/xe/xe_ggtt.c                       |   220 +-
 drivers/gpu/drm/xe/xe_ggtt.h                       |    14 +-
 drivers/gpu/drm/xe/xe_ggtt_types.h                 |    32 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.c              |     9 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.h              |    37 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h        |     2 +
 drivers/gpu/drm/xe/xe_gsc.c                        |    34 +-
 drivers/gpu/drm/xe/xe_gsc_debugfs.c                |     8 +-
 drivers/gpu/drm/xe/xe_gsc_proxy.c                  |    19 +-
 drivers/gpu/drm/xe/xe_gsc_submit.c                 |     2 -
 drivers/gpu/drm/xe/xe_gt.c                         |   206 +-
 drivers/gpu/drm/xe/xe_gt.h                         |    14 +-
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c                |     8 +-
 drivers/gpu/drm/xe/xe_gt_ccs_mode.h                |     2 +-
 drivers/gpu/drm/xe/xe_gt_clock.c                   |     6 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c                 |    31 +-
 drivers/gpu/drm/xe/xe_gt_freq.c                    |    27 +-
 drivers/gpu/drm/xe/xe_gt_idle.c                    |    42 +-
 drivers/gpu/drm/xe/xe_gt_mcr.c                     |     1 -
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c                |    20 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h                |     8 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         |   319 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h         |    10 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h   |     5 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c        |   317 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c      |     4 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c         |   330 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h         |    10 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h   |    39 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c        |     5 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c                |   238 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h                |     1 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c        |    12 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h          |    15 +
 drivers/gpu/drm/xe/xe_gt_stats.c                   |    17 +-
 drivers/gpu/drm/xe/xe_gt_stats.h                   |    32 +
 drivers/gpu/drm/xe/xe_gt_stats_types.h             |    10 +
 drivers/gpu/drm/xe/xe_gt_sysfs.c                   |     2 +-
 drivers/gpu/drm/xe/xe_gt_throttle.c                |    11 +-
 drivers/gpu/drm/xe/xe_gt_types.h                   |     5 +
 drivers/gpu/drm/xe/xe_guc.c                        |    88 +-
 drivers/gpu/drm/xe/xe_guc.h                        |    25 +-
 drivers/gpu/drm/xe/xe_guc_ads.c                    |    10 +-
 drivers/gpu/drm/xe/xe_guc_buf.c                    |     3 +-
 drivers/gpu/drm/xe/xe_guc_capture.c                |    30 +-
 drivers/gpu/drm/xe/xe_guc_capture.h                |     2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                     |   280 +-
 drivers/gpu/drm/xe/xe_guc_ct.h                     |     8 +-
 drivers/gpu/drm/xe/xe_guc_debugfs.c                |    20 +-
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h       |     2 -
 drivers/gpu/drm/xe/xe_guc_fwif.h                   |    60 +-
 drivers/gpu/drm/xe/xe_guc_hwconfig.c               |     4 +-
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c            |     9 +
 .../gpu/drm/xe/xe_guc_klv_thresholds_set_types.h   |     6 +
 drivers/gpu/drm/xe/xe_guc_log.c                    |   509 +-
 drivers/gpu/drm/xe/xe_guc_log.h                    |    30 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                     |    98 +-
 drivers/gpu/drm/xe/xe_guc_relay.c                  |     3 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                 |  1079 +-
 drivers/gpu/drm/xe/xe_guc_submit.h                 |    11 +-
 drivers/gpu/drm/xe/xe_guc_submit_types.h           |    22 +-
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c              |    44 +-
 drivers/gpu/drm/xe/xe_heci_gsc.c                   |     1 -
 drivers/gpu/drm/xe/xe_huc.c                        |     8 +-
 drivers/gpu/drm/xe/xe_huc_debugfs.c                |     8 +-
 drivers/gpu/drm/xe/xe_hw_engine.c                  |     1 -
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c      |    18 +-
 drivers/gpu/drm/xe/xe_hw_engine_group.c            |    81 +-
 drivers/gpu/drm/xe/xe_hw_engine_group.h            |     4 +-
 drivers/gpu/drm/xe/xe_hw_fence.c                   |    24 +-
 drivers/gpu/drm/xe/xe_hw_fence.h                   |     2 -
 drivers/gpu/drm/xe/xe_hwmon.c                      |   331 +-
 drivers/gpu/drm/xe/xe_i2c.c                        |    15 +-
 drivers/gpu/drm/xe/xe_irq.c                        |     3 +-
 drivers/gpu/drm/xe/xe_lmtt.c                       |    25 +-
 drivers/gpu/drm/xe/xe_lrc.c                        |   115 +-
 drivers/gpu/drm/xe/xe_lrc.h                        |    10 +-
 drivers/gpu/drm/xe/xe_lrc_types.h                  |     3 +
 drivers/gpu/drm/xe/xe_memirq.c                     |     2 -
 drivers/gpu/drm/xe/xe_mert.c                       |   118 +
 drivers/gpu/drm/xe/xe_mert.h                       |    35 +
 drivers/gpu/drm/xe/xe_migrate.c                    |    68 +-
 drivers/gpu/drm/xe/xe_migrate.h                    |     3 +
 drivers/gpu/drm/xe/xe_mmio.c                       |     4 -
 drivers/gpu/drm/xe/xe_mocs.c                       |    20 +-
 drivers/gpu/drm/xe/xe_module.c                     |    10 +-
 drivers/gpu/drm/xe/xe_module.h                     |     2 +-
 drivers/gpu/drm/xe/xe_nvm.c                        |    35 +-
 drivers/gpu/drm/xe/xe_oa.c                         |    94 +-
 drivers/gpu/drm/xe/xe_oa_types.h                   |     1 +
 drivers/gpu/drm/xe/xe_page_reclaim.c               |   132 +
 drivers/gpu/drm/xe/xe_page_reclaim.h               |   125 +
 drivers/gpu/drm/xe/xe_pagefault.c                  |    36 +-
 drivers/gpu/drm/xe/xe_pat.c                        |   272 +-
 drivers/gpu/drm/xe/xe_pat.h                        |    23 +
 drivers/gpu/drm/xe/xe_pci.c                        |    42 +-
 drivers/gpu/drm/xe/xe_pci_rebar.c                  |   106 +
 drivers/gpu/drm/xe/xe_pci_rebar.h                  |    13 +
 drivers/gpu/drm/xe/xe_pci_sriov.c                  |    10 +-
 drivers/gpu/drm/xe/xe_pci_types.h                  |     9 +
 drivers/gpu/drm/xe/xe_pcode_api.h                  |     9 +
 drivers/gpu/drm/xe/xe_pm.c                         |    47 +-
 drivers/gpu/drm/xe/xe_pmu.c                        |     2 +-
 drivers/gpu/drm/xe/xe_psmi.c                       |     2 +-
 drivers/gpu/drm/xe/xe_pt.c                         |   167 +-
 drivers/gpu/drm/xe/xe_pt_types.h                   |     6 +
 drivers/gpu/drm/xe/xe_pxp.c                        |    56 +-
 drivers/gpu/drm/xe/xe_pxp_debugfs.c                |     2 +-
 drivers/gpu/drm/xe/xe_query.c                      |    25 +-
 drivers/gpu/drm/xe/xe_reg_sr.c                     |    22 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c              |    82 +-
 drivers/gpu/drm/xe/xe_ring_ops.c                   |    99 +-
 drivers/gpu/drm/xe/xe_rtp.c                        |     1 -
 drivers/gpu/drm/xe/xe_sa.c                         |    69 +-
 drivers/gpu/drm/xe/xe_sa.h                         |    20 +-
 drivers/gpu/drm/xe/xe_sa_types.h                   |     3 +
 drivers/gpu/drm/xe/xe_sched_job.c                  |     3 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h            |     2 +
 drivers/gpu/drm/xe/xe_soc_remapper.c               |    52 +
 drivers/gpu/drm/xe/xe_soc_remapper.h               |    13 +
 drivers/gpu/drm/xe/xe_sriov_packet.c               |     3 +-
 drivers/gpu/drm/xe/xe_sriov_pf.c                   |     2 +
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c           |     7 +-
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c             |    16 +-
 drivers/gpu/drm/xe/xe_sriov_vf.c                   |    85 +-
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c               |    27 +-
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h               |     1 +
 drivers/gpu/drm/xe/xe_step.c                       |     3 +-
 drivers/gpu/drm/xe/xe_survivability_mode.c         |   282 +-
 drivers/gpu/drm/xe/xe_survivability_mode_types.h   |    28 +-
 drivers/gpu/drm/xe/xe_svm.c                        |   754 +-
 drivers/gpu/drm/xe/xe_svm.h                        |    85 +-
 drivers/gpu/drm/xe/xe_sync.c                       |    33 +-
 drivers/gpu/drm/xe/xe_sync.h                       |     2 +
 drivers/gpu/drm/xe/xe_tile.c                       |    42 +-
 drivers/gpu/drm/xe/xe_tile.h                       |    21 +
 drivers/gpu/drm/xe/xe_tile_debugfs.c               |    17 +-
 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c      |     3 +-
 drivers/gpu/drm/xe/xe_tlb_inval.c                  |    46 +-
 drivers/gpu/drm/xe/xe_tlb_inval.h                  |     2 +-
 drivers/gpu/drm/xe/xe_tlb_inval_job.c              |    38 +-
 drivers/gpu/drm/xe/xe_tlb_inval_job.h              |     4 +
 drivers/gpu/drm/xe/xe_tlb_inval_types.h            |     7 +-
 drivers/gpu/drm/xe/xe_trace.h                      |    51 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c             |     1 -
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c                |     1 -
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c               |     1 -
 drivers/gpu/drm/xe/xe_uc.c                         |    37 +-
 drivers/gpu/drm/xe/xe_uc.h                         |     2 +
 drivers/gpu/drm/xe/xe_uc_debugfs.c                 |     2 +-
 drivers/gpu/drm/xe/xe_uc_fw.c                      |    24 +-
 drivers/gpu/drm/xe/xe_userptr.c                    |     2 +-
 drivers/gpu/drm/xe/xe_validation.c                 |     1 -
 drivers/gpu/drm/xe/xe_vm.c                         |   251 +-
 drivers/gpu/drm/xe/xe_vm.h                         |     4 +
 drivers/gpu/drm/xe/xe_vm_madvise.c                 |   106 +-
 drivers/gpu/drm/xe/xe_vm_types.h                   |    22 +-
 drivers/gpu/drm/xe/xe_vram.c                       |   101 +-
 drivers/gpu/drm/xe/xe_vram.h                       |     1 -
 drivers/gpu/drm/xe/xe_vram_freq.c                  |     1 -
 drivers/gpu/drm/xe/xe_vram_types.h                 |    15 +-
 drivers/gpu/drm/xe/xe_vsec.c                       |     7 +-
 drivers/gpu/drm/xe/xe_wa.c                         |    54 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules                 |     6 +-
 drivers/gpu/drm/xe/xe_wait_user_fence.c            |     1 -
 drivers/gpu/drm/xe/xe_wopcm.c                      |     2 +-
 drivers/gpu/host1x/bus.c                           |    67 +-
 drivers/gpu/nova-core/driver.rs                    |     5 +-
 drivers/gpu/nova-core/falcon.rs                    |   107 +-
 drivers/gpu/nova-core/falcon/hal.rs                |    26 +
 drivers/gpu/nova-core/falcon/hal/ga102.rs          |    43 +-
 drivers/gpu/nova-core/falcon/hal/tu102.rs          |    77 +
 drivers/gpu/nova-core/fb.rs                        |     2 +-
 drivers/gpu/nova-core/firmware.rs                  |   203 +-
 drivers/gpu/nova-core/firmware/booter.rs           |    43 +-
 drivers/gpu/nova-core/firmware/fwsec.rs            |    51 +-
 drivers/gpu/nova-core/firmware/gsp.rs              |   146 +-
 drivers/gpu/nova-core/gpu.rs                       |     4 +-
 drivers/gpu/nova-core/gsp.rs                       |    75 +-
 drivers/gpu/nova-core/gsp/boot.rs                  |    18 +-
 drivers/gpu/nova-core/gsp/cmdq.rs                  |     2 +-
 drivers/gpu/nova-core/gsp/commands.rs              |    29 +-
 drivers/gpu/nova-core/gsp/fw.rs                    |    14 +-
 drivers/gpu/nova-core/gsp/sequencer.rs             |    14 +-
 drivers/gpu/nova-core/nova_core.rs                 |     1 -
 drivers/gpu/nova-core/regs.rs                      |    42 +-
 drivers/gpu/nova-core/util.rs                      |    16 -
 drivers/gpu/nova-core/vbios.rs                     |    73 +-
 drivers/staging/media/tegra-video/video.c          |     4 +-
 drivers/tty/vt/vt.c                                |    32 +-
 drivers/video/fbdev/core/fbcon.c                   |    24 -
 drivers/video/fbdev/core/fbcon.h                   |     1 -
 include/drm/bridge/inno_hdmi.h                     |    35 +
 include/drm/bridge/samsung-dsim.h                  |     1 -
 include/drm/display/drm_dp_helper.h                |     3 +
 include/drm/drm_atomic.h                           |    44 +-
 include/drm/drm_bridge.h                           |   156 +-
 include/drm/drm_connector.h                        |   115 +-
 include/drm/drm_device.h                           |    15 +
 include/drm/drm_fb_helper.h                        |    21 -
 include/drm/drm_file.h                             |     7 +-
 include/drm/drm_gem.h                              |    45 +-
 include/drm/drm_gem_shmem_helper.h                 |    14 +-
 include/drm/drm_gpusvm.h                           |    29 +
 include/drm/drm_gpuvm.h                            |    12 +-
 include/drm/drm_mode_object.h                      |     3 +
 include/drm/drm_modeset_helper_vtables.h           |    23 -
 include/drm/drm_of.h                               |     6 +-
 include/drm/drm_pagemap.h                          |   106 +-
 include/drm/drm_pagemap_util.h                     |    92 +
 include/drm/drm_property.h                         |     1 +
 include/drm/drm_vblank.h                           |     3 +-
 include/drm/gpu_scheduler.h                        |    52 +
 include/drm/intel/display_parent_interface.h       |   104 +
 include/drm/intel/intel_lb_mei_interface.h         |     3 +-
 include/linux/console.h                            |     8 -
 include/linux/dma-buf.h                            |    12 -
 include/linux/dma-fence.h                          |    35 +-
 include/linux/dma-heap.h                           |     2 +
 include/linux/fb.h                                 |     4 -
 include/linux/host1x.h                             |     2 +-
 include/trace/events/dma_buf.h                     |   159 +
 include/uapi/drm/amdgpu_drm.h                      |    25 +-
 include/uapi/drm/amdxdna_accel.h                   |     8 +
 include/uapi/drm/panfrost_drm.h                    |    76 +-
 include/uapi/drm/panthor_drm.h                     |   157 +-
 include/uapi/drm/rocket_accel.h                    |    98 +-
 include/uapi/drm/xe_drm.h                          |    95 +-
 include/uapi/linux/kfd_ioctl.h                     |    16 +-
 include/uapi/linux/kfd_sysfs.h                     |     3 +-
 rust/helpers/drm.c                                 |     7 +-
 rust/kernel/drm/driver.rs                          |     6 +-
 rust/kernel/drm/gem/mod.rs                         |     8 +-
 rust/kernel/page.rs                                |    36 +-
 1333 files changed, 154647 insertions(+), 23549 deletions(-)
 delete mode 100644 Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,adreno-rgmu.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
 create mode 100644
Documentation/devicetree/bindings/display/sitronix,st7920.yaml
 create mode 100644 Documentation/gpu/amdgpu/amd_overview_block.svg
 create mode 100644 Documentation/gpu/amdgpu/enforce_isolation.svg
 create mode 100644 Documentation/gpu/amdgpu/gfx_pipeline_seq.svg
 create mode 100644 Documentation/gpu/amdgpu/no_enforce_isolation.svg
 create mode 100644 Documentation/gpu/amdgpu/ring-buffer.rst
 create mode 100644 Documentation/gpu/amdgpu/ring_buffers.svg
 delete mode 100644 drivers/accel/amdxdna/npu2_regs.c
 delete mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.c
 delete mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12_1.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v12_1.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v12_1_pkt.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gmc_v12_1.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gmc_v12_1.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/imu_v12_1.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/imu_v12_1.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v5_3_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v5_3_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mes_v12_1.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mes_v12_1.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmhub_v4_2_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmhub_v4_2_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/psp_v15_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/psp_v15_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/psp_v15_0_8.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/psp_v15_0_8.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/sdma_v7_1.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/sdma_v7_1_0_pkt_open.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/smuio_v15_0_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/smuio_v15_0_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/smuio_v15_0_8.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/smuio_v15_0_8.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/soc_v1_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/soc_v1_0.h
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v12=
_1.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v12_1.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12_1.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2_0/dml2_wrapper_fpu.=
c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2_0/dml2_wrapper_fpu.=
h
 create mode 100644
drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_panel_replay.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_panel_replay.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_12_1_0_offse=
t.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_12_1_0_sh_ma=
sk.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_4_2_0_offset.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_4_2_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_15_0_0_offse=
t.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_15_0_0_sh_ma=
sk.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_15_0_8_offse=
t.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_15_0_8_sh_ma=
sk.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/oss/osssys_7_1_0_offset.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/oss/osssys_7_1_0_sh_mask.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/smuio/smuio_15_0_0_offset.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/smuio/smuio_15_0_0_sh_mask.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/smuio/smuio_15_0_8_offset.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/smuio/smuio_15_0_8_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/thm/thm_15_0_0_off=
set.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/thm/thm_15_0_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/vcn/vcn_5_3_0_offs=
et.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/vcn/vcn_5_3_0_sh_m=
ask.h
 create mode 100644 drivers/gpu/drm/amd/include/ivsrcid/gfx/irqsrcs_gfx_12_=
1_0.h
 create mode 100644 drivers/gpu/drm/amd/include/soc_v1_0_enum.h
 create mode 100644 drivers/gpu/drm/amd/include/soc_v1_0_ih_clientid.h
 create mode 100644
drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu15_driver_if_v15_0_0.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v15_0_0_pm=
fw.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v15_0_0_pp=
smc.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v15_0.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu15/Makefile
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0.c
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_0_ppt.c
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_0_ppt.h
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_virt_ras_cmd.c
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_virt_ras_cmd.h
 rename drivers/gpu/drm/{rockchip/inno_hdmi.c =3D> bridge/inno-hdmi.c} (69%=
)
 create mode 100644 drivers/gpu/drm/drm_pagemap_util.c
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_buffer.h
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h
 create mode 100644 drivers/gpu/drm/hyperv/Kconfig
 rename drivers/gpu/drm/i915/{soc =3D> display}/intel_dram.c (53%)
 rename drivers/gpu/drm/i915/{soc =3D> display}/intel_dram.h (68%)
 create mode 100644 drivers/gpu/drm/i915/display/intel_gvt_api.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_gvt_api.h
 delete mode 100644 drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_initial_plane.c
 rename drivers/gpu/drm/i915/display/{intel_plane_initial.h =3D>
intel_initial_plane.h} (60%)
 delete mode 100644 drivers/gpu/drm/i915/display/intel_panic.c
 delete mode 100644 drivers/gpu/drm/i915/display/intel_panic.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_parent.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_parent.h
 delete mode 100644 drivers/gpu/drm/i915/display/intel_plane_initial.c
 rename drivers/gpu/drm/i915/{soc =3D> display}/intel_rom.c (96%)
 rename drivers/gpu/drm/i915/{soc =3D> display}/intel_rom.h (100%)
 delete mode 100644 drivers/gpu/drm/i915/gem/i915_gemfs.c
 delete mode 100644 drivers/gpu/drm/i915/gem/i915_gemfs.h
 create mode 100644 drivers/gpu/drm/i915/gvt/display_helpers.h
 create mode 100644 drivers/gpu/drm/i915/i915_display_pc8.c
 create mode 100644 drivers/gpu/drm/i915/i915_display_pc8.h
 create mode 100644 drivers/gpu/drm/i915/i915_edram.c
 create mode 100644 drivers/gpu/drm/i915/i915_edram.h
 create mode 100644 drivers/gpu/drm/i915/i915_freq.c
 create mode 100644 drivers/gpu/drm/i915/i915_freq.h
 rename drivers/gpu/drm/i915/{soc/intel_gmch.c =3D> i915_gmch.c} (68%)
 create mode 100644 drivers/gpu/drm/i915/i915_gmch.h
 rename drivers/gpu/drm/i915/{display/intel_hdcp_gsc.c =3D> i915_hdcp_gsc.c=
} (89%)
 create mode 100644 drivers/gpu/drm/i915/i915_hdcp_gsc.h
 create mode 100644 drivers/gpu/drm/i915/i915_initial_plane.c
 create mode 100644 drivers/gpu/drm/i915/i915_initial_plane.h
 create mode 100644 drivers/gpu/drm/i915/i915_panic.c
 create mode 100644 drivers/gpu/drm/i915/i915_panic.h
 delete mode 100644 drivers/gpu/drm/i915/soc/intel_gmch.h
 delete mode 100644 drivers/gpu/drm/imagination/pvr_params.c
 delete mode 100644 drivers/gpu/drm/imagination/pvr_params.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_test.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapal=
i.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/msm_media_info.h
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_drv.h
 create mode 100644 drivers/gpu/drm/panthor/panthor_drv.h
 create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
 create mode 100644 drivers/gpu/drm/sitronix/st7571-spi.c
 create mode 100644 drivers/gpu/drm/sitronix/st7571.c
 create mode 100644 drivers/gpu/drm/sitronix/st7571.h
 create mode 100644 drivers/gpu/drm/sitronix/st7920.c
 create mode 100644 drivers/gpu/drm/tests/drm_panic_test.c
 delete mode 100644 drivers/gpu/drm/v3d/v3d_gemfs.c
 create mode 100644 drivers/gpu/drm/vgem/Kconfig
 create mode 100644 drivers/gpu/drm/xe/abi/guc_lfd_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/guc_lic_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/guc_scheduler_abi.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_obj=
ect.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_sto=
len.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gt/intel_gt_type=
s.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_active.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_active_type=
s.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_irq.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_utils.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_vgpu.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_wakeref.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/soc/intel_gmch.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/soc/intel_rom.h
 delete mode 100644 drivers/gpu/drm/xe/display/ext/i915_irq.c
 delete mode 100644 drivers/gpu/drm/xe/display/xe_display_misc.c
 create mode 100644 drivers/gpu/drm/xe/display/xe_hdcp_gsc.h
 create mode 100644 drivers/gpu/drm/xe/display/xe_initial_plane.c
 create mode 100644 drivers/gpu/drm/xe/display/xe_initial_plane.h
 create mode 100644 drivers/gpu/drm/xe/display/xe_panic.h
 delete mode 100644 drivers/gpu/drm/xe/display/xe_plane_initial.c
 create mode 100644 drivers/gpu/drm/xe/display/xe_stolen.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_mert_regs.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_mert.c
 create mode 100644 drivers/gpu/drm/xe/xe_mert.h
 create mode 100644 drivers/gpu/drm/xe/xe_page_reclaim.c
 create mode 100644 drivers/gpu/drm/xe/xe_page_reclaim.h
 create mode 100644 drivers/gpu/drm/xe/xe_pci_rebar.c
 create mode 100644 drivers/gpu/drm/xe/xe_pci_rebar.h
 create mode 100644 drivers/gpu/drm/xe/xe_soc_remapper.c
 create mode 100644 drivers/gpu/drm/xe/xe_soc_remapper.h
 create mode 100644 drivers/gpu/nova-core/falcon/hal/tu102.rs
 delete mode 100644 drivers/gpu/nova-core/util.rs
 create mode 100644 include/drm/bridge/inno_hdmi.h
 create mode 100644 include/drm/drm_pagemap_util.h
 create mode 100644 include/trace/events/dma_buf.h
