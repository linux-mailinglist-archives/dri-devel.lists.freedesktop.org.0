Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB15AA38479
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 14:23:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E7E10E323;
	Mon, 17 Feb 2025 13:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Xf3xuV73";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IWNGBR72";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hfcGkO7q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7fxTJWmW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A90FD10E322
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 13:23:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CBCC21F381;
 Mon, 17 Feb 2025 13:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739798578; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=np+YteYlfet+9ko5pATQsUhuBGIBnFKjF5r9SuPAe/8=;
 b=Xf3xuV73v3vWMEbH9/PdPkupO6e8NVUoK6NXaY+sIoqQ314At0xhf9HuRbTF2Csi/8vngE
 +RzY9aIJfFc/Y5klaDcFo43G7lRPhm9PyeYSgXFo5i12GpXxaPNmwi2XXPwxXXpVqQMaIs
 qXyLKQS2D5LdW6Ixu49P7i09ah+z3Z0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739798578;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=np+YteYlfet+9ko5pATQsUhuBGIBnFKjF5r9SuPAe/8=;
 b=IWNGBR72/F4GwWBOznN9TdU4MzK+I8LKdldLPPN7VT1Ci4fPq9OysYJ91y4RuwF9Cc/g25
 /hS4lbC0jOybYxCA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hfcGkO7q;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7fxTJWmW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739798577; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=np+YteYlfet+9ko5pATQsUhuBGIBnFKjF5r9SuPAe/8=;
 b=hfcGkO7q8rM4MDJ/azFO9EUOc5nafv66UGMYf/IOUhca5rDmwM5Tgl2umd9GyCMXhWVXkI
 musRPkrHGrgwEr96G+CaWEPh4PFevR42L+vpGoQe6MgY45PhJmuS7Xej/9NOOSQT8JtRMU
 d1TIatUU7/BTyRle9wXeaZ7wrsDCeC4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739798577;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=np+YteYlfet+9ko5pATQsUhuBGIBnFKjF5r9SuPAe/8=;
 b=7fxTJWmWOdICYp2FA+QVwY+JjVW4oRLdhJrmmrCJP9eroNoXUlwTH15sFFcu10LbS26Bi0
 cT3cDAEA0bM1SKAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 43F951379D;
 Mon, 17 Feb 2025 13:22:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id I1pKDzE4s2cHDQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Feb 2025 13:22:57 +0000
Message-ID: <40e59cf1-86da-4c1d-aafd-f409d8179167@suse.de>
Date: Mon, 17 Feb 2025 14:22:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] drm: adp: Add Apple Display Pipe driver
To: fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev,
 Janne Grunau <j@jannau.net>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alyssa Ross <hi@alyssa.is>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neal Gompa <neal@gompa.dev>
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
 <20250217-adpdrm-v7-2-ca2e44b3c7d8@gmail.com>
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
In-Reply-To: <20250217-adpdrm-v7-2-ca2e44b3c7d8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: CBCC21F381
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com,marcan.st,svenpeter.dev,rosenzweig.io,linux.intel.com,kernel.org,ffwll.ch,linaro.org,quicinc.com,lists.linux.dev,jannau.net];
 RCPT_COUNT_TWELVE(0.00)[22]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[dt];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

Hi

Am 17.02.25 um 12:39 schrieb Sasha Finkelstein via B4 Relay:
[...]
> +
> +static int adp_open(struct inode *inode, struct file *filp)
> +{
> +	/*
> +	 * The modesetting driver does not check the non-desktop connector
> +	 * property and keeps the device open and locked. If the touchbar daemon
> +	 * opens the device first modesetting breaks the whole X session.

I find this sentence hard to understand. Should there be a comma after 
'first' for better readability?

> +	 * Simply refuse to open the device for X11 server processes as
> +	 * workaround.

This is a platform device, so Xorg will not use it automatically. There 
exists a list of acceptable DRM drivers in the Xorg source code. [1] 
You'd have to add adp there. Unless the described problem really happens 
in practice, I'd drop this workaround. There's no point in working 
around legacy userspace in modern drivers.

Best regards
Thomas

[1] 
https://gitlab.freedesktop.org/xorg/xserver/-/blob/master/hw/xfree86/common/xf86platformBus.c#L582 


> +	 */
> +	if (current->comm[0] == 'X')
> +		return -EBUSY;
> +
> +	return drm_open(inode, filp);
> +}
> +
> +static const struct file_operations adp_fops = {
> +	.owner          = THIS_MODULE,
> +	.open           = adp_open,
> +	.release        = drm_release,
> +	.unlocked_ioctl = drm_ioctl,
> +	.compat_ioctl   = drm_compat_ioctl,
> +	.poll           = drm_poll,
> +	.read           = drm_read,
> +	.llseek         = noop_llseek,
> +	.mmap           = drm_gem_mmap,
> +	.fop_flags      = FOP_UNSIGNED_OFFSET,
> +	DRM_GEM_DMA_UNMAPPED_AREA_FOPS
> +};
> +
> +static int adp_drm_gem_dumb_create(struct drm_file *file_priv,
> +					struct drm_device *drm,
> +					struct drm_mode_create_dumb *args)
> +{
> +	args->height = ALIGN(args->height, 64);
> +	args->size = args->pitch * args->height;
> +
> +	return drm_gem_dma_dumb_create_internal(file_priv, drm, args);
> +}
> +
> +static const struct drm_driver adp_driver = {
> +	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> +	.fops = &adp_fops,
> +	DRM_GEM_DMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE(adp_drm_gem_dumb_create),
> +	.name = "adp",
> +	.desc = "Apple Display Pipe DRM Driver",
> +	.date = "20230412",
> +	.major = 0,
> +	.minor = 1,
> +};
> +
> +struct adp_drv_private {
> +	struct drm_device drm;
> +	struct drm_crtc crtc;
> +	struct drm_encoder *encoder;
> +	struct drm_connector *connector;
> +	struct drm_bridge *next_bridge;
> +	void __iomem *be;
> +	void __iomem *fe;
> +	u32 *mask_buf;
> +	u64 mask_buf_size;
> +	dma_addr_t mask_iova;
> +	int be_irq;
> +	int fe_irq;
> +	spinlock_t irq_lock;
> +	struct drm_pending_vblank_event *event;
> +};
> +
> +#define to_adp(x) container_of(x, struct adp_drv_private, drm)
> +#define crtc_to_adp(x) container_of(x, struct adp_drv_private, crtc)
> +
> +static int adp_plane_atomic_check(struct drm_plane *plane,
> +				    struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *new_plane_state;
> +	struct drm_crtc_state *crtc_state;
> +
> +	new_plane_state = drm_atomic_get_new_plane_state(state, plane);
> +
> +	if (!new_plane_state->crtc)
> +		return 0;
> +
> +	crtc_state = drm_atomic_get_crtc_state(state, new_plane_state->crtc);
> +	if (IS_ERR(crtc_state))
> +		return PTR_ERR(crtc_state);
> +
> +	return drm_atomic_helper_check_plane_state(new_plane_state,
> +						   crtc_state,
> +						   DRM_PLANE_NO_SCALING,
> +						   DRM_PLANE_NO_SCALING,
> +						   true, true);
> +}
> +
> +static void adp_plane_atomic_update(struct drm_plane *plane,
> +				    struct drm_atomic_state *state)
> +{
> +	struct adp_drv_private *adp;
> +	struct drm_rect src_rect;
> +	struct drm_gem_dma_object *obj;
> +	struct drm_framebuffer *fb;
> +	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
> +	u32 src_pos, src_size, dst_pos, dst_size;
> +
> +	if (!plane || !new_state)
> +		return;
> +
> +	fb = new_state->fb;
> +	if (!fb)
> +		return;
> +	adp = to_adp(plane->dev);
> +
> +	drm_rect_fp_to_int(&src_rect, &new_state->src);
> +	src_pos = src_rect.x1 << 16 | src_rect.y1;
> +	dst_pos = new_state->dst.x1 << 16 | new_state->dst.y1;
> +	src_size = drm_rect_width(&src_rect) << 16 | drm_rect_height(&src_rect);
> +	dst_size = drm_rect_width(&new_state->dst) << 16 |
> +		drm_rect_height(&new_state->dst);
> +	writel(src_pos, adp->be + ADBE_SRC_START);
> +	writel(src_size, adp->be + ADBE_SRC_SIZE);
> +	writel(dst_pos, adp->be + ADBE_DST_START);
> +	writel(dst_size, adp->be + ADBE_DST_SIZE);
> +	writel(fb->pitches[0], adp->be + ADBE_STRIDE);
> +	obj = drm_fb_dma_get_gem_obj(fb, 0);
> +	if (obj)
> +		writel(obj->dma_addr + fb->offsets[0], adp->be + ADBE_FB_BASE);
> +
> +	writel(BIT(0), adp->be + ADBE_LAYER_EN1);
> +	writel(BIT(0), adp->be + ADBE_LAYER_EN2);
> +	writel(BIT(0), adp->be + ADBE_LAYER_EN3);
> +	writel(BIT(0), adp->be + ADBE_LAYER_EN4);
> +	writel(ADBE_SCALE_CTL_BYPASS, adp->be + ADBE_SCALE_CTL);
> +	writel(ADBE_LAYER_CTL_ENABLE | BIT(0), adp->be + ADBE_LAYER_CTL);
> +	writel(ADBE_PIX_FMT_XRGB32, adp->be + ADBE_PIX_FMT);
> +}
> +
> +static void adp_plane_atomic_disable(struct drm_plane *plane,
> +				     struct drm_atomic_state *state)
> +{
> +	struct adp_drv_private *adp = to_adp(plane->dev);
> +
> +	writel(0x0, adp->be + ADBE_LAYER_EN1);
> +	writel(0x0, adp->be + ADBE_LAYER_EN2);
> +	writel(0x0, adp->be + ADBE_LAYER_EN3);
> +	writel(0x0, adp->be + ADBE_LAYER_EN4);
> +	writel(ADBE_LAYER_CTL_ENABLE, adp->be + ADBE_LAYER_CTL);
> +}
> +
> +static const struct drm_plane_helper_funcs adp_plane_helper_funcs = {
> +	.atomic_check = adp_plane_atomic_check,
> +	.atomic_update = adp_plane_atomic_update,
> +	.atomic_disable = adp_plane_atomic_disable,
> +	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS
> +};
> +
> +static const struct drm_plane_funcs adp_plane_funcs = {
> +	.update_plane = drm_atomic_helper_update_plane,
> +	.disable_plane = drm_atomic_helper_disable_plane,
> +	DRM_GEM_SHADOW_PLANE_FUNCS
> +};
> +
> +static const u32 plane_formats[] = {
> +	DRM_FORMAT_XRGB8888,
> +};
> +
> +#define ALL_CRTCS 1
> +
> +static struct drm_plane *adp_plane_new(struct adp_drv_private *adp)
> +{
> +	struct drm_device *drm = &adp->drm;
> +	struct drm_plane *plane;
> +
> +	plane = __drmm_universal_plane_alloc(drm, sizeof(struct drm_plane), 0,
> +					     ALL_CRTCS, &adp_plane_funcs,
> +					     plane_formats, ARRAY_SIZE(plane_formats),
> +					     NULL, DRM_PLANE_TYPE_PRIMARY, "plane");
> +	if (!plane) {
> +		drm_err(drm, "failed to allocate plane");
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	drm_plane_helper_add(plane, &adp_plane_helper_funcs);
> +	return plane;
> +}
> +
> +static void adp_enable_vblank(struct adp_drv_private *adp)
> +{
> +	u32 cur_ctrl;
> +
> +	writel(ADP_INT_STATUS_INT_MASK, adp->fe + ADP_INT_STATUS);
> +
> +	cur_ctrl = readl(adp->fe + ADP_CTRL);
> +	writel(cur_ctrl | ADP_CTRL_VBLANK_ON, adp->fe + ADP_CTRL);
> +}
> +
> +static int adp_crtc_enable_vblank(struct drm_crtc *crtc)
> +{
> +	struct drm_device *dev = crtc->dev;
> +	struct adp_drv_private *adp = to_adp(dev);
> +
> +	adp_enable_vblank(adp);
> +
> +	return 0;
> +}
> +
> +static void adp_disable_vblank(struct adp_drv_private *adp)
> +{
> +	u32 cur_ctrl;
> +
> +	cur_ctrl = readl(adp->fe + ADP_CTRL);
> +	writel(cur_ctrl & ~ADP_CTRL_VBLANK_ON, adp->fe + ADP_CTRL);
> +	writel(ADP_INT_STATUS_INT_MASK, adp->fe + ADP_INT_STATUS);
> +}
> +
> +static void adp_crtc_disable_vblank(struct drm_crtc *crtc)
> +{
> +	struct drm_device *dev = crtc->dev;
> +	struct adp_drv_private *adp = to_adp(dev);
> +
> +	adp_disable_vblank(adp);
> +}
> +
> +static void adp_crtc_atomic_enable(struct drm_crtc *crtc,
> +				   struct drm_atomic_state *state)
> +{
> +	struct adp_drv_private *adp = crtc_to_adp(crtc);
> +
> +	writel(BIT(0), adp->be + ADBE_BLEND_EN2);
> +	writel(BIT(4), adp->be + ADBE_BLEND_EN1);
> +	writel(BIT(0), adp->be + ADBE_BLEND_EN3);
> +	writel(BIT(0), adp->be + ADBE_BLEND_BYPASS);
> +	writel(BIT(0), adp->be + ADBE_BLEND_EN4);
> +}
> +
> +static void adp_crtc_atomic_disable(struct drm_crtc *crtc,
> +				    struct drm_atomic_state *state)
> +{
> +	struct adp_drv_private *adp = crtc_to_adp(crtc);
> +	struct drm_crtc_state *old_state = drm_atomic_get_old_crtc_state(state, crtc);
> +
> +	drm_atomic_helper_disable_planes_on_crtc(old_state, false);
> +
> +	writel(0x0, adp->be + ADBE_BLEND_EN2);
> +	writel(0x0, adp->be + ADBE_BLEND_EN1);
> +	writel(0x0, adp->be + ADBE_BLEND_EN3);
> +	writel(0x0, adp->be + ADBE_BLEND_BYPASS);
> +	writel(0x0, adp->be + ADBE_BLEND_EN4);
> +	drm_crtc_vblank_off(crtc);
> +}
> +
> +static void adp_crtc_atomic_flush(struct drm_crtc *crtc,
> +				  struct drm_atomic_state *state)
> +{
> +	u32 frame_num = 1;
> +	struct adp_drv_private *adp = crtc_to_adp(crtc);
> +	struct drm_crtc_state *new_state = drm_atomic_get_new_crtc_state(state, crtc);
> +	u64 new_size = ALIGN(new_state->mode.hdisplay *
> +			     new_state->mode.vdisplay * 4, PAGE_SIZE);
> +
> +	if (new_size != adp->mask_buf_size) {
> +		if (adp->mask_buf)
> +			dma_free_coherent(crtc->dev->dev, adp->mask_buf_size,
> +					  adp->mask_buf, adp->mask_iova);
> +		adp->mask_buf = NULL;
> +		if (new_size != 0) {
> +			adp->mask_buf = dma_alloc_coherent(crtc->dev->dev, new_size,
> +							   &adp->mask_iova, GFP_KERNEL);
> +			memset(adp->mask_buf, 0xFF, new_size);
> +			writel(adp->mask_iova, adp->be + ADBE_MASK_BUF);
> +		}
> +		adp->mask_buf_size = new_size;
> +	}
> +	writel(ADBE_FIFO_SYNC | frame_num, adp->be + ADBE_FIFO);
> +	//FIXME: use adbe flush interrupt
> +	spin_lock_irq(&crtc->dev->event_lock);
> +	if (crtc->state->event) {
> +		drm_crtc_vblank_get(crtc);
> +		adp->event = crtc->state->event;
> +	}
> +	crtc->state->event = NULL;
> +	spin_unlock_irq(&crtc->dev->event_lock);
> +}
> +
> +static const struct drm_crtc_funcs adp_crtc_funcs = {
> +	.destroy = drm_crtc_cleanup,
> +	.set_config = drm_atomic_helper_set_config,
> +	.page_flip = drm_atomic_helper_page_flip,
> +	.reset = drm_atomic_helper_crtc_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
> +	.enable_vblank = adp_crtc_enable_vblank,
> +	.disable_vblank = adp_crtc_disable_vblank,
> +};
> +
> +
> +static const struct drm_crtc_helper_funcs adp_crtc_helper_funcs = {
> +	.atomic_enable = adp_crtc_atomic_enable,
> +	.atomic_disable = adp_crtc_atomic_disable,
> +	.atomic_flush = adp_crtc_atomic_flush,
> +};
> +
> +static int adp_setup_crtc(struct adp_drv_private *adp)
> +{
> +	struct drm_device *drm = &adp->drm;
> +	struct drm_plane *primary;
> +	int ret;
> +
> +	primary = adp_plane_new(adp);
> +	if (IS_ERR(primary))
> +		return PTR_ERR(primary);
> +
> +	ret = drm_crtc_init_with_planes(drm, &adp->crtc, primary,
> +					NULL, &adp_crtc_funcs, NULL);
> +	if (ret)
> +		return ret;
> +
> +	drm_crtc_helper_add(&adp->crtc, &adp_crtc_helper_funcs);
> +	return 0;
> +}
> +
> +static const struct drm_mode_config_funcs adp_mode_config_funcs = {
> +	.fb_create = drm_gem_fb_create_with_dirty,
> +	.atomic_check = drm_atomic_helper_check,
> +	.atomic_commit = drm_atomic_helper_commit,
> +};
> +
> +static int adp_setup_mode_config(struct adp_drv_private *adp)
> +{
> +	struct drm_device *drm = &adp->drm;
> +	int ret;
> +	u32 size;
> +
> +	ret = drmm_mode_config_init(drm);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Query screen size restrict the frame buffer size to the screen size
> +	 * aligned to the next multiple of 64. This is not necessary but can be
> +	 * used as simple check for non-desktop devices.
> +	 * Xorg's modesetting driver does not care about the connector
> +	 * "non-desktop" property. The max frame buffer width or height can be
> +	 * easily checked and a device can be reject if the max width/height is
> +	 * smaller than 120 for example.
> +	 * Any touchbar daemon is not limited by this small framebuffer size.
> +	 */
> +	size = readl(adp->fe + ADP_SCREEN_SIZE);
> +
> +	drm->mode_config.min_width = 32;
> +	drm->mode_config.min_height = 32;
> +	drm->mode_config.max_width = ALIGN(FIELD_GET(ADP_SCREEN_HSIZE, size), 64);
> +	drm->mode_config.max_height = ALIGN(FIELD_GET(ADP_SCREEN_VSIZE, size), 64);
> +	drm->mode_config.preferred_depth = 24;
> +	drm->mode_config.prefer_shadow = 0;
> +	drm->mode_config.funcs = &adp_mode_config_funcs;
> +
> +	ret = adp_setup_crtc(adp);
> +	if (ret) {
> +		drm_err(drm, "failed to create crtc");
> +		return ret;
> +	}
> +
> +	adp->encoder = drmm_plain_encoder_alloc(drm, NULL, DRM_MODE_ENCODER_DSI, NULL);
> +	if (IS_ERR(adp->encoder)) {
> +		drm_err(drm, "failed to init encoder");
> +		return PTR_ERR(adp->encoder);
> +	}
> +	adp->encoder->possible_crtcs = ALL_CRTCS;
> +
> +	ret = drm_bridge_attach(adp->encoder, adp->next_bridge, NULL,
> +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +	if (ret) {
> +		drm_err(drm, "failed to init bridge chain");
> +		return ret;
> +	}
> +
> +	adp->connector = drm_bridge_connector_init(drm, adp->encoder);
> +	if (IS_ERR(adp->connector))
> +		return PTR_ERR(adp->connector);
> +
> +	drm_connector_attach_encoder(adp->connector, adp->encoder);
> +
> +	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
> +	if (ret < 0) {
> +		drm_err(drm, "failed to initialize vblank");
> +		return ret;
> +	}
> +
> +	drm_mode_config_reset(drm);
> +
> +	return 0;
> +}
> +
> +static int adp_parse_of(struct platform_device *pdev, struct adp_drv_private *adp)
> +{
> +	struct device *dev = &pdev->dev;
> +
> +	adp->be = devm_platform_ioremap_resource_byname(pdev, "be");
> +	if (IS_ERR(adp->be)) {
> +		dev_err(dev, "failed to map display backend mmio");
> +		return PTR_ERR(adp->be);
> +	}
> +
> +	adp->fe = devm_platform_ioremap_resource_byname(pdev, "fe");
> +	if (IS_ERR(adp->fe)) {
> +		dev_err(dev, "failed to map display pipe mmio");
> +		return PTR_ERR(adp->fe);
> +	}
> +
> +	adp->be_irq = platform_get_irq_byname(pdev, "be");
> +	if (adp->be_irq < 0) {
> +		dev_err(dev, "failed to find be irq");
> +		return adp->be_irq;
> +	}
> +
> +	adp->fe_irq = platform_get_irq_byname(pdev, "fe");
> +	if (adp->fe_irq < 0) {
> +		dev_err(dev, "failed to find fe irq");
> +		return adp->fe_irq;
> +	}
> +
> +	return 0;
> +}
> +
> +static irqreturn_t adp_fe_irq(int irq, void *arg)
> +{
> +	struct adp_drv_private *adp = (struct adp_drv_private *)arg;
> +	u32 int_status;
> +	u32 int_ctl;
> +
> +	spin_lock(&adp->irq_lock);
> +
> +	int_status = readl(adp->fe + ADP_INT_STATUS);
> +	if (int_status & ADP_INT_STATUS_VBLANK) {
> +		drm_crtc_handle_vblank(&adp->crtc);
> +		spin_lock(&adp->crtc.dev->event_lock);
> +		if (adp->event) {
> +			int_ctl = readl(adp->fe + ADP_CTRL);
> +			if ((int_ctl & 0xF00) == 0x600) {
> +				drm_crtc_send_vblank_event(&adp->crtc, adp->event);
> +				adp->event = NULL;
> +				drm_crtc_vblank_put(&adp->crtc);
> +			}
> +		}
> +		spin_unlock(&adp->crtc.dev->event_lock);
> +	}
> +
> +	writel(int_status, adp->fe + ADP_INT_STATUS);
> +
> +	spin_unlock(&adp->irq_lock);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int adp_drm_bind(struct device *dev)
> +{
> +	struct drm_device *drm = dev_get_drvdata(dev);
> +	struct adp_drv_private *adp = to_adp(drm);
> +	int err;
> +
> +	adp_disable_vblank(adp);
> +	writel(ADP_CTRL_FIFO_ON | ADP_CTRL_VBLANK_ON, adp->fe + ADP_CTRL);
> +
> +	adp->next_bridge = drmm_of_get_bridge(&adp->drm, dev->of_node, 0, 0);
> +	if (IS_ERR(adp->next_bridge)) {
> +		dev_err(dev, "failed to find next bridge");
> +		return PTR_ERR(adp->next_bridge);
> +	}
> +
> +	err = adp_setup_mode_config(adp);
> +	if (err < 0)
> +		return err;
> +
> +	err = request_irq(adp->fe_irq, adp_fe_irq, 0, "adp-fe", adp);
> +	if (err)
> +		return err;
> +
> +	err = drm_dev_register(&adp->drm, 0);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
> +static void adp_drm_unbind(struct device *dev)
> +{
> +	struct drm_device *drm = dev_get_drvdata(dev);
> +	struct adp_drv_private *adp = to_adp(drm);
> +
> +	drm_dev_unregister(drm);
> +	drm_atomic_helper_shutdown(drm);
> +	free_irq(adp->fe_irq, adp);
> +}
> +
> +static const struct component_master_ops adp_master_ops = {
> +	.bind	= adp_drm_bind,
> +	.unbind = adp_drm_unbind,
> +};
> +
> +static int compare_dev(struct device *dev, void *data)
> +{
> +	return dev->of_node == data;
> +}
> +
> +static int adp_probe(struct platform_device *pdev)
> +{
> +	struct device_node *port;
> +	struct component_match *match = NULL;
> +	struct adp_drv_private *adp;
> +	int err;
> +
> +	adp = devm_drm_dev_alloc(&pdev->dev, &adp_driver, struct adp_drv_private, drm);
> +	if (IS_ERR(adp))
> +		return PTR_ERR(adp);
> +
> +	spin_lock_init(&adp->irq_lock);
> +
> +	dev_set_drvdata(&pdev->dev, &adp->drm);
> +
> +	err = adp_parse_of(pdev, adp);
> +	if (err < 0)
> +		return err;
> +
> +	port = of_graph_get_remote_node(pdev->dev.of_node, 0, 0);
> +	if (!port)
> +		return -ENODEV;
> +
> +	drm_of_component_match_add(&pdev->dev, &match, compare_dev, port);
> +	of_node_put(port);
> +
> +	return component_master_add_with_match(&pdev->dev, &adp_master_ops, match);
> +}
> +
> +static void adp_remove(struct platform_device *pdev)
> +{
> +	component_master_del(&pdev->dev, &adp_master_ops);
> +	dev_set_drvdata(&pdev->dev, NULL);
> +}
> +
> +static const struct of_device_id adp_of_match[] = {
> +	{ .compatible = "apple,h7-display-pipe", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, adp_of_match);
> +
> +static struct platform_driver adp_platform_driver = {
> +	.driver = {
> +		.name = "adp",
> +		.of_match_table = adp_of_match,
> +	},
> +	.probe = adp_probe,
> +	.remove = adp_remove,
> +};
> +
> +module_platform_driver(adp_platform_driver);
> +
> +MODULE_DESCRIPTION("Apple Display Pipe DRM driver");
> +MODULE_LICENSE("GPL");
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

