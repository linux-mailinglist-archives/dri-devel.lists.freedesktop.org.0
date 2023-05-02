Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF74C6F3E9C
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 09:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 527BA10E37D;
	Tue,  2 May 2023 07:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B5E10E1D6;
 Tue,  2 May 2023 07:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683014123; x=1714550123;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=g0FyRCCiikiQvyuNavsxbmENCxRQwRaBjdxw2Ndg0iU=;
 b=NGybmO8WT5Veusq4j9Sq+9XXkQwzAbXlBw8mrN55Oufgey64tNA4/e59
 99NiWgaIYqNmbwWU4bjXkZb9y7hCFoduxt8SAiL4q1jkjXIjOStN0IRuD
 GUm5oBhRTyY7zVsCskR4sJ0KCj8lXhhrEFuRP+I0EYF1xt+BONGSy+lda
 gKnYcp1hM6WHFdqko9BkEGniBRLOkhuyA5GC4/6tOVcj5Cd3R8Qr17F+x
 Db+7cxE7Ip6kOtpLwd9MLM4pYmpt9t0ul/1CxEet3c7ORxIV9lJatDYBM
 K+UoCJwre5YRZokpaHRg2FlhsBQamXF1J8QBlDduQ8fAvBCdFi73/grXi g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="328708039"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; d="scan'208";a="328708039"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 00:55:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="765668566"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; d="scan'208";a="765668566"
Received: from xinpan-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.163])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 00:55:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: [Intel-xe] [PATCH 02/14] drm/xe: Introduce the dev_coredump
 infrastructure.
In-Reply-To: <20230426205713.512695-3-rodrigo.vivi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
 <20230426205713.512695-3-rodrigo.vivi@intel.com>
Date: Tue, 02 May 2023 10:55:14 +0300
Message-ID: <878re72mn1.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 26 Apr 2023, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> +	drm_info(&xe->drm, "Check your /sys/class/drm/card<n>/device/devcoredump/data\n");

Drive-by comment, could use %d and xe->drm.primary->index instead of
<n>.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
