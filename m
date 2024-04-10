Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B26F889F9AF
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 16:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0091133BB;
	Wed, 10 Apr 2024 14:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jo6Axgvi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D26561133BA;
 Wed, 10 Apr 2024 14:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712758534; x=1744294534;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lgWonirOd1sETtARBNmw+prVzZI11W2GXt5RjcCG9OA=;
 b=Jo6Axgvi5cFNpSBLOFHeshiDFFaQgGCrOXQv8o7r+Bhemuee/fClzC7w
 E33pp/5Xnycm10NCN04Vv3f7+DK94I/rqXhK8B+YmYpsy3NPfZnZ483yF
 nJL1JUD0W7FehwOD7gAAwothcCBREDcfFSzZXnvPWQ6+CFJm+WMFxTtF8
 m8KTeHeV6+YhSmRSt8B/L6Mg5oJx7o47Y4ia7Qdl0wS8IfvJD2jXNMjoI
 IQPxutL3g2wzrF+eWtsdaXwrRTPOWb7nzGFyrHbJ+NviU8KJwPDYk4kOA
 CsWWpPklxkiWZApdveiEgbRPBO8tXpY8I7KUtNYlakNEk9xj4JD9eKjt2 w==;
X-CSE-ConnectionGUID: V8AQIWd0QBmiEZs9bcsA0w==
X-CSE-MsgGUID: vMN87GEkT5yLBd3xm0OOfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8247847"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8247847"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 07:15:28 -0700
X-CSE-ConnectionGUID: Z7Q+9EQiQQSo04m09Ar0NQ==
X-CSE-MsgGUID: 89xpGK3SSIOnUiPHzkuudA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20994932"
Received: from unknown (HELO intel.com) ([10.247.118.254])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 07:15:23 -0700
Date: Wed, 10 Apr 2024 16:15:16 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 02/10] drm: move intel-gtt.h under include/drm/intel
Message-ID: <Zhae9Cq37WShh7ge@ashyti-mobl2.lan>
References: <cover.1712743191.git.jani.nikula@intel.com>
 <25b1e49297bcc2eda2a626e7fd0ee398df9e3f70.1712743191.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25b1e49297bcc2eda2a626e7fd0ee398df9e3f70.1712743191.git.jani.nikula@intel.com>
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

On Wed, Apr 10, 2024 at 01:05:09PM +0300, Jani Nikula wrote:
> Clean up the top level include/drm directory by grouping all the Intel
> specific files under a common subdirectory.
> 
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
