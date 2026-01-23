Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id utbNOK4SdGkL2AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 01:30:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 443647BAAF
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 01:30:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6998F10E2F8;
	Sat, 24 Jan 2026 00:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="rgON1VOi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 751D310E2F8
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 00:30:33 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dybLG2CLlz9vCX;
 Sat, 24 Jan 2026 01:30:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1769214630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X5nLpTSobSsBsvLNmzs0aaNv9J2IQXpVoUoZI9CpVTM=;
 b=rgON1VOiJjePsKciUddNxpKdxkIqevXLXSuIAaNz+W+iRlpkrki19csGlzfhIzoJYwdhrh
 wb79HWzXaUKtcwytGE31A/wP7Ye2iHtIa5hPyaGwTGiHIOG9w044qdL3HVMXokwCdSnWjb
 xlQcdHoYlFNomQajDa4UFlfRj8Li9EsoLRidoYo/7Y1pdGAV3rk0nfLGbOcCkOMnP2oPcO
 1Hz/+yhAFZEO8GaWbMC6QVlCf83ej9SP7JysMs6yQsDJ5i3hR8LD6rCmFMvXX9+E50kJc1
 8c3vEBXsKHBqWr0VwTajWyp8oMECZG+hcNeHCsACBylvWNTT5VImty4H1Hor7w==
Message-ID: <f582dff3-92ec-4ac4-b270-3063bd873050@mailbox.org>
Date: Fri, 23 Jan 2026 16:04:22 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/imagination: Fix build on 32bit systems
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20251106232413.465995-1-marek.vasut+renesas@mailbox.org>
 <666b75d9-108c-42cf-bce7-b7efdb25e027@imgtec.com>
 <3af6990f-3b3e-4dbb-aa9e-1cd86341e0f0@mailbox.org>
 <bcc4b571-3c14-4c2f-8e47-127c35946a64@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <bcc4b571-3c14-4c2f-8e47-127c35946a64@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: yocza3z3cxejzpdpoot5pfbhmdz44kt5
X-MBO-RS-ID: 2f7624c56ab8cff0a6a
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,imgtec.com,linux.intel.com,kernel.org,ffwll.ch,suse.de,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Matt.Coster@imgtec.com,m:airlied@gmail.com,m:Frank.Binns@imgtec.com,m:Alessio.Belle@imgtec.com,m:Alexandru.Dadu@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:linux-renesas-soc@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,mailbox.org:dkim,mailbox.org:mid]
X-Rspamd-Queue-Id: 443647BAAF
X-Rspamd-Action: no action

On 1/23/26 11:28 AM, Matt Coster wrote:
> On 05/01/2026 16:34, Marek Vasut wrote:
>> On 1/5/26 2:09 PM, Matt Coster wrote:
>>> On 06/11/2025 23:24, Marek Vasut wrote:
>>>> Fix support for build on 32bit systems. Include linux/io-64-nonatomic-hi-lo.h
>>>> to provide non-atomic readq()/writeq()/ioread64()/iowrite64() accessors, and
>>>> use __ffs64() instead of plain ffs() on 64bit number SZ_1T.
>>>>
>>>> This allows this driver to bind on Renesas R-Car H2 which contains
>>>> Rogue G6400 BVNC 1.39.4.1 .
>>>>
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>
>>> Hi Marek,
>>
>> Hello Matt,
>>
>>> My apologies, this one appears to have slipped through the cracks on our
>>> end.
>>
>> No worries.
>>
>>>> +++ b/drivers/gpu/drm/imagination/Kconfig
>>>> @@ -3,7 +3,7 @@
>>>>      config DRM_POWERVR
>>>>        tristate "Imagination Technologies PowerVR (Series 6 and later) & IMG Graphics"
>>>> -    depends on (ARM64 || RISCV && 64BIT)
>>>> +    depends on ARM || ARM64 || RISCV
>>>
>>> This seems fine to me. Do you know any reason why the single change
>>> below might *not* be sufficient to support non-64-bit riscv? I can't
>>> think of any, I just wanted to double check this had been considered.
>> I do not have any 32bit RV to test this on, I only have 32bit ARM (R-Car H2).
> 
> I appreciate that you'd like to work on getting these older cores
> supported in the driver, but as it stands there's no real way to test
> this change beyond ensuring that it compiles.

I'm sure imgtec can produce a firmware, just like they did for the other 
cores, and then it can be tested ?

> I've asked around internally and the consensus is that communicating
> with the GPU on a 32-bit platform requires more consideration than just
> using the shims provided by io-64-nonatomic-hi-lo.h to avoid introducing
> races and other potential security holes.
> 
> My suggestion is that this patch be shelved for now and used as part of
> a larger series later which adds basic support for a core on a 32-bit
> platform.
What exactly is missing ?
