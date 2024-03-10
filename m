Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B542877694
	for <lists+dri-devel@lfdr.de>; Sun, 10 Mar 2024 13:35:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D2F10E113;
	Sun, 10 Mar 2024 12:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.b="XrZGVqiL";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="m3RslpyQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod2-cph3.one.com
 (mailrelay4-1.pub.mailoutpod2-cph3.one.com [46.30.211.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222FE10E113
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Mar 2024 12:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=YPj7mJSOmbCaNiEGC/t0Gr13wSnOz33kScWhnHNog2A=;
 b=XrZGVqiLZ7HmxgauHv34KliKYg3bdIPWco3WbmOUS/lB8zsCC5CO+ZmGjgOxo2GjOG74rWmUTzeTD
 b/mY6sUBDEHan3+MiNqavhep1+qPHkyBDaWl6exwf4yZnQXZflm2ZNKhjgrSRP7oI7myR7O69SGebo
 XlYfPZUDqofK/AVeAQ8SbwF/6PyanxchTuw/gVeaNJjgYIqCt52w0/UnbwyIPRtB3Doc3R096J0hgI
 65BFZAHEQ6DOTY5XCc3HExn3ycYD4hb6fzaL/ouKN7wTNatsDLSWPfo0LIq8G88c92fKpkXAryb068
 idmG4syFCwOqfBYTzt3xyh947vR51BQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=YPj7mJSOmbCaNiEGC/t0Gr13wSnOz33kScWhnHNog2A=;
 b=m3RslpyQ6rat08/y9fWoWhKLFFXulH2lxA/XDZXt362zndzEJbzwHFpTAVufQTF1BKRUZp5V6l5Ws
 lWldjHQAQ==
X-HalOne-ID: 84422ca7-deda-11ee-9cef-31e85a7fa845
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
 id 84422ca7-deda-11ee-9cef-31e85a7fa845;
 Sun, 10 Mar 2024 12:34:22 +0000 (UTC)
Date: Sun, 10 Mar 2024 13:34:20 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: kernel test robot <lkp@intel.com>
Cc: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@kernel.org>,
 Andreas Larsson <andreas@gaisler.com>,
 oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Kjetil Oftedal <oftedal@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 14/28] sparc32: Drop unused mmu models
Message-ID: <20240310123420.GA989676@ravnborg.org>
References: <20240309-sunset-v2-14-f09912574d2c@ravnborg.org>
 <202403101854.Z94SAU13-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202403101854.Z94SAU13-lkp@intel.com>
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

Hi kernel test robot et al.

On Sun, Mar 10, 2024 at 06:37:53PM +0800, kernel test robot wrote:
> Hi Sam,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on 84b76d05828a1909e20d0f66553b876b801f98c8]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Sam-Ravnborg-via-B4-Relay/sparc32-Update-defconfig-to-LEON-SMP/20240310-021717
> base:   84b76d05828a1909e20d0f66553b876b801f98c8
> patch link:    https://lore.kernel.org/r/20240309-sunset-v2-14-f09912574d2c%40ravnborg.org
> patch subject: [PATCH v2 14/28] sparc32: Drop unused mmu models
> config: sparc-randconfig-r113-20240310 (https://download.01.org/0day-ci/archive/20240310/202403101854.Z94SAU13-lkp@intel.com/config)
> compiler: sparc-linux-gcc (GCC) 13.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20240310/202403101854.Z94SAU13-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403101854.Z94SAU13-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> arch/sparc/mm/srmmu.c:49:5: sparse: sparse: symbol 'vac_line_size' was not declared. Should it be static?
> 
> vim +/vac_line_size +49 arch/sparc/mm/srmmu.c
> 
> accf032cfa582e Sam Ravnborg   2012-05-19  46  
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  47  int vac_cache_size;
> 9d262d95114cf2 Guenter Roeck  2017-04-01  48  EXPORT_SYMBOL(vac_cache_size);
> ^1da177e4c3f41 Linus Torvalds 2005-04-16 @49  int vac_line_size;
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  50  

vac_line_size is no longer used and can be deleted.
vac_cache_size is never written to and can be deleted too.

vac_cache_size is used in shmparam_32.h like this:
#define SHMLBA (vac_cache_size ? vac_cache_size : PAGE_SIZE)

The same file has:
#define __ARCH_FORCE_SHMLBA	1

If I understand it right then when SHMLBA equals PAGE_SIZE then there is
no need to define __ARCH_FORCE_SHMLBA and sparc32 can use the asm-generic
variant of shmparam.h

I will do this change in v3.

	Sam
