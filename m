Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B44B395F0
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 09:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D00010E1B3;
	Thu, 28 Aug 2025 07:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="HWCY5Cs0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tvHLRvH9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HWCY5Cs0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tvHLRvH9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8D110E1B3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 07:50:37 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B6B1733781;
 Thu, 28 Aug 2025 07:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756367435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Z5D6GoBD7lVN0aaWBxn658yNiz3/WqBdlchz7jbuifk=;
 b=HWCY5Cs0jOs/jJuIKVhNACU9w5Gs5TWqMHHdo+HjejzC2ugZsWwEZSEUp6NRXANs/oTFPH
 pmoLlRJDfXWuH86fsrfZJAh+rXItkRO65uJYobxAnlfvK8Mt6SxAQwQ9w+825r19uFgMwg
 kPA/0BcKiQaVYjPT6hBWOrF0blq8XYM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756367435;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Z5D6GoBD7lVN0aaWBxn658yNiz3/WqBdlchz7jbuifk=;
 b=tvHLRvH9Aqr60a2Nj5GpOV/Z51Ow2nJeOgFZNpCz88hDsPT9/q6iIs0jJ9OQfU8T1o+k7Y
 Io4yL+T8M/N/pJBA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=HWCY5Cs0;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tvHLRvH9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756367435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Z5D6GoBD7lVN0aaWBxn658yNiz3/WqBdlchz7jbuifk=;
 b=HWCY5Cs0jOs/jJuIKVhNACU9w5Gs5TWqMHHdo+HjejzC2ugZsWwEZSEUp6NRXANs/oTFPH
 pmoLlRJDfXWuH86fsrfZJAh+rXItkRO65uJYobxAnlfvK8Mt6SxAQwQ9w+825r19uFgMwg
 kPA/0BcKiQaVYjPT6hBWOrF0blq8XYM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756367435;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Z5D6GoBD7lVN0aaWBxn658yNiz3/WqBdlchz7jbuifk=;
 b=tvHLRvH9Aqr60a2Nj5GpOV/Z51Ow2nJeOgFZNpCz88hDsPT9/q6iIs0jJ9OQfU8T1o+k7Y
 Io4yL+T8M/N/pJBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3545C13326;
 Thu, 28 Aug 2025 07:50:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CxcRC0sKsGiJHgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 28 Aug 2025 07:50:35 +0000
Message-ID: <d040da3e-501f-45d8-bcbb-95fa77e94a59@suse.de>
Date: Thu, 28 Aug 2025 09:50:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/10] Add support for RK3588 DisplayPort Controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, mripard@kernel.org, naoki@radxa.com, 
 stephen@radxa.com, cristian.ciocaltea@collabora.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 yubing.zhang@rock-chips.com, krzk+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh@kernel.org, sebastian.reichel@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>
References: <20250822063959.692098-1-andyshrk@163.com>
 <bochli5u37mhc6eup7h2oz3yeignofbbj4k5nrvm2k7zf6f4ov@t2sje4gmveqa>
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
In-Reply-To: <bochli5u37mhc6eup7h2oz3yeignofbbj4k5nrvm2k7zf6f4ov@t2sje4gmveqa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[oss.qualcomm.com,163.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[20];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FREEMAIL_ENVRCPT(0.00)[163.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 TAGGED_RCPT(0.00)[dt];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:mid, suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: B6B1733781
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
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

Hi

Am 28.08.25 um 00:24 schrieb Dmitry Baryshkov:
> On Fri, Aug 22, 2025 at 02:39:44PM +0800, Andy Yan wrote:
>> From: Andy Yan <andy.yan@rock-chips.com>
>>
>>
>> There are two DW DPTX based DisplayPort Controller on rk3588 which
>> are compliant with the DisplayPort Specification Version 1.4 with
>> the following features:
>>
>> * DisplayPort 1.4a
>> * Main Link: 1/2/4 lanes
>> * Main Link Support 1.62Gbps, 2.7Gbps, 5.4Gbps and 8.1Gbps
>> * AUX channel 1Mbps
>> * Single Stream Transport(SST)
>> * Multistream Transport (MST)
>> * Type-C support (alternate mode)
>> * HDCP 2.2, HDCP 1.3
>> * Supports up to 8/10 bits per color component
>> * Supports RBG, YCbCr4:4:4, YCbCr4:2:2, YCbCr4:2:0
>> * Pixel clock up to 594MHz
>> * I2S, SPDIF audio interface
>>
>> The current version of this patch series only supports basic display outputs.
>> I conducted tests with DP0 in 1080p and 4K@60 YCbCr4:2:0 modes; the ALT/Type-C
>> mode was tested on Rock 5B, DP1 was tested on Rock 5 ITX by Stephen and Piotr.
>> HDCP and audio features remain unimplemented.
>> For RK3588, it's only support SST, while in the upcoming RK3576, it can support
>> MST output.
>>
> [skipped changelog]
>
>> Andy Yan (10):
>>    dt-bindings: display: rockchip: Add schema for RK3588 DPTX Controller
>>    drm/bridge: synopsys: Add DW DPTX Controller support library
>>    drm/rockchip: Add RK3588 DPTX output support
>>    MAINTAINERS: Add entry for DW DPTX Controller bridge
> I tried pushing patches 1-4, but got the following error:
>
> dim: ERROR: 5a68dcf5837a ("MAINTAINERS: Add entry for DW DPTX Controller bridge"): Mandatory Maintainer Acked-by missing., aborting
>
> I'm not sure how to handle MAINTAINERS changes (or whether it's fine for
> me or not), so I will probably push patches 1-3 in a few days, if nobody
> beats me (or unless somebody points out a correct process for
> MAINTAINERS changes).

That warning has been added recently to make sure that patches do not 
get in without sufficient review. It's overly pedantic, though. If 
you're confident that you have R-bs from enough relevant people, push 
the patches with 'dim -f' to ignore the warning.

Best regards
Thomas

>
>>    dt-bindings: display: simple-bridge: Add ra620 compatible
>>    drm/bridge: simple-bridge: Add support for radxa ra620
>>    arm64: dts: rockchip: Add DP0 for rk3588
>>    arm64: dts: rockchip: Add DP1 for rk3588
>>    arm64: dts: rockchip: Enable DisplayPort for rk3588s Cool Pi 4B
>>    arm64: dts: rockchip: Enable DP2HDMI for ROCK 5 ITX
>>
>>   .../display/bridge/simple-bridge.yaml         |    1 +
>>   .../display/rockchip/rockchip,dw-dp.yaml      |  150 ++
>>   MAINTAINERS                                   |    8 +
>>   arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |   30 +
>>   .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |   30 +
>>   .../boot/dts/rockchip/rk3588-rock-5-itx.dts   |   59 +
>>   .../boot/dts/rockchip/rk3588s-coolpi-4b.dts   |   37 +
>>   drivers/gpu/drm/bridge/simple-bridge.c        |    5 +
>>   drivers/gpu/drm/bridge/synopsys/Kconfig       |    7 +
>>   drivers/gpu/drm/bridge/synopsys/Makefile      |    1 +
>>   drivers/gpu/drm/bridge/synopsys/dw-dp.c       | 2095 +++++++++++++++++
>>   drivers/gpu/drm/rockchip/Kconfig              |    9 +
>>   drivers/gpu/drm/rockchip/Makefile             |    1 +
>>   drivers/gpu/drm/rockchip/dw_dp-rockchip.c     |  150 ++
>>   drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |    1 +
>>   drivers/gpu/drm/rockchip/rockchip_drm_drv.h   |    1 +
>>   include/drm/bridge/dw_dp.h                    |   20 +
>>   17 files changed, 2605 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
>>   create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-dp.c
>>   create mode 100644 drivers/gpu/drm/rockchip/dw_dp-rockchip.c
>>   create mode 100644 include/drm/bridge/dw_dp.h
>>
>> -- 
>> 2.43.0
>>
>> base-commit: 18b8261b84ad5462d7261617fbfa49d85d396fd9
>> branch: rk3588-dp-upstream-v7
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


