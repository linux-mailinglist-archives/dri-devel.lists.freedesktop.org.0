Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DA695804B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 09:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC82710E3AE;
	Tue, 20 Aug 2024 07:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="1bX46hiu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VTg6O65y";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sd4P/8N/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="c1kIz9AL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB3910E347;
 Tue, 20 Aug 2024 07:52:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C69CB1FFAC;
 Tue, 20 Aug 2024 07:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724140340; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=sHA5eS9DH9s3q+Ijn5aePCVXLPg4ADY2YkA3YkqeMfQ=;
 b=1bX46hiuk9F5eW57AHTvHGWfFNbQJXNVOsfOLhA/ZDJMmUmglEWNDSPREo+MVv8wWIKdLo
 aeBWZydd8iRElQk7uwrTzbnCBVH+JTEQ+ypEmMiX3fYdY5WUyN/aN9bw9iL69dHstIyrBZ
 7+Fx74lMWQnpbo4UsWlgG3somO9Wqmk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724140340;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=sHA5eS9DH9s3q+Ijn5aePCVXLPg4ADY2YkA3YkqeMfQ=;
 b=VTg6O65ypb3sPVOntpJqsL1O8YNfsaTdJXmQFa2dcKYIakilGAzGFdOzoE5S44XqdkyOLK
 ROaoALgynRS09rAA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="sd4P/8N/";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=c1kIz9AL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724140338; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=sHA5eS9DH9s3q+Ijn5aePCVXLPg4ADY2YkA3YkqeMfQ=;
 b=sd4P/8N/AnMU566baZILHp931z5mOxvwoVVe6x3eAcIo2HR9UsYf3Lr/wKwHi5RC882jG5
 Hp3VvBupSxdM5nXRFbpeQGK7lba164GSUwGxpy8+bX46rQYfm4dE5NZGmHd6VxpEE/YVHG
 E+W2cknix7WFgPIouQFLVKCbWf2QCvc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724140338;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=sHA5eS9DH9s3q+Ijn5aePCVXLPg4ADY2YkA3YkqeMfQ=;
 b=c1kIz9ALM5X8Jox0y1vWo0dnDMYdtjEp851RVEyl4SU0quQhI/Y5d4ZVkJ8RZlM2z/kLD3
 lLanarcPvsvZo4Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7038113770;
 Tue, 20 Aug 2024 07:52:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +hszGjJLxGYwIgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 07:52:18 +0000
Message-ID: <2f1fcff4-e39c-45c1-89ef-b6aafa12b1f7@suse.de>
Date: Tue, 20 Aug 2024 09:52:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 48/86] drm/xlnx: Run DRM default client setup
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>
References: <20240816125408.310253-1-tzimmermann@suse.de>
 <20240816125408.310253-49-tzimmermann@suse.de>
 <20240818201925.GI29465@pendragon.ideasonboard.com>
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
In-Reply-To: <20240818201925.GI29465@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C69CB1FFAC
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[12]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[ffwll.ch,gmail.com,redhat.com,lists.freedesktop.org,ideasonboard.com,amd.com];
 MID_RHS_MATCH_FROM(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:dkim, suse.de:mid,
 imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns, amd.com:email,
 ideasonboard.com:email]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
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

Am 18.08.24 um 22:19 schrieb Laurent Pinchart:
> Hi Thomas,
>
> Thank you for the patch.
>
> On Fri, Aug 16, 2024 at 02:23:14PM +0200, Thomas Zimmermann wrote:
>> Call drm_client_setup() to run the kernel's default client setup
>> for DRM. Set fbdev_probe in struct drm_driver, so that the client
>> setup can start the common fbdev client.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Cc: Michal Simek <michal.simek@amd.com>
>> ---
>>   drivers/gpu/drm/xlnx/zynqmp_kms.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> index bd1368df7870..f26b119322d5 100644
>> --- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> +++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> @@ -14,6 +14,7 @@
>>   #include <drm/drm_blend.h>
>>   #include <drm/drm_bridge.h>
>>   #include <drm/drm_bridge_connector.h>
>> +#include <drm/drm_client_setup.h>
>>   #include <drm/drm_connector.h>
>>   #include <drm/drm_crtc.h>
>>   #include <drm/drm_device.h>
>> @@ -402,6 +403,7 @@ static const struct drm_driver zynqmp_dpsub_drm_driver = {
>>   					  DRIVER_ATOMIC,
>>   
>>   	DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(zynqmp_dpsub_dumb_create),
>> +	DRM_FBDEV_DMA_DRIVER_OPS,
>>   
>>   	.fops				= &zynqmp_dpsub_drm_fops,
>>   
>> @@ -523,7 +525,7 @@ int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
>>   		goto err_poll_fini;
>>   
>>   	/* Initialize fbdev generic emulation. */
>> -	drm_fbdev_dma_setup(drm, 24);
>> +	drm_client_setup(drm, drm_format_info(DRM_FORMAT_RGB888));
> I know this would be a hassle to change, but do the majority of the
> callers of drm_client_setup() have a drm_format_info * already, or do
> they need to call drm_format_info() on a 4CC ? In the latter case, would
> it be better to pass the 4CC to drm_client_setup() ?

Good idea. Most of the drivers have a 4cc code, but no format-info 
pointer. I think there are enough instances that it makes sense to add a 
little helper, drm_client_setup_with_fourcc(), for these drivers.

There's also preferred_depth from drm_mode_config. It's already used in 
the client mode-setting code. That means that in some drivers, the 
format parameter to drm_client_setup() could likely be dropped.

Best regards
Thomas

>
> As far as this patch goes,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
>>   
>>   	return 0;
>>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

