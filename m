Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3458B7CD2CB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 06:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BBC310E365;
	Wed, 18 Oct 2023 04:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786B810E365;
 Wed, 18 Oct 2023 04:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697601950; x=1729137950;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tqcVweOtsfZgecZWUig+Nk3Ue2adxhPy/GlQR1MTrA8=;
 b=eyarefjYj1vqIPl/3p0OHYbQddu5V73bAWLMIcTDZIoQS2RY1avuj0RQ
 Fp1WBHLsSfyAZDJZ0DMdW0m228mixVBqXL3vpW9mrxR36lAl8s1/qy3Yp
 dZUl1r0S3PHZ4ISe5i24mRYPmWaqOBIlSWtkBhfj/uxCwTg+RlKT69VWv
 8wAwo2Pu5qkswJ/XtIjLGKcJWjnqsHiK9hnV4H9/ybkraKtkzJGg5I4pj
 zG1o4/NgLiP1htn+NvIdRwZyIo4lq7NGzsiif0qP+duZhlHQil8FWxZwz
 wM0YHcluC1sTnbSG1bayXBPkXKJru8WF3/Tuyvf1Gcrj79pick3bNEwqd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="388795564"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="388795564"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 21:02:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="826704137"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="826704137"
Received: from kchua1-mobl1.gar.corp.intel.com (HELO intel.com)
 ([10.215.248.174])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 21:02:34 -0700
Date: Wed, 18 Oct 2023 06:02:27 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/mtl: Don't set
 PIPE_CONTROL_FLUSH_L3
Message-ID: <ZS9Y09FMeCWX/XrL@ashyti-mobl2.lan>
References: <20231017195309.2476088-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017195309.2476088-1-vinay.belgaumkar@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 dri-devel@lists.freedesktop.org, Mika Kuoppala <mika.kuoppala@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vinay,

On Tue, Oct 17, 2023 at 12:53:09PM -0700, Vinay Belgaumkar wrote:
> This bit does not cause an explicit L3 flush. We already use
> PIPE_CONTROL_DC_FLUSH_ENABLE for that purpose.
> 
> v2: Use FLUSH_L3 only pre-MTL since spec will likely remain
> the same going forward.
> 
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Mika Kuoppala <mika.kuoppala@intel.com>
> Acked-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
