Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0CF710CCA
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 15:00:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0539210E056;
	Thu, 25 May 2023 13:00:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00DF10E056;
 Thu, 25 May 2023 13:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685019640; x=1716555640;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=sysRDcJ5PcIGgiDH3puKplyNU5vE0qKwv6fsWRqQnDE=;
 b=Hscdu4GjoMDbrLdB4t43cVWW5xbb+virI4WrPpR2Xl8AvsD7QBFlMB53
 AerKM08ZksN5qVYNaOAVk0A2SoIuekPnQ5fQYzqtgCE1pTKxYjUfedtTw
 joqZH0zsPGRp0L5VwjPUMBR28XjFADHq2hKTUrdtt75FkVcN01ZdeZ9+H
 +6mSBthjl5IzRYrlSxpPZLFEzcGreoAnDnx1Jc+0qwmnUokbLxsGaEUIF
 tgtiieWbaB9wx3DM9JPDpH6H/RWuEJtcCK9y1teOzEkWTlAf4UZ65lwER
 7+pG5XNtaiUNjjvBhZ0XTva/8YHUUr5vXM691eg+PR/kzgf12Vhu5W2Se w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="440232175"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="440232175"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 06:00:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="737731211"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="737731211"
Received: from dlemiech-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.56.23])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 06:00:35 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Dave Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PULL] drm-intel-fixes
In-Reply-To: <ZG9aROGyc947/J1l@jlahtine-mobl.ger.corp.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <ZG9aROGyc947/J1l@jlahtine-mobl.ger.corp.intel.com>
Date: Thu, 25 May 2023 16:00:32 +0300
Message-ID: <874jo0k1lb.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 25 May 2023, Joonas Lahtinen <joonas.lahtinen@linux.intel.com> wrote:
> Hi Dave & Daniel,
>
> Here goes drm-intel-fixes for v4.6-rc4.

You're seven years late for that one. ;D

J.

>
> Again just one fix, for pipejoiner config pipe disabling.
>
> Regards, Joonas
>
> ***
>
> drm-intel-fixes-2023-05-25:
>
> PIPEDMC disabling fix for bigjoiner config
>
> The following changes since commit 44c026a73be8038f03dbdeef028b642880cf1511:
>
>   Linux 6.4-rc3 (2023-05-21 14:05:48 -0700)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-05-25
>
> for you to fetch changes up to 45dfbd992923f4df174db4e23b96fca7e30d73e2:
>
>   drm/i915: Fix PIPEDMC disabling for a bigjoiner configuration (2023-05-22 17:10:11 +0300)
>
> ----------------------------------------------------------------
> PIPEDMC disabling fix for bigjoiner config
>
> ----------------------------------------------------------------
> Imre Deak (1):
>       drm/i915: Fix PIPEDMC disabling for a bigjoiner configuration
>
>  drivers/gpu/drm/i915/display/intel_display.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
