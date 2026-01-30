Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHmCLzS6fGk0OgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 15:03:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C77B7BB71C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 15:03:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C047C10E0B7;
	Fri, 30 Jan 2026 14:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="NOOvIBMc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="G/1gH+th";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yrKh5IeP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uH4ebGJe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9938910E0B7
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 14:03:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BD3C534722;
 Fri, 30 Jan 2026 14:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1769781807; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hx7JSfqo6prQnFtiJ9n8NFVfauePCUDnrC4x1EH5+kM=;
 b=NOOvIBMcAhez32a6Ry/IOYerVaWHp+SUNSbNrf8vlZHNAXN2XRDUtzsEawVnUJyI/n9p9f
 W2t72ZsD4vNpLNorLuMh03HoJ+smA898vG/6+cKNGSjGZjGPEN4h3/ssF3LnZncP0iUuTD
 CR/ANu4yQS65fLyESfhIJNP2cyRcRr0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1769781807;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hx7JSfqo6prQnFtiJ9n8NFVfauePCUDnrC4x1EH5+kM=;
 b=G/1gH+thr8o/9hjn7TkaVn9xHe/el7zruB+X/Nnr0+JhdOE/LhCvnjcsqEEXz8Gusd280U
 QbWP5HxgR8SYCfCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1769781805; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hx7JSfqo6prQnFtiJ9n8NFVfauePCUDnrC4x1EH5+kM=;
 b=yrKh5IePvexgkosutZ6CsY/fF7YWyiWfJFNl6bmCgumycrUVcpDzb8xPLEvjjjcvzmTyIj
 k4X5/4Z2pTcWBKvsF8Ob0mjC59ksOxlCxpdsUd27TA5js/zM/bBcTpIQN+5Yj/alu5R13j
 fOXh9FjIeT9JiXzK4QVrraigXEo5H4A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1769781805;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hx7JSfqo6prQnFtiJ9n8NFVfauePCUDnrC4x1EH5+kM=;
 b=uH4ebGJeIDKnWxEtrNzsmqHBK2cHwAt5OHNw4IcdgDqJU0/CXOv80HZnQMH637WPY1zYMU
 fcbjYhwdhQBHB1Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 64CB93EA61;
 Fri, 30 Jan 2026 14:03:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id lk/IFi26fGlRNQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 30 Jan 2026 14:03:25 +0000
Message-ID: <4272ae94-902e-40dc-86ce-62b642fa9656@suse.de>
Date: Fri, 30 Jan 2026 15:03:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mgag200: sleep instead of busy wait for BMC
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>
Cc: Pasi Vaananen <pvaanane@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260128-jk-mgag200-fix-bad-udelay-v1-1-db02e04c343d@intel.com>
 <338ff7cf-1c7d-48da-b1b8-37aac440fed0@suse.de>
 <88f33e4e-5d0e-4520-a399-5be2901a3281@intel.com>
 <27af79a8-ee84-4845-a737-82d3883536e7@redhat.com>
 <8d238204-b0f6-48a7-9afc-480097c32a23@suse.de>
 <770785c9-266b-4ebb-a0a1-f5e615e45855@redhat.com>
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
In-Reply-To: <770785c9-266b-4ebb-a0a1-f5e615e45855@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
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
	FORGED_RECIPIENTS(0.00)[m:jfalempe@redhat.com,m:jacob.e.keller@intel.com,m:airlied@redhat.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:pvaanane@redhat.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.com:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C77B7BB71C
X-Rspamd-Action: no action

Hi,

I don't understand this.

Am 30.01.26 um 14:27 schrieb Jocelyn Falempe:
> Hi,
>
> To take some measurement, I've put this instead of step 3a of 
> mgag200_bmc_stop_scanout()
>
> for (i = 0; i < 100000; i++) {
>     WREG8(DAC_INDEX, MGA1064_SPAREREG);
>     tmp = RREG8(DAC_DATA);
>     pr_info("MGA Sparereg %02x\n", tmp);
>     udelay(10);
> }
> return;

What do you actually measure? The loop in 3a is supposed to end as soon 
as bit 0x1 signals that the hsync is active.

Are you sure that the pr_info() doesn't interfere with the loop? This is 
a tight loop to catch the bit when it flips. Putting that pr_info() 
there in the loop can take plenty of time.



>
> It's called at boot at
> [   45.110616] MGA STOP SCANOUT
> [   45.110631] MGA Sparereg 84
> it oscillates between 80, 81, 82, 83, 84 for ~4310us
> [   45.114941] MGA Sparereg 81
> then stays at 81 for ~227ms
> [   45.342492] MGA Sparereg 81
> [   45.342504] MGA Sparereg 80
> and stays at 80 for 1136ms, until the end of the loop.
> [   46.356152] MGA Sparereg 80
>
> Then it's called a few time when my display go blank and each time a 
> different behavior is seen
>
> [  729.448040] MGA STOP SCANOUT
> [  729.448055] MGA Sparereg 80
> it oscillates between 80, 81, 82, 83, 84 for ~39258us
> [  729.487313] MGA Sparereg 81
> then stays at 81 for ~230ms
> [  729.717349] MGA Sparereg 81
> [  729.717363] MGA Sparereg 80
> then back to 80
>
> This one is strange, it stays at 0x81 for 1191ms
> [  838.307042] MGA STOP SCANOUT
> [  838.307055] MGA Sparereg 81
> [  839.498450] MGA Sparereg 81
>
> And the last one, this time it stays at 0x80 for 1235ms
>
> [ 4318.439032] MGA STOP SCANOUT
> [ 4318.439047] MGA Sparereg 80
> [ 4319.674140] MGA Sparereg 80
>
> So my conclusion, is that the bit 2 is almost never seen when polling 
> at 10us, so there is no chance to see it if polling at 1000us like 
> it's done by the driver. So the step 3b won't work at all on my setup.



>
> But even the bit 1 can stay set or unset for more than 1s, so it looks 
> very unreliable to rely on it, at least on this hardware.

Did you connect to the BMC virtual display while performing the test?


>
> I feel like doing a msleep(300) is probably the best bet.
> If you still trust the hardware, maybe it should wait for ~100us, then 
> check the bit 1 and wait until it goes back to 0.

Here's an example calculation: with 1920x1080@60Hz, there are 1125 lines 
overall. So

   (1,000,000 usec/sec / 60 Hz) / 1125 lines ~= 14.8 usec / line.

There are 2200 pixels on each scanline. So

   (1 - (1920 pixels / 2200 pixels) ) * 14.8 usec / line ~= 1.88 usec

This is roughly the time that the CRTC spends in each scanline's blank 
area and likely the upper bound for the duration of a single polling 
with that display mode. Otherwise, we might miss the blank.

Honestly, I'd just take the proposed patch as it is and not bother any 
further. I think this is the correct fix unless we can figure out the 
exact meaning of these bits and the BMC.

If anything, we could try to reduce the polling time to 1 usec and 
reduce the number of iterations to 50. This would give us 3 scanlines to 
catch the bit.


Best regards
Thomas


>
> You can find below the raw dmesg (I just removed the lines where the 
> value is equal to the previous and next line, to make it smaller).
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


