Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0359AD854E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 10:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01D510E05E;
	Fri, 13 Jun 2025 08:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="BV12kbOC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QFJ4IO6A";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="scyAcm+7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vQ6/rwl+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD8E10E05E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 08:15:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EA71E2171F;
 Fri, 13 Jun 2025 08:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749802507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=FODD+2MAZ9rNqbOirkbflnipzwZLncv/5cLpjyg0ruw=;
 b=BV12kbOCPiV2/xDJhsuaK61JZdOKRFak9dCce/UjlwpAAwv4WO1sOiUorE2WSODsXFZky8
 UdSoxHI7/97zE2FxwTbjO8/f8xe07w6m7Iy/n46aG+RkTUZgbKeXzVAGc9u4qISxLSN2al
 TFoXVTVJMwdpdLptYRXauuFEDQPzgho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749802507;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=FODD+2MAZ9rNqbOirkbflnipzwZLncv/5cLpjyg0ruw=;
 b=QFJ4IO6Ary8SnCVqccwNccFC1nmxGHY6sBg7Z9DCuQxISY1jlprYHw5QD0thsBdOPEZvaK
 /tzoZDzM7xFB8JBw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=scyAcm+7;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="vQ6/rwl+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749802506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=FODD+2MAZ9rNqbOirkbflnipzwZLncv/5cLpjyg0ruw=;
 b=scyAcm+75Vzt2R7ML5pyHlrq///ArIA4EOpZ3KwwVTTo2qgTTuYLmuLGrMwZUoEIVcXPKj
 JWHFMMe8dFCQ1OLJv4g5qXYW3gVo1dnQ4n7j0iem4+TfCq0VegGIQ/TFD5mUKXmThjndLa
 7ovBVq93wKOPK+9NUWLmOKJH2SohJpw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749802506;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=FODD+2MAZ9rNqbOirkbflnipzwZLncv/5cLpjyg0ruw=;
 b=vQ6/rwl+OwGzYZcBY/aBO9j3bX4rkFntKSwYplbi0qLAKHXvG4E/PMxXz7m9W5Il6zQ93z
 i8TSWioCftqxfnBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 419FD13782;
 Fri, 13 Jun 2025 08:15:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oOlxDgreS2ieJgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 13 Jun 2025 08:15:06 +0000
Message-ID: <fa5f9e9c-09f6-4f92-8f6d-4e057f9fc5a9@suse.de>
Date: Fri, 13 Jun 2025 10:15:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 9/9] drm/vkms: convert to use faux_device
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: Greg KH <gregkh@linuxfoundation.org>, Jonathan.Cameron@huawei.com,
 airlied@gmail.com, aleksander.lobakin@intel.com,
 andriy.shevchenko@linux.intel.com, bhelgaas@google.com, broonie@kernel.org,
 dakr@kernel.org, dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, louis.chauvet@bootlin.com, lukas@wunner.de,
 lyude@redhat.com, maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, mripard@kernel.org, quic_zijuhu@quicinc.com,
 rafael@kernel.org, robin.murphy@arm.com, rust-for-linux@vger.kernel.org,
 simona@ffwll.ch
References: <2025022643-scouting-petticoat-492b@gregkh>
 <20250311172054.2903-1-jose.exposito89@gmail.com>
 <2025031218-oxidize-backing-e278@gregkh>
 <Z9LqHcj4n7Dd8A-H@phenom.ffwll.local> <Z9MT23hgX2c21xNA@fedora>
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
In-Reply-To: <Z9MT23hgX2c21xNA@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 RCPT_COUNT_TWELVE(0.00)[27]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_CC(0.00)[linuxfoundation.org,huawei.com,gmail.com,intel.com,linux.intel.com,google.com,kernel.org,lists.freedesktop.org,vger.kernel.org,bootlin.com,wunner.de,redhat.com,riseup.net,quicinc.com,arm.com,ffwll.ch];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+];
 R_RATELIMIT(0.00)[to_ip_from(RLj8h91xihsixaeeztgm33n4sq)];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim, suse.de:mid, suse.de:email,
 imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns, bootlin.com:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: EA71E2171F
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Am 13.03.25 um 18:20 schrieb José Expósito:
> On Thu, Mar 13, 2025 at 03:22:21PM +0100, Simona Vetter wrote:
>> On Wed, Mar 12, 2025 at 07:22:07AM +0100, Greg KH wrote:
>>> On Tue, Mar 11, 2025 at 06:20:53PM +0100, José Expósito wrote:
>>>> Hi everyone,
>>>>
>>>>> On Tue, Feb 25, 2025 at 02:51:40PM +0100, Louis Chauvet wrote:
>>>>>>
>>>>>> Le 25/02/2025 à 12:41, Thomas Zimmermann a écrit :
>>>>>>> Hi
>>>>>>>
>>>>>>> Am 10.02.25 um 15:37 schrieb Louis Chauvet:
>>>>>>>> On 10/02/25 - 13:30, Greg Kroah-Hartman wrote:
>>>>>>>>> The vkms driver does not need to create a platform device, as there is
>>>>>>>>> no real platform resources associated it,  it only did so because it was
>>>>>>>>> simple to do that in order to get a device to use for resource
>>>>>>>>> management of drm resources.  Change the driver to use the faux device
>>>>>>>>> instead as this is NOT a real platform device.
>>>>>>>>>
>>>>>>>>> Cc: Louis Chauvet <louis.chauvet@bootlin.com>
>>>>>>>>> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
>>>>>>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>>>>>>> Cc: Melissa Wen <melissa.srw@gmail.com>
>>>>>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>>>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>>>>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>>>>>> Cc: dri-devel@lists.freedesktop.org
>>>>>>>>> Reviewed-by: Lyude Paul <lyude@redhat.com>
>>>>>>>>> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>>>>>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>>>
>>>>>>>> Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>>>>>>> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>>>>>>>
>>>>>>>> Thanks for the modification, it seems to work.
>>>>>>> Should this patch be merged through DRM trees? drm-misc-next is at
>>>>>>> v6.14-rc4 and has struct faux_device.
>>>>>> Hi,
>>>>>>
>>>>>> I was not aware the faux-device was merged, as it is a new feature, I
>>>>>> expected it to reach drm-misc-next on 6.15-rc1.
>>>>> I added it to Linus's tree just so that DRM could get these changes into
>>>>> their tree now :)
>>>>>
>>>>>> I plan to merge [1] today/tomorrow (well tested with platform_device), and
>>>>>> then I will submit an updated version of this patch (only trivial conflicts,
>>>>>> but never tested with multiple VKMS devices).
>>>>>>
>>>>>> [1]:https://lore.kernel.org/all/20250218101214.5790-1-jose.exposito89@gmail.com/
>>>>> Great, thanks!
>>>>>
>>>>> greg k-h
>>>> Testing this patch again as part of some IGT tests I'm working on,
>>>> I noticed that, applying this patch on top of the latest drm-misc-next
>>>> triggers a warning at drivers/gpu/drm/drm_gem.c:571, in
>>>> drm_gem_get_pages():
>>>>
>>>>      if (WARN_ON(!obj->filp))
>>>>              return ERR_PTR(-EINVAL);
>>> I don't see how the faux bus change would have anything to do with a
>>> filp as that's not related as far as I can tell.  But I don't know the
>>> drm layer at all, where does that filp come from?
>> Yeah that filp is the shmem file that backs gem bo. That's very far away
>> from anything device/driver related datastrctures. If this is a new
>> failure due to the aux bux conversion then it would be really surprising.
> Agreed, I find it surprising, but reverting the patch removes the warning.
>
> It's most likely an issue on my side, but I decided to double check just
> in case someone else is also seeing this warning.

Any news on this issue?

Best regards
Thomas

>
> Jose
>
>> -Sima
>>
>> -- 
>> Simona Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

