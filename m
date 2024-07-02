Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2FA923DB3
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 14:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF9610E5DF;
	Tue,  2 Jul 2024 12:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ZTyPRYMV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6ylSqoPA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZTyPRYMV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6ylSqoPA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F010810E5DF
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 12:27:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3EEF81FBA0;
 Tue,  2 Jul 2024 12:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719923237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5KizLw8jcCxQcoHLAU3ExR6dRUbVP8eNFsSm4MphMlI=;
 b=ZTyPRYMVFCk3wv4gsdFSi1myDxuP5HOYQ+fOtCPuQq4TjkJUmNM00iWNbAa1AkRfC+uhPz
 J93n8faStUBVqfaxzYTHGvlFebyQGoEFsNnVNrZC5y4izIHlcqkf0QRhOdsrQFHB0RFQZ2
 T4q86d5qc0gmpp8yJ2g5hRO5W22IMK0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719923237;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5KizLw8jcCxQcoHLAU3ExR6dRUbVP8eNFsSm4MphMlI=;
 b=6ylSqoPAUNXSkCT4AAvDqQUDjxaZnhHAWU+kHTdD5eurv+OSR5tmbp2SEZ5O0Je98yjwtj
 9xPiqP4PSeke31Ag==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719923237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5KizLw8jcCxQcoHLAU3ExR6dRUbVP8eNFsSm4MphMlI=;
 b=ZTyPRYMVFCk3wv4gsdFSi1myDxuP5HOYQ+fOtCPuQq4TjkJUmNM00iWNbAa1AkRfC+uhPz
 J93n8faStUBVqfaxzYTHGvlFebyQGoEFsNnVNrZC5y4izIHlcqkf0QRhOdsrQFHB0RFQZ2
 T4q86d5qc0gmpp8yJ2g5hRO5W22IMK0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719923237;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5KizLw8jcCxQcoHLAU3ExR6dRUbVP8eNFsSm4MphMlI=;
 b=6ylSqoPAUNXSkCT4AAvDqQUDjxaZnhHAWU+kHTdD5eurv+OSR5tmbp2SEZ5O0Je98yjwtj
 9xPiqP4PSeke31Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1815113A9A;
 Tue,  2 Jul 2024 12:27:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6Y6CBCXyg2bvaAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 02 Jul 2024 12:27:17 +0000
Message-ID: <c5a955b5-9b15-4c91-9765-459a04a747e2@suse.de>
Date: Tue, 2 Jul 2024 14:27:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm/udl: Implementation of atomic cursor drm_plane
To: Lukasz Spintzyk <lukasz.spintzyk@synaptics.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>
References: <20240624071041.5087-1-lukasz.spintzyk@synaptics.com>
 <5fbf1be7-5049-4596-9ad0-d40d397396d1@suse.de>
 <ZnlE-Wm2gim2Unnz@phenom.ffwll.local>
 <0dd740d1-0046-41b0-a6ac-83ef0b023f63@synaptics.com>
 <3e8783b7-12bc-4972-80f2-03cc641de26c@synaptics.com>
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
In-Reply-To: <3e8783b7-12bc-4972-80f2-03cc641de26c@synaptics.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.29
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; REDIRECTOR_URL(0.00)[proofpoint.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_TLS_ALL(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,bootlin.com:url]
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

Am 02.07.24 um 14:07 schrieb Lukasz Spintzyk:
> On 7/2/2024 2:02 PM, Lukasz Spintzyk wrote:
>> On 6/24/2024 12:05 PM, Daniel Vetter wrote:
>>> CAUTION: Email originated externally, do not click links or open 
>>> attachments unless you recognize the sender and know the content is 
>>> safe.
>>>
>>>
>>> On Mon, Jun 24, 2024 at 09:28:29AM +0200, Thomas Zimmermann wrote:
>>>> Hi
>>>>
>>>> Am 24.06.24 um 09:10 schrieb lukasz.spintzyk@synaptics.com:
>>>>> This brings cursor on DisplayLink USB2.0 device on ChromeOS 
>>>>> compositor that requires either crtc'c cursor_set callback
>>>>> or cursor drm_plane. Patch was tested on ChromeOS and Ubuntu 22.04 
>>>>> with Gnome/Wayland
>>>>
>>>> NAK on this patchset. UDL has no HW cursor support, so we won't 
>>>> implement
>>>> this in the driver. Software blending should be done in userspace, 
>>>> where you
>>>> have CPU SIMD available.
>
> Thank you Thomas,
>
> Please check, my answer below Daniel's response.
> I think that compositor still benefits cursor blending in the driver.
> At least for ChromeOS in which udl based devices are only one without 
> cursor plane support. I believe it can simplify compositor code in 
> this case.

But it complicates kernel code, which is a bad tradeoff.

Wrt the damage handling discussion in the other email, there's 
damage-handling support in the udl driver. It will only upload the small 
region around the cursor if the userspace tells it to. IIRC userspace 
needs to invoke the DIRTYFB [1] ioctl after updating the framebuffer data.

[1] 
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_ioctl.c#L634

>
> Another topic,
> What do you think about "[PATCH 4/4] drm/udl: Shutdown all CRTCs on 
> usb disconnect", IMO it is unrelated and happened to appear more 
> frequently with cursor plane.

The patch's description mentions kernel panics. AFAICT the cursor-plane 
patches don't use drm_dev_enter() and _exit(). That would explain the 
panics. Do they also happen without the cursor-plane code?

Best regards
Thomas

>
> Shall I re-upload it as separate patchset?
>
> regards
> Łukasz Spintzyk
>
>>>
>>> I think for drivers which do cpu upload and are vblank driven there's
>>> maybe a case for kernel implemented cursors due to latency reduction if
>>> the blending happens as late as possible. But udl just goes right ahead
>>> and uploads, so this doesn't help I think. damage tracking should, 
>>> but we
>>> already have that.
>>
>> Sorry, I don't get what you mean here. This implementation uploads 
>> only damaged primary plane area (gathered in 
>> udl_cursor_plane_helper_atomic_update) and uploads it to device in 
>> following immediately udl_primary_plane_helper_atomic_update. No full 
>> primary plane update is done in this case (which is done only when 
>> plane_state->fb != old_plane_state->fb, please check updated 
>> udl_primary_plane_helper_atomic_update)
>>
>> Sorry i don't have hard numbers for that but this in overall should 
>> improve cursor latency (especially for move events) in which case 
>> whole primary plane render is saved and cursor update can be done 
>> without waiting for next vsync of the primary plane.
>>
>> Ihmo this implementation can be useful to test and implement atomic 
>> updates for cursor plane in compositors.
>>
>> Anyway thanks for your(Daniel and Thomas) responses, if there is 
>> something I can do to push it then let me know.
>>
>> regards
>> Łukasz Spintzyk
>>>
>>> So concurring here.
>>> -Sima
>>> -- 
>>> Daniel Vetter
>>> Software Engineer, Intel Corporation
>>> https://urldefense.proofpoint.com/v2/url?u=http-3A__blog.ffwll.ch&d=DwIBAg&c=7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=0p1mI1lUPD-etxZm5xwnMe2dJnw8yCkW8EVTCGmBDPo&m=M1yfa7XuJVH9rCMPSuFfUD51RJsC3N6CNXSv9yDKmfmSUijg5Z3ngLzUqKBnbTgJ&s=Cs7RKpEwGAz4cdSnl3jqFctOKhaOpoHPGw3tSRPW2OI&e= 
>>>
>>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

