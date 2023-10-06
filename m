Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E7D7BB917
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 15:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42B110E4E4;
	Fri,  6 Oct 2023 13:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC3510E4E4;
 Fri,  6 Oct 2023 13:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696599028; x=1728135028;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=I98yzBK0JubzPDAX0lsVZ6E7MGX7y0noV4cm1KjbcPQ=;
 b=oFgahP9UTElC6nv+vD/LrlQ9uPbM3iekXFc4NNiQdx3JzgCFLpiECiqf
 NG5upDnyj8QpDISPfbcv4hKu2Xf0yTMrSnW5LBM4jFYMOqJcxJPnwzkwK
 iq4jX0QN+MIKsYMHnnNnPDK3hyrJw+ewmRatOaOSuUnTWPMwOtlnVPSnn
 n2KXXzjSKOBKEMHJVsMWAd7Nj8znUBJYM3CK033bf7jLWNIFpHGFnIiL+
 lNCO1MKveID7nGOIcU0RnP+zVARGfJUsv0wTbRjRzcEikjeFpjVv9n39E
 FCAVjJsgTmYsCCIbrfs/EfwthD9SVfs/ExyO9Puc+E0s+iZ+d9W+El7TO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="386572879"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="386572879"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 06:30:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="925963037"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="925963037"
Received: from suthengc-mobl1.gar.corp.intel.com (HELO intel.com)
 ([10.215.154.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 06:30:20 -0700
Date: Fri, 6 Oct 2023 15:30:13 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915: Remove xehpsdv support
Message-ID: <ZSAL5VZ9BFMzDnQR@ashyti-mobl2.lan>
References: <20231006083103.660153-1-tvrtko.ursulin@linux.intel.com>
 <20231006083103.660153-4-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006083103.660153-4-tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

On Fri, Oct 06, 2023 at 09:31:03AM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> XeHP SDV was a pre-production hardware used to bring up ATS and was not
> generally available. Since latter was since explicitly added, there is no

mmhh?

> need to keep the code for the former around.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

didn't spot anything odd... looks good:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
