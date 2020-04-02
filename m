Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B96019D090
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 08:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CE16EB0C;
	Fri,  3 Apr 2020 06:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD1F6EADE
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 20:33:20 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id z5so4909636oth.9
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Apr 2020 13:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xjz9VfQ/qcp06gPRmgOFCZkqy7YVuSQylRbKQQtnWwA=;
 b=arbsatfEDTGt5U1xGl1CrxJPFSO78TybUI+NQpBL+jjl2EMsFYDL89UkVs/WXkBHrA
 KaHAIknSWiIVcHoBKDAvBvfo90xG0BmjvfRRErO1bxPMU9FJ8uDQQ29+lGkExI4jPa2S
 4XKf8c+5I/aLSFQXA5Xwb8VS2PnbURA0WjmtOKGtcrkrjhDsSjAeUreWU+22fxF5EWkI
 lZNFR924dx+r0nqejtDkW/dBsmHLNA/ktPOmx0yP9lAZN7cg7c5JrGRN6gGAlPTOl/Eh
 Zii1TrO3UdNaq64GPZIHLtjyBLmVJbKGvPReW0EocjHQmys+wnrKj8AMaZkMQXgBFvsb
 Fdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xjz9VfQ/qcp06gPRmgOFCZkqy7YVuSQylRbKQQtnWwA=;
 b=t5QDcyOa69CllaUnTTVDfVEPSzC9I5YVsOOb3pWtf9mqK9jot3CcB/0hgKDmhgMoT9
 ftTXLJos7xudj4QfvICcKjc2I+84SXT5hZ1vD85sqvU5PjZ7J2ACehrv9Qoc+6GVrKLE
 w4RtzrUmqt5Qsm4sHa+CI/kCQ8KkB+edocA2qwXQzZHCleOU4E+V1DCTjorONUw5TfW0
 svaUZ4bZOleTItsqRS8Fyv07llnC0rBaTFXp6BjvObZ5XpspZZhnYvKIuuQBxkfL7ytP
 eUSemR1rxA1hu/xh8V52npu0zJ34AOCUhQuXRzQfAifiAdwO3krTMU8iangjfemgs2tq
 8GTg==
X-Gm-Message-State: AGi0PuZHeftRlUkS9ObSti+h1ddHcFjRZjhf3N230SSt1Dqb6ZD7vQaH
 pDeZRP8X9leB0G5fsXRdcR8=
X-Google-Smtp-Source: APiQypIsr688F5pjBSs+9imenGbLkv72CD+nePG2AykbQLefKqbZynMew4T7z2ON+yf5A3hVd3gRZg==
X-Received: by 2002:a9d:7a9:: with SMTP id 38mr3858373oto.60.1585859600152;
 Thu, 02 Apr 2020 13:33:20 -0700 (PDT)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id 68sm1568699oon.14.2020.04.02.13.33.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 Apr 2020 13:33:19 -0700 (PDT)
Date: Thu, 2 Apr 2020 13:33:17 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [git pull] drm for 5.7-rc1
Message-ID: <20200402203317.GA34560@ubuntu-m2-xlarge-x86>
References: <CAPM=9twza_DeycOEhT+u6Erh0yFTAUe447J6bxWCLq5+QW8ZaA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPM=9twza_DeycOEhT+u6Erh0yFTAUe447J6bxWCLq5+QW8ZaA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 03 Apr 2020 06:54:15 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, chris@chris-wilson.co.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 01, 2020 at 03:50:42PM +1000, Dave Airlie wrote:
> Hey Linus,
> 
> This is the main drm pull request for 5.7-rc1.
> 
> Writing the changelog seemed a bit quieter, but it looks about average.
> 
> I've got a separate merge for some VM interactions for TTM huge pages, but I'll
> send that once this is landed.
> 
> It didn't seem to have many major conflicts, but my git trees have a bad habit
> of finding the shared rerere cache and lulling me into thinking it merged fine.
> 
> Highlights:
> i915 enables Tigerlake by default
> i915 and amdgpu have initial OLED backlight support
> vmwgfx add support to enable OpenGL 4 userspace
> zero length arrays are mostly removed.
> 
> Regards,
> Dave.

<snip>

>       drm: Remove the dma_alloc_coherent wrapper for internal usage

This patch causes a build regression on arm32 in certain configurations
(I found it with Debian's armmp config).

$ printf 'CONFIG_XEN=y\nCONFIG_DRM_LEGACY=y\n' >> arch/arm/configs/multi_v7_defconfig

$ make -j$(nproc) -s ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- defconfig drivers/gpu/drm/drm_bufs.o
drivers/gpu/drm/drm_bufs.c: In function 'drm_addmap_core':
drivers/gpu/drm/drm_bufs.c:328:8: error: passing argument 3 of 'dma_alloc_coherent' from incompatible pointer type [-Werror=incompatible-pointer-types]
  328 |        &map->offset,
      |        ^~~~~~~~~~~~
      |        |
      |        resource_size_t * {aka unsigned int *}
In file included from ./include/linux/pci-dma-compat.h:8,
                 from ./include/linux/pci.h:2392,
                 from ./include/drm/drm_pci.h:35,
                 from drivers/gpu/drm/drm_bufs.c:46:
./include/linux/dma-mapping.h:642:15: note: expected 'dma_addr_t *' {aka 'long long unsigned int *'} but argument is of type 'resource_size_t *' {aka 'unsigned int *'}
  642 |   dma_addr_t *dma_handle, gfp_t gfp)
      |   ~~~~~~~~~~~~^~~~~~~~~~
cc1: some warnings being treated as errors
make[4]: *** [scripts/Makefile.build:268: drivers/gpu/drm/drm_bufs.o] Error 1
make[3]: *** [scripts/Makefile.build:505: drivers/gpu/drm] Error 2
make[2]: *** [scripts/Makefile.build:505: drivers/gpu] Error 2
make[1]: *** [Makefile:1703: drivers] Error 2
make: *** [Makefile:328: __build_one_by_one] Error 2

This fixes it but I am not sure if it is proper or not (could be
problematic if CONFIG_PHYS_ADDR_T_64BIT is set but
CONFIG_ARCH_DMA_ADDR_T_64BIT is not, not sure if that is possible) so I
figured I'd report it and let you guys deal with it.

Cheers,
Nathan

diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index dcabf5698333..9282fd075424 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -325,7 +325,7 @@ static int drm_addmap_core(struct drm_device *dev, resource_size_t offset,
 		 * need to point to a 64bit variable first. */
 		map->handle = dma_alloc_coherent(&dev->pdev->dev,
 						 map->size,
-						 &map->offset,
+						 (dma_addr_t *)&map->offset,
 						 GFP_KERNEL);
 		if (!map->handle) {
 			kfree(map);
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
