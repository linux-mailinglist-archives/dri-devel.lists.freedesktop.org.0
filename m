Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EFDA3CC62
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 23:33:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5920A10E37B;
	Wed, 19 Feb 2025 22:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hN4vRtgn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5AD210E088;
 Wed, 19 Feb 2025 22:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740004391; x=1771540391;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=nr9NDfOFfx39pyiTYhclPbpVenX1eOgKGLy7+OEMM/M=;
 b=hN4vRtgnmCBNiUIjNQw+w/mAzPK0IDUREcPk/j5cPwgctUC2C+RbjjA8
 7f4b/fAU7/f2CV8Btzqzi0Qjis1M8pxiUxhzguungjMQdWsqrfNnWyzqU
 fsG/CKHDp5NJB0e92j10QmsXbR7osN7A5uxEY5sZZaq30InocxRSsnFLk
 QiTAqFQp0zAKzzOyG+NauGp4bGQuREttpd6M9HgL9s0jmc6ePXjino1Zj
 76y1WHnMkgbqvpokK6DBp9Dn6eehYKDeiHedP+CBLYX0HUvXawRxIJmPd
 YtlZFskyaQutUE4wtIilSZ+J757Neoz9Zl/xt3rYuFldVYqPN9i0wFXd8 Q==;
X-CSE-ConnectionGUID: 6C3+ed8UTr+fH15YcHCQGw==
X-CSE-MsgGUID: xYgtBtSBRESAIqe9uqv5OA==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="44410556"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="44410556"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 14:33:11 -0800
X-CSE-ConnectionGUID: VT3GnqgHQLO21PRfBBo9pg==
X-CSE-MsgGUID: P56aq5FaSeSfZMEfOKVSMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120066165"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 19 Feb 2025 14:33:07 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 20 Feb 2025 00:33:06 +0200
Date: Thu, 20 Feb 2025 00:33:06 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, chaitanya.kumar.borah@intel.com,
 Naveen Kumar <naveen1.kumar@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH v6 0/3] Expose modifiers/formats supported by async flips
Message-ID: <Z7ZcIs22xv3LGr5M@intel.com>
References: <20250219-asyn-v6-0-b959e6becb3c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250219-asyn-v6-0-b959e6becb3c@intel.com>
X-Patchwork-Hint: comment
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

On Wed, Feb 19, 2025 at 02:47:22PM +0530, Arun R Murthy wrote:
> All of the formats/modifiers supported by the plane during synchronous
> flips are nor supported by asynchronous flips. The formats/modifiers
> exposed to user by IN_FORMATS exposes all formats/modifiers supported by
> plane and this list varies for async flips. If the async flip supported
> formats/modifiers are exposed to the user, user based on this list can
> take decision to proceed or not and avoid flip failures during async
> flips.
> Discussion around this can be located @
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29618#note_2487123
> Userspace implementation for IN_FORMARTS_ASYNC under review @
> https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4063

FYI I just cooked up support for xorg/modesetting:
https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1816

-- 
Ville Syrjälä
Intel
