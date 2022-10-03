Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D815F37F8
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 23:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F6C10E4FC;
	Mon,  3 Oct 2022 21:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A6510E4FC;
 Mon,  3 Oct 2022 21:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664833230; x=1696369230;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lruElgHMC8LZXpqnpQb5NpXNJP5vB9bXAVMMtoZ+X1Y=;
 b=EdJOXpFYhlFPKVzWRtgIscPi+kPxGvj6IIpFY9wzWbDI4wmqVKditeJu
 hrXwxUODVSLCXp2iIWj2qKqSH1zLQ7iNCuY4aJ1EpelG2BMwpvjJ7L1ZL
 lCs0G5SqSd1SLcEebsMAcvMvs1g8DwmLH8QC5HmIy20GekD1FpzLQIdv2
 3l3A8YRxje1Ppmb37/G7DHtAlyp9TrOHpE1lusBr29lcSykaYrys94gPj
 yDJDdfPy5L/mnHEwlEHZTdwEM8WWrHa27iUjsNBtT+pyuja2wXnKS059q
 XgqNtHoXlfJW07cFAvqoJYil79riV1rualb8NHUXOaifet15+orS6wM18 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="283132403"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; d="scan'208";a="283132403"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 14:40:29 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="618895118"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; d="scan'208";a="618895118"
Received: from kbalinsk-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.213.7.91])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 14:40:27 -0700
Date: Mon, 3 Oct 2022 23:40:24 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [Intel-gfx] [PATCH 7/7] drm/i915/hwmon: Extend power/energy for
 XEHPSDV
Message-ID: <YztWyHxlVH2hrw6F@ashyti-mobl2.lan>
References: <20220927055020.3499420-1-badal.nilawar@intel.com>
 <20220927055020.3499420-8-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927055020.3499420-8-badal.nilawar@intel.com>
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
Cc: linux-hwmon@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 27, 2022 at 11:20:20AM +0530, Badal Nilawar wrote:
> From: Dale B Stimson <dale.b.stimson@intel.com>
> 
> Extend hwmon power/energy for XEHPSDV especially per gt level energy
> usage.
> 
> v2: Update to latest HWMON spec (Ashutosh)
> v3: Fix review comments (Ashutosh)
> v4: Fix review comments (Anshuman)
> v5: s/hwmon_device_register_with_info/
>     devm_hwmon_device_register_with_info/ (Ashutosh)
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Dale B Stimson <dale.b.stimson@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>

This last patch is making me thing that the hwmon should have
been under gt rather than under i915. We leave it to a later
refactoring.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
