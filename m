Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB1464030E
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 10:17:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA0810E1AC;
	Fri,  2 Dec 2022 09:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D5410E1A4;
 Fri,  2 Dec 2022 09:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669972657; x=1701508657;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Qd1ehJKyyecx+01r3Eqduzd1h/9jtkcoJoyqJvgQ1fc=;
 b=Qstg2+Efoi6mbFhZJ8Dr8MA8Drf9X8mcnxvvgoDC37R4MC/PCt4wXkfx
 Ee44tNbkOZ/N0hKAdFldU8TMEGWBc3MtsXUSATyGZ1VsxDhCPz6IWzVbb
 q+b6/x4TWCJUwg9QQbv85V1IrsdauAtsCQBtNCkIRZDE6Hrhq7gi6DJ1p
 bVkKweDAim5bxkKWRNQwMSzWRDojSwzKLPNK0v6nPHsJ//Eou0FibeXS6
 7IAR4GD7k7vcvWhaNKuflOaCOD3FS5672VSEDY8tEP+bgpZRbVMl5MiXY
 2pjv6uxJ/PJ/CCTF40WFc6geWvYV0vbwqs62yhI2ElUjPp4gkwCBlCgod g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="342850752"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="342850752"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 01:17:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="751194382"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="751194382"
Received: from macematx-mobl1.ger.corp.intel.com (HELO [10.213.211.34])
 ([10.213.211.34])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 01:17:35 -0800
Message-ID: <a6cdde0b-47a1-967d-f2c4-9299618cb1fb@linux.intel.com>
Date: Fri, 2 Dec 2022 09:17:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH 0/2] drm/i915: Remove frontbuffer tracking
 from gem.
Content-Language: en-US
To: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20220825064701.768595-1-maarten.lankhorst@linux.intel.com>
 <3ec4e382c67ff7d8a1eb05e27b0fbf5fd1e272c6.camel@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <3ec4e382c67ff7d8a1eb05e27b0fbf5fd1e272c6.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 01/12/2022 22:03, Zanoni, Paulo R wrote:
> Hi
> 
> I was given a link to https://patchwork.freedesktop.org/series/111494/
> but can't seem to find it on the mailing list, so I'll reply here.
> 
> On Thu, 2022-08-25 at 08:46 +0200, Maarten Lankhorst wrote:
>> Frontbuffer tracking in gem is used in old drivers, but nowadays everyone
>> calls dirtyfb explicitly. Remove frontbuffer tracking from gem, and
>> isolate it to display only.
> 
> Ok, but then how can the Kernel know if the user space running is an
> "old driver" or a new one? Assuming everybody is following the new
> policy is at least risky.
> 
> (crazy idea: have an ioctl for user space to tell whether it knows how
> to DirtyFB and another where it can even say it will never be touching
> frontbuffers at all)
> 
> Also, when I wrote igt/kms_frontbuffer_tracking, it was agreed that
> whatever was there was a representation of the "rules" of the
> frontbfuffer writing contract/API. And I see on the link above that the
> basic tests of kms_frontbuffer_tracking fail. If
> kms_frontbuffer_tracking requires change due to i915.ko having changed
> the frontbuffer writing rules, then we should do it, and possibly have
> those rules written somewhere.
> 
> But then, having the Kernel change expectations like that is not
> exactly what I learned we should be doing, because it's the recipe to
> break user space.
> 
> I'm confused, please clarify us a little more. More sentences in the
> commit messages would be absolutely great.

Right, +1 - we need to be sure there aren't some binaries, running in a 
distro somewhere, or whatever, which rely on this and then we are not 
allowed to break them. As minimum at least we need an audit and versions 
to know how old libraries/programs we are talking about here ie. when 
did everyone stop relying on implicit tracking.

Regards,

Tvrtko
