Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 298DEB529CF
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 09:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D7910E2FF;
	Thu, 11 Sep 2025 07:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="OzhOAEGq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7zz/qQ0s";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OzhOAEGq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7zz/qQ0s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3800310E2FF
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 07:25:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B3E116849E;
 Thu, 11 Sep 2025 07:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1757575546; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1RYe+1k9qe0y6IG1y9ojcpahcyxpvt011sPkPTk45C0=;
 b=OzhOAEGqaI0rmusX81zlUHPfHkKn1RqZSYma+4MZsIhUelSJ/cIg9iTv0y/hHbtSJaicV9
 LIPl0eFcpjVvsRkMxoYBh0vFlPonfn0QVhcvbjUBZixkm3DoLE+zxtKas9f57bmn49GpaP
 sIORHUixEZeWPvHerQR7oS8mvUy4PNM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1757575546;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1RYe+1k9qe0y6IG1y9ojcpahcyxpvt011sPkPTk45C0=;
 b=7zz/qQ0sOTTyNWc8G8un3zN+VpcPA8dAlSARg0A9CyKxJWYs69ii5s1ByMbTSk4GbKoFet
 3OXN3yg0AVWArxCA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OzhOAEGq;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="7zz/qQ0s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1757575546; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1RYe+1k9qe0y6IG1y9ojcpahcyxpvt011sPkPTk45C0=;
 b=OzhOAEGqaI0rmusX81zlUHPfHkKn1RqZSYma+4MZsIhUelSJ/cIg9iTv0y/hHbtSJaicV9
 LIPl0eFcpjVvsRkMxoYBh0vFlPonfn0QVhcvbjUBZixkm3DoLE+zxtKas9f57bmn49GpaP
 sIORHUixEZeWPvHerQR7oS8mvUy4PNM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1757575546;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1RYe+1k9qe0y6IG1y9ojcpahcyxpvt011sPkPTk45C0=;
 b=7zz/qQ0sOTTyNWc8G8un3zN+VpcPA8dAlSARg0A9CyKxJWYs69ii5s1ByMbTSk4GbKoFet
 3OXN3yg0AVWArxCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 64F3C13301;
 Thu, 11 Sep 2025 07:25:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id TMkKF3p5wmhOWwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 11 Sep 2025 07:25:46 +0000
Message-ID: <d518790b-a224-443a-bbd2-1dfb41f8b0bd@suse.de>
Date: Thu, 11 Sep 2025 09:25:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] [DRIVER] gpu: drm: add support for Yhgc ZX1000 soc
 chipset
To: Chu Guangqing <chuguangqing@inspur.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.cc
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <abac3eb7-e7a0-4ab8-b12c-c0df8cc77632@suse.de>
 <20250910022311.2655-1-chuguangqing@inspur.com>
 <20250910022311.2655-2-chuguangqing@inspur.com>
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
In-Reply-To: <20250910022311.2655-2-chuguangqing@inspur.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: B3E116849E
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[inspur.com,linux.intel.com,kernel.org,gmail.com,ffwll.cc];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_SEVEN(0.00)[7]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, suse.de:dkim, suse.de:mid]
X-Spam-Score: -4.51
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

Am 10.09.25 um 04:23 schrieb Chu Guangqing:
> +    select DRM_VRAM_HELPER
> +    select DRM_TTM_HELPER

I told you twice that VRAM helpers are obsolete and what to use instead.

> +
> +struct yhgch_vdac {
> +	struct drm_connector base;
> +	struct i2c_adapter adapter;
> +	struct i2c_algo_bit_data bit_data;
> +};

I've asked you several times whether to adopt the coding style in 
ast/mgag200 for the DDC.

No only that you not respond to to any of my reviews, you keep on 
submitting the same code again and again. Linux kernel development does 
not work like that.

NAK on this driver until you get your act together.

Best regards
Thomas




> +
> +struct yhgch_drm_private {
> +	/* hw */
> +	void __iomem *mmio;
> +
> +	/* drm */
> +	struct drm_device dev;
> +	struct drm_plane primary_plane;
> +	struct drm_crtc crtc;
> +	struct drm_encoder encoder;
> +	struct yhgch_vdac vdac;
> +};
> +
> +static inline struct yhgch_vdac *to_yhgch_vdac(struct drm_connector *connector)
> +{
> +	return container_of(connector, struct yhgch_vdac, base);
> +}
> +
> +static inline struct yhgch_drm_private *to_yhgch_drm_private(struct drm_device *dev)
> +{
> +	return container_of(dev, struct yhgch_drm_private, dev);
> +}
> +
> +void yhgch_set_power_mode(struct yhgch_drm_private *priv,
> +			  u32 power_mode);
> +void yhgch_set_current_gate(struct yhgch_drm_private *priv,
> +			    u32 gate);
> +
> +int yhgch_de_init(struct yhgch_drm_private *priv);
> +int yhgch_vdac_init(struct yhgch_drm_private *priv);
> +int yhgch_mm_init(struct yhgch_drm_private *yhgch);
> +int yhgch_ddc_create(struct drm_device *drm_dev, struct yhgch_vdac *connector);
> +
> +int yhgch_dumb_create(struct drm_file *file, struct drm_device *dev,
> +		      struct drm_mode_create_dumb *args);
> +
> +#endif
> diff --git a/drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_i2c.c b/drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_i2c.c
> new file mode 100644
> index 000000000000..57f40efc60c1
> --- /dev/null
> +++ b/drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_i2c.c
> @@ -0,0 +1,108 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include <linux/delay.h>
> +#include <linux/pci.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include <drm/drm_managed.h>
> +
> +#include "yhgch_drm_drv.h"
> +
> +#define GPIO_DATA		0x0802A0
> +#define GPIO_DATA_DIRECTION	0x0802A4
> +
> +#define I2C_SCL_MASK		BIT(0)
> +#define I2C_SDA_MASK		BIT(1)
> +
> +static void yhgch_set_i2c_signal(void *data, u32 mask, int value)
> +{
> +	struct yhgch_vdac *yhgch_vdac = data;
> +	struct yhgch_drm_private *priv = to_yhgch_drm_private(yhgch_vdac->base.dev);
> +	u32 tmp_dir = readl(priv->mmio + GPIO_DATA_DIRECTION);
> +
> +	if (value) {
> +		tmp_dir &= ~mask;
> +		writel(tmp_dir, priv->mmio + GPIO_DATA_DIRECTION);
> +	} else {
> +		u32 tmp_data = readl(priv->mmio + GPIO_DATA);
> +
> +		tmp_data &= ~mask;
> +		writel(tmp_data, priv->mmio + GPIO_DATA);
> +
> +		tmp_dir |= mask;
> +		writel(tmp_dir, priv->mmio + GPIO_DATA_DIRECTION);
> +	}
> +}
> +
> +static int yhgch_get_i2c_signal(void *data, u32 mask)
> +{
> +	struct yhgch_vdac *yhgch_vdac = data;
> +	struct yhgch_drm_private *priv = to_yhgch_drm_private(yhgch_vdac->base.dev);
> +	u32 tmp_dir = readl(priv->mmio + GPIO_DATA_DIRECTION);
> +
> +	if ((tmp_dir & mask) != mask) {
> +		tmp_dir &= ~mask;
> +		writel(tmp_dir, priv->mmio + GPIO_DATA_DIRECTION);
> +	}
> +
> +	return (readl(priv->mmio + GPIO_DATA) & mask) ? 1 : 0;
> +}
> +
> +static void yhgch_ddc_setsda(void *data, int state)
> +{
> +	yhgch_set_i2c_signal(data, I2C_SDA_MASK, state);
> +}
> +
> +static void yhgch_ddc_setscl(void *data, int state)
> +{
> +	yhgch_set_i2c_signal(data, I2C_SCL_MASK, state);
> +}
> +
> +static int yhgch_ddc_getsda(void *data)
> +{
> +	return yhgch_get_i2c_signal(data, I2C_SDA_MASK);
> +}
> +
> +static int yhgch_ddc_getscl(void *data)
> +{
> +	return yhgch_get_i2c_signal(data, I2C_SCL_MASK);
> +}
> +
> +static void yhgch_ddc_release(struct drm_device *dev, void *res)
> +{
> +	struct yhgch_vdac *yhgch_vdac = res;
> +
> +	i2c_del_adapter(&yhgch_vdac->adapter);
> +}
> +
> +int yhgch_ddc_create(struct drm_device *drm_dev,
> +		     struct yhgch_vdac *yhgch_vdac)
> +{
> +	int ret = 0;
> +
> +	yhgch_vdac->adapter.owner = THIS_MODULE;
> +	snprintf(yhgch_vdac->adapter.name, I2C_NAME_SIZE, "INS i2c bit bus");
> +	yhgch_vdac->adapter.dev.parent = drm_dev->dev;
> +	i2c_set_adapdata(&yhgch_vdac->adapter, yhgch_vdac);
> +	yhgch_vdac->adapter.algo_data = &yhgch_vdac->bit_data;
> +
> +	yhgch_vdac->bit_data.udelay = 20;
> +	yhgch_vdac->bit_data.timeout = usecs_to_jiffies(2000);
> +	yhgch_vdac->bit_data.data = yhgch_vdac;
> +	yhgch_vdac->bit_data.setsda = yhgch_ddc_setsda;
> +	yhgch_vdac->bit_data.setscl = yhgch_ddc_setscl;
> +	yhgch_vdac->bit_data.getsda = yhgch_ddc_getsda;
> +	yhgch_vdac->bit_data.getscl = yhgch_ddc_getscl;
> +
> +	ret = i2c_bit_add_bus(&yhgch_vdac->adapter);
> +	if (ret)
> +		return ret;
> +
> +	ret = drmm_add_action_or_reset(drm_dev, yhgch_ddc_release, yhgch_vdac);
> +	if (ret)
> +		return ret;
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_regs.h b/drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_regs.h
> new file mode 100644
> index 000000000000..d707f5186ab4
> --- /dev/null
> +++ b/drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_regs.h
> @@ -0,0 +1,209 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef YHGCH_DRM_HW_H
> +#define YHGCH_DRM_HW_H
> +
> +/* register definition */
> +#define YHGCH_MISC_CTRL				0x4
> +
> +#define YHGCH_MSCCTL_LOCALMEM_RESET(x)		((x) << 6)
> +#define YHGCH_MSCCTL_LOCALMEM_RESET_MASK	0x40
> +
> +#define YHGCH_CURRENT_GATE			0x000040
> +#define YHGCH_CURR_GATE_DISPLAY(x)		((x) << 2)
> +#define YHGCH_CURR_GATE_DISPLAY_MASK		0x4
> +
> +#define YHGCH_CURR_GATE_LOCALMEM(x)		((x) << 1)
> +#define YHGCH_CURR_GATE_LOCALMEM_MASK		0x2
> +
> +#define YHGCH_MODE0_GATE			0x000044
> +#define YHGCH_MODE1_GATE			0x000048
> +#define YHGCH_POWER_MODE_CTRL			0x00004C
> +
> +#define YHGCH_PW_MODE_CTL_OSC_INPUT(x)		((x) << 3)
> +#define YHGCH_PW_MODE_CTL_OSC_INPUT_MASK	0x8
> +
> +#define YHGCH_PW_MODE_CTL_MODE(x)		((x) << 0)
> +#define YHGCH_PW_MODE_CTL_MODE_MASK		0x03
> +#define YHGCH_PW_MODE_CTL_MODE_SHIFT		0
> +
> +#define YHGCH_PW_MODE_CTL_MODE_MODE0		0
> +#define YHGCH_PW_MODE_CTL_MODE_MODE1		1
> +#define YHGCH_PW_MODE_CTL_MODE_SLEEP		2
> +
> +//#define YHGCH_CRT_PLL_CTRL                   0x000060
> +
> +#define YHGCH_PLL_CTRL_BYPASS(x)		((x) << 18)
> +#define YHGCH_PLL_CTRL_BYPASS_MASK		0x40000
> +
> +#define YHGCH_PLL_CTRL_POWER(x)			((x) << 17)
> +#define YHGCH_PLL_CTRL_POWER_MASK		0x20000
> +
> +#define YHGCH_PLL_CTRL_INPUT(x)			((x) << 16)
> +#define YHGCH_PLL_CTRL_INPUT_MASK		0x10000
> +
> +#define YHGCH_PLL_CTRL_POD(x)			((x) << 14)
> +#define YHGCH_PLL_CTRL_POD_MASK			0xC000
> +
> +#define YHGCH_PLL_CTRL_OD(x)			((x) << 12)
> +#define YHGCH_PLL_CTRL_OD_MASK			0x3000
> +
> +#define YHGCH_PLL_CTRL_N(x)			((x) << 8)
> +#define YHGCH_PLL_CTRL_N_MASK			0xF00
> +
> +#define YHGCH_PLL_CTRL_M(x)			((x) << 0)
> +#define YHGCH_PLL_CTRL_M_MASK			0xFF
> +
> +#define YHGCH_CRT_DISP_CTL			0x80200
> +
> +#define YHGCH_CRT_DISP_CTL_DPMS(x)		((x) << 30)
> +#define YHGCH_CRT_DISP_CTL_DPMS_MASK		0xc0000000
> +
> +#define YHGCH_CRT_DPMS_ON			0
> +#define YHGCH_CRT_DPMS_OFF			3
> +
> +#define YHGCH_CRT_DISP_CTL_CRTSELECT(x)		((x) << 25)
> +#define YHGCH_CRT_DISP_CTL_CRTSELECT_MASK	0x2000000
> +
> +#define YHGCH_CRTSELECT_CRT			1
> +
> +#define YHGCH_CRT_DISP_CTL_CLOCK_PHASE(x)	((x) << 14)
> +#define YHGCH_CRT_DISP_CTL_CLOCK_PHASE_MASK	0x4000
> +
> +#define YHGCH_CRT_DISP_CTL_VSYNC_PHASE(x)	((x) << 13)
> +#define YHGCH_CRT_DISP_CTL_VSYNC_PHASE_MASK	0x2000
> +
> +#define YHGCH_CRT_DISP_CTL_HSYNC_PHASE(x)	((x) << 12)
> +#define YHGCH_CRT_DISP_CTL_HSYNC_PHASE_MASK	0x1000
> +
> +#define YHGCH_CRT_DISP_CTL_TIMING(x)		((x) << 8)
> +#define YHGCH_CRT_DISP_CTL_TIMING_MASK		0x100
> +
> +#define YHGCH_CRT_DISP_CTL_PLANE(x)		((x) << 2)
> +#define YHGCH_CRT_DISP_CTL_PLANE_MASK		4
> +
> +#define YHGCH_CRT_DISP_CTL_FORMAT(x)		((x) << 0)
> +#define YHGCH_CRT_DISP_CTL_FORMAT_MASK		0x03
> +
> +#define YHGCH_CRT_FB_ADDRESS			0x080204
> +
> +#define YHGCH_CRT_FB_WIDTH			0x080208
> +#define YHGCH_CRT_FB_WIDTH_WIDTH(x)		((x) << 16)
> +#define YHGCH_CRT_FB_WIDTH_WIDTH_MASK		0x3FFF0000
> +#define YHGCH_CRT_FB_WIDTH_OFFS(x)		((x) << 0)
> +#define YHGCH_CRT_FB_WIDTH_OFFS_MASK		0x3FFF
> +
> +#define YHGCH_CRT_HORZ_TOTAL			0x08020C
> +#define YHGCH_CRT_HORZ_TOTAL_TOTAL(x)		((x) << 16)
> +#define YHGCH_CRT_HORZ_TOTAL_TOTAL_MASK		0xFFF0000
> +
> +#define YHGCH_CRT_HORZ_TOTAL_DISP_END(x)	((x) << 0)
> +#define YHGCH_CRT_HORZ_TOTAL_DISP_END_MASK	0xFFF
> +
> +#define YHGCH_CRT_HORZ_SYNC			0x080210
> +#define YHGCH_CRT_HORZ_SYNC_WIDTH(x)		((x) << 16)
> +#define YHGCH_CRT_HORZ_SYNC_WIDTH_MASK		0xFF0000
> +
> +#define YHGCH_CRT_HORZ_SYNC_START(x)		((x) << 0)
> +#define YHGCH_CRT_HORZ_SYNC_START_MASK		0xFFF
> +
> +#define YHGCH_CRT_VERT_TOTAL			0x080214
> +#define YHGCH_CRT_VERT_TOTAL_TOTAL(x)		((x) << 16)
> +#define YHGCH_CRT_VERT_TOTAL_TOTAL_MASK		0x7FFF0000
> +
> +#define YHGCH_CRT_VERT_TOTAL_DISP_END(x)	((x) << 0)
> +#define YHGCH_CRT_VERT_TOTAL_DISP_END_MASK	0x7FF
> +
> +#define YHGCH_CRT_VERT_SYNC			0x080218
> +#define YHGCH_CRT_VERT_SYNC_HEIGHT(x)		((x) << 16)
> +#define YHGCH_CRT_VERT_SYNC_HEIGHT_MASK		0x3F0000
> +
> +#define YHGCH_CRT_VERT_SYNC_START(x)		((x) << 0)
> +#define YHGCH_CRT_VERT_SYNC_START_MASK		0x7FF
> +
> +/* Hardware Cursor */
> +#define YHGCH_HWC_ADDRESS                   0x080230
> +#define YHGCH_HWC_ADDRESS_ENABLE(x)         ((x) << 31)
> +#define YHGCH_HWC_ADDRESS_ENABLE_MASK       0x80000000
> +#define YHGCH_HWC_ADDRESS_ADDRESS(x)        ((x) << 0)
> +#define YHGCH_HWC_ADDRESS_ADDRESS_MASK      0xFFFFFFF
> +
> +#define YHGCH_HWC_LOCATION                  0x080234
> +#define YHGCH_HWC_LOCATION_TOP(x)           ((x) << 27)
> +#define YHGCH_HWC_LOCATION_TOP_MASK         0x8000000
> +#define YHGCH_HWC_LOCATION_Y(x)             ((x) << 16)
> +#define YHGCH_HWC_LOCATION_Y_MASK           0x7FF0000
> +#define YHGCH_HWC_LOCATION_LEFT(x)          ((x) << 11)
> +#define YHGCH_HWC_LOCATION_LEFT_MASK        0x800
> +#define YHGCH_HWC_LOCATION_X(x)             ((x) << 0)
> +#define YHGCH_HWC_LOCATION_X_MASK           0x7FF
> +
> +#define YHGCH_HWC_COLOR_12                  0x080238
> +#define YHGCH_HWC_COLOR_12_2_RGB(x)         ((x) << 16)
> +#define YHGCH_HWC_COLOR_12_2_RGB_MASK       0xFFFF0000
> +#define YHGCH_HWC_COLOR_12_1_RGB(x)         ((x) << 0)
> +#define YHGCH_HWC_COLOR_12_1_RGB_MASK       0xFFFF
> +
> +#define YHGCH_HWC_COLOR_3                   0x08023C
> +#define YHGCH_HWC_COLOR_3_RGB(x)            ((x) << 0)
> +#define YHGCH_HWC_COLOR_3_RGB_MASK          0xFFFF
> +
> +/* Auto Centering */
> +#define YHGCH_CRT_AUTO_CENTERING_TL		0x080280
> +#define YHGCH_CRT_AUTO_CENTERING_TL_TOP(x)	((x) << 16)
> +#define YHGCH_CRT_AUTO_CENTERING_TL_TOP_MASK	0x7FF0000
> +
> +#define YHGCH_CRT_AUTO_CENTERING_TL_LEFT(x)	((x) << 0)
> +#define YHGCH_CRT_AUTO_CENTERING_TL_LEFT_MASK	0x7FF
> +
> +#define YHGCH_CRT_AUTO_CENTERING_BR		0x080284
> +#define YHGCH_CRT_AUTO_CENTERING_BR_BOTTOM(x)	((x) << 16)
> +#define YHGCH_CRT_AUTO_CENTERING_BR_BOTTOM_MASK	0x7FF0000
> +
> +#define YHGCH_CRT_AUTO_CENTERING_BR_RIGHT(x)	((x) << 0)
> +#define YHGCH_CRT_AUTO_CENTERING_BR_RIGHT_MASK	0x7FF
> +
> +/* register to control panel output */
> +#define YHGCH_DISPLAY_CONTROL_HISILE		0x80288
> +#define YHGCH_DISPLAY_CONTROL_FPVDDEN(x)	((x) << 0)
> +#define YHGCH_DISPLAY_CONTROL_PANELDATE(x)	((x) << 1)
> +#define YHGCH_DISPLAY_CONTROL_FPEN(x)		((x) << 2)
> +#define YHGCH_DISPLAY_CONTROL_VBIASEN(x)	((x) << 3)
> +
> +#define YHGCH_RAW_INTERRUPT			0x80290
> +#define YHGCH_RAW_INTERRUPT_VBLANK(x)		((x) << 2)
> +#define YHGCH_RAW_INTERRUPT_VBLANK_MASK		0x4
> +
> +#define YHGCH_RAW_INTERRUPT_EN			0x80298
> +#define YHGCH_RAW_INTERRUPT_EN_VBLANK(x)	((x) << 2)
> +#define YHGCH_RAW_INTERRUPT_EN_VBLANK_MASK	0x4
> +
> +/* register and values for PLL control */
> +#define CRT_PLL1_NS				0x802a8
> +#define CRT_PLL1_NS_OUTER_BYPASS(x)		((x) << 30)
> +#define CRT_PLL1_NS_INTER_BYPASS(x)		((x) << 29)
> +#define CRT_PLL1_NS_POWERON(x)			((x) << 24)
> +
> +#define CRT_PLL1_NS_25MHZ			0x00006691	//640x480
> +#define CRT_PLL1_NS_40MHZ			0x00004580	//800x600
> +#define CRT_PLL1_NS_65MHZ			0x00002568	//1024x768
> +#define CRT_PLL1_NS_83MHZ			0x000027bb	//1280x800
> +#define CRT_PLL1_NS_106MHZ			0x000027ef	//1440x900
> +#define CRT_PLL1_NS_108MHZ			0x000027f2	//1280x1024
> +#define CRT_PLL1_NS_146MHZ			0x00001575	//1680x1050
> +#define CRT_PLL1_NS_148MHZ			0x0000145f	//1920x1080
> +#define CRT_PLL1_NS_193MHZ			0x000018f7	//1920x1200
> +
> +#define CRT_PLL2_NS				0x802ac
> +#define CRT_PLL2_NS_25MHZ			0x0
> +#define CRT_PLL2_NS_40MHZ			0x0
> +#define CRT_PLL2_NS_65MHZ			0x0
> +#define CRT_PLL2_NS_83MHZ			0x0
> +#define CRT_PLL2_NS_106MHZ			0x0
> +#define CRT_PLL2_NS_108MHZ			0x0
> +#define CRT_PLL2_NS_146MHZ			0x0
> +#define CRT_PLL2_NS_148MHZ			0x0
> +#define CRT_PLL2_NS_193MHZ			0x0
> +
> +#define YHGCH_FIELD(field, value) (field(value) & field##_MASK)
> +#endif
> diff --git a/drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_vdac.c b/drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_vdac.c
> new file mode 100644
> index 000000000000..6aaef773b7d1
> --- /dev/null
> +++ b/drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_vdac.c
> @@ -0,0 +1,111 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/io.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_simple_kms_helper.h>
> +
> +#include "yhgch_drm_drv.h"
> +#include "yhgch_drm_regs.h"
> +
> +static int yhgch_connector_get_modes(struct drm_connector *connector)
> +{
> +	int count;
> +	void *edid;
> +	struct yhgch_vdac *yhgch_vdac = to_yhgch_vdac(connector);
> +
> +	edid = drm_get_edid(connector, &yhgch_vdac->adapter);
> +	if (edid) {
> +		drm_connector_update_edid_property(connector, edid);
> +		count = drm_add_edid_modes(connector, edid);
> +		if (count)
> +			goto out;
> +	}
> +
> +	count = drm_add_modes_noedid(connector,
> +				     connector->dev->mode_config.max_width,
> +				     connector->dev->mode_config.max_height);
> +	drm_set_preferred_mode(connector, 1024, 768);
> +
> +out:
> +	kfree(edid);
> +	return count;
> +}
> +
> +static const struct drm_connector_helper_funcs
> +	yhgch_connector_helper_funcs = {
> +	.get_modes = yhgch_connector_get_modes,
> +	.detect_ctx = drm_connector_helper_detect_from_ddc,
> +};
> +
> +static const struct drm_connector_funcs yhgch_connector_funcs = {
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.reset = drm_atomic_helper_connector_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static void yhgch_encoder_mode_set(struct drm_encoder *encoder,
> +				   struct drm_display_mode *mode,
> +				   struct drm_display_mode *adj_mode)
> +{
> +	u32 reg;
> +	struct drm_device *dev = encoder->dev;
> +	struct yhgch_drm_private *priv = to_yhgch_drm_private(dev);
> +
> +	reg = readl(priv->mmio + YHGCH_DISPLAY_CONTROL_HISILE);
> +	reg |= YHGCH_DISPLAY_CONTROL_FPVDDEN(1);
> +	reg |= YHGCH_DISPLAY_CONTROL_PANELDATE(1);
> +	reg |= YHGCH_DISPLAY_CONTROL_FPEN(1);
> +	reg |= YHGCH_DISPLAY_CONTROL_VBIASEN(1);
> +	writel(reg, priv->mmio + YHGCH_DISPLAY_CONTROL_HISILE);
> +}
> +
> +static const struct drm_encoder_helper_funcs yhgch_encoder_helper_funcs = {
> +	.mode_set = yhgch_encoder_mode_set,
> +};
> +
> +int yhgch_vdac_init(struct yhgch_drm_private *priv)
> +{
> +	struct drm_device *dev = &priv->dev;
> +	struct yhgch_vdac *yhgch_vdac = &priv->vdac;
> +	struct drm_encoder *encoder = &priv->encoder;
> +	struct drm_crtc *crtc = &priv->crtc;
> +	struct drm_connector *connector = &yhgch_vdac->base;
> +	int ret;
> +
> +	ret = yhgch_ddc_create(dev, yhgch_vdac);
> +	if (ret) {
> +		drm_err(dev, "failed to create ddc: %d\n", ret);
> +		return ret;
> +	}
> +
> +	encoder->possible_crtcs = drm_crtc_mask(crtc);
> +	ret = drmm_encoder_init(dev, encoder, NULL, DRM_MODE_ENCODER_DAC, NULL);
> +	if (ret) {
> +		drm_err(dev, "failed to init encoder: %d\n", ret);
> +		return ret;
> +	}
> +
> +	drm_encoder_helper_add(encoder, &yhgch_encoder_helper_funcs);
> +
> +	ret = drm_connector_init_with_ddc(dev,
> +					  connector,
> +					  &yhgch_connector_funcs,
> +					  DRM_MODE_CONNECTOR_VGA,
> +					  &yhgch_vdac->adapter);
> +	if (ret) {
> +		drm_err(dev, "failed to init connector: %d\n", ret);
> +		return ret;
> +	}
> +	drm_connector_helper_add(connector, &yhgch_connector_helper_funcs);
> +	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
> +
> +	drm_connector_attach_encoder(connector, encoder);
> +
> +	return 0;
> +}

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


