Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C9A7B1E5A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 15:28:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58BEB10E660;
	Thu, 28 Sep 2023 13:28:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE70D10E65F;
 Thu, 28 Sep 2023 13:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695907717; x=1727443717;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YqaMZ66o5P06nJDpTMUxdS/zsr42Y54Zbu4+HaglCQE=;
 b=VDwkm46x0zfBOOYZXx4d+JzwEvCytZV7/pfmy5k49cEOOQ2AHaiPuqQI
 o/zed3r4Fo4mSCkF6I7PqIzIVsfmCGU1V1BZc8s68H6+gW3Hl+iK88yKO
 4gz/LYZsZO076Xo9WQwlinTXXnLeHnKHAaj4OblUqibQjA50r5TaFvwE2
 fVkdaNxJkXk3jWdDCVcz44g8SLezinixP+4Kec0CPkB467G/k9kLKyMJW
 zn03SVf2Qw0IN49tAv+F5KKi1S9Z3Lbb35qek31CnuvAQ1yUZhoCO+6L3
 /UDDF1zKqglvTiycgYTvGdcX6nZqH96SpgcZ/wz18rn7P9CakW84ztuXz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="673572"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="673572"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 06:28:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="726234015"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="726234015"
Received: from mabrazak-mobl.gar.corp.intel.com (HELO intel.com)
 ([10.214.160.185])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 06:28:04 -0700
Date: Thu, 28 Sep 2023 15:27:57 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH v7 1/4] drm/i915: Introduce intel_gt_mcr_lock_sanitize()
Message-ID: <ZRV/XR441w0a2Dt0@ashyti-mobl2.lan>
References: <20230928130015.6758-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928130015.6758-1-nirmoy.das@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, matthew.d.roper@intel.com,
 andi.shyti@linux.intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

On Thu, Sep 28, 2023 at 03:00:12PM +0200, Nirmoy Das wrote:
> Implement intel_gt_mcr_lock_sanitize() to provide a mechanism
> for cleaning the steer semaphore when absolutely necessary.
> 
> v2: remove unnecessary lock(Andi, Matt)
>     improve the kernel doc(Matt)
>     s/intel_gt_mcr_lock_clear/intel_gt_mcr_lock_sanitize
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
