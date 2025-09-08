Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 426C5B48B1F
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 13:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6379710E4C3;
	Mon,  8 Sep 2025 11:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hhpeDntA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B936B10E4C3
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 11:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757329667; x=1788865667;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=1FslJBhOV4oLwBBRKYVHO5hLWyRrnGhIX3Sjj2LP/A0=;
 b=hhpeDntApiBesqkM6MQ35aAvW69Jrrbb07K6DOKm4XRMa88cQQMlHgVi
 PqVmcA49oAv0onJBarfKZufzy4RFKAe2aUF8x23fNSh76WWrwv4qRnr3G
 qhOrmNh7J3KqxmKOy/QGY1sB2GKlh3nDUjMO4ZGa76lXd1f224elNNyFE
 giWoutV9gFqwyDVn449H6w/OFadm2u7iO5H998c6o1oPPwdBD9R4E4fCr
 Pi6CjcA23L35CuMhtoKqkFpSXZjIrPZacj67yzurm55YFEgnGBVNTym3t
 C93utALyQAn0MiOStDeotL9DH8FZjrcsKLmqPZlYOwkDFkF1I9inpjwhD Q==;
X-CSE-ConnectionGUID: A133VtnUR5m765ud5rh6Tw==
X-CSE-MsgGUID: XjTAkQRGSSKim2Qgk1iAUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59652800"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59652800"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 04:07:46 -0700
X-CSE-ConnectionGUID: slWKUjoPSwi6xW6amKTnKw==
X-CSE-MsgGUID: 4mtX+1hdQsSvW6PGnq5dHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="177121172"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.204])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 04:07:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: syyang <syyang@lontium.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 yangsunyun1993@gmail.com, syyang <syyang@lontium.com>
Subject: Re: [PATCH v1 2/2] This patch adds a new DRM bridge driver for the
 Lontium LT9611C chip.
In-Reply-To: <20250903123825.1721443-3-syyang@lontium.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250903123825.1721443-1-syyang@lontium.com>
 <20250903123825.1721443-3-syyang@lontium.com>
Date: Mon, 08 Sep 2025 14:07:38 +0300
Message-ID: <a38fac371861f8651079d56f703826651f1568e1@intel.com>
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

On Wed, 03 Sep 2025, syyang <syyang@lontium.com> wrote:
> +static int i2c_write_byte(struct lt9611c *lt9611c, u8 reg, u8 val)

> +static int i2c_read_byte(struct lt9611c *lt9611c, u8 reg, u8 *val)

> +static int i2c_read_write_flow(struct lt9611c *lt9611c, u8 *params,
> +			       unsigned int param_count, u8 *return_buffer,
> +			       unsigned int return_count)

include/linux/i2c.h provides a plethora of i2c_ prefixed functions and
types. I think it's bad practice to reuse the prefix of a very common
kernel interface, even if in static functions.

You might get collisions later, but the reader of the code is mislead to
believe this is something in i2c.h.

BR,
Jani.

-- 
Jani Nikula, Intel
