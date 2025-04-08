Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B2BA7F7CC
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 10:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59E810E52C;
	Tue,  8 Apr 2025 08:27:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="VJXfJvSl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M+01oPwO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VJXfJvSl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M+01oPwO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24DFA10E52C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 08:27:54 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BF59C21181;
 Tue,  8 Apr 2025 08:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744100872; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=V2aDaxwpJt9URjxPe1TOoxUHmwpxYV0x1ZMpgrIFTPg=;
 b=VJXfJvSl59+uwbSQT6ww0v2NVIvtwJg4ih1cJ6dt/16hto6i3PtXx5pflmv0alrL+/0KGW
 miQSq9GkN95wAL74ve9hzu6wfPMGAAwNzYnf35EfsmMuU849K103i1rG5d4RblGkhTmFpZ
 2EY1RVy+L6IVrZfz7Tlc3mJ4Pxee7Lk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744100872;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=V2aDaxwpJt9URjxPe1TOoxUHmwpxYV0x1ZMpgrIFTPg=;
 b=M+01oPwOSDTE2vcgoKcPfXP9EYHgSAAyyJ5W6ybxDD50G6BNtC+leAZvE62RvOYF5rZVEA
 cRrIMWESya5Sb2Dg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VJXfJvSl;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=M+01oPwO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744100872; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=V2aDaxwpJt9URjxPe1TOoxUHmwpxYV0x1ZMpgrIFTPg=;
 b=VJXfJvSl59+uwbSQT6ww0v2NVIvtwJg4ih1cJ6dt/16hto6i3PtXx5pflmv0alrL+/0KGW
 miQSq9GkN95wAL74ve9hzu6wfPMGAAwNzYnf35EfsmMuU849K103i1rG5d4RblGkhTmFpZ
 2EY1RVy+L6IVrZfz7Tlc3mJ4Pxee7Lk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744100872;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=V2aDaxwpJt9URjxPe1TOoxUHmwpxYV0x1ZMpgrIFTPg=;
 b=M+01oPwOSDTE2vcgoKcPfXP9EYHgSAAyyJ5W6ybxDD50G6BNtC+leAZvE62RvOYF5rZVEA
 cRrIMWESya5Sb2Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 64F2313691;
 Tue,  8 Apr 2025 08:27:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id tbiwFgje9GdHUgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 08 Apr 2025 08:27:52 +0000
Message-ID: <ddc2d18b-a57b-4714-85ca-634201bb1273@suse.de>
Date: Tue, 8 Apr 2025 10:27:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] panel/boe-tv101wum-ll2: Use refcounted allocation
 in place of devm_kzalloc()
To: Anusha Srivatsa <asrivats@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>,
 Joel Selvaraj <jo@jsfamily.in>, Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
 <20250401-b4-drm-panel-mass-driver-convert-v1-7-cdd7615e1f93@redhat.com>
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
In-Reply-To: <20250401-b4-drm-panel-mass-driver-convert-v1-7-cdd7615e1f93@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BF59C21181
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_TWELVE(0.00)[12];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FREEMAIL_TO(0.00)[redhat.com,linaro.org,quicinc.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,jsfamily.in,chromium.org];
 ARC_NA(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, suse.de:mid, suse.de:dkim]
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

Hi,

this patch doesn't build.

linux/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c: In function 
‘boe_tv101wum_ll2_probe’:
linux/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c:241:23: error: 
unterminated argument list invoking macro "devm_drm_panel_alloc"
   241 | MODULE_LICENSE("GPL");
       |                       ^
linux/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c:169:15: error: 
‘devm_drm_panel_alloc’ undeclared (first use in this function); did you 
mean ‘devm_drm_panel_add_follower’?
   169 |         ctx = devm_drm_panel_alloc(dev, struct 
boe_tv101wum_ll2, panel,
       |               ^~~~~~~~~~~~~~~~~~~~
       |               devm_drm_panel_add_follower
linux/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c:169:15: note: each 
undeclared identifier is reported only once for each function it appears in
linux/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c:169:35: error: 
expected ‘;’ at end of input
   169 |         ctx = devm_drm_panel_alloc(dev, struct 
boe_tv101wum_ll2, panel,
       |                                   ^
       |                                   ;
......
linux/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c:169:9: error: 
expected declaration or statement at end of input
   169 |         ctx = devm_drm_panel_alloc(dev, struct 
boe_tv101wum_ll2, panel,
       |         ^~~
linux/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c:167:13: warning: 
unused variable ‘ret’ [-Wunused-variable]
   167 |         int ret;
       |             ^~~
linux/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c:166:34: warning: 
variable ‘ctx’ set but not used [-Wunused-but-set-variable]
   166 |         struct boe_tv101wum_ll2 *ctx;
       |                                  ^~~
linux/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c:165:24: warning: 
unused variable ‘dev’ [-Wunused-variable]
   165 |         struct device *dev = &dsi->dev;
       |                        ^~~
linux/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c:169:9: error: no 
return statement in function returning non-void [-Werror=return-type]
   169 |         ctx = devm_drm_panel_alloc(dev, struct 
boe_tv101wum_ll2, panel,
       |         ^~~
linux/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c: At top level:
linux/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c:163:12: warning: 
‘boe_tv101wum_ll2_probe’ defined but not used [-Wunused-function]
   163 | static int boe_tv101wum_ll2_probe(struct mipi_dsi_device *dsi)
       |            ^~~~~~~~~~~~~~~~~~~~~~
linux/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c:157:37: warning: 
‘boe_tv101wum_ll2_panel_funcs’ defined but not used 
[-Wunused-const-variable=]
   157 | static const struct drm_panel_funcs 
boe_tv101wum_ll2_panel_funcs = {
       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors

Please fix.

Best regard
Thomas

Am 01.04.25 um 18:03 schrieb Anusha Srivatsa:
> Move to using the new API devm_drm_panel_alloc() to allocate the
> panel.
>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>   drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c
> index 50e4a5341bc65727b5ed6ba43a11f5ab9ac9f5b9..04c7890cc51db43bdc6e38cdae8f7f21fd48009f 100644
> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c
> @@ -166,9 +166,11 @@ static int boe_tv101wum_ll2_probe(struct mipi_dsi_device *dsi)
>   	struct boe_tv101wum_ll2 *ctx;
>   	int ret;
>   
> -	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> -	if (!ctx)
> -		return -ENOMEM;
> +	ctx = devm_drm_panel_alloc(dev, struct boe_tv101wum_ll2, panel,
> +				   &boe_tv101wum_ll2_panel_funcs,
> +				   DRM_MODE_CONNECTOR_DSI
> +	if (IS_ERR(panel))
> +		return PTR_ERR(panel);
>   
>   	ret = devm_regulator_bulk_get_const(&dsi->dev,
>   					ARRAY_SIZE(boe_tv101wum_ll2_supplies),
> @@ -190,8 +192,6 @@ static int boe_tv101wum_ll2_probe(struct mipi_dsi_device *dsi)
>   	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
>   			  MIPI_DSI_MODE_VIDEO_HSE;
>   
> -	drm_panel_init(&ctx->panel, dev, &boe_tv101wum_ll2_panel_funcs,
> -		       DRM_MODE_CONNECTOR_DSI);
>   	ctx->panel.prepare_prev_first = true;
>   
>   	ret = drm_panel_of_backlight(&ctx->panel);
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

