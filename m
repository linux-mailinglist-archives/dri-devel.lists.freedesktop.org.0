Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4697475C3E6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 12:00:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3DE10E640;
	Fri, 21 Jul 2023 10:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89AC910E642;
 Fri, 21 Jul 2023 10:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689933619; x=1721469619;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=W/JkJXh9nevGSmt/zzTK5WB4y7jcHDU6G4MERUR6I1Q=;
 b=i3V/C1uhJVc0GyPSzzD9FyKMTzwbhuCmZHaAFuf1z64pmeJpL6ipPdmR
 7zuIOQQ4eNcaHQIr7uQ/lMqrewN8WjxXvuwLgdsSRrjSIkAKN9IHLQcY/
 OqYDcc7NWWdAh0+JKqundjJxy3fcUNuCdlMIobsmVh6ebV9xHyPc88mY5
 3JSEZ33p31JSi1Mgu9hQQk7B3MuvXN74JFZ76zyYvH9XR29NJn+/oZNpq
 l9EFckYfGHxyyVFvKJN9Q+3qWeKwPRyqyH0Brwhwr+qEIlY7fT11eLMow
 pi702cn2Y6wayo/AVKRgexzcbLeYrFkpK7n2chMO2rXBRc/H4evJSp0WK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="369659816"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="369659816"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 03:00:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="790151520"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="790151520"
Received: from hbockhor-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.54.104])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 03:00:15 -0700
Date: Fri, 21 Jul 2023 12:00:12 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH v7 2/9] drm/i915: Add the has_aux_ccs device
 property
Message-ID: <ZLpXLIVb5DUm8xSx@ashyti-mobl2.lan>
References: <20230720210737.761400-1-andi.shyti@linux.intel.com>
 <20230720210737.761400-3-andi.shyti@linux.intel.com>
 <26ccff3c-b50a-e6e6-97d1-18bb40833108@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26ccff3c-b50a-e6e6-97d1-18bb40833108@intel.com>
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 linux-stable <stable@vger.kernel.org>, Chris Wilson <chris@chris-wilson.co.uk>,
 dri-evel <dri-devel@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej,

On Fri, Jul 21, 2023 at 11:41:22AM +0200, Andrzej Hajda wrote:
> On 20.07.2023 23:07, Andi Shyti wrote:
> > We always assumed that a device might either have AUX or FLAT
> > CCS, but this is an approximation that is not always true as it
> > requires some further per device checks.
> > 
> > Add the "has_aux_ccs" flag in the intel_device_info structure in
> > order to have a per device flag indicating of the AUX CCS.
> 
> As Matt mentioned in v6, aux_ccs is present also in older platforms.
> This is about presence/necessity (?) of aux_ccs table invalidation.
> Maybe has_aux_ccs_inv, dunno?

yes, true! It's aux_ccs_inv.

> Moreover you define flag per device, but this is rather per engine,
> theoretically could be also:
> MTL:
> .aux_ccs_inv_mask = BIT(RCS0) | BIT(BCS0) | ...
> Others:
> .aux_ccs_inv_mask = BIT(RCS0) | ...

there is already some engine discrimination that is mandatory
later in the series. Doing it here it's a bit replicated.

> looks overkill,
> maybe helper function would be simpler, up to you.

Yes, a helper function that checks on the platform and returns
true or false... it looks hardcoded to me, while the info
structure is hardcoded by definition and looks easier to
maintain by just toggling on/off a single flag in that structure.
That's why I decided to place it there.

But, because there are already two people suggesting it, then I
will try it in v8.

Thanks,
Andi
