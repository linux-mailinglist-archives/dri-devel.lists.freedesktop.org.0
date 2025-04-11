Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 072FDA858D8
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 12:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2027010EB55;
	Fri, 11 Apr 2025 10:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ggVl5aWD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E793710EB55
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 10:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744365974; x=1775901974;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gIJX/PA5IkjIR6qCqPQoAzPdBaAXilcNQ1Zv/kOjoN0=;
 b=ggVl5aWDCkBaZQ1AvMo5lSuWThGMWG1ZZgwAZGWxb8t3pAiGakmcjRpN
 lV5WkhP4CEG4f6O4cCD20e8wSIDsr+ZeGG4kJ/nTa9ySbmEx11H58PwGG
 JaGIkvfDAYFW0eZ3CO7whojQUbeMCvFgUJ/vlQoDlow6mL5DqGgK4YqGR
 Pv/eQiIjm0WRnRALs8a0BXaB0hduWD4lPjVm1iIK2lplK8uHzeOeIsSwO
 RJ1uM4TrWu3NBedAUV6kvQ8YVRiSByuTGZx7C0IxSJBH8Bj5meuQH1sIE
 +CI8eFsuWXpzbEJVdxPusAkEGfK3Bg04IRoPn5MaVS1RULKAy3gD2enV9 g==;
X-CSE-ConnectionGUID: AC2qDzWoTgykl6x2+jcfpA==
X-CSE-MsgGUID: cBnNPH7rSHOjuV4zGY5OsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="63312771"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="63312771"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 03:06:13 -0700
X-CSE-ConnectionGUID: NlOKPeiDTfWMjnqTGjanEQ==
X-CSE-MsgGUID: UYfow021Q9+W2AKUAmqOVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="134260690"
Received: from mariuszg-mobl2.ger.corp.intel.com (HELO [10.245.113.161])
 ([10.245.113.161])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 03:06:12 -0700
Message-ID: <7b678869-095f-4f61-8efb-f90dc359d278@linux.intel.com>
Date: Fri, 11 Apr 2025 12:06:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] accel/ivpu: Expose NPU frequency into userspace
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com, lizhi.hou@amd.com
References: <20250401155912.4049340-1-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250401155912.4049340-1-maciej.falkowski@linux.intel.com>
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

Applied to drm-misc-fixes

On 4/1/2025 5:59 PM, Maciej Falkowski wrote:
> This patchset introduces the capability to measure the NPU frequency
> and makes it accessible to a userspace via sysfs. The initial patch in the series
> addresses the inconsistency in retrieving the clock frequency from
> the device across the Meteor Lake and Lunar Lake generations.
> 
> Subsequently, the latter patch exposes the driver's frequency
> through sysfs to facilitate frequency sampling.
> 
> Andrzej Kacprowski (2):
>   accel/ivpu: Fix the NPU's DPU frequency calculation
>   accel/ivpu: Show NPU frequency in sysfs
> 
>  drivers/accel/ivpu/ivpu_drv.c     |   4 +-
>  drivers/accel/ivpu/ivpu_fw.c      |   3 +-
>  drivers/accel/ivpu/ivpu_hw.h      |  14 ++--
>  drivers/accel/ivpu/ivpu_hw_btrs.c | 134 ++++++++++++++----------------
>  drivers/accel/ivpu/ivpu_hw_btrs.h |   7 +-
>  drivers/accel/ivpu/ivpu_sysfs.c   |  49 ++++++++++-
>  include/uapi/drm/ivpu_accel.h     |   4 +-
>  7 files changed, 127 insertions(+), 88 deletions(-)
> 

