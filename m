Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E3CB5A227
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 22:15:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C29210E78D;
	Tue, 16 Sep 2025 20:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WGqHsA13";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FFD210E785;
 Tue, 16 Sep 2025 20:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758053708; x=1789589708;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3iyON+nEaUeayWRu3kFnsphO+ZdJd4jMaHXSYCzOJkI=;
 b=WGqHsA13nSC+N2yUt6WvTh2I10jiG+iQAgp8503pwF3/Jtn+yptvReUn
 hEExe5u9zDyY7a3PSbFWHAo2BZm8idy+cNEo0vwdb0VojzNz6wU1Qt6c5
 0p+xB06jyLrdB9gHrdUUsBoKONvXBFW6E2Mse8EPxgKOCSij7C/qPs8yl
 z7nkSFrzMyeuRng7DTJDGbyRjkXDI0pEp5ejlOdr+7GQu9ozm8n66Ux/1
 S390965tTCnkPYYztB+SfTKDJ3DfWRZqRWKkfm7+RQX8/umrXlhKrhMsE
 8+WI8MLMqp2LH4ohSzLID4ftIIuDrB7EBCi1NIDKRYvRpnD86r/KIZES2 A==;
X-CSE-ConnectionGUID: nhN+BFSZTmKAryDC0UiFxg==
X-CSE-MsgGUID: 7rpwszY7Qh2SmvFhnwQHfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="82944084"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="82944084"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 13:15:07 -0700
X-CSE-ConnectionGUID: 6YZwoslXTCyFHRiasq2UyQ==
X-CSE-MsgGUID: v43ZYwt0TBakltTpP7G/+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="174853461"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 13:15:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 airlied@gmail.com, simona@ffwll.ch, Yang Li <yang.lee@linux.alibaba.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next] drm/xe: Remove duplicate header files
Date: Tue, 16 Sep 2025 13:14:46 -0700
Message-ID: <175805362854.2339703.13765857337956924451.b4-ty@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250916021039.1632766-1-yang.lee@linux.alibaba.com>
References: <20250916021039.1632766-1-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Tue, 16 Sep 2025 10:10:39 +0800, Yang Li wrote:
> ./drivers/gpu/drm/xe/xe_tlb_inval.c: xe_tlb_inval.h is included more than once.
> ./drivers/gpu/drm/xe/xe_pt.c: xe_tlb_inval_job.h is included more than once.
> 
> 

I did some minor tweaks in the commit message and applied to
drm-xe-next. Thanks.

[1/1] drm/xe: Remove duplicate header files
      commit: 9e6eb49ec13936461c697348c74e5450ac82707d

-- 
Lucas De Marchi

