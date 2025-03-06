Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C157A54DA6
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 15:25:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D603910E9A5;
	Thu,  6 Mar 2025 14:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QK5MduLg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC2D10E835;
 Thu,  6 Mar 2025 14:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741271118; x=1772807118;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yJyhgrptmH78nle4/rptWGGes3iNmSvLwnXEYnVvGZY=;
 b=QK5MduLgcdo3sIcD+4CIoILIeKPpc3ZpJBQkxpAI3E5N84TwKCUprds1
 K8S79BT7OhlECsgBUMwf82wc0D6krB8Tver5co0k9hS26Okj/hWMaRcCj
 lff6s1PyuOBRJHgplSgp1nx6xK4WK1h3Yw82IU+wCLqa6tRIxAfWaWYP8
 tmApjPWyGhP7hIxcG+LjvhVJLBL8+LmT+wI1pbXcOSB5UfNUF4i6YXxbE
 SkZjvElOvdNO0hiWWXVxvIyYvSok2ODLLaDUDcIS/GRB1yMIi36kdjE/w
 Gsz0Sp4jBwPaKyn1JnIAyMKF4tzEfDYZRnxyhvSmqAAT98FFXgJ0Drh9a w==;
X-CSE-ConnectionGUID: 1+/098KPT5uREp2UjcagAg==
X-CSE-MsgGUID: LzjONwFhSWOV7ZloSWheCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42141137"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="42141137"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 06:25:11 -0800
X-CSE-ConnectionGUID: c/Uj9L3wR2ugWnb1+hFFGQ==
X-CSE-MsgGUID: xfqzx3MPQdqh7CUwHNyxAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="118769465"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.125])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 06:25:07 -0800
Date: Thu, 6 Mar 2025 15:25:04 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Yuichiro Tsuji <yuichtsu@amazon.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH] drm/i915/gt/uc: Fix typo in a comment
Message-ID: <Z8mwQNuhpG_12x2L@ashyti-mobl2.lan>
References: <20250224085638.3500-2-yuichtsu@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224085638.3500-2-yuichtsu@amazon.com>
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

Hi Yuichiro,

On Mon, Feb 24, 2025 at 05:56:37PM +0900, Yuichiro Tsuji wrote:
> Fix typo in a comment.
> 
> explaination -> explanation
> 
> Signed-off-by: Yuichiro Tsuji <yuichtsu@amazon.com>

reviewed and merged, thanks.

Andi
