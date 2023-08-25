Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F38FF788365
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 11:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2333210E0A4;
	Fri, 25 Aug 2023 09:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8375610E0A4
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 09:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692955178; x=1724491178;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=arD+8plaFcQa1QmO7uQcY+oZeKgXilhGtFgiWUGy3U4=;
 b=DWkPh2vfUmfDUbfQGEoVEZUUHGBOXcriw8T52TUXBKfVuj5pWVoZ+PNY
 HH6RnRKo9kTAZc6+brE8krR8nDCzu6C+V16wB9CRa/6OmjhJziVwqeGvz
 eMDErhcr7e4+94PKDauQiXAUouII+YfBHLSQWya2+0vA2aJzRmBIpd5r3
 EOW+86LAOzWX0jvZyc0ys/HJhghI5mtE9HTG2RyCI1Ty7dCAHW2Br8uZ+
 wxzhsE3918rdb/VFUswTkajcla7ze+bzSQhVk2PR98tXxuc82iDkPi6ma
 74w4mUIpplAQdMCy1V40vXM5dZ9S5hMJxFcVfdedsf/feaCAir+PyRUUP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="438613021"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="438613021"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 02:19:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="737417108"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="737417108"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 02:19:36 -0700
Date: Fri, 25 Aug 2023 11:19:34 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH] habanalabs/gaudi: refactor deprecated strncpy
Message-ID: <20230825091934.GC3748525@linux.intel.com>
References: <20230824-strncpy-drivers-accel-habanalabs-gaudi-gaudi-c-v1-1-a7fb9054734c@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824-strncpy-drivers-accel-habanalabs-gaudi-gaudi-c-v1-1-a7fb9054734c@google.com>
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
Cc: Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 24, 2023 at 08:41:26PM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> A suitable replacement is `strscpy` [2] due to the fact that it
> guarantees NUL-termination on its destination buffer argument which is
> _not_ the case for `strncpy`!
> 
> Link: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings[1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
