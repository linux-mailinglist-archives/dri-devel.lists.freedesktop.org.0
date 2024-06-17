Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E993B90A71E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 09:30:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0DDB10E259;
	Mon, 17 Jun 2024 07:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TILLe/Hx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0524310E259
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 07:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718609423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nH7NF47wiN5yYt3CYf79aIVqL/Dl6DPgZQONYE92Y0w=;
 b=TILLe/HxTG0bCM8HqNM7SJ0QZxk7e+R7YAu/p6ZWrx+gwctI24KKTRUQW19x4h2MvFsrQy
 zv1/TeogNYSWg0U5V53+FAcIj7X4gDY2kwsKSLXfA08+HLH1OyaeBB64E+rALC6k3g23Ac
 xNXqWtG6nrtObBy+MupMU3rwMDwULh4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-thhnmxvJMrm_NFn7mCMGpw-1; Mon, 17 Jun 2024 03:29:40 -0400
X-MC-Unique: thhnmxvJMrm_NFn7mCMGpw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42120e123beso35518785e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 00:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718609380; x=1719214180;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nH7NF47wiN5yYt3CYf79aIVqL/Dl6DPgZQONYE92Y0w=;
 b=Kc1+DoCNnFIhZbcQq6MO2t0MEmCMbSddtG518FzMqXatgvaaZumR9jQu2ohuRs1eiw
 8vy8iygB7iGv6U8R5wxP6y9nAkB3cqS7a4bHVKLkfasxlpc10Fv+jEbyYv4ZM8PJyRdC
 1dYuxvm7tWYSqBqX+S/L24Yqi7sHaDonU16XAqJ+lQFRY2usJqgMauRMt196/qExgZg8
 aYe4VeXWw74tPfWUnP8XuuoZSbXooaq5JIg3KmWvDCF5ZZ+oOO2EeUgA3Dp8s0Q7c/hy
 PrusplrVBhS/jjNx98a6AVefcViGUnmplZ6gwKCF11vw41E+g7oaXCI8SwwrTiBqxCTT
 F+mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUos9Yp5ZZ2r8C6by5X4Ycs0WbY6+qU/nHQQzdCJFynOyo9Al1UxDRSljVoSxDs3pDkWbjRmODwV9snTt/dqF4iRY+CtMZU7j57yLoMLDh0
X-Gm-Message-State: AOJu0Ywol4xOscarKnTC2h78hCQbzpiRC9z18+06JxoqExdOrMOYXg5K
 7NOsRC8aem2FFW5ZJeZ+vHVE2p/2rGXsXG5H7lsPQe3cdv61vsspVV0qo75QBJtS9a13hnimAxb
 wTER1BEdsWYSDcIvwNzwD9h+lvyBaaLslE+SO/ssxVgLYYe/BIuN8m3hLCV7eB1Bljw==
X-Received: by 2002:a05:600c:3514:b0:421:7bb1:eb9b with SMTP id
 5b1f17b1804b1-42304844abfmr95161345e9.28.1718609379789; 
 Mon, 17 Jun 2024 00:29:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNol8wq1CXKJ8SwcNyP7NAVPlUEp/Y2i/P5kX0p598nmFsmM+2aodmq6E1g2pO2gIIdkl2YQ==
X-Received: by 2002:a05:600c:3514:b0:421:7bb1:eb9b with SMTP id
 5b1f17b1804b1-42304844abfmr95161155e9.28.1718609379373; 
 Mon, 17 Jun 2024 00:29:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f6320bd8sm150669275e9.32.2024.06.17.00.29.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 00:29:38 -0700 (PDT)
Message-ID: <cb70ad62-e927-4020-b2d9-84b7c7a607bf@redhat.com>
Date: Mon, 17 Jun 2024 09:29:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] drm/panic: Convert to drm_fb_clip_offset()
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 kernel test robot <lkp@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 oe-kbuild-all@lists.linux.dev, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <3121082eb4beb461773ebb6f656ed9b4286967ee.1718305355.git.geert+renesas@glider.be>
 <202406151811.yEIZ6203-lkp@intel.com>
 <CAMuHMdVvJwEbbEG6_4T2g0sHFyKehkQ81Ekc2Bi65Oq3hvNiDg@mail.gmail.com>
 <CAMuHMdX4VCrV9VPFT5412ccaG7AwqGUH_c-Tcy2NXLk3AapNBw@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CAMuHMdX4VCrV9VPFT5412ccaG7AwqGUH_c-Tcy2NXLk3AapNBw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 16/06/2024 11:12, Geert Uytterhoeven wrote:
> On Sun, Jun 16, 2024 at 11:08 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> On Sat, Jun 15, 2024 at 12:55 PM kernel test robot <lkp@intel.com> wrote:
>>> kernel test robot noticed the following build errors:
>>>
>>> [auto build test ERROR on drm-misc/drm-misc-next]
>>> [cannot apply to linus/master v6.10-rc3 next-20240613]
>>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>>> And when submitting patch, we suggest to use '--base' as documented in
>>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>>
>>> url:    https://github.com/intel-lab-lkp/linux/commits/Geert-Uytterhoeven/drm-panic-Fix-uninitialized-drm_scanout_buffer-set_pixel-crash/20240614-032053
>>> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
>>> patch link:    https://lore.kernel.org/r/3121082eb4beb461773ebb6f656ed9b4286967ee.1718305355.git.geert%2Brenesas%40glider.be
>>> patch subject: [PATCH v2 5/7] drm/panic: Convert to drm_fb_clip_offset()
>>> config: x86_64-randconfig-003-20240615 (https://download.01.org/0day-ci/archive/20240615/202406151811.yEIZ6203-lkp@intel.com/config)
>>> compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406151811.yEIZ6203-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202406151811.yEIZ6203-lkp@intel.com/
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>>> depmod: ERROR: Cycle detected: drm -> drm_kms_helper -> drm
>>>     depmod: ERROR: Found 2 modules in dependency cycles!
>>
>> Oops, so DRM core cannot call any of the helpers, and DRM_PANIC
>> selecting DRM_KMS_HELPER was wrong in the first place?
> 
> Q: So how does this work with DRM_PANIC calling
>     drm_fb_helper_emergency_disable()?
> A: drm_fb_helper_emergency_disable() is a dummy if
>     !CONFIG_DRM_FBDEV_EMULATION, so I guess no one tried to build
>     a failing randconfig with CONFIG_DRM_FBDEV_EMULATION=y yet.

drm_fb_helper_emergency_disable() is part of the series
https://patchwork.freedesktop.org/series/132720/
which, after discussing it on IRC with sima and Javier, is not a good 
solution, and is abandoned.

I think the "select DRM_KMS_HELPER" is a leftover from earlier version 
of drm_panic, that used the color conversion function from 
drm_kms_helper, but that has changed in v10 and later.

drm_panic is called from the drm_core code, so in fact it can't depends 
on the kms helper.

I don't see a good solution to workaround this circular dependency, 
maybe depends on DRM_KMS_HELPER being built-in ? (so that means drm_core 
will also be built-in). But that means platform that build drm core as 
module, won't be able to use drm_panic.

There are a few of them in the kernel tree:
rg -l CONFIG_DRM=m
arch/powerpc/configs/85xx/stx_gp3_defconfig
arch/powerpc/configs/ppc6xx_defconfig
arch/powerpc/configs/skiroot_defconfig
arch/powerpc/configs/pmac32_defconfig
arch/mips/configs/ci20_defconfig
arch/arc/configs/axs101_defconfig
arch/arc/configs/axs103_smp_defconfig
arch/riscv/configs/defconfig
arch/parisc/configs/generic-32bit_defconfig
arch/arm/configs/davinci_all_defconfig
arch/arm/configs/omap2plus_defconfig
arch/arm/configs/pxa_defconfig
arch/arm64/configs/defconfig

> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 

-- 

Jocelyn

