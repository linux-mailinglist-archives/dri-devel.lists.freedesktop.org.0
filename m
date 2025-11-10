Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B70B9C46D53
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 14:19:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E22410E391;
	Mon, 10 Nov 2025 13:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Gjc3UfHy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ABNX7bmN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TEcL47Rh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/DdmTomV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6295310E38F
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 13:18:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A8AD4337B9;
 Mon, 10 Nov 2025 13:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762780736; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ljfzBcqH5qpE4v1MruiYtYz4MaLfaGD2t+fulO6F7gw=;
 b=Gjc3UfHyzPz71blN2Ygx2nlvyFy1IMSHPK159oxpOZPNcArqK9j9VL5IKo9ooWm+SRX2Ao
 F/iQOoL/wzjk93KBnc3yczLiPcQzhzaU6l1DwND0bZfFTArGTNmDx41+ipjRRMmf3IDw+2
 aPXJX93VWUsJ25VPR84yP135Ey0AN3Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762780736;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ljfzBcqH5qpE4v1MruiYtYz4MaLfaGD2t+fulO6F7gw=;
 b=ABNX7bmNwgigbZGsweV0639FJWiESM1Bx5S+nU89ePPR0dyTMFTeHPXwk6TiZ19yqNT9gv
 70jo25WvfLGf6+BQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TEcL47Rh;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/DdmTomV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762780733; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ljfzBcqH5qpE4v1MruiYtYz4MaLfaGD2t+fulO6F7gw=;
 b=TEcL47RhrFDWH0+8KD20ItnaxnXIiV7ej1hpIcd+4sif+q3bEEBvhGN2X6Wb0/EeHqiMzg
 imOs76GEBd3dOg5xGmgbA0Grwfjbo2MQ5xG5OxGf8+/i5cUl3PsdjK0VIVHWZFNLQJ1b6X
 llbhHBjFDtHr2OzygQ4mZm4SkJvoH0g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762780733;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ljfzBcqH5qpE4v1MruiYtYz4MaLfaGD2t+fulO6F7gw=;
 b=/DdmTomVs4KoIzEaLXbAgVmKpShM6TqCJK5UGRMS8HajIwPfh1P67eCXTTArW9F/m/21Pe
 K1MzgWes3mMeXvDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6B0CB143F1;
 Mon, 10 Nov 2025 13:18:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gLO0GD3mEWnOSwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 10 Nov 2025 13:18:53 +0000
Message-ID: <b85b321f-9ce7-4c1e-910b-01a5265009ef@suse.de>
Date: Mon, 10 Nov 2025 14:18:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/atomic: use drm_crtc_vblank_waitqueue()
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 ville.syrjala@linux.intel.com
References: <cover.1762513240.git.jani.nikula@intel.com>
 <1097348197acea9110da8baebbbc189890d01660.1762513240.git.jani.nikula@intel.com>
 <29b1cc39-7868-4b15-bac6-7dc97869dbdb@suse.de>
 <a605efb1745f0d2c96ff986fed7bdeeb6226b7ad@intel.com>
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
In-Reply-To: <a605efb1745f0d2c96ff986fed7bdeeb6226b7ad@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: A8AD4337B9
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.996]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 RCVD_TLS_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email,suse.com:url];
 URIBL_BLOCKED(0.00)[bootlin.com:url,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,intel.com:email,suse.com:url,suse.de:dkim,suse.de:mid,suse.de:email];
 DKIM_TRACE(0.00)[suse.de:+]
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

Am 10.11.25 um 13:51 schrieb Jani Nikula:
> On Mon, 10 Nov 2025, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Hi
>>
>> Am 07.11.25 um 12:04 schrieb Jani Nikula:
>>> We have drm_crtc_vblank_waitqueue() to get the wait_queue_head_t pointer
>>> for a vblank. Use it instead of poking at dev->vblank[] directly.
>>>
>>> Due to the macro maze of wait_event_timeout() that uses the address-of
>>> operator on the argument, we have to pass it in with the indirection
>>> operator.
>>>
>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> Reviewed-by Thomas Zimmermann <tzimmermann@suse.de>
>>
>> But... drm_crtc_vblank_waitqueue() is a terrible interface IMHO, as it
>> exports internal details of the vblank implementation.
>>
>> I wonder if the existing users at [1] and [2] couldn't be replaced with
>> a common vblank helper.
>>
>> And there's drm_wait_one_vblank() [3] and the waiting that's being fixed
>> here [4]. The latter looks like [3] but with multiple CRTC waiting for
>> their next vblank. I'd say this could be a single implementation within
>> the vblank code.
> I don't disagree, but getting that done is a bit more involved than what
> I have time for right now. Need to think.
>
> In the mean time, pushed the drm_crtc_vblank_crtc() related patches in
> the series, and left the drm_crtc_vblank_waitqueue() ones to simmer.

Please also merge the rest of the series. These patches are an 
improvement to open-coding the access to the fields.

Best regards
Thomas

>
> Thanks for the reviews.
>
> BR,
> Jani.
>
>
>> [1]
>> https://elixir.bootlin.com/linux/v6.18-rc4/source/drivers/gpu/drm/i915/display/intel_display_rps.c#L73
>> [2]
>> https://elixir.bootlin.com/linux/v6.18-rc4/source/drivers/gpu/drm/i915/display/intel_vblank.c#L715
>> [3]
>> https://elixir.bootlin.com/linux/v6.18-rc4/source/drivers/gpu/drm/drm_vblank.c#L1304
>> [4]
>> https://elixir.bootlin.com/linux/v6.18-rc4/source/drivers/gpu/drm/drm_atomic_helper.c#L1837
>>
>> Best regards
>> Thomas
>>
>>> ---
>>>    drivers/gpu/drm/drm_atomic_helper.c | 4 +++-
>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
>>> index 5a473a274ff0..e641fcf8c568 100644
>>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>>> @@ -1831,10 +1831,12 @@ drm_atomic_helper_wait_for_vblanks(struct drm_device *dev,
>>>    	}
>>>    
>>>    	for_each_old_crtc_in_state(state, crtc, old_crtc_state, i) {
>>> +		wait_queue_head_t *queue = drm_crtc_vblank_waitqueue(crtc);
>>> +
>>>    		if (!(crtc_mask & drm_crtc_mask(crtc)))
>>>    			continue;
>>>    
>>> -		ret = wait_event_timeout(dev->vblank[i].queue,
>>> +		ret = wait_event_timeout(*queue,
>>>    					 state->crtcs[i].last_vblank_count !=
>>>    						drm_crtc_vblank_count(crtc),
>>>    					 msecs_to_jiffies(100));

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


