Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6082D79383B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 11:30:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD9410E5B5;
	Wed,  6 Sep 2023 09:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E3B10E5B5;
 Wed,  6 Sep 2023 09:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693992596; x=1725528596;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=InuUFgNUsul1w70mGZDKR5EL1cwSsb7qff6mKym4wiI=;
 b=B4XI4lvXeOJUl0RiKFAQk8MQXK35WfMa45i8dH14nSCIGgs+/hEjPRBB
 6WW2o45/v0xB0Jc06YCBRLuSdc5rQMjohlTwWnkI+K6tYTd1vMyuVy6P3
 qVSFB7mlsWMeyWUSsLlpRmkaq1CF5weK8c2m+F0pc3yV0yr/8mH9x+cIk
 Crop2Aq1Ijw3rlKOTHUGun1bGzJXc9eTjE6nraHwHw0CBdC9JCuVMZ9Ww
 97gk6Jc4ApRCk575sQgdLhkFEJ1MHpAv7Jm6yiBog+i3f8N6ojv4d6Za7
 D8mGTq2N3642/L90S3u99jMjSatyPxp0i6/WLj1nEpAYiAnFnNVeAuXPx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="367237148"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="367237148"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 02:29:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="776528961"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="776528961"
Received: from kmiranda-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.216.135])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 02:29:52 -0700
Date: Wed, 6 Sep 2023 11:29:48 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Drop force_probe requirement
Message-ID: <ZPhGjLtIcsA3G8vP@ashyti-mobl2.lan>
References: <20230905193624.525020-1-radhakrishna.sripada@intel.com>
 <ZPhFj0H8OYtp1CGh@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZPhFj0H8OYtp1CGh@ashyti-mobl2.lan>
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
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 intel-gfx@lists.freedesktop.org, Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 rodrigo.vivi@intel.com,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > Meteorlake has been very usable for a while now, all of uapi changes
> > related to fundamental platform usage have been finalized and all
> > required firmware blobs are available. Recent CI results have also
> > been healthy, so we're ready to drop the force_probe requirement and
> > enable the platform by default.
> > 
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> 
> Please keep me in the loop as well... It's been a year I've been
> working for this patch to work :)

not just me, but also (in alphabetical order):

  Andrzej Hajda <andrzej.hajda@intel.com>
  Chris Wilson <chris.p.wilson@linux.intel.com>
  Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
  Jonathan Cavitt <jonathan.cavitt@intel.com>
  Nirmoy Das <nirmoy.das@intel.com>

Thanks!
Andi
