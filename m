Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2507EA35DBB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 13:37:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D400410E2F1;
	Fri, 14 Feb 2025 12:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Dw3em+ey";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="khemF73a";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wGbWqyRR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OdrODMN3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 239E510E2F1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 12:36:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E0F221F38D;
 Fri, 14 Feb 2025 12:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739536611; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=sfeDfJgUCtbRwSRBPdkVP3UK1Hqy/yoBumF5LWFkbPM=;
 b=Dw3em+eyZMjE34C3aNd9GbjaHapJ7Hckgufu0uXW07WuImIusZVAnXy4tnfEIgsRH6teVU
 /J3vEdLjoQunGLsxgDQnlb3tOTwHZ1VS1LS3Y949hkFKti6f82L6N1ke45JuW/cvq73lhv
 rDdOZl6NUGCYQuWSAJVsNftYcEGHI2I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739536611;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=sfeDfJgUCtbRwSRBPdkVP3UK1Hqy/yoBumF5LWFkbPM=;
 b=khemF73a+X4/ghevtGzlW8LXvDWsj5ObLUy3BkhDqBmgX94NpVfpcBhDjtQdWVQLBVGLQL
 xn5SgEQ9ah0iYVBA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wGbWqyRR;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=OdrODMN3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739536606; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=sfeDfJgUCtbRwSRBPdkVP3UK1Hqy/yoBumF5LWFkbPM=;
 b=wGbWqyRRaDdigcuzzNbwu6frOsk73iaw5hDeeYjAuzbU7IoaLNSU1K7wrRCpuSoiEJrvel
 tO2F2jCVCnoUarp2dFGaPLSgXvedr+tpGN9KVg0H6eby2ksPJSF/jTFk62620qbBEq3nkk
 jrgm0359yfc8cquhrG4MsruYojTpGq4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739536606;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=sfeDfJgUCtbRwSRBPdkVP3UK1Hqy/yoBumF5LWFkbPM=;
 b=OdrODMN3CCijailHN7KWSeOmHJUDHF3kGrMmxbWr9JGps4mpYA96S1ucL8D8iosONYlyzs
 0yfu7OlwZvHdjeDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A0B6E137DB;
 Fri, 14 Feb 2025 12:36:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id dnbYJd44r2dueQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 14 Feb 2025 12:36:46 +0000
Message-ID: <7c378bfb-96e4-435d-8e6c-581d6851835f@suse.de>
Date: Fri, 14 Feb 2025 13:36:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Include ASPEED ast-drm 1.15.1 video driver in kernel tree
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Nicolas Baranger <nicolas.baranger@3xo.fr>
Cc: dri-devel@lists.freedesktop.org, airlied@redhat.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
References: <d507f6268ea3158b5af82b6860ca7b71@3xo.fr>
 <194c4656963debcf074d87e89ab1a829@3xo.fr>
 <b296bfef-1a9c-4452-baeb-09f86758addd@suse.de>
 <984c317de1027f5886390a65f1f66126@3xo.fr>
 <cd7a9908-d4ba-45ca-a5cb-de8ac7ef72d0@redhat.com>
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
In-Reply-To: <cd7a9908-d4ba-45ca-a5cb-de8ac7ef72d0@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E0F221F38D
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,vger.kernel.org];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[9];
 RBL_NIXSPAM_FAIL(0.00)[2a07:de40:b281:104:10:150:64:97:server fail];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, suse.de:dkim,
 imap1.dmz-prg2.suse.org:rdns, imap1.dmz-prg2.suse.org:helo]
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

Hi Jocelyn

Am 14.02.25 um 10:11 schrieb Jocelyn Falempe:
> On 13/02/2025 10:27, Nicolas Baranger wrote:
>> Dear Thomas
>>
>> Thanks for answer and help.
>>
>> Yes, due to .date total removal in linux 6.14 (https://github.com/ 
>> torvalds/linux/commit/cb2e1c2136f71618142557ceca3a8802e87a44cd 
>> <https:// github.com/torvalds/linux/commit/ 
>> cb2e1c2136f71618142557ceca3a8802e87a44cd>) the last DKMS sources are :
>> https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/ 
>> nba_last_src_20250212/src/ <https://xba.soartist.net/ast- 
>> drm_nba_20250211/nba-dkms/nba_last_src_20250212/src/>
>>
>> You can also find this sources in directory drivers/gpu/drm/ast_new 
>> of the tarball 
>> https://xba.soartist.net/ast-drm_nba_20250211/nba-kernel/ 
>> linux-6.14.0.1-ast1.15.1-rc2_nba0_20250212.tar.gz <https:// 
>> xba.soartist.net/ast-drm_nba_20250211/nba-kernel/linux-6.14.0.1- 
>> ast1.15.1-rc2_nba0_20250212.tar.gz>
>>
>> I'm surprised by the fact the in-kernel driver 0.1.0 is more advanced 
>> than Aspeed version 1.15.1 because on my system it has very poor 
>> rendering and is very slow, twinkle is high and had poor colors.
>> The screen flickering is high and it's like if I was using a very old 
>> cathode ray tube monitor (In fact I'm using a SAMSUNG LCD monitor 
>> which is perfectly functionnal and which display a nice and eyes 
>> confortable picture when using ast 1.15.1 driver or the video output 
>> of the Nvidia GPU ).
>>
>>
>> My testing system is a test Xeon server with an AST2400 BMC with its 
>> AST VGA card as the main video output (to be able to have a screen on 
>> the BMC KVM) +a discrete NVIDIA GPU I'm using for GPGPU and 3D 
>> rendering with Nvidia prime render offload.
>> What I constat with embed kernel driver 0.1.0 is that the Xeon 
>> processor is doing the video job for example when watching a video, 
>> and it's not the case with version 1.15.1 even when displaying on the 
>> AST VGA card a vulkan rotating cube (compute by nvidia GPU with 
>> nvidia prime but display by the AST VGA card of the AST2400).
>> Note that with in-kernel version 0.1.0 it's nearly impossible to make 
>> round the vulkan cube at more than half a round by  second where it's 
>> working (very) fine for a 32MB video memory card with version 1.15.1 
>> as you can see in the video present in the online directory
>>
>> I'm not developer or kernel developer so be sure that I wouldn't have 
>> done all this work if the in-kernel ast version 0.1.0 was usable 
>> out-of- the-box
>>
>> Sure you can give me a patch I will test on this server (building 
>> mainline+ast_new yesterday tooks 19 minutes on this server)
>>
>> PS:
>> here is a 'git diff linux-6.14.0.1-ast-rc2/drivers/gpu/drm/ast 
>> linux-6.14.0.1-ast-rc2/drivers/gpu/drm/ast_new'
>> https://xba.soartist.net/ast-drm_nba_20250211/nba-dump/ast- 
>> fullpatch.patch 
>> <https://xba.soartist.net/ast-drm_nba_20250211/nba-dump/ 
>> ast-fullpatch.patch>
>> Diff is about 250+ kb so the 2 drivers seems to have nothing to do 
>> with each others...
>>
>> Thanks again for help
>>
>> Kind regards
>> Nicolas
>>
>>
>> Le 2025-02-13 08:57, Thomas Zimmermann a écrit :
>>
>>> Hi Nicolas
>>>
>>> Am 12.02.25 um 19:58 schrieb Nicolas Baranger:
>>>> Dear maintener
>>>
>>> That's mostly me and Jocelyn.
>>>
>>>>
>>>> I did include ast-drm driver version 1.15.1 (in replacement of 
>>>> version 0.1.0) on the new mainline kernel too (6.14.0-rc2) and I 
>>>> issue a new dkms patch
>>>>
>>>> Last DKMS patch had been sucessfully tested on mainline.
>>>> And last ast.ko version 1.15.1 included in linux tree had also been 
>>>> sucessfully tested
>>>>
>>>> Online directory is updated with :
>>>> - new DKMS patch
>>>> - new DKMS srouces
>>>> - new DKMS debian package
>>>> - new tarball of mainline included ast_new ported in kernel tree
>>>> - new kernel debian package (mainline with ast_new)
>>>>
>>>>
>>>> NB: online directory is here: https://xba.soartist.net/ast- 
>>>> drm_nba_20250211/ <https://xba.soartist.net/ast-drm_nba_20250211/>
>>>>
>>>> Please let me know what I should do to see this change in linux-next
>>>
>>> I'm having a little trouble with figuring out which of the many 
>>> driver sources is the relevant one. Am I correct to assume it's the 
>>> one at
>>>
>>> https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/ 
>>> nba_last_src_20250212/src/ <https://xba.soartist.net/ast- 
>>> drm_nba_20250211/nba-dkms/nba_last_src_20250212/src/>
>>>
>>>
>>> About that driver: Although the official driver reports an ancient 
>>> version number, it is an up-to-date driver. It is actually more 
>>> up-to- date than Aspeed's package. Both drivers share source code 
>>> and a few years ago there was an effort to bring the kernel's driver 
>>> up to the same feature set. Since then, the kernel's driver has been 
>>> updated, reworked and improved.
>>>
>>> About the performance: From what I can tell, the only significant 
>>> difference in these drivers is memory management. Your ast_new 
>>> driver uses an older algorithm that we replaced quite a few releases 
>>> ago. The old version was unreliable on systems with little video 
>>> memory, so we had to replace it.  I don't know why the new code 
>>> should be slower though.
>
> Regarding the performances of ast driver, I remember doing profiling 
> some times ago, and when running glxgears (with llvmpipe), 65% of the 
> CPU time was wasted in page fault 
> (https://elixir.bootlin.com/linux/v6.13.2/source/drivers/gpu/drm/drm_gem_shmem_helper.c#L534)
> But as this driver is mostly used for console/basic desktop usage, I 
> didn't investigate more.

Now that's an interesting find. The GEM shmem helpers vunmap ASAP to 
make pages swappable, I think. IIRC there was a patchset circulating 
that implements a shrinker [1] for shmem helpers. With that in place, 
we'd only update the page tables if necessary. If it's really that easy, 
we should try to merge that.

[1] 
https://elixir.bootlin.com/linux/v6.13.2/source/include/linux/shrinker.h#L82

>
> If I remember correctly, the switch to shmem, is because some devices 
> have only 16MB of memory, and 1920x1200x32bits takes ~9MB, so it's not 
> possible to have double buffering in this case. (And this is required 
> by most desktop environment).

Exactly. There are ast devices with as little as 8 MiB of video memory. 
But FullHD@32bit already requires ~8 MiB. Atomic modesetting with the 
old memory manager requires overcommitting by a factor of 3 (to ~24 MiB) 
to account for all corner cases. Hence we sometimes had failed display 
updates with lower-end devices.

>
> The switch to shmem was done with "f2fa5a99ca81c drm/ast: Convert ast 
> to SHMEM", and introduced in v6.2. So maybe if you can try with a v6.1 
> kernel, using the built-in ast driver and report if it has better 
> performances.

Nicolas, if you find an old kernel version that works correctly, and if 
you know how to git-bisect the kernel, it would be helpful if you could 
bisect to the commit that introduced the problem.

Best regards
Thomas

>
> Best regards,
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

