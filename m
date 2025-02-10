Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 570FCA2E827
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 10:48:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A57610E4E9;
	Mon, 10 Feb 2025 09:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MknRn990";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D431D10E4E8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 09:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739180920; x=1770716920;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=46x7qMY9Hpcg3X594Q1VueZfa5vf+rMLHiwdtHWNhCQ=;
 b=MknRn990igPo1gzytO/L4XlAkauPmY5oqbAzPE7JRCN6z2UKOH5N+8jv
 qBRQaTiyyQlgrzmunsFiWnXSar4Ucn0SG8h2JG6jOULuPWFESn3qEdSsY
 F4Z+SfZpe+WtJ70+qOercSVrhjnvIzU6PLnpeRpjswu+7SsLv1Deo4ns2
 Kig05c/ieHRs6IIndLXIYO7IrWif3m10doWBwIqjdeSL9r5f41PocsSfP
 f4aOEIN0qamw0JEa0vo66W4I6UX5t6/YA5vyNvwbnf1ZMzQDrUALjzyha
 Zagyov7DaczWuCoVk2wJbvzXK/uJu0hkWJ3F0ch/NocUsl5BIn0UIvAaL g==;
X-CSE-ConnectionGUID: OpQc3Z4iRP+gmpJPONH3DQ==
X-CSE-MsgGUID: FSgCsVe+QqqeUHgsZsd/yQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="40022356"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="40022356"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 01:48:39 -0800
X-CSE-ConnectionGUID: hxPktux1SlCCC2GqSDn8xQ==
X-CSE-MsgGUID: 6sXrpH+mRNmhYcqEsDctCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135390009"
Received: from mgorski-mobl1.ger.corp.intel.com (HELO [10.245.84.116])
 ([10.245.84.116])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 01:48:38 -0800
Message-ID: <01478e9d-dce9-426e-b0bc-073368623355@linux.intel.com>
Date: Mon, 10 Feb 2025 10:48:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] accel/ivpu: Changes for 6.15 2025-02-04
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 maciej.falkowski@linux.intel.com
References: <20250204084622.2422544-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250204084622.2422544-1-jacek.lawrynowicz@linux.intel.com>
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

On 2/4/2025 9:46 AM, Jacek Lawrynowicz wrote:
> Add possibility to import single buffer into multiple contexts,
> fix locking when aborting contexts and add some debug features.
> 
> Andrzej Kacprowski (2):
>   accel/ivpu: Add missing locks around mmu queues
>   accel/ivpu: Prevent runtime suspend during context abort work
> 
> Karol Wachowski (3):
>   accel/ivpu: Add debugfs interface for setting HWS priority bands
>   accel/ivpu: Add test modes to toggle clock relinquish disable
>   accel/ivpu: Implement D0i2 disable test modea
> 
> Tomasz Rusinowicz (1):
>   accel/ivpu: Allow to import single buffer into multiple contexts
> 
>  drivers/accel/ivpu/ivpu_debugfs.c | 84 +++++++++++++++++++++++++++++++
>  drivers/accel/ivpu/ivpu_drv.c     |  2 +-
>  drivers/accel/ivpu/ivpu_drv.h     |  4 ++
>  drivers/accel/ivpu/ivpu_fw.c      |  4 ++
>  drivers/accel/ivpu/ivpu_gem.c     | 43 ++++++++++++++++
>  drivers/accel/ivpu/ivpu_gem.h     |  1 +
>  drivers/accel/ivpu/ivpu_hw.c      | 31 ++++++++++++
>  drivers/accel/ivpu/ivpu_hw.h      |  5 ++
>  drivers/accel/ivpu/ivpu_job.c     | 10 +++-
>  drivers/accel/ivpu/ivpu_jsm_msg.c | 29 ++++-------
>  drivers/accel/ivpu/ivpu_mmu.c     |  9 ++++
>  11 files changed, 202 insertions(+), 20 deletions(-)
> 
> --
> 2.45.1

