Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C53C81F9FF
	for <lists+dri-devel@lfdr.de>; Thu, 28 Dec 2023 17:42:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869D389EFF;
	Thu, 28 Dec 2023 16:42:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CF889EFF;
 Thu, 28 Dec 2023 16:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703781732; x=1735317732;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bGoDjQUeOkn6UgVsqR9D7ly0PoUYf0ufzyTN3TMtWd8=;
 b=SO35jwxJAeID72TKmAAHUWQ2DscJNwXhb3624XmzxlMzuQ2M3fdhV27H
 4X+IlwgfmxCxK78+1j4cCIdmf61t3uXE7e5upZvuRIF/yjYV2gdJV8jbD
 RaHCT/X+HbHhThrKDIdqsFktdvZN4VCaRUjpHmWXbTs70iI/pwk5lWzDt
 /lzU+GMNL3DJDA+ClncPr7O8foRFi5uQ+LHB8owUdiKhIHXlmgCRM7uC/
 sVzVaoF016MUbCgk3OTixbY/OFpbTdbp7jzznolHN8xTCfRWthQ008zzv
 N0S129WrXI/yF8qX2xzgauo+waALTq1m4CR0/D4EastRZ+gKY3axp6H8+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="3640312"
X-IronPort-AV: E=Sophos;i="6.04,312,1695711600"; 
   d="scan'208";a="3640312"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2023 08:42:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="771754101"
X-IronPort-AV: E=Sophos;i="6.04,312,1695711600"; d="scan'208";a="771754101"
Received: from ceyeghel-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.252.50.226])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2023 08:41:59 -0800
Date: Thu, 28 Dec 2023 17:41:56 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 4/4] drm/i915/perf: reconcile Excess struct member
 kernel-doc warnings
Message-ID: <ZY2lVLEaOI3XVZUs@ashyti-mobl2.lan>
References: <20231226195432.10891-1-rdunlap@infradead.org>
 <20231226195432.10891-4-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231226195432.10891-4-rdunlap@infradead.org>
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

On Tue, Dec 26, 2023 at 11:54:32AM -0800, Randy Dunlap wrote:
> Document nested struct members with full names as described in
> Documentation/doc-guide/kernel-doc.rst.
> 
> i915_perf_types.h:341: warning: Excess struct member 'ptr_lock' description in 'i915_perf_stream'
> i915_perf_types.h:341: warning: Excess struct member 'head' description in 'i915_perf_stream'
> i915_perf_types.h:341: warning: Excess struct member 'tail' description in 'i915_perf_stream'
> 3 warnings as Errors
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
