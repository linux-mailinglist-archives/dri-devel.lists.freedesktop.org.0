Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AED924D1709
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 13:15:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D8210E4FB;
	Tue,  8 Mar 2022 12:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC9510E4FB
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 12:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646741702; x=1678277702;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Pj07O+oiBpvt9RG+DMy/vaA6wCldd0Kb1X9+1g+qKKk=;
 b=M+S+cSTH+f1AhDu2EqFNZ1ji3OJEygsqpD929zq+JJGs45bSf/Ko8ycN
 repdTR826i7w62O7bC+6Elo2xYivTdoKRK/Rih9frJ2m5S/AHT3OFvViw
 Eko99aTXJIQ1oyIzcKd1roB51bYsB9zm1KCks/hRrBmf8WJkStZf+UjbT
 7CbWSgvqFUL+PG/zdTfvQS7I03xW9oW5qdg2mXo6yqEFW0hhbIXAULfiI
 ILOJulEW4IwzZW9XtxBouZ8/Zg6ABOrwEFyWbjjatUAlxW2sO8CuVQ2lY
 HnsrSAv8fK+jbcRzOrjSY0AAjdilE/7J41iaahqJFUm8YGaQjnWlRWGg1 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="252240553"
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; d="scan'208";a="252240553"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 04:14:40 -0800
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; d="scan'208";a="537546642"
Received: from smile.fi.intel.com ([10.237.72.59])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 04:14:38 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nRYiw-00DLej-Di; Tue, 08 Mar 2022 14:13:54 +0200
Date: Tue, 8 Mar 2022 14:13:54 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/1] staging: fbtft: Consider type of init sequence
 values in fbtft_init_display()
Message-ID: <YidIgkiv7B8g14RD@smile.fi.intel.com>
References: <20220304193414.88006-1-andriy.shevchenko@linux.intel.com>
 <Yictcf0BCvveVT+V@smile.fi.intel.com> <Yic0CN+qSvDtSiEz@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yic0CN+qSvDtSiEz@kroah.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 08, 2022 at 11:46:32AM +0100, Greg Kroah-Hartman wrote:
> On Tue, Mar 08, 2022 at 12:18:25PM +0200, Andy Shevchenko wrote:
> > +Cc: Helge
> > 
> > Maybe you can pick this up?
> > 
> > On Fri, Mar 04, 2022 at 09:34:14PM +0200, Andy Shevchenko wrote:
> 
> You sent this less than a week ago!  Please relax, staging driver
> patches are way down my list of priorities at the moment.  Wait at least
> 2 weeks before trying to get someone else to take patches for this
> subsystem.
> 
> relax...

Ah, okay. Sorry, I was browsing my long mailbox and haven't paid attention on
the date I had sent this one on.

-- 
With Best Regards,
Andy Shevchenko


