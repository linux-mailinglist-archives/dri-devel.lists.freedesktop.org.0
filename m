Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A00EF744182
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 19:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 042D110E4D6;
	Fri, 30 Jun 2023 17:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E54010E4D6
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 17:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688147037; x=1719683037;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=I1kCbYOYtU84AgQILFjkzypl9YavoPrVMeRutm6k2fc=;
 b=AsugjCQyx2/u5vKd1YhsqwnqcF34OECaCxEI56B/Cduh5s2u6nhoAjW1
 ap9F2lNLPXe8nsqWXP6OUQq5O2HQ1YFaXm7T5nN9xp61/Nu2cYclKKDNF
 BuA3ObnpIUR1kjYYLRuhvTq9VZHsAMsg+PEi9C+snjTAx9DFJECVxnlWI
 ynsGKgzAXZArx28IQu4YasgHyKx23acldAdFHlMcfPNU5SfrONCv4piQF
 wwQbCj2/1fLs5anCUN1KtSWGGfbOcaXp06jAmtYsddEvkWvORm5WU/Nfc
 FlIpyMlg0uWdi8KH9j9VabT+9LHZrLmlZX3VY4CfVf8uK6Ka6bawT50aI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="352273552"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="352273552"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 10:43:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="787790740"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="787790740"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga004.fm.intel.com with ESMTP; 30 Jun 2023 10:43:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qFI9s-001AXB-1Z; Fri, 30 Jun 2023 20:43:48 +0300
Date: Fri, 30 Jun 2023 20:43:48 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 0/2] Allow disabling all native fbdev drivers and only
 keeping DRM emulation
Message-ID: <ZJ8UVHEWXu1Jrg+I@smile.fi.intel.com>
References: <20230629225113.297512-1-javierm@redhat.com>
 <ZJ8RY7ZUlryrPB50@smile.fi.intel.com>
 <878rc0etqe.fsf@minerva.mail-host-address-is-not-set>
 <ZJ8T/Fexkr9wEZoP@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJ8T/Fexkr9wEZoP@smile.fi.intel.com>
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

On Fri, Jun 30, 2023 at 08:42:21PM +0300, Andy Shevchenko wrote:
> On Fri, Jun 30, 2023 at 07:38:01PM +0200, Javier Martinez Canillas wrote:
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:
> > > On Fri, Jun 30, 2023 at 12:51:02AM +0200, Javier Martinez Canillas wrote:

...

> > >> The reason for doing this is that now with simpledrm, there's no need for
> > >> the legacy fbdev (e.g: efifb or vesafb) drivers anymore and many distros
> > >
> > > How does simpledrm works with earlycon=efi?
> > >
> > 
> > simpledrm isn't for earlycon. For that you use a different driver (i.e:
> > drivers/firmware/efi/earlycon.c). I'm just talking about fbdev drivers
> > here that could be replaced by simpledrm.
> 
> So, efifb can't be replaced. Please, fix your cover letter to reduce false
> impression of the scope of usage of the simpledrm.

Or tell how it can be used for earlycon on EFI platforms (if it can be).

-- 
With Best Regards,
Andy Shevchenko


