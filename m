Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF95A26C85
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 08:17:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B10B810E5A7;
	Tue,  4 Feb 2025 07:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mS5YJM/n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14DE610E5A2;
 Tue,  4 Feb 2025 07:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738653470; x=1770189470;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jyWdVfy2p1IZDGp6hXjuoxbGOVOnCRTFB3YrZ1i6NcI=;
 b=mS5YJM/nkrYRBgsN5REAFYOFq9jv4lmuPK+BY7qSx9Rw+9GHux9Hc2Bn
 pYxDMXJDrHIIssK2o/uiqwMTejniezUuAxVBfOExEjHR+v7OB5UdAWI7m
 YejnBH2hVvk/+olPpQHiJItI0hlqthm0bOkLvn+DvQUFm9fdrZ5QeYN9b
 AfymYHZ6qQ5JfzldHeCNb0P5a5xbuWBvaNYHDVVaFYHCs5fKjE1YXsixy
 DrHmTRdCuKq/2sB2gifhFr1a2iFO8L6IPWEeeDuh5RZdWG7c5jl/w/fh+
 or2aJM+z3w8aJMyY77XS5mMQ039VL5phEzIy7XSqhA5bYogCHEoo0i0KU A==;
X-CSE-ConnectionGUID: t8JH3O//Q7KDdwce176Jwg==
X-CSE-MsgGUID: 50beYW4PQqyCcM+WoCCcnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50586359"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50586359"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 23:17:49 -0800
X-CSE-ConnectionGUID: einvw9BrTHK2dYq5zxJ9Tw==
X-CSE-MsgGUID: IrLniI/cTQOuVbnYhO7AIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114554142"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa003.fm.intel.com with ESMTP; 03 Feb 2025 23:17:48 -0800
Received: from [10.245.113.167] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.113.167])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 08AD327BAF;
 Tue,  4 Feb 2025 07:17:46 +0000 (GMT)
Message-ID: <6088fdcf-0100-436c-9a55-86611fafc9fa@intel.com>
Date: Tue, 4 Feb 2025 08:17:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/i915/slpc: Add sysfs for SLPC power profiles
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
References: <20250117215753.749906-1-vinay.belgaumkar@intel.com>
 <4f62fe21-2641-40ba-ace4-1429389068f5@intel.com> <Z4-ySdQ7sCymXRMx@intel.com>
 <Z6FKQOE4nc_kSxYC@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <Z6FKQOE4nc_kSxYC@intel.com>
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



On 03.02.2025 23:59, Rodrigo Vivi wrote:
> On Tue, Jan 21, 2025 at 09:42:17AM -0500, Rodrigo Vivi wrote:
>> On Sat, Jan 18, 2025 at 06:47:27PM +0100, Michal Wajdeczko wrote:
>>>
>>>
>>> On 17.01.2025 22:57, Vinay Belgaumkar wrote:
>>>> Default SLPC power profile is Base(0). Power Saving mode(1)
>>>> has conservative up/down thresholds and is suitable for use with
>>>> apps that typically need to be power efficient.
>>>>
>>>> Selected power profile will be displayed in this format-
>>>>
>>>> $ cat slpc_power_profile
>>>>
>>>>   [base]    power_saving
>>>>
>>>> $ echo power_saving > slpc_power_profile
>>>> $ cat slpc_power_profile
>>>>
>>>>   base    [power_saving]
>>>>
>>>
>>> is that output aligned with the sysfs rules? from [1]
>>
>> Please help me to understand why that is against the rule?
>>
>> It is still ascii and it is one value per file.
>>
>> How is this different from:
>>
>> $ cat /sys/power/mem_sleep
>> [s2idle] shallow deep
>>
>> ?!
> 
> Hi Michal,
> 
> do you still see a problem here?
> Anything I might be missing?

Hi,

Initially it was looking for me as violating the "fancy formatting"
rule, but if this actually follows other _power_ attributes then I have
no objections.

> 
> I'd like to get this patch merged soon

acked and sorry for late response

Michal

> 
> Thanks,
> Rodrigo.
> 
>>
>>>
>>> "Attributes should be ASCII text files, preferably with only one value
>>> per file. It is noted that it may not be efficient to contain only one
>>> value per file, so it is socially acceptable to express an array of
>>> values of the same type.
>>>
>>> Mixing types, expressing multiple lines of data, and doing fancy
>>> formatting of data is heavily frowned upon. Doing these things may get
>>> you publicly humiliated and your code rewritten without not"
>>>
>>>
>>> [1] https://www.kernel.org/doc/html/latest/filesystems/sysfs.html#attributes
>>>

