Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id swrKDFKzgWnNIwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 09:35:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AAFD6456
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 09:35:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE34010E58E;
	Tue,  3 Feb 2026 08:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="B+Run3yV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A36D10E586
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 08:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770107724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vy0hVPUiK2w0Rez7l2fCnpsK8hrPlTDFnOepXkhOUq8=;
 b=B+Run3yV/uFZiRQREpUxUn64EjeHwj2RoTft3LjtP3tnDX04unAs3gsMlrYFiNQUw+RWc4
 Vjdt4+9w5En9+qPGCOKXCwfsJe5P/swvtkvigo6Og/Q2a1qLYSHXm3cSrRw5TJB7jFFG5U
 0WT2RmyIlc96JR/Ls375dEIaQ+I7TOk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633--EedDZZ3PUqiWl8c3cxUcw-1; Tue, 03 Feb 2026 03:35:23 -0500
X-MC-Unique: -EedDZZ3PUqiWl8c3cxUcw-1
X-Mimecast-MFC-AGG-ID: -EedDZZ3PUqiWl8c3cxUcw_1770107722
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-48057c39931so58794795e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 00:35:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770107722; x=1770712522;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vy0hVPUiK2w0Rez7l2fCnpsK8hrPlTDFnOepXkhOUq8=;
 b=hcnd1lkzgAIM5QBkNGc5yBQ8xJQ8GZnEllrQy1/Z68RhDwp1dDsid95CxZTTU88B5U
 w1BD8RthudGdem9YuB5t0L8gbCV41q9q5y/CLyDwb/abKBQSrY9qnab/+7HKrheuLvIG
 M/FvGpAR5+4T6B3x52yT7BVIAuyGeTk/Y3RF9zmPEHjjayrQZ+arTdiLEyflJBrhYx4l
 ogqaRgA5yZ186x9ONNDV/yYE0ihD4VSrxn1cLxExHlYWeh+0l+Hs402tepBzpfob/3gm
 9JJuOgszV/DAbQGMq5HKCDDvAxY/4M7RgOVfm6u4CBnE1P4diPGTnA12RH1cpojy60Jr
 uGMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPQoNYYMwGncOt/MIRwbYPieqAvfVyP9qJGf4zLerqqGNqhipPmOcEKSYWuavGkrrm6oojq7ohaQs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxa1wOyWUWNd+do1qkGYY/maxbJZ3v80j/Iei7eFtqWu00vFyXN
 RQTTokT21kZyhADahPtXxLAZYsyRyqLlkS5lTdKdaCsK3tyH8O5zSjl2qxBM7H/ABabvTUdeICx
 yQUCFQ/f45qgQ3CqhnKGBCkHXDcsPHEalQEHFMmUW3pATUW6UzITNW4/4R5ZnYx1Db70YQA==
X-Gm-Gg: AZuq6aK/l5/4aCf1u/OwgWoNGXPb0x1zFdPC0pAmQ3QCCwdkYZqcd5CRBL7bOvDeeRe
 9o5OL7gLyCOFLu1wBSlRmqVS96wTUd1Kj5Q0ipvJMkB6HMMZGXLRuJBhfBv73HRL4blbHrvxpMd
 w6+jXp5JO8VPkjphBFnDiNUZu0A4s8cAeiufdYs9sraBV+eUjV6QSkhm2swGbTK01P8gtdI9d6o
 N5wUEdUOkYNAznT6NZtv3AKOkuT7Y9/BT8vyiMSciTGD0ASWm9znVuHaeuxsvaPCzKXIvv+5//0
 eVmBgrwp2Ko2ahaeodcI8lMcPqVQKi2PWMPyh6+Ye0bZUb9MwB/TWiQ1LP6TM5MIikbrNjBf1Gj
 k1qrj702EAITfzPncXQ5Jedymxhvg5maf5Ar9oBcTx/szvFTsgQ==
X-Received: by 2002:a05:600c:4451:b0:477:639d:bca2 with SMTP id
 5b1f17b1804b1-482db457724mr208563845e9.4.1770107721812; 
 Tue, 03 Feb 2026 00:35:21 -0800 (PST)
X-Received: by 2002:a05:600c:4451:b0:477:639d:bca2 with SMTP id
 5b1f17b1804b1-482db457724mr208563575e9.4.1770107721265; 
 Tue, 03 Feb 2026 00:35:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48305129321sm46223605e9.4.2026.02.03.00.35.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 00:35:20 -0800 (PST)
Message-ID: <a274b913-b41f-4fe5-bc56-b45ea030c2b7@redhat.com>
Date: Tue, 3 Feb 2026 09:35:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/mgag200: fix mgag200_bmc_stop_scanout()
To: Jacob Keller <jacob.e.keller@intel.com>, Dave Airlie
 <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>
Cc: Pasi Vaananen <pvaanane@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260202-jk-mgag200-fix-bad-udelay-v2-1-ce1e9665987d@intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260202-jk-mgag200-fix-bad-udelay-v2-1-ce1e9665987d@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Mg6aFB1e0Mk8cTLJwsM5r6wtQnIlCXOC1e7DjTvKw9I_1770107722
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jacob.e.keller@intel.com,m:airlied@redhat.com,m:tzimmermann@suse.de,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:pvaanane@redhat.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jfalempe@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jfalempe@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,msgid.link:url]
X-Rspamd-Queue-Id: 83AAFD6456
X-Rspamd-Action: no action

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

-- 

Jocelyn

On 03/02/2026 01:16, Jacob Keller wrote:
> The mgag200_bmc_stop_scanout() function is called by the .atomic_disable()
> handler for the MGA G200 VGA BMC encoder. This function performs a few
> register writes to inform the BMC of an upcoming mode change, and then
> polls to wait until the BMC actually stops.
> 
> The polling is implemented using a busy loop with udelay() and an iteration
> timeout of 300, resulting in the function blocking for 300 milliseconds.
> 
> The function gets called ultimately by the output_poll_execute work thread
> for the DRM output change polling thread of the mgag200 driver:
> 
> kworker/0:0-mm_    3528 [000]  4555.315364:
>          ffffffffaa0e25b3 delay_halt.part.0+0x33
>          ffffffffc03f6188 mgag200_bmc_stop_scanout+0x178
>          ffffffffc087ae7a disable_outputs+0x12a
>          ffffffffc087c12a drm_atomic_helper_commit_tail+0x1a
>          ffffffffc03fa7b6 mgag200_mode_config_helper_atomic_commit_tail+0x26
>          ffffffffc087c9c1 commit_tail+0x91
>          ffffffffc087d51b drm_atomic_helper_commit+0x11b
>          ffffffffc0509694 drm_atomic_commit+0xa4
>          ffffffffc05105e8 drm_client_modeset_commit_atomic+0x1e8
>          ffffffffc0510ce6 drm_client_modeset_commit_locked+0x56
>          ffffffffc0510e24 drm_client_modeset_commit+0x24
>          ffffffffc088a743 __drm_fb_helper_restore_fbdev_mode_unlocked+0x93
>          ffffffffc088a683 drm_fb_helper_hotplug_event+0xe3
>          ffffffffc050f8aa drm_client_dev_hotplug+0x9a
>          ffffffffc088555a output_poll_execute+0x29a
>          ffffffffa9b35924 process_one_work+0x194
>          ffffffffa9b364ee worker_thread+0x2fe
>          ffffffffa9b3ecad kthread+0xdd
>          ffffffffa9a08549 ret_from_fork+0x29
> 
> On a server running ptp4l with the mgag200 driver loaded, we found that
> ptp4l would sometimes get blocked from execution because of this busy
> waiting loop.
> 
> Every so often, approximately once every 20 minutes -- though with large
> variance -- the output_poll_execute() thread would detect some sort of
> change that required performing a hotplug event which results in attempting
> to stop the BMC scanout, resulting in a 300msec delay on one CPU.
> 
> On this system, ptp4l was pinned to a single CPU. When the
> output_poll_execute() thread ran on that CPU, it blocked ptp4l from
> executing for its 300 millisecond duration.
> 
> This resulted in PTP service disruptions such as failure to send a SYNC
> message on time, failure to handle ANNOUNCE messages on time, and clock
> check warnings from the application. All of this despite the application
> being configured with FIFO_RT and a higher priority than the background
> workqueue tasks. (However, note that the kernel did not use
> CONFIG_PREEMPT...)
> 
> It is unclear if the event is due to a faulty VGA connection, another bug,
> or actual events causing a change in the connection. At least on the system
> under test it is not a one-time event and consistently causes disruption to
> the time sensitive applications.
> 
> The function has some helpful comments explaining what steps it is
> attempting to take. In particular, step 3a and 3b are explained as such:
> 
>    3a - The third step is to verify if there is an active scan. We are
>         waiting on a 0 on remhsyncsts (<XSPAREREG<0>.
> 
>    3b - This step occurs only if the remove is actually scanning. We are
>         waiting for the end of the frame which is a 1 on remvsyncsts
>         (<XSPAREREG<1>).
> 
> The actual steps 3a and 3b are implemented as while loops with a
> non-sleeping udelay(). The first step iterates while the tmp value at
> position 0 is *not* set. That is, it keeps iterating as long as the bit is
> zero. If the bit is already 0 (because there is no active scan), it will
> iterate the entire 300 attempts which wastes 300 milliseconds in total.
> This is opposite of what the description claims.
> 
> The step 3b logic only executes if we do not iterate over the entire 300
> attempts in the first loop. If it does trigger, it is trying to check and
> wait for a 1 on the remvsyncsts. However, again the condition is actually
> inverted and it will loop as long as the bit is 1, stopping once it hits
> zero (rather than the explained attempt to wait until we see a 1).
> 
> Worse, both loops are implemented using non-sleeping waits which spin
> instead of allowing the scheduler to run other processes. If the kernel is
> not configured to allow arbitrary preemption, it will waste valuable CPU
> time doing nothing.
> 
> There does not appear to be any documentation for the BMC register
> interface, beyond what is in the comments here. It seems more probable that
> the comment here is correct and the implementation accidentally got
> inverted from the intended logic.
> 
> Reading through other DRM driver implementations, it does not appear that
> the .atomic_enable or .atomic_disable handlers need to delay instead of
> sleep. For example, the ast_astdp_encoder_helper_atomic_disable() function
> calls ast_dp_set_phy_sleep() which uses msleep(). The "atomic" in the name
> is referring to the atomic modesetting support, which is the support to
> enable atomic configuration from userspace, and not to the "atomic context"
> of the kernel. There is no reason to use udelay() here if a sleep would be
> sufficient.
> 
> Replace the while loops with a read_poll_timeout() based implementation
> that will sleep between iterations, and which stops polling once the
> condition is met (instead of looping as long as the condition is met). This
> aligns with the commented behavior and avoids blocking on the CPU while
> doing nothing.
> 
> Note the RREG_DAC is implemented using a statement expression to allow
> working properly with the read_poll_timeout family of functions. The other
> RREG_<TYPE> macros ought to be cleaned up to have better semantics, and
> several places in the mgag200 driver could make use of RREG_DAC or similar
> RREG_* macros should likely be cleaned up for better semantics as well, but
> that task has been left as a future cleanup for a non-bugfix.
> 
> Fixes: 414c45310625 ("mgag200: initial g200se driver (v2)")
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
> ---
> We still do not know if the reconfiguration is caused by a different
> bug or by a faulty VGA connector or something else. However, there is no
> reason that this function should be spinning instead of sleeping while
> waiting for the BMC scan to stop.
> 
> It is known that removing the mgag200 module avoids the issue. It is also
> likely that use of CONFIG_PREEMPT (or CONFIG_PREEMPT_RT) could allow the
> high priority process to preempt the kernel thread even while it is
> delaying. However, it is better to let the process sleep() so that other
> tasks can execute even if these steps are not taken.
> 
> There are multiple other udelay() which likely could safely be converted to
> usleep_range(). However they are all short, and I felt that the smallest
> targeted fix made the most sense. They could perhaps be cleaned up in a
> non-fix commit or series along with other improvements like fixing the
> other RREG_* macros.
> 
> Thanks to Thomas Zimmermann for catching the originally unintended flipping
> of the loop condition, and for helping determine this seems to actually be
> correct. It seems likely that we are blocking for 300 milliseconds every
> time unintentionally because we loop until there is an active scan instead
> of looping until there is no more active scan.
> ---
> Changes in v2:
> - Update the description after the insights from Thomas, and the testing
>    from Jocelyn.
> - Fix some minor typos in the comments.
> - No functional change from v1, though we now explain why we're changing
>    the conditions in the commit message properly.
> - Link to v1: https://patch.msgid.link/20260128-jk-mgag200-fix-bad-udelay-v1-1-db02e04c343d@intel.com
> ---
>   drivers/gpu/drm/mgag200/mgag200_drv.h |  6 ++++++
>   drivers/gpu/drm/mgag200/mgag200_bmc.c | 31 ++++++++++++-------------------
>   2 files changed, 18 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
> index f4bf40cd7c88..a875c4bf8cbe 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> @@ -111,6 +111,12 @@
>   #define DAC_INDEX 0x3c00
>   #define DAC_DATA 0x3c0a
>   
> +#define RREG_DAC(reg)						\
> +	({							\
> +		WREG8(DAC_INDEX, reg);				\
> +		RREG8(DAC_DATA);				\
> +	})							\
> +
>   #define WREG_DAC(reg, v)					\
>   	do {							\
>   		WREG8(DAC_INDEX, reg);				\
> diff --git a/drivers/gpu/drm/mgag200/mgag200_bmc.c b/drivers/gpu/drm/mgag200/mgag200_bmc.c
> index a689c71ff165..bbdeb791c5b3 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_bmc.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_bmc.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   
>   #include <linux/delay.h>
> +#include <linux/iopoll.h>
>   
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_edid.h>
> @@ -12,7 +13,7 @@
>   void mgag200_bmc_stop_scanout(struct mga_device *mdev)
>   {
>   	u8 tmp;
> -	int iter_max;
> +	int ret;
>   
>   	/*
>   	 * 1 - The first step is to inform the BMC of an upcoming mode
> @@ -42,30 +43,22 @@ void mgag200_bmc_stop_scanout(struct mga_device *mdev)
>   
>   	/*
>   	 * 3a- The third step is to verify if there is an active scan.
> -	 * We are waiting for a 0 on remhsyncsts <XSPAREREG<0>).
> +	 * We are waiting for a 0 on remhsyncsts (<XSPAREREG<0>).
>   	 */
> -	iter_max = 300;
> -	while (!(tmp & 0x1) && iter_max) {
> -		WREG8(DAC_INDEX, MGA1064_SPAREREG);
> -		tmp = RREG8(DAC_DATA);
> -		udelay(1000);
> -		iter_max--;
> -	}
> +	ret = read_poll_timeout(RREG_DAC, tmp, !(tmp & 0x1),
> +				1000, 300000, false,
> +				MGA1064_SPAREREG);
> +	if (ret == -ETIMEDOUT)
> +		return;
>   
>   	/*
> -	 * 3b- This step occurs only if the remove is actually
> +	 * 3b- This step occurs only if the remote BMC is actually
>   	 * scanning. We are waiting for the end of the frame which is
>   	 * a 1 on remvsyncsts (XSPAREREG<1>)
>   	 */
> -	if (iter_max) {
> -		iter_max = 300;
> -		while ((tmp & 0x2) && iter_max) {
> -			WREG8(DAC_INDEX, MGA1064_SPAREREG);
> -			tmp = RREG8(DAC_DATA);
> -			udelay(1000);
> -			iter_max--;
> -		}
> -	}
> +	(void)read_poll_timeout(RREG_DAC, tmp, (tmp & 0x2),
> +				1000, 300000, false,
> +				MGA1064_SPAREREG);
>   }
>   
>   void mgag200_bmc_start_scanout(struct mga_device *mdev)
> 
> ---
> base-commit: e535c23513c63f02f67e3e09e0787907029efeaf
> change-id: 20260127-jk-mgag200-fix-bad-udelay-409133777e3a
> 
> Best regards,
> --
> Jacob Keller <jacob.e.keller@intel.com>
> 

