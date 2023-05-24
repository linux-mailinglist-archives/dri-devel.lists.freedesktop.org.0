Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6134B70F689
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 14:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005EF10E03D;
	Wed, 24 May 2023 12:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39B610E03D;
 Wed, 24 May 2023 12:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684931674; x=1716467674;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GSQaPQHFtBaRb09XalO8MiTtfvcAIbB5nBmwnQa0cGY=;
 b=RYUnct5cQdo6MjlVVkt6RM4ORgr2Fux+41i1zHmE5uB+rzWzIJcdL4LB
 KallnLCSajfCHSZDbWqssKAcJG49J5pf8XEL6crktURZhx0n8fsRW3g6F
 3Np9whHHaCruG6BWV7X/nk13j4xP06X2svVYG3A+/KnJG/YcHL5HRu7L+
 eRu/l6pX3a1mBrLaCjlOuVODKhRAQyo2u9tqdBlSHo5+IoZ4BCN45k6+U
 yZnqdNKqPQQegDzxUbYaUAZ1wFXa4ajRqnUnSMecqtANtrsbhDd/3+hfd
 ZvZlZi9TfBh5Stn6Me2M/nY0dyf6stuoApoaMp0JjbkrOBwcK++SMgz71 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="343009959"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="343009959"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 05:34:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="816560384"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="816560384"
Received: from bmhacket-mobl.ger.corp.intel.com (HELO [10.213.218.245])
 ([10.213.218.245])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 05:34:32 -0700
Message-ID: <648da5f9-48e0-7f28-7cd8-0f0bb1a0236a@linux.intel.com>
Date: Wed, 24 May 2023 13:34:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [PATCH v10 0/2] drm/i915: Allow user to set cache at
 BO creation
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230519051103.3404990-1-fei.yang@intel.com>
 <ZGx7Quf+ArHnXOR0@ashyti-mobl2.lan>
 <37a0e8fc-efbc-973f-f163-235b9482f21c@linux.intel.com>
 <ZG4Az4fWMsxL5j7w@ashyti-mobl2.lan>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZG4Az4fWMsxL5j7w@ashyti-mobl2.lan>
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
Cc: fei.yang@intel.com, Jordan Justen <jordan.l.justen@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 24/05/2023 13:19, Andi Shyti wrote:
> Hi Tvrtko,
> 
>>> finally... pushed in drm-intel-gt-next! :)
>>
>> I had to revert this (uapi commit only) by force pushing, luckily it was the
>> top commit.
> 
> OK, sorry!
> 
>> 1)
>> IGT is not merged yet.
> 
> if igt is merged without the kernel it would fail, though.

Ideally it should skip, as with any new ABI testing. That way we can 
nicely test the older kernels with the same IGT code base (like 
drm-intel-fixes tree). So something like 
igt_require(has_pat_ext_something) should be doable. Or just igt_skip if 
most basic gem_create fails with the correct error code.

> 
>> 2)
>> The tools/include/uapi/drm/i915_drm.h part of the patch was not removed.
> 
> Will follow up on these two points.

Thank you!

Regards,

Tvrtko
