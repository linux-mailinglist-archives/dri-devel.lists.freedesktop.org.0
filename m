Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C21898C810E
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 08:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA1710EDE4;
	Fri, 17 May 2024 06:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yv1u+9pl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFDB10EDE4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 06:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715928791; x=1747464791;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+tuVqOfV/Q96lIezX9TkyQK8BT9xEKhCTI/NXkyhCSA=;
 b=Yv1u+9plY54FxAmmjNQTIHqNl7fea5NEeD4NjTDWd/PnUWZcx9ePMNku
 aG5vg5dp70JFiVa29Rf3jMr2T6oigxHhhq0Q59/CFjq/hBvfV7YMKMSOA
 V6mtrL7OdAF9t0M2EV9zBjyaHYgH85dY5V5zwcb7PIRoNP7tIpZrNyAy2
 K2epcinsag/c6YutQ7LpqAWrV3ZISMIrRe6XvspL8AJjxi2dglEhR//NC
 9uk9HbZHhCgofn4wVca8bNMePjtDZFeaDcKRYXTx+wutSOV8gPWDhx97I
 acwQ6I6ogXZGq6wmpfMwuI3vzjrdcWAN3CWReUBqOQR1x7UvxTvnnP7ec g==;
X-CSE-ConnectionGUID: UVxM8Lu4SuiHohE0+vy5WQ==
X-CSE-MsgGUID: mayDbtn8TEmCM+K/XXDfNg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="29588966"
X-IronPort-AV: E=Sophos;i="6.08,166,1712646000"; d="scan'208";a="29588966"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 23:53:10 -0700
X-CSE-ConnectionGUID: dRLu95V0Rby2d7oL3t5fkQ==
X-CSE-MsgGUID: gLS5KmAhQomw1vpRmAtfpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,166,1712646000"; d="scan'208";a="36596035"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.245.101.99])
 ([10.245.101.99])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 23:53:09 -0700
Message-ID: <4202d5c0-089d-49d1-8c8a-626b9972db4f@linux.intel.com>
Date: Fri, 17 May 2024 08:53:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] HW layer refactor
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com
References: <20240515113006.457472-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240515113006.457472-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next

On 15.05.2024 13:30, Jacek Lawrynowicz wrote:
> The NPU device consists of two parts: NPU buttress and NPU IP.
> Buttress is a platform specific part that integrates the NPU IP with
> the CPU.
> NPU IP is the platform agnostic part that does the inference.
> 
> This refactor enables support for multiple platforms using
> a single NPU IP, so for example NPU IP 37XX could be integrated into
> MTL and LNL platforms.
> 
> Jacek Lawrynowicz (1):
>   accel/ivpu: Replace wake_thread with kfifo
> 
> Wachowski, Karol (2):
>   accel/ivpu: Split IP and buttress headers
>   accel/ivpu: Split IP and buttress code
> 
>  drivers/accel/ivpu/Makefile               |    5 +-
>  drivers/accel/ivpu/ivpu_debugfs.c         |    2 +-
>  drivers/accel/ivpu/ivpu_drv.c             |   32 +-
>  drivers/accel/ivpu/ivpu_drv.h             |   33 +-
>  drivers/accel/ivpu/ivpu_fw.c              |   20 +-
>  drivers/accel/ivpu/ivpu_hw.c              |  313 +++++
>  drivers/accel/ivpu/ivpu_hw.h              |  196 ++--
>  drivers/accel/ivpu/ivpu_hw_37xx.c         | 1070 ------------------
>  drivers/accel/ivpu/ivpu_hw_37xx_reg.h     |   72 --
>  drivers/accel/ivpu/ivpu_hw_40xx.c         | 1255 ---------------------
>  drivers/accel/ivpu/ivpu_hw_40xx_reg.h     |   94 +-
>  drivers/accel/ivpu/ivpu_hw_btrs.c         |  881 +++++++++++++++
>  drivers/accel/ivpu/ivpu_hw_btrs.h         |   46 +
>  drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h |  108 ++
>  drivers/accel/ivpu/ivpu_hw_btrs_mtl_reg.h |   83 ++
>  drivers/accel/ivpu/ivpu_hw_ip.c           | 1174 +++++++++++++++++++
>  drivers/accel/ivpu/ivpu_hw_ip.h           |   36 +
>  drivers/accel/ivpu/ivpu_ipc.c             |   17 +-
>  drivers/accel/ivpu/ivpu_ipc.h             |    4 +-
>  drivers/accel/ivpu/ivpu_job.c             |    2 +-
>  20 files changed, 2799 insertions(+), 2644 deletions(-)
>  create mode 100644 drivers/accel/ivpu/ivpu_hw.c
>  delete mode 100644 drivers/accel/ivpu/ivpu_hw_37xx.c
>  delete mode 100644 drivers/accel/ivpu/ivpu_hw_40xx.c
>  create mode 100644 drivers/accel/ivpu/ivpu_hw_btrs.c
>  create mode 100644 drivers/accel/ivpu/ivpu_hw_btrs.h
>  create mode 100644 drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h
>  create mode 100644 drivers/accel/ivpu/ivpu_hw_btrs_mtl_reg.h
>  create mode 100644 drivers/accel/ivpu/ivpu_hw_ip.c
>  create mode 100644 drivers/accel/ivpu/ivpu_hw_ip.h
> 
> --
> 2.43.2
