Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EE343897B
	for <lists+dri-devel@lfdr.de>; Sun, 24 Oct 2021 16:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D70898C8;
	Sun, 24 Oct 2021 14:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06839898C8
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Oct 2021 14:12:26 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id b1so3656471qvk.5
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Oct 2021 07:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:reply-to:content-language
 :from:to:subject:content-transfer-encoding;
 bh=ClcyGPKPH1V5ZqW4tQfds7H19ap+Sejg3aKZ94lPRNQ=;
 b=ZWbmPWwhkzq0+cy21JMZGFEvuCgi9qTZhHk+jT6MhKyk+9uLynQX7U/MBhA91sjGA9
 2vpWrZvCA9/hq1+0te4MRC08LduASte7LPr8vwC2SCNEmPXNI7yDqOk+LpJH3yPo237g
 JG+NDfauVWz3pmOLYn/hc89N8k5Di5djxkD+erep7qQMACZVWEKh/P361cTewkSCq38r
 r/kudSRRMHnU+XPwPPlEIbqmZWZc/FyBcRge8rP6Sr4ewhmTLXhcXCLEHKqLNSzVbP4p
 hWfFxn0feYRa4AOGuaspK1IMpstOb1Z+CbgRVAtgWRXIxZFZct5xGmBeo+vB6p06QJNV
 qdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :content-language:from:to:subject:content-transfer-encoding;
 bh=ClcyGPKPH1V5ZqW4tQfds7H19ap+Sejg3aKZ94lPRNQ=;
 b=1I1o+pG11iISNneuM79C4SO/qH/JNGdjwFuTjy3GpdOkJfIa9o1DPgx6McNonHdGub
 z8Lab28xE7ZAiG7Y1C00x/inpy7TKg6QO33o115gpPsd7rUUnzNKbuARAfF8eCOtoepd
 8j3EAdV9DO0CFtLPoggmzJbax1YqA3VeQ3FPPsJZ9wN0srCiHDXmc3OqAbqdyDCpW1xO
 x6MvGMBLQ1bsjy6/Diw6SBzTvX/ia0FwWsAne7pMjOZeUwU50Nn6452zlDdr0sRMQL+t
 CoDLT1TSyfRVDfY5nzv0OfKw6JDfqdLb2tZ+L6wvt4h8SzsOXImAf5D5S+MfKwWb6UVj
 KTyA==
X-Gm-Message-State: AOAM533rdLws+OwEPs5eJijQz6xOvbpP5wSG9dq6YSs7GpUI5W9a2rf+
 /5kMq80Bl0efMdZIhj1IPwIIz5vpTzM=
X-Google-Smtp-Source: ABdhPJwomNsw0Pdz18lBcEaFcO2Ik96FStylJJjugDLeb54w5e+Xi14jLqhciKUhFMZZIP+D3U6N/g==
X-Received: by 2002:a05:6214:518d:: with SMTP id
 kl13mr10478440qvb.14.1635084745990; 
 Sun, 24 Oct 2021 07:12:25 -0700 (PDT)
Received: from mua.localhost ([2600:1700:e380:2c20::49])
 by smtp.gmail.com with ESMTPSA id a23sm691080qkn.73.2021.10.24.07.12.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 07:12:25 -0700 (PDT)
Message-ID: <b4adea1b-9a21-75d2-7ee7-25d4f28ef6f8@gmail.com>
Date: Sun, 24 Oct 2021 10:12:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.2.0
Content-Language: en-US
From: PGNet Dev <pgnet.dev@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: amdgpu "Fatal error during GPU init"; Ryzen 5600G integrated GPU +
 kernel 5.14.13
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Reply-To: pgnet.dev@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

i've a dual gpu system

	inxi -GS
		System:    Host: ws05 Kernel: 5.14.13-200.fc34.x86_64 x86_64 bits: 64 Console: tty pts/0
		           Distro: Fedora release 34 (Thirty Four)
(1)		Graphics:  Device-1: NVIDIA GK208B [GeForce GT 710] driver: nvidia v: 470.74
(2)		           Device-2: Advanced Micro Devices [AMD/ATI] Cezanne driver: N/A
		           Display: server: X.org 1.20.11 driver: loaded: nvidia unloaded: fbdev,modesetting,vesa
		           Message: Advanced graphics data unavailable for root.

running on

	cpu:    Ryzen 5 5600G
	mobo:   ASRockRack X470D4U
	bios:   vP4.20, 04/14/2021
	kernel: 5.14.13-200.fc34.x86_64 x86_64

where,

	the nvidia is a PCIe card
	the amdgpu is the Ryzen-integrated gpu

the nvidia PCI is currently my primary
it's screen-attached, and boots/functions correctly

	lsmod | grep nvidia
		nvidia_drm             69632  0
		nvidia_modeset       1200128  1 nvidia_drm
		nvidia              35332096  1 nvidia_modeset
		drm_kms_helper        303104  2 amdgpu,nvidia_drm
		drm                   630784  8 gpu_sched,drm_kms_helper,nvidia,amdgpu,drm_ttm_helper,nvidia_drm,ttm

	dmesg | grep -i nvidia
		[    5.755494] nvidia: loading out-of-tree module taints kernel.
		[    5.755503] nvidia: module license 'NVIDIA' taints kernel.
		[    5.759769] nvidia: module verification failed: signature and/or required key missing - tainting kernel
		[    5.774894] nvidia-nvlink: Nvlink Core is being initialized, major device number 234
		[    5.775299] nvidia 0000:10:00.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=io+mem
		[    5.975449] NVRM: loading NVIDIA UNIX x86_64 Kernel Module  470.74  Mon Sep 13 23:09:15 UTC 2021
		[    6.013181] nvidia-modeset: Loading NVIDIA Kernel Mode Setting Driver for UNIX platforms  470.74  Mon Sep 13 22:59:50 UTC 2021
		[    6.016444] [drm] [nvidia-drm] [GPU ID 0x00001000] Loading driver
		[    6.227295] caller _nv000723rm+0x1ad/0x200 [nvidia] mapping multiple BARs
		[    6.954906] [drm] Initialized nvidia-drm 0.0.0 20160202 for 0000:10:00.0 on minor 0
		[   16.820758] input: HDA NVidia HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:01.1/0000:10:00.1/sound/card0/input13
		[   16.820776] input: HDA NVidia HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:01.1/0000:10:00.1/sound/card0/input14
		[   16.820808] input: HDA NVidia HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:01.1/0000:10:00.1/sound/card0/input15
		[   16.820826] input: HDA NVidia HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:01.1/0000:10:00.1/sound/card0/input16
		[   16.820841] input: HDA NVidia HDMI/DP,pcm=10 as /devices/pci0000:00/0000:00:01.1/0000:10:00.1/sound/card0/input17

the amdgpu is not (currently/yet) in use; no attached screen

in BIOS, currently,

	'PCI Express' (nvidia gpu) is selected as primary
	'HybridGraphics' is enabled
	'OnBoard VGA' is enabled


on boot, mods are loaded

	lsmod | grep gpu
		amdgpu               7802880  0
		drm_ttm_helper         16384  1 amdgpu
		ttm                    81920  2 amdgpu,drm_ttm_helper
		iommu_v2               24576  1 amdgpu
		gpu_sched              45056  1 amdgpu
		drm_kms_helper        303104  2 amdgpu,nvidia_drm
		drm                   630784  8 gpu_sched,drm_kms_helper,nvidia,amdgpu,drm_ttm_helper,nvidia_drm,ttm
		i2c_algo_bit           16384  2 igb,amdgpu

but i see a 'fatal error' and 'failed' probe,

	dmesg | grep -i amdgpu
		[    5.161923] [drm] amdgpu kernel modesetting enabled.
		[    5.162097] amdgpu: Virtual CRAT table created for CPU
		[    5.162104] amdgpu: Topology: Add CPU node
		[    5.162197] amdgpu 0000:30:00.0: enabling device (0000 -> 0003)
		[    5.162232] amdgpu 0000:30:00.0: amdgpu: Trusted Memory Zone (TMZ) feature enabled
		[    5.169105] amdgpu 0000:30:00.0: BAR 6: can't assign [??? 0x00000000 flags 0x20000000] (bogus alignment)
		[    5.174413] amdgpu 0000:30:00.0: amdgpu: Unable to locate a BIOS ROM
		[    5.174415] amdgpu 0000:30:00.0: amdgpu: Fatal error during GPU init
		[    5.174416] amdgpu 0000:30:00.0: amdgpu: amdgpu: finishing device.
		[    5.174425] Modules linked in: amdgpu(+) uas usb_storage fjes(-) raid1 drm_ttm_helper ttm iommu_v2 gpu_sched drm_kms_helper crct10dif_pclmul crc32_pclmul igb crc32c_intel cec ghash_clmulni_intel drm sp5100_tco dca ccp i2c_algo_bit wmi video sunrpc tcp_bbr nct6775 hwmon_vid k10temp
		[    5.174463]  amdgpu_device_fini_hw+0x33/0x2c5 [amdgpu]
		[    5.174594]  amdgpu_driver_load_kms.cold+0x72/0x94 [amdgpu]
		[    5.174706]  amdgpu_pci_probe+0x110/0x1a0 [amdgpu]
		[    5.174907] amdgpu: probe of 0000:30:00.0 failed with error -22


are specific configs from

	https://www.kernel.org/doc/html/latest/gpu/amdgpu.html

required to avoid/workaround the init error?  or known bug?
