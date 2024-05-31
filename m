Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C668D6848
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 19:41:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F2210E41E;
	Fri, 31 May 2024 17:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I/LaKBFL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3654110E353
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 17:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717177294; x=1748713294;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2HRzJhB6DkzhhkkR2uYIgH8e1uDb/Hk6QCHWQxk39lQ=;
 b=I/LaKBFLryQOV0btZlFnVjF6ZzSsRvAOZQ/M50O90iBzhN4S3b7VhW1j
 xpGg9NbSSM0L7daAl/3KVgy2w25Gjf6PcSBsyScuvm/eL3DAIU75rtzZw
 ENrQMMOSunto7p2/ZqKeUFgpVybXEecYIPYtEKlCiwub9QIACtOxzRxn+
 iXEQ7CVhjS5A1LdYzZRCBPXwo6TLPNSSugIzLwP88Yv1Lg9uKeOmYH+pQ
 CZB/W94WY/peG/lGmTshOHhrcZgRl/Be6hnwlyOSxAgN3xz+AMkssbgX1
 a86fXPBHVwqQjtv8La5QRcKiG9S+tkpNQ21yLx/IGDts881wg8qV0QoRN A==;
X-CSE-ConnectionGUID: XURQ7u7pTPqGw7Z5dq/opw==
X-CSE-MsgGUID: 6XRAaR1lTJeVNMWZF9rq5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="13925764"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; d="scan'208";a="13925764"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 10:41:33 -0700
X-CSE-ConnectionGUID: BZzVMnL5RcWCcpKzcVOs3w==
X-CSE-MsgGUID: BexCsHAHSTi2YIp+Lx3NEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; d="scan'208";a="36312479"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 10:41:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sD6Fm-0000000CXaK-0IEU; Fri, 31 May 2024 20:41:22 +0300
Date: Fri, 31 May 2024 20:41:21 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.gaignard@collabora.com, sebastian.fricke@collabora.com,
 akpm@linux-foundation.org, gregkh@linuxfoundation.org,
 adobriyan@gmail.com, jani.nikula@intel.com, p.zabel@pengutronix.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 corbet@lwn.net, broonie@kernel.org, rdunlap@infradead.org,
 linux-doc@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 praneeth@ti.com, nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
 j-luthra@ti.com, b-brnich@ti.com, detheridge@ti.com,
 p-mantena@ti.com, vijayp@ti.com, andrzej.p@collabora.com,
 nicolas@ndufresne.ca, davidgow@google.com, dlatypov@google.com
Subject: Re: [PATCH v11 07/11] Documentation: core-api: Add math.h macros and
 functions
Message-ID: <ZloLwasJUEWR-2-L@smile.fi.intel.com>
References: <20240531170229.1270828-1-devarsht@ti.com>
 <20240531171220.1295881-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531171220.1295881-1-devarsht@ti.com>
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

On Fri, May 31, 2024 at 10:42:20PM +0530, Devarsh Thakkar wrote:
> Add documentation for rounding, scaling, absolute value and difference,
> 32-bit division related macros and functions exported by math.h header
> file.

As long as it renders correctly, fine to me
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


