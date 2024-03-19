Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E06DA87FCC9
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 12:28:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB59810F9E6;
	Tue, 19 Mar 2024 11:28:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="bCLAKJpM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lOwe/gK2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bCLAKJpM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lOwe/gK2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82D710F9E6
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 11:28:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 717583776E;
 Tue, 19 Mar 2024 11:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710847679; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=4ULdahRvtUhHT6T7soJTKDk3zgylPPWBPSDc75Sy3pI=;
 b=bCLAKJpMG9PacQITNA0fhrLDa3e43+8NlREdSL8zBmPXtHIuxPZuLTJK0cuc/FKAtZAhzr
 Arz3yOIcViJ4Pi9B553JXPhkZ0M56CQ53N/kQqOnHWRsnZpZx8pteuboAQJVZ2Mr5TXRvi
 G4sKgPPwQDXnwRNeT4c7fePEd+zcjvI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710847679;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=4ULdahRvtUhHT6T7soJTKDk3zgylPPWBPSDc75Sy3pI=;
 b=lOwe/gK2tBCGd/yfKLcNfaAo19b8YI6pHybm/v1n12r2Tg+L11Z2ITyVYDdHR2iUYbE0HR
 du9g3ksGOZ/gQ3DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710847679; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=4ULdahRvtUhHT6T7soJTKDk3zgylPPWBPSDc75Sy3pI=;
 b=bCLAKJpMG9PacQITNA0fhrLDa3e43+8NlREdSL8zBmPXtHIuxPZuLTJK0cuc/FKAtZAhzr
 Arz3yOIcViJ4Pi9B553JXPhkZ0M56CQ53N/kQqOnHWRsnZpZx8pteuboAQJVZ2Mr5TXRvi
 G4sKgPPwQDXnwRNeT4c7fePEd+zcjvI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710847679;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=4ULdahRvtUhHT6T7soJTKDk3zgylPPWBPSDc75Sy3pI=;
 b=lOwe/gK2tBCGd/yfKLcNfaAo19b8YI6pHybm/v1n12r2Tg+L11Z2ITyVYDdHR2iUYbE0HR
 du9g3ksGOZ/gQ3DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2E8DE136A5;
 Tue, 19 Mar 2024 11:27:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id F1kJCr92+WWfPAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 19 Mar 2024 11:27:59 +0000
Message-ID: <067a4e99-e902-4b14-a337-1a708807ac00@suse.de>
Date: Tue, 19 Mar 2024 12:27:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/12] drm/ast: Implement polling for VGA and SIL164
 connectors
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: airlied@redhat.com, jfalempe@redhat.com,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
References: <20240319081430.10165-1-tzimmermann@suse.de>
 <20240319081430.10165-13-tzimmermann@suse.de>
 <20240319-pragmatic-wonderful-ferret-63e7ad@houat>
 <5198707e-d2b8-49b9-a59f-4df866b5ca2b@suse.de> <87le6eo7p2.fsf@intel.com>
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
In-Reply-To: <87le6eo7p2.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.50
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.50 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 XM_UA_NO_VERSION(0.01)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000]; BAYES_HAM(-3.00)[100.00%];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_SEVEN(0.00)[8];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 FREEMAIL_CC(0.00)[redhat.com,linux.intel.com,gmail.com,ffwll.ch,lists.freedesktop.org];
 RCVD_TLS_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bCLAKJpM;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="lOwe/gK2"
X-Rspamd-Queue-Id: 717583776E
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

Am 19.03.24 um 11:08 schrieb Jani Nikula:
> On Tue, 19 Mar 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Hi
>>
>> Am 19.03.24 um 10:37 schrieb Maxime Ripard:
>>> Hi,
>>>
>>> On Tue, Mar 19, 2024 at 09:00:32AM +0100, Thomas Zimmermann wrote:
>>>> Implement polling for VGA and SIL164 connectors. Set the flag
>>>> DRM_CONNECTOR_POLL_DISCONNECT for each to detect the removal of the
>>>> monitor cable. Implement struct drm_connector_helper_funcs.detect_ctx
>>>> for each type of connector by testing for EDID data. The code for
>>>> both types of connectors is identical for now. Maybe this can later
>>>> become a common helper function for various drivers.
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> ---
>>>>    drivers/gpu/drm/ast/ast_mode.c | 36 ++++++++++++++++++++++++++++++++--
>>>>    1 file changed, 34 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
>>>> index 71cc681d6188f..f740b8706a38b 100644
>>>> --- a/drivers/gpu/drm/ast/ast_mode.c
>>>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>>>> @@ -1344,8 +1344,24 @@ static int ast_crtc_init(struct drm_device *dev)
>>>>     * VGA Connector
>>>>     */
>>>>    
>>>> +static int ast_vga_connector_helper_detect_ctx(struct drm_connector *connector,
>>>> +					       struct drm_modeset_acquire_ctx *ctx,
>>>> +					       bool force)
>>>> +{
>>>> +	enum drm_connector_status status = connector_status_disconnected;
>>>> +	const struct drm_edid *edid;
>>>> +
>>>> +	edid = drm_edid_read(connector);
>>>> +	if (edid)
>>>> +		status = connector_status_connected;
>>>> +	drm_edid_free(edid);
>>>> +
>>>> +	return status;
>>>> +}
>>>> +
>>> Yeah, I think it would be worth turning it into a helper. We have a
>>> number of drivers using some variation of that already
>>> (display-connector, loongson).
>>>
>>> It's probably better to use drm_probe_ddc here too instead of parsing
>>> and updating the EDID property each time we call detect.
>> I see. I'll update the patch accordingly. drm_probe_ddc() doesn't update
>> the property, which is probably better anyway.
> The struct drm_edid based drm_edid_read() and friends do *not* parse the
> EDID (apart from what's necessary to read the EDID) nor update the EDID
> property. You need to call drm_edid_connector_update() separately for
> that. This is by design.

Right. I'm confusing things. Sorry.

Best regards
Thomas

>
> The struct edid based drm_get_edid() does parse and update the property,
> and I think adding that was a mistake that a lot of drivers later
> depended on, and couldn't be removed.
>
> As a design consideration, IMO it's also a fine approach to read and
> cache the EDID and update the property at ->detect, and then use
> drm_edid_connector_add_modes() in ->get_modes to avoid re-reading the
> EDID at that time. It's not uncommon to need stuff from the EDID between
> those hooks.
>
>
> BR,
> Jani.
>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

