Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B6354D1DC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 21:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D7510E50F;
	Wed, 15 Jun 2022 19:44:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9139910E50F;
 Wed, 15 Jun 2022 19:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=d/o5WdCpTeAaM6xLD3aXnZ6/ErJV7ziaxEi+U3WrQwE=; b=dOxybcqMn8pSrgy5H2UXrkD7Nd
 EKCijLQNCTS5VUigHRJEnIfdJSng2uhQTyswS7XOAezoBxwwHiY4L9GotkSh3/MjvVZ3Us3o8k2Vy
 kGEF6VstuRvtGOT3k0Pp4Qv3T2Y5NJ+YYLOMPcLtJcu5oqFRsfxMc/yOrAmj4gBJ9gpEYll8vvWXO
 Nf6EjBkF+2HLi/ugUXcGMU63LhnoesdswatbEyjGUAAnm3us2C/7xjZTbifvglrsabY8spFWjlqAR
 ZtWFXwDjWxM5yLvSHsslKYqtGHG+ioqTe+8hizctOs5BFiE36j6RhXBjkX3pZAGx0jyUL07FcJE56
 FEiGf29g==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o1YwO-008D1G-0q; Wed, 15 Jun 2022 19:44:36 +0000
Message-ID: <fb53cab1-f693-5309-e06a-0fe0fc932c2c@infradead.org>
Date: Wed, 15 Jun 2022 12:44:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: linux-next: Tree for Jun 15
 (drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c)
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <20220615160116.528c324b@canb.auug.org.au>
 <d1a48a84-6d07-e8f7-5fd8-d24a7a1cf187@infradead.org>
 <CADnq5_N6gfaPfZJAX4+poWFFruxNdFKZqzXZXosj1A55e-O1mA@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CADnq5_N6gfaPfZJAX4+poWFFruxNdFKZqzXZXosj1A55e-O1mA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/15/22 12:28, Alex Deucher wrote:
> On Wed, Jun 15, 2022 at 3:01 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>>
>>
>> On 6/14/22 23:01, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20220614:
>>>
>>
>> on i386:
>> # CONFIG_DEBUG_FS is not set
>>
>>
>> ../drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function ‘amdgpu_dm_crtc_late_register’:
>> ../drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6599:2: error: implicit declaration of function ‘crtc_debugfs_init’; did you mean ‘amdgpu_debugfs_init’? [-Werror=implicit-function-declaration]
>>   crtc_debugfs_init(crtc);
>>   ^~~~~~~~~~~~~~~~~
>>   amdgpu_debugfs_init
>>
>>
>> Full randconfig file is attached.
> 
> I tried building with your config and I can't repro this.  As Harry
> noted, that function and the whole secure display feature depend on
> debugfs.  It should never be built without CONFIG_DEBUG_FS.  See
> drivers/gpu/drm/amd/display/Kconfig:

Did you try building with today's linux-next tree?
(whatever is in it)

I have seen this build error multiple times so it shouldn't
be so difficult to repro it.


>> config DRM_AMD_SECURE_DISPLAY
>>         bool "Enable secure display support"
>>         default n
>>         depends on DEBUG_FS
>>         depends on DRM_AMD_DC_DCN
>>         help
>>             Choose this option if you want to
>>             support secure display
>>
>>             This option enables the calculation
>>             of crc of specific region via debugfs.
>>             Cooperate with specific DMCU FW.
> 
> amdgpu_dm_crtc_late_register is guarded by
> CONIG_DRM_AMD_SECURE_DISPLAY.  It's not clear to me how we could hit
> this.


-- 
~Randy
