Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Cw9MlTvp2mWlwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 09:37:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C11E1FCB90
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 09:37:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADFB10E975;
	Wed,  4 Mar 2026 08:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="UgQh3D8e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC5910E975;
 Wed,  4 Mar 2026 08:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1772613454;
 bh=GH9AVx0uuEObyskfxLHByM4awD5u91sTITRcI7KQ5w4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UgQh3D8e05kcJpPsHwqOWln5jhQXujtZmWCg6xbCAtC+I08EcA9HMFmVcfvIsM0HQ
 FwUeXoiR+09JW5/+IBA5+liOkN9Mh7LNVRNmfvXn6eZAfnXLUzA7DxusJKXh0bCXaY
 5D0wF0Yo3wTt50ZF0mEWAFk8JSfgllVTQj1/2/OHABe3ecGC6ANS9rfjRXYr8j9q0/
 0BmsegaCCtBxvHv3ZyMsmGXEIt+05YbEJnd/kyGRa33vS5kAR7wXWvEbK8F0+nP+rZ
 adEdQQi/Bipl+mrJoOmgzBAXvhpg2u8stDPvucX5hs8S1ZINrtYxgYcEnqBHbym/X2
 p7gH1trIEDAAA==
Message-ID: <5b36b6eb-c93b-42fb-9299-cb396be1a49e@lankhorst.se>
Date: Wed, 4 Mar 2026 09:37:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm/ttm/tests: Fix build failure on PREEMPT_RT
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 lkp <lkp@intel.com>
References: <20260226151228.256003-1-dev@lankhorst.se>
 <d5a0a62bd8de9ce035efa1edf95c8332da0ec6ea.camel@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <d5a0a62bd8de9ce035efa1edf95c8332da0ec6ea.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
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
X-Rspamd-Queue-Id: 4C11E1FCB90
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[lankhorst.se,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[lankhorst.se:s=default];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lankhorst.se:+];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[dev@lankhorst.se,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lankhorst.se:dkim,lankhorst.se:email,lankhorst.se:mid]
X-Rspamd-Action: no action

Hey,

Den 2026-03-04 kl. 06:54, skrev Hogander, Jouni:
> On Thu, 2026-02-26 at 16:12 +0100, Maarten Lankhorst wrote:
>> Fix a compile error in the kunit tests when CONFIG_PREEMPT_RT is
>> enabled, and the normal mutex is converted into a rtmutex.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes:
>> https://lore.kernel.org/oe-kbuild-all/202602261547.3bM6yVAS-lkp@intel.com/
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>> ---
>>  drivers/gpu/drm/ttm/tests/ttm_bo_test.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>> b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>> index d468f83220720..2ba5ddf2b1c9e 100644
>> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>> @@ -222,13 +222,13 @@ static void ttm_bo_reserve_interrupted(struct
>> kunit *test)
>>  		KUNIT_FAIL(test, "Couldn't create ttm bo reserve
>> task\n");
>>  
>>  	/* Take a lock so the threaded reserve has to wait */
>> -	mutex_lock(&bo->base.resv->lock.base);
>> +	ww_mutex_lock(&bo->base.resv->lock, NULL);
> 
> There is this comment in include/linux/dma-resv.h:dma_resv:lock :
> 
> * Update side lock. Don't use directly, instead use the wrapper
> * functions like dma_resv_lock() and dma_resv_unlock().
> 
> BR,
> Jouni Högander
> 
>>  
>>  	wake_up_process(task);
>>  	msleep(20);
>>  	err = kthread_stop(task);
>>  
>> -	mutex_unlock(&bo->base.resv->lock.base);
>> +	ww_mutex_unlock(&bo->base.resv->lock);
>>  
>>  	KUNIT_ASSERT_EQ(test, err, -ERESTARTSYS);
>>  }
> 


Well spotted, no reason not to use dma_resv_lock/unlock() here.

Will resubmit!

Kind regards,
Maarten Lankhorst
