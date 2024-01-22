Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C86836D0C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 18:23:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338FB10E6AD;
	Mon, 22 Jan 2024 17:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F5110E525;
 Mon, 22 Jan 2024 17:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705944172; x=1737480172;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=nMd8l1R4VjnN4kwtNc6jWq5EKtW15kh24YWU3Q+Oyi4=;
 b=PyPltJOGt7QrF0nktKDt8ECABUJ4lCMkGQZt27K0DT6vAhQZc0MkKbCH
 pxOZ/x6VxYXzNd4KymGP2zw42uIyiCT0qyHtd5YKDe96lDKCSSLO7f75x
 7epaRecX7zp2Cv0mJNavA/JzFQ4NTx9zS6BCSkwO1fl8wChyQ6LdkHkrj
 4aBDPUXhTsEadhYVTyNQopFacJVVw8QYjdXwxtzeeAdSGPldW3VQm0Gsi
 yJ4UBj2RQP63PVIjuIVi1o/95WjlGZMMnRQl9RsHwvmSAia0rxQ9lccC/
 y9sHWxDzbBT+OpT1Ez5O6+Xx0717B5VY0H/byB+vYPbtie/Ruh2p3wSzF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="8379606"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="8379606"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 09:22:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="735237565"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="735237565"
Received: from mshelego-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.40.242])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 09:22:39 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the drm-intel tree
In-Reply-To: <20240122092520.68a86f48@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231114141715.6f435118@canb.auug.org.au>
 <8734x8u4la.fsf@intel.com> <87y1f0sol1.fsf@intel.com>
 <20240122092520.68a86f48@canb.auug.org.au>
Date: Mon, 22 Jan 2024 19:22:35 +0200
Message-ID: <87o7ddnuzo.fsf@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 22 Jan 2024, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> [1] https://patchwork.freedesktop.org/patch/msgid/20231114081033.27343-1-bagasdotme@gmail.com
>
> This is still not fixed.

Thanks for the reminder. Commit 1a84c213146a ("drm/dp_mst: Separate
@failing_port list in drm_dp_mst_atomic_check_mgr() comment") in
drm-misc-fixes, likely to show up in -rc2.

BR,
Jani.


-- 
Jani Nikula, Intel
