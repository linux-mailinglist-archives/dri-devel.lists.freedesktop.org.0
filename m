Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA84568EA4
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 18:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8A0112DDC;
	Wed,  6 Jul 2022 16:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E316B112DDC;
 Wed,  6 Jul 2022 16:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657123592; x=1688659592;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ltbc29n1dkyWzDSCgIo1DtvV/dyq2GIZlrhkWUkFlco=;
 b=SuN17C3VlI+WqdHK6PQHrXhx4Ueu7+kNSyuP0WKaQa2PMcIbjD3bWha9
 DfL9ZS88RfGL5vMFgsR06S0QX3dwApkQihNnrbLMNvSUJP6N5kVUC+KDp
 16wgsFW/NIoXAbcBuUJhdDF5/TFEV3cU203W07xV0zQ3q0lF0YEXp66uO
 SmikoaMAEveNw87X5CwU7CPp3oIx3keUjmVcWFVhZSFAN/jEeJWr/cQue
 kGj4gsLySNd56wnMk4ZpthieixUREp+bPZVFoRB/FIjKFvfI5bAo9mDPa
 UppZDgNvCWHpNnWXwA+fqBrmrjV9oqXamhanfcpg5F752gdTJHnbcq9l+ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="370113178"
X-IronPort-AV: E=Sophos;i="5.92,250,1650956400"; d="scan'208";a="370113178"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 09:00:06 -0700
X-IronPort-AV: E=Sophos;i="5.92,250,1650956400"; d="scan'208";a="650726356"
Received: from mropara-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.49.154])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 09:00:04 -0700
Date: Wed, 6 Jul 2022 18:00:02 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/selftests: Grab the runtime pm in
 shrink_thp
Message-ID: <YsWxgqZ+DtO1KCeK@alfio.lan>
References: <20220706154738.235204-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706154738.235204-1-matthew.auld@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jul 06, 2022 at 04:47:38PM +0100, Matthew Auld wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> Since we are not holding a wakeref, shrinking a bound object is not
> guaranteed.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6370
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
