Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D8691F0C1
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 10:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E61510E553;
	Tue,  2 Jul 2024 08:05:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="RTBGHitW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dKW6zci5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RTBGHitW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dKW6zci5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B1310E552;
 Tue,  2 Jul 2024 08:05:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5B49C1FB8F;
 Tue,  2 Jul 2024 08:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719907509; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=iaxLyCKlDQhNKH+7Ea3S4IE1W/oYFYWQH/On61mLNw8=;
 b=RTBGHitWX7TymI7Is1X1tpbfyQrkXthWXets1YKdAZbiz3kvfpSdoNM5gY0mvjJ9TWLElm
 ja2mdul+90eBBEkzB4tINp++C/hd+Ec0RHUF/J0EdOXjtKhNj6VXgHHOg/7MHVSRaKRQ6j
 MlVSL9f2/h3RzqKV2WTzJjEhftqMx6E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719907509;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=iaxLyCKlDQhNKH+7Ea3S4IE1W/oYFYWQH/On61mLNw8=;
 b=dKW6zci5a1Mmu3g15T8Te2tgJZg9pEw9q+gSHLmX11Q959VOpGL15m5/F9oG6VsfxIVLcR
 P5mhpX5kR1Xw26DQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RTBGHitW;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=dKW6zci5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719907509; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=iaxLyCKlDQhNKH+7Ea3S4IE1W/oYFYWQH/On61mLNw8=;
 b=RTBGHitWX7TymI7Is1X1tpbfyQrkXthWXets1YKdAZbiz3kvfpSdoNM5gY0mvjJ9TWLElm
 ja2mdul+90eBBEkzB4tINp++C/hd+Ec0RHUF/J0EdOXjtKhNj6VXgHHOg/7MHVSRaKRQ6j
 MlVSL9f2/h3RzqKV2WTzJjEhftqMx6E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719907509;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=iaxLyCKlDQhNKH+7Ea3S4IE1W/oYFYWQH/On61mLNw8=;
 b=dKW6zci5a1Mmu3g15T8Te2tgJZg9pEw9q+gSHLmX11Q959VOpGL15m5/F9oG6VsfxIVLcR
 P5mhpX5kR1Xw26DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0823A13A9A;
 Tue,  2 Jul 2024 08:05:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 9V2/ALW0g2Z6EQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 02 Jul 2024 08:05:09 +0000
Message-ID: <5ccc62fe-3b44-487b-b807-412921395601@suse.de>
Date: Tue, 2 Jul 2024 10:05:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] QXL display malfunction
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 "Kaplan, David" <David.Kaplan@amd.com>
Cc: "Petkov, Borislav" <Borislav.Petkov@amd.com>,
 "zack.rusin@broadcom.com" <zack.rusin@broadcom.com>,
 "dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "spice-devel@lists.freedesktop.org" <spice-devel@lists.freedesktop.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>
References: <DS7PR12MB576622398096CB650FF6AF4294FF2@DS7PR12MB5766.namprd12.prod.outlook.com>
 <DS7PR12MB57665F9F4BDF0598D7CC53DD94FF2@DS7PR12MB5766.namprd12.prod.outlook.com>
 <67b279c7-1b65-46be-baa2-06794b47b9d1@leemhuis.info>
 <ab0fb17d-0f96-4ee6-8b21-65d02bb02655@suse.de>
 <DS7PR12MB57662053B081FBD62213016B94C22@DS7PR12MB5766.namprd12.prod.outlook.com>
 <e0d95288-17b4-4286-8084-95f496603ada@leemhuis.info>
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
In-Reply-To: <e0d95288-17b4-4286-8084-95f496603ada@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 5B49C1FB8F
X-Spam-Score: -5.50
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-5.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; XM_UA_NO_VERSION(0.01)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TO_DN_EQ_ADDR_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[13]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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


Am 01.07.24 um 12:02 schrieb Linux regression tracking (Thorsten Leemhuis):
> Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
> for once, to make this easily accessible to everyone.
>
> Thomas, was there some progress wrt to fixing below regression? I might
> have missed something, but from here it looks like this fall through the
> cracks.

Thanks for reminding.


>
> Makes me wonder if we should temporarily revert this for now to fix this
> for rc7 and ensure things get at least one week of testing before the final.
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
>
> #regzbot poke
>
> On 14.06.24 15:45, Kaplan, David wrote:
>> [AMD Official Use Only - AMD Internal Distribution Only]
>>
>>> -----Original Message-----
>>> From: Thomas Zimmermann <tzimmermann@suse.de>
>>> Sent: Wednesday, June 12, 2024 9:26 AM
>>> To: Linux regressions mailing list <regressions@lists.linux.dev>
>>> Cc: Petkov, Borislav <Borislav.Petkov@amd.com>;
>>> zack.rusin@broadcom.com; dmitry.osipenko@collabora.com; Kaplan, David
>>> <David.Kaplan@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>;
>>> Dave Airlie <airlied@redhat.com>; Maarten Lankhorst
>>> <maarten.lankhorst@linux.intel.com>; Maxime Ripard
>>> <mripard@kernel.org>; LKML <linux-kernel@vger.kernel.org>; ML dri-devel
>>> <dri-devel@lists.freedesktop.org>; spice-devel@lists.freedesktop.org;
>>> virtualization@lists.linux.dev
>>> Subject: Re: [REGRESSION] QXL display malfunction
>>>
>>> Caution: This message originated from an External Source. Use proper
>>> caution when opening attachments, clicking links, or responding.
>>>
>>>
>>> Hi
>>>
>>> Am 12.06.24 um 14:41 schrieb Linux regression tracking (Thorsten Leemhuis):
>>>> [CCing a few more people and lists that get_maintainers pointed out
>>>> for qxl]
>>>>
>>>> Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
>>>> for once, to make this easily accessible to everyone.
>>>>
>>>> Thomas, from here it looks like this report that apparently is caused
>>>> by a change of yours that went into 6.10-rc1 (b33651a5c98dbd
>>>> ("drm/qxl: Do not pin buffer objects for vmap")) fell through the
>>>> cracks. Or was progress made to resolve this and I just missed this?
>>>>
>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker'
>>>> hat)
>>>> --
>>>> Everything you wanna know about Linux kernel regression tracking:
>>>> https://linux-regtracking.leemhuis.info/about/#tldr
>>>> If I did something stupid, please tell me, as explained on that page.
>>>>
>>>> #regzbot poke
>>>>
>>>>
>>>> On 03.06.24 04:29, Kaplan, David wrote:
>>>>>> -----Original Message-----
>>>>>> From: Kaplan, David
>>>>>> Sent: Sunday, June 2, 2024 9:25 PM
>>>>>> To: tzimmermann@suse.de; dmitry.osipenko@collabora.com; Koenig,
>>>>>> Christian <Christian.Koenig@amd.com>; zach.rusin@broadcom.com
>>>>>> Cc: Petkov, Borislav <Borislav.Petkov@amd.com>;
>>>>>> regressions@list.linux.dev
>>>>>> Subject: [REGRESSION] QXL display malfunction
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> I am running an Ubuntu 19.10 VM with a tip kernel using QXL video
>>>>>> and I've observed the VM graphics often malfunction after boot,
>>>>>> sometimes failing to load the Ubuntu desktop or even immediately
>>> shutting the guest down.
>>>>>> When it does load, the guest dmesg log often contains errors like
>>>>>>
>>>>>> [    4.303586] [drm:drm_atomic_helper_commit_planes] *ERROR* head
>>> 1
>>>>>> wrong: 65376256x16777216+0+0
>>>>>> [    4.586883] [drm:drm_atomic_helper_commit_planes] *ERROR* head
>>> 1
>>>>>> wrong: 65376256x16777216+0+0
>>>>>> [    4.904036] [drm:drm_atomic_helper_commit_planes] *ERROR* head
>>> 1
>>>>>> wrong: 65335296x16777216+0+0
>>> I don't see how these messages are related. Did they already appear before
>>> the broken commit was there?
>> No, I did not observe them prior to the broken commit.
>>
>>>>>> [    5.374347] [drm:qxl_release_from_id_locked] *ERROR* failed to find
>>> id in
>>>>>> release_idr
>>> Is there only one such message in the log? Or multiple/frequent ones.
>> I would usually only see one.
>>
>>> Could you provide a stack trace of what happens before?
>> Here's the top of a backtrace when the error occurs:
>> #0  qxl_release_from_id_locked (qdev=qdev@entry=0xffff88810126e000, id=id@entry=262151)
>>      at drivers/gpu/drm/qxl/qxl_release.c:373
>> #1  0xffffffff819f5b6a in qxl_garbage_collect (qdev=0xffff88810126e000)
>>      at drivers/gpu/drm/qxl/qxl_cmd.c:222
>> #2  0xffffffff810e3aa8 in process_one_work (worker=worker@entry=0xffff888101680300,
>>      work=0xffff88810126f340) at kernel/workqueue.c:3231
>> #3  0xffffffff810e6281 in process_scheduled_works (worker=<optimized out>)
>>      at kernel/workqueue.c:3312
>> #4  worker_thread (__worker=0xffff888101680300) at kernel/workqueue.c:3393
>>
>>> We sometimes draw into the buffer object from the CPU. For accessing the
>>> buffer object's pages from the CPU, only a vmap operation should be
>>> necessary. It appears as if qxl also requires a pin. My guess is that the pin
>>> inserts the buffer-object's host-side pages and the code around
>>> qxl_release_from_id_locked() appears to be garbage-collecting them.
>>> Hence without the pin, the GC complains about inconsistent state.
>>>>>> I bisected the issue down to "drm/qxl: Do not pin buffer objects for
>>> vmap"
>>>>>> (b33651a5c98dbd5a919219d8c129d0674ef74299).
>>> Thanks for bisecting. Does it work if you revert that commit?
>> Yes
>>
>> Thanks --David Kaplan

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

