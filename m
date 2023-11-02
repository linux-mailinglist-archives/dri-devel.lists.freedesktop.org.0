Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 936C27DF62D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 16:19:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B4A10E900;
	Thu,  2 Nov 2023 15:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FCC10E8FE;
 Thu,  2 Nov 2023 15:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698938377; x=1730474377;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DX5pR7NmAB/MEaCN3ICH5f/PRJdWLrIDgdmhT6o1n2A=;
 b=UxbR6LQN+gjIDKPv4QSll1xyrkFZquPxdyiDsj5WecHTRv5z9/yqofDA
 HlzEoPxtM/zisIzI0OMWJbEbFB59yFSQwI4e7A6jUIgRuFTDo3+gcSCGR
 uDuKK5lk0edTjdY14XqqO8Fnqt4HPAxHo7U9K3MzIE7noakRD9g9KxjJs
 PPPyp45wRbTvbd0Ccj+1F0a0LIr8fBniQxy6BbTgV/EXE3QGpGejbucen
 vUPMLY4qClm7OQM0v6lPsH2UqlffxmJZpPiHU6Wi4tGBwOjbwf59kahCV
 7myvoBKadfFMVbGFRobwcDCSnOtln9iQPhJXlFIkvD6qfy0odcz3wzM1l g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="1662574"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="1662574"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 08:19:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="737785729"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="737785729"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 08:19:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qyZTm-0000000AiqE-1HmD; Thu, 02 Nov 2023 17:19:30 +0200
Date: Thu, 2 Nov 2023 17:19:29 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 10/15] drm/i915/dsi: Fix wrong initial value for GPIOs
 in bxt_exec_gpio()
Message-ID: <ZUO-AbXmr7mpiJuI@smile.fi.intel.com>
References: <20231102151228.668842-1-andriy.shevchenko@linux.intel.com>
 <20231102151228.668842-11-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231102151228.668842-11-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 02, 2023 at 05:12:23PM +0200, Andy Shevchenko wrote:
> From: Hans de Goede <hdegoede@redhat.com>
> 
> Fix wrong initial value for GPIOs in bxt_exec_gpio().

Oh, and forgot to update the function name in this patch.

In any case I would wait for Hans to confirm it works (and probably he may give
a formal Tested-by tag) and then will send v4 to be applied for real.

-- 
With Best Regards,
Andy Shevchenko


