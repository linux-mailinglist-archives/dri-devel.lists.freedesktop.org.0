Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BAA8CAB7B
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 12:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C9A10E3A6;
	Tue, 21 May 2024 10:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tym57jYs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5C410E3A6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 10:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716286000; x=1747822000;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=TL/Hebw/cR3HdeXT4clEBuQLfRLYqNgtJMFnQJo7xPU=;
 b=Tym57jYs4eH35WsVRKGrpFzBZZYsGnRdp/eb8Aw/gfnroqw8U/ZmbLmy
 +9/tuW61cC+w3Xv9LkEVohGxbvL7cSpWSM/NMog922AGmK7d7OWRKALpU
 trGD6tu9f5jz3WW37Xp2tYhwRFNqe5fiRmYp5ZRSnL91SIsPgLcVB/Yy2
 JElJzx4h7mdqWuGscQwUVuyDDZo0hnKeNAIhCWxgDsPJYDEaZWyz+6IdM
 uQOIrb9ykeSsBxBNbWQbzHeahouSV3jSsUWpwQznwl9C/pwGMpzsEINKn
 FOel8V/Fs7LfpgwVCMZd0mkwGbnomp9Bfte8wFQmpkWEMR817pM9zxmo1 A==;
X-CSE-ConnectionGUID: CAuD8zhGT3qk2wq7N5889Q==
X-CSE-MsgGUID: KRaRu6KZRSWZeiZbE2knfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12404726"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="12404726"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 03:06:39 -0700
X-CSE-ConnectionGUID: SqDh5jmjSj6fYZKhh+g2ww==
X-CSE-MsgGUID: RSXCnzgiRRyw+Zhy4sRgXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="32906419"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.160])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 03:06:36 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: nerdopolis <bluescreen_avenger@verizon.net>,
 dri-devel@lists.freedesktop.org
Cc: Pekka Paalanen <pekka.paalanen@haloniitty.fi>, Thomas Zimmermann
 <tzimmermann@suse.de>, Jonas =?utf-8?Q?=C3=85dahl?= <jadahl@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: simpledrm, running display servers, and drivers replacing
 simpledrm while the display server is running
In-Reply-To: <9215788.EvYhyI6sBW@nerdopolis2>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <9215788.EvYhyI6sBW.ref@nerdopolis2>
 <9215788.EvYhyI6sBW@nerdopolis2>
Date: Tue, 21 May 2024 13:06:34 +0300
Message-ID: <87pltfqy1h.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 09 May 2024, nerdopolis <bluescreen_avenger@verizon.net> wrote:
> Hi
>
> So I have been made aware of an apparent race condition of some drivers taking a bit longer to load, which could lead to a possible race condition of display servers/greeters using the simpledrm device, and then experiencing problems once the real driver loads, the simpledrm device that the display servers are using as their primary GPU goes away. 
>
> For example Weston crashes, Xorg crashes, wlroots seems to stay running, but doesn't draw anything on the screen, kwin aborts, 
> This is if you boot on a QEMU machine with the virtio card, with modprobe.blacklist=virtio_gpu, and then, when the display server is running, run sudo modprobe virtio-gpu
>
> Namely, it's been recently reported here: https://github.com/sddm/sddm/issues/1917[1] and here https://github.com/systemd/systemd/issues/32509[2]
>
> My thinking: Instead of simpledrm's /dev/dri/card0 device going away when the real driver loads, is it possible for simpledrm to instead simulate an unplug of the fake display/CRTC?
> That way in theory, the simpledrm device will now be useless for drawing for drawing to the screen at that point, since the real driver is now taken over, but this way here, at least the display server doesn't lose its handles to the /dev/dri/card0 device, (and then maybe only remove itself once the final handle to it closes?)
>
> Is something like this possible to do with the way simpledrm works with the low level video memory? Or is this not possible?

Related [1][2].

BR,
Jani.


[1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10133
[2] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11158


>
> Thanks
>
> --------
> [1] https://github.com/sddm/sddm/issues/1917
> [2] https://github.com/systemd/systemd/issues/32509

-- 
Jani Nikula, Intel
