Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0032D867128
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 11:33:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5158F10EDDE;
	Mon, 26 Feb 2024 10:33:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="i+qdZdI6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7BC010E45E
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 10:33:37 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-56586a6bb34so730677a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 02:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1708943616; x=1709548416; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sVrgk5sT71oQLsEToda7i8I5A5amx5s6C1JRzuzIobk=;
 b=i+qdZdI6BnB4EcOksaq/OI1FgFfpcwZnRV3uFphdFVAV79SaOa9ey3IOLen2VnX6Zy
 Z9uGAhmlu0XMr87dHxm6OGr+2l1/c6FQK0IHwLDf2TN/MUSUiXFPROUdt1CUHOO5YPbQ
 yNORieRzb6tVEfW2YhtM2lu9nxQnadE9ISuyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708943616; x=1709548416;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sVrgk5sT71oQLsEToda7i8I5A5amx5s6C1JRzuzIobk=;
 b=gMsZxpL7ZWbCRG4L3ebUabLVBBZ9K/oS0p91GvR4VNVwsavPrFduc6VRrgicpMsaMD
 Dlt9kmW5zCIV6U9UJ9zbjR2gNeF2DGQSF0of/IhCACrlDf+UKCDOg+MuMChAtLNUQnHH
 bpUcGUCDlWOnxk06NMLuGpjE74+Jtr2NY6n5TfJlAawFLO/qCdbCviCBuNqt3RfACW6R
 T0erHb9bFRloqaEOCdpZgMH8+y7/O4+PXiMg295wr6z+fE/zxAdFrEBzneg9FVqgzvDb
 pms2SMt/n9bwgL+RQUyUi6kldpVOZEp0caNhJ5X3LbPOblheb4Uwg09Z0tJoQaw2PT5Z
 FPHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKBBjE+h+KjNnkEZOYN9+cg0s+LtQPKBG/wgmE7mOBsO9pgS8XrkxLvhCEWKoRrAmqdfhrUd62qFh0XoxXBkF1iAWnxoKs6NxUsxZpCaHg
X-Gm-Message-State: AOJu0YzJ8cCTvMXKYjXxmMX0XMcFpdYzPFhyznqus/0DNOYb+7qG5fTN
 bI5umBVHSkptOo3HVc5DZEAixU2yeqbFOqwz2sDqRdgDjzs0oSmFfZhLkZ5n1ro=
X-Google-Smtp-Source: AGHT+IH77xsl1BHM8uPVSmmCpKJ+eFIq4Lm5pBg0LqxA4ouT0HHYQpqbMSq6gSaZhM2RyngksGv6jg==
X-Received: by 2002:a17:906:3193:b0:a3e:9651:1241 with SMTP id
 19-20020a170906319300b00a3e96511241mr4308721ejy.2.1708943615899; 
 Mon, 26 Feb 2024 02:33:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 i19-20020a17090639d300b00a3f81200425sm2264426eje.122.2024.02.26.02.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 02:33:35 -0800 (PST)
Date: Mon, 26 Feb 2024 11:33:33 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Oded Gabbay <ogabbay@kernel.org>
Cc: airlied@gmail.com, daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: Re: [git pull] habanalabs for drm-next-6.9
Message-ID: <Zdxo_VVrs4mkjUI-@phenom.ffwll.local>
References: <ZdxJprop0EniVQtf@ogabbay-vm-u22.habana-labs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZdxJprop0EniVQtf@ogabbay-vm-u22.habana-labs.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
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

On Mon, Feb 26, 2024 at 10:19:50AM +0200, Oded Gabbay wrote:
> Hi Dave, Sima.
> 
> Habanalabs pull request for 6.9.
> 
> No uapi changes this time. Just minor features, improvements, code cleanups
> and bug fixes. Also one small change in accel subsystem file.
> 
> Full details are in the signed tag.
> 
> Thanks,
> Oded
> 
> The following changes since commit 40d47c5fb4f2a7c1ef168598f01bdcbd31ba4038:
> 
>   Merge tag 'amd-drm-next-6.9-2024-02-19' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2024-02-22 13:21:19 +1000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git tags/drm-habanalabs-next-2024-02-26
> 
> for you to fetch changes up to 576d7cc5a9e29e4cc579ffb0f9afc209e34eea31:
> 
>   accel: constify the struct device_type usage (2024-02-26 09:59:18 +0200)

Pulled into drm-next, thanks a lot!
-Sima

> 
> ----------------------------------------------------------------
> This tag contains habanalabs driver and accel changes for v6.9.
> 
> The notable changes are:
> 
> - New features and improvements:
>   - Configure interrupt affinity according to NUMA nodes for the MSI-X interrupts that are
>     assigned to the userspace application which acquires the device.
>   - Move the HBM MMU page tables to reside inside the HBM to minimize latency when doing
>     page-walks.
>   - Improve the device reset mechanism when consecutive heartbeat failures occur (firmware
>     fails to ack on heartbeat message).
>   - Check also extended errors in the PCIe addr_dec interrupt information.
>   - Rate limit the error messages that can be printed to dmesg log by userspace actions.
> 
> - Firmware related fixes:
>   - Handle requests from firmware to reserve device memory
> 
> - Bug fixes and code cleanups:
>   - constify the struct device_type usage in accel (accel_sysfs_device_minor).
>   - Fix the PCI health check by reading uncached register.
>   - Fix reporting of drain events.
>   - Fix debugfs files permissions.
>   - Fix calculation of DRAM BAR base address.
> 
> ----------------------------------------------------------------
> Avri Kehat (1):
>       accel/habanalabs: fix debugfs files permissions
> 
> Colin Ian King (1):
>       accel/habanalabs/goya: remove redundant assignment to pointer 'input'
> 
> Dani Liberman (3):
>       accel/habanalabs/gaudi2: add interrupt affinity for user interrupts
>       accel/habanalabs: remove call to deprecated function
>       accel/habanalabs: fix error print
> 
> Erick Archer (1):
>       accel/habanalabs: use kcalloc() instead of kzalloc()
> 
> Farah Kassabri (2):
>       accel/habanalabs/gaudi2: move HMMU page tables to device memory
>       accel/habanalabs: remove hop size from asic properties
> 
> Koby Elbaz (1):
>       accel/habanalabs: increase HL_MAX_STR to 64 bytes to avoid warnings
> 
> Malkoot Khan (1):
>       accel/habanalabs: Remove unnecessary braces from if statement
> 
> Ofir Bitton (3):
>       accel/habanalabs/gaudi2: drain event lacks rd/wr indication
>       accel/habanalabs/hwmon: rate limit errors user can generate
>       accel/habanalabs: modify pci health check
> 
> Ricardo B. Marliere (1):
>       accel: constify the struct device_type usage
> 
> Tal Risin (1):
>       accel/habanalabs: initialize maybe-uninitialized variables
> 
> Tomer Tayar (8):
>       accel/habanalabs: fix DRAM BAR base address calculation
>       accel/habanalabs: abort device reset for consecutive heartbeat failures
>       accel/habanalabs/gaudi2: fail memory memset when failing to copy QM packet to device
>       accel/habanalabs: modify print for skip loading linux FW to debug log
>       accel/habanalabs/gaudi2: check extended errors according to PCIe addr_dec interrupt info
>       accel/habanalabs: fix glbl error cause handling
>       accel/habanalabs: handle reserved memory request when working with full FW
>       accel/habanalabs: keep explicit size of reserved memory for FW
> 
>  drivers/accel/drm_accel.c                          |   2 +-
>  .../accel/habanalabs/common/command_submission.c   |   3 +-
>  drivers/accel/habanalabs/common/debugfs.c          |  18 +-
>  drivers/accel/habanalabs/common/device.c           |  55 +++-
>  drivers/accel/habanalabs/common/firmware_if.c      |  25 +-
>  drivers/accel/habanalabs/common/habanalabs.h       |  43 ++-
>  drivers/accel/habanalabs/common/hw_queue.c         |  17 +
>  drivers/accel/habanalabs/common/hwmon.c            |  29 +-
>  drivers/accel/habanalabs/common/mmu/Makefile       |   2 +-
>  drivers/accel/habanalabs/common/mmu/mmu.c          | 223 ++++++++++++-
>  drivers/accel/habanalabs/common/mmu/mmu_v1.c       | 354 +++------------------
>  drivers/accel/habanalabs/common/mmu/mmu_v2.c       | 338 ++++++++++++++++++++
>  drivers/accel/habanalabs/common/mmu/mmu_v2_hr.c    |  24 +-
>  drivers/accel/habanalabs/common/security.c         |  33 +-
>  drivers/accel/habanalabs/common/security.h         |   3 +-
>  drivers/accel/habanalabs/gaudi/gaudi.c             |   9 +-
>  drivers/accel/habanalabs/gaudi2/gaudi2.c           | 308 ++++++++++++------
>  drivers/accel/habanalabs/gaudi2/gaudi2P.h          |  15 +-
>  drivers/accel/habanalabs/goya/goya.c               |  12 +-
>  drivers/accel/habanalabs/goya/goya_coresight.c     |   3 +-
>  .../habanalabs/include/hw_ip/mmu/mmu_general.h     |   2 +
>  21 files changed, 1008 insertions(+), 510 deletions(-)
>  create mode 100644 drivers/accel/habanalabs/common/mmu/mmu_v2.c

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
