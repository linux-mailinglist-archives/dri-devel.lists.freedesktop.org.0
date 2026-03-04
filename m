Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHv5IIX6p2mtmwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 10:25:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 072701FD897
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 10:25:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8443510E1BF;
	Wed,  4 Mar 2026 09:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="W3eP6LgN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8403510E1BE;
 Wed,  4 Mar 2026 09:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1772616320;
 bh=/40XvtT+BxKnrYkUa8lYXVQal1PyHUZGLbHPaEdMN/0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=W3eP6LgN4+gYF7z3TCkdklK7qtpnbpBOeXO2UUKYiDtf7HIQxTPEcIsTcs9Zi+6QQ
 znC2v5CQKQJO29OMIPh0e7tFxw6rLNHLL2IYIeMSa8FGkZX4C50P39v4bGjXfyAQ5T
 CbKjMYqDRh6rBqM2Bh20kd0P6BaHgb6FugxGOKBVFYsyMzA/6YNn2/Jh10uZIqP2gf
 SM4QuExl9deiN5E9ByA+IxCtHMhGsCG6D/te08kddLvu/LOkS+eZiYyKvxtVlXkHyS
 UdsPajwNuFE8jKK+SQHQI6cR7K9MGY1Q62a+AgpZ5vAqgcT9VJcCqDIim/xZcw5HQG
 GShZB7AMFokbw==
Message-ID: <0d69a3a9-3656-4471-a075-85b3090c585f@lankhorst.se>
Date: Wed, 4 Mar 2026 10:25:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/ttm/tests: Fix build failure on PREEMPT_RT
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 lkp <lkp@intel.com>
References: <20260304085616.1216961-1-dev@lankhorst.se>
 <d98e78d4b24b8b18db6a8d82d52ebf8f91c6fbfb.camel@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <d98e78d4b24b8b18db6a8d82d52ebf8f91c6fbfb.camel@intel.com>
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
X-Rspamd-Queue-Id: 072701FD897
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[lankhorst.se,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[lankhorst.se:s=default];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[lankhorst.se:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dev@lankhorst.se,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:email]
X-Rspamd-Action: no action

Hey,


Den 2026-03-04 kl. 09:58, skrev Hogander, Jouni:
> On Wed, 2026-03-04 at 09:56 +0100, Maarten Lankhorst wrote:
>> Fix a compile error in the kunit tests when CONFIG_PREEMPT_RT is
>> enabled, and the normal mutex is converted into a rtmutex.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes:
>> https://lore.kernel.org/oe-kbuild-all/202602261547.3bM6yVAS-lkp@intel.com/
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> 
> Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
Thanks, tested if UML was still passing and it does. 

./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/ttm/tests/.kunitconfig
....
[10:06:16] [PASSED] ttm_bo_reserve_interrupted

Will wait for CI kunit results and then push.

> 
>> ---
>> Changes since v1:
>> - Use the correct locking primitive (Jouni)
>>
>>  drivers/gpu/drm/ttm/tests/ttm_bo_test.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>> b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>> index d468f83220720..f3103307b5df9 100644
>> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>> @@ -222,13 +222,13 @@ static void ttm_bo_reserve_interrupted(struct
>> kunit *test)
>>  		KUNIT_FAIL(test, "Couldn't create ttm bo reserve
>> task\n");
>>  
>>  	/* Take a lock so the threaded reserve has to wait */
>> -	mutex_lock(&bo->base.resv->lock.base);
>> +	dma_resv_lock(bo->base.resv, NULL);
>>  
>>  	wake_up_process(task);
>>  	msleep(20);
>>  	err = kthread_stop(task);
>>  
>> -	mutex_unlock(&bo->base.resv->lock.base);
>> +	dma_resv_unlock(bo->base.resv);
>>  
>>  	KUNIT_ASSERT_EQ(test, err, -ERESTARTSYS);
>>  }
> 

