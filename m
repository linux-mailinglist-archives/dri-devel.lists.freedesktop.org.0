Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB06D8C274B
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 17:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F6810E6CC;
	Fri, 10 May 2024 15:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bQ/X+aqJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84ED010E6CC
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 15:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715353575; x=1746889575;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CXDcdUm+eyJsZfLXxHCGcniGzdrK5T6k16E5ckZ3gVw=;
 b=bQ/X+aqJmm9NngTKNZaUVoFISMUTERsquudLaHrEGimW7IjtIPRsB2lr
 OdHVMzI9CD/hsWbY/7k/H1NTuhsV0XasLbEz6TuNT0CXT3J02kkAY2nuT
 etlQzH/nBTQVWHsOikSsoU0WV4r2WNhbFU/MqDr1GpmHaqmVEYobfNLGU
 bnPmh7WomZ3ACvZXpY5sORJVyNsXqw4PKoFXPtIO4dtdHcbHf+R89h9f+
 NlO3UPmw4TWp/kkClEskqmVo/c8Q5Yr//LDbk3uDPmiI09iSkHBXddM9D
 479PmIcXp+dFccpZNixYjUqipa+5+45v+y8AUNF9twJNKv+qOYXhs1Z8d g==;
X-CSE-ConnectionGUID: nrPmE+/SQRWu7iIREvy7Pg==
X-CSE-MsgGUID: YYcMkwPHRwyRyc5E17l4NQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11465497"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="11465497"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:06:14 -0700
X-CSE-ConnectionGUID: k+ktbkYoRAu6iUMkqzeu+g==
X-CSE-MsgGUID: Q1f6jHyaQ9a9ZPs/EZ2JtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="34516794"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:06:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1s5Rox-000000068cr-1lcA; Fri, 10 May 2024 18:06:03 +0300
Date: Fri, 10 May 2024 18:06:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: mchehab@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, hverkuil-cisco@xs4all.nl,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.gaignard@collabora.com,
 sebastian.fricke@collabora.com, laurent.pinchart@ideasonboard.com,
 praneeth@ti.com, nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
 j-luthra@ti.com, b-brnich@ti.com, detheridge@ti.com,
 p-mantena@ti.com, vijayp@ti.com, andrzej.p@collabora.com,
 nicolas@ndufresne.ca, akpm@linux-foundation.org,
 gregkh@linuxfoundation.org, adobriyan@gmail.com,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 jani.nikula@intel.com, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH RESEND v7 0/8] Add V4L2 M2M Driver for E5010 JPEG Encoder
Message-ID: <Zj4327rHvNGF8H-Q@smile.fi.intel.com>
References: <20240510082603.1263256-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510082603.1263256-1-devarsht@ti.com>
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

On Fri, May 10, 2024 at 01:56:03PM +0530, Devarsh Thakkar wrote:
> Resending this V7 series to have proper linking of patches in the series
> with cover-letter while doing git send-email.
> 
> Original cover letter: 
> This adds support for V4L2 M2M based driver for E5010 JPEG Encoder
> which is a stateful JPEG encoder from Imagination technologies
> and is present in TI AM62A SoC.
> 
> While adding support for it, following additional framework changes were
> made:
>  - Moved reference quantization and huffman tables provided in
>    ITU-T-REC-T.81 to v4l2-jpeg.c as suggested in mailing list [1].
>  - Add macros to round to closest integer (either higher or lower) while
>    rounding in order of 2.

Nice, now it's chained!

But all my comments to the previous mails are still applicable here.

-- 
With Best Regards,
Andy Shevchenko


