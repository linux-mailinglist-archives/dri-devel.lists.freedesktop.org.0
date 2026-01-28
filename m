Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEsRA7POeWnezgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 09:54:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F109E7B0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 09:54:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3756E10E625;
	Wed, 28 Jan 2026 08:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="D6Emq1kK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SAxqf04b";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D6Emq1kK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SAxqf04b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E572B10E625
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 08:54:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8D66D33AC7;
 Wed, 28 Jan 2026 08:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1769590444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YAZv04ffo29XkeHFmB2TvNcIVwje6Cc1W0+JshUHI34=;
 b=D6Emq1kKQ9rR3HCv3++5y8vDuP1wp7Lc52hnUbIne9NBRYafTmKdvUO8jHp4FW6LlgYm42
 1xk1XGrtTt3N70SmieibTjS1oWLqdf8a+THbf2LbF1E+Ssz8Jhar4cFHj3RCjKkwRz6UiH
 7syXwZQn/76EU+WvgbjrQfMrqe0GbDU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1769590444;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YAZv04ffo29XkeHFmB2TvNcIVwje6Cc1W0+JshUHI34=;
 b=SAxqf04bZT74hu6Ze4O+VQY0ypMxopnjepcvbIJftS4aiqGHxfJJFB6RT+OPABp3ZR8gEl
 ggm44ZNHawxcvmCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1769590444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YAZv04ffo29XkeHFmB2TvNcIVwje6Cc1W0+JshUHI34=;
 b=D6Emq1kKQ9rR3HCv3++5y8vDuP1wp7Lc52hnUbIne9NBRYafTmKdvUO8jHp4FW6LlgYm42
 1xk1XGrtTt3N70SmieibTjS1oWLqdf8a+THbf2LbF1E+Ssz8Jhar4cFHj3RCjKkwRz6UiH
 7syXwZQn/76EU+WvgbjrQfMrqe0GbDU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1769590444;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YAZv04ffo29XkeHFmB2TvNcIVwje6Cc1W0+JshUHI34=;
 b=SAxqf04bZT74hu6Ze4O+VQY0ypMxopnjepcvbIJftS4aiqGHxfJJFB6RT+OPABp3ZR8gEl
 ggm44ZNHawxcvmCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BC44C3EA61;
 Wed, 28 Jan 2026 08:54:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id K4qSLKvOeWn4NgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 28 Jan 2026 08:54:03 +0000
Message-ID: <064dd2b7-415b-4794-8867-73bdd7ac17df@suse.de>
Date: Wed, 28 Jan 2026 09:54:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/9] drm: verisilicon: add a driver for Verisilicon
 display controllers
To: Icenowy Zheng <uwu@icenowy.me>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Han Gao <rabenda.cn@gmail.com>,
 Yao Zi <ziyao@disroot.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Han Gao <gaohan@iscas.ac.cn>
References: <20260123092830.4046009-1-zhengxingda@iscas.ac.cn>
 <20260123092830.4046009-4-zhengxingda@iscas.ac.cn>
 <6ea016d6-42a4-4d83-89fd-eee918a834ef@suse.de>
 <7301d5f80c7f247d4a2f82c242b3d8b8ad69f5e1.camel@icenowy.me>
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
In-Reply-To: <7301d5f80c7f247d4a2f82c242b3d8b8ad69f5e1.camel@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:uwu@icenowy.me,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:p.zabel@pengutronix.de,m:lumag@kernel.org,m:m.wilczynski@samsung.com,m:luca.ceresoli@bootlin.com,m:rabenda.cn@gmail.com,m:ziyao@disroot.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:gaohan@iscas.ac.cn,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:rabendacn@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[icenowy.me,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,ffwll.ch,redhat.com];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,samsung.com,bootlin.com,gmail.com,disroot.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,iscas.ac.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,iscas.ac.cn:email,samsung.com:email,icenowy.me:email,suse.de:email,suse.de:dkim,suse.de:mid,suse.com:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C7F109E7B0
X-Rspamd-Action: no action

Hi

Am 28.01.26 um 09:39 schrieb Icenowy Zheng:
> 在 2026-01-28星期三的 08:58 +0100，Thomas Zimmermann写道：
>> Hi
>>
>> Am 23.01.26 um 10:28 schrieb Icenowy Zheng:
>>> From: Icenowy Zheng <uwu@icenowy.me>
>>>
>>> This is a from-scratch driver targeting Verisilicon DC-series
>>> display
>>> controllers, which feature self-identification functionality like
>>> their
>>> GC-series GPUs.
>>>
>>> Only DC8200 is being supported now, and only the main framebuffer
>>> is set
>>> up (as the DRM primary plane). Support for more DC models and more
>>> features is my further targets.
>>>
>>> As the display controller is delivered to SoC vendors as a whole
>>> part,
>>> this driver does not use component framework and extra bridges
>>> inside a
>>> SoC is expected to be implemented as dedicated bridges (this driver
>>> properly supports bridge chaining).
>>>
>>> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
>>> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
>>> Tested-by: Han Gao <gaohan@iscas.ac.cn>
>>> Tested-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>
>> I only briefly looked over this revision, as v5 already seemed quite
>> good. If you want to do a follow-up patch, see my other reply to v5
>> on
>> storing hardware formats in the plane state.
> Well the kernel test robot found a small Kconfig problem in this
> revision -- DRM_DISPLAY_HELPER should be selected.
>
> Maybe I'm going to send a v7 to address this.
>
> Should I also make derived plane state a change in v7, or leave it as a
> follow-up?

That would require another round of review, I guess. Better leave it for 
a separate series.

>
> By the way, I think PATCH 1-5 should go through drm-misc tree, am I
> right? Who's going to pick it if going through drm-misc?

I can do that. In v7, you can merge patch 8 (MAINTAINERS) into patch 3, 
so that it goes in as well.

Patches 6 and 7 are small, so I can also take them into drm-misc if they 
riscv maintainers are OK with that.

Best regards
Thomas

>
>> Best regards
>> Thomas
>>
>>> ---
>>> Changes in v6:
>>> - Sorted Kconfig dependency.
>>> - Get rid of obsolete uppercase DRM_* printk marcos.
>>> - Optimization to printk messages (unknown IRQ message is only
>>> printed
>>>     once, device recognition message has "Found" added, "Skipping
>>> output"
>>>     message priority lowered to debug).
>>> - Splitted most bridge functions for DPI/DP output.
>>> - Get rid of custom CRTC atomic_flush, which doesn't do anything
>>>     device-specific.
>>> - Adapted macro HZ_PER_KHZ and VSDC_DISP_TIMING_VALUE_MAX.
>>> - Switched to use drm_mode_size_dumb() to align dumb buffer pitch.
>>> - Reordered some function calls in vs_drm_initialize() (
>>>     aperture_remove_all_conflicting_devices() is now called earlier
>>> and
>>>     drm_mode_config_reset() is now called later).
>>> - Splitted out vs_fb_get_dma_addr() and switched to use
>>>     drm_format_info_min_pitch() to calculate the src X offset to the
>>>     framebuffer address.
>>> - Splitted out atomic_{en,dis}able for primary plane.
>>> - Removed an unused pm_runtime.h inclusion because the driver now
>>> does
>>>     not do runpm.
>>>
>>> Changes in v5:
>>> - Switching to drm_atomic_get_new_bridge_state, which seems to let
>>> the
>>>     driver get rid of the hack of saving bus format itself.
>>> - Add the internal bridge before attaching it.
>>> - Adapted next_bridge struct field name suggested by Luca Ceresoli.
>>> - Refactored the probe code to not use port count, to allow port@0
>>> being
>>>     missing.
>>>
>>> Changes in v4:
>>> - Switch to drm_* logger when we're handling with struct
>>> drm_device.
>>>
>>> Changes in v3:
>>> - Get rid of drm_atomic_get_existing_crtc_state() which is marked
>>>     deprecated.
>>>
>>> Changes in v2:
>>> - Changed some Control flows according to previous reviews.
>>> - Added missing of_node_put when checking of endpoints for output
>>> type.
>>> - Switched all userspace-visible modeset objects to be managed by
>>> drmm
>>>     instead of devm.
>>> - Utilize devm_drm_bridge_alloc() in internal bridge.
>>> - Prevented the usage of simple encoder helpers by passing a NULL
>>> funcs pointer.
>>> - Let devm enable clocks when getting them.
>>> - Removed explicit `.cache_type = REGCACHE_NONE` in regmap config.
>>> - Fixed a debug print using a variable before initialization.
>>> - Fixed a wrong index when using bulk to handle resets.
>>> - Added missing configuration for DPI format (currently fixed
>>> RGB888).
>>>
>>>    drivers/gpu/drm/Kconfig                       |   2 +
>>>    drivers/gpu/drm/Makefile                      |   1 +
>>>    drivers/gpu/drm/verisilicon/Kconfig           |  15 +
>>>    drivers/gpu/drm/verisilicon/Makefile          |   5 +
>>>    drivers/gpu/drm/verisilicon/vs_bridge.c       | 371
>>> ++++++++++++++++++
>>>    drivers/gpu/drm/verisilicon/vs_bridge.h       |  39 ++
>>>    drivers/gpu/drm/verisilicon/vs_bridge_regs.h  |  54 +++
>>>    drivers/gpu/drm/verisilicon/vs_crtc.c         | 191 +++++++++
>>>    drivers/gpu/drm/verisilicon/vs_crtc.h         |  31 ++
>>>    drivers/gpu/drm/verisilicon/vs_crtc_regs.h    |  60 +++
>>>    drivers/gpu/drm/verisilicon/vs_dc.c           | 207 ++++++++++
>>>    drivers/gpu/drm/verisilicon/vs_dc.h           |  38 ++
>>>    drivers/gpu/drm/verisilicon/vs_dc_top_regs.h  |  27 ++
>>>    drivers/gpu/drm/verisilicon/vs_drm.c          | 182 +++++++++
>>>    drivers/gpu/drm/verisilicon/vs_drm.h          |  28 ++
>>>    drivers/gpu/drm/verisilicon/vs_hwdb.c         | 150 +++++++
>>>    drivers/gpu/drm/verisilicon/vs_hwdb.h         |  29 ++
>>>    drivers/gpu/drm/verisilicon/vs_plane.c        | 124 ++++++
>>>    drivers/gpu/drm/verisilicon/vs_plane.h        |  72 ++++
>>>    .../gpu/drm/verisilicon/vs_primary_plane.c    | 173 ++++++++
>>>    .../drm/verisilicon/vs_primary_plane_regs.h   |  53 +++
>>>    21 files changed, 1852 insertions(+)
>>>    create mode 100644 drivers/gpu/drm/verisilicon/Kconfig
>>>    create mode 100644 drivers/gpu/drm/verisilicon/Makefile
>>>    create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge.c
>>>    create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge.h
>>>    create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge_regs.h
>>>    create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.c
>>>    create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.h
>>>    create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc_regs.h
>>>    create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.c
>>>    create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.h
>>>    create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_top_regs.h
>>>    create mode 100644 drivers/gpu/drm/verisilicon/vs_drm.c
>>>    create mode 100644 drivers/gpu/drm/verisilicon/vs_drm.h
>>>    create mode 100644 drivers/gpu/drm/verisilicon/vs_hwdb.c
>>>    create mode 100644 drivers/gpu/drm/verisilicon/vs_hwdb.h
>>>    create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
>>>    create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h
>>>    create mode 100644 drivers/gpu/drm/verisilicon/vs_primary_plane.c
>>>    create mode 100644
>>> drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


