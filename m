Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B7288C8E6
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 17:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A40E10F0EF;
	Tue, 26 Mar 2024 16:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GRpHgWZN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F18210ECB2;
 Tue, 26 Mar 2024 16:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711470112; x=1743006112;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BNws0gDydMfP0P1Q5QnTKaEzayYzV7OQpQeItNJTYKI=;
 b=GRpHgWZN1CUIppK3mgnwRYWA06K3pVCjl27sTgQKhW8CnhyZI6GouUqz
 2/2L4JFajEYkd4gCMbTRLOvFVOPKVjtbujJvVWvqmv3lshgMuZtV5+peP
 oKNXheTi0uOZT+WjIuEewsA5QKT4xC1z1emfFroIY9X/EWkKQfOUhmQ8/
 7KwwkPIWBJDy6ww6XKTTf9HH5C4kk/gX5Y1e6wIaL9aBzu7rCW32ygXTL
 9gdW8KBoPtplTf2XiGiKsZgw3U7ixrL3AI9Ux41URLLNVf/7dqFSOl7Bx
 qgPc0xNl8qPEu2KEo5P9NY0HcjUQz2Fa1RrAjN+y2PnEdvEaFetyhGemD g==;
X-CSE-ConnectionGUID: bokQdphnTA6py+ZasRnfHQ==
X-CSE-MsgGUID: mWEL9LgQQLKLcytBChFw7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17263726"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="17263726"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:21:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="16069043"
Received: from unknown (HELO intel.com) ([10.247.118.204])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:21:44 -0700
Date: Tue, 26 Mar 2024 17:21:38 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <John.C.Harrison@intel.com>, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH v6 0/3] Disable automatic load CCS load balancing
Message-ID: <ZgL2EqrsHBoBmoGv@ashyti-mobl2.lan>
References: <20240313201955.95716-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313201955.95716-1-andi.shyti@linux.intel.com>
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

Joonas,

> 1. Disables automatic load balancing as adviced by the hardware
>    workaround.

do we need a documentation update here?

Andi
