Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGuJOKqZnWnwQgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 13:29:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59791186F8F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 13:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6606610E56D;
	Tue, 24 Feb 2026 12:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="sls9xHbl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250C710E57E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 12:29:26 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id
 5b1f17b1804b1-4834826e555so52355825e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 04:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1771936164; x=1772540964; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8Hdq9BmB7/GF5Wn6CgmEHP69jSHqp/bxqlxbdhnhtTs=;
 b=sls9xHblsTGgEupROwhQ6Lr05fSFRqZfxrMuK59X3WCtnl3vQPomB7TMd0d3jHkHB0
 iOUk8xU3WlCkrM3tOus9JQghTMkj958s94Ll/pmxxiy2J+9GydPuZQi8Cm76PQiC30+U
 m/YuIln1yhTV04eUeK3w3c3Bw7ZzcNFQkjrT6u69Bem76FtZi3iih6OmPo/Ii05NvLKh
 V0f7+Y2xwCVu6H3xyfBkaRDQImbwZK/bTVYQK1UufzTj88t5EMZuUP6iCPJbHa+dlmxK
 z2NnCd562ROIIRV2YAs1aMePlsMbmY0J4KkLhP/IjHocciDfyQhXtgILFwxXVqWLlZ/R
 rnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771936164; x=1772540964;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8Hdq9BmB7/GF5Wn6CgmEHP69jSHqp/bxqlxbdhnhtTs=;
 b=r1PvbXyXPN7lPZek27iXM+wppLDHutzn9yaStJf/1eIux1H6ui6MMuFXDDOTdEwMxf
 OG566XSYBr96AEB5l4v2L0dxXGdfKCd68DLkCrtu/PK2UYwXvkXua57aeQEt2UxOHJkh
 uDtrufWcKjte9xGlP1v5mrL+2570Kz9Dfvr6E0gtFu5ayDrkS/RQyKbQxHEHWzOe+RMY
 ZvNz5FhTNmX/mUeU2UzqmtFRvSEkoEK1MxFru9T1BGm6fJYNRtb8pTJjTrYtn2VoWRci
 BGtY3mWQiOd+dyMplsuOXTVrcMYwfxDEOEsbnkFU9eSwpn/AOSI0nnVqzE1XSa6ZJZxA
 wWvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXy+RFgqVSJNIy8I5mEzdnoJXxje97VOmhkHwdJ+PfrNKpHpeil46xuL2kDP4Pgfizik1zad+qea9M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOUt3jnILp+5S7kCLlvHzcdEmvD7qOX90tv6hBSw8IernLvbIq
 8cfEt4d4XAi57cOM1eglBQe6w4aZmAEej6J8mEyY/2Ibg2lu7C5QIHAJtu7PAp0NA10=
X-Gm-Gg: AZuq6aJeAK3ges7W/5dhCkGloRC/+s+a6tJ8Oi2nQcsReGXh16+h8+YGpQUFIodn75G
 oV12GDCj4gJ3ZbMmfNb0hro+7heoiwZDkshzTp2qh2cEi7Vc7jw+N1c7II2Ztth550RxP6v8B1f
 e7rjjk85t837zHFvJ1tub9idoiv+hZ0kw/yrxgkPEWLjoCCjFS7J8pp6WZrZSMyRzF9TjLODM3e
 M9efkWUrmK0PR+2IikbdlXud1TSC67FJacjZHRJEhNR7zVCQ2DfPek8JPD/VG4/OKIsbd9jhJ4s
 iLQwJDb1wsYiC/8268VYZz+bvrEymeDYkZJ7fYjuPZQmmcK++MX9sLDJ3mvbxmJCJL70MeXiyiG
 ZvUAer3d+IYhFjuCX9C4OeTQ42qIex8iAZXyjOX3DO0V4QIzgDtYkNUbC9+L/cARXc5L27yB9Dm
 K/1156VMhU0DCW2KaZG1jdbcogaIpGMQzI6M1T26xnMYzj
X-Received: by 2002:a05:600c:6986:b0:483:703e:4ad9 with SMTP id
 5b1f17b1804b1-483a962e00emr173485505e9.19.1771936164361; 
 Tue, 24 Feb 2026 04:29:24 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483b8917aa6sm17387715e9.28.2026.02.24.04.29.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 04:29:24 -0800 (PST)
Message-ID: <bafed0bf-4cb0-4ad2-b027-8d826dc781d4@ursulin.net>
Date: Tue, 24 Feb 2026 12:29:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tests: Mark slow tests as slow
To: Danilo Krummrich <dakr@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthew Auld <matthew.auld@intel.com>,
 Arun Pravin <arunpravin.paneerselvam@amd.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20260224110310.1854608-1-mripard@kernel.org>
 <DGN5YXMO9CBB.5T29K0XHUXMF@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <DGN5YXMO9CBB.5T29K0XHUXMF@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[ursulin.net:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[ursulin.net];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:mripard@kernel.org,m:matthew.brost@intel.com,m:phasta@kernel.org,m:christian.koenig@amd.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:matthew.auld@intel.com,m:arunpravin.paneerselvam@amd.com,m:simona.vetter@ffwll.ch,m:airlied@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,amd.com,linux.intel.com,suse.de,ffwll.ch,gmail.com,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ursulin.net:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 59791186F8F
X-Rspamd-Action: no action


On 24/02/2026 11:43, Danilo Krummrich wrote:
> (Cc: Tvrtko)
> 
> On Tue Feb 24, 2026 at 12:03 PM CET, Maxime Ripard wrote:
>> Some DRM tests cross the 1s execution time threshold that defines a test
>> as slow. Let's flag them as such.
> 
> <snip>
> 
>>   static struct kunit_case drm_sched_credits_tests[] = {
>> -	KUNIT_CASE(drm_sched_test_credits),
>> +	KUNIT_CASE_SLOW(drm_sched_test_credits),
> 
> Hm..I don't think this test should be that slow.
> 
> Looking at the code, I see intentional timeouts through:
> 
> 	done = drm_mock_sched_job_wait_scheduled(job[1], HZ);
> 	KUNIT_ASSERT_FALSE(test, done);
> 
> Since the timeout is in jiffies, this should be always 1s, which seems a bit
> overkill.
> 
> Maybe we should just change this to msecs_to_jiffies(200), which should still be
> plenty and keep the test below 500ms.

Right, 200ms should be more than plenty. It is only making sure the 
scheduler is not oversubscribing the configured credits, and the delay 
needed to be sure about that is around two worker wake up to run cycles.

Regards,

Tvrtko

