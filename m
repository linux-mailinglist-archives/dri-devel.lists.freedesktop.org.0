Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B59B2B93C6
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 14:42:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE9796E51C;
	Thu, 19 Nov 2020 13:42:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D18296E51C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 13:42:11 +0000 (UTC)
IronPort-SDR: lcE/3HFPvuuki1Lmj5LqI1eJPISEHKQnm6lz0lvz9aJbELSEKdOozfI24SnlbrPfRDOCqVWNsJ
 4adDNSM2Nbwg==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="189374783"
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; d="scan'208";a="189374783"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2020 05:42:11 -0800
IronPort-SDR: fwTNlXmJQBsizdYoaa6K68LmpBb/OB6MA2EE7BgnGkZyR9gkaHhdIRE1qkCebytILVj3xQ4WM9
 eIB3LjycWopg==
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; d="scan'208";a="534779463"
Received: from staskuzm-mobl1.ger.corp.intel.com (HELO [10.249.92.37])
 ([10.249.92.37])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2020 05:42:09 -0800
Subject: Re: [PATCH] intel: Do not assert on unknown chips in
 drm_intel_decode_context_alloc
To: Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org
References: <20201118163601.958254-1-tvrtko.ursulin@linux.intel.com>
 <160571907017.19853.2138891452982731448@build.alporthouse.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <b8438d8f-bc6b-921d-adb2-cd6e25d70bdb@linux.intel.com>
Date: Thu, 19 Nov 2020 13:42:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <160571907017.19853.2138891452982731448@build.alporthouse.com>
Content-Language: en-US
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 18/11/2020 17:04, Chris Wilson wrote:
> Quoting Tvrtko Ursulin (2020-11-18 16:36:01)
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> There is this long standing nit of igt/tools/intel_error_decode asserting
>> when you feed it an error state from a GPU the local libdrm does not know
>> of.
>>
>> To fix this I need a tweak in drm_intel_decode_context_alloc to make it
>> not assert but just return NULL (which seems an already possible return
>> value).
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Good riddance,
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>

Thanks, now how can push to drm and is there some testing to be 
triggered before, or after?

Regards,

Tvrtko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
