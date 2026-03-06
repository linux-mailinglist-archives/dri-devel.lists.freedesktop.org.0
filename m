Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOjWJJiTqml0TQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 09:43:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 077FC21D3B4
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 09:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9C610E3B5;
	Fri,  6 Mar 2026 08:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="C11R0y9x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E3210E3B5
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 08:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wrmge17ypn1Y/rBKuh3QziCUXSnQXoXxYFxoJxj3o2s=; b=C11R0y9xCzFinlMQrL6387Gwdz
 LnVKDWqLDJfoS2rTSSMm9vRUfZuyNQxTsf/ISVVP7FBruBP+q9yLwDkVB3Ei8PQE4BAslGNIBb2us
 mndvI+HpI31pVmnNMa7Fi2P4NwO0x60Pmv1Oi34vEsuB00vTHQT0LFosNwc5YezCLn58e+XRXTx+8
 KiUfYCx5cxNoYj8gBGbzntNtW4v9DjRF+I/srU+xk6KpKhnGMJVfJR/PJAS9Tvk5qE6GheKKJJLGm
 Z4CVCYNDmLVGaC15vPr/3I/eAmBw7/FDVciKI4up84d0rMBn/mOqzxjbZg8ldlcXsM2J9B2CH+8EB
 fI9r1Lyw==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vyQlp-009wbG-Gz; Fri, 06 Mar 2026 09:42:53 +0100
Message-ID: <9b53aa5b-19d9-4846-8c4b-2ccc80588ad5@igalia.com>
Date: Fri, 6 Mar 2026 08:42:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 0/3] Querying errors from drm_syncobj
To: Yicong Hui <yiconghui@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 Philipp Stanner <phasta@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 matthew.brost@intel.com
References: <20260225124609.968505-1-yiconghui@gmail.com>
 <3491d5f9-d08e-4193-a983-45340af73745@amd.com>
 <7300ad7c-39a5-4424-b4fd-9d3f97083f06@mailbox.org>
 <d215b326-6f17-405e-b9e2-9627c17db00d@amd.com>
 <3167d5c6-3454-4652-86c7-e9ef0ef0a517@gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <3167d5c6-3454-4652-86c7-e9ef0ef0a517@gmail.com>
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
X-Rspamd-Queue-Id: 077FC21D3B4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:yiconghui@gmail.com,m:christian.koenig@amd.com,m:michel.daenzer@mailbox.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:david.hunter.linux@gmail.com,m:phasta@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:matthew.brost@intel.com,m:davidhunterlinux@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,mailbox.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.014];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linuxfoundation.org,gmail.com,kernel.org,linux.intel.com,suse.de,intel.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,igalia.com:mid,gnome.org:url]
X-Rspamd-Action: no action


On 05/03/2026 16:23, Yicong Hui wrote:
> On 2/25/26 1:57 PM, Christian König wrote:
>> On 2/25/26 14:37, Michel Dänzer wrote:
>>> On 2/25/26 14:25, Christian König wrote:
>>>> On 2/25/26 13:46, Yicong Hui wrote:
>>>>> This patch series adds 2 new flags, DRM_SYNCOBJ_QUERY_FLAGS_ERROR and
>>>>> DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR for 3 ioctl operations
>>>>> DRM_IOCTL_SYNCOBJ_QUERY, DRM_IOCTL_SYNCOBJ_WAIT and
>>>>> DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT to allow them to batch-request error
>>>>> codes from multiple syncobjs and abort early upon error of any of 
>>>>> them.
>>>>
>>>> Patch #1 looks good enough to add my rb.
>>>>
>>>> Patch #2 looks good as well, but I'm not familiar enough with the 
>>>> code and have no time to wrap my head around it to give a review.
>>>>
>>>> Adding a few people on CC, maybe somebody has time to take another 
>>>> look.
>>>>
>>>>>
>>>>> Based on discussions from Michel Dänzer and Christian König, and a
>>>>> starter task from the DRM todo documentation.
>>>>>
>>>>> See https://gitlab.gnome.org/GNOME/mutter/-/issues/4624 for 
>>>>> discussions
>>>>> on userspace implementation.
>>>>>
>>>>> I have looked into adding sub test cases into syncobj_wait.c and
>>>>> syncobj_timeline.c, igt-tests for this and I think I understand the
>>>>> process for writing tests and submitting them, however, these ioctls
>>>>> only trigger in the case that there is an error, but I am not sure 
>>>>> what
>>>>> is the best way to artifically trigger an error from userspace in 
>>>>> order
>>>>> to test that these ioctl flags work. What's the recommended way to
>>>>> approach this?
>>>>
>>>> When Michel agrees that this is the way to go then we either need an 
>>>> in-kernel selftest (see directory drivers/gpu/drm/tests/) or an 
>>>> userspace IGT test.
>>>>
>>>> Not sure what is more appropriate, maybe somebody on CC has more 
>>>> experience with that.
>>>
>>> I'd advise against landing this in the kernel before there's a 
>>> corresponding display server implementation making use of it, in a 
>>> mergeable state.
>>
>> Yeah we clearly have the rule that this can't be pushed into the 
>> kernel without userspace code as well.
>>
>>> Otherwise you might end up with the kernel having to support UAPI 
>>> which no real-world user space actually uses. Been there, done that 
>>> myself.
>>>
>>>
>>> I don't have the capacity to contribute anything more than advice at 
>>> this point.
>>
>> Oh that is sad. Do you know anybody who could work on that?
>>
>> It is a clear improvement to error handling and I don't like to keep 
>> Yicong's work only on the mailing list.
>>
>> Thanks,
>> Christian.
>>
> 
> Hello
> 
> Is there anything else I can do? Or will we have to just leave all of 
> this here unmerged
> 
> I have read the emails from Tvrtko and Matthew and I'm absolutely happy 
> to send a v4 to ameliorate these issues, but there might not be a need 
> to do so if the series won't get merged in the end

I wasn't following closely the userspace angle of the discussion to be 
sure, nor I know enough about what are all the userspaces which may want 
to use it, but in general, if there is more than one potential 
userspace, perhaps you could try to interest some of them into the 
feature. Or add support for it yourself, submit to them and say this 
improves this or that and I have the kernel feature waiting already.

One other thing, so that your effort is not lost should someone want to 
work on it in the future, perhaps a patch for the TODO file which links 
to your latest series on lore (once all review comments are addressed) 
and noting that the kernel implementation exists but is waiting on 
userspace? Not sure if we ever done something like that but maybe we 
should to avoid work duplication in the future. And also to preserve 
some credit if someone picks up the work 1-2-3 years down the road.

Regards,

Tvrtko

> Regardless, thank you to Christian and all the maintainers for being 
> welcoming and all your work reviewing this patch series so far!
> 
> Thanks
> Yicong

