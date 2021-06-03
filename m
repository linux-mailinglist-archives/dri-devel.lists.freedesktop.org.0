Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C84399B01
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 08:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBFFC6F3F1;
	Thu,  3 Jun 2021 06:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B576E0C1;
 Thu,  3 Jun 2021 06:50:50 +0000 (UTC)
IronPort-SDR: Mfdty32Ug2ZzyOkkprZHKsYkM1MRWh4yWBv/v1DwTFH9WaYJtXU37jxr6AyRK1lMX3k9QoEd3A
 9LalA4OS6K3A==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="183659089"
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="183659089"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 23:50:50 -0700
IronPort-SDR: vR8nVvCel3CvOx4zZtYEHj/v6cbbeM9EdnU1GVv0oLakefu8f7LhZZDyq0L71B6E7bSmTLwPEW
 rBlZ2fyk7+Dw==
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="467852375"
Received: from slindbla-mobl1.ger.corp.intel.com (HELO [10.249.254.57])
 ([10.249.254.57])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 23:50:46 -0700
Subject: Re: [Intel-gfx] Merging TTM branches through the Intel tree?
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <a29eaef9-2457-1393-6757-40956811daf8@linux.intel.com>
 <a6965639-acf6-b5f5-482c-2715e7fa69d4@amd.com>
 <b4c18e45-98c9-ce7f-b22c-c00c795844c2@shipmail.org>
 <baf4f828-76c8-6b47-5bba-9b9c8e7b307b@amd.com>
 <YLfQplT8H6PdCCLX@phenom.ffwll.local>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <c50fa98f-3735-fe04-d3f9-8a7a08a7562e@linux.intel.com>
Date: Thu, 3 Jun 2021 08:50:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YLfQplT8H6PdCCLX@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/2/21 8:40 PM, Daniel Vetter wrote:
> On Wed, Jun 02, 2021 at 11:48:41AM +0200, Christian König wrote:
>> Am 02.06.21 um 11:16 schrieb Thomas Hellström (Intel):
>>> On 6/2/21 10:32 AM, Christian König wrote:
>>>> Uff I'm just waiting for feedback from Philip to merge a large patch
>>>> set for TTM through drm-misc-next.
>>>>
>>>> I'm pretty sure we will run into merge conflicts if you try to push
>>>> your changes through the Intel tree.
>>>>
>>>> Christian.
>>> OK, so what would be the best approach here?, Adding the TTM patches to
>>> drm-misc-next when your set has landed?
>> I think I will send out out my set to Matthew once more for review, then
>> push the common TTM stuff to drm-misc-next as much as possible.
>>
>> Then you should be able to land your stuff to drm-misc-next and rebase on
>> the end result.
>>
>> Just need to note to David that drm-misc-next should be merged to drm-next
>> before the Intel patches depending on that stuff land as well.
> Other option (because the backmerges tend to be slow) is a topic branch,
> and we just eat/resolve the conflicts in both drm-misc-next and
> drm-intel-gt-next in the merge commit. If it's not too bad (I haven't
> looked at what exactly we need for the i915 side from ttm in detail).
>
> But also often figuring out the topic branch logistics takes longer than
> just merging to drm-misc-next as the patches get ready.
> -Daniel

Daniel: So the thing we need to get into TTM is the iterator-based 
move_memcpy which is more adaptable than the current one and needed to 
support non-linear lmem buffers, some bug-fixes and minor changes to be 
able to keep our short-term-pinning while on the LRU. A necessary evil.

Christian: it looks like you have landed some TTM changes already, in 
particular the &bo->mem -> bo->resource change which is the main 
conflict I think. Is the 10 patches self-allocation series the main 
remaining part? That will probably cause some conflicts with already 
pushed i915 TTM setup code, but otherwise will not conflict with the 
rest of the TTM code I think, which should make it possible to bring in 
our TTM changes after conflict resolution with what you've already 
pushed. The memcpy code is pretty self-contained.

/Thomas


