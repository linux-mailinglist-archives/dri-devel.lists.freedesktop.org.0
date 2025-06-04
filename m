Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7952ACD96C
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 10:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B109310E735;
	Wed,  4 Jun 2025 08:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="UCXAL9p3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PqOMgl57";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UCXAL9p3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PqOMgl57";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F7210E735
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 08:16:50 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6F83C227EB;
 Wed,  4 Jun 2025 08:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749025008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Rlmdietzzncmsp97F2Op76zEvoHx9o3fYwH6UHBV0c8=;
 b=UCXAL9p3+Ob+D99AfAeBwmp+HaQAOHy2NVSCoxg/WgUEnHWEbHV1zuImclC0+owXgYAOpV
 z6zAQlRuZXwXL4JFkDj4aS6WoGNH13tzq7TpdycI8cne+5iFkBSWS6OYASzCDrYp1R+QpM
 0A9JnOTb0QD2mHlnWUNTH1seJj68BmQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749025008;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Rlmdietzzncmsp97F2Op76zEvoHx9o3fYwH6UHBV0c8=;
 b=PqOMgl57C1w+aP3Ei/4+UsffUXKfX8vD7H/eFgMa8oFDgk0W1UVExC6MxbAksTFZtUXd0D
 LzYzAVXaz4QD4OAA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UCXAL9p3;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PqOMgl57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749025008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Rlmdietzzncmsp97F2Op76zEvoHx9o3fYwH6UHBV0c8=;
 b=UCXAL9p3+Ob+D99AfAeBwmp+HaQAOHy2NVSCoxg/WgUEnHWEbHV1zuImclC0+owXgYAOpV
 z6zAQlRuZXwXL4JFkDj4aS6WoGNH13tzq7TpdycI8cne+5iFkBSWS6OYASzCDrYp1R+QpM
 0A9JnOTb0QD2mHlnWUNTH1seJj68BmQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749025008;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Rlmdietzzncmsp97F2Op76zEvoHx9o3fYwH6UHBV0c8=;
 b=PqOMgl57C1w+aP3Ei/4+UsffUXKfX8vD7H/eFgMa8oFDgk0W1UVExC6MxbAksTFZtUXd0D
 LzYzAVXaz4QD4OAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D51D613A63;
 Wed,  4 Jun 2025 08:16:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ux+zMu8AQGgCeAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 04 Jun 2025 08:16:47 +0000
Message-ID: <57b0e235-46a1-44fd-8bc3-c38f3fa91532@suse.de>
Date: Wed, 4 Jun 2025 10:16:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 0/5] drm/atomic-helper: Re-order CRTC and Bridge ops
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250406131642.171240-1-aradhya.bhatia@linux.dev>
 <19101cd7-5b4d-416d-a00e-6657b81149a6@ideasonboard.com>
 <a6416d2c-c928-4adf-8441-070e2c443db1@ideasonboard.com>
 <9c2c151d-f210-4fbc-af7c-d6aa5838cede@ideasonboard.com>
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
In-Reply-To: <9c2c151d-f210-4fbc-af7c-d6aa5838cede@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 6F83C227EB
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TO_DN_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[ti.com,siemens.com,lists.freedesktop.org,vger.kernel.org,linux.dev,oss.qualcomm.com,ideasonboard.com,intel.com,linaro.org,kernel.org,kwiboo.se,gmail.com,ffwll.ch];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_TWELVE(0.00)[22];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 TAGGED_RCPT(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,qualcomm.com:email]
X-Spam-Score: -3.01
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

Am 03.06.25 um 14:48 schrieb Tomi Valkeinen:
> Hi Maxime, Maarten, Thomas,
>
> (You're the first three names returned with get_maintainers.pl =), so:)
>
> Ping on this.

I don't really dare to R-b this, as it can backfire quite a bit. Anyway, 
I'll look over the patches.

Best regards
Thomas

>
>   Tomi
>
> On 26/05/2025 13:40, Tomi Valkeinen wrote:
>> Hi Maxime, Maarten, Thomas,
>>
>> On 16/05/2025 15:23, Tomi Valkeinen wrote:
>>> Hi all,
>>>
>>> On 06/04/2025 16:16, Aradhya Bhatia wrote:
>>>> Hello all,
>>>>
>>>> This series re-orders the sequences in which the drm CRTC and the drm
>>>> Bridge get enabled and disabled with respect to each other.
>>>>
>>>> The bridge pre_enable calls have been shifted before the crtc_enable and
>>>> the bridge post_disable calls have been shifted after the crtc_disable.
>>>>
>>>> This has been done as per the definition of bridge pre_enable.
>>>> "The display pipe (i.e. clocks and timing signals) feeding this bridge
>>>> will
>>>> not yet be running when this callback is called".
>>>>
>>>> Since CRTC is also a source feeding the bridge, it should not be enabled
>>>> before the bridges in the pipeline are pre_enabled.
>>> Any further comments to this?
>>>
>>> All the patches have been reviewed and tested. I can push this, along
>>> with the serieses that depend on this, via drm-misc, but I'll need an
>>> ack from a maintainer.
>> Would any of you have a moment to check this out and ack/apply? This
>> series is blocking further development on DSI and OLDI.
>>
>>   Tomi
>>
>>>   Tomi
>>>
>>>
>>>> The original sequence. for display pipe enable looks like:
>>>>
>>>>         crtc_enable
>>>>
>>>>         bridge[n]_pre_enable
>>>>         ...
>>>>         bridge[1]_pre_enable
>>>>
>>>>         encoder_enable
>>>>
>>>>         bridge[1]_enable
>>>>         ...
>>>>         bridge[n]_enable
>>>>
>>>> The sequence of enable after this patch-set will look like:
>>>>
>>>>         bridge[n]_pre_enable
>>>>         ...
>>>>         bridge[1]_pre_enable
>>>>
>>>>         crtc_enable
>>>>         encoder_enable
>>>>
>>>>         bridge[1]_enable
>>>>         ...
>>>>         bridge[n]_enable
>>>>
>>>>
>>>> For the disable sequence, this is what the original looks like:
>>>>
>>>>         bridge[n]_disable
>>>>         ...
>>>>         bridge[1]_disable
>>>>
>>>>         encoder_disable
>>>>
>>>>         bridge[1]_post_disable
>>>>         ...
>>>>         bridge[n]_post_disable
>>>>
>>>>         crtc_disable
>>>>      
>>>> This is what the disable sequence will be, after this series of patches:
>>>>
>>>>         bridge[n]_disable
>>>>         ...
>>>>         bridge[1]_disable
>>>>
>>>>         encoder_disable
>>>>         crtc_disable
>>>>
>>>>         bridge[1]_post_disable
>>>>         ...
>>>>         bridge[n]_post_disable
>>>>
>>>> This series further updates the bridge API definitions to accurately
>>>> reflect the updated scenario.
>>>>
>>>> This series is a subset of its v11[0] which had 14 patches in the
>>>> revision.
>>>> 9 of those 14 patches (which were specific to the cdns-dsi bridge driver)
>>>> were merged[1].
>>>>
>>>> Regards
>>>> Aradhya
>>>>
>>>> ---
>>>> * Note on checkpatch warning in patch 2/4 *
>>>> Patch 2/4 causes the checkpatch to flare up for 1 checkpatch 'check' -
>>>>
>>>> CHECK: Lines should not end with a '('
>>>> #79: FILE: drivers/gpu/drm/drm_atomic_helper.c:1304:
>>>> +                       new_crtc_state = drm_atomic_get_new_crtc_state(
>>>>
>>>> This patch is largely duplicating the original code, with minor
>>>> differences to
>>>> perform different operations. This line of code pre-exists in the file
>>>> and
>>>> have simply been duplicated. I have decided to keep it as is to
>>>> maintain the
>>>> uniformity and the originally intended readability. Should perhaps a
>>>> fix be
>>>> required, this patch/series is not the right place, and another patch
>>>> can be
>>>> created to fix this across the whole file.
>>>>
>>>> References:
>>>> [0]: Revision v11 of this series.
>>>> https://lore.kernel.org/all/20250329113925.68204-1-
>>>> aradhya.bhatia@linux.dev/
>>>>
>>>> [1]: Patches 1 through 9 getting merged.
>>>> https://lore.kernel.org/
>>>> all/174335361171.2556605.12634785416741695829.b4-ty@oss.qualcomm.com/
>>>>
>>>>
>>>> ---
>>>> Change Log:
>>>>
>>>>     - Changes in v12:
>>>>       - Drop patches 1 through 9 since they have been merged.
>>>>       - Rebase onto newer drm-misc-next.
>>>>       - Re-word the patch 3/4, ("drm/bridge: Update the bridge enable/
>>>> disable doc")
>>>>         to make it more readable.
>>>>
>>>>     - Changes in v11:
>>>>       - Add patch v11:13/14 ("drm/bridge: Update the bridge enable/
>>>> disable doc"),
>>>>         that updates the documentation about the order of the various
>>>> bridge
>>>>         enable/disable hooks being called wrt the CRTC and encoder hooks.
>>>>       - Rebase on drm-misc-next instead of linux-next.
>>>>         As part of rebase, accommodate the following change:
>>>>         - Change patch v10:08/13 ("drm/bridge: cdns-dsi: Support atomic
>>>> bridge
>>>>           APIs") to v11:08/13 ("drm/bridge: cdns-dsi: Add input format
>>>>           negotiation"), since Maxime has already updated the bridge
>>>> hooks to
>>>>           their atomic versions in commit 68c98e227a96 ("drm/bridge:
>>>> cdns-csi:
>>>>           Switch to atomic helpers").
>>>>           My new patch now only adds the format negotiation hook for
>>>> the cdns-dsi.
>>>>           (Note: Since the new patch is now only a subset of the old
>>>> one, without
>>>>           any change in logic, I decided to carry forward the R-b and
>>>> T-b tags.)
>>>>       - Add Alexander Sverdlin's T-b in patches 10, 11, 12.
>>>>
>>>>     - Changes in v10:
>>>>       - Rebase on latest linux-next (next-20250226).
>>>>       - As part of rebase, update the patches to accommodate a couple of
>>>>         widespread changes in DRM Framework -
>>>>           - All the ("drm/atomic-helper: Change parameter name of ***")
>>>> commits.
>>>>           - All the ("drm/bridge: Pass full state to ***") commits.
>>>>         (These updates are only trivial substitutions.)
>>>>       - Add Tomi Valkeinen's T-b tags in all the patches.
>>>>
>>>>     - Changes in v9:
>>>>       - Fix the oops in 11/13 - where the encoder_bridge_enable _was_
>>>> pre_enabling
>>>>         the bridges instead of enabling.
>>>>       - Add the following tags:
>>>>         - Dmitry Baryshkov's R-b in patches 2, 10, 11, and A-b in patch
>>>> 12.
>>>>         - Jayesh Choudhary's R-b in patch 12.
>>>>         - Tomi Valkeinen's R-b in patches 2, 10, 11, 12.
>>>>
>>>>     - Changes in v8:
>>>>       - Move the phy de-initialization to bridge post_disable() instead
>>>> of bridge
>>>>         disable() in patch-3.
>>>>       - Copy the private bridge state (dsi_cfg), in addition to the
>>>> bridge_state,
>>>>         in patch-9.
>>>>       - Split patch v7:11/12 into three patches, v8:{10,11,12}/13, to
>>>> separate out
>>>>         different refactorings into different patches, and improve
>>>> bisectability.
>>>>       - Move patch v7:02/12 down to v8:06/12, to keep the initial
>>>> patches for
>>>>         fixes only.
>>>>       - Drop patch v7:04/12 as it doesn't become relevant until patch
>>>> v7:12/12.
>>>>       - Add R-b tags of Dmitry Baryshkov in patch-9 and patch-3, and of
>>>>         Tomi Valkeinen in patch-9.
>>>>         - Changes in v7:
>>>>       - phy_init()/exit() were called from the PM path in v6. Change it
>>>> back to
>>>>         the bridge enable/disable path in patch-3, so that the
>>>> phy_init() can go
>>>>         back to being called after D-Phy reset assert.
>>>>       - Reword commit text in patch-5 to explain the need of the fix.
>>>>       - Drop the stray code in patch-10.
>>>>       - Add R-b tag of Dmitry Baryshkov in patch-6.
>>>>
>>>>     - Changes in v6:
>>>>       - Reword patch 3 to better explain the fixes around phy de-init.
>>>>       - Fix the Lane ready timeout condition in patch 7.
>>>>       - Fix the dsi _bridge_atomic_check() implementation by adding a new
>>>>         bridge state structure in patch 10.
>>>>       - Rework and combine patches v5:11/13 and v5:12/13 to v6:11/12.
>>>>       - Generate the patches of these series using the "patience"
>>>> algorithm.
>>>>         Note: All patches, except v6:11/12, *do not* differ from their
>>>> default
>>>>         (greedy) algorithm variants.
>>>>         For patch 11, the patience algorithm significantly improves the
>>>> readability.
>>>>       - Rename and move the Bridge enable/disable enums from public to
>>>> private
>>>>         in patch 11.
>>>>       - Add R-b tags of Tomi Valkeinen in patch 6, and Dmitry Baryshkov
>>>> in patch 2.
>>>>
>>>>     - Changes in v5:
>>>>       - Fix subject and description in patch 1/13.
>>>>       - Add patch to check the return value of
>>>>         phy_mipi_dphy_get_default_config() (patch: 6/13).
>>>>       - Change the Clk and Data Lane ready timeout from forever to 5s.
>>>>       - Print an error instead of calling WARN_ON_ONCE in patch 7/13.
>>>>       - Drop patch v4-07/11: "drm/bridge: cdns-dsi: Reset the DCS write
>>>> FIFO".
>>>>         There has been some inconsistencies found with this patch upon
>>>> further
>>>>         testing. This patch was being used to enable a DSI panel based
>>>> on ILITEK
>>>>         ILI9881C bridge. This will be debugged separately.
>>>>       - Add patch to move the DSI mode check from _atomic_enable() to
>>>>         _atomic_check() (patch: 10/13).
>>>>       - Split patch v4-10/11 into 2 patches - 11/13 and 12/13.
>>>>         Patch 11/13 separates out the Encoder-Bridge operations into a
>>>> helper
>>>>         function *without* changing the logic. Patch 12/13 then changes
>>>> the order
>>>>         of the encoder-bridge operations as was intended in the
>>>> original patch.
>>>>       - Add detailed comment for patch 13/13.
>>>>       - Add Tomi Valkeinen's R-b in patches 1, 2, 4, 5, 7, 8, 9, 13.
>>>>
>>>>     - Changes in v4:
>>>>       - Add new patch, "drm/bridge: cdns-dsi: Move to
>>>> devm_drm_of_get_bridge()",
>>>>         to update to an auto-managed way of finding next bridge in the
>>>> chain.
>>>>       - Drop patch "drm/bridge: cdns-dsi: Fix the phy_initialized
>>>> variable" and
>>>>         add "drm/bridge: cdns-dsi: Fix Phy _init() and _exit()" that
>>>> properly
>>>>         de-initializes the Phy and maintains the initialization state.
>>>>       - Reword patch "drm/bridge: cdns-dsi: Reset the DCS write FIFO"
>>>> to explain
>>>>         the HW concerns better.
>>>>       - Add R-b tag from Dmitry Baryshkov for patches 1/11 and 8/11.
>>>>
>>>>     - Changes in v3:
>>>>       - Reword the commit message for patch "drm/bridge: cdns-dsi: Fix
>>>> OF node
>>>>         pointer".
>>>>       - Add a new helper API to figure out DSI host input pixel format
>>>>         in patch "drm/mipi-dsi: Add helper to find input format".
>>>>       - Use a common function for bridge pre-enable and enable, and
>>>> bridge disable
>>>>         and post-disable, to avoid code duplication.
>>>>       - Add T-b tag from Dominik Haller in patch 5/10. (Missed to add
>>>> it in v2).
>>>>       - Add R-b tag from Dmitry Baryshkov for patch 8/10.
>>>>
>>>>     - Changes in v2:
>>>>       - Drop patch "drm/tidss: Add CRTC mode_fixup"
>>>>       - Split patch "drm/bridge: cdns-dsi: Fix minor bugs" into 4
>>>> separate ones
>>>>       - Drop support for early_enable/late_disable APIs and instead re-
>>>> order the
>>>>         pre_enable / post_disable APIs to be called before / after
>>>> crtc_enable /
>>>>         crtc_disable.
>>>>       - Drop support for early_enable/late_disable in cdns-dsi and use
>>>>         pre_enable/post_disable APIs instead to do bridge enable/disable.
>>>>
>>>>
>>>> Previous versions:
>>>>
>>>> v1:  https://lore.kernel.org/all/20240511153051.1355825-1-a-
>>>> bhatia1@ti.com/
>>>> v2:  https://lore.kernel.org/all/20240530093621.1925863-1-a-
>>>> bhatia1@ti.com/
>>>> v3:  https://lore.kernel.org/all/20240617105311.1587489-1-a-
>>>> bhatia1@ti.com/
>>>> v4:  https://lore.kernel.org/all/20240622110929.3115714-1-a-
>>>> bhatia1@ti.com/
>>>> v5:  https://lore.kernel.org/all/20241019195411.266860-1-
>>>> aradhya.bhatia@linux.dev/
>>>> v6:  https://lore.kernel.org/all/20250111192738.308889-1-
>>>> aradhya.bhatia@linux.dev/
>>>> v7:  https://lore.kernel.org/all/20250114055626.18816-1-
>>>> aradhya.bhatia@linux.dev/
>>>> v8:  https://lore.kernel.org/all/20250126191551.741957-1-
>>>> aradhya.bhatia@linux.dev/
>>>> v9:  https://lore.kernel.org/all/20250209121032.32655-1-
>>>> aradhya.bhatia@linux.dev/
>>>> v10: https://lore.kernel.org/all/20250226155228.564289-1-
>>>> aradhya.bhatia@linux.dev/
>>>> v11: https://lore.kernel.org/all/20250329113925.68204-1-
>>>> aradhya.bhatia@linux.dev/
>>>>
>>>> ---
>>>>
>>>> Aradhya Bhatia (5):
>>>>     drm/atomic-helper: Refactor crtc & encoder-bridge op loops into
>>>>       separate functions
>>>>     drm/atomic-helper: Separate out bridge pre_enable/post_disable from
>>>>       enable/disable
>>>>     drm/atomic-helper: Re-order bridge chain pre-enable and post-disable
>>>>     drm/bridge: Update the bridge enable/disable doc
>>>>     drm/bridge: cdns-dsi: Use pre_enable/post_disable to enable/disable
>>>>
>>>>    .../gpu/drm/bridge/cadence/cdns-dsi-core.c    |  64 +++--
>>>>    drivers/gpu/drm/drm_atomic_helper.c           | 160 +++++++++--
>>>>    include/drm/drm_bridge.h                      | 249 +++++++++++++-----
>>>>    3 files changed, 355 insertions(+), 118 deletions(-)
>>>>
>>>>
>>>> base-commit: dd717762761807452ca25634652e180a80349cd8

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

