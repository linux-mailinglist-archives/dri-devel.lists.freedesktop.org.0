Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B4229E5CF
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 09:08:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736FB6E861;
	Thu, 29 Oct 2020 08:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC4A6E851;
 Thu, 29 Oct 2020 08:08:11 +0000 (UTC)
IronPort-SDR: J9Kwal5LbTc3dOeVI6gc4K4krfiF8ZmiqwazCVvIQ4mPWy1n+uOLoYQrynSS1PpsJH9Og0allO
 NC4PiKr8iOqw==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="164896945"
X-IronPort-AV: E=Sophos;i="5.77,429,1596524400"; d="scan'208";a="164896945"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 01:08:11 -0700
IronPort-SDR: 1ERdDjGrx/J7sOsH3QvG4gMY/zSofpPUx8j92Nia8y6n1gFb3aB4W/qKviNg/UNmNdF0iSZKFC
 J46fCuGFZ+kw==
X-IronPort-AV: E=Sophos;i="5.77,429,1596524400"; d="scan'208";a="536574275"
Received: from rsexton-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.5.42])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 01:08:07 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>,
 DRI <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commit in the
 drm-intel-fixes tree
In-Reply-To: <160392160276.31966.3847690661999837078@build.alporthouse.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201029082823.5607849a@canb.auug.org.au>
 <160392160276.31966.3847690661999837078@build.alporthouse.com>
Date: Thu, 29 Oct 2020 10:08:05 +0200
Message-ID: <87ft5xihei.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 28 Oct 2020, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> Quoting Stephen Rothwell (2020-10-28 21:28:23)
>> Hi all,
>> 
>> Commit
>> 
>>   d13208a88f41 ("lockdep: Fix nr_unused_locks")
>> 
>> is missing a Signed-off-by from its author.
>> 
>> Also, the author's email name is missing the leading 'P'.
>
> And it shouldn't be in the drm-intel-fixes tree.

It's temporarily on top of the fixes branch to allow our CI to test the
branch. We weren't getting results on anything -rc1 based because of
this.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
