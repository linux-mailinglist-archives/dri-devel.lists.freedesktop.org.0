Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD90706365
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 10:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA91C10E3C6;
	Wed, 17 May 2023 08:57:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0148710E3C6
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 08:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684313872; x=1715849872;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=i4ZR3iaeusalPkEACBO162RSA5D79eHRBor1gqPbdOM=;
 b=j4uiqrMgreBjByUfoACtQNVNKZpK+avHcObxm7pzizUmQld/FMBaLR7H
 sReyAZrsZpfiMoYA4FqTZ+w0w2aulolQGUX5eYmecTwBbZzr8WBf/RG8g
 hQcpx9fOWSi8oaPomLd8f+nWr2JUJ1t9U84k4UjbJNguQjtF0hUTn+PAY
 hmgP8tloqCGZPMNbhdwJPwhOlLSCDc2Ix8Xhq1M4oMTM5ebz69Sxp8/uC
 lJf71mvfHIs2wDnHOMp4V6VAmFSChcSuFSulAgDaLPwNnkwuLnPRrQD9l
 pBT1fb57ixKAfNfqZb1hCrnlguQ4myHOazFaPtRSfQ+zj5MVQtxCfH24j A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="349206072"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; d="scan'208";a="349206072"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 01:57:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="771388557"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; d="scan'208";a="771388557"
Received: from pakurapo-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.50.207])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 01:57:46 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, Antonino
 Daplas <adaplas@gmail.com>, Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] fbdev: i810: include i810_main.h in i810_dvt.c
In-Reply-To: <c28483ac-fbf3-494c-a634-d6edfb998d8f@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230516202814.561262-1-arnd@kernel.org>
 <87lehngxbr.fsf@intel.com>
 <c28483ac-fbf3-494c-a634-d6edfb998d8f@app.fastmail.com>
Date: Wed, 17 May 2023 11:57:43 +0300
Message-ID: <87ilcrgws8.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 17 May 2023, "Arnd Bergmann" <arnd@arndb.de> wrote:
> On Wed, May 17, 2023, at 10:46, Jani Nikula wrote:
>> On Tue, 16 May 2023, Arnd Bergmann <arnd@kernel.org> wrote:
>
>>>
>>> drivers/video/fbdev/i810/i810_dvt.c:280:5: error: conflicting types for 'i810_get_watermark'; have 'u32(struct fb_var_screeninfo *,
>>
>> Changes here look fine,
>>
>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>
> Thanks!
>
>> but I think you should try CONFIG_FB_I810_GTF=y to get the same
>> mismatched prototype error for i810_get_watermark() in i810_gtf.c, and
>> add the const there while at it. R-b stands for that addition as well.
>
> I'm fairly sure I looked at that and did not see a problem as
> i810_main.h is already included in that file, it was added
> in 2006 with commit a0aa7d063927 ("[PATCH] drivers/video/: possible
> cleanups").

True that, my bad. (Which kind of puts the R-b above in doubt, but hey,
at least I looked at it. ;)

BR,
Jani.

>
>      Arnd

-- 
Jani Nikula, Intel Open Source Graphics Center
