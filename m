Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFE09BCB09
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 11:53:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD8510E55D;
	Tue,  5 Nov 2024 10:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oIImtxyY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADAB810E55D
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 10:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730803992; x=1762339992;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KVvcpQ5F/M9q98s+qccoETOvBMw6mTVjp58jf47uN90=;
 b=oIImtxyY7kNz+Cxq9MUThZhvLf5MZkkNQ9dhH6ZwiNRKEKoHOoc7FvmC
 HWgy1pcY9oNhP8KJZstnhboNtKGzYe2nFSP0p9xn58+1y65Of+ICy7cII
 gUV7qZbWQGDP4/5lcnFkeIs7KWz0iWx0cCVx4JBvzdO3vhS0y3nKTAMR8
 LP2vvKT9A/sZfqHxzPPqyFjJLIOxuCZ6hbS6SR3HXE0c2sc2IVxgMYbfb
 1SU6oo/EGAbbldI2/pdoqSzQczN7/hJ1RWkcT14ZYheIzpp2u3ozTCcjG
 vRSFBg/Vv8mJ3PrKm1AugxrmIrpyitN+Es5FhzSmfCUoU/9KOHZDD59vY A==;
X-CSE-ConnectionGUID: 3H8YoVfeSVabGEt7h/Pu6A==
X-CSE-MsgGUID: MmDxEfG6R9S4dCTJy4Mg6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30653511"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="30653511"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 02:53:11 -0800
X-CSE-ConnectionGUID: h4i639knRvOKyDrJl0aW8w==
X-CSE-MsgGUID: dV0VB4bERsKTIxQsQJPO6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="88741763"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com)
 ([10.237.72.44])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 02:53:02 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
 by kekkonen.fi.intel.com (Postfix) with SMTP id F131411F9C3;
 Tue,  5 Nov 2024 12:52:58 +0200 (EET)
Date: Tue, 5 Nov 2024 10:52:58 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, hverkuil@xs4all.nl,
 tomi.valkeinen@ideasonboard.com, quic_bjorande@quicinc.com,
 geert+renesas@glider.be, dmitry.baryshkov@linaro.org, arnd@arndb.de,
 nfraprado@collabora.com, thierry.reding@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org,
 marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v4 04/13] media: uapi: Add
 MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG, JEIDA}
Message-ID: <Zyn5CgZvyg05cgJW@kekkonen.localdomain>
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <20241028023740.19732-5-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028023740.19732-5-victor.liu@nxp.com>
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

Hi Ying,

On Mon, Oct 28, 2024 at 10:37:31AM +0800, Liu Ying wrote:
> Add two media bus formats that identify 30-bit RGB pixels transmitted
> by a LVDS link with five differential data pairs, serialized into 7
> time slots, using standard SPWG/VESA or JEIDA data mapping.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

It's fine to merge this via another tree, too.

-- 
Regards,

Sakari Ailus
