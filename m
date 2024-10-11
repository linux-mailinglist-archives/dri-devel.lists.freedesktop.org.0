Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC855999FA1
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 11:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D15A10EA9A;
	Fri, 11 Oct 2024 09:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="iwvTTr6B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xrpx3FJb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iwvTTr6B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xrpx3FJb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4116D10EA9A
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 09:02:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 886DB22006;
 Fri, 11 Oct 2024 09:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728637319; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JQNsUTPzE7cSl/H/J9IE+MAPOI8hrmnYMEg2FqRj+Bo=;
 b=iwvTTr6BI26Xgx3po/OApYtts5dmArwg+jD5ntdn68ekfA6iZPftkjEy3/W7VtuYVaB7Wk
 rC23CRGo3vCyMbFV+Urp2eyJ6U3z3HT3CoecRkI8yLm434PbvH8CKIJ+1l1YJJdhw2HN82
 RKv3fl2sEKnpz08PB8rxCfc6DuGSi2Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728637319;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JQNsUTPzE7cSl/H/J9IE+MAPOI8hrmnYMEg2FqRj+Bo=;
 b=Xrpx3FJbhXIDPhz2UvqE02jmAonul6CO1PkHvkb06T3C6dHmHAIasOoip+4QRGEyPeE5m9
 CrCmPYNKP1i6dMCw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iwvTTr6B;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Xrpx3FJb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728637319; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JQNsUTPzE7cSl/H/J9IE+MAPOI8hrmnYMEg2FqRj+Bo=;
 b=iwvTTr6BI26Xgx3po/OApYtts5dmArwg+jD5ntdn68ekfA6iZPftkjEy3/W7VtuYVaB7Wk
 rC23CRGo3vCyMbFV+Urp2eyJ6U3z3HT3CoecRkI8yLm434PbvH8CKIJ+1l1YJJdhw2HN82
 RKv3fl2sEKnpz08PB8rxCfc6DuGSi2Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728637319;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JQNsUTPzE7cSl/H/J9IE+MAPOI8hrmnYMEg2FqRj+Bo=;
 b=Xrpx3FJbhXIDPhz2UvqE02jmAonul6CO1PkHvkb06T3C6dHmHAIasOoip+4QRGEyPeE5m9
 CrCmPYNKP1i6dMCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 43170136E0;
 Fri, 11 Oct 2024 09:01:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CnsfD4fpCGeMJgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 11 Oct 2024 09:01:59 +0000
Message-ID: <83db9483-73a9-4580-b7f2-f4a5ff6c4b17@suse.de>
Date: Fri, 11 Oct 2024 11:01:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] drm: Add physical status to connector
To: Jani Nikula <jani.nikula@linux.intel.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, airlied@redhat.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20241011065705.6728-1-tzimmermann@suse.de>
 <20241011065705.6728-3-tzimmermann@suse.de> <874j5j6mzc.fsf@intel.com>
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
In-Reply-To: <874j5j6mzc.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 886DB22006
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,redhat.com];
 ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 MID_RHS_MATCH_FROM(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[8]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[wikipedia.org:url, suse.de:dkim, suse.de:mid,
 suse.de:email, imap1.dmz-prg2.suse.org:rdns, imap1.dmz-prg2.suse.org:helo]
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

Am 11.10.24 um 10:51 schrieb Jani Nikula:
> On Fri, 11 Oct 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Track the connector's physical status in addition to its logical
>> status. The latter is directly derived from the former and for most
>> connectors both values are in sync.
>>
>> Server chips with BMC, such as Aspeed, Matrox and HiSilicon, often
>> provide virtual outputs for remote management. Without a connected
>> display, fbcon or userspace compositors disabek the output and stop
>> displaying to the BMC.
> Please don't assume people know what "BMC" means.

Apologies. I'll include that information in any follow-up and the kernel 
docs.

FTR it's the baseboard management controller.

  https://en.wikipedia.org/wiki/Intelligent_Platform_Management_Interface#Baseboard_management_controller

Best regards
Thomas

>
>> Connectors have therefore to remain in connected status, even if the
>> display has been physically disconnected. Tracking both physical and
>> logical state in separate fields will enable that. The physical status
>> is transparent to drivers and clients, but changes update the epoch
>> counter. This generates a hotplug events for clients. Clients will then
>> pick up changes to resolutions supported, if any.
>>
>> The ast driver already contains code to track the physical status. This
>> commit generalizes the logic for use with other drivers. Candidates are
>> mgag200 and hibmc.
>>
>> This commit adds the physical status and makes the regular, logical
>> status a copy of it. A later change will add the flag for BMC support.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/drm_connector.c    |  1 +
>>   drivers/gpu/drm/drm_probe_helper.c | 13 ++++++++-----
>>   include/drm/drm_connector.h        |  7 +++++++
>>   3 files changed, 16 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>> index fc35f47e2849..901d73416f98 100644
>> --- a/drivers/gpu/drm/drm_connector.c
>> +++ b/drivers/gpu/drm/drm_connector.c
>> @@ -282,6 +282,7 @@ static int __drm_connector_init(struct drm_device *dev,
>>   	connector->edid_blob_ptr = NULL;
>>   	connector->epoch_counter = 0;
>>   	connector->tile_blob_ptr = NULL;
>> +	connector->physical_status = connector_status_unknown;
>>   	connector->status = connector_status_unknown;
>>   	connector->display_info.panel_orientation =
>>   		DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
>> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
>> index 62a2e5bcb315..df44be128e72 100644
>> --- a/drivers/gpu/drm/drm_probe_helper.c
>> +++ b/drivers/gpu/drm/drm_probe_helper.c
>> @@ -373,7 +373,7 @@ drm_helper_probe_detect_ctx(struct drm_connector *connector, bool force)
>>   	if (WARN_ON(ret < 0))
>>   		ret = connector_status_unknown;
>>   
>> -	if (ret != connector->status)
>> +	if (ret != connector->physical_status)
>>   		connector->epoch_counter += 1;
>>   
>>   	drm_modeset_drop_locks(&ctx);
>> @@ -409,7 +409,7 @@ drm_helper_probe_detect(struct drm_connector *connector,
>>   
>>   	ret = detect_connector_status(connector, ctx, force);
>>   
>> -	if (ret != connector->status)
>> +	if (ret != connector->physical_status)
>>   		connector->epoch_counter += 1;
>>   
>>   	return ret;
>> @@ -588,9 +588,11 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>>   	if (connector->force) {
>>   		if (connector->force == DRM_FORCE_ON ||
>>   		    connector->force == DRM_FORCE_ON_DIGITAL)
>> -			connector->status = connector_status_connected;
>> +			connector->physical_status = connector_status_connected;
>>   		else
>> -			connector->status = connector_status_disconnected;
>> +			connector->physical_status = connector_status_disconnected;
>> +		connector->status = connector->physical_status;
>> +
>>   		if (connector->funcs->force)
>>   			connector->funcs->force(connector);
>>   	} else {
>> @@ -602,7 +604,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>>   		} else if (WARN(ret < 0, "Invalid return value %i for connector detection\n", ret))
>>   			ret = connector_status_unknown;
>>   
>> -		connector->status = ret;
>> +		connector->physical_status = ret;
>> +		connector->status = connector->physical_status;
>>   	}
>>   
>>   	/*
>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>> index e3fa43291f44..37e951f04ae8 100644
>> --- a/include/drm/drm_connector.h
>> +++ b/include/drm/drm_connector.h
>> @@ -1817,6 +1817,13 @@ struct drm_connector {
>>   	 */
>>   	struct list_head modes;
>>   
>> +	/**
>> +	 * @physical_status:
>> +	 * One of the drm_connector_status enums (connected, not, or unknown).
>> +	 * Protected by &drm_mode_config.mutex.
>> +	 */
> I don't think that's anywhere near enough documentation. It's just
> copy-paste from status. The values aren't important, the difference
> between status and physical_status is.
>
> And I think we need to have both status and physical_status
> documentation explain what they mean, when they change, who can change
> them, etc. And crucially, tell folks not to mess with physical_status
> except in the narrow use case.
>
> Side note, this probably indicates a few places where drivers are
> messing with connector status in a way they shouldn't:
>
> 	git grep "connector->status = " -- drivers/gpu/drm
>
> BR,
> Jani.
>
>
>> +	enum drm_connector_status physical_status;
>> +
>>   	/**
>>   	 * @status:
>>   	 * One of the drm_connector_status enums (connected, not, or unknown).

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

