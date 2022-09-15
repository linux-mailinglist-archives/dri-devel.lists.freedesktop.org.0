Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8EC5BA26D
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 23:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417AE10E2D3;
	Thu, 15 Sep 2022 21:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968A010E2D3;
 Thu, 15 Sep 2022 21:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663278126; x=1694814126;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ywgF09317S/Y7yglc5gRnqkxY/cu5enK5S1NIJFB6qw=;
 b=ds38l9hF8dI9nNrAaOKibjwBImneJ5I4PGcFKJFTC0wMcdlhC9Tr/QzG
 ycwuCLwMxfIDt5kDKsAzt6zXUNnNqkYTdqI6D3AKaMMujbfmchkcv4sVT
 71QOlYP6ILXjTemzW1Q216aKDsUZxS3cDGLhmCJsf8FyHYdI1Gtqa7JaG
 uFtUOjFtqUbFXOZxbeBBxNisGH13r6JAquY4rnYV8gP8hQdENc0K8ibrn
 B7IpIES/RYQ+bY6E8xCM53Oou753UMhXSIRV0ZUNbmQgnECV90y4Wmna5
 soJC26zk095/xCh/QZ2ZqXPox1PnPTgF8I6spRnMX562w6sx0GXade4jP Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="278573974"
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="278573974"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 14:42:05 -0700
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="648008573"
Received: from eramir3-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.249.46.27])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 14:42:04 -0700
Date: Thu, 15 Sep 2022 23:41:43 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 0/4] Further multi-gt handling
Message-ID: <YyOcFzZnIWqkkjZ7@alfio.lan>
References: <20220914220427.3091448-1-matthew.d.roper@intel.com>
 <87czbwsu38.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87czbwsu38.fsf@intel.com>
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

Hi Jani,

On Thu, Sep 15, 2022 at 03:25:15PM +0300, Jani Nikula wrote:
> On Wed, 14 Sep 2022, Matt Roper <matthew.d.roper@intel.com> wrote:
> > Now that MTL is going to start providing two GTs, there are a few more
> > places in the driver that need to iterate over each GT instead of
> > operating directly on gt0.  Also some more deliberate cleanup is needed,
> > in cases where we fail GT/engine initialization after the first GT has
> > been fully setup.
> 
> Hijacking the thread a bit, not to be considered a blocker for this
> series:
> 
> Is there a plan to kzalloc i915->gt[0] too in intel_gt_probe_all() so we
> wouldn't need to have intel_gt gt0 in struct drm_i915_private? And the
> to_gt() inline would return i915->gt[0] instead of &i915->gt0? (And
> maybe i915_drv.h wouldn't need the definition of intel_gt anymore! :o)

I had a patch that was doing that and sent it long time ago and
it was rejected.

I can't find it but I will check better to see what was the
reason for it to be rejected.

Andi
