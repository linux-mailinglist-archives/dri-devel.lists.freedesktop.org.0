Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F6D39B52C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 10:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934056E09C;
	Fri,  4 Jun 2021 08:49:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105956E09C;
 Fri,  4 Jun 2021 08:49:53 +0000 (UTC)
IronPort-SDR: BNj3294/b7LesPZYtfQuIIIOkdy6FAJtaZEYWa8v3r3YfTbYtqvP/8xne9w9QTDjfTjoJHZ7nA
 DsAPUc8hnhsQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="184622249"
X-IronPort-AV: E=Sophos;i="5.83,247,1616482800"; d="scan'208";a="184622249"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 01:49:53 -0700
IronPort-SDR: cauuXxE6ICEAKbXf7xJMOD3zSjjrU28JZ+C9Z8rHwOpCad5V79P0QpyJ7fFCRRDcjACrUIa6h6
 MGMzCAC31+8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,247,1616482800"; d="scan'208";a="633981087"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga006.fm.intel.com with ESMTP; 04 Jun 2021 01:49:52 -0700
Received: from [10.249.138.81] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.138.81])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 1548nou6008689; Fri, 4 Jun 2021 09:49:51 +0100
Subject: Re: [v3 PATCH 2/2] drm/i915/guc: Update sizes of CTB buffers
To: Daniel Vetter <daniel@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>
References: <YLlLlTdvaTGrNmzV@phenom.ffwll.local>
 <20210603230408.54856-1-matthew.brost@intel.com>
 <20210603230408.54856-2-matthew.brost@intel.com>
 <YLniNZjpBz6E24cK@phenom.ffwll.local>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <96c23512-1fa4-3bd4-f023-7eaea2a8738e@intel.com>
Date: Fri, 4 Jun 2021 10:49:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YLniNZjpBz6E24cK@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 04.06.2021 10:20, Daniel Vetter wrote:
> On Thu, Jun 03, 2021 at 04:04:08PM -0700, Matthew Brost wrote:
>> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>
>> Future GuC will require CTB buffers sizes to be multiple of 4K.
>> Make these changes now as this shouldn't impact us too much.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>> Cc: John Harrison <john.c.harrison@intel.com>
> 
> Assuming this was just rebased?
> 
>> ---
>>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 60 ++++++++++++-----------
>>  1 file changed, 32 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> index ec795d7c3a7d..8d1173032431 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> @@ -38,6 +38,32 @@ static inline struct drm_device *ct_to_drm(struct intel_guc_ct *ct)
>>  #define CT_PROBE_ERROR(_ct, _fmt, ...) \
>>  	i915_probe_error(ct_to_i915(ct), "CT: " _fmt, ##__VA_ARGS__)
>>  
>> +/**
>> + * DOC: CTB Blob
> 
> These are supposed to be pulled into the kerneldoc builds, but that's not
> happening in this patch?

true, but as you already noticed below, some of the docs are outdated,
so it is hard to connect fresh/cleanup docs with rest of the stale
documentation

we should first complete update of individual items before we can start
cleaning/refactoring master GuC kerneldoc section

> 
> Now I think the GuC docs in general are fairly outdated, so is the DOC
> review coming later, or is the DOC: header here simply cargo-culted :-)
> 
> If it's not coming later we need to do a JIRA to clean this all up and
> link all the new/changed kerneldoc into our GuC doc structure.

there are some pending patches that links these items, but task of
general update of the master GuC kerneldoc section likely must be added
to Matt's todo list (my focus was mainly on individual doc items, since
this was my secondary job ;)

Thanks,
Michal

> -Daniel
> 
>> + *
>> + * We allocate single blob to hold both CTB descriptors and buffers:
>> + *
>> + *      +--------+-----------------------------------------------+------+
>> + *      | offset | contents                                      | size |
>> + *      +========+===============================================+======+
>> + *      | 0x0000 | H2G `CTB Descriptor`_ (send)                  |      |
>> + *      +--------+-----------------------------------------------+  4K  |
>> + *      | 0x0800 | G2H `CTB Descriptor`_ (recv)                  |      |
>> + *      +--------+-----------------------------------------------+------+
>> + *      | 0x1000 | H2G `CT Buffer`_ (send)                       | n*4K |
>> + *      |        |                                               |      |
>> + *      +--------+-----------------------------------------------+------+
>> + *      | 0x1000 | G2H `CT Buffer`_ (recv)                       | m*4K |
>> + *      | + n*4K |                                               |      |
>> + *      +--------+-----------------------------------------------+------+
>> + *
>> + * Size of each `CT Buffer`_ must be multiple of 4K.
>> + * As we don't expect too many messages, for now use minimum sizes.
>> + */
>> +#define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
>> +#define CTB_H2G_BUFFER_SIZE	(SZ_4K)
>> +#define CTB_G2H_BUFFER_SIZE	(SZ_4K)
>> +
>>  struct ct_request {
>>  	struct list_head link;
>>  	u32 fence;
>> @@ -175,29 +201,7 @@ int intel_guc_ct_init(struct intel_guc_ct *ct)
>>  
>>  	GEM_BUG_ON(ct->vma);
>>  
>> -	/* We allocate 1 page to hold both descriptors and both buffers.
>> -	 *       ___________.....................
>> -	 *      |desc (SEND)|                   :
>> -	 *      |___________|                   PAGE/4
>> -	 *      :___________....................:
>> -	 *      |desc (RECV)|                   :
>> -	 *      |___________|                   PAGE/4
>> -	 *      :_______________________________:
>> -	 *      |cmds (SEND)                    |
>> -	 *      |                               PAGE/4
>> -	 *      |_______________________________|
>> -	 *      |cmds (RECV)                    |
>> -	 *      |                               PAGE/4
>> -	 *      |_______________________________|
>> -	 *
>> -	 * Each message can use a maximum of 32 dwords and we don't expect to
>> -	 * have more than 1 in flight at any time, so we have enough space.
>> -	 * Some logic further ahead will rely on the fact that there is only 1
>> -	 * page and that it is always mapped, so if the size is changed the
>> -	 * other code will need updating as well.
>> -	 */
>> -
>> -	blob_size = PAGE_SIZE;
>> +	blob_size = 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE + CTB_G2H_BUFFER_SIZE;
>>  	err = intel_guc_allocate_and_map_vma(guc, blob_size, &ct->vma, &blob);
>>  	if (unlikely(err)) {
>>  		CT_PROBE_ERROR(ct, "Failed to allocate %u for CTB data (%pe)\n",
>> @@ -209,17 +213,17 @@ int intel_guc_ct_init(struct intel_guc_ct *ct)
>>  
>>  	/* store pointers to desc and cmds for send ctb */
>>  	desc = blob;
>> -	cmds = blob + PAGE_SIZE / 2;
>> -	cmds_size = PAGE_SIZE / 4;
>> +	cmds = blob + 2 * CTB_DESC_SIZE;
>> +	cmds_size = CTB_H2G_BUFFER_SIZE;
>>  	CT_DEBUG(ct, "%s desc %#tx cmds %#tx size %u\n", "send",
>>  		 ptrdiff(desc, blob), ptrdiff(cmds, blob), cmds_size);
>>  
>>  	guc_ct_buffer_init(&ct->ctbs.send, desc, cmds, cmds_size);
>>  
>>  	/* store pointers to desc and cmds for recv ctb */
>> -	desc = blob + PAGE_SIZE / 4;
>> -	cmds = blob + PAGE_SIZE / 4 + PAGE_SIZE / 2;
>> -	cmds_size = PAGE_SIZE / 4;
>> +	desc = blob + CTB_DESC_SIZE;
>> +	cmds = blob + 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE;
>> +	cmds_size = CTB_G2H_BUFFER_SIZE;
>>  	CT_DEBUG(ct, "%s desc %#tx cmds %#tx size %u\n", "recv",
>>  		 ptrdiff(desc, blob), ptrdiff(cmds, blob), cmds_size);
>>  
>> -- 
>> 2.28.0
>>
> 
