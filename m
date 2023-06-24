Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3912E73C628
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 03:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C591610E6FE;
	Sat, 24 Jun 2023 01:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F226D10E6FE
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 01:55:32 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-51b4ef5378bso1071707a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 18:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687571732; x=1690163732;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=QARueVM5NgEI8ly6kngoX66nkjJ1HIAQ25yUVJM/M7k=;
 b=jnZC2ybL2QP1QYE4yr+wvqkrseWiA9e6NoqP59ZFdonp0a0kyhkp+nxwBRo6v1Y6Z/
 YBydA7V4cijiWmqQJyW4qnDfnVFc68PWFrCyQW3WfyV83ZcXiNsnDb36P/IPvxrgawFQ
 PdsKZv5Qeij8R+FWyRTJSBaFp39sDmm1TEDZXejL81ABXEvWRWyW8842SfLapBaR16sF
 vD+ELtc/pHAw+pFteF4AqHPumHwOHQ8Xukac1UTuqCAW8wrP8Mwv7RW0ehQhkTSuQINb
 3rHDLxwqMxX1Ty8DNYaLL6kO4Y4zAIst7+KWnQ3JQ6oIvuvnGT2NsAhP5/RdOvdpuSiy
 65Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687571732; x=1690163732;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QARueVM5NgEI8ly6kngoX66nkjJ1HIAQ25yUVJM/M7k=;
 b=OXMbq57mSxyBUwdoKyZin4sVb3KZGU7QgpHE+AJPtF6ihmXPu6397kjDj9PUUIgH49
 w2RjfPCGHV6aPf05fYAH9h9sgsYyEXojIleHuSZ3l/xwE9g/Hu1eWFUiDeZUlQuL7op4
 DbJBN1tuor6R3Isulo5WwWrrGY6rM0ZoT+2L6iszYphA2avXYeWnjvKBCND4+N91fqNv
 t4o7Jzo1pCMbXUvQ4er3e+wbfi2AzsOZbI7ToW0PDSpHqyW17dr2XQLQSdYQD2Ssavvg
 taOsMyadPYNxU5FqIK+xmqZGxV/uv1qMnulKuTZQtiKEdpZvLRBOyoiOMIaUWw+vYh3R
 Kelw==
X-Gm-Message-State: AC+VfDwmD0Jiuw9rQzyBaXFCcUmLC+1pXIPZ32Z4jtyzdAAks9tse4DD
 MYcgSl1I57wweFplw7Qv/84=
X-Google-Smtp-Source: ACHHUZ7EKMVxU8TWRgRU9+XwK7LYVXWH3v+gEDo5Epfh8lUR0ifndnY3uj+0AVLI0zG/i3TrUbosxA==
X-Received: by 2002:a17:902:d50c:b0:1b0:4a37:9ccc with SMTP id
 b12-20020a170902d50c00b001b04a379cccmr736136plg.62.1687571731937; 
 Fri, 23 Jun 2023 18:55:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 jn16-20020a170903051000b001b53472353csm172067plb.211.2023.06.23.18.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 18:55:31 -0700 (PDT)
Date: Fri, 23 Jun 2023 18:55:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [v3,17/19] arch/sparc: Implement fb_is_primary_device() in
 source file
Message-ID: <c525adc9-6623-4660-8718-e0c9311563b8@roeck-us.net>
References: <20230417125651.25126-18-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230417125651.25126-18-tzimmermann@suse.de>
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, arnd@arndb.de, linux-sh@vger.kernel.org,
 daniel.vetter@ffwll.ch, deller@gmx.de, x86@kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
 gregkh@linuxfoundation.org, sparclinux@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Apr 17, 2023 at 02:56:49PM +0200, Thomas Zimmermann wrote:
> Other architectures implment fb_is_primary_device() in a source
> file. Do the same on sparc. No functional changes, but allows to
> remove several include statement from <asm/fb.h>.
> 
> v2:
> 	* don't include <asm/prom.h> in header file
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: "David S. Miller" <davem@davemloft.net>

This patch results (or appears to result) in the following build error
when trying to build sparc64:allmodconfig.

Error log:
<stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
WARNING: modpost: drivers/cpufreq/sparc-us2e-cpufreq: section mismatch in reference: cpufreq_us2e_driver+0x20 (section: .data) -> us2e_freq_cpu_init (section: .init.text)
WARNING: modpost: drivers/cpufreq/sparc-us3-cpufreq: section mismatch in reference: cpufreq_us3_driver+0x20 (section: .data) -> us3_freq_cpu_init (section: .init.text)
ERROR: modpost: missing MODULE_LICENSE() in arch/sparc/video/fbdev.o
ERROR: modpost: "__xchg_called_with_bad_pointer" [lib/atomic64_test.ko] undefined!

Bisect log attached. Note that I suspect that there are several problems,
but that is difficult to determine since this patch can not easily
be reverted.

Guenter

---
# bad: [8d2be868b42c08290509c60515865f4de24ea704] Add linux-next specific files for 20230623
# good: [45a3e24f65e90a047bef86f927ebdc4c710edaa1] Linux 6.4-rc7
git bisect start 'HEAD' 'v6.4-rc7'
# good: [a5838c78db6a3a02e8d221e588c948f792e7f256] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git
git bisect good a5838c78db6a3a02e8d221e588c948f792e7f256
# bad: [cca41cc0b5485a0ec20707316c1a00082c01a2af] Merge branch 'for-next' of git://git.kernel.dk/linux-block.git
git bisect bad cca41cc0b5485a0ec20707316c1a00082c01a2af
# bad: [901bdf5ea1a836400ee69aa32b04e9c209271ec7] Merge tag 'amd-drm-next-6.5-2023-06-09' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
git bisect bad 901bdf5ea1a836400ee69aa32b04e9c209271ec7
# good: [c2d2588c702364ff53916ddd97e2b26fd4f4a317] drm/amdkfd: add send exception operation
git bisect good c2d2588c702364ff53916ddd97e2b26fd4f4a317
# bad: [1b842f73edbb1f8513ef4a89389176c628dc014a] drm/i915/guc: Remove some obsolete definitions
git bisect bad 1b842f73edbb1f8513ef4a89389176c628dc014a
# bad: [b8887e796e06b1de4db899f49d531d220f94f393] Merge tag 'drm-misc-next-2023-05-24' of git://anongit.freedesktop.org/drm/drm-misc into drm-next
git bisect bad b8887e796e06b1de4db899f49d531d220f94f393
# bad: [bfdede3a58ea970333d77a05144a7bcec13cf515] drm/rockchip: cdn-dp: call drm_connector_update_edid_property() unconditionally
git bisect bad bfdede3a58ea970333d77a05144a7bcec13cf515
# good: [b50f6d465ac1fb37cab7bfb39ac6c9fb9d8e3716] arch/powerpc: Implement <asm/fb.h> with generic helpers
git bisect good b50f6d465ac1fb37cab7bfb39ac6c9fb9d8e3716
# bad: [322d716a3e8a74fb75cd0f657647be4df253fd2f] drm/vkms: isolate pixel conversion functionality
git bisect bad 322d716a3e8a74fb75cd0f657647be4df253fd2f
# bad: [55b24786b74863b8f10e4d262e642749911cb3bb] drm/display: Add missing OLED Vesa brightnesses definitions
git bisect bad 55b24786b74863b8f10e4d262e642749911cb3bb
# bad: [1c9da7db8899fa0e891997118d75b46d38102497] drm/armada: Include <linux/of.h>
git bisect bad 1c9da7db8899fa0e891997118d75b46d38102497
# bad: [db76f19a607d6cf4a9d5868d05675c355e99809c] arch/sparc: Implement <asm/fb.h> with generic helpers
git bisect bad db76f19a607d6cf4a9d5868d05675c355e99809c
# bad: [4eec0b3048fcd74b504c2a6828a07f133a8ab508] arch/sparc: Implement fb_is_primary_device() in source file
git bisect bad 4eec0b3048fcd74b504c2a6828a07f133a8ab508
# good: [b6cf29637be638a6846d2d297d80cf7c6fb74faf] arch/sh: Implement <asm/fb.h> with generic helpers
git bisect good b6cf29637be638a6846d2d297d80cf7c6fb74faf
# first bad commit: [4eec0b3048fcd74b504c2a6828a07f133a8ab508] arch/sparc: Implement fb_is_primary_device() in source file
