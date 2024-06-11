Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 958F0903DF8
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 15:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B6010E13E;
	Tue, 11 Jun 2024 13:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kJdfsILS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F8A10E13E
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 13:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718113948; x=1749649948;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+xPq7PN8qFotnsXgzZ1PotNLq0Vo1Ezxm2VpjgwIDL0=;
 b=kJdfsILScviHat/d4lo7l0V7KU9Kxh4fMFoJSbUgCYlHYmIwLeCScL3W
 QWIqMt5vD5nkrpauuinKaFW4ZDpLYjBbKiznm57a5SD8h1FTbBnWdfUp+
 QQM1JZsN2LSfDnLMrj7ix78474+MZhOPw6925kE8POEB1MZ/ca3MsPcAd
 iFWXEP17XNS4+UOJvnLbFlE6gIwl+dda5gIOGjFA9LOfSBHlNwqxTK6bm
 rNl52HGGTUToZh67BUFEz/iXjFKbNvo8IO3YWwxlWnZhayEVJ/s/APjmW
 YpYcVjwMk2ixujHZJh7+YprGh4WCdHwijFKMfOyvLGncRzBeHW7ijHnrw w==;
X-CSE-ConnectionGUID: n50UWEQ9SHa6vF6CRcmhFw==
X-CSE-MsgGUID: T5RPQt7cRbatLzqanxmobw==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14548373"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="14548373"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 06:52:27 -0700
X-CSE-ConnectionGUID: ZfJEIhDxRbaogqIOohkNxg==
X-CSE-MsgGUID: 9aJmdwhBRaWscwcH7RYvCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="43995280"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 06:52:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sH1vB-0000000FYWK-3iPD; Tue, 11 Jun 2024 16:52:21 +0300
Date: Tue, 11 Jun 2024 16:52:21 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 1/1] drm/mipi-dbi: Add missing MODULE_DESCRIPTION()
Message-ID: <ZmhWlRC22XQcJVnV@smile.fi.intel.com>
References: <20240425125627.2275559-1-andriy.shevchenko@linux.intel.com>
 <4e13caf0-c6f5-4df0-82b9-be72ffe06beb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e13caf0-c6f5-4df0-82b9-be72ffe06beb@quicinc.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 11, 2024 at 06:46:12AM -0700, Jeff Johnson wrote:
> On 4/25/24 05:56, Andy Shevchenko wrote:

...

> I'll remove this from my series

No need, Maxime already applied, and I see
665415092eca ("drm: add missing MODULE_DESCRIPTION() macros")

> Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>

But thanks.

-- 
With Best Regards,
Andy Shevchenko


