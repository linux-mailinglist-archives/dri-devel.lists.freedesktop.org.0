Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCdHG0T7nmm+YAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 14:38:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C20F19830B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 14:38:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DA410E7E0;
	Wed, 25 Feb 2026 13:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="nd+GYY78";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C9210E7E0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 13:37:43 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fLbHk6Wvkz9v92;
 Wed, 25 Feb 2026 14:37:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1772026659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CctRGKbjHRhQNeruJvsG/6b4mLUQF7gvnBxGhSS+a9E=;
 b=nd+GYY78TUf3J9IRaTpnqpOFqI9xp3EK4M/XIZtKzPVLGng/OD6Jxq72wL8Op59OTMmJH5
 pl12Y5fvn9J3didpw+QSAInEtJe/KTjPbnVtx1S+h4yPGaujTn+2YvKzhCi/lmdYKildjr
 gjLdPCRwOJVcQm4uPcsh3bnoGV9EclJchy3pun6TmvYM95eu7QTXf8sLhBbyaOkr8WXuOS
 2mLSC1dih6rcXRIAfOpkXOZdJsjeCAzOUqGbq2IDv6cn/keWixiy33ZXF08axAeu4xYmTG
 BktRutt5B33fmD7aUB+y2q+lgl3pvIoR2JDR/ik2ODeQdpw6bG1MpSQruc44/Q==
Message-ID: <7300ad7c-39a5-4424-b4fd-9d3f97083f06@mailbox.org>
Date: Wed, 25 Feb 2026 14:37:34 +0100
MIME-Version: 1.0
Subject: Re: [RFC PATCH v3 0/3] Querying errors from drm_syncobj
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Yicong Hui <yiconghui@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20260225124609.968505-1-yiconghui@gmail.com>
 <3491d5f9-d08e-4193-a983-45340af73745@amd.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <3491d5f9-d08e-4193-a983-45340af73745@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 9283f5bdaeeabfe4b6a
X-MBO-RS-META: fytwafjzzbnuwbbyt6bbicjzmzdod3wc
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:yiconghui@gmail.com,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:david.hunter.linux@gmail.com,m:tvrtko.ursulin@igalia.com,m:phasta@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:davidhunterlinux@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[amd.com,gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[michel.daenzer@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linuxfoundation.org,gmail.com,igalia.com,kernel.org,linux.intel.com,suse.de];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michel.daenzer@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gnome.org:url]
X-Rspamd-Queue-Id: 7C20F19830B
X-Rspamd-Action: no action

On 2/25/26 14:25, Christian König wrote:
> On 2/25/26 13:46, Yicong Hui wrote:
>> This patch series adds 2 new flags, DRM_SYNCOBJ_QUERY_FLAGS_ERROR and
>> DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR for 3 ioctl operations
>> DRM_IOCTL_SYNCOBJ_QUERY, DRM_IOCTL_SYNCOBJ_WAIT and
>> DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT to allow them to batch-request error
>> codes from multiple syncobjs and abort early upon error of any of them.
> 
> Patch #1 looks good enough to add my rb.
> 
> Patch #2 looks good as well, but I'm not familiar enough with the code and have no time to wrap my head around it to give a review.
> 
> Adding a few people on CC, maybe somebody has time to take another look.
> 
>>
>> Based on discussions from Michel Dänzer and Christian König, and a
>> starter task from the DRM todo documentation.
>>
>> See https://gitlab.gnome.org/GNOME/mutter/-/issues/4624 for discussions
>> on userspace implementation.
>>
>> I have looked into adding sub test cases into syncobj_wait.c and
>> syncobj_timeline.c, igt-tests for this and I think I understand the 
>> process for writing tests and submitting them, however, these ioctls 
>> only trigger in the case that there is an error, but I am not sure what
>> is the best way to artifically trigger an error from userspace in order
>> to test that these ioctl flags work. What's the recommended way to 
>> approach this?
> 
> When Michel agrees that this is the way to go then we either need an in-kernel selftest (see directory drivers/gpu/drm/tests/) or an userspace IGT test.
> 
> Not sure what is more appropriate, maybe somebody on CC has more experience with that.

I'd advise against landing this in the kernel before there's a corresponding display server implementation making use of it, in a mergeable state.

Otherwise you might end up with the kernel having to support UAPI which no real-world user space actually uses. Been there, done that myself.


I don't have the capacity to contribute anything more than advice at this point.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
