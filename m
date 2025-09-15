Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E42EB57C7B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 15:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7EE10E0E7;
	Mon, 15 Sep 2025 13:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="2Xs09tdK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q3FqPk1h";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ttON+rVc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WH++Bsk4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362E910E0E7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 13:12:13 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EC6011F45B;
 Mon, 15 Sep 2025 13:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1757941932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SrPbR9LiZCIW4M8Mmy8D1yOoCcG/VA9RhiDW2xLbky4=;
 b=2Xs09tdKwZgfvwhTp+ytlHx7LR+j9J4br2LyOD98fmS9FFM/ClRwwd2/YiA+qA+zPa+u1j
 opBkha2bMhj+k4wUeesp27oAPrmwprK6IIGPqogpUXXmQiEKBXX5rd7b+v0CYGeqFHkS3e
 5fKqDTULJtqVS+KEDuMrW9YJaItsjf4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1757941932;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SrPbR9LiZCIW4M8Mmy8D1yOoCcG/VA9RhiDW2xLbky4=;
 b=Q3FqPk1hu1VStCtF+ojpLkm8FfFwggpMB2GwubCsFkTo2BJssWx5lEylVxEH07cdM9V6Hw
 kX8QRF3yDayfz1AA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ttON+rVc;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WH++Bsk4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1757941931; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SrPbR9LiZCIW4M8Mmy8D1yOoCcG/VA9RhiDW2xLbky4=;
 b=ttON+rVc9NJTk2ENcKiI2fHOnN5k5KQVQAYbwoJR5Q2CAI/AfElq91fzlwyEnh1LwCJW5z
 8939cTKtSj7MSqITipg3UgNYxDg2vm5o3eO1Y/fV1sPLIROvdXL93SDStL2f0JVxnbX8uW
 ad5fngI8YxIw/2Z22V+YGUMj4wuljKo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1757941931;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SrPbR9LiZCIW4M8Mmy8D1yOoCcG/VA9RhiDW2xLbky4=;
 b=WH++Bsk4vUCcZm7UPZWlowyKiDbTdPay3cmig9fsAYVigAwS/e5WMviYkrWionIRauf3TL
 V7cn1/sINmVX7fCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8E48E1372E;
 Mon, 15 Sep 2025 13:12:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YlRLIasQyGhqSAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 15 Sep 2025 13:12:11 +0000
Message-ID: <9520bcb5-df81-452c-902a-0c4c61156716@suse.de>
Date: Mon, 15 Sep 2025 15:12:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/29] drm/atomic_state_helper: Fix bridge state
 initialization
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-5-14ad5315da3f@kernel.org>
 <9f17dfd9-a4d4-41e9-b988-bd8ca858e5e7@suse.de>
 <20250915-heavenly-athletic-lionfish-aa7b8b@penduick>
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
In-Reply-To: <20250915-heavenly-athletic-lionfish-aa7b8b@penduick>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: EC6011F45B
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[15]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,ffwll.ch,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,iki.fi,ti.com,lists.freedesktop.org,vger.kernel.org];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim, suse.de:mid,
 imap1.dmz-prg2.suse.org:rdns, imap1.dmz-prg2.suse.org:helo]
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

Am 15.09.25 um 13:27 schrieb Maxime Ripard:
> On Tue, Sep 02, 2025 at 03:18:17PM +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 02.09.25 um 10:32 schrieb Maxime Ripard:
>>> Bridges implement their state using a drm_private_obj and an
>>> hand-crafted reset implementation.
>>>
>>> Since drm_private_obj doesn't have a set of reset helper like the other
>>> states, __drm_atomic_helper_bridge_reset() was initializing both the
>>> drm_private_state and the drm_bridge_state structures.
>>>
>>> This initialization however was missing the drm_private_state.obj
>>> pointer to the drm_private_obj the state was allocated for, creating a
>>> NULL pointer dereference when trying to access it.
>>>
>>> Fixes: 751465913f04 ("drm/bridge: Add a drm_bridge_state object")
>>> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>>> ---
>>>    drivers/gpu/drm/drm_atomic_state_helper.c | 8 ++++++++
>>>    1 file changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
>>> index 7142e163e618ea0d7d9d828e1bd9ff2a6ec0dfeb..b962c342b16aabf4e3bea52a914e5deb1c2080ce 100644
>>> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
>>> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
>>> @@ -707,10 +707,17 @@ void drm_atomic_helper_connector_destroy_state(struct drm_connector *connector,
>>>    	__drm_atomic_helper_connector_destroy_state(state);
>>>    	kfree(state);
>>>    }
>>>    EXPORT_SYMBOL(drm_atomic_helper_connector_destroy_state);
>>> +static void __drm_atomic_helper_private_obj_reset(struct drm_private_obj *obj,
>>> +						  struct drm_private_state *state)
>>> +{
>>> +	memset(state, 0, sizeof(*state));
>> This argument is guaranteed to be zero'd, I think. No need for a memset.
>>
>>> +	state->obj = obj;
>>> +}
>>> +
>>>    /**
>>>     * __drm_atomic_helper_private_obj_duplicate_state - copy atomic private state
>>>     * @obj: CRTC object
>>>     * @state: new private object state
>>>     *
>>> @@ -796,10 +803,11 @@ EXPORT_SYMBOL(drm_atomic_helper_bridge_destroy_state);
>>>     */
>>>    void __drm_atomic_helper_bridge_reset(struct drm_bridge *bridge,
>>>    				      struct drm_bridge_state *state)
>>>    {
>>>    	memset(state, 0, sizeof(*state));
>> Another unnecessary memset?
> I guess the two can be seen as redundant, but I'd argue the one in
> __drm_atomic_helper_private_obj_reset should still be there.
>
> What guarantees that the pointer points to a zero'd structure?

We only call this helper after allocation AFAICT. And the DRM APIs 
already assume that allocation clears to zero.

Best regards
Thomas


>
> Maxime

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


