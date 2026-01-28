Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id II17CTstemnd3gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 16:37:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEA0A4174
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 16:37:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0980910E722;
	Wed, 28 Jan 2026 15:37:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YVnu31vF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A26B10E193;
 Wed, 28 Jan 2026 15:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769614646; x=1801150646;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0wyoV90WmYlDsdIojZFY1AdPgbfCyPWW+8y/M6SlHE4=;
 b=YVnu31vFQzt7TQVlmmMc4IEbz4CDfPqGipBCN+bomJ0BV4u1Jv9R42fE
 JziIsH33RRFh5ZMWTqVAyK6Q73U0EzkwwhS/UxAkD2qCmvnFsdXP/7Mu8
 /uLhKpaE6GXBGdIpACkZTyFadnV9Kver0yw0j322qZEQxE1XYXHKrh4c2
 kihwx13jShoGLNgk1vB0FskX7QwGhJFJZzj3TkpXOZpdQDLY4Q2e/9EMU
 54pqafakpp46GIr0lraF1fztVmpNUAnoK8+yF9GQbdfWyTIiB9sejaQxL
 yGvDta00JWpsbXznXiKjuBWNHNmL2HV5XA639Em+Wc/3NQrXDVBLliM2Q Q==;
X-CSE-ConnectionGUID: wuNfWE8gSiyYn411D7UlAA==
X-CSE-MsgGUID: iACIfWaqQAip+yct40NZ+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="73423407"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="73423407"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 07:37:25 -0800
X-CSE-ConnectionGUID: KTQ67kAaSbu8bA5Ll5fKQg==
X-CSE-MsgGUID: QZTVq2c0S8Gv4W9Dfv9tAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208673485"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.54])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 07:37:21 -0800
Date: Wed, 28 Jan 2026 17:37:18 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>,
 Lenny Szubowicz <lszubowi@redhat.com>,
 Francesco Pompo <francescopompo2@gmail.com>,
 linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/2] drm/i915/display: Disable display for iMac's
Message-ID: <aXotLnGvZu4Ib0Vx@intel.com>
References: <20260128145855.1071-1-atharvatiwarilinuxdev@gmail.com>
 <20260128145855.1071-3-atharvatiwarilinuxdev@gmail.com>
 <26c4e0b7f9c25f405401288d13fc7e5097e9c7f5@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26c4e0b7f9c25f405401288d13fc7e5097e9c7f5@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.64 / 15.00];
	R_MIXED_CHARSET(0.67)[subject];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,intel.com,linux.intel.com,ursulin.net,ffwll.ch,suse.de,redhat.com,alien8.de,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ville.syrjala@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CAEA0A4174
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 05:23:51PM +0200, Jani Nikula wrote:
> On Wed, 28 Jan 2026, Atharva Tiwari <atharvatiwarilinuxdev@gmail.com> wrote:
> > Disable display on iMacs, as they can't do link training
> > on the internal display.
> 
> I'd expand on that a bit, based on the previous discussion.
> 
> >
> > (tested on iMac20,1)
> >
> > Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
> 
> I can't test this, but if nobody chimes in to oppose, I'll take it.

I guess the main problem with a hack like this is that you won't
be able to get deep pkgC states due to the display hardware not
going into DC5/6.

But I can't immediately think of other issues due this being an
iGPU, so eg. runtime PCI D3 doesn't really do anything meaningful
and thus the display hardware remaining powered on shouldn't
matter that much (apart from the increased power usage).

> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> 
> 
> > ---
> >  .../gpu/drm/i915/display/intel_display_device.c    | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
> > index 1170afaa8680..b1fec1018d7e 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_device.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_device.c
> > @@ -3,6 +3,7 @@
> >   * Copyright © 2023 Intel Corporation
> >   */
> >  
> > +#include <linux/dmi.h>
> >  #include <linux/pci.h>
> >  
> >  #include <drm/drm_color_mgmt.h>
> > @@ -1435,7 +1436,18 @@ static bool has_no_display(struct pci_dev *pdev)
> >  		{}
> >  	};
> >  
> > -	return pci_match_id(ids, pdev);
> > +	static const struct dmi_system_id dmi_ids[] = {
> > +		{
> > +			.ident = "Apple Inc. iMac",
> > +			.matches = {
> > +				DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Apple Inc."),
> > +				DMI_MATCH(DMI_PRODUCT_NAME, "iMac"),
> > +			}
> > +		},
> > +		{}
> > +	};
> > +
> > +	return pci_match_id(ids, pdev) || dmi_check_system(dmi_ids);
> >  }
> >  
> >  #define INTEL_DISPLAY_DEVICE(_id, _desc) { .devid = (_id), .desc = (_desc) }
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
