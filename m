Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A28E82F235
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 17:14:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C352810E58B;
	Tue, 16 Jan 2024 16:14:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66EC410E564;
 Tue, 16 Jan 2024 16:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705421673; x=1736957673;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Laa0CQd0yJ+fDuLvFZPVswEPeD7Y0wSXSidO7YjTej4=;
 b=I+eNSNtdotOSrSw+lq9ogqQ3s9ZEeImW1XTcZiDH9xnsj3w5jX6gDk96
 vh3CC3tK4BWAW4sG2D4xIPF/MogS9jogRXLf/08Ri5W+iGDjocqauMhAD
 TA4rfN/S5rkWUVIdCUKOfSBnQqR8266ytCUCmCgqkU9ehPSzxlXAL5fZv
 N+BY0ih5ISbrOPMQMNnJCvoY/Nl42EkfyGRKwkCM01ygZph0NnTxNqLsD
 dwcq7olFXX3PVXl3gSoJ974+Kw/DvbqibkNr0HEbliKbXQ0688dHg1PQ5
 lyQPuZuPfKmkXqsCer9IW64D/pE7kJxhQqybZyje7Ptv7eeI6ZxykXruh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="466284407"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="466284407"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 08:14:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="787497846"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="787497846"
Received: from jfunnell-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.39.52])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 08:14:21 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: "Sarha, Jyri" <jyri.sarha@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [3/3] ASoC: hdmi-codec: drop drm/drm_edid.h include
In-Reply-To: <4eeb74d942acf24e468036e0732e5e32c6907f6f.camel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240104201632.1100753-3-jani.nikula@intel.com>
 <4eeb74d942acf24e468036e0732e5e32c6907f6f.camel@intel.com>
Date: Tue, 16 Jan 2024 18:14:18 +0200
Message-ID: <87v87tqmqt.fsf@intel.com>
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
Cc: "mripard@kernel.org" <mripard@kernel.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "rfoss@kernel.org" <rfoss@kernel.org>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "marijn.suijten@somainline.org" <marijn.suijten@somainline.org>,
 "perex@perex.cz" <perex@perex.cz>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 12 Jan 2024, "Sarha, Jyri" <jyri.sarha@intel.com> wrote:
> Reviewed-by: <jyri.sarha@linux.intel.com>
>
> Thanks,
> The including of drm_edid.h in hdmi-codec.h is a relic from my pre
> upstreaming version of hdmi-codec. I don't think it was ever needed
> in any upsteam version.

Thanks for the reviews and acks, pushed to drm-misc-next, even if I
didn't get an ack from Jaroslav or Takashi. Seems rather benign anyway.

BR,
Jani.


-- 
Jani Nikula, Intel
