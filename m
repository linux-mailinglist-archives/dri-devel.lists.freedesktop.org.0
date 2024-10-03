Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF54898EBD4
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 10:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E5510E7CF;
	Thu,  3 Oct 2024 08:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k3s32xm2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A341A10E7C0
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 08:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727945122; x=1759481122;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=oisODV5rKAVavXbf/PkTzLfH8IHC60RXmPNqmsN3BG8=;
 b=k3s32xm2VipFUtjJyffPM1PJDif66TxblLOK1H5OsmpJ/RK44YMMf4gd
 qWYQfT9CRIrKT8RR9kKVwmxIC21SV6FnJZ/+uTbiDlQTepB/1VSoAqgF7
 uoG3IriFfN8KgxTLKVtxAjmIIDJarAlJjtE4PfXEZBUoWm6QbilWCTChF
 +UAP1UcRChA+39jGTEVQwo1Mc2eTJjJCva9LXVBHfg6p01Ew/2vP1YrtV
 1txm95Lx73tpaoobKQuaN1GYQNzxwlEvNkn6f2T9VmEIJ3iP97tNxj7bI
 /OoJrD+fTcueKvlm66WKDKgTS7mDu0N029FtyRQt4xTM1HYZBNCJ/rLvy w==;
X-CSE-ConnectionGUID: 660autYnRlWyM1jcLCK27w==
X-CSE-MsgGUID: Y+H34H9qSfudjA026enwow==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="44657562"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="44657562"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 01:45:22 -0700
X-CSE-ConnectionGUID: TF/hLKOHTFyG58fLBJbQoQ==
X-CSE-MsgGUID: 0J0xUhCxRyKTI6a5zb+Ydg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="74135136"
Received: from jpdavis-mobl1.ger.corp.intel.com (HELO [10.246.18.68])
 ([10.246.18.68])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 01:45:21 -0700
Message-ID: <bdf507b6-855b-4c34-afcc-e09aecbdfd66@linux.intel.com>
Date: Thu, 3 Oct 2024 10:45:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/31] accel/ivpu: Fixes for 6.12-rc1
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com
References: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
 <6f18b890-2fa2-4c81-ab4e-2816d0ce98d9@linux.intel.com>
 <9b55ce32-a53d-4345-ad7e-de9e3dd74996@suse.de>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <9b55ce32-a53d-4345-ad7e-de9e3dd74996@suse.de>
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

Hi,

On 10/2/2024 4:51 PM, Thomas Zimmermann wrote:
> Hi
> 
> Am 02.10.24 um 15:26 schrieb Jacek Lawrynowicz:
>> Applied to drm-misc-fixes
> 
> And removed from drm-misc-fixes.

:(

> The -misc-fixes branch is for fixing bugs that either regressed working code or to resolve serious bugs that affects upstream users. It is NOT a dumping ground for all kinds of things you want to get into upstream quickly. Your review process should have found these issues already.

Sorry about this. I guess I allowed my upstreaming backlog to grow beyond sensible size.
I will apply small subset of these patches to -fixes and the rest to -next.

Regards,
Jacek
