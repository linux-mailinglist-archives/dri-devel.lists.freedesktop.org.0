Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C6E268935
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 12:24:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E5F89EEB;
	Mon, 14 Sep 2020 10:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D6289EEB
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 10:24:21 +0000 (UTC)
IronPort-SDR: ntlw2zGbpS72fDKDcXC1xcgkuFWUBiGM4ou0BOgZfKLKPbzYrk6nfDP4AxgZvAMUK86BbpFVsh
 72JwoBD+K/gg==
X-IronPort-AV: E=McAfee;i="6000,8403,9743"; a="146794704"
X-IronPort-AV: E=Sophos;i="5.76,425,1592895600"; d="scan'208";a="146794704"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 03:24:20 -0700
IronPort-SDR: QcyP07RF3LAU/PI2J/duytNCtP6tKMncHxoFHjpptViBWJHxO3DuUntzK/+Rvdd1QVz+Pb6Jl6
 pX2V7TlmncCw==
X-IronPort-AV: E=Sophos;i="5.76,425,1592895600"; d="scan'208";a="450820403"
Received: from akeogh1-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.27.129])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 03:24:17 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Abhinav Kumar <abhinavk@codeaurora.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/4] Add support for video pattern DP CTS to MSM DP
In-Reply-To: <20200903224328.26452-1-abhinavk@codeaurora.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200903224328.26452-1-abhinavk@codeaurora.org>
Date: Mon, 14 Sep 2020 13:24:21 +0300
Message-ID: <875z8gzmei.fsf@intel.com>
MIME-Version: 1.0
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
Cc: linux-arm-msm@vger.kernel.org, tanmay@codeaurora.org, swboyd@chromium.org,
 khsieh@codeaurora.org, seanpaul@chromium.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, aravindh@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 03 Sep 2020, Abhinav Kumar <abhinavk@codeaurora.org> wrote:
> Add support for video pattern Display Port Compliance tests to
> MSM DP driver.

FWIW, I find it useful to prefix the cover letter subject line with the
usual git log prefixes, e.g. "drm/msm/dp", so people can filter their
mails better.


BR,
Jani.


> Abhinav Kumar (4):
>   drm/msm/dp: add debugfs support to DP driver
>   drm/msm/dp: move debugfs node to /sys/kernel/debug/dri/*/
>   drm/msm/dp: add debugfs nodes for video pattern tests
>   drm/msm/dp: remove mode hard-coding in case of DP CTS
>
>  drivers/gpu/drm/msm/Makefile            |   3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |   7 +
>  drivers/gpu/drm/msm/dp/dp_debug.c       | 485 ++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_debug.h       |  74 ++++
>  drivers/gpu/drm/msm/dp/dp_display.c     |  28 +-
>  drivers/gpu/drm/msm/dp/dp_link.c        |   2 +-
>  drivers/gpu/drm/msm/dp/dp_link.h        |  23 ++
>  drivers/gpu/drm/msm/dp/dp_panel.c       |  46 +--
>  drivers/gpu/drm/msm/msm_drv.h           |   2 +
>  9 files changed, 617 insertions(+), 53 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_debug.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_debug.h

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
