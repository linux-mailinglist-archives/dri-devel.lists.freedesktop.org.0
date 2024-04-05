Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5D889962F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 09:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 384DB1139C4;
	Fri,  5 Apr 2024 07:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="vk/D9c0p";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5SgtsXvC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vk/D9c0p";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5SgtsXvC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20951139C4
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 07:06:53 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BD27721A1A;
 Fri,  5 Apr 2024 07:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712300811; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9sRo2F8qJ2Pfdj3L11Qtu0doGYoLgJxkNtsAQiixM6w=;
 b=vk/D9c0pq4BivP408DvPVaRT+EYoklUlam2VAPiZi5g7VwQ/Bih3+KV7ROneVdWWWeBap+
 kWNg/4uSVPTpC7uPi+tBm13yPaKhlPr9JZusjNd76WLYLWw7nMQbU/jxCHtu3Ixuq/iGkR
 lGQknKhYHnEjxW7xrwT0Bmj0eAymcTo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712300811;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9sRo2F8qJ2Pfdj3L11Qtu0doGYoLgJxkNtsAQiixM6w=;
 b=5SgtsXvCiwljzHUUqGrh+Bakv+kOvgkIGzDvpf57p89glD6u6UrRUk+qcnklwHcyeSkd2E
 edtGWLXz3GSarmBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712300811; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9sRo2F8qJ2Pfdj3L11Qtu0doGYoLgJxkNtsAQiixM6w=;
 b=vk/D9c0pq4BivP408DvPVaRT+EYoklUlam2VAPiZi5g7VwQ/Bih3+KV7ROneVdWWWeBap+
 kWNg/4uSVPTpC7uPi+tBm13yPaKhlPr9JZusjNd76WLYLWw7nMQbU/jxCHtu3Ixuq/iGkR
 lGQknKhYHnEjxW7xrwT0Bmj0eAymcTo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712300811;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9sRo2F8qJ2Pfdj3L11Qtu0doGYoLgJxkNtsAQiixM6w=;
 b=5SgtsXvCiwljzHUUqGrh+Bakv+kOvgkIGzDvpf57p89glD6u6UrRUk+qcnklwHcyeSkd2E
 edtGWLXz3GSarmBQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 89B9E139F1;
 Fri,  5 Apr 2024 07:06:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id yfa5HwujD2Y9JwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Fri, 05 Apr 2024 07:06:51 +0000
Message-ID: <6218433d-7473-472d-ba30-24a91b07fc6c@suse.de>
Date: Fri, 5 Apr 2024 09:06:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] drm/edid: Test for EDID header in
 drm_edit_probe_custom()
To: Jani Nikula <jani.nikula@linux.intel.com>, javierm@redhat.com,
 airlied@redhat.com, sean@poorly.run
Cc: dri-devel@lists.freedesktop.org
References: <20240404150857.5520-1-tzimmermann@suse.de>
 <20240404150857.5520-3-tzimmermann@suse.de> <87h6ggcnzz.fsf@intel.com>
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
In-Reply-To: <87h6ggcnzz.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Score: -4.29
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
 RCPT_COUNT_FIVE(0.00)[5]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap2.dmz-prg2.suse.org:helo,
 imap2.dmz-prg2.suse.org:rdns, suse.de:email]
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

Am 05.04.24 um 08:38 schrieb Jani Nikula:
> On Thu, 04 Apr 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> EDID read functions do not validate their return data. So they might
>> return the required number of bytes of probing, but with invalid
>> data. Therefore test for the presence of an EDID header similar to
>> the code in edid_block_check().
> I don't think the point of drm_probe_ddc() ever was to validate
> anything. It reads one byte to see if there's any response. That's all
> there is to it.
>
> All EDID validation happens in the _drm_do_get_edid() when actually
> reading the EDID.
>
> I don't think I like duplicating this behaviour in both the probe and
> the EDID read. And I'm not sure why we're giving drivers the option to
> pass a parameter whether to validate or not. Just why?

Udl doesn't use DDC, but a custom USB protocol. When queried for the 
EDID, the udl adapter sends data even if there's no monitor connected. 
All bytes are zero in this case. So the driver needs to do some sort of 
EDID validation on the received bytes to ensure that there's a monitor 
present.

drm_edid.c has all code necessary to validate the header. And there's 
the edid_fixup parameter, which I think should be respected by any 
validation helper. I'd preferably not duplicate this in udl.

Can we instead implement drm_probe_ddc() separately from 
drm_edid_probe_custom()? The former would remain as it is. The latter 
would validate unconditionally.

Best regards
Thomas

>
> BR,
> Jani.
>
>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/drm_edid.c | 50 +++++++++++++++++++++++++++++---------
>>   include/drm/drm_edid.h     |  2 +-
>>   2 files changed, 39 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index a3e9333f9177a..4e12d4b83a720 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -1758,6 +1758,18 @@ static void edid_header_fix(void *edid)
>>   	memcpy(edid, edid_header, sizeof(edid_header));
>>   }
>>   
>> +static int edid_header_score(const u8 *header)
>> +{
>> +	int i, score = 0;
>> +
>> +	for (i = 0; i < sizeof(edid_header); i++) {
>> +		if (header[i] == edid_header[i])
>> +			score++;
>> +	}
>> +
>> +	return score;
>> +}
>> +
>>   /**
>>    * drm_edid_header_is_valid - sanity check the header of the base EDID block
>>    * @_edid: pointer to raw base EDID block
>> @@ -1769,14 +1781,8 @@ static void edid_header_fix(void *edid)
>>   int drm_edid_header_is_valid(const void *_edid)
>>   {
>>   	const struct edid *edid = _edid;
>> -	int i, score = 0;
>>   
>> -	for (i = 0; i < sizeof(edid_header); i++) {
>> -		if (edid->header[i] == edid_header[i])
>> -			score++;
>> -	}
>> -
>> -	return score;
>> +	return edid_header_score(edid->header);
>>   }
>>   EXPORT_SYMBOL(drm_edid_header_is_valid);
>>   
>> @@ -2612,17 +2618,37 @@ EXPORT_SYMBOL(drm_edid_free);
>>    * drm_edid_probe_custom() - probe DDC presence
>>    * @read_block: EDID block read function
>>    * @context: Private data passed to the block read function
>> + * @validate: True to validate the EDID header
>>    *
>>    * Probes for EDID data. Only reads enough data to detect the presence
>> - * of the EDID channel.
>> + * of the EDID channel. Some EDID block read functions do not fail,
>> + * but return invalid data if no EDID data is available. If @validate
>> + * has been specified, drm_edid_probe_custom() validates the retrieved
>> + * EDID header before signalling success.
>>    *
>>    * Return: True on success, false on failure.
>>    */
>> -bool drm_edid_probe_custom(read_block_fn read_block, void *context)
>> +bool drm_edid_probe_custom(read_block_fn read_block, void *context, bool validate)
>>   {
>> -	unsigned char out;
>> +	u8 header[8] = {0, 0, 0, 0, 0, 0, 0, 0};
>> +	int ret;
>> +	size_t len = 1;
>> +
>> +	if (validate)
>> +		len = sizeof(header); // read full header
>> +
>> +	ret = read_block(context, header, 0, len);
>> +	if (ret)
>> +		return false;
>> +
>> +	if (validate) {
>> +		int score = edid_header_score(header);
>> +
>> +		if (score < clamp(edid_fixup, 0, 8))
>> +			return false;
>> +	}
>>   
>> -	return (read_block(context, &out, 0, 1) == 0);
>> +	return true;
>>   }
>>   EXPORT_SYMBOL(drm_edid_probe_custom);
>>   
>> @@ -2635,7 +2661,7 @@ EXPORT_SYMBOL(drm_edid_probe_custom);
>>   bool
>>   drm_probe_ddc(struct i2c_adapter *adapter)
>>   {
>> -	return drm_edid_probe_custom(drm_do_probe_ddc_edid, adapter);
>> +	return drm_edid_probe_custom(drm_do_probe_ddc_edid, adapter, false);
>>   }
>>   EXPORT_SYMBOL(drm_probe_ddc);
>>   
>> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
>> index 4d1797ade5f1d..299278c7ee1c2 100644
>> --- a/include/drm/drm_edid.h
>> +++ b/include/drm/drm_edid.h
>> @@ -412,7 +412,7 @@ static inline void drm_edid_decode_panel_id(u32 panel_id, char vend[4], u16 *pro
>>   
>>   bool
>>   drm_edid_probe_custom(int (*read_block)(void *context, u8 *buf, unsigned int block, size_t len),
>> -		      void *context);
>> +		      void *context, bool validate);
>>   bool drm_probe_ddc(struct i2c_adapter *adapter);
>>   struct edid *drm_do_get_edid(struct drm_connector *connector,
>>   	int (*get_edid_block)(void *data, u8 *buf, unsigned int block,

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

