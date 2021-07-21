Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD713D152B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 19:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357AA6E998;
	Wed, 21 Jul 2021 17:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B38B6E996;
 Wed, 21 Jul 2021 17:36:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="191758237"
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="191758237"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 10:36:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="576764852"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga001.fm.intel.com with ESMTP; 21 Jul 2021 10:36:51 -0700
Received: from [10.249.140.99] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.140.99])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 16LHanVY001973; Wed, 21 Jul 2021 18:36:50 +0100
Subject: Re: [Intel-gfx] [PATCH 07/16] drm/i915/guc/slpc: Enable slpc and add
 related H2G events
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210710012026.19705-1-vinay.belgaumkar@intel.com>
 <20210710012026.19705-8-vinay.belgaumkar@intel.com>
 <24627794-12b3-1d4a-2ee0-d6ef45be0b05@intel.com>
 <46aa5a21-c32e-9626-830a-43ff3fade57f@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <0aef5d78-71fa-d53a-d0da-7cc8f8d39841@intel.com>
Date: Wed, 21 Jul 2021 19:36:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <46aa5a21-c32e-9626-830a-43ff3fade57f@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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



On 15.07.2021 03:58, Belgaumkar, Vinay wrote:
> 
> 
> On 7/10/2021 10:37 AM, Michal Wajdeczko wrote:
>>
>>
>> On 10.07.2021 03:20, Vinay Belgaumkar wrote:
...
>>>   diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index e2644a05f298..3e76d4d5f7bb 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -2321,10 +2321,6 @@ void intel_guc_submission_enable(struct
>>> intel_guc *guc)
>>>     void intel_guc_submission_disable(struct intel_guc *guc)
>>>   {
>>> -    struct intel_gt *gt = guc_to_gt(guc);
>>> -
>>> -    GEM_BUG_ON(gt->awake); /* GT should be parked first */
>>
>> if not mistake, can you explain why it was removed ?
> 
> This was part of a different commit. The BUG_ON in
> disable_guc_submission was added with an assumption that it will be
> called only during driver unload and not expected to hold any GT PM
> references. Since this needs to be called from an error scenario during
> slpc enable, remove the BUG_ON. Do we need this as a separate commit?

yes, please

Michal

