Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEk8HObJmGl7MQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 21:53:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BC216ACE6
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 21:53:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7578610E840;
	Fri, 20 Feb 2026 20:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VN0uoiaz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F46210E840
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 20:53:52 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-8954c181830so28460906d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 12:53:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771620831; cv=none;
 d=google.com; s=arc-20240605;
 b=aW70pfTpjsjJO0F0SyWscymVVOi+fZyLPEToYjsq18/4Ou8gWmybiuoH5uiU0xtXmN
 RfYcbhHVIkqN6HWXQGO/CcCp8bxW6Hnr8wWwlwPpcL24tm7m3S+Nwoy1ORAXlj7bRU+4
 +N2jPQ7yOZLzoXEe5k+NydWAOCyKMh1FgLBmhpaGGJfHw9Y3CCz4bRtHBrXwylvRvrtZ
 dxMsUX/C90zITvZVrOtriW9pbhcG1wbCPdLz+4e+PRFu7nOp56UDsBCk+pxTP7Q2w4j7
 3i65nqkbLoc89GCOeeJ6CCQTNbaGBcGM8JY5jBxugwq/uV5P3jjoqqR3wnnOE0CTuXhd
 9WZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:dkim-signature;
 bh=SnjnoDLnlDRQ9E2ba4c1c8xkYChBUW94Vh7VOP+xDfQ=;
 fh=A08XZwmmb57jzirbgTkluPSvjDeiJMkkojF1n6qDmTk=;
 b=itLiGDQUrwVwK7Xn7QNqLJ8vJmmklr1qBFcEk2c/QIxzDgoDyUJN/vuWFjlvj2lqsN
 1mnS+QC1qsco+S+wGPmUfPELmW4e+LOqLKVb7ZZqmBUElGjw60cxHaW7hgwkQgqxybfN
 PaE1HobGiC888+A5Xe0Cgn6+iIc/kD6BlKTAbySQdSS2WbN5PL32zZJpdtXTWpQuxy9+
 f/Gp9/cf8qDRKnbi30WRyOWCo+BbYsOHk9/HaBDGDrm4EYo7zFnnADXGQTTNW2DKof2l
 EJ+EfQIurxFqFlU2+0AAlCwRkkBEKPlrdiU748lUThc+RCmRHxWoVCqlA0cqUPowywp3
 R82A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771620831; x=1772225631; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SnjnoDLnlDRQ9E2ba4c1c8xkYChBUW94Vh7VOP+xDfQ=;
 b=VN0uoiazoCkcOCeY5schjkuYm+Lr/Un3xxPnabdJaF+dZMpGuNyhpcsaZ64G1YjZ1f
 GINzVOgySZ8Pmytzqv4Gxy89xuMkgMyUW4XRBk8ZFE69MK0jo9OSLDaDq884Dqliqc+I
 KQwHH/6pNyt9+amVIqWKCunJbCRaHOLygZmv0kA5I8y9+uwmAvPbfyoAVZVPyOsYQm5D
 7EgKTNZQK2U9aLUMAtgVuOluwv6GjB4LOKcxZehPReunoB4WCPAJqF+rwRydVLryibnf
 YTuk6CvIecXGzS+KmWTWqzjaTNV0tQM3wcqq5GJkxR85r+gDpIfWRXAGYHaBA15gnYy2
 47tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771620831; x=1772225631;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SnjnoDLnlDRQ9E2ba4c1c8xkYChBUW94Vh7VOP+xDfQ=;
 b=cke4/AV2kCYH8wJ/FZoGERZRRX4dRtEbnz0tChJid7aG3tc/6RFgy1EWwzTdF/qd66
 D+axbwSS9+Yq9/tvw2C19oNOe+qhpE4lxVXhqrrNJ9ciR6UL2Wh4HvBy4KSXPz8OCP8y
 KtKQXwpc163HTLo4Ur62OWh0FEQjbyE44kpcHgOi3phFcUV0MvK6u+1uAX9sgrFr9jXP
 MiCJUt+8TH1p8ksAEcP7BBmROpGE3cIDpvry/L0seVlmHmV6n/AZeF1KfnYJBeoVDpy2
 H1M1Jyn2+F8ho29ZsHOOef2s7HfDcmNbHT0S3dz4M23O4AV4baf7IXgIE4nAYQA1y7Qh
 Dj5w==
X-Gm-Message-State: AOJu0YxkPJt8M5jnPUIszHoy90hALHvrVWVmaDEHH0Dkmzo5lU2DLaeS
 mh6kkLGNM37twbSY38XoABahyyCd3G1LNKhgs7GYUhd9xJ25EATGhMXW+vLrcs7wVBq9haOo7GZ
 V8Vc8r3nyB00ZxWhfWIOWIEnrP++J2h4=
X-Gm-Gg: AZuq6aI4u1RXJu3EAUI2KdZBPmjwws0df5WnN7owDd9zRCHvqy5nQ1l5dVAERrrqSdn
 0Dcd4LDRbmStRvyv7jlmG0hhREGexgof7DrwHfO8pyrOWyT5faDBQc9UE8hH8Spx2232lnb+2jf
 n5yPMexyUAQOQzfBJqsx3PIoFTliwPKFapFTmK2MHRWq+CXQff79qbil0o2CfLTkNVv6es+nSgz
 QBQ7GSmbPw+RF3Ul6oe0eyO4kxNgSzI+CUW5ZcmFP4rjxOnYMg7cUa679B7QkqCFKKTn6El1q2d
 w7ZrpaT3FI2Dp24Vc92K1melbOIDWtdiT9HfV00aIuajBwUm+va6PQ1j1PDDiVYQOgw=
X-Received: by 2002:a05:6214:1d08:b0:894:6202:4dc with SMTP id
 6a1803df08f44-89979c92197mr23119206d6.21.1771620831183; Fri, 20 Feb 2026
 12:53:51 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 21 Feb 2026 06:53:39 +1000
X-Gm-Features: AaiRm52BAXUy_DCC4dL5T46bVhS3WAN25vAwvqZlk1T7UFTAR45P_hUeEqrpAXs
Message-ID: <CAPM=9txvCxvz_NH1zw9WpeCiYYGOxN36Lz1owmbbjfaB2tmjPA@mail.gmail.com>
Subject: [git pull] drm fixes for 7.0-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D0BC216ACE6
X-Rspamd-Action: no action

Hi Linus,

This is the fixes and cleanups for the end of the merge window, it's
nearly all amdgpu, with some amdkfd, then a pagemap core fix, i915/xe
display fixes, and some xe driver fixes. Nothing seems out of the
ordinary, except amdgpu is a little more volume than usual.

Let me know if there are any issues,
Dave.

drm-next-2026-02-21:
drm next fixes for 7.0-rc1

pagemap:
- drm/pagemap: pass pagemap_addr by reference

amdgpu:
- DML 2.1 fixes
- Panel replay fixes
- Display writeback fixes
- MES 11 old firmware compat fix
- DC CRC improvements
- DPIA fixes
- XGMI fixes
- ASPM fix
- SMU feature bit handling fixes
- DC LUT fixes
- RAS fixes
- Misc memory leak in error path fixes
- SDMA queue reset fixes
- PG handling fixes
- 5 level GPUVM page table fix
- SR-IOV fix
- Queue reset fix
- SMU 13.x fixes
- DC resume lag fix
- MPO fixes
- DCN 3.6 fix
- VSDB fixes
- HWSS clean up
- Replay fixes
- DCE cursor fixes
- DCN 3.5 SR DDR5 latency fixes
- HPD fixes
- Error path unwind fixes
- SMU13/14 mode1 reset fixes
- PSP 15 updates
- SMU 15 updates
- Sync fix in amdgpu_dma_buf_move_notify()
- HAINAN fix
- PSP 13.x fix
- GPUVM locking fix
- Fixes for DC analog support
- DC FAMS fixes
- DML 2.1 fixes
- eDP fixes
- Misc DC fixes
- Fastboot fix
- 3DLUT fixes
- GPUVM fixes
- 64bpp format fix
- Fix for MacBooks with switchable gfx

amdkfd:
- Fix possible double deletion of validate list
- Event setup fix
- Device disconnect regression fix
- APU GTT as VRAM fix
- Fix piority inversion with MQDs
- NULL check fix

radeon:
- HAINAN fix

i915/xe display:
- Regresion fix for HDR 4k displays (#15503)
- Fixup for Dell XPS 13 7390 eDP rate limit
- Memory leak fix on ACPI _DSM handling
- Add missing slice count check during DP mode validation

xe:
- drm/xe: Prevent VFs from exposing the CCS mode sysfs file
- SRIOV related fixes
- PAT cache fix
- MMIO read fix
- W/a fixes
- Adjust type of xe_modparam.force_vram_bar_size
- Wedge mode fix
- HWMon fix
The following changes since commit 2f5db9b4002470ea19380326c5a390647c56e780=
:

  Merge tag 'drm-xe-next-fixes-2026-02-05' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2026-02-06
13:02:44 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2026-02-21

for you to fetch changes up to ae9e8654579709c2f10b8c86a8467e1710d4599f:

  Merge tag 'drm-xe-next-fixes-2026-02-19' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2026-02-21
06:30:54 +1000)

----------------------------------------------------------------
drm next fixes for 7.0-rc1

pagemap:
- drm/pagemap: pass pagemap_addr by reference

amdgpu:
- DML 2.1 fixes
- Panel replay fixes
- Display writeback fixes
- MES 11 old firmware compat fix
- DC CRC improvements
- DPIA fixes
- XGMI fixes
- ASPM fix
- SMU feature bit handling fixes
- DC LUT fixes
- RAS fixes
- Misc memory leak in error path fixes
- SDMA queue reset fixes
- PG handling fixes
- 5 level GPUVM page table fix
- SR-IOV fix
- Queue reset fix
- SMU 13.x fixes
- DC resume lag fix
- MPO fixes
- DCN 3.6 fix
- VSDB fixes
- HWSS clean up
- Replay fixes
- DCE cursor fixes
- DCN 3.5 SR DDR5 latency fixes
- HPD fixes
- Error path unwind fixes
- SMU13/14 mode1 reset fixes
- PSP 15 updates
- SMU 15 updates
- Sync fix in amdgpu_dma_buf_move_notify()
- HAINAN fix
- PSP 13.x fix
- GPUVM locking fix
- Fixes for DC analog support
- DC FAMS fixes
- DML 2.1 fixes
- eDP fixes
- Misc DC fixes
- Fastboot fix
- 3DLUT fixes
- GPUVM fixes
- 64bpp format fix
- Fix for MacBooks with switchable gfx

amdkfd:
- Fix possible double deletion of validate list
- Event setup fix
- Device disconnect regression fix
- APU GTT as VRAM fix
- Fix piority inversion with MQDs
- NULL check fix

radeon:
- HAINAN fix

i915/xe display:
- Regresion fix for HDR 4k displays (#15503)
- Fixup for Dell XPS 13 7390 eDP rate limit
- Memory leak fix on ACPI _DSM handling
- Add missing slice count check during DP mode validation

xe:
- drm/xe: Prevent VFs from exposing the CCS mode sysfs file
- SRIOV related fixes
- PAT cache fix
- MMIO read fix
- W/a fixes
- Adjust type of xe_modparam.force_vram_bar_size
- Wedge mode fix
- HWMon fix

----------------------------------------------------------------
Alex Deucher (6):
      drm/amdgpu/sdma5: enable queue resets unconditionally
      drm/amdgpu/sdma5.2: enable queue resets unconditionally
      drm/amdgpu/sdma6: enable queue resets unconditionally
      drm/amdgpu: re-add the bad job to the pending list for ring resets
      drm/amdgpu: set family for GC 11.5.4
      drm/amdgpu: keep vga memory on MacBooks with switchable graphics

Alex Hung (4):
      drm/amd/display: Fix writeback on DCN 3.2+
      drm/amd/display: Fix the incorrect type in dml_print
      drm/amd/display: Check return of shaper curve to HW format
      drm/amd/display: Remove conditional for shaper 3DLUT power-on

Andrew Martin (3):
      drm/amdgpu: Ignored various return code
      drm/amdkfd: Disable MQD queue priority
      drm/amdkfd: Check for NULL return values

Ankit Nautiyal (1):
      drm/i915/quirks: Fix device id for QUIRK_EDP_LIMIT_RATE_HBR2 entry

Arnd Bergmann (1):
      drm/pagemap: pass pagemap_addr by reference

Asad Kamal (2):
      drm/amd/pm: Add acc counter & fw timestamp to xcp metrics
      drm/amd/pm: Use U64 for accumulation counter

Bert Karwatzki (1):
      Revert "drm/amd: Check if ASPM is enabled from PCIe subsystem"

Bhuvanachandra Pinninti (5):
      drm/amd/display: Migrate DCCG register access from hwseq to dccg
component.
      drm/amd/display: Migrate DIO registers access from hwseq to dio compo=
nent.
      drm/amd/display: DIO memory leak fix.
      drm/amd/display: Refactor virtual directory reorganize encoder
and hwss files.
      drm/amd/display: Migrate DCCG registers access from hwseq to
dccg component.

Ce Sun (1):
      drm/amdgpu: Adjust usleep_range in fence wait

Charlene Liu (2):
      drm/amd/display: Disable SR feature on eDP1 by default
      drm/amd/display: Correct logic check error for fastboot

Chenyu Chen (1):
      drm/amd/display: Add CRC 32-bit mode support for DCN3.6+

Christian K=C3=B6nig (2):
      drm/amdgpu: lock both VM and BO in amdgpu_gem_object_open
      drm/amdgpu: fix 4-level paging if GMC supports 57-bit VA v2

Clay King (1):
      drm/amd/display: bypass post csc for additional color spaces in dal

Dave Airlie (6):
      Merge tag 'amd-drm-next-6.20-2026-02-06' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-intel-next-fixes-2026-02-13' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'amd-drm-next-6.20-2026-02-13' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'amd-drm-next-6.20-2026-02-19' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-intel-next-fixes-2026-02-20' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-xe-next-fixes-2026-02-19' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next

Dmytro Laktyushkin (2):
      drm/amd/display: Add lpddr5 handling to dml2.1
      drm/amd/display: Expose functions of other dcn use

Fangzhi Zuo (1):
      drm/amd/display: Init DMUB DPIA Only for APU

Gangliang Xie (1):
      drm/amdgpu: return when ras table checksum is error

Harish Kasiviswanathan (3):
      drm/amdgpu: Fix double deletion of validate_list
      drm/amdgpu: Set vmid0 PAGE_TABLE_DEPTH for GFX12.1
      drm/amdgpu: Set atomics to true for xgmi

Ian Chen (1):
      drm/amd/display: Add oem panel config for new features

Imre Deak (2):
      drm/i915/dp: Fix pipe BPP clamping due to HDR
      drm/i915/dp: Add missing slice count check during mode validation

Jia Yao (1):
      drm/xe: Add bounds check on pat_index to prevent OOB kernel read
in madvise

Jinzhou Su (1):
      drm/amdgpu/psp_v15_0_8: Add get ras capability

Karthik Poosa (1):
      drm/xe/hwmon: Prevent unintended VRAM channel creation

Kaushlendra Kumar (1):
      drm/i915/acpi: free _DSM package when no connectors

Kenneth Feng (2):
      drm/amd/pm: use debug port for mode1 reset request on smu 13&14
      drm/amd/pm: send unload command to smu during modprobe -r amdgpu

Kent Russell (1):
      drm/amdgpu: Send applicable RMA CPERs at end of RAS init

Leo Li (1):
      drm/amd/display: Increase DCN35 SR enter/exit latency

Leon Huang (1):
      drm/amd/display: Check frame skip capability in Sink side

Lijo Lazar (6):
      drm/amd/pm: Use feature bits data structure
      drm/amd/pm: Change get_enabled_mask signature
      drm/amd/pm: Add default feature number definition
      drm/amdgpu: Skip vcn poison irq release on VF
      drm/amd/pm: Remove buffer allocation in SMUv13.0.6
      drm/amdgpu: Move xgmi status to interface header

Mangesh Gadre (1):
      drm/amdgpu:Add psp v13_0_15 ip block

Mario Kleiner (1):
      drm/amd/display: Use same max plane scaling limits for all 64 bpp for=
mats

Mario Limonciello (2):
      drm/amd: Set minimum version for set_hw_resource_1 on gfx11 to 0x52
      drm/amd: Fix hang on amdgpu unload by using pci_dev_is_disconnected()

Matt Roper (1):
      drm/xe/xe2_hpg: Fix handling of Wa_14019988906 & Wa_14019877138

Melissa Wen (4):
      drm/amd/display: fix wrong color value mapping on MCM shaper LUT
      drm/amd/display: extend delta clamping logic to CM3 LUT helper
      drm/amd/display: remove assert around dpp_base replacement
      drm/amd/display: expose plane blend LUT in HW with MCM

Michal Wajdeczko (2):
      drm/xe/pf: Fix sysfs initialization
      drm/xe/configfs: Fix 'parameter name omitted' errors

Muaaz Nisar (2):
      Revert "drm/amd/display: mouse event trigger to boost RR when idle"
      drm/amd/display: Implementing ramless idle mouse trigger

Nareshkumar Gollakoti (1):
      drm/xe: Prevent VFs from exposing the CCS mode sysfs file

Nicholas Carbones (7):
      drm/amd/display: Add Gfx Base Case For Linear Tiling Handling
      drm/amd/display: Add Handling for gfxversion DcGfxBase
      drm/amd/display: Correct hubp GfxVersion verification
      drm/amd/display: Revert "Migrate DCCG register access from hwseq
to dccg component."
      Revert "drm/amd/display: Add Handling for gfxversion DcGfxBase"
      Revert "drm/amd/display: Correct hubp GfxVersion verification"
      Revert "drm/amd/display: Add Gfx Base Case For Linear Tiling Handling=
"

Nicholas Kazlauskas (3):
      drm/amd/display: Make DCN35 OTG disable w/a reusable
      drm/amd/display: Make DSC FGCG a DSC block level function
      drm/amd/display: Make some DCN35 DCCG symbols non-static

Peichen Huang (2):
      drm/amd/display: External panel replay fsm control
      drm/amd/display: use enum value for panel replay setting

Perry Yuan (1):
      drm/amdgpu: ensure no_hw_access is visible before MMIO

Philip Yang (1):
      drm/amdgpu: Use 5-level paging if gmc support 57-bit VA

Pierre-Eric Pelloux-Prayer (1):
      drm/amdgpu: fix sync handling in amdgpu_dma_buf_move_notify

Piotr Pi=C3=B3rkowski (1):
      drm/xe/vf: Avoid reading media version when media GT is disabled

Pratik Vishwakarma (12):
      drm/amdgpu: Load TA ucode for PSP 15_0_0
      drm/amd/swsmu: Add new param regs for SMU15
      drm/amdgpu: Add support for update_table for SMU15
      drm/admgpu: Update metrics_table for SMU15
      drm/amdgpu: Fix set_default_dpm_tables
      drm/amdgpu: Fix is_dpm_running
      drm/amdgpu: Drop unsupported function
      drm/amd: Drop MALL
      drm/amdgpu: enable mode2 reset for SMU IP v15.0.0
      drm/amd: Add CG/PG flags for GC 11.5.4
      drm/amd/smu: Fix User mode stable P-states SMU15
      drm/amd/swsmu: Move IP specific functions

Raag Jadav (1):
      drm/xe/bo: Redirect faults to dummy page for wedged device

Ray Wu (3):
      drm/amd/display: Fix IGT link training failure on Replay panel
      drm/amd/display: Fix IGT ILR link training failure on Replay panel
      drm/amd/display: Parse all extension blocks for VSDB

Roman Li (1):
      drm/amd/display: Make GPIO HPD path conditional

Saidireddy Yenugu (1):
      drm/amd/display: Skip eDP detection when no sink

Samson Tam (1):
      drm/amd/display: Add static keyword for sharpness tables

Shuicheng Lin (2):
      drm/xe/mmio: Avoid double-adjust in 64-bit reads
      drm/xe: Make xe_modparam.force_vram_bar_size signed

Siwei He (1):
      drm/amdkfd: Fix APU to use GTT, not VRAM for MQD

Srinivasan Shanmugam (4):
      drm/amd/display: Fix dc_link NULL handling in HPD init
      drm/amdgpu: Fix missing unwind in amdgpu_ib_schedule() error path
      drm/amdkfd: Fix watch_id bounds checking in debug address watch v2
      drm/amd/display: Fix out-of-bounds stream encoder index v3

Stanley.Yang (2):
      drm/amdgpu: statistic xgmi training error count
      drm/amd/ras: statistic xgmi training error count

Sunday Clement (1):
      drm/amdkfd: Fix out-of-bounds write in kfd_event_page_set()

Sunil Khatri (1):
      drm/amdgpu: clean up the amdgpu_cs_parser_bos

Taimur Hassan (4):
      drm/amd/display: [FW Promotion] Release 0.1.45.0
      drm/amd/display: Promote DC to 3.2.368
      drm/amd/display: [FW Promotion] Release 0.1.46.0
      drm/amd/display: Promote DC to 3.2.369

Timur Krist=C3=B3f (10):
      drm/amd/display: Reject cursor plane on DCE when scaled
differently than primary
      drm/amd/display: Use DCE 6 link encoder for DCE 6 analog connectors
      drm/amd/display: Only use analog link encoder with analog engine
      drm/amd/display: Only use analog stream encoder with analog engine
      drm/amd/display: Don't call find_analog_engine() twice
      drm/amd/display: Turn off DAC in DCE link encoder using VBIOS
      drm/amd/display: Initialize DAC in DCE link encoder using VBIOS
      drm/amd/display: Set CRTC source for DAC using registers
      drm/amd/display: Enable DAC in DCE link encoder
      drm/amd/display: Remove unneeded DAC link encoder register

Tom Chung (1):
      drm/amd/display: Fix system resume lag issue

Victor Zhao (1):
      drm/amdgpu: avoid sdma ring reset in sriov

Vitaly Prosyak (1):
      drm/amd/display: guard NULL manual-trigger callback in cursor program=
ming

Wayne Lin (1):
      drm/amd/display: Avoid updating surface with the same surface under M=
PO

Wenjing Liu (1):
      drm/amd/display: Fix a NULL pointer dereference in dcn20_hwseq.c

Yang Wang (1):
      drm/amd/pm: use sysfs_streq for string matching in amdgpu_pm

YiLing Chen (1):
      drm/amd/display: set enable_legacy_fast_update to false for DCN36

Yifan Zhang (1):
      drm/amdgpu: Protect GPU register accesses in powergated state in
some paths

Zheng Austin (1):
      drm/amd/display: Match expected data types

Zilin Guan (3):
      drm/amdgpu: Fix memory leak in amdgpu_acpi_enumerate_xcc()
      drm/amdgpu: Use kvfree instead of kfree in amdgpu_gmc_get_nps_memrang=
es()
      drm/amdgpu: Fix memory leak in amdgpu_ras_init()

decce6 (2):
      drm/radeon: Add HAINAN clock adjustment
      drm/amdgpu: Add HAINAN clock adjustment

 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  37 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  26 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   3 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |  22 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  10 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |  31 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h     |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |   4 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  20 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |   8 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v4_2_0.c          |   5 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |  15 +-
 drivers/gpu/drm/amd/amdgpu/psp_v15_0.c             |   4 +
 drivers/gpu/drm/amd/amdgpu/psp_v15_0_8.c           |  21 +++
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |  15 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |  22 +--
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |  15 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   3 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |  24 ++-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c             |  44 +++--
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |   6 +
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c   |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c   |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12.c   |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12_1.c |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |   5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c    |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   3 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  71 +++++---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |  15 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  70 +++++++-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  12 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |   9 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_irq_params.h   |   1 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |   7 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |   8 +
 drivers/gpu/drm/amd/display/dc/Makefile            |   2 +-
 .../gpu/drm/amd/display/dc/bios/command_table.c    |   3 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |  18 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.h   |   6 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  29 ++-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |  18 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   4 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  15 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |  12 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |  27 ++-
 .../gpu/drm/amd/display/dc/dccg/dcn20/dcn20_dccg.c |  54 +++++-
 .../gpu/drm/amd/display/dc/dccg/dcn20/dcn20_dccg.h |  14 +-
 .../drm/amd/display/dc/dccg/dcn201/dcn201_dccg.c   |   7 +-
 .../gpu/drm/amd/display/dc/dccg/dcn21/dcn21_dccg.c |   6 +-
 .../gpu/drm/amd/display/dc/dccg/dcn30/dcn30_dccg.c |   6 +-
 .../drm/amd/display/dc/dccg/dcn301/dcn301_dccg.c   |   6 +-
 .../gpu/drm/amd/display/dc/dccg/dcn31/dcn31_dccg.c |   5 +
 .../drm/amd/display/dc/dccg/dcn314/dcn314_dccg.c   |   7 +-
 .../gpu/drm/amd/display/dc/dccg/dcn32/dcn32_dccg.c |   5 +
 .../gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c |  41 +++--
 .../gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.h |  17 ++
 .../drm/amd/display/dc/dccg/dcn401/dcn401_dccg.c   |  17 +-
 .../gpu/drm/amd/display/dc/dce/dce_link_encoder.c  |  58 ++++--
 .../gpu/drm/amd/display/dc/dce/dce_link_encoder.h  |   8 +-
 .../drm/amd/display/dc/dce/dce_stream_encoder.c    |  23 ++-
 .../drm/amd/display/dc/dce/dce_stream_encoder.h    |  12 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c |  37 +++-
 drivers/gpu/drm/amd/display/dc/dio/Makefile        |  11 +-
 .../gpu/drm/amd/display/dc/dio/dcn10/dcn10_dio.c   |  47 +++++
 .../gpu/drm/amd/display/dc/dio/dcn10/dcn10_dio.h   |  42 +++++
 .../dc/{ =3D> dio}/virtual/virtual_link_encoder.c    |   2 -
 .../dc/{ =3D> dio}/virtual/virtual_link_encoder.h    |   0
 .../dc/{ =3D> dio}/virtual/virtual_stream_encoder.c  |   1 -
 .../dc/{ =3D> dio}/virtual/virtual_stream_encoder.h  |   0
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |   2 +-
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |   4 +-
 .../drm/amd/display/dc/dml2_0/display_mode_util.c  |   2 +-
 .../dml2_0/dml21/inc/dml_top_soc_parameter_types.h |   3 +
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |  26 ++-
 .../dc/dml2_0/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c |  59 +++---
 .../dml21/src/inc/dml2_internal_shared_types.h     |   1 +
 .../gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c   |  21 ++-
 .../gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.h   |   4 +
 .../gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.c |   6 +-
 drivers/gpu/drm/amd/display/dc/dsc/dsc.h           |   1 +
 .../drm/amd/display/dc/dwb/dcn30/dcn30_cm_common.h |   2 +-
 .../amd/display/dc/hubbub/dcn401/dcn401_hubbub.c   |  10 +-
 .../amd/display/dc/hubbub/dcn401/dcn401_hubbub.h   |  10 ++
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |  59 ++----
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |   9 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |  30 +---
 .../drm/amd/display/dc/hwss/dcn201/dcn201_hwseq.c  |  10 +-
 .../drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c    |   9 +-
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |  18 +-
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |  15 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |  31 ++--
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |  13 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |  25 +--
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |   2 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   2 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |   4 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dio.h        |  22 +++
 .../gpu/drm/amd/display/dc/inc/hw/link_encoder.h   |   2 +
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |   7 +
 drivers/gpu/drm/amd/display/dc/link/Makefile       |   3 +-
 .../hwss/link_hwss_virtual.c}                      |   2 +-
 .../hwss/link_hwss_virtual.h}                      |   6 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |   2 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |  14 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |   9 +-
 .../dc/link/protocols/link_dp_panel_replay.c       |  62 +++++++
 .../drm/amd/display/dc/link/protocols/link_hpd.c   |   9 +-
 .../gpu/drm/amd/display/dc/mpc/dcn32/dcn32_mpc.c   |   3 +-
 .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h |  19 +-
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c | 102 ++++++++++-
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.h |  19 ++
 .../display/dc/resource/dce100/dce100_resource.c   |  18 +-
 .../display/dc/resource/dce120/dce120_resource.c   |   2 +-
 .../amd/display/dc/resource/dce60/dce60_resource.c |  14 +-
 .../amd/display/dc/resource/dce80/dce80_resource.c |  11 +-
 .../amd/display/dc/resource/dcn10/dcn10_resource.c |   2 +-
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |   2 +-
 .../display/dc/resource/dcn201/dcn201_resource.c   |   2 +-
 .../amd/display/dc/resource/dcn21/dcn21_resource.c |   2 +-
 .../amd/display/dc/resource/dcn30/dcn30_resource.c |   2 +-
 .../display/dc/resource/dcn301/dcn301_resource.c   |   2 +-
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |   2 +-
 .../display/dc/resource/dcn314/dcn314_resource.c   |   2 +-
 .../display/dc/resource/dcn315/dcn315_resource.c   |  10 +-
 .../display/dc/resource/dcn316/dcn316_resource.c   |  10 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |  10 +-
 .../display/dc/resource/dcn321/dcn321_resource.c   |  10 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |  10 +-
 .../display/dc/resource/dcn351/dcn351_resource.c   |  10 +-
 .../amd/display/dc/resource/dcn36/dcn36_resource.c |  16 +-
 .../display/dc/resource/dcn401/dcn401_resource.c   |  48 ++++-
 .../amd/display/dc/sspl/dc_spl_isharp_filters.c    |   4 +-
 drivers/gpu/drm/amd/display/dc/virtual/Makefile    |  30 ----
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  25 +++
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |   5 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  29 ++-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |   5 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  26 ++-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |  30 +++-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v15_0.h       |   2 -
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |  22 +--
 .../drm/amd/pm/swsmu/smu11/cyan_skillfish_ppt.c    |  24 +--
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |  27 +--
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  27 +--
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |  29 +--
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |   4 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |  26 +--
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   2 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  46 ++---
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c  |  23 ++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   |  34 ++--
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c   |  29 +--
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  56 +++---
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.h   |   8 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  68 +++++--
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |  29 +--
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |   2 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   |  33 ++--
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |  19 +-
 drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0.c     |  10 +-
 .../gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_0_ppt.c   | 198 ++++++++++++++++-=
----
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |  76 ++++----
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |   2 +-
 drivers/gpu/drm/amd/ras/rascore/ras_aca_v1_0.c     |   2 +-
 drivers/gpu/drm/drm_gpusvm.c                       |   2 +-
 drivers/gpu/drm/drm_pagemap.c                      |   2 +-
 drivers/gpu/drm/i915/display/intel_acpi.c          |   1 +
 drivers/gpu/drm/i915/display/intel_dp.c            |  23 ++-
 drivers/gpu/drm/i915/display/intel_quirks.c        |   2 +-
 drivers/gpu/drm/radeon/si_dpm.c                    |   5 +
 drivers/gpu/drm/xe/xe_bo.c                         |   2 +-
 drivers/gpu/drm/xe/xe_configfs.h                   |  12 +-
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c                |   2 +-
 drivers/gpu/drm/xe/xe_hwmon.c                      |   6 +-
 drivers/gpu/drm/xe/xe_mmio.c                       |  10 +-
 drivers/gpu/drm/xe/xe_module.h                     |   2 +-
 drivers/gpu/drm/xe/xe_pci.c                        |   6 +
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c             |  54 +++---
 drivers/gpu/drm/xe/xe_svm.c                        |   8 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c                 |   7 +-
 drivers/gpu/drm/xe/xe_wa.c                         |  18 +-
 include/drm/drm_pagemap.h                          |   2 +-
 include/uapi/drm/amdgpu_drm.h                      |   1 +
 205 files changed, 2183 insertions(+), 990 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dio/dcn10/dcn10_dio.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dio/dcn10/dcn10_dio.h
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
dio}/virtual/virtual_link_encoder.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
dio}/virtual/virtual_link_encoder.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
dio}/virtual/virtual_stream_encoder.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
dio}/virtual/virtual_stream_encoder.h (100%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/inc/hw/dio.h
 rename drivers/gpu/drm/amd/display/dc/{virtual/virtual_link_hwss.c =3D>
link/hwss/link_hwss_virtual.c} (98%)
 rename drivers/gpu/drm/amd/display/dc/{virtual/virtual_link_hwss.h =3D>
link/hwss/link_hwss_virtual.h} (92%)
 delete mode 100644 drivers/gpu/drm/amd/display/dc/virtual/Makefile
