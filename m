Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 137804B9BF5
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 10:25:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32E910EDD4;
	Thu, 17 Feb 2022 09:25:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A4810EDD4;
 Thu, 17 Feb 2022 09:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645089947; x=1676625947;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=c9VpxmpqyPbdKVv7bGkudznhAWVeNpsJ2GNtw03B7g4=;
 b=StrNxHg6tZyS9afVkzXdEQ/vPJmZE25ALMBdBYqu9PqkVvQV46MsFDyf
 Tq3kFU2famR92azHTXcPcR5nDOnLJFYga4ZVOLlU3FDyDz/TBMEsLv6i/
 hzi2hj8HvPQTWLJZHCmXp7Kx+oGF8lNR9YME9D7mD3xCRkWzxFjmTf3xO
 VywTHGrH+thTDdJbGMRJA2yvObld7iDHLuMdPJl/Ggm+ryZ1Zfa5TRJc/
 RlqI3XP3JkVNtgxqeCs9+yR9Wyfl7NBBSySIptyPz62QEXa86MrkGv7fa
 25miy07mJ2WkBv8wadr078FgrOqqMqV960wI4bGAQZc7lW7BmueTKKWNt w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="311577508"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="311577508"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 01:25:46 -0800
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="540878738"
Received: from zcmahone-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.252.137.102])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 01:25:46 -0800
Date: Thu, 17 Feb 2022 01:25:45 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [Intel-gfx] [drm-tip:drm-tip 4/8]
 drivers/gpu/drm/solomon/ssd130x.c:451:18: error: incomplete definition of
 type 'struct dma_buf_map'
Message-ID: <20220217092545.4zpjnh344fmrcg26@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <202202171455.bclm1YBC-lkp@intel.com>
 <20220217063625.sm5ua5xf4jo2ekku@ldmartin-desk2>
 <79301ef2-03d4-ca96-3d7f-6f9b80f319e1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <79301ef2-03d4-ca96-3d7f-6f9b80f319e1@redhat.com>
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
Cc: kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>,
 intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 17, 2022 at 10:00:42AM +0100, Javier Martinez Canillas wrote:
>Hello Lucas,
>
>On 2/17/22 07:36, Lucas De Marchi wrote:
>> +Javier
>>
>>
>> On Thu, Feb 17, 2022 at 02:25:08PM +0800, kernel test robot wrote:
>>> tree:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
>>> head:   e141e36b2871c529379f7ec7d5d6ebae3137a51b
>>> commit: 7ca6504c36709f35c4cc38ae6acc1c9c3d72136f [4/8] Merge remote-tracking branch 'drm-misc/drm-misc-next' into drm-tip
>>> config: mips-buildonly-randconfig-r002-20220217 (https://download.01.org/0day-ci/archive/20220217/202202171455.bclm1YBC-lkp@intel.com/config)
>>> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0bad7cb56526f2572c74449fcf97c1fcda42b41d)
>>> reproduce (this is a W=1 build):
>>>        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>>        chmod +x ~/bin/make.cross
>>>        # install mips cross compiling tool for clang build
>>>        # apt-get install binutils-mips-linux-gnu
>>>        git remote add drm-tip git://anongit.freedesktop.org/drm/drm-tip
>>>        git fetch --no-tags drm-tip drm-tip
>>>        git checkout 7ca6504c36709f35c4cc38ae6acc1c9c3d72136f
>>>        # save the config file to linux build tree
>>>        mkdir build_dir
>>>        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/drm/solomon/
>>>
>>> If you fix the issue, kindly add following tag as appropriate
>>> Reported-by: kernel test robot <lkp@intel.com>
>>>
>>> All error/warnings (new ones prefixed by >>):
>>>
>>>>> drivers/gpu/drm/solomon/ssd130x.c:447:74: warning: declaration of 'struct dma_buf_map' will not be visible outside of this function [-Wvisibility]
>>>   static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct dma_buf_map *map,
>>>                                                                            ^
>>
>> this is now called iosys_map in drm-intel... drm-tip will need a fixup
>> for the merge.
>>
>
>I thought that the drm-intel tree was only for Intel DRM drivers changes and
>subsystem wide changes should be merged through drm-mic ?
>
>Doing refactoring in that tree will likely lead to merge conflicts like this.

Yes, I know. My initial proposal was to split the rename and do it per
branch to avoid this kind of situation, but it was requested to be done
all in a single patch. Since I had other ~15 patches dependent on that
one to be merged in drm-intel, it was agreed to do the rename via
drm-intel. See 
https://lore.kernel.org/lkml/e3813696-7b91-510c-987f-85ed2fd502d6@suse.de/

I guess the conflicts won't be that terrible and can be fixed as they
show up.

>Noticed your series in dri-devel but missed that already landed in drm-intel.
>
>The resolution should just be [0] right? If you confirm that then I can post
>a proper patch to dri-devel.
>
>>>>> drivers/gpu/drm/solomon/ssd130x.c:451:18: error: incomplete definition of type 'struct dma_buf_map'
>>>           void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
>>>                        ~~~^
>>
>> this shouldn't really be done.
>>
>
>Yes, I know but asked what would be the proper way and didn't get an answer.
>We have many drivers doing the same and I couldn't find one that was doing
>it correctly to use as a reference:
>
>$ git grep "TODO: Use mapping abstraction properly" | wc -l
>15
>
>If you point me the proper way, I'll be happy to post a patch to change it.

It depends what you want to do with the address. There are APIs to copy
from/to. I also added a few to read/write to an offset. It seems the
problem here is that you need to pass that to a helper,
drm_fb_xrgb8888_to_mono_reversed(). I think the proper solution would be
to change the helper to accept an iosys_map* as argument rather than a
void*.

Lucas De Marchi

>
>> Lucas De Marchi
>>
>
>[0]
>From f8268e5b15c321b56862904665f5e312bf50d397 Mon Sep 17 00:00:00 2001
>From: Javier Martinez Canillas <javierm@redhat.com>
>Date: Thu, 17 Feb 2022 09:52:37 +0100
>Subject: [PATCH] drm/solomon: Rename dma-buf-map to iosys-map
>
>Commit 7938f4218168 ("dma-buf-map: Rename to iosys-map") renamed the struct
>dma_buf_map to struct iosys_map, but this change wasn't present in drm-misc
>when the ssd130x driver was merged, and it created a merge conflict.
>
>Fix this by renaming the data structure type in the ssd130x driver.
>
>Reported-by: kernel test robot <lkp@intel.com>
>Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>---
> drivers/gpu/drm/solomon/ssd130x.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
>index 19697c8c5a2c..92c1902f53e4 100644
>--- a/drivers/gpu/drm/solomon/ssd130x.c
>+++ b/drivers/gpu/drm/solomon/ssd130x.c
>@@ -444,7 +444,7 @@ static void ssd130x_clear_screen(struct ssd130x_device *ssd130x)
> 	kfree(buf);
> }
>
>-static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct dma_buf_map *map,
>+static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_map *map,

I added this as a fixup to dim, so it's applied on the merge commit. I
think it would be preferred to have this in the merge resolution when
drm-intel propagates all the way back to drm-misc


> 				struct drm_rect *rect)
> {
> 	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
>-- 
>2.34.1
>
>Best regards,
>-- 
>Javier Martinez Canillas
>Linux Engineering
>Red Hat
>
