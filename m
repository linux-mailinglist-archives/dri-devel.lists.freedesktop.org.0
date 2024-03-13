Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B15A187A93D
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 15:12:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC4388CE4;
	Wed, 13 Mar 2024 14:12:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lguRgcJp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A23E910F7DA;
 Wed, 13 Mar 2024 14:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710339137; x=1741875137;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6nBGTGQ3961QeXffzJyv86c9RoIOS9mQ8gofGgLY5ZM=;
 b=lguRgcJpKVl7XAX3WSn9Eiw97q2+iQPyD+REubiSibe0lfHWEw4gX/Mj
 2gycl8lGQDP4Ps+fSIQDTLDXZdGQOqIrRhtAg9vrOLbm6RZKeRMBjKpd1
 2Cq+PM4E+ufnXk68gbpcok32+dQBuKSex9O1/VrCTTtPb6xSdR8S507a/
 igL4bvVhLDkUouso4QUbRfPTBdjnSVFzcgS9zVl/kKzEcfrvntkiP5z0V
 yAlhUTTZ82vjVHkhbO7UdZr4HgWkHWQXJr3GfrvCNo1cWU4NBUhtXsdQa
 Of44cywXbZJTSlDlBlr6Xca6IROisq1c+JXvm2jBoEoUv1u1TVnMrHW4A w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="8924361"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="8924361"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 07:09:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="12015618"
Received: from unknown (HELO intel.com) ([10.247.118.152])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 07:09:43 -0700
Date: Wed, 13 Mar 2024 15:09:36 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH] drm/i915/selftests: Pick correct caching mode.
Message-ID: <ZfGzoFPDq5r0MUVO@ashyti-mobl2.lan>
References: <20240312111815.18083-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312111815.18083-1-nirmoy.das@intel.com>
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

Hi Nirmoy,

On Tue, Mar 12, 2024 at 12:18:15PM +0100, Nirmoy Das wrote:
> Caching mode is HW dependent so pick a correct one using
> intel_gt_coherent_map_type().
> 
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10249
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

pushed to drm-intel-gt-next.

Thanks,
Andi
