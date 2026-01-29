Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MeGJUAXe2lCBQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 09:16:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 030BFAD5BE
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 09:15:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD2210E80D;
	Thu, 29 Jan 2026 08:15:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="se+bll9A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OUN40Cxq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="se+bll9A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OUN40Cxq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D2910E7FC
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 08:15:54 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B33E034023;
 Thu, 29 Jan 2026 08:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1769674552; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=v9d/MEoV7myrZ+rWj2IPTvfVA5M+BaGg3bhUppV229Q=;
 b=se+bll9AM3pqqWlOERJO8xzyszD+sqUEEmmKIw9/z5KAsa2nMrMGlzbVxUR8Ej5l+nkbBE
 KggyyblXuxIR3pTPXnGsAFjNpqzCGAuEHEvw5hjYCkZyES+7M/uJt+LPXQKp8+dTck5a0w
 aRhNvZt//E61KhQc5ApwUZTBVeCBMP8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1769674552;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=v9d/MEoV7myrZ+rWj2IPTvfVA5M+BaGg3bhUppV229Q=;
 b=OUN40CxqXhOQS+T0gaNG5dSmD35ewy+jORif0hZn+eAZAwVrBd31gGotSFeHxPFANyAEIe
 cOQK3SJkdI1kpSBA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=se+bll9A;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=OUN40Cxq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1769674552; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=v9d/MEoV7myrZ+rWj2IPTvfVA5M+BaGg3bhUppV229Q=;
 b=se+bll9AM3pqqWlOERJO8xzyszD+sqUEEmmKIw9/z5KAsa2nMrMGlzbVxUR8Ej5l+nkbBE
 KggyyblXuxIR3pTPXnGsAFjNpqzCGAuEHEvw5hjYCkZyES+7M/uJt+LPXQKp8+dTck5a0w
 aRhNvZt//E61KhQc5ApwUZTBVeCBMP8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1769674552;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=v9d/MEoV7myrZ+rWj2IPTvfVA5M+BaGg3bhUppV229Q=;
 b=OUN40CxqXhOQS+T0gaNG5dSmD35ewy+jORif0hZn+eAZAwVrBd31gGotSFeHxPFANyAEIe
 cOQK3SJkdI1kpSBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6436C3EA61;
 Thu, 29 Jan 2026 08:15:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Q49CFzgXe2kUVgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 29 Jan 2026 08:15:52 +0000
Message-ID: <338ff7cf-1c7d-48da-b1b8-37aac440fed0@suse.de>
Date: Thu, 29 Jan 2026 09:15:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mgag200: sleep instead of busy wait for BMC
To: Jacob Keller <jacob.e.keller@intel.com>, Dave Airlie
 <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>
Cc: Pasi Vaananen <pvaanane@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260128-jk-mgag200-fix-bad-udelay-v1-1-db02e04c343d@intel.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20260128-jk-mgag200-fix-bad-udelay-v1-1-db02e04c343d@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.51
X-Spam-Level: 
X-Spam-Flag: NO
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
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jacob.e.keller@intel.com,m:airlied@redhat.com,m:jfalempe@redhat.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:pvaanane@redhat.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,suse.de:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Queue-Id: 030BFAD5BE
X-Rspamd-Action: no action

Hi,

thanks for the patch. If I'm not mistaken, you have fixed a 
long-standing bug. See my comments below.

Please double check my comments and, if valid, integrate them into the 
commit description.

Am 28.01.26 um 21:41 schrieb Jacob Keller:
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
> Every so often, approximately once every 20 minutes though with large
> variance, the output_poll_execute() thread would detect some sort of change
> that required performing a hotplug event which results in attempting to
> stop the BMC scanout, resulting in a 300msec delay on one CPU.
>
> On this system, ptp4l was pinned to a single CPU. When the
> output_poll_execute() thread ran on that CPU, it blocked ptp4l from
> executing for its 300millisecond duration.
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

I'm not surprised. The drivers for some of the server chipsets have been 
imported from old Xorg's user-space code, so that there's something to 
work with in the kernel. We've since been fixing them to better 
integrate with the kernel.

Not busy waiting for the BMC is also a little improvement to any other 
workload.

>
> Reading through other DRM driver implementations, it does not appear that
> the .atomic_enable or .atomic_disable handlers need to delay instead of
> sleep. For example, the ast_astdp_encoder_helper_atomic_disable() function
> calls ast_dp_set_phy_sleep() which uses msleep(). The "atomic" in the name
> is referring to the atomic modesetting support, which is the support to
> enable atomic configuration from userspace, and not to the "atomic context"
> of the kernel.

Yes. "Atomic" means "apply all changes to hardware, or none".

>
> Replace the busy wait with a sleeping loop based on read_poll_timeout().
> This ensures that other time sensitive operations are not blocked from
> executing while the work thread is waiting for the BMC hardware.
>
> Note the RREG_DAC is implemented using a statement expression to allow
> working properly with the read_poll_timeout family of functions. The other
> RREG_<TYPE> macros ought to be cleaned up to have better semantics, and
> several places in the mgag200 driver could make use of RREG_DAC or similar
> RREG_* macros should likely be cleaned up for better semantics as well, but
> that task has been left as a future cleanup for a non-bugfix.
>
> Fixes: 414c45310625 ("mgag200: initial g200se driver (v2)")
> Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

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
> ---
>   drivers/gpu/drm/mgag200/mgag200_drv.h |  6 ++++++
>   drivers/gpu/drm/mgag200/mgag200_bmc.c | 27 ++++++++++-----------------
>   2 files changed, 16 insertions(+), 17 deletions(-)
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
> index a689c71ff165..599b710bab9b 100644
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
> @@ -44,28 +45,20 @@ void mgag200_bmc_stop_scanout(struct mga_device *mdev)
>   	 * 3a- The third step is to verify if there is an active scan.
>   	 * We are waiting for a 0 on remhsyncsts <XSPAREREG<0>).
>   	 */

Either these comments or the original test seems incorrect.

The test below is supposed to detect whether the BMC is scanning out 
from the framebuffer. While it reads a horizontal scanline the bit 
should be 0. That's what the test is for, but it gets the condition wrong.

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

The original while loop ran as long as "!(tmp & 0x1)".  And now the test 
stops if "!(tmp & 0x1)" AFAICT.  This (accidentally?) fixes the test and 
makes the comment correct.


> +	if (ret == -ETIMEDOUT)
> +		return;
>   
>   	/*
>   	 * 3b- This step occurs only if the remove is actually

Since you're at it, maybe fix this comment to say

'... only if the remote BMC is ...'

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

Again, the comment and original code disagree and the original test 
condition appears to be inverted. It whats to test of the BMC has 
finished scanning out the final frame. The bit should turn 1. Instead it 
tests if the bit is already 1, which is likely true. Hence that's 
probably where your 300 msec delays comes from.

Best regards
Thomas

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

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


