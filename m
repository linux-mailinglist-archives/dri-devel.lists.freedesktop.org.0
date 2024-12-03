Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F279E16FA
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 10:17:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630B110E99B;
	Tue,  3 Dec 2024 09:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJJHmeY6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C943F10E99B;
 Tue,  3 Dec 2024 09:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733217415; x=1764753415;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=I2zQ7EO3CGd28eCNenVKyQMSLC2mesZFA3OoilbDqi0=;
 b=AJJHmeY6ccSwLN8yrhDBwiRhAGQfEeX9mElqvrO92DxW86VUcziippCe
 Lv49QZOcbam6LrN4d1AikkT129PQlOKqafArUoc+Gfmdx1PrgHbdSnkAS
 GG3X3dojHObfwzmsyF4k9lHpB9ZIvoRKAXEVHs05En1TqM1cUw8ZByFHN
 iHgHohR6laPKNT4iKswCjXgSvoUkJfcOaL51U4s47FF1CIGFdxz/6Uaq1
 lhJMSKWQFdtU9A0b8DxqfcSgCZh+mPb3Ke/F5kVQ2yAFFRNapS0OB3l+0
 N6+oLHhocb4lsjNPJJy4RffDhu7lpA3jVNTorIxNSJ9wIREpuTBW+R1RP g==;
X-CSE-ConnectionGUID: Ip82HMgJSlSxfPHwdiI3lg==
X-CSE-MsgGUID: ZkYvG+EaTaayGaV66BcLsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33340426"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="33340426"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 01:16:55 -0800
X-CSE-ConnectionGUID: L+DEmwe/QXSGw3R8sydsuA==
X-CSE-MsgGUID: V2m+cSg1QAOtvEL89cxbKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="93572855"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 03 Dec 2024 01:16:52 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 03 Dec 2024 11:16:51 +0200
Date: Tue, 3 Dec 2024 11:16:51 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Genes Lists <lists@sapience.com>
Cc: linux-kernel@vger.kernel.org, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 airlied@gmail.com, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: 6.13-rc1 graphics fail
Message-ID: <Z07Mg2_6y2MW22qV@intel.com>
References: <3b097dddd7095bccabe6791b90899c689f271a35.camel@sapience.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b097dddd7095bccabe6791b90899c689f271a35.camel@sapience.com>
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

On Mon, Dec 02, 2024 at 01:40:59PM -0500, Genes Lists wrote:
> 
> 6.12.1 on same system with same userspace works fine (as did 6.12)
> while 6.13-rc1 boots, but without working graphics using gnome with
> wayland.
> 
> Laptop is raptor lake with Intel XE (lspci attached).
> No kernel errors are logged, but GDM fails, leading to frozen screen
> with some messages logged most notable seems to be quite a few of this
> one:
> 
>   Failed to ensure KMS FB ID on /dev/dri/card1
>        drmModeAddFB2WithModifiers failed: Invalid argument

Probably https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13057

-- 
Ville Syrjälä
Intel
