Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C257EB22827
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 15:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D41510E166;
	Tue, 12 Aug 2025 13:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="UtgZG6G5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EA6BljAq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UtgZG6G5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EA6BljAq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E19910E166
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 13:18:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CC4501F45B;
 Tue, 12 Aug 2025 13:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755004725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=QRs3Lbu/CyqX1NOfs/4bvgoB0mLNEji8vX3OaJ0mTX4=;
 b=UtgZG6G5F8rqx8Eco59BNijBiVIzfrqtFnvstXMUCNL+8EFQbibfyUQ9pZRxJxcnxp59u2
 aS5wl8OE2RrAvVXODJXnueVN1XstL9/3O9eMGqcdZb3ep4JMMJRZ14iDr5vgbTibmNL9He
 Tsd4CeE998lnUXFTk6ZQU3cmCm9Q/pA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755004725;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=QRs3Lbu/CyqX1NOfs/4bvgoB0mLNEji8vX3OaJ0mTX4=;
 b=EA6BljAqZc1barv1BCS9HXZcaH+ZI3vv7ku4o303GZb+vY9WXLnxZsjsvTVnoI+m8GbtsR
 ODaMLDHlGkQI8+Bg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755004725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=QRs3Lbu/CyqX1NOfs/4bvgoB0mLNEji8vX3OaJ0mTX4=;
 b=UtgZG6G5F8rqx8Eco59BNijBiVIzfrqtFnvstXMUCNL+8EFQbibfyUQ9pZRxJxcnxp59u2
 aS5wl8OE2RrAvVXODJXnueVN1XstL9/3O9eMGqcdZb3ep4JMMJRZ14iDr5vgbTibmNL9He
 Tsd4CeE998lnUXFTk6ZQU3cmCm9Q/pA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755004725;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=QRs3Lbu/CyqX1NOfs/4bvgoB0mLNEji8vX3OaJ0mTX4=;
 b=EA6BljAqZc1barv1BCS9HXZcaH+ZI3vv7ku4o303GZb+vY9WXLnxZsjsvTVnoI+m8GbtsR
 ODaMLDHlGkQI8+Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5AC67136C7;
 Tue, 12 Aug 2025 13:18:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id nf37FDU/m2jgOgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 12 Aug 2025 13:18:45 +0000
Message-ID: <3fad47e3-c1e7-4f37-8341-402d2756ea20@suse.de>
Date: Tue, 12 Aug 2025 15:18:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] accel: Add Arm Ethos-U NPU driver
To: Rob Herring <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20250811-ethos-v2-0-a219fc52a95b@kernel.org>
 <20250811-ethos-v2-2-a219fc52a95b@kernel.org>
 <8a872e48-0743-43b0-8259-70d6b8e4c221@suse.de>
 <CAL_JsqJL5sy7Otzo7R8mYW_-7s+ajggjtuW7tYBnVxYPaJHs+w@mail.gmail.com>
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
In-Reply-To: <CAL_JsqJL5sy7Otzo7R8mYW_-7s+ajggjtuW7tYBnVxYPaJHs+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWELVE(0.00)[18];
 ARC_NA(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[tomeuvizoso.net,kernel.org,linux.intel.com,gmail.com,ffwll.ch,linaro.org,amd.com,arm.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
 RCVD_COUNT_TWO(0.00)[2]; TAGGED_RCPT(0.00)[dt];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.de:email,
 suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -2.80
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

Hi

Am 12.08.25 um 14:56 schrieb Rob Herring:
> On Tue, Aug 12, 2025 at 6:01 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Hi
>>
>> Am 11.08.25 um 23:05 schrieb Rob Herring (Arm):
>>> Add a driver for Arm Ethos-U65/U85 NPUs. The Ethos-U NPU has a
>>> relatively simple interface with single command stream to describe
>>> buffers, operation settings, and network operations. It supports up to 8
>>> memory regions (though no h/w bounds on a region). The Ethos NPUs
>>> are designed to use an SRAM for scratch memory. Region 2 is reserved
>>> for SRAM (like the downstream driver stack and compiler). Userspace
>>> doesn't need access to the SRAM.
>>>
>>> The h/w has no MMU nor external IOMMU and is a DMA engine which can
>>> read and write anywhere in memory without h/w bounds checks. The user
>>> submitted command streams must be validated against the bounds of the
>>> GEM BOs. This is similar to the VC4 design which validates shaders.
>>>
>>> The job submit is based on the rocket driver for the Rockchip NPU
>>> utilizing the GPU scheduler. It is simpler as there's only 1 core rather
>>> than 3.
>>>
>>> Tested on i.MX93 platform (U65) with WIP Mesa Teflon support.
>>>
>>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>> I've looked over this patch and it looks good to me. There's a
>> dev_info() in ethos_init() of which I think it should become drm_dbg().
>> Anyway
> I prefer to print out what h/w we've discovered. That's a fairly
> common pattern for drivers (and more useful than announcing drivers
> that only loaded).
>
>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Thanks!
>
>> Side note: I noticed that there's buffer-allocation code here that
>> reinvents dumb buffers. We've ocationally talked about creating a better
>> dumb-buffers ioctl interface and this drivers could be another use case.
> Yeah. In the past I got told don't use dumb buffers APIs for anything
> but dumb scanout buffers. I guess with enough copies opinions
> change...

That advice wasn't wrong. But the current dumb-buffer ioctls don't 
support scanout buffers well either. If we build something new, we can 
try to cover additional use cases as well.

Best regards
Thomas

>
> Rob

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


