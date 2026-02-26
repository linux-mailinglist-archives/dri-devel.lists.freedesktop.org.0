Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILL/LXNEoGkZhwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 14:02:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6452F1A607C
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 14:02:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8226010E91E;
	Thu, 26 Feb 2026 13:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="ASPKpiy1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B0510E91E
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 13:02:35 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id
 ffacd0b85a97d-43770c94dfaso809796f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 05:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1772110954; x=1772715754; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=10geXitpkniN6YDyfqBM68Pbb139x7rCGgK7wswfI0A=;
 b=ASPKpiy1PQYOuH0JyjW/Xj+c1OeLX33TTMUmMEaFJQglG9I2Ot2SRQmbFu7w+cT1xe
 W5aOYkLe533mpBBET/rrcV5JNJFw3yd4nJmgMP8O7zLUHcrPx/j64rTAGdOkurnuZQ+y
 nc7xxTK0PNvjKjhFrpn0LjaagJYYME0tLoBVCwq+wfR3J9yoB5oTLMRPlZ49NBZcs0UQ
 PcXizkf6jo7c67Vp2AHd4+YZAKgo0cryf1bB2rKTl948IxK48IDD571Q+t8jFxWKHTlS
 2vSSt30PVFljk6UeBwip8tJ4gXuQ6x3+o2WgJOzN84yIqgzP835YxXzmqZi3enQ4kuz0
 6Jyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772110954; x=1772715754;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=10geXitpkniN6YDyfqBM68Pbb139x7rCGgK7wswfI0A=;
 b=RBszROosExB5Hrib+zX13PHFdItkdTk42N74M1Tea/krq4oRP2kdlk+Jpal3U+W7vw
 UkiX7AZmF+ocuOtjDjHHd3z/SZb4A2pyYGpN8CvNRlNcLgt9fs8ajPEPAMKpx/G+MT9H
 UtAymWTBRKIolCwufaTozV0xlMCSXtovKOQdq5nj1CHyEDlA6J3iSJi+ezUez0IHt+Cv
 erHSZgFmLPOpMWrd8JvBLe6e3q9/+VJypH1G+fxlREuju5OajWSjFveSmZC8ozBIwydG
 0bkwjaK7vOI7ztHxQJ1IX7BhMkh4XznzD9nQ0l8+SEKKAhokiDogBGk1b6tJ4eyJ1Nej
 LSXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwsS1hoVMQBqr/Qa+1VMp1KLaN1WEsew13LsPB4+R/sq/LB40DQy8g4p4mJlfGFEdbq4seq8Mi+8k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNFemvcUKaoJMCjgijeiPC5QLzfU56o+6on0EYWejDSV9ycdiY
 brvPo5QtTTseu+D3lfC76rvvhx4IRPMUuTY744GzxbaHhdlW3YX1vI5SWArUikS6CYo=
X-Gm-Gg: ATEYQzzoO1xmbxgcwO3WNW+10p1HIr4ZoRSCx96D+ckR7RqHM+NLnYuEYh1kI0ScHZl
 kNEQxfqQHk9CxiEEVuYPWfidqVdtBoZGtzUQZmtxv7Vv2430WqHviesC1PpdPqLnUbHN45Derzc
 0XMgjjCsJx1f6eOku4xSzgldg+cqMScEdTO1ROP/Z40pOSZVs8qVYV0aZ3OciaCKE8UYvNmm0tm
 GVNjw3lfm+YZ6pb83MoCEzEasqAUHu+ZZVhq/QpZs0bNimgPV3yezXsC0uRuMZJdsk2GO5iU1dz
 BTxHyaKFb0xAeOQAahdTqVHXfeboi50rqWVwsxsYO34yzbgf2bZFsjKBYUiUN6wJyiCXMQIHlbs
 HKmQf0+rNQsMLWejqAzmHpqgSZd7HCGJ3CRQ1Z+K5Tz5LXznWuobZmoKtNvXa5+1ozagTFv0yjc
 /rN11avsEabZc0d5am49T/W8BFo91ug1E1LWXbgni+Q++WLHPUlFRU3bI=
X-Received: by 2002:a05:6000:26cb:b0:439:8677:5c3b with SMTP id
 ffacd0b85a97d-43997ed6d18mr3899601f8f.6.1772110953409; 
 Thu, 26 Feb 2026 05:02:33 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4398d568772sm14581234f8f.0.2026.02.26.05.02.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Feb 2026 05:02:32 -0800 (PST)
Message-ID: <1d6a5850-117c-4586-aeae-9f22a96aefab@ursulin.net>
Date: Thu, 26 Feb 2026 13:02:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tests: Mark slow tests as slow
To: phasta@kernel.org, Maxime Ripard <mripard@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthew Auld <matthew.auld@intel.com>,
 Arun Pravin <arunpravin.paneerselvam@amd.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20260224110310.1854608-1-mripard@kernel.org>
 <1c76b8d6-9394-4017-a18f-95ecc2c08175@ursulin.net>
 <20260226-certain-tuscan-caribou-ba4c5e@penduick>
 <e343e45b-6328-4a38-ad31-1487e273f12a@ursulin.net>
 <595ce86b8a91f18ab8c73295a4a89c8f9353a794.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <595ce86b8a91f18ab8c73295a4a89c8f9353a794.camel@mailbox.org>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[ursulin.net:s=google];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:mripard@kernel.org,m:matthew.brost@intel.com,m:dakr@kernel.org,m:christian.koenig@amd.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:matthew.auld@intel.com,m:arunpravin.paneerselvam@amd.com,m:simona.vetter@ffwll.ch,m:airlied@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[ursulin.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RSPAMD_URIBL_FAIL(0.00)[ursulin.net:query timed out,igalia.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,amd.com,linux.intel.com,suse.de,ffwll.ch,gmail.com,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[ursulin.net:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RSPAMD_EMAILBL_FAIL(0.00)[tvrtko.ursulin.igalia.com:query timed out];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6452F1A607C
X-Rspamd-Action: no action


On 26/02/2026 12:48, Philipp Stanner wrote:
> On Thu, 2026-02-26 at 12:42 +0000, Tvrtko Ursulin wrote:
>>
>> On 26/02/2026 10:56, Maxime Ripard wrote:
>>
>>
> 
> […]
> 
>>>>>     	{}
>>>>>     };
>>>>>     static struct kunit_suite drm_sched_priority = {
>>>>>     	.name = "drm_sched_basic_priority_tests",
>>>>> @@ -544,11 +544,11 @@ static void drm_sched_test_credits(struct kunit *test)
>>>>>     	drm_mock_sched_entity_free(entity);
>>>>>     	drm_mock_sched_fini(sched);
>>>>>     }
>>>>>     static struct kunit_case drm_sched_credits_tests[] = {
>>>>> -	KUNIT_CASE(drm_sched_test_credits),
>>>>> +	KUNIT_CASE_SLOW(drm_sched_test_credits),
>>>>
>>>> Same really.
>>>>
>>>> Anyway, the scheduler parts LGTM and I can follow up trying to optimise
>>>> these two later.
>>>>
>>>> For the scheduler:
>>>>
>>>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>
>>> Thanks!
>>
>> I have a patch already which makes those (and one more) test cases
>> faster, but I will wait sending it until you merge this one.
> 
> And why would we want to flag a test as slow just to immediately
> afterwards make it faster?
> 
> Would it not be wiser to drop Maxime's change?

Just so he doesn't have to respin, or that we don't end up merging my 
patch on top of the test already marked as slow. I am okay either way.

Regards,

Tvrtko

