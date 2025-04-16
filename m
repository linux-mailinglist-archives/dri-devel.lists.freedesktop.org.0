Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDB7A8B1EA
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 09:22:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0672310E856;
	Wed, 16 Apr 2025 07:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F9XdFd4E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318F810E856;
 Wed, 16 Apr 2025 07:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744788153; x=1776324153;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/+76O0p30P1UAQDTVz3yx7Z9his4b8KH+O/iSg2KWms=;
 b=F9XdFd4EW4IoI77EHGPnxje6YxcvuGYwL76qQ0RPIisvn1MqrB3r12rp
 HX//qN9yU6BQPxslaNQbrEWIfAwl+ivY2KbwY7Ow7JMPrlpsG8n4FK1mb
 pPOgDkpjMZhewZ7r7VwqDe5W7LI78zXRF54uGE1kW4z3TDLa417E+nig1
 au4/ijknsw/Nqt+VIysPkG7MRY4p9Fj7PmmHBL2mshZuON/U+yJJYKgJ7
 oFQzKL6vZf1hNVZHvGYLc9ZZTatXOTjslL5eND+mXWoaMk6mlScMSGMg4
 sYZcN0S35wUVnUCFhQ176ihqD4bkr+sfJds8GEZjidH2JLOdUbyvB+Zny w==;
X-CSE-ConnectionGUID: MyGHBAijRqiNfY8aT90B2A==
X-CSE-MsgGUID: 1ZVh7rh2S3m+ZrN8Xx3FuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46244262"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="46244262"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 00:22:32 -0700
X-CSE-ConnectionGUID: KNTk/iHST3i+bMKCHUl/5Q==
X-CSE-MsgGUID: LOvJ1h0/RHmkPCnEsygtgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="130306215"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 00:22:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1u4x6G-0000000CmNa-3IaH; Wed, 16 Apr 2025 10:22:24 +0300
Date: Wed, 16 Apr 2025 10:22:24 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] scripts/kernel-doc.py: don't create *.pyc files
Message-ID: <Z_9asBKQ_9DGOH2g@smile.fi.intel.com>
References: <cover.1744786420.git.mchehab+huawei@kernel.org>
 <432f17b785d35122753d4b210874d78ee84e1bb5.1744786420.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <432f17b785d35122753d4b210874d78ee84e1bb5.1744786420.git.mchehab+huawei@kernel.org>
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

On Wed, Apr 16, 2025 at 02:57:38PM +0800, Mauro Carvalho Chehab wrote:
> As reported by Andy, kernel-doc.py is creating a __pycache__
> directory at build time.
> 
> Disable creation of __pycache__ for the libraries used by
> kernel-doc.py, when excecuted via the build system or via
> scripts/find-unused-docs.sh.

Nope, still have it.

I used today's Linux Next with some local code patches (unrelated
to any scripts or kernel doc or python).

To confirm, I even done again a clean build.

-- 
With Best Regards,
Andy Shevchenko


