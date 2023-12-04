Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E431F802FF1
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 11:16:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4461910E318;
	Mon,  4 Dec 2023 10:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4F510E12C;
 Mon,  4 Dec 2023 10:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701684964; x=1733220964;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=3LL6k+xYYDgowjrfDhwIvyPlTGYLhMGk56IZFFTZXgI=;
 b=FTSLF5EBNhzvDBClQ3u+VvnkYvoEb8UjfAJxuu2Awqf5kTqgKmsoeiYN
 eIdxSR6fig5xwJ4jQ7c18NSWoGo5H+wrNXzC/PW8xLPiZ4OWNPpHKMIzk
 0uygmPlOBdU3KGzVdsKID9B5HyWbDDK94N/STbtiUNybGzqbLuYXbf8hS
 kbQeUBdgIKDQet2+cGfmbMgHRUtCxewHoS0eh9lo+EunkoGTLUWM6+OSA
 kVntJsNUf6h5tJQtFd0QWVKVqiHJOnguJvgoMqrWXBdyc1myTYNNjtlLX
 Ik85kAwFfW5ruyYXPRCYEfO5iV/EW84MNm+gt2mx1YlGHmUjKaRaOX0Py w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="390871263"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="390871263"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 02:15:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="861329877"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="861329877"
Received: from shahmoha-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.45.180])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 02:15:42 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ankit Nautiyal
 <ankit.k.nautiyal@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] drm/i915/display: Don't use "proxy" headers
In-Reply-To: <20231129140129.699767-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231129140129.699767-1-andriy.shevchenko@linux.intel.com>
Date: Mon, 04 Dec 2023 12:15:39 +0200
Message-ID: <87r0k22rzo.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Nov 2023, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wr=
ote:
> The driver uses math.h and not util_macros.h.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks, pushed to drm-intel-next.

BR,
Jani.

> ---
>  drivers/gpu/drm/i915/display/intel_snps_phy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_snps_phy.c b/drivers/gpu/=
drm/i915/display/intel_snps_phy.c
> index ce5a73a4cc89..bc61e736f9b3 100644
> --- a/drivers/gpu/drm/i915/display/intel_snps_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_snps_phy.c
> @@ -3,7 +3,7 @@
>   * Copyright =C2=A9 2019 Intel Corporation
>   */
>=20=20
> -#include <linux/util_macros.h>
> +#include <linux/math.h>
>=20=20
>  #include "i915_reg.h"
>  #include "intel_ddi.h"

--=20
Jani Nikula, Intel
