Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 730DF761AAE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 15:54:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3A210E3DA;
	Tue, 25 Jul 2023 13:54:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E509F10E3D7;
 Tue, 25 Jul 2023 13:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690293238; x=1721829238;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=u7X4okrLmQ5gO8SvBkdYjLFmdR0qQe+0q5bDkgBSLwA=;
 b=HU+4B8XVA2Ak1ghVYGcWslhIPwd4XjFQFKngAckMP2oFdfD/bA9vp4nH
 mPX2stoYqIKN6nVfkJE1nkXvyVZvM3TsOW4F6Toe9nHjEZpVDaJE/ugwe
 mnkseIWC7p+DrgTgXz9dT0y+TqbDlnktHXmHrVNWBdoYVnfuFFrSpcTl5
 NTK7RJuT+Xe0j0zkMUBBZeuHbeZ96E17cEwog60v5ilzFmM6i7jya8YS5
 EVNIW+nuQCkKyIsASWnB7+ndmQd91SHTaxtzWy5lUIA57EL/qc0UuyBBd
 /vLEmD8XmJ79BQujIdrY/zPNXo9XU6rKHva8ce3ZhatOALZ1esXftitlD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="431530887"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="431530887"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 06:53:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="796155364"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="796155364"
Received: from kshutemo-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.37.237])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 06:53:54 -0700
Date: Tue, 25 Jul 2023 15:53:51 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Uwe =?iso-8859-15?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Simplify expression
 &to_i915(dev)->drm
Message-ID: <ZL/T70yYbwvSDVWB@ashyti-mobl2.lan>
References: <20230721212133.271118-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230721212133.271118-1-u.kleine-koenig@pengutronix.de>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Uwe,

On Fri, Jul 21, 2023 at 11:21:33PM +0200, Uwe Kleine-König wrote:
> to_i915 is defined as
> 
> 	container_of(dev, struct drm_i915_private, drm);
> 
> So for a struct drm_device *dev, to_i915(dev)->drm is just dev. Simplify
> accordingly.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

pushed to drm-intel-next.

Thanks,
Andi
