Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77184932452
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 12:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B727110E645;
	Tue, 16 Jul 2024 10:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="oszLevyh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="O5fuH3sZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G8eDT4nF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ak9jXOyx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80FB210E645
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 10:47:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E4FB11F80E;
 Tue, 16 Jul 2024 10:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1721126857; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MkF3r3D88xBMCmOFI9EQrjbbPZ2tkvqwmCBezDzhjY8=;
 b=oszLevyhgVYxUqt+/KmU56Te2P+Kv0lLgQqgn8/+ONEq9XUeTJYnHlGIPFJ7RGyI1FNJq2
 YVv/j+kBLzWlkEcCr6HY5m97VlTeryrLIhkGBjLSxamSd9I7FWharBiRlwRdUIHDEUwNmC
 FprJuMzg5eWcniE2kT1drTmQ/lXeeA4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1721126857;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MkF3r3D88xBMCmOFI9EQrjbbPZ2tkvqwmCBezDzhjY8=;
 b=O5fuH3sZtbuo5frEpj6ybsyZsmtYNIZbluto7Mtrfinj4Auxvk7UtMY+1axwAz5LRbWf85
 2+aCpsu8uxIcBgAw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=G8eDT4nF;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ak9jXOyx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1721126856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MkF3r3D88xBMCmOFI9EQrjbbPZ2tkvqwmCBezDzhjY8=;
 b=G8eDT4nFMrYWR/1U0FKvvmpp3SRydzXwjZ6gvS6tBSd6mLgq6uJ2R7qKEB/dUOd6OLwIrS
 EonjHDzHkpNZOQB+hSYn5WnjiSouSOteBUG/ltourRPFN1zuqJfTk0tSgCAaxMZK+nDfkS
 cR+6/eF3QITrfOBb0IJTYHuZGrCdKS0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1721126856;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MkF3r3D88xBMCmOFI9EQrjbbPZ2tkvqwmCBezDzhjY8=;
 b=ak9jXOyx7t8KUFpNCIUJ97WN6RhH+r03escDtZr8nFf44UafPeb8vM/gVhh33Vy6P4rut1
 ZpY8M0VmADH8GcAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AD257136E5;
 Tue, 16 Jul 2024 10:47:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 5Qi9KMhPlmaZNQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 16 Jul 2024 10:47:36 +0000
Message-ID: <4b9a6327-9d7b-4826-b056-ef67b813c0ff@suse.de>
Date: Tue, 16 Jul 2024 12:47:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] drm/probe-helper: Optionally report single connected
 output per CRTC
To: Maxime Ripard <mripard@kernel.org>
Cc: jfalempe@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 dri-devel@lists.freedesktop.org
References: <20240715093936.793552-1-tzimmermann@suse.de>
 <20240715093936.793552-3-tzimmermann@suse.de>
 <20240716-dexterous-pristine-leech-8ca3f2@houat>
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
In-Reply-To: <20240716-dexterous-pristine-leech-8ca3f2@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: E4FB11F80E
X-Spam-Flag: NO
X-Spam-Score: -0.50
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.50 / 50.00];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; XM_UA_NO_VERSION(0.01)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_CC(0.00)[redhat.com,ffwll.ch,gmail.com,linux.intel.com,lists.freedesktop.org];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[7]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim, suse.de:email,
 imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns]
X-Spam-Level: 
X-Spamd-Bar: /
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

Am 16.07.24 um 11:01 schrieb Maxime Ripard:
> Hi,
>
> On Mon, Jul 15, 2024 at 11:38:58AM GMT, Thomas Zimmermann wrote:
>> For CRTCs with multiple outputs (i.e., encoders plus connectors),
>> only report at most a single connected output to userspace. Make
>> this configurable via CONFIG_DRM_REPORT_SINGLE_CONNECTED_CRTC_OUTPUT.
>>
>> Having multiple connected outputs on the same CRTC complicates
>> display-mode and format selection, so most userspace does not
>> support this. This is mostly not a problem in practice, as modern
>> display hardware provides a separate CRTC for each output.
> Do they?

That was my understanding from discussions with Gnome devs. Or at least, 
it's what they officially support.

>
> At least the RaspberryPi has multiple connectors on a single CRTC, and
> for multiple CRTCs.

I think userspace wants at least one CRTC per output, but doesn't care 
about details.

>
> My understanding is that it's definitely expected, and any decent
> user-space should expect it.
>
> Did you have any bug with this?

https://gitlab.gnome.org/GNOME/mutter/-/issues/3157

There was also a lengthy discussion on IRC a few months ago IIRC.

> And if it was the case, we wouldn't support cloning at all. I couldn't
> really find how cloning works exactly, but my understanding was that
> it's the difference between drm_encoder.possible_crtcs and
> possible_clones: possible_crtcs lists the CRTCs it can be connected to,
> and possible_clones the other encoders that can run with in parallel.

I'd prefer to solve this with the possible_clones field. But it didn't 
work. Any ideas on that?

>
>> On old hardware or hardware with BMCs, a single CRTC often drives
>> multiple displays. Only reporting one of them as connected makes
>> the hardware compatible with common userspace.
>>
>> Add the field prioritized_connectors to struct drm_connector. The
>> bitmask signals which other connectors have priority. Also provide
>> the helper drm_probe_helper_prioritize_connectors() that sets
>> default priorities for a given set of connectors. Calling the
>> helper should be enough to set up the functionality for most drivers.
>>
>> With the prioritization bits in place, update connector-status
>> detection to test against prioritized conenctors. So when the probe
>> helpers detect a connector as connected, test against the prioritized
>> connectors. If any is also connected, set the connector status to
>> disconnected.
>>
>> Please note that this functionality is a workaround for limitations
>> in userspace. If your compositor supports multiple outputs per CRTC,
>> CONFIG_DRM_REPORT_SINGLE_CONNECTED_CRTC_OUTPUT should be disabled.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> The whole "is it actually needed" discussion aside, I'm not sure it's a
> good idea to use a config option for that. Chances are distros will
> either enable it or disable it depending on what they/their customers
> workload will typically look like, and it won't make the kernel or
> compositor's job any easier.
>
> Could we use a client capability for that maybe?

I like this idea.

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

