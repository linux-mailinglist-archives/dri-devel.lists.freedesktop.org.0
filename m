Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03442CFC9DF
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 09:32:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B1410E06D;
	Wed,  7 Jan 2026 08:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="CstA7D7/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Z/990cXm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GwMehW5m";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="O62HeTNK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4048A10E06D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 08:32:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DB86A33BC7;
 Wed,  7 Jan 2026 08:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1767774749; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=WFJhslFK6llg18fq978ITVfKNeQuOmno3QuQmIsY3Uc=;
 b=CstA7D7/tp4TM5cSuaNEfY/5iJPfSIHJXMOCuBd2zYy+jDHL26BqnAgXLtRoHuIEgGj8u4
 l20fLRLDfzDbfDu+16AIKs0AV8Hu6COdwHtlCOVwW+rAFYnvHbF4FK/YPaulbwEgI+mVsf
 VSxIwY4ej845wacEDzn52g/vjyKDUyw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1767774749;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=WFJhslFK6llg18fq978ITVfKNeQuOmno3QuQmIsY3Uc=;
 b=Z/990cXmgncC7GlU/VrmULm42927K3OyhgQ3r6L5a/fmbMbgtqXkL1WlRQjvxSuXJXlQbs
 Ydtt+70gbvoHjQBg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=GwMehW5m;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=O62HeTNK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1767774748; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=WFJhslFK6llg18fq978ITVfKNeQuOmno3QuQmIsY3Uc=;
 b=GwMehW5mME1ke+lCKhb5MUDqFONobxwnr3zboXd3vnT5BGNBPniNJqp60aZgWA66vd8S2U
 2uAKT76RTZPgzTK09Db79Qc9wvIWdgj/eU9Mu7PSS8DlcjtMWMBha0mryBhW/tNq/Z84GX
 pDrjIqhivgOljhLgY4V68ZfSOEDFI/Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1767774748;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=WFJhslFK6llg18fq978ITVfKNeQuOmno3QuQmIsY3Uc=;
 b=O62HeTNKk411q7uj+yeagGWT++IyfgFH+5EwYzyGdvMD0mP+n+/jHE16GoGgRlZNQ25qKA
 CpFmHBUOWztvgVCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 86FA03EA63;
 Wed,  7 Jan 2026 08:32:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id BAFUHxwaXmmkYgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 07 Jan 2026 08:32:28 +0000
Message-ID: <e53eeee6-8c6a-4ab7-b62f-2491efe19aeb@suse.de>
Date: Wed, 7 Jan 2026 09:32:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm: xlnx: zynqmp_kms: 16 bpp fixes for Xorg startup
 on AMD KV260
To: Mikko Rapeli <mikko.rapeli@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Michal Simek <michal.simek@amd.com>,
 Bill Mills <bill.mills@linaro.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
References: <20251205123751.2257694-1-mikko.rapeli@linaro.org>
 <533168f1-1655-4947-9032-b08463f502d7@ideasonboard.com>
 <aUVFUx55XTjb_2nO@nuoska> <aUkIQjKpd3MhNHjk@nuoska>
 <5f570a3b-7bee-43e0-9a36-3d106984fec6@suse.de>
 <3d214bf3-6b52-4942-95d9-0504fa6f5877@ideasonboard.com>
 <aV4SsKZ5eiayh18n@nuoska>
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
In-Reply-To: <aV4SsKZ5eiayh18n@nuoska>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_TWELVE(0.00)[13];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.infradead.org,vger.kernel.org,ideasonboard.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,amd.com,linaro.org];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:url,suse.de:dkim,suse.de:mid];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: DB86A33BC7
X-Spam-Flag: NO
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

Am 07.01.26 um 09:00 schrieb Mikko Rapeli:
> Hi,
>
> On Tue, Jan 06, 2026 at 10:29:37AM +0200, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 06/01/2026 09:41, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 22.12.25 um 09:58 schrieb Mikko Rapeli:
>>>> Hi,
>>>>
>>>> On Fri, Dec 19, 2025 at 02:30:11PM +0200, Mikko Rapeli wrote:
>>>>> On Fri, Dec 19, 2025 at 01:59:14PM +0200, Tomi Valkeinen wrote:
>>>>>> On 05/12/2025 14:37, Mikko Rapeli wrote:
>>>>>>> Currently on default yocto images Xorg fails to start on AMD KV260
>>>>>>> because 24/32 color depth gets detected but does not actually work.
>>>>>>>
>>>>>>> These two patches fix the issue and now 16 bpp gets detected
>>>>>>> and Xorg starts and draws on external HDMI display using
>>>>>>> kernel.org based linux-yocto kernel.
>>>>>>>
>>>>>>> Anatoliy Klymenko (1):
>>>>>>>     drm: xlnx: zynqmp_kms: Init fbdev with 16 bit color
>>>>>>>
>>>>>>> Mikko Rapeli (1):
>>>>>>>     drm: xlnx: zynqmp_kms: set preferred_depth to 16 bpp
>>>>>>>
>>>>>>>    drivers/gpu/drm/xlnx/zynqmp_kms.c | 3 ++-
>>>>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>> Did you notice the few already sent serieses on the list where the
>>>>>> topic
>>>>>> has been discussed?
>>>>>> [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
>>>>>> [PATCH 0/3] drm: zynqmp: Make the video plane primary
>>>>> Oh I wasn't aware of these.
>>>>>
>>>>>> Or is there something else on KV260 that messes up the 24 bit color?
>>>>> These look very similar and likely fix the X11 startup. I will give them
>>>>> a try.
>>>> Right, now I've tested:
>>>>
>>>>    * these patches from Anatoliy and me to help X11 use 16bpp mode by
>>>> default
>>>>      and removes the need to manually setup Xorg for 16bpp
>>>>    * "drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888" which enables
>>>> the X11 default
>>>>      24bpp to work, no need to set Xorg config to 16bpp
>>>>    * "drm: zynqmp: Make the video plane primary" which also fixes the
>>>> X11 default
>>>>      24bpp to work, no need to set Xorg config to 16bpp
>>>>
>>>> All of these fix HDMI graphics output on AMD KV260 board with yocto
>>>> genericarm64 machine
>>>> and core-image-sato image which includes Xorg. The graphics rendering
>>>> is still
>>>> very slow but I think that is a different problem.
>>>>
>>>> I guess the last series from Sean Anderson is moving forward so I'll
>>>> reply to that thread separately.
>>> Just want to say that the series here improves xlnx and makes it a
>>> 'better' driver. IMHO the changes should be merged independently from
>>> what happens with the other series.
>> I might be missing something, but I don't think I fully agree. Yes, the
>> userspace doesn't seem to be able to cope with the current upstream
>> driver behavior (even if it's not wrong as such, afaics), so in that
>> sense this series is better. But I don't think (almost) anyone really
>> wants to use RGB565 if XRGB8888 is an option? And that's what the other
>> series is trying to achieve, and that series conflicts with this one.
>>
>> So I'd rather try to get a conclusion on Sean's series (or the other one
>> from Mike). If that effort fails, we could go with this series as a backup.
> I did testing of all three different patch series'es on AMD KV260 and
> did not find any performance difference between them. The Xorg
> rendering is still very slow to an external HDMI display.
>
> I don't have an opinion on the graphics formats but just want something
> out to a display by default. I think there is a lot more to fix to get
> the performance into usable state.

I briefly looked through the xlnx driver and found several things to try.

* The update code in [1] appears to always update the whole buffer. 
Setting drm_plane_enable_fb_damage_clips() for the planes will enable 
damage handling. Then flushing only the damaged areas might improve 
performance.

* The driver could set drm_device.mode_config.prefer_shadow to make Xorg 
use a shadow buffer in user space. This often works for devices with 
discrete VRAM.  IDK if non-X compositors also benefit from this.

* If the hardware supports it, setting non-coherent DMA mappings could 
enable caching on the memory buffers. The driver would then have to 
enable damage clips and flush caches by itself where necessary.

Best regards
Thomas

[1] 
https://elixir.bootlin.com/linux/v6.18.3/source/drivers/gpu/drm/xlnx/zynqmp_disp.c#L1109

>
> Cheers,
>
> -Mikko

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


