Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E277F2834
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 09:58:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8FA010E2B2;
	Tue, 21 Nov 2023 08:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E26E410E2B2;
 Tue, 21 Nov 2023 08:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700557109; x=1732093109;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=htt+X8f+FjchoXwuJTnW2vNFwbgd57Lg5mit0MjBw8w=;
 b=SsBtLgmcJ3sOswtND+0fGmmrseId7W+mC/kq1EbK7MkIMCgQHJ/m5vCm
 mW3Z+r3zuHrIX9d/AvxCN3h4sfT0KEQPplDO8JHTuTDwpaHXpmTot1H1S
 mtNrbhpJ7EPko6gZjuSuEfkZf8dHTncphO9VTolqEzkkNkYzqqeRs951y
 66VjdoSntY3aK3xUarjvs8iBJosQv4hv3L37fopsagDYVdshVkRiMoCOR
 fbvRZXBNmOU/+p5aqY74vv/OR2mx2mSf0VE8f9LV/nednQe+/Z1+gY+p3
 KAzqUGKt82wiVWFvqtXB0iqDmRbyTI6Nj5h0pMUOM11X3CH/2PCgV03IE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="456133001"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="456133001"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 00:58:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="890195495"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="890195495"
Received: from cdeakx-mobl.amr.corp.intel.com (HELO localhost) ([10.252.58.54])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 00:58:23 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v4 00/20] remove I2C_CLASS_DDC support
In-Reply-To: <20231120214624.9378-1-hkallweit1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231120214624.9378-1-hkallweit1@gmail.com>
Date: Tue, 21 Nov 2023 10:58:20 +0200
Message-ID: <87h6lfo53n.fsf@intel.com>
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
Cc: linux-fbdev@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, amd-gfx@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, linux-sunxi@lists.linux.dev,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jocelyn Falempe <jfalempe@redhat.com>, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Yongqin Liu <yongqin.liu@linaro.org>, freedreno@lists.freedesktop.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 20 Nov 2023, Heiner Kallweit <hkallweit1@gmail.com> wrote:
> v4:
> - more ack and review tags

Please do not send new versions just to record the acks and
reviews. They should be added while applying the patches.

Thanks,
Jani.

-- 
Jani Nikula, Intel
