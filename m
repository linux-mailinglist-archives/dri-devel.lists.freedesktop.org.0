Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJerGmoGeWk3ugEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 19:39:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC14B993D4
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 19:39:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B255B10E5A7;
	Tue, 27 Jan 2026 18:39:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F5Z5/6/5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4D310E5A7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 18:39:33 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-81dab89f286so3040557b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 10:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769539173; x=1770143973; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zuBwDnVwHXbDGSLNmgtRuuG8WZfJILUne8QmOX3UcsE=;
 b=F5Z5/6/5dvYTJ9KpS0qitnyVoBSO92vCjsH5ILlYMoaoHmpJ1gXQ4rXpfzbuGuNMyl
 zMsVyyazpYa9yz/j2IGoSLaSYXb1NSEYwvqy7sMi0MbrCrRpCBELXv3zutH9rLlc9V77
 L/eUyy5NPdmftAwZhDWD2gQ0kmnBCU3C83cteva/2HFQ3rlJqK9AKhsVBoZZ1xys4ZZN
 oE519jh2jajvbBRT2KJ5rfCEdo9YiwIGmUwnAY8bMzPLBTjh99Mk2YTBitZrqmzK1ygH
 r6dZmhrrTWYGiUKgNff8CjQF4qVgnSTuHvy6KzYBy9OXvalpRMRiu9TEfSbCcclw4vep
 nQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769539173; x=1770143973;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zuBwDnVwHXbDGSLNmgtRuuG8WZfJILUne8QmOX3UcsE=;
 b=eQJXnWkJ9xZMPuERvjGKNKoO9nug2hN69qV+ZmA72jRL3NZGrUwNq+geEUHKy5PSU6
 +QcuxhWrgMpSHWXRHLomNODM/Ev/q7JA6+gmAc2NAt+3z1I1HhLgM/wFnYkme+GXjDIu
 l7o0U35heHEr65+9i1h3ACSaEdfm5SH39CyVi0qDriqnMQ+7djULxbGKA+muG2gkz0EU
 wNsr67c6N4c81tV5k0sWaELtIoRcSuEu1Q5dBNrBArORFwWPCLoOT7UJ04It3YcGL7H9
 KJWwm0bRmE6G8inDjAO1kL+CV3rxRgoAFu0ZanWN+yeSJNXZkyyGUxXgik5Gy1F9f06d
 w93Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrFwx69ojfbeoQjEEIjSF5ZTd5WGyz23f7QPuEVmVFx/u/jMondIIRrF6X0s/LlltlR4zbZcaypUE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIwk33sSQMzC8mEJ+29oVzfY8ktbKqA6BZZCkg9uPi6lSfuaSE
 oG5HICQevZzljUWFkMY8gMZymyKbnVsLyUdubIG+EjL6dRxCzvR4uyU=
X-Gm-Gg: AZuq6aL4rDa9W2czbpopkVEXHxiRXijUh1v3yosOqOsjomw9q7tXnyOTJfrvNvDJ4k0
 GI8dXhz55ZjmBmI9s9u7Mth5cD4ea0O/ixP0Ucd45RCNhj+joA4PsGmXt37aIgJpHzoHWQi3pUy
 tPGPjRrABh7uiWbJvttuBCRRdACUqyE1bhRpemIoqyW82f7LATfoTbs2m2k4WxGghMMHd8G2cji
 891bLx2FuDz77OIjWzlBX3a9TLlmk/4jzK3Xa6LiQ0rQuLmXBqahutMsbxl5nrXgnxNAwUJKxiU
 CGNMHoceDqurYRIYCK+MckLiyoKMDYh1XAqVX5tshwTQEIGTVV8AAjb72JJg3DSOY0n0/fPIbW4
 aSbBSc4c5RJbldYN/rDAowJxtlM1XDZKx8T+/23FNJOaVAt2yft5LwsH9UK7IeFxPJrwoXmFGLp
 Q+XYmykZQCNL33
X-Received: by 2002:a05:6a21:b91:b0:35b:4f5c:4adf with SMTP id
 adf61e73a8af0-38ec640a1d9mr2317312637.43.1769539172787; 
 Tue, 27 Jan 2026 10:39:32 -0800 (PST)
Received: from at.. ([171.61.161.8]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c642a9f41d0sm113221a12.27.2026.01.27.10.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 10:39:32 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: jani.nikula@linux.intel.com
Cc: airlied@gmail.com, atharvatiwarilinuxdev@gmail.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, joonas.lahtinen@linux.intel.com,
 linux-kernel@vger.kernel.org, rodrigo.vivi@intel.com, simona@ffwll.ch,
 tursulin@ursulin.net, ville.syrjala@linux.intel.com
Subject: Re: [PATCH 2/2] drm/i915/display: Disable display for iMac's
Date: Tue, 27 Jan 2026 18:39:24 +0000
Message-ID: <20260127183924.1109-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <bc778f93d4e2a18848bc93a51aed9b627bcbb2cf@intel.com>
References: <bc778f93d4e2a18848bc93a51aed9b627bcbb2cf@intel.com>
MIME-Version: 1.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,linux.intel.com,vger.kernel.org,intel.com,ffwll.ch,ursulin.net];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:jani.nikula@linux.intel.com,m:airlied@gmail.com,m:atharvatiwarilinuxdev@gmail.com,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:joonas.lahtinen@linux.intel.com,m:linux-kernel@vger.kernel.org,m:rodrigo.vivi@intel.com,m:simona@ffwll.ch,m:tursulin@ursulin.net,m:ville.syrjala@linux.intel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[atharvatiwarilinuxdev@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atharvatiwarilinuxdev@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CC14B993D4
X-Rspamd-Action: no action

>At a glance, this seems like the appropriate level.
> 
> What if you drop patch 2 and supply i915.disable_display=1 module
> parameter? Or return false from intel_display_device_enabled().

I added the i915.disable_display=1 module parameter and removed the patch
, but then the display just goes blank, here are some logs:

$ cat /proc/cmdline 
BOOT_IMAGE=/boot/vmlinuz-6.19.0-rc4+ root=UUID=c058ecbb-6bf6-480c-943a-e8c48a831554 ro pcie_ports=native intel_iommu=on iommu=pt i915.disable_display=1

$ $ sudo cat /sys/module/i915/parameters/disable_display 
Y

$ dmesg | grep i915
[    5.255798] i915 0000:00:02.0: [drm] Found cometlake (device ID 9bc8) integrated display version 9.00 stepping N/A
[    5.256392] i915 0000:00:02.0: [drm] VT-d active for gfx access
[    5.256437] i915 0000:00:02.0: [drm] Using Transparent Hugepages
[    5.263588] i915 0000:00:02.0: Invalid PCI ROM header signature: expecting 0xaa55, got 0xffff
[    5.263592] i915 0000:00:02.0: [drm] Failed to find VBIOS tables (VBT)
[    5.263698] i915 0000:00:02.0: vgaarb: VGA decodes changed: olddecodes=io+mem,decodes=none:owns=io+mem
[    5.993265] i915 0000:00:02.0: [drm] [ENCODER:105:DDI A/PHY A] failed to retrieve link info, disabling eDP
[    5.994957] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04: bound 0000:00:02.0 (ops i915_hdcp_ops [i915])
[    6.308891] i915 0000:00:02.0: [drm] Finished loading DMC firmware i915/kbl_dmc_ver1_04.bin (v1.4)
[    6.310598] i915 0000:00:02.0: [drm] Registered 3 planes with drm panic
[    6.310602] [drm] Initialized i915 1.6.0 for 0000:00:02.0 on minor 1
[    6.314962] i915 0000:00:02.0: [drm] Cannot find any crtc or sizes
[    6.318910] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops intel_audio_component_bind_ops [i915])

$ dmesg | grep amdgpu
[    8.655793] [drm] amdgpu kernel modesetting enabled.
[    8.656000] amdgpu: Virtual CRAT table created for CPU
[    8.656025] amdgpu: Topology: Add CPU node
[    8.656191] amdgpu 0000:03:00.0: amdgpu: initializing kernel modesetting (NAVI14 0x1002:0x7340 0x106B:0x0219 0x47).
[    8.656203] amdgpu 0000:03:00.0: amdgpu: register mmio base: 0x81600000
[    8.656204] amdgpu 0000:03:00.0: amdgpu: register mmio size: 524288
[    8.660144] amdgpu 0000:03:00.0: amdgpu: detected ip block number 0 <common_v1_0_0> (nv_common)
[    8.660146] amdgpu 0000:03:00.0: amdgpu: detected ip block number 1 <gmc_v10_0_0> (gmc_v10_0)
[    8.660147] amdgpu 0000:03:00.0: amdgpu: detected ip block number 2 <ih_v5_0_0> (navi10_ih)
[    8.660149] amdgpu 0000:03:00.0: amdgpu: detected ip block number 3 <psp_v11_0_0> (psp)
[    8.660150] amdgpu 0000:03:00.0: amdgpu: detected ip block number 4 <smu_v11_0_0> (smu)
[    8.660151] amdgpu 0000:03:00.0: amdgpu: detected ip block number 5 <dce_v1_0_0> (dm)
[    8.660152] amdgpu 0000:03:00.0: amdgpu: detected ip block number 6 <gfx_v10_0_0> (gfx_v10_0)
[    8.660154] amdgpu 0000:03:00.0: amdgpu: detected ip block number 7 <sdma_v5_0_0> (sdma_v5_0)
[    8.660155] amdgpu 0000:03:00.0: amdgpu: detected ip block number 8 <vcn_v2_0_0> (vcn_v2_0)
[    8.660156] amdgpu 0000:03:00.0: amdgpu: detected ip block number 9 <jpeg_v2_0_0> (jpeg_v2_0)
[    8.660172] amdgpu 0000:03:00.0: amdgpu: Fetched VBIOS from VFCT
[    8.660174] amdgpu: ATOM BIOS: 113-D322A1XL-011
[    8.687707] amdgpu 0000:03:00.0: vgaarb: deactivate vga console
[    8.687710] amdgpu 0000:03:00.0: amdgpu: Trusted Memory Zone (TMZ) feature disabled as experimental (default)
[    8.687766] amdgpu 0000:03:00.0: amdgpu: vm size is 262144 GB, 4 levels, block size is 9-bit, fragment size is 9-bit
[    8.687782] amdgpu 0000:03:00.0: BAR 0 [mem 0xa0000000-0xafffffff 64bit pref]: releasing
[    8.687784] amdgpu 0000:03:00.0: BAR 2 [mem 0xb0000000-0xb01fffff 64bit pref]: releasing
[    8.687798] amdgpu 0000:03:00.0: BAR 0 [mem 0x4100000000-0x41ffffffff 64bit pref]: assigned
[    8.687805] amdgpu 0000:03:00.0: BAR 2 [mem 0x4080000000-0x40801fffff 64bit pref]: assigned
[    8.687842] amdgpu 0000:03:00.0: amdgpu: VRAM: 4080M 0x0000008000000000 - 0x00000080FEFFFFFF (4080M used)
[    8.687843] amdgpu 0000:03:00.0: amdgpu: GART: 512M 0x0000000000000000 - 0x000000001FFFFFFF
[    8.687947] amdgpu 0000:03:00.0: amdgpu: amdgpu: 4080M of VRAM memory ready
[    8.687949] amdgpu 0000:03:00.0: amdgpu: amdgpu: 7918M of GTT memory ready.
[    8.688772] amdgpu 0000:03:00.0: amdgpu: [VCN instance 0] Found VCN firmware Version ENC: 1.21 DEC: 7 VEP: 0 Revision: 2
[    8.754221] amdgpu 0000:03:00.0: amdgpu: reserve 0x900000 from 0x80fd000000 for PSP TMR
[    8.823385] amdgpu 0000:03:00.0: amdgpu: RAS: optional ras ta ucode is not available
[    8.834600] amdgpu 0000:03:00.0: amdgpu: RAP: optional rap ta ucode is not available
[    8.834603] amdgpu 0000:03:00.0: amdgpu: SECUREDISPLAY: optional securedisplay ta ucode is not available
[    8.834654] amdgpu 0000:03:00.0: amdgpu: use vbios provided pptable
[    8.834656] amdgpu 0000:03:00.0: amdgpu: smc_dpm_info table revision(format.content): 4.5
[    8.849207] amdgpu 0000:03:00.0: amdgpu: SMU is initialized successfully!
[    8.849532] amdgpu 0000:03:00.0: amdgpu: [drm] Display Core v3.2.359 initialized on DCN 2.0
[    8.849534] amdgpu 0000:03:00.0: amdgpu: [drm] DP-HDMI FRL PCON supported
[    8.881799] snd_hda_intel 0000:03:00.1: bound 0000:03:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
[    9.011896] amdgpu 0000:03:00.0: amdgpu: kiq ring mec 2 pipe 1 q 0
[    9.036429] amdgpu: HMM registered 4080MB device memory
[    9.545268] amdgpu 0000:03:00.0: amdgpu: Fence fallback timer expired on ring sdma0
[    9.545394] kfd kfd: amdgpu: Allocated 3969056 bytes on gart
[    9.545417] kfd kfd: amdgpu: Total number of KFD nodes to be created: 1
[   10.049267] amdgpu 0000:03:00.0: amdgpu: Fence fallback timer expired on ring sdma0
[   10.049402] amdgpu: Virtual CRAT table created for GPU
[   10.049521] amdgpu: Topology: Add dGPU node [0x7340:0x1002]
[   10.049523] kfd kfd: amdgpu: added device 1002:7340
[   10.049539] amdgpu 0000:03:00.0: amdgpu: SE 1, SH per SE 2, CU per SH 12, active_cu_number 20
[   10.049544] amdgpu 0000:03:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng 0 on hub 0
[   10.049546] amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng 1 on hub 0
[   10.049547] amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng 4 on hub 0
[   10.049548] amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng 5 on hub 0
[   10.049549] amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng 6 on hub 0
[   10.049550] amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng 7 on hub 0
[   10.049550] amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng 8 on hub 0
[   10.049551] amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng 9 on hub 0
[   10.049552] amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng 10 on hub 0
[   10.049553] amdgpu 0000:03:00.0: amdgpu: ring kiq_0.2.1.0 uses VM inv eng 11 on hub 0
[   10.049554] amdgpu 0000:03:00.0: amdgpu: ring sdma0 uses VM inv eng 12 on hub 0
[   10.049555] amdgpu 0000:03:00.0: amdgpu: ring sdma1 uses VM inv eng 13 on hub 0
[   10.049556] amdgpu 0000:03:00.0: amdgpu: ring vcn_dec uses VM inv eng 0 on hub 8
[   10.049557] amdgpu 0000:03:00.0: amdgpu: ring vcn_enc0 uses VM inv eng 1 on hub 8
[   10.049558] amdgpu 0000:03:00.0: amdgpu: ring vcn_enc1 uses VM inv eng 4 on hub 8
[   10.049559] amdgpu 0000:03:00.0: amdgpu: ring jpeg_dec uses VM inv eng 5 on hub 8
[   10.061446] amdgpu 0000:03:00.0: amdgpu: Runtime PM not available
[   10.061681] amdgpu 0000:03:00.0: amdgpu: [drm] Skipping amdgpu DM backlight registration
[   10.062153] amdgpu 0000:03:00.0: [drm] Registered 5 planes with drm panic
[   10.062155] [drm] Initialized amdgpu 3.64.0 for 0000:03:00.0 on minor 2
[   10.067637] fbcon: amdgpudrmfb (fb0) is primary device
[   10.067724] amdgpu 0000:03:00.0: [drm] fb0: amdgpudrmfb frame buffer device

$ xrandr 
Can't open display
