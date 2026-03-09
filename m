Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OuZVMcP7rmkLLQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 17:56:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6316F23D2B7
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 17:56:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4768D10E56D;
	Mon,  9 Mar 2026 16:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="mLGfxlMU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7BA10E569;
 Mon,  9 Mar 2026 16:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=4Gn3+7XVeWXGRga1VcTQEzwAIzElGxUlFy3iOjkC2wA=; b=mLGfxlMUOTb9p0Nca8zPA/ygZU
 b3sSJZxWT+tS2Q4WFJkS4OouZXwqYRH8Bu0x5cXYX7S05LSCd8jKKtR9OJdZImgmgCf2ofjCTo/Si
 KdKI3j5Zspk6bUibd1Bdqu9r9nhw7tcxqWpi8Y8YUQri5dLx3LT0oH35kBEzwEeeGLBl2bVsragvY
 OWqmD6qsVfvWj7ZXylReMG/IhAmfCY39G34bz7iOqQOGx16tZa3P9DiaDuGHtggMk3rO4sITjHZe6
 5jK7a/UyL6FAL+Z1ufHcuwsxP1hDxtYJFb3EQewI1izmTMMzHZHif54VP0V7umJvciUe75QQNm2Zj
 g9cpRN9w==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vzduA-00000007lxr-0D0J; Mon, 09 Mar 2026 16:56:30 +0000
Message-ID: <f57f964c-d4c2-41d7-86ce-6db11b0601e4@infradead.org>
Date: Mon, 9 Mar 2026 09:56:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iopoll: fix function parameter names in
 read_poll_timeout_atomic()
To: Jani Nikula <jani.nikula@intel.com>, linux-kernel@vger.kernel.org
Cc: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20260306221033.2357305-1-rdunlap@infradead.org>
 <d1ea41327832c2e4447429d6fc0030b71491ca44@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <d1ea41327832c2e4447429d6fc0030b71491ca44@intel.com>
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
X-Rspamd-Queue-Id: 6316F23D2B7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[infradead.org:-];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.709];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid,infradead.org:email,intel.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action



On 3/9/26 3:35 AM, Jani Nikula wrote:
> On Fri, 06 Mar 2026, Randy Dunlap <rdunlap@infradead.org> wrote:
>> Correct the function parameter names to avoid kernel-doc warnings
>> and to emphasize this function is atomic (non-sleeping).
>>
>> Warning: include/linux/iopoll.h:169 function parameter 'sleep_us' not
>>  described in 'read_poll_timeout_atomic'
>> Warning: ../include/linux/iopoll.h:169 function parameter
>>  'sleep_before_read' not described in 'read_poll_timeout_atomic'
>>
>> Fixes: 9df8043a546d ("iopoll: Generalize read_poll_timeout() into poll_timeout_us()")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> 
> Please let me know how you want this merged. I don't think iopoll.h has
> an active maintainer.

Right, that's why I Cc-ed you :)
And since Fixes: points to you and others.
Please take it, Jani.

>> ---
>> v2: change the function parameter names, not the kernel-doc comments (Jani)
>>
>>  include/linux/iopoll.h |    8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> --- linux-next-20260304.orig/include/linux/iopoll.h
>> +++ linux-next-20260304/include/linux/iopoll.h
>> @@ -159,7 +159,7 @@
>>   *
>>   * This macro does not rely on timekeeping.  Hence it is safe to call even when
>>   * timekeeping is suspended, at the expense of an underestimation of wall clock
>> - * time, which is rather minimal with a non-zero delay_us.
>> + * time, which is rather minimal with a non-zero @delay_us.
>>   *
>>   * When available, you'll probably want to use one of the specialized
>>   * macros defined below rather than this macro directly.
>> @@ -167,9 +167,9 @@
>>   * Returns: 0 on success and -ETIMEDOUT upon a timeout. In either
>>   * case, the last read value at @args is stored in @val.
>>   */
>> -#define read_poll_timeout_atomic(op, val, cond, sleep_us, timeout_us, \
>> -				 sleep_before_read, args...) \
>> -	poll_timeout_us_atomic((val) = op(args), cond, sleep_us, timeout_us, sleep_before_read)
>> +#define read_poll_timeout_atomic(op, val, cond, delay_us, timeout_us, \
>> +				 delay_before_read, args...) \
>> +	poll_timeout_us_atomic((val) = op(args), cond, delay_us, timeout_us, delay_before_read)
>>  
>>  /**
>>   * readx_poll_timeout - Periodically poll an address until a condition is met or a timeout occurs
>>
>>
>> ---
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Cc: intel-gfx@lists.freedesktop.org
>> Cc: intel-xe@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org
> 

-- 
~Randy

