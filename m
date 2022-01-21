Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E057495C8B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 10:09:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D208B10E999;
	Fri, 21 Jan 2022 09:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA7710E999
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 09:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642756174; x=1674292174;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=FtxghI/3srHjFevRT1v1DlUkGCseUklGodDeUCzopWs=;
 b=PBm0sjedALO8M9pTO18bd9mglWmiLNMLpXFI+MWV8p1IazYm/30lEdxq
 AAw+Zol6IhVN5ZW4QUjpIJ//5bCIG6BitHnocVHLNG6evQNcAmTn4FwcO
 WbmBZ7+PdyN/v3RBJSOMQbyMEjsSSTHhDBOPbK68pOrhLywLmyR4wQgy8
 gvxdNIBDteKrF045HDTr7f3J+k6HkH0hNHlE55G/JffaozpW/b3GoAB48
 LRd6OiLSD7tnVA67wUKddnOR2k+M133JdMmUErjmo8RzZU0HyFoDCj5Xf
 KfyleCxbDhD5oqM4OivuQUYBwBcU+n418XBUTnbXphPJHJ0HA2cMMh80L A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245394606"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="245394606"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 01:09:31 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="533198110"
Received: from chandra2-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.48.104])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 01:09:28 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>
Subject: Re: [GIT PULL] fbdev updates & fixes for v5.17-rc1
In-Reply-To: <CAKMK7uGeGBBvTGFyBxLwvTAxEWwXMS8U1rrYUb_7gbui-jV+KA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <Yeg11pHSqx29yg/T@ls3530>
 <CAKMK7uGeGBBvTGFyBxLwvTAxEWwXMS8U1rrYUb_7gbui-jV+KA@mail.gmail.com>
Date: Fri, 21 Jan 2022 11:09:21 +0200
Message-ID: <87fsph4fr2.fsf@intel.com>
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
Cc: linux-fbdev@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 21 Jan 2022, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Wed, Jan 19, 2022 at 5:02 PM Helge Deller <deller@gmx.de> wrote:
>> A first bunch of updates and fixes for the following fbdev & backlight drivers:
>> ocfb, aty128fb, mb862xx, omapfb, qcom-wled, dt-bindings, hyperv_fb,
>> lm3630a_bl, omap2, controlfb, matroxfb
>>
>> Nothing really important, mostly cleanups, const conversions, added null
>> pointer/boundary checks and build fixes.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>
> Not sure whether Linus missed this or just wanted to let the
> discussion settle first. But since this is all random patches for
> drivers that many distros don't even enable anymore there's no issues
> here, and I very much welcome someone volunteering to pick these up.
> I'd expect there's a pile more since it's been 1-2 years since Bart
> took care of these and merged them consistently.
>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

...

>>  drivers/video/backlight/lm3630a_bl.c                     |  1 -
>>  drivers/video/backlight/qcom-wled.c                      |  1 +

Backlight changes usually go through the backlight tree.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
