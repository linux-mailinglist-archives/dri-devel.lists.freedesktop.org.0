Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D2BB40529
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 15:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 558A610E0CB;
	Tue,  2 Sep 2025 13:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Peu0JOjg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9gVKmqkX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Peu0JOjg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9gVKmqkX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0073C10E0CB
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 13:50:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5AE531F391;
 Tue,  2 Sep 2025 13:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756821034; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lGeceZYpzOse2vczvYxbbZAoWpm8L9ZnY42QIUVo8yE=;
 b=Peu0JOjgEGpD/12LOxEF+jGXLK+5iOb0k8Fvp1NfOgZIWl91pqXszOwMrlJ22mMe0WAl09
 hhLEdGl59mTaMM5iHeO/p/XB140G7cRzJyCHBW8N73A5xa6HoNI2+yLi/JIojSkM0Y1jGJ
 GX7Xin/FaW3bGrsblBUfdbL/M1cqCpg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756821034;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lGeceZYpzOse2vczvYxbbZAoWpm8L9ZnY42QIUVo8yE=;
 b=9gVKmqkXpVPFLBA7vdB+yQqhpQQde6eYBSmX6eLl9hXnAVPgc9T7xjAE2DPu3yk3lICar0
 cQjI0jk3eQkHeSCg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Peu0JOjg;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9gVKmqkX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756821034; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lGeceZYpzOse2vczvYxbbZAoWpm8L9ZnY42QIUVo8yE=;
 b=Peu0JOjgEGpD/12LOxEF+jGXLK+5iOb0k8Fvp1NfOgZIWl91pqXszOwMrlJ22mMe0WAl09
 hhLEdGl59mTaMM5iHeO/p/XB140G7cRzJyCHBW8N73A5xa6HoNI2+yLi/JIojSkM0Y1jGJ
 GX7Xin/FaW3bGrsblBUfdbL/M1cqCpg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756821034;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lGeceZYpzOse2vczvYxbbZAoWpm8L9ZnY42QIUVo8yE=;
 b=9gVKmqkXpVPFLBA7vdB+yQqhpQQde6eYBSmX6eLl9hXnAVPgc9T7xjAE2DPu3yk3lICar0
 cQjI0jk3eQkHeSCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F17D513882;
 Tue,  2 Sep 2025 13:50:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id c/+GOSn2tmgnZAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 02 Sep 2025 13:50:33 +0000
Message-ID: <8527ee39-6933-4d2f-b834-af628bbadd22@suse.de>
Date: Tue, 2 Sep 2025 15:50:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/29] drm/tidss: Remove ftrace-like logs
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-19-14ad5315da3f@kernel.org>
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
In-Reply-To: <20250902-drm-state-readout-v1-19-14ad5315da3f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 5AE531F391
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com,ffwll.ch,intel.com,linaro.org,ideasonboard.com,kwiboo.se,iki.fi];
 ARC_NA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCPT_COUNT_TWELVE(0.00)[15]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 TAGGED_RCPT(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.01
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



Am 02.09.25 um 10:32 schrieb Maxime Ripard:
> These logs don't really log any information and create checkpatch
> warnings. Remove them.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Most of this output should be available from DRM's atomic helpers already.

> ---
>   drivers/gpu/drm/tidss/tidss_crtc.c  |  6 ------
>   drivers/gpu/drm/tidss/tidss_dispc.c |  4 ----
>   drivers/gpu/drm/tidss/tidss_drv.c   | 16 ----------------
>   drivers/gpu/drm/tidss/tidss_kms.c   |  4 ----
>   drivers/gpu/drm/tidss/tidss_plane.c |  8 --------
>   5 files changed, 38 deletions(-)
>
> diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
> index f497138ad053ed4be207e12eeee6c304e1c949bd..091f82c86f53bc76c572de4723746af2e35ce1c1 100644
> --- a/drivers/gpu/drm/tidss/tidss_crtc.c
> +++ b/drivers/gpu/drm/tidss/tidss_crtc.c
> @@ -92,12 +92,10 @@ static int tidss_crtc_atomic_check(struct drm_crtc *crtc,
>   	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
>   	u32 hw_videoport = tcrtc->hw_videoport;
>   	struct drm_display_mode *mode;
>   	enum drm_mode_status ok;
>   
> -	dev_dbg(ddev->dev, "%s\n", __func__);
> -
>   	if (!crtc_state->enable)
>   		return 0;
>   
>   	mode = &crtc_state->adjusted_mode;
>   
> @@ -326,12 +324,10 @@ static const struct drm_crtc_helper_funcs tidss_crtc_helper_funcs = {
>   static int tidss_crtc_enable_vblank(struct drm_crtc *crtc)
>   {
>   	struct drm_device *ddev = crtc->dev;
>   	struct tidss_device *tidss = to_tidss(ddev);
>   
> -	dev_dbg(ddev->dev, "%s\n", __func__);
> -
>   	tidss_runtime_get(tidss);
>   
>   	tidss_irq_enable_vblank(crtc);
>   
>   	return 0;
> @@ -340,12 +336,10 @@ static int tidss_crtc_enable_vblank(struct drm_crtc *crtc)
>   static void tidss_crtc_disable_vblank(struct drm_crtc *crtc)
>   {
>   	struct drm_device *ddev = crtc->dev;
>   	struct tidss_device *tidss = to_tidss(ddev);
>   
> -	dev_dbg(ddev->dev, "%s\n", __func__);
> -
>   	tidss_irq_disable_vblank(crtc);
>   
>   	tidss_runtime_put(tidss);
>   }
>   
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index 8b1d6b72f303b91fbf86f7d0e351800804757126..7d94c1142e8083dab00fcf5c652ae40f98baeabf 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -2863,12 +2863,10 @@ int dispc_runtime_resume(struct dispc_device *dispc)
>   	return 0;
>   }
>   
>   void dispc_remove(struct tidss_device *tidss)
>   {
> -	dev_dbg(tidss->dev, "%s\n", __func__);
> -
>   	tidss->dispc = NULL;
>   }
>   
>   static int dispc_iomap_resource(struct platform_device *pdev, const char *name,
>   				void __iomem **base)
> @@ -3006,12 +3004,10 @@ int dispc_init(struct tidss_device *tidss)
>   	struct dispc_device *dispc;
>   	const struct dispc_features *feat;
>   	unsigned int i, num_fourccs;
>   	int r = 0;
>   
> -	dev_dbg(dev, "%s\n", __func__);
> -
>   	feat = tidss->feat;
>   
>   	if (feat->subrev != DISPC_K2G) {
>   		r = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(48));
>   		if (r)
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
> index 27d9a8fd541fc164f2fb2535f148432bd7895f46..1c8cc18bc53c3ea3c50368b9f55ab02a0a02fc77 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> @@ -31,45 +31,37 @@
>   
>   int tidss_runtime_get(struct tidss_device *tidss)
>   {
>   	int r;
>   
> -	dev_dbg(tidss->dev, "%s\n", __func__);
> -
>   	r = pm_runtime_resume_and_get(tidss->dev);
>   	WARN_ON(r < 0);
>   	return r;
>   }
>   
>   void tidss_runtime_put(struct tidss_device *tidss)
>   {
>   	int r;
>   
> -	dev_dbg(tidss->dev, "%s\n", __func__);
> -
>   	pm_runtime_mark_last_busy(tidss->dev);
>   
>   	r = pm_runtime_put_autosuspend(tidss->dev);
>   	WARN_ON(r < 0);
>   }
>   
>   static int __maybe_unused tidss_pm_runtime_suspend(struct device *dev)
>   {
>   	struct tidss_device *tidss = dev_get_drvdata(dev);
>   
> -	dev_dbg(dev, "%s\n", __func__);
> -
>   	return dispc_runtime_suspend(tidss->dispc);
>   }
>   
>   static int __maybe_unused tidss_pm_runtime_resume(struct device *dev)
>   {
>   	struct tidss_device *tidss = dev_get_drvdata(dev);
>   	int r;
>   
> -	dev_dbg(dev, "%s\n", __func__);
> -
>   	r = dispc_runtime_resume(tidss->dispc);
>   	if (r)
>   		return r;
>   
>   	return 0;
> @@ -77,21 +69,17 @@ static int __maybe_unused tidss_pm_runtime_resume(struct device *dev)
>   
>   static int __maybe_unused tidss_suspend(struct device *dev)
>   {
>   	struct tidss_device *tidss = dev_get_drvdata(dev);
>   
> -	dev_dbg(dev, "%s\n", __func__);
> -
>   	return drm_mode_config_helper_suspend(&tidss->ddev);
>   }
>   
>   static int __maybe_unused tidss_resume(struct device *dev)
>   {
>   	struct tidss_device *tidss = dev_get_drvdata(dev);
>   
> -	dev_dbg(dev, "%s\n", __func__);
> -
>   	return drm_mode_config_helper_resume(&tidss->ddev);
>   }
>   
>   static __maybe_unused const struct dev_pm_ops tidss_pm_ops = {
>   	SET_SYSTEM_SLEEP_PM_OPS(tidss_suspend, tidss_resume)
> @@ -125,12 +113,10 @@ static int tidss_probe(struct platform_device *pdev)
>   	struct tidss_device *tidss;
>   	struct drm_device *ddev;
>   	int ret;
>   	int irq;
>   
> -	dev_dbg(dev, "%s\n", __func__);
> -
>   	tidss = devm_drm_dev_alloc(&pdev->dev, &tidss_driver,
>   				   struct tidss_device, ddev);
>   	if (IS_ERR(tidss))
>   		return PTR_ERR(tidss);
>   
> @@ -226,12 +212,10 @@ static void tidss_remove(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct tidss_device *tidss = platform_get_drvdata(pdev);
>   	struct drm_device *ddev = &tidss->ddev;
>   
> -	dev_dbg(dev, "%s\n", __func__);
> -
>   	drm_dev_unregister(ddev);
>   
>   	drm_atomic_helper_shutdown(ddev);
>   
>   	tidss_irq_uninstall(ddev);
> diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
> index c34eb90cddbeac634f281cf163d493ba75b7ea29..86eb5d97410bedced57129c2bbcd35f1719424c2 100644
> --- a/drivers/gpu/drm/tidss/tidss_kms.c
> +++ b/drivers/gpu/drm/tidss/tidss_kms.c
> @@ -22,12 +22,10 @@
>   static void tidss_atomic_commit_tail(struct drm_atomic_state *old_state)
>   {
>   	struct drm_device *ddev = old_state->dev;
>   	struct tidss_device *tidss = to_tidss(ddev);
>   
> -	dev_dbg(ddev->dev, "%s\n", __func__);
> -
>   	tidss_runtime_get(tidss);
>   
>   	drm_atomic_helper_commit_modeset_disables(ddev, old_state);
>   	drm_atomic_helper_commit_planes(ddev, old_state, DRM_PLANE_COMMIT_ACTIVE_ONLY);
>   	drm_atomic_helper_commit_modeset_enables(ddev, old_state);
> @@ -243,12 +241,10 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
>   int tidss_modeset_init(struct tidss_device *tidss)
>   {
>   	struct drm_device *ddev = &tidss->ddev;
>   	int ret;
>   
> -	dev_dbg(tidss->dev, "%s\n", __func__);
> -
>   	ret = drmm_mode_config_init(ddev);
>   	if (ret)
>   		return ret;
>   
>   	ddev->mode_config.min_width = 8;
> diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
> index 142ae81951a0916ccf7d3add1b83b011eca7f6b9..bd10bc1b9961571e6c6dee26698149fc9dd135b0 100644
> --- a/drivers/gpu/drm/tidss/tidss_plane.c
> +++ b/drivers/gpu/drm/tidss/tidss_plane.c
> @@ -40,12 +40,10 @@ static int tidss_plane_atomic_check(struct drm_plane *plane,
>   	struct drm_crtc_state *crtc_state;
>   	u32 hw_plane = tplane->hw_plane_id;
>   	u32 hw_videoport;
>   	int ret;
>   
> -	dev_dbg(ddev->dev, "%s\n", __func__);
> -
>   	if (!new_plane_state->crtc) {
>   		/*
>   		 * The visible field is not reset by the DRM core but only
>   		 * updated by drm_atomic_helper_check_plane_state(), set it
>   		 * manually.
> @@ -122,12 +120,10 @@ static void tidss_plane_atomic_update(struct drm_plane *plane,
>   	struct tidss_plane *tplane = to_tidss_plane(plane);
>   	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
>   									   plane);
>   	u32 hw_videoport;
>   
> -	dev_dbg(ddev->dev, "%s\n", __func__);
> -
>   	if (!new_state->visible) {
>   		dispc_plane_enable(tidss->dispc, tplane->hw_plane_id, false);
>   		return;
>   	}
>   
> @@ -141,24 +137,20 @@ static void tidss_plane_atomic_enable(struct drm_plane *plane,
>   {
>   	struct drm_device *ddev = plane->dev;
>   	struct tidss_device *tidss = to_tidss(ddev);
>   	struct tidss_plane *tplane = to_tidss_plane(plane);
>   
> -	dev_dbg(ddev->dev, "%s\n", __func__);
> -
>   	dispc_plane_enable(tidss->dispc, tplane->hw_plane_id, true);
>   }
>   
>   static void tidss_plane_atomic_disable(struct drm_plane *plane,
>   				       struct drm_atomic_state *state)
>   {
>   	struct drm_device *ddev = plane->dev;
>   	struct tidss_device *tidss = to_tidss(ddev);
>   	struct tidss_plane *tplane = to_tidss_plane(plane);
>   
> -	dev_dbg(ddev->dev, "%s\n", __func__);
> -
>   	dispc_plane_enable(tidss->dispc, tplane->hw_plane_id, false);
>   }
>   
>   static void drm_plane_destroy(struct drm_plane *plane)
>   {
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


