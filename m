Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE977EDE4A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 11:15:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212BE10E5AD;
	Thu, 16 Nov 2023 10:15:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A21910E5A8;
 Thu, 16 Nov 2023 10:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700129726; x=1731665726;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=5BlnmANSnRsKUHJF/sb0ywtqgmtFH8pDdWcj5GLx5m4=;
 b=BwP2+D5FrLRIW+nA5wSrY+uiGuCsQwsCDn1Ea4btTeUaGyP1m4xMdfwu
 EL+LILEa3zH2GQs3RXSWV6LHJywaiW6CRlN3Hd106bvUw7v2obpamWg1K
 sQV4RyLDj51F+1/zOrRD3qO3lkJwutCjaImughW/WIYb9ATezuXgwQ/v/
 GUj/zXSLdaGOab2Z5+QK+1Py2U+N6eocc3xrbjmR6MkOIF8uv55OZ9xbW
 GjI59EhsXe67d4F5gb6y2y5BM/uvLvlu52jvWcXqiI+JMn9JU9+6fl2ZS
 ZOs5xlv0UDVFu5R5744Pn7BOAhrHZppdiC1rRSXAE2xJG3XBgZ0PVnHOH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="9701221"
X-IronPort-AV: E=Sophos;i="6.03,308,1694761200"; 
   d="scan'208";a="9701221"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 02:15:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="1096746142"
X-IronPort-AV: E=Sophos;i="6.03,308,1694761200"; d="scan'208";a="1096746142"
Received: from oroos-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.41.17])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 02:15:05 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [rft, PATCH v4 00/16] drm/i915/dsi: 4th attempt to get rid of
 IOSF GPIO
In-Reply-To: <e66638b0-bbad-4ac7-ad93-6fb0c6147005@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231103201831.1037416-1-andriy.shevchenko@linux.intel.com>
 <e66638b0-bbad-4ac7-ad93-6fb0c6147005@redhat.com>
Date: Thu, 16 Nov 2023 12:15:03 +0200
Message-ID: <871qcqqa1k.fsf@intel.com>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Nov 2023, Hans de Goede <hdegoede@redhat.com> wrote:
> Ok, this now has been testen on both a BYT and a CHT device which
> actually use GPIO controls in their MIPI sequences so this
> series is:
>
> Tested-by: Hans de Goede <hdegoede@redhat.com>
>
> And the code of the entire series also looks good to me:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>
> for the series.

Thanks Andy & Hans!

I'll merge this once the test results are in. The BAT results have been
a bit flaky recently, so needed to do a rerun.

That said, I'm not sure if we have any hardware in CI that would
actually exercise the modifications, so in that sense I trust Hans'
testing much more.

BR,
Jani.


-- 
Jani Nikula, Intel
