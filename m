Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B63B539E799
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 21:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FAF56E52A;
	Mon,  7 Jun 2021 19:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884966E52A;
 Mon,  7 Jun 2021 19:39:02 +0000 (UTC)
IronPort-SDR: JNdERZApqSAYFtEPCNwA10CiERfm4VZAbzTiaFD3WKzHfJCIauxvDTsSjqC03eUTe4SGdIxKPD
 QdZqt7Ja0WUw==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="204509313"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="204509313"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 12:39:00 -0700
IronPort-SDR: MHDQjhALUOg8aUTlVQtd4TllVva7mDyp1aXGdRpbudS3VFBMqv1C3KzyGHD8B4HJhPAkJKZ/yt
 rsXDsaQdPBgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="469214094"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga004.fm.intel.com with ESMTP; 07 Jun 2021 12:39:00 -0700
Received: from [10.249.152.173] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.152.173])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 157JcwmY032391; Mon, 7 Jun 2021 20:38:59 +0100
Subject: Re: [Intel-gfx] [PATCH 09/13] drm/i915/doc: Include GuC ABI
 documentation
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210607180356.165785-1-matthew.brost@intel.com>
 <20210607180356.165785-10-matthew.brost@intel.com>
 <20210607174550.GA14577@sdutt-i7>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <46b24580-493d-7bee-09af-5996b886c6d4@intel.com>
Date: Mon, 7 Jun 2021 21:38:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210607174550.GA14577@sdutt-i7>
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



On 07.06.2021 19:45, Matthew Brost wrote:
> On Mon, Jun 07, 2021 at 11:03:51AM -0700, Matthew Brost wrote:
>> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>
>> GuC ABI documentation is now ready to be included in i915.rst
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> Michal - I noticed while putting this series together that there is
> kernel doc in intel_guc_ct.* but this isn't inclued in i915.rst. Do you
> think we should add the those here or in a new section (e.g. GuC CTBs)?
> 
> Let me know what you think and I can fix this up before this gets
> merged.

What's in intel_guc_ct.* is implementation detail, that should be placed
in separate section, while this patch adds pure ABI definitions that
deserve its own dedicated section.

Btw, this patch does not need to be squashed with others, as it is about
updating .rst only and is not breaking anything. Same for patch 1/13
that introduces new definitions in new .h file.

Michal

> 
> With that, for this patch:
> 
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
>> ---
>>  Documentation/gpu/i915.rst | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
>> index 42ce0196930a..c7846b1d9293 100644
>> --- a/Documentation/gpu/i915.rst
>> +++ b/Documentation/gpu/i915.rst
>> @@ -518,6 +518,14 @@ GuC-based command submission
>>  .. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>     :doc: GuC-based command submission
>>  
>> +GuC ABI
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
>> +.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
>> +.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
>> +.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
>> +
>>  HuC
>>  ---
>>  .. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> -- 
>> 2.28.0
>>
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> 
