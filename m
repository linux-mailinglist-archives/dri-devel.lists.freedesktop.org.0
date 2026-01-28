Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBmhE9i/eWmnywEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 08:50:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 862299DDCD
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 08:50:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D8110E268;
	Wed, 28 Jan 2026 07:50:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="DtDnefQJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s/Ki7tDO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DtDnefQJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s/Ki7tDO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC0610E268
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 07:50:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5687F33A81;
 Wed, 28 Jan 2026 07:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1769586641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Aa1gMe/mq9inWqiC7tTfzhj550KM1ThH2HM5vZVIxzY=;
 b=DtDnefQJMkDWCKpWgRGa1AWF70af8MVO2vSRsePVQvDPmU7MRFTigsLtO14DD8EidgMMip
 pXbcgpijwj/xD2oJbl2QZMoQAVTGaX6KFB6iuJbzRa9EUEahxPHVZxtQPPN0pdhNORdc0n
 G+xPL/9RbwJMLAwi78VO6QzluruBDLU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1769586641;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Aa1gMe/mq9inWqiC7tTfzhj550KM1ThH2HM5vZVIxzY=;
 b=s/Ki7tDOtT+GM0o2CO3oxKCJmMo8NxCui5jFNFp56r+SCKX5YruNJFkKuAmm14iFHwAT+d
 d7HpuyZldGSlywAQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DtDnefQJ;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="s/Ki7tDO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1769586641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Aa1gMe/mq9inWqiC7tTfzhj550KM1ThH2HM5vZVIxzY=;
 b=DtDnefQJMkDWCKpWgRGa1AWF70af8MVO2vSRsePVQvDPmU7MRFTigsLtO14DD8EidgMMip
 pXbcgpijwj/xD2oJbl2QZMoQAVTGaX6KFB6iuJbzRa9EUEahxPHVZxtQPPN0pdhNORdc0n
 G+xPL/9RbwJMLAwi78VO6QzluruBDLU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1769586641;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Aa1gMe/mq9inWqiC7tTfzhj550KM1ThH2HM5vZVIxzY=;
 b=s/Ki7tDOtT+GM0o2CO3oxKCJmMo8NxCui5jFNFp56r+SCKX5YruNJFkKuAmm14iFHwAT+d
 d7HpuyZldGSlywAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 957CC3EA61;
 Wed, 28 Jan 2026 07:50:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yyMLI9C/eWnYegAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 28 Jan 2026 07:50:40 +0000
Message-ID: <6c037a3d-8061-422b-827b-c3795dd89477@suse.de>
Date: Wed, 28 Jan 2026 08:50:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/9] drm: verisilicon: add a driver for Verisilicon
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
References: <20260116043746.336328-1-zhengxingda@iscas.ac.cn>
 <20260116043746.336328-4-zhengxingda@iscas.ac.cn>
 <56e1974c-0fe6-4bdb-918d-fcf6a8b866c1@suse.de>
 <7bffdc45628fec9dd8175f696d3a68aa1e12f0a2.camel@icenowy.me>
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
In-Reply-To: <7bffdc45628fec9dd8175f696d3a68aa1e12f0a2.camel@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,suse.de:mid,suse.de:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:url]
X-Rspamd-Queue-Id: 862299DDCD
X-Rspamd-Action: no action

Hi

Am 22.01.26 um 10:47 schrieb Icenowy Zheng:
> 在 2026-01-21星期三的 13:56 +0100，Thomas Zimmermann写道：
>
> =================== 8< ====================
>>> +void drm_format_to_vs_format(u32 drm_format, struct vs_format
>>> *vs_format)
>>> +{
>>> +       switch (drm_format) {
>>> +       case DRM_FORMAT_XRGB4444:
>>> +       case DRM_FORMAT_RGBX4444:
>>> +       case DRM_FORMAT_XBGR4444:
>>> +       case DRM_FORMAT_BGRX4444:
>>> +               vs_format->color = VSDC_COLOR_FORMAT_X4R4G4B4;
>>> +               break;
>>> +       case DRM_FORMAT_ARGB4444:
>>> +       case DRM_FORMAT_RGBA4444:
>>> +       case DRM_FORMAT_ABGR4444:
>>> +       case DRM_FORMAT_BGRA4444:
>>> +               vs_format->color = VSDC_COLOR_FORMAT_A4R4G4B4;
>>> +               break;
>>> +       case DRM_FORMAT_XRGB1555:
>>> +       case DRM_FORMAT_RGBX5551:
>>> +       case DRM_FORMAT_XBGR1555:
>>> +       case DRM_FORMAT_BGRX5551:
>>> +               vs_format->color = VSDC_COLOR_FORMAT_X1R5G5B5;
>>> +               break;
>>> +       case DRM_FORMAT_ARGB1555:
>>> +       case DRM_FORMAT_RGBA5551:
>>> +       case DRM_FORMAT_ABGR1555:
>>> +       case DRM_FORMAT_BGRA5551:
>>> +               vs_format->color = VSDC_COLOR_FORMAT_A1R5G5B5;
>>> +               break;
>>> +       case DRM_FORMAT_RGB565:
>>> +       case DRM_FORMAT_BGR565:
>>> +               vs_format->color = VSDC_COLOR_FORMAT_R5G6B5;
>>> +               break;
>>> +       case DRM_FORMAT_XRGB8888:
>>> +       case DRM_FORMAT_RGBX8888:
>>> +       case DRM_FORMAT_XBGR8888:
>>> +       case DRM_FORMAT_BGRX8888:
>>> +               vs_format->color = VSDC_COLOR_FORMAT_X8R8G8B8;
>>> +               break;
>>> +       case DRM_FORMAT_ARGB8888:
>>> +       case DRM_FORMAT_RGBA8888:
>>> +       case DRM_FORMAT_ABGR8888:
>>> +       case DRM_FORMAT_BGRA8888:
>>> +               vs_format->color = VSDC_COLOR_FORMAT_A8R8G8B8;
>>> +               break;
>>> +       case DRM_FORMAT_ARGB2101010:
>>> +       case DRM_FORMAT_RGBA1010102:
>>> +       case DRM_FORMAT_ABGR2101010:
>>> +       case DRM_FORMAT_BGRA1010102:
>>> +               vs_format->color = VSDC_COLOR_FORMAT_A2R10G10B10;
>>> +               break;
>>> +       default:
>>> +               DRM_WARN("Unexpected drm format!\n");
>> drm_warn(). If this can be invoked from user space,easily, better use
>> drm_dbg()
> This function is called during atomic_update of planes, and I think in
> this case the unknown formats should already be rejected because
> they're not advertised for any planes.
>
> Did I get it right on this?

Yes. In principle you should never reach the default case. This message 
is only for testing internally.

What I usually do is to compute such internal values in the atomic_check 
helper and then store them in the respective state. Here, you'd need a 
custom struct vs_plane_state to hold them. If the format conversion 
fails in atomic_check, it can still return an errno code to user space.

Doing this throughout the driver pushes all/most fail states before the 
'magic barrier.' [1]

[1] 
https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/gpu/drm/drm_atomic_helper.c#L2278


>
>>> +       }
>>> +
>>> +       switch (drm_format) {
>>> +       case DRM_FORMAT_RGBX4444:
>>> +       case DRM_FORMAT_RGBA4444:
>>> +       case DRM_FORMAT_RGBX5551:
>>> +       case DRM_FORMAT_RGBA5551:
>>> +       case DRM_FORMAT_RGBX8888:
>>> +       case DRM_FORMAT_RGBA8888:
>>> +       case DRM_FORMAT_RGBA1010102:
>>> +               vs_format->swizzle = VSDC_SWIZZLE_RGBA;
>>> +               break;
>>> +       case DRM_FORMAT_XBGR4444:
>>> +       case DRM_FORMAT_ABGR4444:
>>> +       case DRM_FORMAT_XBGR1555:
>>> +       case DRM_FORMAT_ABGR1555:
>>> +       case DRM_FORMAT_BGR565:
>>> +       case DRM_FORMAT_XBGR8888:
>>> +       case DRM_FORMAT_ABGR8888:
>>> +       case DRM_FORMAT_ABGR2101010:
>>> +               vs_format->swizzle = VSDC_SWIZZLE_ABGR;
>>> +               break;
>>> +       case DRM_FORMAT_BGRX4444:
>>> +       case DRM_FORMAT_BGRA4444:
>>> +       case DRM_FORMAT_BGRX5551:
>>> +       case DRM_FORMAT_BGRA5551:
>>> +       case DRM_FORMAT_BGRX8888:
>>> +       case DRM_FORMAT_BGRA8888:
>>> +       case DRM_FORMAT_BGRA1010102:
>>> +               vs_format->swizzle = VSDC_SWIZZLE_BGRA;
>>> +               break;
>>> +       default:
>>> +               /* N/A for YUV formats */
>>> +               vs_format->swizzle = VSDC_SWIZZLE_ARGB;
>>> +       }
>>> +
>>> +       /* N/A for non-YUV formats */
>>> +       vs_format->uv_swizzle = false;
>>> +}

These values could also go into vs_plane_state.

Best regard
Thomas


-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


