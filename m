Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A607D571E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 17:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B4510E3F4;
	Tue, 24 Oct 2023 15:58:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A4D10E3F1;
 Tue, 24 Oct 2023 15:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698163104; x=1729699104;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Pco9+c9Eg9ly/9DbWSGwpJ4e3CXmtwOqtrtEus796lU=;
 b=fQhM5ey5krIC7/30q/lSdTeYf90w1ZoD5hCtXr+WfdNhkoR0XTSxS5EI
 gJ6zHHVpAhcW/ab17lx7EEdLTsANaMi5qi5Q7BDKlQKSQX0zbbh/2r8WR
 A5asM3rfgYeYIqneZbeInedENVKEX3C6K3Btck86qFbtd75IMjKzfvgv4
 aspn9N0yo9DfKWK1rE5AGMKYST/t6JINOh/IqWxugmuyaovcT9p2iEKe/
 FN7te9ozPEhPv0yFi9G1fKDpg6RNrCAtFXv+JAJydaKpXFTIVgGhfeY1Q
 aUsiPfE5kGO31VHcLXceLQwAslLdYESQaK7yH/CgHA09wh9n86VAsJxh/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="390972037"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; d="scan'208";a="390972037"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 08:58:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="752041799"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; d="scan'208";a="752041799"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 08:58:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qvJnL-00000008KH1-36if; Tue, 24 Oct 2023 18:58:15 +0300
Date: Tue, 24 Oct 2023 18:58:15 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [rft, PATCH v1 0/2] drm/i915/dsi: An attempt to get rid of IOSF
 GPIO on VLV
Message-ID: <ZTfpl/QE99fL3ii/@smile.fi.intel.com>
References: <20231018051052.1328852-1-andriy.shevchenko@linux.intel.com>
 <0c88666a-ff36-b649-d244-ccce500b6c2f@redhat.com>
 <ZS/VE3w7bafj+Kuu@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZS/VE3w7bafj+Kuu@smile.fi.intel.com>
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
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 18, 2023 at 03:52:36PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 18, 2023 at 11:09:35AM +0200, Hans de Goede wrote:
> > On 10/18/23 07:10, Andy Shevchenko wrote:

...

> > Yes I should be able to find a device or 2 which poke GPIOs from the
> > VBT MIPI sequences. Unfortunately I don't know from the top of my head
> > which devices actually use this, so I may need to try quite a few devices
> > before finding one which actually uses this.
> > 
> > I'll try to get this series tested sometime the coming weeks,
> > depending on when I can schedule some time for this.
> 
> No hurry. maybe you simply can add into your usual tree you run on your
> devices?

FYI, I have just sent a v2, which includes CHV conversion.

-- 
With Best Regards,
Andy Shevchenko


