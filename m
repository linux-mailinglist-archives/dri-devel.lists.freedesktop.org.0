Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE4EA255FE
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 10:38:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F9910E45F;
	Mon,  3 Feb 2025 09:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M21auXdg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433EB10E45F
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 09:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738575480; x=1770111480;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XMrkS04EHi+iM5+AhSCOoMkGMfYL5RQ/i1H+lSyreQ0=;
 b=M21auXdgQcuy0/1xAtJTHJ4VeaOn7DBxXS1o+xOnuhei5+jssIizFspH
 qe2gfG0hGjH8JShO8WBUpwMIwOEWqg+zDS1HHhQVSatdq+F91yFX4vqxf
 2sx0fc1IdzwPwg4i/V6U+sA51Uv6NnYCjgKyut5wLTgPxnhIrZKf7AVZs
 82XdpQwKIvvDZLbtxgz1mXJJihMJCOVVIHiaYIJq/O4BDAuYP74P3aGWF
 66vIB1en68Ok0MvvyWdN5AZnwFH9w2MtJrwU6+e3kZcE+WY/WfRJJDJUC
 pUbhn92A8eJOAJDkX9O15LVb7nnUDGG+baxtGMjkh2uJh18+ejqRgkRy/ A==;
X-CSE-ConnectionGUID: oVL3k3wqQS2YglXpSxQxbw==
X-CSE-MsgGUID: p6TPTeXNQjGQ12rTheMuiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="49661996"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="49661996"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 01:37:57 -0800
X-CSE-ConnectionGUID: pOSu+zP1SWSx9H4t7YNEUA==
X-CSE-MsgGUID: O+5cOs55QZmRS4DiS2VsYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114259728"
Received: from jbolejkx-mobl.ger.corp.intel.com (HELO [10.245.114.74])
 ([10.245.114.74])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 01:37:55 -0800
Message-ID: <a4e43152-2ba4-4208-95f3-fa86eaa136ac@linux.intel.com>
Date: Mon, 3 Feb 2025 10:37:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] accel/ivpu: Fixes for 6.14
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 maciej.falkowski@linux.intel.com
References: <20250129124009.1039982-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250129124009.1039982-1-jacek.lawrynowicz@linux.intel.com>
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

On 1/29/2025 1:40 PM, Jacek Lawrynowicz wrote:
> Stability fixes focused around power management and error handling.
> 
> Jacek Lawrynowicz (3):
>   accel/ivpu: Fix error handling in ivpu_boot()
>   accel/ivpu: Clear runtime_error after pm_runtime_resume_and_get()
>     fails
>   accel/ivpu: Fix error handling in recovery/reset
> 
>  drivers/accel/ivpu/ivpu_drv.c |  8 +++-
>  drivers/accel/ivpu/ivpu_pm.c  | 84 ++++++++++++++++++++---------------
>  2 files changed, 53 insertions(+), 39 deletions(-)
> 
> --
> 2.45.1

