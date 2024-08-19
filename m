Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD714956E5B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 17:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DEEF10E2BA;
	Mon, 19 Aug 2024 15:14:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ByLZoEiy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hAWdifuD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ByLZoEiy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hAWdifuD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBBF10E0B0;
 Mon, 19 Aug 2024 15:14:33 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1A35421ED1;
 Mon, 19 Aug 2024 15:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724080472; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=51YdApFs8jsVtd2RKoqunhnxphP9DtzQ+7ug6Ap7uko=;
 b=ByLZoEiy9Zqj+jusKjzCUjM7CcDAKJBRZu2gS4Q+90/sKidXcuCiDGJ9wAHdEeNTvV++jh
 B6/edI/CckS/W//pt9jb59hKsw2gpT00IzktxRdRK+2QXD17EONvkKvVpGm+/AOiE9Yecm
 YJVNAw47PArUw+MPOc8seAVeij+858c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724080472;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=51YdApFs8jsVtd2RKoqunhnxphP9DtzQ+7ug6Ap7uko=;
 b=hAWdifuDBGPUaH3YtbZGWx9R4dOwNQKB/UfM2bmwmF2uPZmQlY6SBeNuAV2XxiQLlGKsGv
 WQoG4adn61E4ywCQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ByLZoEiy;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=hAWdifuD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724080472; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=51YdApFs8jsVtd2RKoqunhnxphP9DtzQ+7ug6Ap7uko=;
 b=ByLZoEiy9Zqj+jusKjzCUjM7CcDAKJBRZu2gS4Q+90/sKidXcuCiDGJ9wAHdEeNTvV++jh
 B6/edI/CckS/W//pt9jb59hKsw2gpT00IzktxRdRK+2QXD17EONvkKvVpGm+/AOiE9Yecm
 YJVNAw47PArUw+MPOc8seAVeij+858c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724080472;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=51YdApFs8jsVtd2RKoqunhnxphP9DtzQ+7ug6Ap7uko=;
 b=hAWdifuDBGPUaH3YtbZGWx9R4dOwNQKB/UfM2bmwmF2uPZmQlY6SBeNuAV2XxiQLlGKsGv
 WQoG4adn61E4ywCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BDDAF137C3;
 Mon, 19 Aug 2024 15:14:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 3ZwZLVdhw2Z3GQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Aug 2024 15:14:31 +0000
Message-ID: <3fdacb13-6b91-4266-9fa5-8a14f46527b5@suse.de>
Date: Mon, 19 Aug 2024 17:14:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] video/aperture: match the pci device when calling
 sysfb_disable()
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: kernel test robot <lkp@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev,
 intel-gfx@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 stable@vger.kernel.org
References: <20240809150327.2485848-1-alexander.deucher@amd.com>
 <202408101951.tXyqYOzv-lkp@intel.com>
 <1c77f913-4707-4300-b84a-36fcf99942f4@suse.de>
 <CADnq5_NjCFyy+bQY+uyijcZwvwXYkvVLLUQdtzN_ODvHAj193Q@mail.gmail.com>
 <8bbf3f92-3719-4ff4-9587-e076635758d1@suse.de>
Content-Language: en-US
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
In-Reply-To: <8bbf3f92-3719-4ff4-9587-e076635758d1@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1A35421ED1
X-Spam-Score: -6.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_TLS_ALL(0.00)[]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_TO(0.00)[gmail.com];
 RCPT_COUNT_TWELVE(0.00)[12]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 MID_RHS_MATCH_FROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[intel.com,amd.com,lists.freedesktop.org,lists.linux.dev,redhat.com,gmx.de,ravnborg.org,ffwll.ch,vger.kernel.org];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,git-scm.com:url,01.org:url];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
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



Am 19.08.24 um 10:04 schrieb Thomas Zimmermann:
> Hi
>
> Am 16.08.24 um 22:57 schrieb Alex Deucher:
>> On Mon, Aug 12, 2024 at 8:10 AM Thomas Zimmermann 
>> <tzimmermann@suse.de> wrote:
>>> Hi
>>>
>>> Am 10.08.24 um 13:44 schrieb kernel test robot:
>>>> Hi Alex,
>>>>
>>>> kernel test robot noticed the following build errors:
>>>>
>>>> [auto build test ERROR on drm-misc/drm-misc-next]
>>>> [also build test ERROR on linus/master v6.11-rc2 next-20240809]
>>>> [If your patch is applied to the wrong git tree, kindly drop us a 
>>>> note.
>>>> And when submitting patch, we suggest to use '--base' as documented in
>>>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>>>
>>>> url: 
>>>> https://github.com/intel-lab-lkp/linux/commits/Alex-Deucher/video-aperture-match-the-pci-device-when-calling-sysfb_disable/20240810-021357
>>>> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
>>>> patch link: 
>>>> https://lore.kernel.org/r/20240809150327.2485848-1-alexander.deucher%40amd.com
>>>> patch subject: [PATCH] video/aperture: match the pci device when 
>>>> calling sysfb_disable()
>>>> config: csky-randconfig-001-20240810 
>>>> (https://download.01.org/0day-ci/archive/20240810/202408101951.tXyqYOzv-lkp@intel.com/config)
>>>> compiler: csky-linux-gcc (GCC) 14.1.0
>>>> reproduce (this is a W=1 build): 
>>>> (https://download.01.org/0day-ci/archive/20240810/202408101951.tXyqYOzv-lkp@intel.com/reproduce)
>>>>
>>>> If you fix the issue in a separate patch/commit (i.e. not just a 
>>>> new version of
>>>> the same patch/commit), kindly add following tags
>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>> | Closes: 
>>>> https://lore.kernel.org/oe-kbuild-all/202408101951.tXyqYOzv-lkp@intel.com/
>>>>
>>>> All errors (new ones prefixed by >>):
>>>>
>>>>      csky-linux-ld: drivers/video/aperture.o: in function 
>>>> `aperture_remove_conflicting_pci_devices':
>>>>>> aperture.c:(.text+0x222): undefined reference to 
>>>>>> `screen_info_pci_dev'
>>> Strange. There's a already placeholder [1] for architectures without
>>> PCI. Otherwise the source file is listed at [2].
>> So I dug into this, and the problem seems to be that
>> CONFIG_SCREEN_INFO is not defined in that config.  I can't figure out
>> how this should work in that case or why this is not a problem in
>> drivers/firmware/sysfb.c.
>>
>> Something like this works:
>> diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
>> index 56a5a0bc2b1af..50e98210c9fe5 100644
>> --- a/drivers/video/aperture.c
>> +++ b/drivers/video/aperture.c
>> @@ -347,7 +347,9 @@ EXPORT_SYMBOL(__aperture_remove_legacy_vga_devices);
>>    */
>>   int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev,
>> const char *name)
>>   {
>> +#if defined(CONFIG_SCREEN_INFO)
>>          struct screen_info *si = &screen_info;
>> +#endif
>>          bool primary = false;
>>          resource_size_t base, size;
>>          int bar, ret = 0;
>> @@ -355,8 +357,10 @@ int
>> aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const
>> char *na
>>          if (pdev == vga_default_device())
>>                  primary = true;
>>
>> +#if defined(CONFIG_SCREEN_INFO)
>>          if (pdev == screen_info_pci_dev(si))
>>                  sysfb_disable();
>> +#endif
>>
>>          for (bar = 0; bar < PCI_STD_NUM_BARS; ++bar) {
>>                  if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
>>
>> But that can't be the right fix...  Any ideas?
>
> Thanks for investigating. I'd say we should pass the device 
> (pdev->dev) to sysfb_disable() and  do the test there. In sysfb.c, 
> next to sysfb_disable(), you'll find sysfb_parent_dev(), which gives 
> the Linux device of the screen_info.
>
> The code then looks something like this:
>
> sysfb_disable(struct device *dev)
> {
>     if (dev && dev == sysfb_parent_dev(screen_info))

s/==/!=

> return
>
>   /* else do the current code */
> }
>
> there's an invocation of sysfb_disable() in drivers/of/platform.c 
> where you can pass NULL.
>
> Best regards
> Thomas
>
>>
>> Alex
>>
>>> [1]
>>> https://elixir.bootlin.com/linux/v6.10/source/include/linux/screen_info.h#L127 
>>>
>>> [2] 
>>> https://elixir.bootlin.com/linux/v6.10/source/drivers/video/Makefile#L11 
>>>
>>>
>>> Best regards
>>> Thomas
>>>
>>>>      csky-linux-ld: drivers/video/aperture.o: in function 
>>>> `devm_aperture_acquire_release':
>>>>>> aperture.c:(.text+0x2c0): undefined reference to `screen_info'
>>>>>> csky-linux-ld: aperture.c:(.text+0x2c4): undefined reference to 
>>>>>> `screen_info_pci_dev'
>>> -- 
>>> -- 
>>> Thomas Zimmermann
>>> Graphics Driver Developer
>>> SUSE Software Solutions Germany GmbH
>>> Frankenstrasse 146, 90461 Nuernberg, Germany
>>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
>>> HRB 36809 (AG Nuernberg)
>>>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

