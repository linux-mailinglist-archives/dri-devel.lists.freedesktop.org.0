Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A27A8A6B6B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 14:48:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A94410EDF2;
	Tue, 16 Apr 2024 12:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="HcKlq9y3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2x480T2y";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HcKlq9y3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2x480T2y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9EC10E51D;
 Tue, 16 Apr 2024 12:47:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8CEE15C55C;
 Tue, 16 Apr 2024 12:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1713271673; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mwOpfvroSLSJUpafQsHUVGkMr6yTCk/Lo66NhVBx8II=;
 b=HcKlq9y3A7L6yAJNodcI39b3MN6z/ILCKWXNP9R02gliqLzFD0qtMOBDDTP1pTuBliwyve
 7NecV/QZbh2IsG3+8jdWsnw/Yc7p/MNuOPTdOyseGgClohoGuER+6khOYL80Vyzms+RikR
 iess1gXkezFgH02/9yzWjzrVKKpFKmE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1713271673;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mwOpfvroSLSJUpafQsHUVGkMr6yTCk/Lo66NhVBx8II=;
 b=2x480T2yaMxIhOC5lG3VPohIlK9n0pLQJc6QgS5qQlWPojfTG07DTKDmbSfFEW9UJvc9lZ
 lRWUqevFXgst6oBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1713271673; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mwOpfvroSLSJUpafQsHUVGkMr6yTCk/Lo66NhVBx8II=;
 b=HcKlq9y3A7L6yAJNodcI39b3MN6z/ILCKWXNP9R02gliqLzFD0qtMOBDDTP1pTuBliwyve
 7NecV/QZbh2IsG3+8jdWsnw/Yc7p/MNuOPTdOyseGgClohoGuER+6khOYL80Vyzms+RikR
 iess1gXkezFgH02/9yzWjzrVKKpFKmE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1713271673;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mwOpfvroSLSJUpafQsHUVGkMr6yTCk/Lo66NhVBx8II=;
 b=2x480T2yaMxIhOC5lG3VPohIlK9n0pLQJc6QgS5qQlWPojfTG07DTKDmbSfFEW9UJvc9lZ
 lRWUqevFXgst6oBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C1CA13432;
 Tue, 16 Apr 2024 12:47:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id frr0FHlzHmYfSQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 16 Apr 2024 12:47:53 +0000
Message-ID: <deb7918d-03dd-49f4-8a5d-3470ed05800e@suse.de>
Date: Tue, 16 Apr 2024 14:47:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REBASE 7/7] drm/edid: make drm_edid_are_equal() more convenient
 for its single user
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <cover.1713259151.git.jani.nikula@intel.com>
 <1011a285d30babce3aabd8218abb7ece7dcf58a2.1713259151.git.jani.nikula@intel.com>
 <a2e36f83-0e5c-4a57-bf31-37665f8ece71@suse.de> <87h6g1ze42.fsf@intel.com>
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
In-Reply-To: <87h6g1ze42.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; ARC_NA(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:email]
X-Spam-Score: -4.29
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

Am 16.04.24 um 14:27 schrieb Jani Nikula:
> On Tue, 16 Apr 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Hi
>>
>> Am 16.04.24 um 11:20 schrieb Jani Nikula:
>>> Repurpose drm_edid_are_equal() to be more helpful for its single user,
>>> and rename drm_edid_eq(). Functionally deduce the length from the blob
>>> size, not the blob data, making it more robust against any errors.
>> Could be squashed into patch 6.
> Ack.
>
> Thanks for the review. I'll hold of on resending these until there are
> some R-b's... I've send them a few times already with no comments. :(

Feel free to add

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

to the series.

Best regards
Thomas

>
> BR,
> Jani.
>
>> Best regards
>> Thomas
>>
>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>> ---
>>>    drivers/gpu/drm/drm_edid.c | 41 ++++++++++++++------------------------
>>>    1 file changed, 15 insertions(+), 26 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>>> index 463fbad85d90..513590931cc5 100644
>>> --- a/drivers/gpu/drm/drm_edid.c
>>> +++ b/drivers/gpu/drm/drm_edid.c
>>> @@ -1820,30 +1820,20 @@ static bool edid_block_is_zero(const void *edid)
>>>    	return !memchr_inv(edid, 0, EDID_LENGTH);
>>>    }
>>>    
>>> -/**
>>> - * drm_edid_are_equal - compare two edid blobs.
>>> - * @edid1: pointer to first blob
>>> - * @edid2: pointer to second blob
>>> - * This helper can be used during probing to determine if
>>> - * edid had changed.
>>> - */
>>> -static bool drm_edid_are_equal(const struct edid *edid1, const struct edid *edid2)
>>> +static bool drm_edid_eq(const struct drm_edid *drm_edid,
>>> +			const void *raw_edid, size_t raw_edid_size)
>>>    {
>>> -	int edid1_len, edid2_len;
>>> -	bool edid1_present = edid1 != NULL;
>>> -	bool edid2_present = edid2 != NULL;
>>> +	bool edid1_present = drm_edid && drm_edid->edid && drm_edid->size;
>>> +	bool edid2_present = raw_edid && raw_edid_size;
>>>    
>>>    	if (edid1_present != edid2_present)
>>>    		return false;
>>>    
>>> -	if (edid1) {
>>> -		edid1_len = edid_size(edid1);
>>> -		edid2_len = edid_size(edid2);
>>> -
>>> -		if (edid1_len != edid2_len)
>>> +	if (edid1_present) {
>>> +		if (drm_edid->size != raw_edid_size)
>>>    			return false;
>>>    
>>> -		if (memcmp(edid1, edid2, edid1_len))
>>> +		if (memcmp(drm_edid->edid, raw_edid, drm_edid->size))
>>>    			return false;
>>>    	}
>>>    
>>> @@ -6936,15 +6926,14 @@ static int _drm_edid_connector_property_update(struct drm_connector *connector,
>>>    	int ret;
>>>    
>>>    	if (connector->edid_blob_ptr) {
>>> -		const struct edid *old_edid = connector->edid_blob_ptr->data;
>>> -
>>> -		if (old_edid) {
>>> -			if (!drm_edid_are_equal(drm_edid ? drm_edid->edid : NULL, old_edid)) {
>>> -				connector->epoch_counter++;
>>> -				drm_dbg_kms(dev, "[CONNECTOR:%d:%s] EDID changed, epoch counter %llu\n",
>>> -					    connector->base.id, connector->name,
>>> -					    connector->epoch_counter);
>>> -			}
>>> +		const void *old_edid = connector->edid_blob_ptr->data;
>>> +		size_t old_edid_size = connector->edid_blob_ptr->length;
>>> +
>>> +		if (old_edid && !drm_edid_eq(drm_edid, old_edid, old_edid_size)) {
>>> +			connector->epoch_counter++;
>>> +			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] EDID changed, epoch counter %llu\n",
>>> +				    connector->base.id, connector->name,
>>> +				    connector->epoch_counter);
>>>    		}
>>>    	}
>>>    

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

