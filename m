Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9658C27B1
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 17:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D6F10E355;
	Fri, 10 May 2024 15:27:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ihh1jj0s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RE5AbHNM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ihh1jj0s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RE5AbHNM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58FF10E355
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 15:27:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7777F673C9;
 Fri, 10 May 2024 15:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715354861; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kjcOYXw2+1163m+VOmrr2QgzJE3faEpdnx34UwPAdi0=;
 b=ihh1jj0s4xw9Egp/3ZosLXy8c4YfC+iq5wZ5MzONmHykAilmhY/LhvPWgiL9yuOs1P2tJb
 NIYRNwmEqon1JdVCOm0fxs610At7w1GgkZ9y72h9FFVNxARmOifZX52MIn516w0svAQOI8
 rZp27DuMOkVbqI6JZtU577DICUein/M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715354861;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kjcOYXw2+1163m+VOmrr2QgzJE3faEpdnx34UwPAdi0=;
 b=RE5AbHNMl4U6pQn2wCfIMCB4pteUE6KfHa7cUixkaqzNGc98iYlTkBFRS4WtSLowAiQUAZ
 uyh7JN/BZ/ACnTAw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ihh1jj0s;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=RE5AbHNM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715354861; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kjcOYXw2+1163m+VOmrr2QgzJE3faEpdnx34UwPAdi0=;
 b=ihh1jj0s4xw9Egp/3ZosLXy8c4YfC+iq5wZ5MzONmHykAilmhY/LhvPWgiL9yuOs1P2tJb
 NIYRNwmEqon1JdVCOm0fxs610At7w1GgkZ9y72h9FFVNxARmOifZX52MIn516w0svAQOI8
 rZp27DuMOkVbqI6JZtU577DICUein/M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715354861;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kjcOYXw2+1163m+VOmrr2QgzJE3faEpdnx34UwPAdi0=;
 b=RE5AbHNMl4U6pQn2wCfIMCB4pteUE6KfHa7cUixkaqzNGc98iYlTkBFRS4WtSLowAiQUAZ
 uyh7JN/BZ/ACnTAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 421D1139AA;
 Fri, 10 May 2024 15:27:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uoe4Du08PmY5LAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 10 May 2024 15:27:41 +0000
Message-ID: <2a5584c0-9bc3-490f-9f11-9a153b24b774@suse.de>
Date: Fri, 10 May 2024 17:27:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] drm/udl: Untangle .get_modes() and .detect_ctx()
To: Jani Nikula <jani.nikula@linux.intel.com>, javierm@redhat.com,
 airlied@redhat.com, sean@poorly.run
Cc: dri-devel@lists.freedesktop.org
References: <20240410120928.26487-1-tzimmermann@suse.de>
 <20240410120928.26487-5-tzimmermann@suse.de> <87ttj5hnei.fsf@intel.com>
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
In-Reply-To: <87ttj5hnei.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; MX_GOOD(-0.01)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_FIVE(0.00)[5];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 7777F673C9
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -4.50
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

Am 10.05.24 um 14:17 schrieb Jani Nikula:

>> +	/*
>> +	 * The adapter sends all-zeros if no monitor has been
>> +	 * connected. We consider anything else a connection.
>> +	 */
>> +	return memcmp(no_edid, hdr, 8) != 0;
> Nitpick, this works, but you can drop the no_edid buf by using:
>
> 	return memchr_inv(hdr, 0, sizeof(hdr));

Makes sense to me. Thanks for reviewing.

Best regards
Thomas

>
> Up to you,
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>
>
>> +}
>> +
>> +const struct drm_edid *udl_edid_read(struct drm_connector *connector)
>> +{
>> +	struct udl_device *udl = to_udl(connector->dev);
>> +
>> +	return drm_edid_read_custom(connector, udl_read_edid_block, udl);
>> +}
>> diff --git a/drivers/gpu/drm/udl/udl_edid.h b/drivers/gpu/drm/udl/udl_edid.h
>> new file mode 100644
>> index 0000000000000..fe15ff3752b7d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/udl/udl_edid.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#ifndef UDL_EDID_H
>> +#define UDL_EDID_H
>> +
>> +#include <linux/types.h>
>> +
>> +struct drm_connector;
>> +struct drm_edid;
>> +struct udl_device;
>> +
>> +bool udl_probe_edid(struct udl_device *udl);
>> +const struct drm_edid *udl_edid_read(struct drm_connector *connector);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
>> index 3df9fc38388b4..4236ce57f5945 100644
>> --- a/drivers/gpu/drm/udl/udl_modeset.c
>> +++ b/drivers/gpu/drm/udl/udl_modeset.c
>> @@ -25,6 +25,7 @@
>>   #include <drm/drm_vblank.h>
>>   
>>   #include "udl_drv.h"
>> +#include "udl_edid.h"
>>   #include "udl_proto.h"
>>   
>>   /*
>> @@ -415,97 +416,44 @@ static const struct drm_encoder_funcs udl_encoder_funcs = {
>>   
>>   static int udl_connector_helper_get_modes(struct drm_connector *connector)
>>   {
>> -	struct udl_connector *udl_connector = to_udl_connector(connector);
>> +	const struct drm_edid *drm_edid;
>> +	int count;
>>   
>> -	drm_connector_update_edid_property(connector, udl_connector->edid);
>> -	if (udl_connector->edid)
>> -		return drm_add_edid_modes(connector, udl_connector->edid);
>> +	drm_edid = udl_edid_read(connector);
>> +	drm_edid_connector_update(connector, drm_edid);
>> +	count = drm_edid_connector_add_modes(connector);
>> +	drm_edid_free(drm_edid);
>>   
>> -	return 0;
>> +	return count;
>>   }
>>   
>> -static const struct drm_connector_helper_funcs udl_connector_helper_funcs = {
>> -	.get_modes = udl_connector_helper_get_modes,
>> -};
>> -
>> -static int udl_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
>> +static int udl_connector_helper_detect_ctx(struct drm_connector *connector,
>> +					   struct drm_modeset_acquire_ctx *ctx,
>> +					   bool force)
>>   {
>> -	struct udl_device *udl = data;
>> -	struct drm_device *dev = &udl->drm;
>> -	struct usb_device *udev = udl_to_usb_device(udl);
>> -	u8 *read_buff;
>> -	int idx, ret;
>> -	size_t i;
>> -
>> -	read_buff = kmalloc(2, GFP_KERNEL);
>> -	if (!read_buff)
>> -		return -ENOMEM;
>> +	struct udl_device *udl = to_udl(connector->dev);
>>   
>> -	if (!drm_dev_enter(dev, &idx)) {
>> -		ret = -ENODEV;
>> -		goto err_kfree;
>> -	}
>> -
>> -	for (i = 0; i < len; i++) {
>> -		int bval = (i + block * EDID_LENGTH) << 8;
>> -
>> -		ret = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
>> -				      0x02, (0x80 | (0x02 << 5)), bval,
>> -				      0xA1, read_buff, 2, USB_CTRL_GET_TIMEOUT);
>> -		if (ret < 0) {
>> -			drm_err(dev, "Read EDID byte %zu failed err %x\n", i, ret);
>> -			goto err_drm_dev_exit;
>> -		} else if (ret < 1) {
>> -			ret = -EIO;
>> -			drm_err(dev, "Read EDID byte %zu failed\n", i);
>> -			goto err_drm_dev_exit;
>> -		}
>> -
>> -		buf[i] = read_buff[1];
>> -	}
>> +	if (udl_probe_edid(udl))
>> +		return connector_status_connected;
>>   
>> -	drm_dev_exit(idx);
>> -	kfree(read_buff);
>> -
>> -	return 0;
>> -
>> -err_drm_dev_exit:
>> -	drm_dev_exit(idx);
>> -err_kfree:
>> -	kfree(read_buff);
>> -	return ret;
>> +	return connector_status_disconnected;
>>   }
>>   
>> -static enum drm_connector_status udl_connector_detect(struct drm_connector *connector, bool force)
>> -{
>> -	struct drm_device *dev = connector->dev;
>> -	struct udl_device *udl = to_udl(dev);
>> -	struct udl_connector *udl_connector = to_udl_connector(connector);
>> -	enum drm_connector_status status = connector_status_disconnected;
>> -
>> -	/* cleanup previous EDID */
>> -	kfree(udl_connector->edid);
>> -	udl_connector->edid = NULL;
>> -
>> -	udl_connector->edid = drm_do_get_edid(connector, udl_get_edid_block, udl);
>> -	if (udl_connector->edid)
>> -		status = connector_status_connected;
>> -
>> -	return status;
>> -}
>> +static const struct drm_connector_helper_funcs udl_connector_helper_funcs = {
>> +	.get_modes = udl_connector_helper_get_modes,
>> +	.detect_ctx = udl_connector_helper_detect_ctx,
>> +};
>>   
>>   static void udl_connector_destroy(struct drm_connector *connector)
>>   {
>>   	struct udl_connector *udl_connector = to_udl_connector(connector);
>>   
>>   	drm_connector_cleanup(connector);
>> -	kfree(udl_connector->edid);
>>   	kfree(udl_connector);
>>   }
>>   
>>   static const struct drm_connector_funcs udl_connector_funcs = {
>>   	.reset = drm_atomic_helper_connector_reset,
>> -	.detect = udl_connector_detect,
>>   	.fill_modes = drm_helper_probe_single_connector_modes,
>>   	.destroy = udl_connector_destroy,
>>   	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

