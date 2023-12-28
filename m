Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAD181F9E8
	for <lists+dri-devel@lfdr.de>; Thu, 28 Dec 2023 17:21:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE1410E0DF;
	Thu, 28 Dec 2023 16:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2E210E0DE;
 Thu, 28 Dec 2023 16:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703780475; x=1735316475;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vPPwiSf/usejUsjALBFvqgyVM1AHjnr7aw+GHuW/3LA=;
 b=ncXu2KjcoNLqSPIamF7ZEcT6RlZQKwd6WAwu8YPtk7eCGOOC27YLSVvd
 1OH0+3aHwuxvnlzIr/RUgow1fniIaisoP4u+aJlkiWJI8odH7J5BO6kOw
 Xb72Fc6H27ab3m1pDiQ7hGg2MzBcTXSmK4qiNB+A/n9bJQ1ybadcX4MST
 HSvYUp6j/kv9+CMfoJUl2pwRYafvlh5pdKMellJmNNplEq3nlCYWuF8zr
 imB2WdCzK1plJZzxPVq7ZKYrPJXyfTaP+Tz9LluEJTLcG0k3qAf2b/I/b
 PwKp8IYN5SbAPN0MjPAFVX6qPxDR7QKcxi6fYPahpSLOnpdW9LXwYTR1D w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="10118872"
X-IronPort-AV: E=Sophos;i="6.04,312,1695711600"; d="scan'208";a="10118872"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2023 08:21:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="812827906"
X-IronPort-AV: E=Sophos;i="6.04,312,1695711600"; d="scan'208";a="812827906"
Received: from ceyeghel-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.252.50.226])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2023 08:21:11 -0800
Date: Thu, 28 Dec 2023 17:21:07 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 1/4] drm/i915/gem: reconcile Excess struct member
 kernel-doc warnings
Message-ID: <ZY2gc0gaR5i1Yct9@ashyti-mobl2.lan>
References: <20231226195432.10891-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231226195432.10891-1-rdunlap@infradead.org>
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
Cc: intel-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Corbet <corbet@lwn.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Randy,

On Tue, Dec 26, 2023 at 11:54:29AM -0800, Randy Dunlap wrote:
> Document nested struct members with full names as described in
> Documentation/doc-guide/kernel-doc.rst.
> 
> i915_gem_context_types.h:420: warning: Excess struct member 'lock' description in 'i915_gem_context'
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: dri-devel@lists.freedesktop.org
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
