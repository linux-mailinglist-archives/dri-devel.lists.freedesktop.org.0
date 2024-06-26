Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2F49186B4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 18:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A494310E93B;
	Wed, 26 Jun 2024 16:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="uzlddmox";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0uts6qXk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uzlddmox";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0uts6qXk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D53310E92C;
 Wed, 26 Jun 2024 16:05:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B5B001FB5B;
 Wed, 26 Jun 2024 16:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719417951; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=eShvz6cx1RJVkeFTzcDVwhKLDscOaGkFuNY6Wh/kUAA=;
 b=uzlddmoxHCTGGSRZV8kVVRLG2uM5SGNKgYIO5ymvoXz29eBdRiVoyjVF906kxsn/aKRmGR
 HxcqIhK4OvkXRUSvixo7HbusIWji5fPg9uLxmkU4bvT/KTHsEe3U5j4BsAMo6Mj73Y2E0H
 x7NQYcpp90wilqwnWONI9zJ2Xqqn/aY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719417951;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=eShvz6cx1RJVkeFTzcDVwhKLDscOaGkFuNY6Wh/kUAA=;
 b=0uts6qXkiFf83pqLpoBwRzyH7LXU7g6ePp3QBbmRVvcbjHZUhraMhCqvz6P0xZVqjZR36/
 rlaurJGefeGYywCQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=uzlddmox;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0uts6qXk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719417951; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=eShvz6cx1RJVkeFTzcDVwhKLDscOaGkFuNY6Wh/kUAA=;
 b=uzlddmoxHCTGGSRZV8kVVRLG2uM5SGNKgYIO5ymvoXz29eBdRiVoyjVF906kxsn/aKRmGR
 HxcqIhK4OvkXRUSvixo7HbusIWji5fPg9uLxmkU4bvT/KTHsEe3U5j4BsAMo6Mj73Y2E0H
 x7NQYcpp90wilqwnWONI9zJ2Xqqn/aY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719417951;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=eShvz6cx1RJVkeFTzcDVwhKLDscOaGkFuNY6Wh/kUAA=;
 b=0uts6qXkiFf83pqLpoBwRzyH7LXU7g6ePp3QBbmRVvcbjHZUhraMhCqvz6P0xZVqjZR36/
 rlaurJGefeGYywCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 23B5813AAD;
 Wed, 26 Jun 2024 16:05:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OLJqB188fGabdQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Jun 2024 16:05:51 +0000
Message-ID: <ef535c21-4242-436c-900a-9b9a2b8cf8db@suse.de>
Date: Wed, 26 Jun 2024 18:05:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/display: split DSC helpers from DP helpers
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Jani Nikula
 <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20240623-panel-sw43408-fix-v5-1-5401ab61e738@linaro.org>
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
In-Reply-To: <20240623-panel-sw43408-fix-v5-1-5401ab61e738@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[linaro.org,amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,intel.com,ursulin.net,quicinc.com,poorly.run,somainline.org];
 RCPT_COUNT_TWELVE(0.00)[23]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: B5B001FB5B
X-Spam-Flag: NO
X-Spam-Score: -4.50
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

Am 23.06.24 um 00:44 schrieb Dmitry Baryshkov:
> Currently the DRM DSC functions are selected by the
> DRM_DISPLAY_DP_HELPER Kconfig symbol. This is not optimal, since the DSI
> code (both panel and host drivers) end up selecting the seemingly
> irrelevant DP helpers. Split the DSC code to be guarded by the separate
> DRM_DISPLAY_DSC_HELPER Kconfig symbol.
>
> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> To: Alex Deucher <alexander.deucher@amd.com>
> To: Christian König <christian.koenig@amd.com>
> To: Pan, Xinhui <Xinhui.Pan@amd.com>
> To: David Airlie <airlied@gmail.com>
> To: Daniel Vetter <daniel@ffwll.ch>
> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> To: Maxime Ripard <mripard@kernel.org>
> To: Thomas Zimmermann <tzimmermann@suse.de>
> To: Jani Nikula <jani.nikula@linux.intel.com>
> To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> To: Rodrigo Vivi <rodrigo.vivi@intel.com>
> To: Tvrtko Ursulin <tursulin@ursulin.net>
> To: Rob Clark <robdclark@gmail.com>
> To: Abhinav Kumar <quic_abhinavk@quicinc.com>
> To: Sean Paul <sean@poorly.run>
> To: Marijn Suijten <marijn.suijten@somainline.org>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Jessica Zhang <quic_jesszhan@quicinc.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Changes in v5:
> - Drop applied patches
> - Link to v4: https://lore.kernel.org/r/20240528-panel-sw43408-fix-v4-0-330b42445bcc@linaro.org
>
> Changes in v4:
> - Reoder patches so that fixes come first, to be able to land them to
>    drm-misc-fixes
> - Link to v3: https://lore.kernel.org/r/20240522-panel-sw43408-fix-v3-0-6902285adcc0@linaro.org
>
> Changes in v3:
> - Split DRM_DISPLAY_DSC_HELPER from DRM_DISPLAY_DP_HELPER
> - Added missing Fixes tags
> - Link to v2: https://lore.kernel.org/r/20240510-panel-sw43408-fix-v2-0-d1ef91ee1b7d@linaro.org
>
> Changes in v2:
> - use SELECT instead of DEPEND to follow the reverted Kconfig changes
> - Link to v1: https://lore.kernel.org/r/20240420-panel-sw43408-fix-v1-0-b282ff725242@linaro.org
> ---
>   drivers/gpu/drm/amd/amdgpu/Kconfig | 1 +
>   drivers/gpu/drm/display/Kconfig    | 6 ++++++
>   drivers/gpu/drm/display/Makefile   | 3 ++-
>   drivers/gpu/drm/i915/Kconfig       | 1 +
>   drivers/gpu/drm/msm/Kconfig        | 1 +
>   drivers/gpu/drm/panel/Kconfig      | 6 +++---
>   6 files changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
> index 4232ab27f990..5933ca8c6b96 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
> @@ -6,6 +6,7 @@ config DRM_AMDGPU
>   	depends on !UML
>   	select FW_LOADER
>   	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_DSC_HELPER
>   	select DRM_DISPLAY_HDMI_HELPER
>   	select DRM_DISPLAY_HDCP_HELPER
>   	select DRM_DISPLAY_HELPER
> diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
> index 479e62690d75..a2e42014ffe0 100644
> --- a/drivers/gpu/drm/display/Kconfig
> +++ b/drivers/gpu/drm/display/Kconfig
> @@ -59,6 +59,12 @@ config DRM_DISPLAY_DP_TUNNEL_STATE_DEBUG
>   
>   	  If in doubt, say "N".
>   
> +config DRM_DISPLAY_DSC_HELPER
> +	bool
> +	depends on DRM_DISPLAY_HELPER
> +	help
> +	  DRM display helpers for VESA DSC (used by DSI and DisplayPort).
> +
>   config DRM_DISPLAY_HDCP_HELPER
>   	bool
>   	depends on DRM_DISPLAY_HELPER
> diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
> index 629df2f4d322..df8f22c7e916 100644
> --- a/drivers/gpu/drm/display/Makefile
> +++ b/drivers/gpu/drm/display/Makefile
> @@ -6,7 +6,8 @@ drm_display_helper-y := drm_display_helper_mod.o
>   drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_HELPER) += \
>   	drm_dp_dual_mode_helper.o \
>   	drm_dp_helper.o \
> -	drm_dp_mst_topology.o \
> +	drm_dp_mst_topology.o
> +drm_display_helper-$(CONFIG_DRM_DISPLAY_DSC_HELPER) += \
>   	drm_dsc_helper.o
>   drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_TUNNEL) += \

nit: DSC_HELPER should go after DP_TUNNEL to keep it sorted alphabetically.

Best regards
Thomas

>   	drm_dp_tunnel.o
> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index faa253b27664..db400aad88fa 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -11,6 +11,7 @@ config DRM_I915
>   	select SHMEM
>   	select TMPFS
>   	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_DSC_HELPER
>   	select DRM_DISPLAY_HDCP_HELPER
>   	select DRM_DISPLAY_HDMI_HELPER
>   	select DRM_DISPLAY_HELPER
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 1931ecf73e32..6dcd26180611 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -111,6 +111,7 @@ config DRM_MSM_DSI
>   	depends on DRM_MSM
>   	select DRM_PANEL
>   	select DRM_MIPI_DSI
> +	select DRM_DISPLAY_DSC_HELPER
>   	default y
>   	help
>   	  Choose this option if you have a need for MIPI DSI connector
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index bf4eadfe21cb..afae8b130e9a 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -349,7 +349,7 @@ config DRM_PANEL_LG_SW43408
>   	depends on OF
>   	depends on DRM_MIPI_DSI
>   	depends on BACKLIGHT_CLASS_DEVICE
> -	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_DSC_HELPER
>   	select DRM_DISPLAY_HELPER
>   	help
>   	  Say Y here if you want to enable support for LG sw43408 panel.
> @@ -558,7 +558,7 @@ config DRM_PANEL_RAYDIUM_RM692E5
>   	depends on OF
>   	depends on DRM_MIPI_DSI
>   	depends on BACKLIGHT_CLASS_DEVICE
> -	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_DSC_HELPER
>   	select DRM_DISPLAY_HELPER
>   	help
>   	  Say Y here if you want to enable support for Raydium RM692E5-based
> @@ -916,7 +916,7 @@ config DRM_PANEL_VISIONOX_R66451
>   	depends on OF
>   	depends on DRM_MIPI_DSI
>   	depends on BACKLIGHT_CLASS_DEVICE
> -	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_DSC_HELPER
>   	select DRM_DISPLAY_HELPER
>   	help
>   	  Say Y here if you want to enable support for Visionox
>
> ---
> base-commit: 2102cb0d050d34d50b9642a3a50861787527e922
> change-id: 20240420-panel-sw43408-fix-ff6549c121be
>
> Best regards,

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

