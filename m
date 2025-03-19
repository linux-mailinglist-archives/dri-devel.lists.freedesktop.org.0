Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 399EFA68D4A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 13:59:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2252C10E4F8;
	Wed, 19 Mar 2025 12:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="DnLnAZ1T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BRdH6LP8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DnLnAZ1T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BRdH6LP8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA8310E4F8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 12:59:16 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 88F8E1FE07;
 Wed, 19 Mar 2025 12:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742389151; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fiddPdxx3/rJGEodv2JFq71VP8YLk0vxQxAJTLmU6Gw=;
 b=DnLnAZ1TJOcwYtwxU3LJpRrIsmjjijJVGHnZUorxrc894RsxAiBzbEmkyegbc9MsxxiSFj
 tIljvjVmXsf9RSP3UREBTXDmLIQjG9pn8wFqKcKms6gGeaawmYtnp7bPKkdWaUXIQjwvgg
 vm8WBUnyX/ov4tWt70OBs0DOD/eHC1s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742389151;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fiddPdxx3/rJGEodv2JFq71VP8YLk0vxQxAJTLmU6Gw=;
 b=BRdH6LP8c4iajWdQzRiJPpjb986zAlBDVuXjlmFUEyHA4zSwjh+yw6ojzS0f+VIetrxlj7
 2HcD3hK697dKRkDg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DnLnAZ1T;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BRdH6LP8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742389151; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fiddPdxx3/rJGEodv2JFq71VP8YLk0vxQxAJTLmU6Gw=;
 b=DnLnAZ1TJOcwYtwxU3LJpRrIsmjjijJVGHnZUorxrc894RsxAiBzbEmkyegbc9MsxxiSFj
 tIljvjVmXsf9RSP3UREBTXDmLIQjG9pn8wFqKcKms6gGeaawmYtnp7bPKkdWaUXIQjwvgg
 vm8WBUnyX/ov4tWt70OBs0DOD/eHC1s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742389151;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fiddPdxx3/rJGEodv2JFq71VP8YLk0vxQxAJTLmU6Gw=;
 b=BRdH6LP8c4iajWdQzRiJPpjb986zAlBDVuXjlmFUEyHA4zSwjh+yw6ojzS0f+VIetrxlj7
 2HcD3hK697dKRkDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5683013A2C;
 Wed, 19 Mar 2025 12:59:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id HYrcE5+/2mejFQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 19 Mar 2025 12:59:11 +0000
Message-ID: <2c500081-4671-4498-bc6f-6f9350d4f01c@suse.de>
Date: Wed, 19 Mar 2025 13:59:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/18] drm: Provide helpers for system framebuffers and
 add efidrm/vesadrm
To: nerdopolis <bluescreen_avenger@verizon.net>, javierm@redhat.com,
 simona@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, dri-devel@lists.freedesktop.org
References: <20250319083021.6472-1-tzimmermann@suse.de>
 <7990728.29KlJPOoH8@nerdopolis2>
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
In-Reply-To: <7990728.29KlJPOoH8@nerdopolis2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 88F8E1FE07
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,verizon.net];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[verizon.net,redhat.com,ffwll.ch,gmail.com,linux.intel.com,kernel.org,lists.freedesktop.org];
 ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 MID_RHS_MATCH_FROM(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[7]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, suse.de:dkim, opensuse.org:url,
 imap1.dmz-prg2.suse.org:rdns, imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
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

Hi

Am 19.03.25 um 13:50 schrieb nerdopolis:
> On Wednesday, March 19, 2025 3:44:59 AM EDT Thomas Zimmermann wrote:
>> This series simplifies the existing ofdrm and simepldrm drivers,
>> and adds new drivers for EFI- and VESA-based framebuffers. Existing
>> drivers for system framebuffers, ofdrm and simpledrm, share much of
>> their mode-setting pipeline. The major difference between the two
>> drivers is in how they retrieve the framebuffer from the systems.
>> Hence, it makes sense to share some of the pipeline implementation.
>> With the shared helpers in place, we can then add dedicated drivers
>> for EFI and VESA easily.
>>
>> Patches 1 to 3 clean up obsolete artifacts from ofdrm and simpledrm.
>>
>> Patch 4 moves both drivers from tiny/ into their own subdirectory
>> sysfb/. The name aligns with the naming in drivers/firmware/sysfb.c
>> to signal the connection. It's the firmware code that creates most
>> of the system-framebuffer devices that these drivers operate on. The
>> patch also adds a separate menu in Kconfig.
>>
>> Patches 5 to 11 unify the mode-setting pipeline between ofdrm and
>> simpledrm. Either both drivers already use the same implementation
>> or they can easily do so. There've been previous attempts to unify
>> some of the drivers' code, but with little success. This time the
>> helpers will be shared among 4 drivers, so it's already much more
>> successful than before.
>>
>> Patch 12 adds EDID support to ofdrm. The EDID data can be found in
>> some Macintosh's DeviceTree next to the framebuffer configuration.
>> EDID support will be useful for EFI and VESA as well.
>>
>> Patch 13 adds another helper for screen_info that will be required
>> by EFI and VESA drivers.
>>
>> Patch 14 and 15 add efidrm, a DRM driver that operates on EFI-provided
>> framebuffers. It uses the shared sysfb helpers. The immediate benefit
>> over simpledrm is the support for EFI's various types of memory caching
>> on the framebuffer. Simpledrm only supported WriteCombine caching.
>> There's also EDID support if the kernel's edid_info has been initialized.
>> This feature needs to be implemented in the kernel's efistub library.
>>
>> Patches 16 to 18 add vesadrm, a DRM driver that operates in VESA-
>> provided framebuffers. It is very much like efidrm, but tailored
>> towards VESA features. It has EDID support and there's a patch at [1]
>> for grub to provide the data as part of the kernel's boot parameters.
>> Vesadrm also supports gamma ramps. Together with EDID, this allows
>> for gamma correction and night mode. Gnome already does that.
>>
>> Future directions: Efidrm requires EDID data that has to be provided
>> by the efistub library. There is an EFI call to do so. Vesadrm currently
>> requires a discrete color mode. Support for palette modes can be added
>> later. There's still a bit of code duplication among palette handling.
>> We have more drivers that use similar code for palette LUTs, such as
>> ast and mgag200. We should try to provide generic palette helpers for
>> all these drivers.
>>
>> This series has been tested on various devices that require the provided
>> drivers.
>>
>> [1] https://build.opensuse.org/projects/home:tdz:branches:Base:System/packages/grub2/files/grub2-provide-edid.patch?expand=1
>>
>> Thomas Zimmermann (18):
>>    drm/ofdrm: Remove struct ofdrm_device.pdev
>>    drm/ofdrm: Open-code drm_simple_encoder_init()
>>    drm/simpledrm: Remove struct simpledrm_device.nformats
>>    drm: Move sysfb drivers into separate subdirectory
>>    drm/sysfb: Add struct drm_sysfb_device
>>    drm/sysfb: Provide single mode-init helper
>>    drm/sysfb: Merge mode-config functions
>>    drm/sysfb: Merge connector functions
>>    drm/sysfb: Maintain CRTC state in struct drm_sysfb_crtc_state
>>    drm/sysfb: Merge CRTC functions
>>    drm/sysfb: Merge primary-plane functions
>>    drm/sysfb: ofdrm: Add EDID support
>>    firmware: sysfb: Move bpp-depth calculation into screen_info helper
>>    drm/sysfb: Add efidrm for EFI displays
>>    drm/sysfb: efidrm: Add EDID support
>>    drm/sysfb: Add vesadrm for VESA displays
>>    drm/sysfb: vesadrm: Add EDID support
>>    drm/sysfb: vesadrm: Add gamma correction
>>
>>   MAINTAINERS                                 |   3 +-
>>   drivers/firmware/sysfb_simplefb.c           |  31 +-
>>   drivers/gpu/drm/Kconfig                     |   2 +
>>   drivers/gpu/drm/Makefile                    |   1 +
>>   drivers/gpu/drm/sysfb/Kconfig               |  76 +++
>>   drivers/gpu/drm/sysfb/Makefile              |   8 +
>>   drivers/gpu/drm/sysfb/drm_sysfb_helper.c    | 319 ++++++++++
>>   drivers/gpu/drm/sysfb/drm_sysfb_helper.h    | 136 ++++
>>   drivers/gpu/drm/sysfb/efidrm.c              | 495 +++++++++++++++
>>   drivers/gpu/drm/{tiny => sysfb}/ofdrm.c     | 364 ++---------
>>   drivers/gpu/drm/{tiny => sysfb}/simpledrm.c | 237 +------
>>   drivers/gpu/drm/sysfb/vesadrm.c             | 660 ++++++++++++++++++++
>>   drivers/gpu/drm/tiny/Kconfig                |  32 -
>>   drivers/gpu/drm/tiny/Makefile               |   2 -
>>   drivers/video/screen_info_generic.c         |  36 ++
>>   include/linux/screen_info.h                 |   9 +
>>   include/video/pixel_format.h                |  41 ++
>>   17 files changed, 1885 insertions(+), 567 deletions(-)
>>   create mode 100644 drivers/gpu/drm/sysfb/Kconfig
>>   create mode 100644 drivers/gpu/drm/sysfb/Makefile
>>   create mode 100644 drivers/gpu/drm/sysfb/drm_sysfb_helper.c
>>   create mode 100644 drivers/gpu/drm/sysfb/drm_sysfb_helper.h
>>   create mode 100644 drivers/gpu/drm/sysfb/efidrm.c
>>   rename drivers/gpu/drm/{tiny => sysfb}/ofdrm.c (75%)
>>   rename drivers/gpu/drm/{tiny => sysfb}/simpledrm.c (76%)
>>   create mode 100644 drivers/gpu/drm/sysfb/vesadrm.c
>>   create mode 100644 include/video/pixel_format.h
>>
>>
> FYI When this gets merged,
> https://gitlab.freedesktop.org/xorg/xserver/-/blob/master/hw/xfree86/common/xf86platformBus.c?ref_type=heads#L589
> might need to be updated to add exceptions for vesadrm and efidrm like there
> is for simpledrm.

Yeah, we need a workaround for each of these drivers unfortunately.

> I am willing to open a merge request, but freedesktop is readonly for now
> during their migration.

No worries, I'll provide the patches.

Best regards
Thomas

>
>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

