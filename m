Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9CD8C3C32
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 09:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1410610E035;
	Mon, 13 May 2024 07:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y4WRQ6CQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B753510E035
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 07:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715586225; x=1747122225;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=sta3WVSfyvxwITpMwLodobPQ4heyFgBUQw+Kf2WG49U=;
 b=Y4WRQ6CQI8i7TaJZ86G3ek+A1J+VOutIGk2ZE7oihUgrRh49fluVcVZ+
 WotsQgAxNiOW2OCIiKs1BRKe+DVUYEt0WHy5VazPIgYQlRGcNkrfRepae
 J0WoR6Hknp/d2UeUPAlXPgH7Hde9DJDKGcAOJfq/JQKtGQ69Rj8fFlNyo
 XlQVsXtManhGOAhlEZU+NBIMQgo7Zk19g6sfcoJHCDijJ5KQRvgT//Ckj
 t27GhN9TEvRCgnjRU3zDBLn7AuYPZESbyr971Y71fVGj3puoD+w5MWXaQ
 +upZqLlASOVoxwJn7A0rDaKuXyhZtxxmhKxWr9FuGneg/tV6bQ6lOuQEU g==;
X-CSE-ConnectionGUID: 743gTD5LSmWA3s9644MH8Q==
X-CSE-MsgGUID: NQ+QZ8iQQeKlIE/3fYNdIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="15317728"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="15317728"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 00:43:44 -0700
X-CSE-ConnectionGUID: u3IWYQZMTOCnlSzmR1InrQ==
X-CSE-MsgGUID: ESu2lkKKSNOX3tPMhwecZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="30210501"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.7])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 00:43:42 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Chris Clayton <chris2553@googlemail.com>, LKML
 <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: /sys/kernel/debug/vgaswitcheroo directory missing
In-Reply-To: <b25a0ca3-e1bd-4457-8283-6878493b864f@googlemail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <199a1636-2cd1-4d66-b2b2-1b64c5af4f2d@googlemail.com>
 <ZjugHVX1WIgjbAH1@phenom.ffwll.local>
 <b77cb343-1ea8-4cfd-ac77-b7e8d1c5e078@googlemail.com>
 <b25a0ca3-e1bd-4457-8283-6878493b864f@googlemail.com>
Date: Mon, 13 May 2024 10:43:39 +0300
Message-ID: <87cypqgnro.fsf@intel.com>
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

On Sat, 11 May 2024, Chris Clayton <chris2553@googlemail.com> wrote:
> Mmm, I see a patch has made it's way to mainline and can confirm that
> it fixes the problems I tbothered you with in this thread.

Which patch? Might be interesting for posterity.

BR,
Jani.


-- 
Jani Nikula, Intel
