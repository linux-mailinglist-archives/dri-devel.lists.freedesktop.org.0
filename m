Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF089EB482
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 16:18:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B7BD10E901;
	Tue, 10 Dec 2024 15:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uhr61iV0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B5D10E229;
 Tue, 10 Dec 2024 15:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733843920; x=1765379920;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MyYV/Dq/yh2N0al9eocpkchQGpyiruhLqw5oLkHPoWs=;
 b=Uhr61iV0hv6b9voivjgbHSz7TeblXiL9z8vd60S9JE1xFICnvuyDw2gV
 4udkcGa2o9pY4w38U4yUQfmxigF7ipa7V0q5OFlTSg5WMsTEX3Gb5nT7i
 z63xspzlFP1znUBGj8qosLSxiMXnCfQ0+1+Sh1YL2+GgM9uFiK8RmUSuP
 WDc4EFSkROMts5wcBJqJUVg87Yms/2khxe5gRAKhp3oR7v/GDFEEWaxHO
 6hxm01euYuY+ZZzaReIYn0FwylTQXTumTLjgWO29xGXWsii8JOPlcSIoX
 weFda0SbhTq5VqHpG/uROUfUN0WlzpJXRRGZo/f6U0KC0VD3CYLmwtg1E g==;
X-CSE-ConnectionGUID: 2EHTLealQleWQjWKWyTj8A==
X-CSE-MsgGUID: CyCdbUZJQW2TQOM6iDLq7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45206213"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="45206213"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 07:18:40 -0800
X-CSE-ConnectionGUID: A9Ohsn/hQfKsY0TvuxCS3w==
X-CSE-MsgGUID: WKZB0PDwSvqrhDvuB8FZxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="95255207"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.118.67])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 07:18:35 -0800
Date: Tue, 10 Dec 2024 16:18:32 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Genes Lists <lists@sapience.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 torvalds@linux-foundation.org, stable@vger.kernel.org,
 linux-media@vger.kernel.org, bingbu.cao@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: Linux 6.12.4 - crash dma_alloc_attrs+0x12b via ipu6
Message-ID: <Z1hbyNXUubokloda@linux.intel.com>
References: <2024120917-vision-outcast-85f2@gregkh>
 <c0e94be466b367f1a3cfdc3cb7b1a4f47e5953ae.camel@sapience.com>
 <Z1fqitbWlmELb5pj@kekkonen.localdomain> <87seqvzzg6.fsf@intel.com>
 <c1805642a6c5da6fef3927c70358c8cb851d2784.camel@sapience.com>
 <87bjxjzpwn.fsf@intel.com> <2024121001-senator-raffle-a371@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2024121001-senator-raffle-a371@gregkh>
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

On Tue, Dec 10, 2024 at 01:37:11PM +0100, Greg Kroah-Hartman wrote:
> On Tue, Dec 10, 2024 at 02:24:56PM +0200, Jani Nikula wrote:
> > On Tue, 10 Dec 2024, Genes Lists <lists@sapience.com> wrote:
> > > On Tue, 2024-12-10 at 10:58 +0200, Jani Nikula wrote:
> > >> On Tue, 10 Dec 2024, Sakari Ailus <sakari.ailus@linux.intel.com>
> > >> wrote:
> > >> > Hi,
> > >> > 
> > >> > > ...
> > >> > > FYI 6.12.4 got a crash shortly after booting in dma_alloc_attrs -
> > >> > > maybe
> > >> > > triggered in ipu6_probe. Crash only happened on laptop with ipu6.
> > >> > > All
> > >> > > other machines are running fine.
> > >> > 
> > >> > Have you read the dmesg further than the IPU6 related warning? The
> > >> > IPU6
> > >> > driver won't work (maybe not even probe?) but if the system
> > >> > crashes, it
> > >> > appears unlikely the IPU6 drivers would have something to do with
> > >> > that.
> > >> > Look for warnings on linked list corruption later, they seem to be
> > >> > coming
> > >> > from the i915 driver.
> > >> 
> > >> And the list corruption is actually happening in
> > >> cpu_latency_qos_update_request(). I don't see any i915 changes in
> > >> 6.12.4
> > >> that could cause it.
> > >> 
> > >> I guess the question is, when did it work? Did 6.12.3 work?
> > >> 
> > >> 
> > >> BR,
> > >> Jani.
> > >
> > >
> > >  - 6.12.1 worked
> > >
> > >  - mainline - works (but only with i915 patch set [1] otherwise there
> > > are no graphics at all)
> > >
> > >     [1] https://patchwork.freedesktop.org/series/141911/
> > >
> > > - 6.12.3 - crashed (i see i915 not ipu6) and again it has       
> > >     cpu_latency_qos_update_request+0x61/0xc0
> > 
> > Thanks for testing.
> > 
> > There are no changes to either i915 or kernel/power between 6.12.1 and
> > 6.12.4.
> > 
> > There are some changes to drm core, but none that could explain this.
> > 
> > Maybe try the same kernels a few more times to see if it's really
> > deterministic? Not that I have obvious ideas where to go from there, but
> > it's a clue nonetheless.
> 
> 'git bisect' would be nice to run if possible...

I've reproduced the issue. It's caused by 6.12.y commit:

commit 6ac269abab9ca5ae910deb2d3ca54351c3467e99
Author: Bingbu Cao <bingbu.cao@intel.com>
Date:   Wed Oct 16 15:53:01 2024 +0800

    media: ipu6: not override the dma_ops of device in driver

    [ Upstream commit daabc5c64703432c4a8798421a3588c2c142c51b ]


It makes alloc_fw_msg_bufs() fail on isys_probe() 

	cpu_latency_qos_add_request(&isys->pm_qos, PM_QOS_DEFAULT_VALUE);

	ret = alloc_fw_msg_bufs(isys, 20);
	if (ret < 0)
		goto out_remove_pkg_dir_shared_buffer;

And on error path we do not call cpu_latency_qos_remove_request() 
what cause pm_qos_request list corruption (it is memory use
after free bug).

The problem will disappear after applying:
https://lore.kernel.org/stable/20241209175416.59433-1-stanislaw.gruszka@linux.intel.com/
since the allocation will not longer fail.

But we also need to handle fail case correctly by adding
cpu_latency_qos_remove_request() on error path. This requires
mainline fix, I'll post it. 

Regards
Stanislaw
