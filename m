Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B2CA02151
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 10:01:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2023210E5D8;
	Mon,  6 Jan 2025 09:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="2WoCnwwa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KIBzDEyx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0qA4+zGF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Aey7PDWT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C529C10E5CB;
 Mon,  6 Jan 2025 09:01:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DA3C01F399;
 Mon,  6 Jan 2025 09:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1736154081; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=L9eo9eLrGZ8kbAkajy2+fQREdfqGj9Khgjn/UA2FQ4E=;
 b=2WoCnwwapqN+n2bKEuOpX6LKFaYfAfnzRg4Wq1OxpCAs9RyJD0Eop+PDb5LuytEsUGaZte
 EA45ojWGt7xc/1Iqh7kvLG2kUOFNFjCSkyEbvU1Sj9CKtO/mOMhg6ojPGH6IOIB9DNTxVU
 QV+3xiE9zNWgIK9N9n3J9bfjXFS/mDc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1736154081;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=L9eo9eLrGZ8kbAkajy2+fQREdfqGj9Khgjn/UA2FQ4E=;
 b=KIBzDEyxpGeRt3gZkCEmUyIwCNglEAZWwqBuYD8sloE1dbuaS95LBiPf7fCW16HIS2e9IH
 94SPkhdy2HZ3hmCQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0qA4+zGF;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Aey7PDWT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1736154079; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=L9eo9eLrGZ8kbAkajy2+fQREdfqGj9Khgjn/UA2FQ4E=;
 b=0qA4+zGFPAj6fwkN1pZRgu7xN6NttKaiS05UlWQcpBUR6iU67stKlm01IMgKhMJgvEyXgn
 vOz8GwNljIyF4eQ/7nQmQ6LpZekr9v+o+xR00NUJGLE0gqoMqnumRSCbc+ABje62uBXur6
 XaNDRghs0t5OUX45eqEWtypKHK2zhW4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1736154079;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=L9eo9eLrGZ8kbAkajy2+fQREdfqGj9Khgjn/UA2FQ4E=;
 b=Aey7PDWT6welzplhPVwpQXyTo3mFttIrV9GWNhahjddiAJD6zB5xHz94dPFeEB6pM9e85i
 GK3bWMMEbBTlCACQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 00D36139AB;
 Mon,  6 Jan 2025 09:01:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id HdNLOt2be2cHZwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 06 Jan 2025 09:01:17 +0000
Message-ID: <8f137bc5-6b65-4792-949f-7bec5bd115fb@suse.de>
Date: Mon, 6 Jan 2025 10:01:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] drm/connector: make mode_valid() callback accept
 const mode pointer
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Inki Dae
 <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Stefan Agner <stefan@agner.ch>,
 Alison Wang <alison.wang@nxp.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jani Nikula <jani.nikula@intel.com>
References: <20241214-drm-connector-mode-valid-const-v2-0-4f9498a4c822@linaro.org>
 <76ho36jqcraehnsgpjralpye52w7ryshhgizekn4qqfsikiojd@3yyorbvjkc7b>
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
In-Reply-To: <76ho36jqcraehnsgpjralpye52w7ryshhgizekn4qqfsikiojd@3yyorbvjkc7b>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: DA3C01F399
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[linaro.org,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,kernel.org,redhat.com,amd.com,foss.st.com,arm.com,ideasonboard.com,kwiboo.se,ge.com,collabora.co.uk,samsung.com,agner.ch,nxp.com,pengutronix.de,quicinc.com,poorly.run,somainline.org,rock-chips.com,sntech.de,csie.org,sholland.org,nvidia.com,raspberrypi.com,igalia.com,chromium.org,broadcom.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+];
 R_RATELIMIT(0.00)[to_ip_from(RL5qdohruh175rhiw1bqi96ifb)];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_GT_50(0.00)[82];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TAGGED_RCPT(0.00)[renesas];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim, suse.de:mid, suse.de:email,
 linaro.org:email, imap1.dmz-prg2.suse.org:rdns, imap1.dmz-prg2.suse.org:helo]
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


Am 05.01.25 um 23:47 schrieb Dmitry Baryshkov:
> On Sat, Dec 14, 2024 at 03:37:04PM +0200, Dmitry Baryshkov wrote:
>> While working on the generic mode_valid() implementation for the HDMI
>> Connector framework I noticed that unlike other DRM objects
>> drm_connector accepts non-const pointer to struct drm_display_mode,
>> while obviously mode_valid() isn't expected to modify the argument.
>>
>> Mass-change the DRM framework code to pass const argument to that
>> callback.
>>
>> The series has been compile-tested with defconfig for x86-64, arm and
>> arm64.
>>
>> Note: yes, I understand that this change might be hard to review and
>> merge. The only viable option that I foresee is to add new callback,
>> having the const argument and migrate drivers into using it one by one.
> Colleagues, I'd like to graciously ping regarding this series. Should it
> be merged as is (possibly requiring more R-B's)? Or should I rework it
> adding something like .mode_valid_new() callback which takes const
> argument?

Please merge as-is. No need to complicate things. For the whole series:

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for doing this.

Best regards
Thomas

>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>> Changes in v2:
>> - Rebased on top of linux-next
>> - Replaced 'accept const argument' with 'take a const arugment'
>>    (Laurent)
>> - Link to v1: https://lore.kernel.org/r/20241115-drm-connector-mode-valid-const-v1-0-b1b523156f71@linaro.org
>>
>> ---
>> Dmitry Baryshkov (5):
>>        drm/encoder_slave: make mode_valid accept const struct drm_display_mode
>>        drm/amdgpu: don't change mode in amdgpu_dm_connector_mode_valid()
>>        drm/sti: hda: pass const struct drm_display_mode* to hda_get_mode_idx()
>>        drm/connector: make mode_valid_ctx take a const struct drm_display_mode
>>        drm/connector: make mode_valid take a const struct drm_display_mode
>>
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c           |  8 ++++----
>>   drivers/gpu/drm/amd/amdgpu/atombios_dp.c                 |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/atombios_dp.h                 |  2 +-
>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c        | 12 +++++++++---
>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h        |  2 +-
>>   drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c |  2 +-
>>   drivers/gpu/drm/arm/malidp_mw.c                          |  2 +-
>>   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c             |  2 +-
>>   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c      |  2 +-
>>   drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c |  7 -------
>>   drivers/gpu/drm/display/drm_bridge_connector.c           |  2 +-
>>   drivers/gpu/drm/display/drm_hdmi_state_helper.c          |  2 +-
>>   drivers/gpu/drm/drm_crtc_helper_internal.h               |  2 +-
>>   drivers/gpu/drm/drm_probe_helper.c                       |  2 +-
>>   drivers/gpu/drm/exynos/exynos_hdmi.c                     |  2 +-
>>   drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c                |  2 +-
>>   drivers/gpu/drm/gma500/cdv_intel_crt.c                   |  2 +-
>>   drivers/gpu/drm/gma500/cdv_intel_dp.c                    |  2 +-
>>   drivers/gpu/drm/gma500/cdv_intel_hdmi.c                  |  2 +-
>>   drivers/gpu/drm/gma500/cdv_intel_lvds.c                  |  2 +-
>>   drivers/gpu/drm/gma500/oaktrail_hdmi.c                   |  2 +-
>>   drivers/gpu/drm/gma500/psb_intel_drv.h                   |  2 +-
>>   drivers/gpu/drm/gma500/psb_intel_lvds.c                  |  2 +-
>>   drivers/gpu/drm/gma500/psb_intel_sdvo.c                  |  2 +-
>>   drivers/gpu/drm/i2c/ch7006_drv.c                         |  2 +-
>>   drivers/gpu/drm/i2c/sil164_drv.c                         |  2 +-
>>   drivers/gpu/drm/i915/display/dvo_ch7017.c                |  2 +-
>>   drivers/gpu/drm/i915/display/dvo_ch7xxx.c                |  2 +-
>>   drivers/gpu/drm/i915/display/dvo_ivch.c                  |  2 +-
>>   drivers/gpu/drm/i915/display/dvo_ns2501.c                |  2 +-
>>   drivers/gpu/drm/i915/display/dvo_sil164.c                |  2 +-
>>   drivers/gpu/drm/i915/display/dvo_tfp410.c                |  2 +-
>>   drivers/gpu/drm/i915/display/icl_dsi.c                   |  2 +-
>>   drivers/gpu/drm/i915/display/intel_crt.c                 |  2 +-
>>   drivers/gpu/drm/i915/display/intel_dp.c                  |  2 +-
>>   drivers/gpu/drm/i915/display/intel_dp_mst.c              |  2 +-
>>   drivers/gpu/drm/i915/display/intel_dsi.c                 |  2 +-
>>   drivers/gpu/drm/i915/display/intel_dsi.h                 |  2 +-
>>   drivers/gpu/drm/i915/display/intel_dvo.c                 |  2 +-
>>   drivers/gpu/drm/i915/display/intel_dvo_dev.h             |  2 +-
>>   drivers/gpu/drm/i915/display/intel_hdmi.c                |  2 +-
>>   drivers/gpu/drm/i915/display/intel_lvds.c                |  2 +-
>>   drivers/gpu/drm/i915/display/intel_sdvo.c                |  2 +-
>>   drivers/gpu/drm/i915/display/intel_tv.c                  |  2 +-
>>   drivers/gpu/drm/i915/display/vlv_dsi.c                   |  2 +-
>>   drivers/gpu/drm/imx/ipuv3/imx-tve.c                      |  2 +-
>>   drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c      |  2 +-
>>   drivers/gpu/drm/nouveau/dispnv04/tvnv17.c                |  2 +-
>>   drivers/gpu/drm/nouveau/dispnv50/disp.c                  |  2 +-
>>   drivers/gpu/drm/nouveau/nouveau_connector.c              |  2 +-
>>   drivers/gpu/drm/qxl/qxl_display.c                        |  2 +-
>>   drivers/gpu/drm/radeon/atombios_dp.c                     |  2 +-
>>   drivers/gpu/drm/radeon/radeon_connectors.c               | 10 +++++-----
>>   drivers/gpu/drm/radeon/radeon_mode.h                     |  2 +-
>>   drivers/gpu/drm/rockchip/cdn-dp-core.c                   |  2 +-
>>   drivers/gpu/drm/rockchip/inno_hdmi.c                     |  4 ++--
>>   drivers/gpu/drm/rockchip/rk3066_hdmi.c                   |  2 +-
>>   drivers/gpu/drm/sti/sti_dvo.c                            |  2 +-
>>   drivers/gpu/drm/sti/sti_hda.c                            | 12 ++++++------
>>   drivers/gpu/drm/sti/sti_hdmi.c                           |  2 +-
>>   drivers/gpu/drm/tegra/dsi.c                              |  2 +-
>>   drivers/gpu/drm/tegra/hdmi.c                             |  2 +-
>>   drivers/gpu/drm/tegra/sor.c                              |  2 +-
>>   drivers/gpu/drm/vc4/vc4_txp.c                            |  2 +-
>>   drivers/gpu/drm/virtio/virtgpu_display.c                 |  2 +-
>>   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                      |  2 +-
>>   drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                      |  2 +-
>>   drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c                     |  2 +-
>>   include/drm/display/drm_hdmi_state_helper.h              |  2 +-
>>   include/drm/drm_encoder_slave.h                          |  2 +-
>>   include/drm/drm_modeset_helper_vtables.h                 |  4 ++--
>>   71 files changed, 92 insertions(+), 93 deletions(-)
>> ---
>> base-commit: 4176cf5c5651c33769de83bb61b0287f4ec7719f
>> change-id: 20241115-drm-connector-mode-valid-const-ae3db0ef6cb7
>>
>> Best regards,
>> -- 
>> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

