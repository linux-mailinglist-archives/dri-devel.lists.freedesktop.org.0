Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 240BD620F09
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 12:27:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB9710E3BE;
	Tue,  8 Nov 2022 11:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B021310E3BE;
 Tue,  8 Nov 2022 11:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667906858; x=1699442858;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=hNS3Nr4O3q2nSkHc9K7N1maRZdTfnniUECgjB38Ewlg=;
 b=ZBv4/DG+MMvc2xvOETlW4MROinHWmMIokOaa9fvJ2dZ/vix7a1qx/pq1
 4BvARz6ID2K/h+XYIMVskTp6aZwQboFGi/TvAZye/U7SO2JpcWW8Xhvcx
 FV89eQX8kLvLxP/RkDLsb1lnqG8P0D09B+panuH49yFSG2f/oqNWBXM/q
 dYDWJ1gDX5SmNC8JzPLbFUztO5px4oT8iv3rPVRr7uaj+KViiKbgbH2K7
 mz9PZCBOP7ViVrcrLJDofLVXPoa+D3XJYtYbHKWI51NJmi4AKv3e3Mw50
 fqXbWr728tyVQ9+TIQDRHtRGtuJD5x1+RXO5ZzW+DX3L+0KvJuQu7PdSY Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="309380443"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; d="scan'208";a="309380443"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 03:27:37 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="630843213"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; d="scan'208";a="630843213"
Received: from smoriord-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.16.110])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 03:27:35 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Matthieu CHARETTE <matthieu.charette@gmail.com>
Subject: Re: [PATCH] drm/edid/firmware: stop using throwaway platform device
In-Reply-To: <0TLXKR.MU9V2CJGXH05@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221006222146.2375217-1-jani.nikula@intel.com>
 <GLSKJR.CU4DWLJQSTHT2@gmail.com> <87wn96yggd.fsf@intel.com>
 <CA+FNwmJRZ-5BwuXykp3R6tQagQgunMC9EhfL9CRyi+Ff47TXhA@mail.gmail.com>
 <87v8opwiqw.fsf@intel.com> <HBHNJR.ME9DMISWT3961@gmail.com>
 <0TLXKR.MU9V2CJGXH05@gmail.com>
Date: Tue, 08 Nov 2022 13:27:33 +0200
Message-ID: <875yfpadp6.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 06 Nov 2022, Matthieu CHARETTE <matthieu.charette@gmail.com> wrote:
> Hi,
>
> Can you tell me what are we waiting for? Maybe I can help.

Have you tried the patch? Is it an improvement over the status quo?

The "crash" is still ambiguous to me. Do you observe it with the patch?
Do you have logs? Etc.

BR,
Jani.


>
> Thanks.
>
> Matthieu
>
> On Wed, Oct 12 2022 at 07:16:29 PM +0200, Matthieu CHARETTE 
> <matthieu.charette@gmail.com> wrote:
>> By crash, I mean that an error is returned here: 
>> https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux.git/+/refs/heads/master/drivers/gpu/drm/drm_edid_load.c#195
>> I don't really know what happens next, but on my machine the built-in 
>> screen and the external remains dark. Also the kernel seems to 
>> freeze. I suspect a kernel panic, but I'm not sure. Anyway, the error 
>> is definitely not well handled, and a fix would be great.
>> Also, request_firmware() will crash if called for the first time on 
>> the resume path because the file system isn't reachable on the resume 
>> process. And no cache is available for this firmware. So I guess that 
>> in this case, request_firmware() returns an error.
>> Suspend-plug-resume case is not my priority nether as long as it 
>> doesn't make the system crash (Which is currently the case).
>> 
>> On Wed, Oct 12 2022 at 11:25:59 AM +0300, Jani Nikula 
>> <jani.nikula@intel.com> wrote:
>>> On Tue, 11 Oct 2022, Matthieu CHARETTE <matthieu.charette@gmail.com> 
>>> wrote:
>>>>  Currently the EDID is requested during the resume. But since it's
>>>>  requested too early, this means before the filesystem is mounted, 
>>>> the
>>>>  firmware request fails. This make the DRM driver crash when 
>>>> resuming.
>>>>  This kind of issue should be prevented by the firmware caching 
>>>> process
>>>>  which cache every firmware requested for the next resume. But 
>>>> since we
>>>>  are using a temporary device, the firmware isn't cached on suspend
>>>>  since the device doesn't work anymore.
>>>>  When using a non temporary device to get the EDID, the firmware 
>>>> will
>>>>  be cached on suspend for the next resume. So requesting the 
>>>> firmware
>>>>  during resume will succeed.
>>>>  But if the firmware has never been requested since the boot, this
>>>>  means that the monitor isn't plugged since the boot. The kernel 
>>>> will
>>>>  not be caching the EDID. So if we plug the monitor while the 
>>>> machine
>>>>  is suspended. The resume will fail to load the firmware. And the 
>>>> DRM
>>>>  driver will crash.
>>>>  So basically, your fix should solve the issue except for the case
>>>>  where the monitor hasn't been plugged since boot and is plugged 
>>>> while
>>>>  the machine is suspended.
>>>>  I hope I was clear. Tell me if I wasn't. I'm not really good at 
>>>> explaining.
>>> 
>>> That was a pretty good explanation. The only thing I'm missing is 
>>> what
>>> the failure mode is exactly when you claim the driver will crash. Why
>>> would request_firmware() "crash" if called for the first time on the
>>> resume path?
>>> 
>>> I'm not sure I care much about not being able to load the firmware 
>>> EDID
>>> in the suspend-plug-resume case (as this can be remedied with a
>>> subsequent modeset), but obviously any errors need to be handled
>>> gracefully, without crashing.
>>> 
>>> BR,
>>> Jani.
>>> 
>>> 
>>> --
>>> Jani Nikula, Intel Open Source Graphics Center
>> 
>> 
>
>

-- 
Jani Nikula, Intel Open Source Graphics Center
