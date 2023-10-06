Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C52F77BB568
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 12:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D60610E1EF;
	Fri,  6 Oct 2023 10:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C682110E06B;
 Fri,  6 Oct 2023 10:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696588777; x=1728124777;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jz9eFHyZAbnqRayphCxoYX5NWy7Yh64LIVwzNXzxnD0=;
 b=eTU7r+wSiC9JmZVfKHwBA8YfotxYErxRbE5ocnPGkwNwBkLcVcGrFCyA
 ypdgYz32Y0TtZoi/knB4zi3zgtWIka10CGY8C1rkx+PC+caQgYcypywDS
 +UvpCbO9/WMx/mmW7HBgmd4+mHFdf1WGK3Pl/vCl5cESPYbZSZVAJWzxi
 0SaYlfRPDjL4tw9I+kpn73FT+VtIQutKoiJH0AAzclkw55O/plvK1kX6p
 LYP0PM9vUPLCccOHHtSCkiEwLeG6cMCmHImMorh2i7BBtK5KBDxTnhvdi
 uLkAqUyGFsbgWd1ND4WY2MSbj3s0MQ6qNac0ssj2vAYv8oFHn8vMGpGt4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="447913166"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="447913166"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:39:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="728800982"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="728800982"
Received: from suthengc-mobl1.gar.corp.intel.com (HELO intel.com)
 ([10.215.154.2])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:39:31 -0700
Date: Fri, 6 Oct 2023 12:39:23 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915: Remove early/pre-production
 Haswell code
Message-ID: <ZR/j271EPnQl/KJT@ashyti-mobl2.lan>
References: <20231006083103.660153-1-tvrtko.ursulin@linux.intel.com>
 <20231006083103.660153-2-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006083103.660153-2-tvrtko.ursulin@linux.intel.com>
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

On Fri, Oct 06, 2023 at 09:31:01AM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> It is not our policy to keep pre-production hardware support for this long
> so I guess this one was just forgotten.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
