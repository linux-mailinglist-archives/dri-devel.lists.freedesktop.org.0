Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C27BA69086C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 13:13:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C7310E0D6;
	Thu,  9 Feb 2023 12:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B07010E0D6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 12:13:51 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so3725416wma.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 04:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vxwq3qZx7HhOezXOacCmPWf5sAxEpqoAH1aP+iuc7PU=;
 b=nmkTnImy0DIsoJ4ymEqxr1q0ILRtZjOhgYWHN0tkNVq68FiptuB96kSgpluWoNsaSb
 IcVj/jXWYlePgZ+oqCIpY8RTbX2+8O99CTuwiS9v1vlwTpnXNcT8CIhpP9zsu+fLL2v/
 MRY8p7kiX6gfoVupyrF9YRADABUuBonEt/la68vouIsNBSqY6G31x2oSqzR6MkQAZSfs
 xRkEEarA9pi0tGEfwIds02ycDOd0RNKnCaXflTO6rFYS9WCFtlV/H2n73gsMYARsWDhr
 yU3zeJPAjnNsWQJQ6G72eON+qiMJ+/E0+im6Aj2vrfBZ4VYoNx7mhsErEKFQ68TWkUFO
 0mWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vxwq3qZx7HhOezXOacCmPWf5sAxEpqoAH1aP+iuc7PU=;
 b=N1mVG5es2XgsGZVCqL0M9GxAqRj+Xbts2wJMAbHagPYjY1KeqQb5ZIovVmiSCLsJ7B
 WPAhu6jUAAqoVABA/9bn5VLxrfwLjZBMkg9qURDMx10igl08bQb/2upH4isUn9TpTAlZ
 qF9y32GfaLls5V7LUIHiYKyoQpXNE5ATOYCaTVdCWQOI2d2ExR45qsjEQxoG8muoegmw
 A8twtsEfZomGyv2b2hgF3wnDWXHvWEjj8Zu0NTgtgxXesexKZmVOsL6mldywSWCI7yO5
 cQbt3uPeQ2ynuqM2xqHb4Hg6alVfGY53e9BOQAubo2PC/eeA/zpq6IkH6kJ7ZT9Ugfxn
 KzWw==
X-Gm-Message-State: AO0yUKVy5O5I34B6ee19rTD8v0/HFUZIb2F0jAoRy7LU8JwJ5wUbOsPV
 InFnqG/21QC19UPDKxUqT5E=
X-Google-Smtp-Source: AK7set/U4X6cKjiLMb8OKtniLVEuiIXbvRNjxiGmXzxpdLl9+afw7HEAbR2n/OXg17Gee8M3dlyyEQ==
X-Received: by 2002:a05:600c:3423:b0:3dd:b0b3:811b with SMTP id
 y35-20020a05600c342300b003ddb0b3811bmr9800189wmp.31.1675944829632; 
 Thu, 09 Feb 2023 04:13:49 -0800 (PST)
Received: from [192.168.178.21] (p5b0ea2e7.dip0.t-ipconnect.de.
 [91.14.162.231]) by smtp.gmail.com with ESMTPSA id
 j40-20020a05600c1c2800b003dc4480df80sm5419689wms.34.2023.02.09.04.13.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 04:13:49 -0800 (PST)
Message-ID: <4161ae4e-549c-00f6-5f37-f635a9cb775d@gmail.com>
Date: Thu, 9 Feb 2023 13:13:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Try to address the drm_debugfs issues
Content-Language: en-US
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>, daniel.vetter@ffwll.ch, 
 wambui.karugax@gmail.com, maxime@cerno.tech, mwen@igalia.com,
 mairacanal@riseup.net
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <0d9c852b-8639-55f4-4ec1-ca24f72d72f7@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <0d9c852b-8639-55f4-4ec1-ca24f72d72f7@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.02.23 um 12:23 schrieb Maíra Canal:
> On 2/9/23 05:18, Christian König wrote:
>> Hello everyone,
>>
>> the drm_debugfs has a couple of well known design problems.
>>
>> Especially it wasn't possible to add files between initializing and 
>> registering
>> of DRM devices since the underlying debugfs directory wasn't created 
>> yet.
>>
>> The resulting necessity of the driver->debugfs_init() callback 
>> function is a
>> mid-layering which is really frowned on since it creates a horrible
>> driver->DRM->driver design layering.
>>
>> The recent patch "drm/debugfs: create device-centered debugfs 
>> functions" tried
>> to address those problem, but doesn't seem to work correctly. This 
>> looks like
>> a misunderstanding of the call flow around drm_debugfs_init(), which 
>> is called
>> multiple times, once for the primary and once for the render node.
>>
>> So what happens now is the following:
>>
>> 1. drm_dev_init() initially allocates the drm_minor objects.
>> 2. ... back to the driver ...
>> 3. drm_dev_register() is called.
>>
>> 4. drm_debugfs_init() is called for the primary node.
>> 5. drm_framebuffer_debugfs_init(), drm_client_debugfs_init() and
>>     drm_atomic_debugfs_init() call drm_debugfs_add_file(s)() to add 
>> the files
>>     for the primary node.
>> 6. The driver->debugfs_init() callback is called to add debugfs files 
>> for the
>>     primary node.
>> 7. The added files are consumed and added to the primary node debugfs 
>> directory.
>>
>> 8. drm_debugfs_init() is called for the render node.
>> 9. drm_framebuffer_debugfs_init(), drm_client_debugfs_init() and
>>     drm_atomic_debugfs_init() call drm_debugfs_add_file(s)() to add 
>> the files
>>     again for the render node.
>> 10. The driver->debugfs_init() callback is called to add debugfs 
>> files for the
>>      render node.
>> 11. The added files are consumed and added to the render node debugfs 
>> directory.
>>
>> 12. Some more files are added through drm_debugfs_add_file().
>> 13. drm_debugfs_late_register() add the files once more to the 
>> primary node
>>      debugfs directory.
>> 14. From this point on files added through drm_debugfs_add_file() are 
>> simply ignored.
>> 15. ... back to the driver ...
>>
>> Because of this the dev->debugfs_mutex lock is also completely 
>> pointless since
>> any concurrent use of the interface would just randomly either add 
>> the files to
>> the primary or render node or just not at all.
>>
>> Even worse is that this implementation nails the coffin for removing the
>> driver->debugfs_init() mid-layering because otherwise drivers can't 
>> control
>> where their debugfs (primary/render node) are actually added.
>>
>> This patch set here now tries to clean this up a bit, but most likely 
>> isn't
>> fully complete either since I didn't audit every driver/call path.
>
> I tested the patchset on the v3d, vc4 and vkms and all the files are 
> generated
> as expected, but I'm getting the following errors on dmesg:
>
> [    3.872026] debugfs: File 'v3d_ident' in directory '0' already 
> present!
> [    3.872064] debugfs: File 'v3d_ident' in directory '128' already 
> present!
> [    3.872078] debugfs: File 'v3d_regs' in directory '0' already present!
> [    3.872087] debugfs: File 'v3d_regs' in directory '128' already 
> present!
> [    3.872097] debugfs: File 'measure_clock' in directory '0' already 
> present!
> [    3.872105] debugfs: File 'measure_clock' in directory '128' 
> already present!
> [    3.872116] debugfs: File 'bo_stats' in directory '0' already present!
> [    3.872124] debugfs: File 'bo_stats' in directory '128' already 
> present!
>
> It looks like the render node is being added twice, since this doesn't 
> happen
> for vc4 and vkms.

Thanks for the feedback and yes that's exactly what I meant with that I 
haven't looked into all code paths.

Could it be that v3d registers it's debugfs files from the debugfs_init 
callback?

One alternative would be to just completely nuke support for separate 
render node debugfs files and only add a symlink to the primary node. 
Opinions?

Regards,
Christian.

>
> Otherwise, the patchset looks good to me, but maybe Daniel has some other
> thoughts about it.
>
> Best Regards,
> - Maíra Canal
>
>>
>> Please comment/discuss.
>>
>> Cheers,
>> Christian.
>>
>>

