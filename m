Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4398744180
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 19:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A57210E4D5;
	Fri, 30 Jun 2023 17:42:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9BAB10E4D5
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 17:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688146963; x=1719682963;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6ISUeTd0XhjdV8+62msVXrrY1/WzccMTu3hMk/d62SY=;
 b=VpG+LmHeOXivnOR19WOYNKeKNmxB3iDkoSf06IEedCmvm/exclmt9fia
 nCpHQ2CHxgiY1sTTHJa7pXi8vvOOSaLgf1cKe5W5voy6rDU1DEJo94sxe
 IhQbYHBo5foSWn5G2RuQaJF9xIfrw/68OY/mixOFN9W/peLVT2J3vp0HI
 DJ5eH1qXdanGDHF4URr+HIYxpH8SxIqQ6aiq7ccEbDdcdzUkVpPX85vPo
 r8Fq2DAPQnUodowofvDiYr1Hr9TlFHgMoUP6zaK9rLlNqrqb0hUNXYzH1
 B6Px4UMDOq2gX9vqNqxS4lrPCROtUqEnuDy8D0OyvPk5BBoZcvxnzkIb7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="428497332"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="428497332"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 10:42:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="964480373"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="964480373"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga006.fm.intel.com with ESMTP; 30 Jun 2023 10:42:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qFI8T-001AUw-09; Fri, 30 Jun 2023 20:42:21 +0300
Date: Fri, 30 Jun 2023 20:42:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 0/2] Allow disabling all native fbdev drivers and only
 keeping DRM emulation
Message-ID: <ZJ8T/Fexkr9wEZoP@smile.fi.intel.com>
References: <20230629225113.297512-1-javierm@redhat.com>
 <ZJ8RY7ZUlryrPB50@smile.fi.intel.com>
 <878rc0etqe.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878rc0etqe.fsf@minerva.mail-host-address-is-not-set>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: x86@kernel.org, linux-fbdev@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, dri-devel@lists.freedesktop.org,
 "H. Peter Anvin" <hpa@zytor.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 30, 2023 at 07:38:01PM +0200, Javier Martinez Canillas wrote:
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:
> > On Fri, Jun 30, 2023 at 12:51:02AM +0200, Javier Martinez Canillas wrote:
> >> This patch series splits the fbdev core support in two different Kconfig
> >> symbols: FB and FB_CORE. The motivation for this is to allow CONFIG_FB to
> >> be disabled, while still having the the core fbdev support needed for the
> >> CONFIG_DRM_FBDEV_EMULATION to be enabled. The motivation is automatically
> >> disabling all fbdev drivers instead of having to be disabled individually.
> >> 
> >> The reason for doing this is that now with simpledrm, there's no need for
> >> the legacy fbdev (e.g: efifb or vesafb) drivers anymore and many distros
> >
> > How does simpledrm works with earlycon=efi?
> >
> 
> simpledrm isn't for earlycon. For that you use a different driver (i.e:
> drivers/firmware/efi/earlycon.c). I'm just talking about fbdev drivers
> here that could be replaced by simpledrm.

So, efifb can't be replaced. Please, fix your cover letter to reduce false
impression of the scope of usage of the simpledrm.

-- 
With Best Regards,
Andy Shevchenko


