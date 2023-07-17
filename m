Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5F6756F2A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 23:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724F010E183;
	Mon, 17 Jul 2023 21:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3441510E14F;
 Mon, 17 Jul 2023 21:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689630894; x=1721166894;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ElIHn6hBqwLfRrs0obXHmv9S/gTj2Fw1lEgqFWi9kJ0=;
 b=Vz1WBWHwR2wRDAsYpSk6iMhER2rOEsRENEcQE7u7AaaZ18pSt+CrAJMF
 SLzvfRQvB/uOnsvrCYWz1k2WoPPRBFIrjLCkJf+kZm+o2ivWUuTI4j7Pt
 Y+lS5QkBXeUv5c2Ir0TTh0Rgw0gQRmD4nzbiqOjTUFfmR3LcHUGHkFzx/
 PbgaAnhQWvqugifDUfBKfhpJyNAVMDQf7ixcst7CJsj021lS/s8/Ebu1v
 qGDTtNKOrNeUTg7I576yTv3qbW8/gSexiP8G3Bdh6fZ9HXG8LVKPJ0vd4
 39WUMWzq1dCl9c7B+iYngcMrpPENgNCSrGcuYrvdC1IwNBF+xD1A/QeKT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="452423339"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="452423339"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 14:54:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="837046161"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="837046161"
Received: from jplazoni-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.55.169])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 14:54:50 -0700
Date: Mon, 17 Jul 2023 23:54:42 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH v4 3/6] drm/i915/gt: Rename flags with
 bit_group_X according to the datasheet
Message-ID: <ZLW4oqGarqzWv2fc@ashyti-mobl2.lan>
References: <20230717173059.422892-1-andi.shyti@linux.intel.com>
 <20230717173059.422892-4-andi.shyti@linux.intel.com>
 <e951e0c3-23e8-75aa-f58a-5aa99a7d4598@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e951e0c3-23e8-75aa-f58a-5aa99a7d4598@intel.com>
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
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej,

On Mon, Jul 17, 2023 at 08:21:40PM +0200, Andrzej Hajda wrote:
> On 17.07.2023 19:30, Andi Shyti wrote:
> > In preparation of the next patch allign with the datasheet (BSPEC
> > 47112) with the naming of the pipe control set of flag values.
> > The variable "flags" in gen12_emit_flush_rcs() is applied as a
> > set of flags called Bit Group 1.
> > 
> > Define also the Bit Group 0 as bit_group_0 where currently only
> > PIPE_CONTROL0_HDC_PIPELINE_FLUSH bit is set.
> > 
> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > Cc: <stable@vger.kernel.org> # v5.8+
> > ---
> >   drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 34 +++++++++++++-----------
> >   1 file changed, 18 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > index bee3b7dc595cf..3c935d6b68bf0 100644
> > --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > @@ -210,7 +210,8 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
> >   		mode |= EMIT_FLUSH;
> >   	if (mode & EMIT_FLUSH) {
> > -		u32 flags = 0;
> > +		u32 bit_group_0 = 0;
> > +		u32 bit_group_1 = 0;
> 
> For me flags0 and flags1 seems more readable as in
> *gen8_emit_pipe_control(batch, flags0, flags1, offset), but no strong
> feelings, but if bit_group is chosen arguments of *gen8_emit_pipe_control
> could be changed as well.

yes, I thought to update all of them, as well for consistency. I
like the name bit_group_0/1 because it's similar to the
datasheet.

I had some confusion about it earlier and I think this can help
to improve readability.

Will update all the other functions, as well.

> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Thanks!

Andi
