Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D020439D54
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 19:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5CDB89EAC;
	Mon, 25 Oct 2021 17:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A4889EAC;
 Mon, 25 Oct 2021 17:17:59 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10148"; a="229567902"
X-IronPort-AV: E=Sophos;i="5.87,181,1631602800"; d="scan'208";a="229567902"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 10:17:59 -0700
X-IronPort-AV: E=Sophos;i="5.87,181,1631602800"; d="scan'208";a="536664172"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 10:17:59 -0700
Date: Mon, 25 Oct 2021 10:13:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Subject: Re: [PATCH] drm/i915/guc: Fix recursive lock in GuC submission
Message-ID: <20211025171321.GA9338@jons-linux-dev-box>
References: <20211020192147.8048-1-matthew.brost@intel.com>
 <a2d6a96b3f360991511e6e4969de83cea2f5a97a.camel@linux.intel.com>
 <163516458029.3804.14322548249266136569@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <163516458029.3804.14322548249266136569@jlahtine-mobl.ger.corp.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Mon, Oct 25, 2021 at 03:23:00PM +0300, Joonas Lahtinen wrote:
> Quoting Thomas Hellström (2021-10-21 08:39:48)
> > On Wed, 2021-10-20 at 12:21 -0700, Matthew Brost wrote:
> 
> <SNIP>
> 
> > > Fixes: 1a52faed31311 ("drm/i915/guc: Take engine PM when a context is
> > > pinned with GuC submission")
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Cc: stable@vger.kernel.org
> 
> This Cc: stable annotation is unnecessary.
> 
> Please always use "dim fixes 1a52faed31311" for helping to decide which
> Cc's are needed. In this case stable is not needed. If it was, there
> would be an indication of kernel version. In this case this is fine to
> be picked up by in drm-intel-next-fixes PR.
> 
> Let's pay attention to the right Fixes: annotation while submitting and
> reviewing patches.
> 

Will do. Working on getting push rights. Is there any documentation with
all the rules when pushing as it seems like there are a lot of rules.

Matt 

> Regards, Joonas
