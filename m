Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54080699B27
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 18:21:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574DE10EE1F;
	Thu, 16 Feb 2023 17:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA6E410E346
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 17:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676568081; x=1708104081;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dNVMHfU/r/DzOG+MoceUhtdAZ1gs3oDljzYjt9d0AR0=;
 b=WYkIUCtG1SV/axQKtJqQXESD5G7uQwOIP1ynsrOIu4Qetw1y6pz3SqdP
 FmA20A58eDWNPRekkX0BAlSAmje2FFtac/mAg/BCzBauVPvY43/YclQqI
 So3T446upBs3bK2btdKqIDq314BDk7evrVbd+FMMEBwiE8l9W0Fxds7UH
 NE+osDXgAkq9/fNXxNfpqvodHg5JzELfCavPDwQTw45wYyEsxJfmdBXOR
 qO6g7qmARDY1Dh45cTHIHE2vNCtqs9JlvpINuqnw3Hg3m6QE52VWKzTkF
 uvg+5vynZdnKdwY+aCarBpQEW59Lml81C+M3w3fHb3D0oqiZgHhGGWBOw Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="333973614"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="333973614"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 09:21:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="663543671"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="663543671"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga007.jf.intel.com with SMTP; 16 Feb 2023 09:20:57 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 16 Feb 2023 19:20:56 +0200
Date: Thu, 16 Feb 2023 19:20:56 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 17/17] drm/cirrus: Use VGA macro constants to unblank
Message-ID: <Y+5l+BbN7JjpaQlH@intel.com>
References: <20230215161517.5113-1-tzimmermann@suse.de>
 <20230215161517.5113-18-tzimmermann@suse.de>
 <20230216113330.rmzmkdvpxdqk2nrd@sirius.home.kraxel.org>
 <306e110d-4d1f-cb9c-6f9b-c8a5ddd48a61@suse.de>
 <Y+4nIxRhF7KF2Qo0@intel.com>
 <ba4daf50-4882-5009-5c68-4385cacfdccb@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba4daf50-4882-5009-5c68-4385cacfdccb@suse.de>
X-Patchwork-Hint: comment
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
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 airlied@redhat.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 02:21:43PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 16.02.23 um 13:52 schrieb Ville Syrjälä:
> > On Thu, Feb 16, 2023 at 01:03:02PM +0100, Thomas Zimmermann wrote:
> >> Hi,
> >>
> >> thanks for taking a look at the patches.
> >>
> >> Am 16.02.23 um 12:33 schrieb Gerd Hoffmann:
> >>> On Wed, Feb 15, 2023 at 05:15:17PM +0100, Thomas Zimmermann wrote:
> >>>> Set the VGA bit for unblanking with macro constants instead of magic
> >>>> values. No functional changes.
> >>>
> >>> blank/unblank should work simliar to bochs (see commit 250e743915d4),
> >>> that is maybe a nice thing to add of you modernize the driver anyway.
> >> Yeah, it's the VGA PAS field. [1] But is it really called blanking? PAS
> >> controls palette access, but blanking is sounds more like DPMS.
> > 
> > Why aren't people just using the normal way of flipping the
> > screen off bit in sequencer register 01?
> 
> Setting the SD bit in SR01 isn't a bad idea. We can do this as part of 
> enabling/disabling the plane.
> 
> But for PAS, we don't have a choice. It's one of the bazillion obscure 
> VGA settings and (according to a comment in the source code) we need to 
> update it for compatibility.

Well, you do need to enable the palette to see something
other that border color. Not sure tha't a very obscure thing :P

On a related note, the code looks pretty sketchy. It just
blindly writes to 0x3c0 assuming it is the attribute controller
index register. But unless you explicitly reset the flip-flop
it could actually be the data write register instead. That could
easily happen if the previous access to the attribute controller
was a read since reads do not toggle the register role.

-- 
Ville Syrjälä
Intel
