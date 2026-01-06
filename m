Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBB4CF710D
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 08:38:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A45E10E166;
	Tue,  6 Jan 2026 07:38:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="hWUz60vS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="32mMpOeK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hWUz60vS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="32mMpOeK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D567810E166
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 07:38:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7DC23338BC;
 Tue,  6 Jan 2026 07:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1767685081; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=HRdDTEgsBuaevi01t1UcVH4bgIEtw89w1GocO9yv7PQ=;
 b=hWUz60vSgB2I80/z3F3kfmjx0lJXYRz+gQfrtPRzYkF1H1dQAxd+D7Q+0nX5QGePbAhjo/
 ZYqEHeoaB/50lTBu5WHda7TpM+kWjGImhdQILXM2c4JEZGZAQ3uFyo4Y2MDtq2y18vQpqT
 srfpUI5NFGlneZXlof4i88pINAZo3+o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1767685081;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=HRdDTEgsBuaevi01t1UcVH4bgIEtw89w1GocO9yv7PQ=;
 b=32mMpOeKy3ovr4Mrm4h/rsSiPQ2FXLee7T0tv/z+KHwPoGTTVpA86+N3hv9w8Huic2Kied
 SearMv4Ig2UhspBw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hWUz60vS;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=32mMpOeK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1767685081; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=HRdDTEgsBuaevi01t1UcVH4bgIEtw89w1GocO9yv7PQ=;
 b=hWUz60vSgB2I80/z3F3kfmjx0lJXYRz+gQfrtPRzYkF1H1dQAxd+D7Q+0nX5QGePbAhjo/
 ZYqEHeoaB/50lTBu5WHda7TpM+kWjGImhdQILXM2c4JEZGZAQ3uFyo4Y2MDtq2y18vQpqT
 srfpUI5NFGlneZXlof4i88pINAZo3+o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1767685081;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=HRdDTEgsBuaevi01t1UcVH4bgIEtw89w1GocO9yv7PQ=;
 b=32mMpOeKy3ovr4Mrm4h/rsSiPQ2FXLee7T0tv/z+KHwPoGTTVpA86+N3hv9w8Huic2Kied
 SearMv4Ig2UhspBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 17AC03EA63;
 Tue,  6 Jan 2026 07:38:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id q2WQBNm7XGmZCAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 06 Jan 2026 07:38:01 +0000
Message-ID: <52b59334-9c93-4273-b142-41c14a7a2c3c@suse.de>
Date: Tue, 6 Jan 2026 08:38:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm: xlnx: zynqmp_kms: set preferred_depth to 16 bpp
To: Mikko Rapeli <mikko.rapeli@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Michal Simek <michal.simek@amd.com>,
 Bill Mills <bill.mills@linaro.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, stable@vger.kernel.org
References: <20251205123751.2257694-1-mikko.rapeli@linaro.org>
 <20251205123751.2257694-3-mikko.rapeli@linaro.org>
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
In-Reply-To: <20251205123751.2257694-3-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Rspamd-Queue-Id: 7DC23338BC
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_TWELVE(0.00)[15];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[ideasonboard.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,amd.com,linaro.org,vger.kernel.org];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,suse.de:mid,suse.de:dkim,suse.de:email,amd.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,linaro.org:email];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
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

Am 05.12.25 um 13:37 schrieb Mikko Rapeli:
> Xorg fails to start with defaults on AMD KV260, /var/log/Xorg.0.log:
>
> [    23.491] (II) Loading /usr/lib/xorg/modules/drivers/fbdev_drv.so
> [    23.491] (II) Module fbdev: vendor="X.Org Foundation"
> [    23.491]    compiled for 1.21.1.18, module version = 0.5.1
> [    23.491]    Module class: X.Org Video Driver
> [    23.491]    ABI class: X.Org Video Driver, version 25.2
> [    23.491] (II) modesetting: Driver for Modesetting Kernel Drivers:
> kms
> [    23.491] (II) FBDEV: driver for framebuffer: fbdev
> [    23.510] (II) modeset(0): using drv /dev/dri/card1
> [    23.511] (WW) Falling back to old probe method for fbdev
> [    23.511] (II) Loading sub module "fbdevhw"
> [    23.511] (II) LoadModule: "fbdevhw"
> [    23.511] (II) Loading /usr/lib/xorg/modules/libfbdevhw.so
> [    23.511] (II) Module fbdevhw: vendor="X.Org Foundation"
> [    23.511]    compiled for 1.21.1.18, module version = 0.0.2
> [    23.511]    ABI class: X.Org Video Driver, version 25.2
> [    23.512] (II) modeset(0): Creating default Display subsection in
> Screen section
>          "Default Screen Section" for depth/fbbpp 24/32
> [    23.512] (==) modeset(0): Depth 24, (==) framebuffer bpp 32
> [    23.512] (==) modeset(0): RGB weight 888
> [    23.512] (==) modeset(0): Default visual is TrueColor
> ...
> [    23.911] (II) Loading sub module "fb"
> [    23.911] (II) LoadModule: "fb"
> [    23.911] (II) Module "fb" already built-in
> [    23.911] (II) UnloadModule: "fbdev"
> [    23.911] (II) Unloading fbdev
> [    23.912] (II) UnloadSubModule: "fbdevhw"
> [    23.912] (II) Unloading fbdevhw
> [    24.238] (==) modeset(0): Backing store enabled
> [    24.238] (==) modeset(0): Silken mouse enabled
> [    24.249] (II) modeset(0): Initializing kms color map for depth 24, 8
> bpc.
> [    24.250] (==) modeset(0): DPMS enabled
> [    24.250] (II) modeset(0): [DRI2] Setup complete
> [    24.250] (II) modeset(0): [DRI2]   DRI driver: kms_swrast
> [    24.250] (II) modeset(0): [DRI2]   VDPAU driver: kms_swrast
> ...
> [    24.770] (II) modeset(0): Disabling kernel dirty updates, not
> required.
> [    24.770] (EE) modeset(0): failed to set mode: Invalid argument
>
> xorg tries to use 24 and 32 bpp which pass on the fb API but which
> don't actually work on AMD KV260 when Xorg starts. As a workaround
> Xorg config can set color depth to 16 using /etc/X11/xorg.conf snippet:
>
> Section "Screen"
>          Identifier     "Default Screen"
>          Monitor        "Configured Monitor"
>          Device         "Configured Video Device"
>          DefaultDepth   16
> EndSection
>
> But this is cumbersome on images meant for multiple different arm64
> devices and boards. So instead set 16 bpp as preferred depth
> in zynqmp_kms fb driver which is used by Xorg in the logic to find
> out a working depth.
>
> Now Xorg startup and bpp query using fb API works and HDMI display
> shows graphics. /var/log/Xorg.0.log shows:
>
> [    23.219] (II) LoadModule: "fbdev"
> [    23.219] (II) Loading /usr/lib/xorg/modules/drivers/fbdev_drv.so
> [    23.219] (II) Module fbdev: vendor="X.Org Foundation"
> [    23.219]    compiled for 1.21.1.18, module version = 0.5.1
> [    23.219]    Module class: X.Org Video Driver
> [    23.219]    ABI class: X.Org Video Driver, version 25.2
> [    23.219] (II) modesetting: Driver for Modesetting Kernel Drivers:
> kms
> [    23.219] (II) FBDEV: driver for framebuffer: fbdev
> [    23.238] (II) modeset(0): using drv /dev/dri/card1
> [    23.238] (WW) Falling back to old probe method for fbdev
> [    23.238] (II) Loading sub module "fbdevhw"
> [    23.238] (II) LoadModule: "fbdevhw"
> [    23.239] (II) Loading /usr/lib/xorg/modules/libfbdevhw.so
> [    23.239] (II) Module fbdevhw: vendor="X.Org Foundation"
> [    23.239]    compiled for 1.21.1.18, module version = 0.0.2
> [    23.239]    ABI class: X.Org Video Driver, version 25.2
> [    23.240] (II) modeset(0): Creating default Display subsection in Screen section
>          "Default Screen Section" for depth/fbbpp 16/16
> [    23.240] (==) modeset(0): Depth 16, (==) framebuffer bpp 16
> [    23.240] (==) modeset(0): RGB weight 565
> [    23.240] (==) modeset(0): Default visual is TrueColor
> ...
> [    24.015] (==) modeset(0): Backing store enabled
> [    24.015] (==) modeset(0): Silken mouse enabled
> [    24.027] (II) modeset(0): Initializing kms color map for depth 16, 6 bpc.
> [    24.028] (==) modeset(0): DPMS enabled
> [    24.028] (II) modeset(0): [DRI2] Setup complete
> [    24.028] (II) modeset(0): [DRI2]   DRI driver: kms_swrast
> [    24.028] (II) modeset(0): [DRI2]   VDPAU driver: kms_swrast
>
> Cc: Bill Mills <bill.mills@linaro.org>
> Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> Cc: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/xlnx/zynqmp_kms.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> index ccc35cacd10cb..a42192c827af0 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> @@ -506,6 +506,7 @@ int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
>   	drm->mode_config.min_height = 0;
>   	drm->mode_config.max_width = ZYNQMP_DISP_MAX_WIDTH;
>   	drm->mode_config.max_height = ZYNQMP_DISP_MAX_HEIGHT;
> +	drm->mode_config.preferred_depth = 16;

There is another discussion on-going about rearranging planes. But to 
make user space work correctly, preferred_depth should be set no matter 
what.

Best regards
Thomas

>   
>   	ret = drm_vblank_init(drm, 1);
>   	if (ret)

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


