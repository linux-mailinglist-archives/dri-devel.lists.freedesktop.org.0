Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5A65AD7B2
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 18:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFE210E447;
	Mon,  5 Sep 2022 16:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9F910E447
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 16:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662395984; x=1693931984;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=UYJEY/SQG8QDZBOYJJY4nO80O+kbgOS3Lid6Gc+CEbQ=;
 b=BYApqGDERhmgvnZzi9qnGyWk9VVBll9nTDMypCM77FaphwpTT8EBf6Vh
 KhwCG+WTblBJvfs4T/Vb8Vanl/WH2D1fuz1BwbrRO7GIg0VgLHoGW2ePv
 dIBW7GUX5ZNvuWFaQPY65QjGQPzrG8fAZeyvHO7xUe73HZ1xh1f7Kx5i+
 3bRY3e5XupQVuInqFb7bMnK3xFpeOhTTZDjrolSIARq2uTHGeYydd+3dj
 9BaCLvKV9FsS2S+zXBAUzeGHK4dsBGcvsdLwao0kp5NXo+wtYBdZaHOCd
 wiNLnAamelaz0MgGF8RiCqpSmumjCjfTeXkslEWv1ZTGpHZZVsujgeTx5 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="276817866"
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; d="scan'208";a="276817866"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2022 09:39:43 -0700
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; d="scan'208";a="675346621"
Received: from hpigot-mobl1.ger.corp.intel.com (HELO [10.213.237.107])
 ([10.213.237.107])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2022 09:39:40 -0700
Message-ID: <3c702549-75f4-c640-9f9c-37d7fcbb1645@linux.intel.com>
Date: Mon, 5 Sep 2022 17:39:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/4] dma-buf: Check status of enable-signaling bit on debug
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>, andrey.grodzovsky@amd.com,
 shashank.sharma@amd.com, amaranath.somalapuram@amd.com,
 Arunpravin.PaneerSelvam@amd.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, airlied@linux.ie, daniel@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20220905105653.13670-1-Arvind.Yadav@amd.com>
 <20220905105653.13670-2-Arvind.Yadav@amd.com>
 <0038fcff-35f1-87e3-aa26-cdd104a13628@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <0038fcff-35f1-87e3-aa26-cdd104a13628@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 05/09/2022 12:21, Christian König wrote:
> Am 05.09.22 um 12:56 schrieb Arvind Yadav:
>> The core DMA-buf framework needs to enable signaling
>> before the fence is signaled. The core DMA-buf framework
>> can forget to enable signaling before the fence is signaled.
>> To avoid this scenario on the debug kernel, check the
>> DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT status bit before checking
>> the signaling bit status to confirm that enable_signaling
>> is enabled.
> 
> You might want to put this patch at the end of the series to avoid 
> breaking the kernel in between.
> 
>>
>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>> ---
>>   include/linux/dma-fence.h | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>> index 775cdc0b4f24..60c0e935c0b5 100644
>> --- a/include/linux/dma-fence.h
>> +++ b/include/linux/dma-fence.h
>> @@ -428,6 +428,11 @@ dma_fence_is_signaled_locked(struct dma_fence 
>> *fence)
>>   static inline bool
>>   dma_fence_is_signaled(struct dma_fence *fence)
>>   {
>> +#ifdef CONFIG_DEBUG_FS
> 
> CONFIG_DEBUG_FS is certainly wrong, probably better to check for 
> CONFIG_DEBUG_WW_MUTEX_SLOWPATH here.
> 
> Apart from that looks good to me,

What's the full story in this series - I'm afraid the cover letter does not make it clear to a casual reader like myself? Where does the difference between debug and non debug kernel come from?

And how do the proposed changes relate to the following kerneldoc excerpt:

	 * Since many implementations can call dma_fence_signal() even when before
	 * @enable_signaling has been called there's a race window, where the
	 * dma_fence_signal() might result in the final fence reference being
	 * released and its memory freed. To avoid this, implementations of this
	 * callback should grab their own reference using dma_fence_get(), to be
	 * released when the fence is signalled (through e.g. the interrupt
	 * handler).
	 *
	 * This callback is optional. If this callback is not present, then the
	 * driver must always have signaling enabled.

Is it now an error, or should be impossible condition, for "is signaled" to return true _unless_ signaling has been enabled?

If the statement (in a later patch) is signalling should always be explicitly enabled by the callers of dma_fence_add_callback, then what about the existing call to __dma_fence_enable_signaling from dma_fence_add_callback?

Or if the rules are changing shouldn't kerneldoc be updated as part of the series?

Regards,

Tvrtko

> Christian.
> 
>> +    if (!test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags))
>> +        return false;
>> +#endif
>> +
>>       if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>           return true;
> 
