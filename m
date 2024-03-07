Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6804F874A11
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 09:46:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BAB1113706;
	Thu,  7 Mar 2024 08:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n2M+cFHT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B2E113706
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 08:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709801215; x=1741337215;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RVHGaslFoxUgHdn/3wfhS7KGkdkPaqAECDt56q1V+IM=;
 b=n2M+cFHTF/whahjZ9Xt46rU0neC4lv65OvRTu4VYZ/gfM+aZBw6h9dvF
 vJ9f4dqk/4bluEtKqn0o5Jzz4Ls9tVq2f/iGbhxY+wiIVPBkdGb6T58Hk
 fRpofJz9SbHZSk0Faj0Stw7xurcXnslXwyT02abLrQiHau5eIKlppAHOx
 n65ohAWdRSQW1HttEXH+ELfUAghItNkvZy1lUvEgpucR3xJcOR9dMkUeQ
 vAJN7/gwEPxsE42iLFTuufQu3BdLMTuIB3nmmXBzmRGjmrS7J4Pke7maL
 Z+yI2BK3Ag5LvkDCoojniDp96bS7bqOm9N8Dmv9848EMDT5tNKB4qirYX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4341089"
X-IronPort-AV: E=Sophos;i="6.06,211,1705392000"; 
   d="scan'208";a="4341089"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 00:46:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,211,1705392000"; 
   d="scan'208";a="9972207"
Received: from tczaczka-mobl3.ger.corp.intel.com (HELO [10.249.155.146])
 ([10.249.155.146])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 00:46:52 -0800
Message-ID: <51b5ec99-7af3-48b0-a5d5-b6da1b0e03a7@intel.com>
Date: Thu, 7 Mar 2024 08:46:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tests/buddy: fix print format
Content-Language: en-GB
To: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20240229095225.242795-2-matthew.auld@intel.com>
 <170980023565.810165.12599955029858883600.b4-ty@kernel.org>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <170980023565.810165.12599955029858883600.b4-ty@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/03/2024 08:30, Maxime Ripard wrote:
> On Thu, 29 Feb 2024 09:52:26 +0000, Matthew Auld wrote:
>> This will report a build warning once we have: 806cb2270237 ("kunit:
>> Annotate _MSG assertion variants with gnu printf specifiers").
>>
>>
> 
> Applied to drm/drm-misc (drm-misc-fixes).

Thanks.

> 
> Thanks!
> Maxime
> 
