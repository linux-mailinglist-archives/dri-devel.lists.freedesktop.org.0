Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B65F77C53F4
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 14:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F13910E4DA;
	Wed, 11 Oct 2023 12:27:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4A210E1E1;
 Wed, 11 Oct 2023 12:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697027260; x=1728563260;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=idE2oS7yVV0vjq7IU8rKIdjHqvo3RD2wbqynxjmaFBw=;
 b=eZR3mLCHzrdUQCb6ERRKrV0qbSH2V7QvIJnUKXSEa8rpo8MSawFqq2OV
 4eCZ/BhrN1vb7fpE8uLtCztgI9XnFcdwP+iORlEKXH4J+qwNlT5IsOoku
 /J/J9WyTihJgPCisGG/uyvlcpjWQYa0uaetgzMQnxchts1ha6FhHmKRiv
 4wzmWg8FToA6quLp0LHR82Q2Y9r4mophiW0qHF38HPiM+VvggFOqHNt8G
 viR0I2iJyxwZzX6BL0DrzfyhP529Ze+msL0knn1ME4zDyTqPTIGPMBPtK
 QXGACZ26idy3J20BEj8Wm2rH/rkECu8NI1bCH7V/O0SJxIM1CrFWkz90F Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="369712489"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="369712489"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 05:27:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="753799494"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="753799494"
Received: from lyemeeki-mobl2.gar.corp.intel.com (HELO intel.com)
 ([10.214.156.206])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 05:27:35 -0700
Date: Wed, 11 Oct 2023 14:27:29 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH v2] drm/i915: Prevent potential null-ptr-deref in
 engine_init_common
Message-ID: <ZSaUsY0vzerEA5bJ@ashyti-mobl2.lan>
References: <20231011122547.7085-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011122547.7085-1-nirmoy.das@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Oak Zeng <oak.zeng@intel.com>,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

On Wed, Oct 11, 2023 at 02:25:47PM +0200, Nirmoy Das wrote:
> If measure_breadcrumb_dw() returns an error and bce isn't created,
> this commit ensures that intel_engine_destroy_pinned_context()
> is not called with a NULL bce.
> 
> v2: Fix the subject s/UAF/null-ptr-deref(Jani)
> 
> Fixes: b35274993680 ("drm/i915: Create a kernel context for GGTT updates")
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
