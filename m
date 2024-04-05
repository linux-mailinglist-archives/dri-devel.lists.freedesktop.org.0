Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0738997D0
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 10:30:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5663E113A6D;
	Fri,  5 Apr 2024 08:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="JhGqTegg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="clFVlYnh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JhGqTegg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="clFVlYnh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82BA3113A64;
 Fri,  5 Apr 2024 08:30:23 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BB2AC1F788;
 Fri,  5 Apr 2024 08:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712305809; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bjudUBiuljqG0XL8PgLb7p7vujU1UIqnzVJJllGLn0Y=;
 b=JhGqTeggqnGBqdB5klKLNxhCGkiJ6T0JUUCP7Pd6C9mnY24qRz633GvEVb3mVfTtwfEqTk
 7qoEMSjjvsy44yu/9rd8bPltSGJhqG5MbXE8IRqA1BCaLFtYEGlEwh9q8IRB+hYStEsnIf
 fX63UD3rjCZptifot+7G/0WiwHMpDEg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712305809;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bjudUBiuljqG0XL8PgLb7p7vujU1UIqnzVJJllGLn0Y=;
 b=clFVlYnhESYaDRl5SWS7vp49TFHlVM6Jb3H11xEptg1WLVS7SN00jRqr48WRYpCkFanB9f
 I9w351Atsihb/7CA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JhGqTegg;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=clFVlYnh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712305809; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bjudUBiuljqG0XL8PgLb7p7vujU1UIqnzVJJllGLn0Y=;
 b=JhGqTeggqnGBqdB5klKLNxhCGkiJ6T0JUUCP7Pd6C9mnY24qRz633GvEVb3mVfTtwfEqTk
 7qoEMSjjvsy44yu/9rd8bPltSGJhqG5MbXE8IRqA1BCaLFtYEGlEwh9q8IRB+hYStEsnIf
 fX63UD3rjCZptifot+7G/0WiwHMpDEg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712305809;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bjudUBiuljqG0XL8PgLb7p7vujU1UIqnzVJJllGLn0Y=;
 b=clFVlYnhESYaDRl5SWS7vp49TFHlVM6Jb3H11xEptg1WLVS7SN00jRqr48WRYpCkFanB9f
 I9w351Atsihb/7CA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 9AB67139E8;
 Fri,  5 Apr 2024 08:30:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id /m9RJJG2D2YTRAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Fri, 05 Apr 2024 08:30:09 +0000
Message-ID: <7bbc5437-64bf-4879-9087-1dfed9b83780@suse.de>
Date: Fri, 5 Apr 2024 10:30:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] drm/probe-helper: Switch to per-device debugs
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
References: <20240404203336.10454-1-ville.syrjala@linux.intel.com>
 <20240404203336.10454-13-ville.syrjala@linux.intel.com>
 <877chccj1u.fsf@intel.com>
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
In-Reply-To: <877chccj1u.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.50
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: BB2AC1F788
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; MX_GOOD(-0.01)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:98:from]; 
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap2.dmz-prg2.suse.org:helo,imap2.dmz-prg2.suse.org:rdns,suse.de:dkim];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
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

Am 05.04.24 um 10:25 schrieb Jani Nikula:
> On Thu, 04 Apr 2024, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
>> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>
>> Switch to per-device debugs so that we know which
>> device we're dealing with.
> Again see the first handful of patches in the series [1]. It cleans up
> the mode printing as well.

This apparently got lost. I'll take a look.

Best regards
Thomas

>
> BR,
> Jani.
>
>
> [1] https://lore.kernel.org/r/cover.1709843865.git.jani.nikula@intel.com
>
>
>> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> ---
>>   drivers/gpu/drm/drm_probe_helper.c | 35 ++++++++++++++----------------
>>   1 file changed, 16 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
>> index 968a3ee66b1e..0860f7367511 100644
>> --- a/drivers/gpu/drm/drm_probe_helper.c
>> +++ b/drivers/gpu/drm/drm_probe_helper.c
>> @@ -567,8 +567,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>>   
>>   	drm_modeset_acquire_init(&ctx, 0);
>>   
>> -	DRM_DEBUG_KMS("[CONNECTOR:%d:%s]\n", connector->base.id,
>> -			connector->name);
>> +	drm_dbg_kms(dev, "[CONNECTOR:%d:%s]\n",
>> +		    connector->base.id, connector->name);
>>   
>>   retry:
>>   	ret = drm_modeset_lock(&dev->mode_config.connection_mutex, &ctx);
>> @@ -611,11 +611,10 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>>   	 * check here, and if anything changed start the hotplug code.
>>   	 */
>>   	if (old_status != connector->status) {
>> -		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] status updated from %s to %s\n",
>> -			      connector->base.id,
>> -			      connector->name,
>> -			      drm_get_connector_status_name(old_status),
>> -			      drm_get_connector_status_name(connector->status));
>> +		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] status updated from %s to %s\n",
>> +			    connector->base.id, connector->name,
>> +			    drm_get_connector_status_name(old_status),
>> +			    drm_get_connector_status_name(connector->status));
>>   
>>   		/*
>>   		 * The hotplug event code might call into the fb
>> @@ -638,8 +637,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>>   		drm_kms_helper_poll_enable(dev);
>>   
>>   	if (connector->status == connector_status_disconnected) {
>> -		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] disconnected\n",
>> -			connector->base.id, connector->name);
>> +		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] disconnected\n",
>> +			    connector->base.id, connector->name);
>>   		drm_connector_update_edid_property(connector, NULL);
>>   		drm_mode_prune_invalid(dev, &connector->modes, false);
>>   		goto exit;
>> @@ -697,8 +696,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>>   
>>   	drm_mode_sort(&connector->modes);
>>   
>> -	DRM_DEBUG_KMS("[CONNECTOR:%d:%s] probed modes :\n", connector->base.id,
>> -			connector->name);
>> +	drm_dbg_kms(dev, "[CONNECTOR:%d:%s] probed modes :\n",
>> +		    connector->base.id, connector->name);
>>   	list_for_each_entry(mode, &connector->modes, head) {
>>   		drm_mode_set_crtcinfo(mode, CRTC_INTERLACE_HALVE_V);
>>   		drm_mode_debug_printmodeline(mode);
>> @@ -834,14 +833,12 @@ static void output_poll_execute(struct work_struct *work)
>>   			old = drm_get_connector_status_name(old_status);
>>   			new = drm_get_connector_status_name(connector->status);
>>   
>> -			DRM_DEBUG_KMS("[CONNECTOR:%d:%s] "
>> -				      "status updated from %s to %s\n",
>> -				      connector->base.id,
>> -				      connector->name,
>> -				      old, new);
>> -			DRM_DEBUG_KMS("[CONNECTOR:%d:%s] epoch counter %llu -> %llu\n",
>> -				      connector->base.id, connector->name,
>> -				      old_epoch_counter, connector->epoch_counter);
>> +			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] status updated from %s to %s\n",
>> +				    connector->base.id, connector->name,
>> +				    old, new);
>> +			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] epoch counter %llu -> %llu\n",
>> +				    connector->base.id, connector->name,
>> +				    old_epoch_counter, connector->epoch_counter);
>>   
>>   			changed = true;
>>   		}

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

