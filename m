Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7D9591EDA
	for <lists+dri-devel@lfdr.de>; Sun, 14 Aug 2022 09:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E662DC67B7;
	Sun, 14 Aug 2022 07:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A09B7B9E
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Aug 2022 07:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660460753; x=1691996753;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=K4tl8ZYGeFhA+U5umZeSuWeZdwow0wgZ4xqCXX2El6g=;
 b=kWvKwX7OzNs1TUZsS9yMEWQHdEB3sblq+R5Fh2Ze1GOt4AfelNr7+LmY
 6H5ejAD/h+c/FvGfxb4o5oh33Cux77Md4EoYv+8n/1j6kQjvV2ep9jgSE
 lp/oVg/3QRcC7CUpryTpBVFxqQxAhsR8VzdozcS2GfE6oPyeJVMStkccF
 L3dyiXovgMtgLpzoWxud9uG53yeMK6XB8ZhXYoxH4XOG3IgUxaQhMvE/F
 uUv212PP1sGnKWCl3bRTcnXhjDZayMxxqy1siL2D/g5og3SM3wHXrMALy
 NrYTNazXPoG52um4p+MZ3LnabiO2BkwFm2QkLiY1kjQDPXOl/gBaywyY5 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="274857781"
X-IronPort-AV: E=Sophos;i="5.93,236,1654585200"; d="scan'208";a="274857781"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2022 00:05:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,236,1654585200"; d="scan'208";a="695675504"
Received: from lkp-server02.sh.intel.com (HELO 8745164cafc7) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Aug 2022 00:05:46 -0700
Received: from kbuild by 8745164cafc7 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oN7gv-0002bb-1c;
 Sun, 14 Aug 2022 07:05:45 +0000
Date: Sun, 14 Aug 2022 15:04:57 +0800
From: kernel test robot <lkp@intel.com>
To: Markuss Broks <markuss.broks@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] efi: earlycon: Add support for generic
 framebuffers and move to console subsystem
Message-ID: <202208141430.Ez8EkEwO-lkp@intel.com>
References: <20220806163255.10404-4-markuss.broks@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220806163255.10404-4-markuss.broks@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-efi@vger.kernel.org,
 Markuss Broks <markuss.broks@gmail.com>, linux-doc@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Wei Ming Chen <jj251510319013@gmail.com>, phone-devel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-serial@vger.kernel.org,
 Borislav Petkov <bp@suse.de>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Michal Suchanek <msuchanek@suse.de>,
 kbuild-all@lists.01.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Markuss,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on efi/next staging/staging-testing usb/usb-testing linus/master v5.19 next-20220812]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Markuss-Broks/Add-generic-framebuffer-support-to-EFI-earlycon-driver/20220807-003646
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
config: x86_64-kismet-CONFIG_FB_EARLYCON-CONFIG_EFI_EARLYCON-0-0 (https://download.01.org/0day-ci/archive/20220814/202208141430.Ez8EkEwO-lkp@intel.com/config)
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/97dfc2aa69b065de769a191352afe2099c52fedb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Markuss-Broks/Add-generic-framebuffer-support-to-EFI-earlycon-driver/20220807-003646
        git checkout 97dfc2aa69b065de769a191352afe2099c52fedb
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/README.md
           kismet --linux-ksrc=linux --selectees CONFIG_FB_EARLYCON --selectors CONFIG_EFI_EARLYCON -a=x86_64
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=x86_64 olddefconfig

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for FB_EARLYCON when selected by EFI_EARLYCON
   
   WARNING: unmet direct dependencies detected for FB_EARLYCON
     Depends on [n]: VT [=y] && SERIAL_EARLYCON [=n] && !ARM && !IA64
     Selected by [y]:
     - EFI_EARLYCON [=y] && EFI [=y]

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
