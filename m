Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6979D563CC7
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jul 2022 01:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 445EF10F76A;
	Fri,  1 Jul 2022 23:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F6A10F76A;
 Fri,  1 Jul 2022 23:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656718171; x=1688254171;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zcHxKJol/k8qKzafnE1v4Z1orA5YDf4HMHZwVXKa308=;
 b=NYMsCw5+Ug3EebIXv+JlnPsQfa8cCf7mpOQX4BA6UybkHdBtwMFdPvlv
 SjTGbyiTuZNUoDPaujimBfjWsd0mdK/se3dX0a1s7V1Nut9M6err74viQ
 gBncKTPnhoGHYFJLVTngj7CSw8iVDoQtwask9FtKfO4Yb9M9qKdAtSp2X
 o4NXwzzKWSTS5gqVWAbTHeLMtwzEpbt0ScYxMZIUjIiZuLMc9Je2zRJ2i
 LZfJmAin8NwJjTPf/wqV8oBlpSnRcVvvHSEPE4h1NOOXNq4KEO19L891I
 4R9PGdy2ym7gIEWaj60NTLEa2tyh3jrwhrfW6QZarl7zCIOMJcZUd+TeC Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10395"; a="344447524"
X-IronPort-AV: E=Sophos;i="5.92,238,1650956400"; d="scan'208";a="344447524"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 16:29:31 -0700
X-IronPort-AV: E=Sophos;i="5.92,238,1650956400"; d="scan'208";a="768650738"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 16:29:31 -0700
Date: Fri, 1 Jul 2022 16:29:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 2/2] drm/i915: DG2 and ATS-M device ID updates
Message-ID: <Yr+DWbbLizzHCkeC@mdroper-desk1.amr.corp.intel.com>
References: <20220701152231.529511-1-matthew.d.roper@intel.com>
 <20220701152231.529511-2-matthew.d.roper@intel.com>
 <20220701165950.hfb6dulnaqjmtqhr@ldmartin-desk2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701165950.hfb6dulnaqjmtqhr@ldmartin-desk2>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 01, 2022 at 09:59:50AM -0700, Lucas De Marchi wrote:
> On Fri, Jul 01, 2022 at 08:22:31AM -0700, Matt Roper wrote:
> > Small BAR support has now landed, which allows us to add the PCI IDs
> > that correspond to add-in card designs of DG2 and ATS-M.  There's also
> > one additional MB-down PCI ID that recently appeared (0x5698) so we add
> > it too.
> > 
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> 
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thanks.  Applied to drm-intel-gt-next (since that's the branch that has
the small BAR patches that were a pre-req to adding these IDs) and
dropped the equivalent patch from topic/core-from-CI.


Matt

> 
> Lucas De Marchi

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
