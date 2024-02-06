Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D662284B579
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 13:42:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D422112B79;
	Tue,  6 Feb 2024 12:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ecmXQhX0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E44112B7A
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 12:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707223364; x=1738759364;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vH29X5A090xKItrQS0tfzKkzy/Pk/OFjzvT1d6l18vA=;
 b=ecmXQhX0RyiciKNCqRMgk8EzEuaKxNeJ+sU+AXXlrIQpt0jVNxMGRz62
 AzvHQpf6zJFKEJe+FHOQh/QsAT4sSVlxtkvP9c7PoCbrWOwMG/g2m7x+X
 6+sD677thiZlIT1WhKWb0fTmL9s/h4E37yNAo8PSukMl+tLWcp/1RH2AG
 HJQLoqJKqKooBvM2NB3GkRdR6bGM7rEfTPhUZrxDW278NEUPTTQBKB+hr
 MjOQyR2Jr+KQMmEb+XXpD2Ol6K1ZUF0p3r50xyr0fTUhvi4Mstg5n3GId
 TO6L4fAsOCs4xUL81pdVQzWNfb/M3ghJH/ymQ8+sT6IKpwMSsXUX1EJ4J g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="18255298"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; d="scan'208";a="18255298"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 04:42:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="909628558"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; d="scan'208";a="909628558"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.217.160.82])
 ([10.217.160.82])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 04:42:42 -0800
Message-ID: <b5cb3489-34f9-4b86-9e46-a19b71ca9f2f@linux.intel.com>
Date: Tue, 6 Feb 2024 13:42:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] accel/ivpu fixes for 6.8-rc3
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com
References: <20240126122804.2169129-1-jacek.lawrynowicz@linux.intel.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240126122804.2169129-1-jacek.lawrynowicz@linux.intel.com>
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

Applied to drm-misc-fixes (except patch 4)

On 26.01.2024 13:27, Jacek Lawrynowicz wrote:
> A couple of small patches focused on improving driver stability.
> In addition d3hot_delay patch improves LNL inference latency.
> 
> Grzegorz Trzebiatowski (1):
>   accel/ivpu: Add job status for jobs aborted by the driver
> 
> Jacek Lawrynowicz (1):
>   accel/ivpu: Disable d3hot_delay on all NPU generations
> 
> Krystian Pradzynski (2):
>   accel/ivpu/40xx: Enable D0i3 message
>   accel/ivpu/40xx: Stop passing SKU boot parameters to FW
> 
> Wachowski, Karol (3):
>   accel/ivpu: Force snooping for MMU writes
>   accel/ivpu: Correct MMU queue size checking functions
>   accel/ivpu: Gracefully shutdown NPU before reset
> 
>  drivers/accel/ivpu/ivpu_drv.c     |   5 +-
>  drivers/accel/ivpu/ivpu_fw.c      |   1 -
>  drivers/accel/ivpu/ivpu_hw_37xx.c | 124 +++++++++++++++---------------
>  drivers/accel/ivpu/ivpu_hw_40xx.c |   7 +-
>  drivers/accel/ivpu/ivpu_job.c     |   4 +-
>  drivers/accel/ivpu/ivpu_mmu.c     |  36 +++++----
>  include/uapi/drm/ivpu_accel.h     |   1 +
>  7 files changed, 89 insertions(+), 89 deletions(-)
> 
> --
> 2.43.0
