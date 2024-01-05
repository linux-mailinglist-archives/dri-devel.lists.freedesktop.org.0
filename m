Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93900825172
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 11:06:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B397D10E5BD;
	Fri,  5 Jan 2024 10:06:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FEED10E5BD;
 Fri,  5 Jan 2024 10:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704449165; x=1735985165;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jhXQ7p50nP1PTuXTz7afcg2shFt2E2ZgLk+f2nyafso=;
 b=k48M8QOsZY+VWzObaKBr/fvJJCwckVQg4Eygdo6yElo5KjDU/JDBc8Gn
 IPkk9rxoyt5dRwc2rr+0FNOfVm3zq0qzO4uDosnUigYCkUWXJWBzjdb8G
 QvJ8xmFRAlD+Ks+XZXdcptwZC8pqhRlTf76uJnkFBoxi31nfRlUODt/fa
 iaQOAymbQYUj7rAJm0AqNDm3IpPpW2+NKC5TCNElOMLl427Uhb3K27XK6
 B7ua3P8Iq4pYdNCvRS2Aq2bPyFLBg2UtJf3a4GdZMoX/aidxoGKgapfc+
 TYDMpwV5fLSAKYkke56mnDe66IweEVnJYTg1Lkl3L/zpYJPoOTVwwxTEA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4245584"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="4245584"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 02:06:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="846536093"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="846536093"
Received: from ftrahe-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.36.116])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 02:05:59 -0800
Date: Fri, 5 Jan 2024 11:05:55 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 3/3] ASoC: hdmi-codec: drop drm/drm_edid.h include
Message-ID: <ZZfUg6CTnpFPrDhu@ashyti-mobl2.lan>
References: <20240104201632.1100753-1-jani.nikula@intel.com>
 <20240104201632.1100753-3-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104201632.1100753-3-jani.nikula@intel.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Maxime Ripard <mripard@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

On Thu, Jan 04, 2024 at 10:16:32PM +0200, Jani Nikula wrote:
> hdmi-codec.h does not appear to directly need drm/drm_edid.h for
> anything. Remove it.
> 
> There are some files that get drm/drm_edid.h by proxy; include it where
> needed.
> 
> v2-v4: Fix build (kernel test robot <lkp@intel.com>)
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: linux-sound@vger.kernel.org
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
