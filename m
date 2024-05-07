Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B628BE781
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 17:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 551D210EEDC;
	Tue,  7 May 2024 15:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="XdsjTnOL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lKsP48+l";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XdsjTnOL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lKsP48+l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A80810EEDC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 15:34:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3213F20C43;
 Tue,  7 May 2024 15:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715096042; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UkVrLRN7K5RmTJglCL9qmSs4sspXF1EvXOEjJE+C3gQ=;
 b=XdsjTnOLjyAL92bbQDfbqgp0d70ck2hhmsPfKKHw2uv03jv5xtbPdGDo3QcFFIo8czhcch
 sWx3Yru/dB0z22Qzb7idzMHZdtnVDu63fH/8sfZgK3toEsysDw+IJwVNuwJ4F3PB57kt35
 c+6Z6Mnhxn4/c69q4F+YxBQoxd0GWKQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715096042;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UkVrLRN7K5RmTJglCL9qmSs4sspXF1EvXOEjJE+C3gQ=;
 b=lKsP48+lX2wfMklPmp0OSuPH/4XO5LNQ+vR+KVPImN7t9w+FocQTDV97C33FCpmNTXlXcL
 DZwVWXHSe08XinAw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=XdsjTnOL;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lKsP48+l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715096042; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UkVrLRN7K5RmTJglCL9qmSs4sspXF1EvXOEjJE+C3gQ=;
 b=XdsjTnOLjyAL92bbQDfbqgp0d70ck2hhmsPfKKHw2uv03jv5xtbPdGDo3QcFFIo8czhcch
 sWx3Yru/dB0z22Qzb7idzMHZdtnVDu63fH/8sfZgK3toEsysDw+IJwVNuwJ4F3PB57kt35
 c+6Z6Mnhxn4/c69q4F+YxBQoxd0GWKQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715096042;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UkVrLRN7K5RmTJglCL9qmSs4sspXF1EvXOEjJE+C3gQ=;
 b=lKsP48+lX2wfMklPmp0OSuPH/4XO5LNQ+vR+KVPImN7t9w+FocQTDV97C33FCpmNTXlXcL
 DZwVWXHSe08XinAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1C6E2139CB;
 Tue,  7 May 2024 15:34:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +4GFBepJOmYbVgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 07 May 2024 15:34:02 +0000
Message-ID: <649cda91-767c-4683-b217-ff4e14ba3f30@suse.de>
Date: Tue, 7 May 2024 17:34:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] drm: struct drm_edid conversions
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <cover.1713273659.git.jani.nikula@intel.com>
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
In-Reply-To: <cover.1713273659.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; MX_GOOD(-0.01)[]; ARC_NA(0.00)[];
 RCPT_COUNT_TWO(0.00)[2]; MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 3213F20C43
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -6.50
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

Am 16.04.24 um 15:22 schrieb Jani Nikula:
> I've these laying in a branch for a while, maybe let's try to make some
> forward progress in this front.

Could you take another look at the udl patches at [1]? The second 
iteration of the patches is self-contained within the driver. So the 
most-controversial points should be resolved now.

Best regards
Thomas

[1] https://patchwork.freedesktop.org/series/132039/#rev2

>
> Build tested only, on x86, arm, and arm64.
>
> BR,
> Jani.
>
>
> Jani Nikula (15):
>    drm/panel: simple: switch to struct drm_edid
>    drm/panel-samsung-atna33xc20: switch to struct drm_edid
>    drm/panel-edp: switch to struct drm_edid
>    drm/bridge/analogix/anx6345: switch to struct drm_edid
>    drm/bridge/analogix/anx78xx: switch to struct drm_edid
>    drm/sun4i: hdmi: switch to struct drm_edid
>    drm/vc4: hdmi: switch to struct drm_edid
>    drm/bridge: anx7625: use struct drm_edid more
>    drm/gud: switch to struct drm_edid
>    drm/i2c: tda998x: switch to struct drm_edid
>    drm/bochs: switch to struct drm_edid
>    drm/virtio: switch to struct drm_edid
>    drm/rockchip: cdn-dp: switch to struct drm_edid
>    drm/rockchip: inno_hdmi: switch to struct drm_edid
>    drm/rockchip: rk3066_hdmi: switch to struct drm_edid
>
>   .../drm/bridge/analogix/analogix-anx6345.c    | 15 +++---
>   .../drm/bridge/analogix/analogix-anx78xx.c    | 23 +++++-----
>   drivers/gpu/drm/bridge/analogix/anx7625.c     | 26 +++++++----
>   drivers/gpu/drm/bridge/analogix/anx7625.h     | 10 +---
>   drivers/gpu/drm/gud/gud_connector.c           | 12 ++---
>   drivers/gpu/drm/i2c/tda998x_drv.c             | 19 ++++----
>   drivers/gpu/drm/panel/panel-edp.c             | 17 ++++---
>   .../gpu/drm/panel/panel-samsung-atna33xc20.c  | 13 ++++--
>   drivers/gpu/drm/panel/panel-simple.c          | 15 +++---
>   drivers/gpu/drm/rockchip/cdn-dp-core.c        | 33 +++++++------
>   drivers/gpu/drm/rockchip/cdn-dp-core.h        |  2 +-
>   drivers/gpu/drm/rockchip/inno_hdmi.c          | 12 ++---
>   drivers/gpu/drm/rockchip/rk3066_hdmi.c        | 12 ++---
>   drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c        | 18 +++++---
>   drivers/gpu/drm/tiny/bochs.c                  | 23 ++++------
>   drivers/gpu/drm/vc4/vc4_hdmi.c                | 46 ++++++++++---------
>   drivers/gpu/drm/virtio/virtgpu_display.c      | 10 ++--
>   drivers/gpu/drm/virtio/virtgpu_drv.h          |  2 +-
>   drivers/gpu/drm/virtio/virtgpu_vq.c           | 12 ++---
>   19 files changed, 167 insertions(+), 153 deletions(-)
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

