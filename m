Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E17CA02104
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 09:42:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD88610E5BF;
	Mon,  6 Jan 2025 08:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="hJYk+hZD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/qRXGOJ2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hJYk+hZD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/qRXGOJ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786CF10E5BF
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 08:42:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0655C1F383;
 Mon,  6 Jan 2025 08:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1736152960; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kSA9/ohnPHZwGK1iEJhTuzMZ3v9n0w422NyJj76ol7o=;
 b=hJYk+hZDlslqHaCrRrJbPf6NSoPd5qMNoKq75sb4ReEclqYPtAffJXZor2SqEdskQoSjls
 o7HT8coG59KKnyR46K9MQe5+pzf1ff87Pgz+xh4KCylHyHEA55KbL1BYd1bR6LCUEhwzVg
 atnaKTvwphhi2WOP9l1eRnfWLD8pbYE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1736152960;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kSA9/ohnPHZwGK1iEJhTuzMZ3v9n0w422NyJj76ol7o=;
 b=/qRXGOJ2SlXMSVYdaeMyQHblwooo1jp+Y0WbzHa9fb+oPJ1qeDW8ZMhjq7T/2gFWb7zRaG
 +Wjl5RI4kWkQsRDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1736152960; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kSA9/ohnPHZwGK1iEJhTuzMZ3v9n0w422NyJj76ol7o=;
 b=hJYk+hZDlslqHaCrRrJbPf6NSoPd5qMNoKq75sb4ReEclqYPtAffJXZor2SqEdskQoSjls
 o7HT8coG59KKnyR46K9MQe5+pzf1ff87Pgz+xh4KCylHyHEA55KbL1BYd1bR6LCUEhwzVg
 atnaKTvwphhi2WOP9l1eRnfWLD8pbYE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1736152960;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kSA9/ohnPHZwGK1iEJhTuzMZ3v9n0w422NyJj76ol7o=;
 b=/qRXGOJ2SlXMSVYdaeMyQHblwooo1jp+Y0WbzHa9fb+oPJ1qeDW8ZMhjq7T/2gFWb7zRaG
 +Wjl5RI4kWkQsRDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BA1C8137DA;
 Mon,  6 Jan 2025 08:42:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wnwmLH+Xe2chYgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 06 Jan 2025 08:42:39 +0000
Message-ID: <c7180207-e1be-45e3-a2e6-584ffb59ea50@suse.de>
Date: Mon, 6 Jan 2025 09:42:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/ast: Support timings, 1280x720/1280x960/1600x900
To: Jammy Huang <jammy_huang@aspeedtech.com>, jfalempe@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241225003215.1343996-1-jammy_huang@aspeedtech.com>
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
In-Reply-To: <20241225003215.1343996-1-jammy_huang@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MID_RHS_MATCH_FROM(0.00)[]; RCPT_COUNT_SEVEN(0.00)[9];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_TO(0.00)[aspeedtech.com,redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_DN_SOME(0.00)[]
X-Spam-Score: -4.30
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

Hi Jamie


Am 25.12.24 um 01:32 schrieb Jammy Huang:
> In this patch, 3 new timings are added into support list.
>
> If you want to have new timings, 1280x720 and 1280x960 on DisplayPort,
> your dp-fw should be newer than version, 20240502.

Thank you for the patch.

What happens if the firmware is not at the required version?

As it seems unreasonable to expect everyone to upgrade their DP firmware 
(or even be able to), we 'll likely need a test against the firmware 
version. So that the additional display modes are optional within the 
driver. My proposal is to get the firmware version at the end of 
ast_dp_launch() [1]. Then implement drm_encoder_helper_funcs.mode_valid 
[2] to filter out unsupported modes on older firmwares. Does that make 
sense?

Best regards
Thomas

[1] 
https://elixir.bootlin.com/linux/v6.13-rc3/source/drivers/gpu/drm/ast/ast_dp.c#L148
[2] 
https://elixir.bootlin.com/linux/v6.13-rc3/source/include/drm/drm_modeset_helper_vtables.h#L562

>
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
> v2:
>   - Fix build errors.
> v3:
>   - Fix typo.
> ---
>   drivers/gpu/drm/ast/ast_dp.c     |  9 ++++++++-
>   drivers/gpu/drm/ast/ast_drv.h    |  3 +++
>   drivers/gpu/drm/ast/ast_mode.c   | 14 ++++++++++++++
>   drivers/gpu/drm/ast/ast_tables.h | 18 ++++++++++++++++++
>   4 files changed, 43 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
> index 0e282b7b167c..0b56f0335871 100644
> --- a/drivers/gpu/drm/ast/ast_dp.c
> +++ b/drivers/gpu/drm/ast/ast_dp.c
> @@ -255,6 +255,10 @@ static void ast_dp_set_mode(struct drm_crtc *crtc, struct ast_vbios_mode_info *v
>   	case 1280:
>   		if (crtc->mode.crtc_vdisplay == 800)
>   			ModeIdx = (ASTDP_1280x800_60_RB - (u8) ulRefreshRateIndex);
> +		else if (crtc->mode.crtc_vdisplay == 720)
> +			ModeIdx = ASTDP_1280x720_60;
> +		else if (crtc->mode.crtc_vdisplay == 960)
> +			ModeIdx = ASTDP_1280x960_60;
>   		else		// 1024
>   			ModeIdx = (ASTDP_1280x1024_60 + (u8) ulRefreshRateIndex);
>   		break;
> @@ -267,7 +271,10 @@ static void ast_dp_set_mode(struct drm_crtc *crtc, struct ast_vbios_mode_info *v
>   		break;
>   	case 1600:
>   		if (crtc->mode.crtc_vdisplay == 900)
> -			ModeIdx = (ASTDP_1600x900_60_RB - (u8) ulRefreshRateIndex);
> +			if (ulRefreshRateIndex == 2)
> +				ModeIdx = ASTDP_1600x900_60_DMT;
> +			else
> +				ModeIdx = (ASTDP_1600x900_60_RB - (u8) ulRefreshRateIndex);
>   		else		//1200
>   			ModeIdx = ASTDP_1600x1200_60;
>   		break;
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 21ce3769bf0d..e7cef334b3ec 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -442,6 +442,9 @@ int ast_mode_config_init(struct ast_device *ast);
>   #define ASTDP_1600x900_60_RB	0x1D
>   #define ASTDP_1366x768_60		0x1E
>   #define ASTDP_1152x864_75		0x1F
> +#define ASTDP_1600x900_60_DMT		0x51
> +#define ASTDP_1280x720_60		0x52
> +#define ASTDP_1280x960_60		0x53
>   
>   int ast_mm_init(struct ast_device *ast);
>   
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 9d5321c81e68..48d1065846a2 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -147,6 +147,10 @@ static bool ast_get_vbios_mode_info(const struct drm_format_info *format,
>   	case 1280:
>   		if (mode->crtc_vdisplay == 800)
>   			vbios_mode->enh_table = &res_1280x800[refresh_rate_index];
> +		else if (mode->crtc_vdisplay == 720)
> +			vbios_mode->enh_table = &res_1280x720[refresh_rate_index];
> +		else if (mode->crtc_vdisplay == 960)
> +			vbios_mode->enh_table = &res_1280x960[refresh_rate_index];
>   		else
>   			vbios_mode->enh_table = &res_1280x1024[refresh_rate_index];
>   		break;
> @@ -475,6 +479,12 @@ static void ast_set_dclk_reg(struct ast_device *ast,
>   	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xbb, 0x0f,
>   			       (clk_info->param3 & 0xc0) |
>   			       ((clk_info->param3 & 0x3) << 4));
> +
> +	/* Set SEQ; Half dclk for this timing */
> +	if (vbios_mode->enh_table->flags & HalfDCLK)
> +		ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xff, 0x08);
> +	else
> +		ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xf7, 0x00);
>   }
>   
>   static void ast_set_color_reg(struct ast_device *ast,
> @@ -1027,8 +1037,12 @@ ast_crtc_helper_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode
>   	if (ast->support_wide_screen) {
>   		if ((mode->hdisplay == 1680) && (mode->vdisplay == 1050))
>   			return MODE_OK;
> +		if ((mode->hdisplay == 1280) && (mode->vdisplay == 960))
> +			return MODE_OK;
>   		if ((mode->hdisplay == 1280) && (mode->vdisplay == 800))
>   			return MODE_OK;
> +		if ((mode->hdisplay == 1280) && (mode->vdisplay == 720))
> +			return MODE_OK;
>   		if ((mode->hdisplay == 1440) && (mode->vdisplay == 900))
>   			return MODE_OK;
>   		if ((mode->hdisplay == 1360) && (mode->vdisplay == 768))
> diff --git a/drivers/gpu/drm/ast/ast_tables.h b/drivers/gpu/drm/ast/ast_tables.h
> index 0378c9bc079b..329d6bac867b 100644
> --- a/drivers/gpu/drm/ast/ast_tables.h
> +++ b/drivers/gpu/drm/ast/ast_tables.h
> @@ -254,6 +254,13 @@ static const struct ast_vbios_enhtable res_1024x768[] = {
>   	 (SyncPP | Charx8Dot), 0xFF, 4, 0x31 },
>   };
>   
> +static const struct ast_vbios_enhtable res_1280x960[] = {
> +	{1800, 1280, 96, 112, 1000, 960, 1, 3, VCLK108, /* 60Hz */
> +	 (SyncPP | Charx8Dot), 60, 1, 0x3E },
> +	{1800, 1280, 96, 112, 1000, 960, 1, 3, VCLK108, /* end */
> +	 (SyncPP | Charx8Dot), 0xFF, 1, 0x3E },
> +};
> +
>   static const struct ast_vbios_enhtable res_1280x1024[] = {
>   	{1688, 1280, 48, 112, 1066, 1024, 1, 3, VCLK108,	/* 60Hz */
>   	 (SyncPP | Charx8Dot), 60, 1, 0x32 },
> @@ -280,6 +287,15 @@ static const struct ast_vbios_enhtable res_1152x864[] = {
>   };
>   
>   /* 16:9 */
> +static const struct ast_vbios_enhtable res_1280x720[] = {
> +	{1650, 1280, 110, 40, 750, 720, 5, 5, VCLK148_5,	/* 60Hz */
> +	 (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo |
> +	  HalfDCLK), 60, 1, 0x3D },
> +	{1650, 1280, 110, 40, 750, 720, 5, 5, VCLK148_5,	/* end */
> +	 (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo |
> +	  HalfDCLK), 0xFF, 1, 0x3D },
> +};
> +
>   static const struct ast_vbios_enhtable res_1360x768[] = {
>   	{1792, 1360, 64, 112, 795, 768, 3, 6, VCLK85_5,		/* 60Hz */
>   	 (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 1, 0x39 },
> @@ -294,6 +310,8 @@ static const struct ast_vbios_enhtable res_1600x900[] = {
>   	  AST2500PreCatchCRT), 60, 1, 0x3A },
>   	{2112, 1600, 88, 168, 934, 900, 3, 5, VCLK118_25,	/* 60Hz CVT */
>   	 (SyncPN | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 2, 0x3A },
> +	{1800, 1600, 24, 80, 1000, 900, 1, 3, VCLK108,		/* 60Hz DMT */
> +	 (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 3, 0x3A },
>   	{2112, 1600, 88, 168, 934, 900, 3, 5, VCLK118_25,	/* 60Hz CVT */
>   	 (SyncPN | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 0xFF, 2, 0x3A },
>   };
>
> base-commit: 4bbf9020becbfd8fc2c3da790855b7042fad455b

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

