Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 053249E27D6
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 17:42:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6078F10EAAE;
	Tue,  3 Dec 2024 16:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="b2XWslvP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Tn1E8m/P";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="b2XWslvP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Tn1E8m/P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE7E10EAAE
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 16:42:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 578AC1F44F;
 Tue,  3 Dec 2024 16:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1733244160; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=w3zNaU0Gkb0MVKmPmbCn6a/wEQjG3bIruPQZdzjpczk=;
 b=b2XWslvP8nEfnZjZYdtuGgCA2ONtyuZ62XXZxus+qXvPgAjtlbL1RXehxPCJjOhR/fWOaE
 m5TdqmzNIll1yNBBT6p/I5+Xb/MAVAVzq+E0JGjDay3Eg5Ky/QzOBmPpWS0zjS3iBdce7l
 9o3DMxgCHEvZtN0lWLaj6htf+cBac14=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1733244160;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=w3zNaU0Gkb0MVKmPmbCn6a/wEQjG3bIruPQZdzjpczk=;
 b=Tn1E8m/P7E/cgftwNeboIq3l251S/fGaeYJEUGC3j2B776w1xG88VKkm03UAVonny3UG0X
 DWKqeRr2yEFk97AA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=b2XWslvP;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="Tn1E8m/P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1733244160; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=w3zNaU0Gkb0MVKmPmbCn6a/wEQjG3bIruPQZdzjpczk=;
 b=b2XWslvP8nEfnZjZYdtuGgCA2ONtyuZ62XXZxus+qXvPgAjtlbL1RXehxPCJjOhR/fWOaE
 m5TdqmzNIll1yNBBT6p/I5+Xb/MAVAVzq+E0JGjDay3Eg5Ky/QzOBmPpWS0zjS3iBdce7l
 9o3DMxgCHEvZtN0lWLaj6htf+cBac14=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1733244160;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=w3zNaU0Gkb0MVKmPmbCn6a/wEQjG3bIruPQZdzjpczk=;
 b=Tn1E8m/P7E/cgftwNeboIq3l251S/fGaeYJEUGC3j2B776w1xG88VKkm03UAVonny3UG0X
 DWKqeRr2yEFk97AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1CDD8139C2;
 Tue,  3 Dec 2024 16:42:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 5kqqBQA1T2dNYAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 03 Dec 2024 16:42:40 +0000
Message-ID: <72d3fa23-a67e-4ad3-ba8b-95bf71c4b03c@suse.de>
Date: Tue, 3 Dec 2024 17:42:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vmwgfx: Add Fake EDID
To: Zack Rusin <zack.rusin@broadcom.com>, =?UTF-8?Q?Jonas_=C3=85dahl?=
 <jadahl@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Ian Forbes <ian.forbes@broadcom.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com
References: <20241119194038.530779-1-ian.forbes@broadcom.com>
 <40815234-baa2-4990-9f30-0a0632871a0c@suse.de> <878qte2oj3.fsf@intel.com>
 <CABQX2QOWGW=Z3Ox8P5-rDktyepzxwqRTrWb5Ycr0MVtnEQH_uA@mail.gmail.com>
 <Z08qdJUuerXOV-dR@gmail.com>
 <CABQX2QOy0sD3QrmG-hxdDgwTrffz0tnPzqvs2BhORQ1w2pTgww@mail.gmail.com>
 <Z08ygwwkmNp8dnHy@gmail.com>
 <CABQX2QPah6M0jY38cTUO4D=kO9_aYDdaJ5hbX8Ah3z2zAucj9w@mail.gmail.com>
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
In-Reply-To: <CABQX2QPah6M0jY38cTUO4D=kO9_aYDdaJ5hbX8Ah3z2zAucj9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 578AC1F44F
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[broadcom.com,gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[8]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, intel.com:email, suse.de:dkim, suse.de:mid,
 suse.de:email]
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


Am 03.12.24 um 17:39 schrieb Zack Rusin:
> On Tue, Dec 3, 2024 at 11:32 AM Jonas Ådahl <jadahl@gmail.com> wrote:
>> On Tue, Dec 03, 2024 at 11:27:52AM -0500, Zack Rusin wrote:
>>> On Tue, Dec 3, 2024 at 10:57 AM Jonas Ådahl <jadahl@gmail.com> wrote:
>>>> On Wed, Nov 20, 2024 at 07:52:18AM -0500, Zack Rusin wrote:
>>>>> On Wed, Nov 20, 2024 at 5:22 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>>>>> On Wed, 20 Nov 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>>>>>> Hi
>>>>>>>
>>>>>>>
>>>>>>> Am 19.11.24 um 20:40 schrieb Ian Forbes:
>>>>>>>> Most compositors are using a change in EDID as an indicator to
>>>>>>>> refresh their connector information on hotplug regardless of whether the
>>>>>>>> connector was previously connected. Originally the hotplug_mode_update
>>>>>>>> property was supposed to provide a hint to userspace to always refresh
>>>>>>>> connector info on hotplug as virtual devices such as vmwgfx and QXL
>>>>>>>> changed the connector without disconnecting it first. This was done to
>>>>>>>> implement Autofit. Unfortunately hotplug_mode_update was not widely
>>>>>>>> adopted and compositors used other heuristics to determine whether to
>>>>>>>> refresh the connector info.
>>>>>>>>
>>>>>>>> Currently a change in EDID is the one heuristic that seems to be universal.
>>>>>>>> No compositors currently implement hotplug_mode_update correctly or at all.
>>>>>>>> By implementing a fake EDID blob we can ensure that our EDID changes on
>>>>>>>> hotplug and therefore userspace will refresh the connector info so that
>>>>>>>> Autofit will work. This is the approach that virtio takes.
>>>>>>>>
>>>>>>>> This also removes the need to add hotplug_mode_update support for all
>>>>>>>> compositors as traditionally this niche feature has fallen on
>>>>>>>> virtualized driver developers to implement.
>>>>>>> Why don't you fix the compositors instead?
>>>>>>>
>>>>>>> I feel like NAK'ing this patch. The code itself is not so much a
>>>>>>> problem, but the commit message.
>>>>>> Oh, I think the code is problematic too.
>>>>>>
>>>>>> Please avoid all struct edid based interfaces, in this case
>>>>>> drm_connector_update_edid_property(). They will be removed in the
>>>>>> future, and adding more is counter-productive. Everything should be
>>>>>> struct drm_edid based going forward.
>>>>>>
>>>>>> Of course, actually grafting the EDID needs struct edid. And that's kind
>>>>>> of annoying too. Do we really want to spread the EDID details all over
>>>>>> the place? This one combines drm_edid.h structs and magic numbers in a
>>>>>> jumble. I'm kind of hoping we'd get rid of driver usage of struct edid,
>>>>>> though that's a long road. But we've made a lot of progress towards it,
>>>>>> there aren't that many places left that directly look at the guts of
>>>>>> EDID, and most of it is centralized in drm_edid.c.
>>>>>>
>>>>>> Of course, not using the standard drm_edid_read* interfaces also lacks
>>>>>> on features such as providing the EDID via the firmware loader or
>>>>>> debugfs, which can be handy for testing and debugging, but that's a
>>>>>> minor issue.
>>>>>>
>>>>>>> Maybe it resolves problems with
>>>>>>> compositors, but it is a step backwards for the overall ecosystem. If
>>>>>>> the connector changes, your driver should increment the epoch counter.
>>>>>>> [1] That will send a hotplug event to userspace. The EDID alone does not
>>>>>>> say anything about connector status.
>>>>>> Yeah, unplugging and replugging the same display with the same EDID
>>>>>> isn't a problem for other drivers, and they don't have to do this kind
>>>>>> of stuff to trick userspace. Maybe vmwgfx should handle (or simulate)
>>>>>> hotplugs better?
>>>>> I don't think that's what Ian is trying to fix. There's two different issues:
>>>>> 1) The code using struct edid which is frowned upon.
>>>>> 2) The virtualized drivers not behaving like real GPU's and thus
>>>>> breaking userspace.
>>>>>
>>>>> vmwgfx and qxl do not provide edid at all. It's null. But every time
>>>>> someone resizes a host side window in which the para-virtualized
>>>>> driver is displaying, the preferred mode changes. Userspace kept
>>>>> checking whether the edid changes on each hotplug event to figure out
>>>>> if it got new modes and refresh if it noticed that edid changed.
>>>>> Because on qxl and vmwgfx the edid never changes (it's always null)
>>>>> Dave added hotplug_mode_update property which only qxl and vmwgfx send
>>>>> and its presence indicates that the userspace should refresh modes
>>>>> even if edid didn't change.
>>>>>
>>>>> Because that property is only used by qxl and vmwgfx everyone gets it
>>>>> wrong. The property was specifically added to fix gnome and Ian
>>>>> noticed that currently even gnome is broken:
>>>>> https://gitlab.gnome.org/GNOME/mutter/-/blob/main/src/backends/native/meta-kms-connector.c#L940
>>>>> hotplug_mode_update doesn't change, it's just a flag that indicates
>>>>> that userspace needs a  full mode rescan.
>>>> The linked line just means the property value itself not changing
>>>> doesn't result in a full compositor side monitor reconfiguration.
>>> Right, that's exactly the point I'm making :) The property isn't used
>>> correctly because the full-rescan is expected when that property is
>>> present, not if it changed.
>> Well, a full rescan did happen, and the linked code only determines if
>> anything actually did change, including currently advertised modes, that
>> will have any potential effect on the final monitor configuration.
> The point I'm making is that no one is using this property correctly.
> Mutter triggering a full-rescan as a result of other changes doesn't
> change the fact that its usage of that property is broken. I think
> you're interpreting my comment that usage of that property is broken
> (or not used at all) everywhere as "Mutter is not refreshing
> correctly" which is not the case. Mutter does resize correctly despite
> the fact that the property check is broken.

Just FTR, I still this patch is re-enforcing wrong behavior in 
compositors instead of fixing them. It's not the driver's job to work 
around compositor issues.

Best regards
Thomas

>
> z

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

