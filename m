Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E38C23D574C
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 12:20:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B852D6F454;
	Mon, 26 Jul 2021 10:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831376EEB8;
 Mon, 26 Jul 2021 10:20:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="212195890"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="212195890"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 03:20:08 -0700
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="436774339"
Received: from dechasso-mobl3.amr.corp.intel.com (HELO intel.com)
 ([10.212.115.115])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 03:20:04 -0700
Date: Mon, 26 Jul 2021 06:20:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH 02/30] drm/i915/display: split DISPLAY_VER 9
 and 10 in intel_setup_outputs()
Message-ID: <YP6MU/zzQTwWKOyD@intel.com>
References: <20210724001114.249295-1-lucas.demarchi@intel.com>
 <20210724001114.249295-3-lucas.demarchi@intel.com>
 <YPxQwdEAcNRIX9ep@infradead.org>
 <20210725050215.s2ejpin6xkwzba5h@ldmartin-desk2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210725050215.s2ejpin6xkwzba5h@ldmartin-desk2>
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
Cc: Christoph Hellwig <hch@infradead.org>, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 24, 2021 at 10:02:15PM -0700, Lucas De Marchi wrote:
> On Sat, Jul 24, 2021 at 06:41:21PM +0100, Christoph Hellwig wrote:
> > Still tests fine:
> > 
> > Tested-by: Christoph Hellwig <hch@lst.de>
> 
> I just pushed this  to drm-intel-next as part of another series and
> added your Tested-by.
> 
> Rodrigo, can you pick this up for -fixes? This should go with your other
> patch to fix the port mask, too.

done.

But while doing this and reviewing this series at the same time
I got myself wondering if we shouldn't remove the PORT_F support
entirely...

> 
> Thanks for the bug report and test.
> 
> Lucas De Marchi
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
