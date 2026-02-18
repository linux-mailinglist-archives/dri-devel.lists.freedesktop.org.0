Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIt0IZzRlWlEVAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 15:50:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E974D1572C0
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 15:50:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D716110E5D4;
	Wed, 18 Feb 2026 14:49:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="gsjADQmZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DCD10E08F;
 Wed, 18 Feb 2026 14:49:56 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fGKDJ4THMz9v0N;
 Wed, 18 Feb 2026 15:49:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1771426192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zxBCLyRvOJ5lqOVGE65eX36//gHoC2z4soCTqVkxnC4=;
 b=gsjADQmZjBy2F5dSOBk4gwmQaew+NNUoM0kun5/cNP/6LIpYUpBsW/ypmy/4c9it14wvEX
 gqiWMGKrsR3Snc6y+69LvAvSwo7mWyna/JAJzTHgEWtpBg4AxOuHvNd9s/AAeQfAHp9xJ1
 awTxYRVhPvt3VZpKc3NtmGpkOQpI7vje8L1vwGdRSj5J13PEKFDe2m2U4kVJ9s7F3Wzj5r
 BWEOVPC/GiF8XIrgkOGa0e0OeH8saVe+kFXTjZzmGsIfYNB8JR58mgTFRokQwpslt2vEJw
 h4mkGMtTi1sn4HnBaRmjSubCG0G/BE4NKItE5qNBMABGAcoX+Zbvw75mLKIsVQ==
Message-ID: <e750ca62-8a2e-47e2-b154-c7cdaf5e270e@mailbox.org>
Date: Wed, 18 Feb 2026 15:49:49 +0100
MIME-Version: 1.0
Subject: Re: [RFC PATCH v1 1/2] drm/syncobj: Add DRM_IOCTL_SYNCOBJ_QUERY_ERROR
 to query fence error status
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Yicong Hui <yiconghui@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 wayland-devel@lists.freedesktop.org, mesa-dev@lists.freedesktop.org
References: <20260213120836.81283-1-yiconghui@gmail.com>
 <20260213120836.81283-2-yiconghui@gmail.com>
 <f1100dad-b9ff-4ba2-987c-4d5cb4c1122c@amd.com>
 <bc491356-6db4-4466-ab0f-2f2a47f4da77@mailbox.org>
 <0e7c3ee9-54b1-4ecc-b960-6e2fda6ab3ae@amd.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <0e7c3ee9-54b1-4ecc-b960-6e2fda6ab3ae@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 255a56dab5c43b695d3
X-MBO-RS-META: 7a15mxse9kjrodfsn1tj5peigx31bk5x
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
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michel.daenzer@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linuxfoundation.org,gmail.com];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:mid,mailbox.org:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E974D1572C0
X-Rspamd-Action: no action

On 2/17/26 15:45, Christian König wrote:
> On 2/17/26 15:35, Michel Dänzer wrote:
>> On 2/17/26 11:29, Christian König wrote:
>>>>
>>>> @@ -732,6 +732,8 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
>>>>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_LIST_LESSEES, drm_mode_list_lessees_ioctl, DRM_MASTER),
>>>>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GET_LEASE, drm_mode_get_lease_ioctl, DRM_MASTER),
>>>>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_REVOKE_LEASE, drm_mode_revoke_lease_ioctl, DRM_MASTER),
>>>> +	DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_QUERY_ERROR, drm_syncobj_query_error_ioctl,
>>>> +		      DRM_RENDER_ALLOW),
>>>
>>> My educated guess is that userspace doesn't want to call this IOCTL separately because of performance reasons.
>>>
>>> Instead add some additional flag to DRM_SYNCOBJ_WAIT_FLAGS_* so that the IOCTL aborts the wait and returns an error as soon as it sees any fence with an error.
>>>
>>> Another DRM_SYNCOBJ_QUERY_FLAGS_* is potentially also useful to query the error on a number of drm_syncobjs at the same time.
>>>
>>> But in general since this is not a HW feature the userspace developers need to voice their requirements and explain how they want to have that implemented.
>>
>> mutter currently doesn't use the syncobj-specific ioctls to wait for a syncobj (timeline point) to signal / check if it has. Instead, it uses drmSyncobjEventfd / drmSyncobjExportSyncFile to get an eventfd / sync_file representing the timeline point / fence, then checks the status of the fd and waits for it to signal using generic poll()-style functionality. So unless the error condition can be communicated via the latter (and plumbed through glib APIs), mutter would need to check for fence errors separately.
> 
> Good point, poll() has a POLLERR flag for that but I have no idea if eventfd supports that in any way. So potentially doable as well but a bit more work.
> 
> Using a new DRM_SYNCOBJ_QUERY_FLAGS_ERROR on all signaled syncobj as separate way to query if there was an error should work for you in the meantime?

Yeah should be fine, though if POLLERR is possible, that might save constantly calling into the kernel to check for an error status that won't happen the vast majority of the time?


The bigger question might be what user space can do with the error status. I wrote down some ideas for mutter in https://gitlab.gnome.org/GNOME/mutter/-/issues/4624 .


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
