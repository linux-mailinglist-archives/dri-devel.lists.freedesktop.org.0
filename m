Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0137471F73F
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 02:44:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB3BB10E617;
	Fri,  2 Jun 2023 00:44:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 068B810E04A;
 Fri,  2 Jun 2023 00:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685666647; x=1717202647;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wJ/OSP0ckFfzwVnZAaDMF9t5J0/dICf1DZ8XGD9GwWg=;
 b=mFWnu82Ey8R88YV3/JY6gzCiZx10NGpwRL7txPSRIV67muhe8jE8o5/F
 QGC8ZsmlzUrUIcnp4NOOe3OmWs3+cD+rtWWSU8lEw2tq1sEmEhKLUmAS2
 fRViWRhwJgVxkI1O+Ee2oloyEfsHCx4XuwG6IM/QV9hLyeKFMPM1A7bQL
 6NvNcAiLFv7liOW4dcLSNSnAuIkSW32MwioKmxkc70GUmz/7e4mGSm+ss
 NNq2svFR4y/0EQ6n4qH2meXNeXbGgxl7jj9gRiRziRwrvd4npxZVz8sEU
 vH/aPVxajeQUhbFgIzl7qsr5XwhX7chgcN20dhEeajWPEIRaMyFFnYBH5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="353222244"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; d="scan'208";a="353222244"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 17:44:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="737318294"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; d="scan'208";a="737318294"
Received: from gsavorni-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.251.210.46])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 17:44:00 -0700
Date: Fri, 2 Jun 2023 02:43:56 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/pxp: use correct format string for
 size_t
Message-ID: <ZHk7TIGDwjN3vcdu@ashyti-mobl2.lan>
References: <20230601213624.3510244-1-arnd@kernel.org>
 <a97c3bbb260587a352a6d8d228e65cc6ae8fd59e.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a97c3bbb260587a352a6d8d228e65cc6ae8fd59e.camel@intel.com>
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
Cc: "arnd@kernel.org" <arnd@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd,

On Thu, Jun 01, 2023 at 10:00:27PM +0000, Teres Alexis, Alan Previn wrote:
> On Thu, 2023-06-01 at 23:36 +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > While 'unsigned long' needs the %ld format string, size_t needs the %z
> > modifier:
> 
> alan:snip
> 
> 
> > +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> > @@ -143,7 +143,7 @@ gsccs_send_message(struct intel_pxp *pxp,
> >  
> >  	reply_size = header->message_size - sizeof(*header);
> >  	if (reply_size > msg_out_size_max) {
> > -		drm_warn(&i915->drm, "caller with insufficient PXP reply size %u (%ld)\n",
> > +		drm_warn(&i915->drm, "caller with insufficient PXP reply size %u (%zd)\n",
> >  			 reply_size, msg_out_size_max);
> >  		reply_size = msg_out_size_max;
> >  	}
> Thanks Arnd for catching this, although i believe Nathan sumbmitted a patch for the same fix yesterday and received an RB from Andi.

yes, the patch is here:

https://patchwork.freedesktop.org/patch/540272/?series=118593&rev=1

I'm waiting for full CI results to merge this.

Thanks,
Andi
