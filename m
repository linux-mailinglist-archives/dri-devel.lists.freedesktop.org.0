Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEj4Mf56qWkg8gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 13:45:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F2F211FB1
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 13:45:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920A410EB1B;
	Thu,  5 Mar 2026 12:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="jI0wXuwV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7001C10EB1B;
 Thu,  5 Mar 2026 12:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1772714745;
 bh=ab9I5AqlIbEt0Cs5813dVMgxpQwoO7pPngmI92wUOjY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jI0wXuwVETqNnCkQfLyd27nQOpOgGx4JGQ58IcMIReKUWO6sOGhxRBA9xy1QTnzbx
 mzCOFbTNh1yZpoNOoo6k3gnPDoac3atksFsloMMvpVFu0hp/kGWIk/6hjhUp/4HoBX
 fArmFvaq+2eTPO/lrw0h2AcbdlkSjMK8LRYgr+Np66ZpCrOsomKUNszjyjh6jss5x2
 ph9nIaeIJEbKZLQxzOCT8SSvqeMwjJRsfgJ6sP7bxtJcmTOCwFgQBI+U/N5p5m7Cfz
 n/EzCSnmjJh4KRvsfShZNYIbKS9V2TQGYn7W6yCZLAQOwCMWPqj6cWqvBr4DM0Hroj
 jgR9ZSaXU8f3g==
Message-ID: <fbf457b5-cec0-41c6-bd04-55b5aabe23f6@lankhorst.se>
Date: Thu, 5 Mar 2026 13:45:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm/syncobj: Fix handle <-> fd ioctls with dirty
 stack"
To: Julian Orth <ju.orth@gmail.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
References: <20260305113734.1309238-1-dev@lankhorst.se>
 <CAHijbEWKN8EY0uy73XR2RRh1ScgarZTLibu5ECR08OeqTje54Q@mail.gmail.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <CAHijbEWKN8EY0uy73XR2RRh1ScgarZTLibu5ECR08OeqTje54Q@mail.gmail.com>
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
X-Rspamd-Queue-Id: 62F2F211FB1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [8.69 / 15.00];
	URIBL_BLACK(7.50)[lankhorst.se:dkim,lankhorst.se:email,lankhorst.se:mid];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	BAD_REP_POLICIES(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[lankhorst.se:s=default];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lankhorst.se,none];
	DKIM_TRACE(0.00)[lankhorst.se:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[dev@lankhorst.se,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177:c];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.772];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lankhorst.se:dkim,lankhorst.se:email,lankhorst.se:mid,chromium.org:email,amd.com:email,mailbox.org:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: add header
X-Spam: Yes

Hey,

Den 2026-03-05 kl. 12:48, skrev Julian Orth:
> On Thu, Mar 5, 2026 at 12:37 PM Maarten Lankhorst <dev@lankhorst.se> wrote:
>>
>> This reverts commit 2e3649e237237258a08d75afef96648dd2b379f7.
>>
>> The problem occurs when userspace is compiled against new headers
>> with new members, but don't correctly initialise those new members.
>>
>> This is not a kernel problem, and should be fixed in userspace by
>> correctly zero'ing all members.
> 
> I don't mind it being reverted since userspace rust code is not
> affected by this failure mode.
> 
> However, if you're committed to the idea that this is a userspace
> issue, then I think the correct solution would be to instead apply the
> patch you suggested. It clarifies the intention of the code in my
> opinion.

Thanks for having a better understanding of the issue now. :)
I will resend the original patch I mentioned later. I just wanted to get
this revert in drm/drm-fixes before it reaches a rc kernel.

Can I read your reply as an acked-by?

Kind regards,
~Maarten Lankhorst

>>
>> Cc: Rob Clark <robdclark@chromium.org>
>> Cc: Julian Orth <ju.orth@gmail.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Michel Dänzer <michel.daenzer@mailbox.org>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>> ---
>>  drivers/gpu/drm/drm_syncobj.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
>> index 49eccb43ce63d..250734dee928e 100644
>> --- a/drivers/gpu/drm/drm_syncobj.c
>> +++ b/drivers/gpu/drm/drm_syncobj.c
>> @@ -875,7 +875,7 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
>>                 return drm_syncobj_export_sync_file(file_private, args->handle,
>>                                                     point, &args->fd);
>>
>> -       if (point)
>> +       if (args->point)
>>                 return -EINVAL;
>>
>>         return drm_syncobj_handle_to_fd(file_private, args->handle,
>> @@ -909,7 +909,7 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
>>                                                           args->handle,
>>                                                           point);
>>
>> -       if (point)
>> +       if (args->point)
>>                 return -EINVAL;
>>
>>         return drm_syncobj_fd_to_handle(file_private, args->fd,
>> --
>> 2.51.0
>>

