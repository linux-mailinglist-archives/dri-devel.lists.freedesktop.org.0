Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 558B77B1ECE
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 15:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F08410E664;
	Thu, 28 Sep 2023 13:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87DD10E664;
 Thu, 28 Sep 2023 13:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695908660; x=1727444660;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XPYse5/U5hMo7ybyETO5hLLZioeIOaCSCqotyuncHOU=;
 b=BcUa6bxfQcWH5eqAw4iClzlh7QGefYC7JI4tytP/3bm5StBkyIGU2po3
 h23ckJM62bTkMuSsp1KnbmQUmWFNx/YzCCV0x2ju8gUSJQgrMgI9xXcq4
 k3h0B9GIiMKgi/KsdUQNFWWwxqv6OGF4e9o8zLzhxZ7PfLQiraO99dRq0
 eK5dvQcJpyq5YhFWAESYwYzgeKAKmS3/Lx60cvwPMdgu/OuQ6a7SV2Gxt
 FFdLr/zSkOb+JS9OWsZmGtljiO5GBzDNcDl5PzvjLWm0B/Ooh0q62inaZ
 CkJg/ESjPsmZodop30r8rUhbEA7Li1DvnPn44HBUUkK+oy5+LvHnkVWO0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="446214651"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="446214651"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 06:28:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="743076292"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="743076292"
Received: from mabrazak-mobl.gar.corp.intel.com (HELO intel.com)
 ([10.214.160.185])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 06:28:43 -0700
Date: Thu, 28 Sep 2023 15:28:37 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH v7 2/4] drm/i915: Introduce the intel_gt_resume_early()
Message-ID: <ZRV/hUHfqbwajEJq@ashyti-mobl2.lan>
References: <20230928130015.6758-1-nirmoy.das@intel.com>
 <20230928130015.6758-2-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928130015.6758-2-nirmoy.das@intel.com>
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

On Thu, Sep 28, 2023 at 03:00:13PM +0200, Nirmoy Das wrote:
> Move early resume functions of gt to a proper file.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
