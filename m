Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4592B996FBB
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 17:30:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B133210E046;
	Wed,  9 Oct 2024 15:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VyXwPX6j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EBB010E046
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 15:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728487834; x=1760023834;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Y+Jl8wTTjGy5pJpFL+qGyh85wq5U1JLARWcextm2vp8=;
 b=VyXwPX6jxuBkz1OgEnm7QVSZnqExnXn6yGCPuPX8Cm+YhxEyqzUd2nfs
 tYB8tyWqSknpKlfXZwfkBAW1QulWtPfW12/yV4lDefRGf2SdwUzOhwfhs
 UwDA3ZQRWmxQkdwwYUvmAxn5QnRvV7ACyu0Vdv/IgX0QfdiB0hV7f9SS2
 1OdNLlUHp92BnevPxMTunySvPQepUHI/hdAaFOlJw3HBqFw9KWq9/xV1f
 zRp9lIC7DYzAlVNMubVWlDD9EFjNwYNZU8alPzw7/xC3uh66B2IywMazx
 MbI0z7BeufQC5aiZHiInKMWX8UYuOej9htfehy1GekHrk87f268DM8Cy+ w==;
X-CSE-ConnectionGUID: avHQRt2cQ6a5nz86SytKsw==
X-CSE-MsgGUID: 7sU4lY/xSkO19kfhwTjErw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27927347"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="27927347"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 08:30:34 -0700
X-CSE-ConnectionGUID: TLdg4cLXQb2fYuj9rZwE0g==
X-CSE-MsgGUID: KLhvRvpiQQyfrKBCrX9uiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="76383690"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.80])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 08:30:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drm/imx: add forward declarations for types
In-Reply-To: <d371a079ac984103f0a720e25f2e47b4206348cd.camel@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241009140452.1981175-1-jani.nikula@intel.com>
 <d371a079ac984103f0a720e25f2e47b4206348cd.camel@pengutronix.de>
Date: Wed, 09 Oct 2024 18:30:29 +0300
Message-ID: <87iku18fai.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 09 Oct 2024, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> On Mi, 2024-10-09 at 17:04 +0300, Jani Nikula wrote:
>> The imx.h header does not forward declare the types it uses, and the
>> header is not self-contained. Fix it.
>> 
>> Fixes: cc3e8a216d6b ("drm/imx: add internal bridge handling display-timings DT node")
>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Cc: imx@lists.linux.dev
>> Cc: linux-arm-kernel@lists.infradead.org
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Thank you,
>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Thanks, pushed to drm-misc-next.

>
> regards
> Philipp

-- 
Jani Nikula, Intel
