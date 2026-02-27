Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELk6FY+woWmMvgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 15:56:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA7B1B9519
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 15:56:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B8510EBAD;
	Fri, 27 Feb 2026 14:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="hf85UrWi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A2710EBAD
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 14:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PXzg89hjwRM/PagE+dX+gN3W2rh61OKrpnFxZ0ownQs=; b=hf85UrWiXpJld8S1PgqnVjePrm
 Hkrg2nImO2WiEp5XNsxEZ2U8IVyMlP87SwjQHEG6VKeSsSIP/joL/ucHWlstPVvwIieC4o/NxZtjz
 3zkvABwI3sIQRcpncI8zITk/9UzTZ48tOqRGlzSv1TisaJ4lz09plD9Ek0e4+YCljfQSv9XvsBH/w
 jsWXCWcAmmxit0vmG7GZJ++m1osRi65VstJELj3Oog/ZraF/2F/h+Ht9++hQgv+gy9JwJAjLbEz/N
 5t2Y+cbmsvH2B7IWlkjqoDqTIiNSTc8LioJBuVRreOtPgSiY3VHQ2O+rMNH8KrLs15FmCQ4XcrcSk
 QRpkVdPw==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vvzGB-006Z08-57; Fri, 27 Feb 2026 15:56:07 +0100
Message-ID: <72f8293e-41a8-4149-a767-a27b14bc952b@igalia.com>
Date: Fri, 27 Feb 2026 14:56:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Fix ttm_pool_beneficial_order() return type
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Thadeu Lima de Souza Cascardo
 <cascardo@igalia.com>, stable@vger.kernel.org
References: <20260227124901.3177-1-tvrtko.ursulin@igalia.com>
 <9b0fd219-706c-4f15-9c71-f4e577ab6061@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <9b0fd219-706c-4f15-9c71-f4e577ab6061@amd.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:kernel-dev@igalia.com,m:cascardo@igalia.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid,igalia.com:email,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:email]
X-Rspamd-Queue-Id: CBA7B1B9519
X-Rspamd-Action: no action


On 27/02/2026 14:48, Christian König wrote:
> On 2/27/26 13:49, Tvrtko Ursulin wrote:
>> Fix a nasty copy and paste bug, where the incorrect boolean return type of
>> the ttm_pool_beneficial_order() helper had a consequence of avoiding
>> direct reclaim too eagerly for drivers which use this feature (currently
>> amdgpu).
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Fixes: 7e9c548d3709 ("drm/ttm: Allow drivers to specify maximum beneficial TTM pool size")
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: <stable@vger.kernel.org> # v6.19+
> 
> Good catch, Reviewed-by: Christian König <christian.koenig@amd.com>

Well self inflicted.. :( Thank you for a quick review! I pushed it 
straight away to drm-misc-fixes.

Regards,

Tvrtko

>> ---
>>   drivers/gpu/drm/ttm/ttm_pool_internal.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_pool_internal.h b/drivers/gpu/drm/ttm/ttm_pool_internal.h
>> index 82c4b7e56a99..24c179fd69d1 100644
>> --- a/drivers/gpu/drm/ttm/ttm_pool_internal.h
>> +++ b/drivers/gpu/drm/ttm/ttm_pool_internal.h
>> @@ -17,7 +17,7 @@ static inline bool ttm_pool_uses_dma32(struct ttm_pool *pool)
>>   	return pool->alloc_flags & TTM_ALLOCATION_POOL_USE_DMA32;
>>   }
>>   
>> -static inline bool ttm_pool_beneficial_order(struct ttm_pool *pool)
>> +static inline unsigned int ttm_pool_beneficial_order(struct ttm_pool *pool)
>>   {
>>   	return pool->alloc_flags & 0xff;
>>   }
> 

