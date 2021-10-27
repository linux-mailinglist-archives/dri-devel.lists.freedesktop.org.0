Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1533843BEB2
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 02:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ABB76E4E6;
	Wed, 27 Oct 2021 00:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9F06E4E6
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 00:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:
 Subject:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=X6fcEAbwRUlxqO8/g60aGuQDzDDW3CnmwfK/tyqVlJo=; b=R8WtgvqCdXPApZUBXpV+GrvNoV
 JfryZLRqDgy4d1kc5B3/SFU/31pYaHCKmpsnJOJ7fP+kMj9rWgBRJZvzz9hUc54vQWaek7jsSZyzh
 R+UlGy50DnabiCCFaW1TexhfSUS09yKHU2yIGZdzY6X23UK2cWsWA8RA84EBq8/M4/QyQfh1RGUu7
 HVY+eLPb20oUyZsOM3AhYt6QjggEqidvkuvUGLi/vaxtsQgY8rA3Y4v0ZCTP/bvSocxaOK7bnLmqy
 zc+SHiHXpDKIjyroNmXsw9UuqlzRsXwcBtnS/ZkkZf/ZIZ50dFmpLjfkac5Uacq7xE4fwLLXN7blP
 gO6l/kuA==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfXH1-003Rlf-Rn; Wed, 27 Oct 2021 00:58:35 +0000
From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: gpu: drm_fb_cma_helper.c:46: undefined reference to
 `drm_gem_fb_get_obj'
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Andrey Konovalov <andreyknvl@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>
References: <CA+G9fYvpyUbqLko+9Dza8h4=9yOd-n9J0dKoQtZxawstCCnsZw@mail.gmail.com>
 <857ab1a9-0175-2b2c-e729-2620d0221e1e@suse.de>
Message-ID: <6862b109-ea12-6ffa-c82b-b23ee26aa5b2@infradead.org>
Date: Tue, 26 Oct 2021 17:58:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <857ab1a9-0175-2b2c-e729-2620d0221e1e@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/26/21 11:21 AM, Thomas Zimmermann wrote:
> Hi
> 
> Am 25.10.21 um 14:13 schrieb Naresh Kamboju:
>> Regression found on arm gcc-11 built with multi_v5_defconfig
>> Following build warnings / errors reported on linux next 20211025.
>>
>> metadata:
>>      git_describe: next-20211025
>>      git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>>      git_short_log: 9ae1fbdeabd3 (\"Add linux-next specific files for 20211025\")
>>      target_arch: arm
>>      toolchain: gcc-11
>>      config: multi_v5_defconfig
>>
>> build error :
>> --------------
>> arm-linux-gnueabihf-ld: drivers/gpu/drm/drm_fb_cma_helper.o: in
>> function `drm_fb_cma_get_gem_obj':
>> drivers/gpu/drm/drm_fb_cma_helper.c:46: undefined reference to
>> `drm_gem_fb_get_obj'
>> arm-linux-gnueabihf-ld: drivers/gpu/drm/drm_fb_cma_helper.c:46:
>> undefined reference to `drm_gem_fb_get_obj'
>> arm-linux-gnueabihf-ld: drivers/gpu/drm/drm_fb_cma_helper.c:46:
>> undefined reference to `drm_gem_fb_get_obj'
>> arm-linux-gnueabihf-ld: drivers/gpu/drm/drm_fb_cma_helper.o: in
>> function `drm_fb_cma_sync_non_coherent':
>> drivers/gpu/drm/drm_fb_cma_helper.c:133: undefined reference to
>> `drm_atomic_helper_damage_iter_init'
>> arm-linux-gnueabihf-ld: drivers/gpu/drm/drm_fb_cma_helper.c:135:
>> undefined reference to `drm_atomic_helper_damage_iter_next'
>> make[1]: *** [Makefile:1252: vmlinux] Error 1
>> make[1]: Target '__all' not remade because of errors.
>> make: *** [Makefile:226: __sub-make] Error 2
>>
>> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>>
>>
>> build link:
>> -----------
>> https://builds.tuxbuild.com/1zzgFZBGjpQ5R0lawQFW9iJ39Hp/build.log
>>
>> build config:
>> -------------
>> https://builds.tuxbuild.com/1zzgFZBGjpQ5R0lawQFW9iJ39Hp/config
> 
> Looking at this config, there is:
> 
> CONFIG_DRM=y
> # CONFIG_DRM_DP_AUX_CHARDEV is not set
> # CONFIG_DRM_DEBUG_MM is not set
> # CONFIG_DRM_DEBUG_SELFTEST is not set
> CONFIG_DRM_KMS_HELPER=m
> # CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
> # CONFIG_DRM_DP_CEC is not set
> CONFIG_DRM_GEM_CMA_HELPER=y
> CONFIG_DRM_KMS_CMA_HELPER=y
> 
> GEM_CMA_HELPER depends on KMS_HELPER, but the latter is a module. That's probably the cause of the problem. Is it intentionally set this way?
> 

The only drivers that select DRM_KMS_HELPER are both =m, so that's how
DRM_KMS_HELPER is set also.

Symbol: DRM_KMS_HELPER [=m]
Type : tristate
Defined at drivers/gpu/drm/Kconfig:82
Depends on: HAS_IOMEM [=y] && DRM [=y]
Selected by [m]:
- DRM_ATMEL_HLCDC [=m] && HAS_IOMEM [=y] && DRM [=y] && OF [=y] && COMMON_CLK [=y] && MFD_ATMEL_HLCDC [=y] && ARM [=y]
- DRM_ASPEED_GFX [=m] && HAS_IOMEM [=y] && DRM [=y] && OF [=y] && (COMPILE_TEST [=n] || ARCH_ASPEED [=y]) && MMU [=y]


I did the ARM cross-build and also see the linker error.
I didn't understand why -- and still don't, but here is a little
speculation:

In the past (e.g. 10 years ago), we have to move some .o files
in lib/ from lib-y to obj-y so that they would always be included
in the final object file and not cause their user/caller object
files to suffer from undefined references.
These happened because unused functions(?) in lib-y files are
stripped out of the final object files.
The same thing could be happening here (still just guessing).

Does that help any?  I dunno.

Adding Arnd to Cc: to see if he has any ideas...

>>
>> # To install tuxmake on your system globally
>> # sudo pip3 install -U tuxmake
>> tuxmake --runtime podman --target-arch arm --toolchain gcc-11
>> --kconfig multi_v5_defconfig
>>
>> -- 
>> Linaro LKFT
>> https://lkft.linaro.org



-- 
~Randy
