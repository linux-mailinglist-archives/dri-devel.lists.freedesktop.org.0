Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2807DA62F
	for <lists+dri-devel@lfdr.de>; Sat, 28 Oct 2023 11:38:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16CEB10E023;
	Sat, 28 Oct 2023 09:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F8210E150
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Oct 2023 09:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698485927; x=1730021927;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=driFOMIS4dM1KHBavkQAmpLegA0VcFJJ+8plDj8insA=;
 b=b+jQdhuJdjtBH6MuGeEVK7paG6jlkdAbbAHE3LZmZ4vGuR0Mc9oghvPT
 B7bE0kyatYkHfxGcLsnQkGXL3k2ctjlIqGXqL7UUCJ8ecZV/PzuCCwN1U
 mKk9bIpzqI83CrOBPRdIzjQlJ9ayDJbDd8aL7UIO2Yqe16tfoicfZ++xN
 Xto0qUw9c86UC5xNCUargxU6yxJuL39NJT1g19PZueBjexcgYyuiyvzTR
 NxQY7dIA9Vvc8X9U1NhIxHBm7q9z6ZdrAx5Ffo06REaQyksCqVg9eh8Za
 es+IXV7HZPPwe+NsgIlr8SV/uk+XDnajfIswQbzhgdzSvmpZn84enhl87 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="372943466"
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; d="scan'208";a="372943466"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 02:38:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="903520174"
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; d="scan'208";a="903520174"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.50.225])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 02:36:14 -0700
Date: Sat, 28 Oct 2023 11:38:42 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH 10/11] accel/ivpu: Add support for delayed D0i3 entry
 message
Message-ID: <ZTzWosTZCzbMEoAk@linux.intel.com>
References: <20231025094323.989987-1-stanislaw.gruszka@linux.intel.com>
 <20231025094323.989987-11-stanislaw.gruszka@linux.intel.com>
 <f45d777c-03eb-fb6b-fa3a-6c19f56e9d17@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f45d777c-03eb-fb6b-fa3a-6c19f56e9d17@quicinc.com>
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
Cc: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 27, 2023 at 09:07:22AM -0600, Jeffrey Hugo wrote:
> > +	if (!ivpu_hw_37xx_is_idle(vdev)) {
> > +		ivpu_warn(vdev, "VPU not idle during power down\n");
> > +		if (ivpu_hw_37xx_ip_reset(vdev))
> > +			ivpu_err(vdev, "Failed to reset the VPU\n");
> > +	}
> 
> This appears to be an unrelated change to $SUBJECT

Ok, I think I'll separate this on v2

Regards
Stanislaw
