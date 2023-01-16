Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5630566CF3E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 19:59:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B8510E498;
	Mon, 16 Jan 2023 18:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E916610E498;
 Mon, 16 Jan 2023 18:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673895538; x=1705431538;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aGU8qAGzQjOZSpd6NxfY+K2ZmcUOdfUk8yRqm1ggQyU=;
 b=VrExspb4OVw4kRsqiPzis9qQ8+4caaMFjf+yiFIQLD0EjAQa6oLdfBq3
 KtIDFULCP523Rep0Pq+rYNGs51yfO6ure67CZYchrClGe+C8YQlvRB71r
 gUHxPE0TuH32rM60ZOfs4soasdQ6zIOQtVbJ/QljuvktLegMUgoI+QUqi
 kZeGhFv4QgkBOk1OqVgH5TV6MVtnsmk/OrXdetaIKjLKgydNJFeIB1qqL
 zdvckzITLVBmzacmkgLBo9+RjdI6C9cV2AyvSaYrwZidfegQi0bOcanw7
 SpYANQE/bHcdhP7kRRjE/c2wfBv8Ik+QYZgnuX2V+jb6X2J7QCmE8oY3S w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="308093048"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; d="scan'208";a="308093048"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 10:58:57 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="609016272"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; d="scan'208";a="609016272"
Received: from rhormila-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.251.222.100])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 10:58:54 -0800
Date: Mon, 16 Jan 2023 19:58:51 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Connect root sysfs entries to
 GT0
Message-ID: <Y8Wea4b+mot7oVrB@ashyti-mobl2.lan>
References: <20230113022752.3151066-1-vinay.belgaumkar@intel.com>
 <874jsvazvi.wl-ashutosh.dixit@intel.com>
 <db1160e1-cfc1-08d0-08b7-84909608b465@intel.com>
 <87358faw34.wl-ashutosh.dixit@intel.com>
 <82e45200-8a95-ec9a-6dba-766f6c23c7fd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82e45200-8a95-ec9a-6dba-766f6c23c7fd@intel.com>
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
Cc: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jan 12, 2023 at 08:48:11PM -0800, Belgaumkar, Vinay wrote:
> 
> On 1/12/2023 8:37 PM, Dixit, Ashutosh wrote:
> > On Thu, 12 Jan 2023 20:26:34 -0800, Belgaumkar, Vinay wrote:
> > > I think the ABI was changed by the patch mentioned in the commit
> > > (a8a4f0467d70).
> > The ABI was originally changed in 80cf8af17af04 and 56a709cf77468.

In theory the ABI has never changed, we just needed to agree once
and for all what to do when reading the upper level interface.
There has never been a previous multitile specification before
this change.

There have been long and exhaustive discussions on what to do and
the decision is that in some cases we show the average, in others
the maximum. Never the GT0, though.

> Yes, you are right. @Andi, did we have a plan to update the IGT tests that
> use these interfaces to properly refer to the per GT entries as well? They
> now receive average values instead of absolute, hence will fail on a
> multi-GT device.

I don't know what's the plan for igt's.

Which tests are failing? I think we shouldn't be using the upper
level interfaces at all in IGT's. Previously there has been an
error printed on dmesg when this was happening. The error has
been removed in order to set the ABI as agreed above.

Andi
