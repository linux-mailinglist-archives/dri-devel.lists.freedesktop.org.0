Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6990D55C0DC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 14:08:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACE612B066;
	Tue, 28 Jun 2022 12:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87D312B066;
 Tue, 28 Jun 2022 12:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656418081; x=1687954081;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=pmPlDq9y+gIWKalrXM/WfpvHQmRH2B99p260nqUZybI=;
 b=IoXergICmDmAyNH78y1AxG+DmwArpAo7l0atsgBGdGVEsNnRI094vJN2
 +SncQ8AGxWhNaUNRDIbZ3eMJAjucV2BV8/dt+W7wZ65cAtIpLJMOVAI9a
 7g7yMLJh4f/m7TgvBJTqH2bZUn6xs/DbejnZO5gwpYiHq0nnlAfIRg3BA
 fWr2o6kdhSCrnSP1MtpJGQJ20gLHHD/DbaLhVqOV01qdMfR7qMa/+EPFl
 KthskSeyxl5l/kftQTXHq7xlivvtpElJXbSKxdH/oX9wsNDMxKtXKwXaF
 iO5N6QHMbZoRAqDk5RDLyWSF5nC+P92CsYIIQAbAnQl35vfgLySf4ZF6h w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="368035324"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="368035324"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2022 05:08:01 -0700
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="594773383"
Received: from ideak-desk.fi.intel.com ([10.237.72.175])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2022 05:08:00 -0700
Date: Tue, 28 Jun 2022 15:07:56 +0300
From: Imre Deak <imre.deak@intel.com>
To: Nanley G Chery <nanley.g.chery@intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>
Subject: Re: [PATCH] drm/fourcc: Document the Intel CCS modifiers' CC plane
 expected pitch
Message-ID: <YrrvHCc+/5nEkJa0@ideak-desk.fi.intel.com>
References: <20220623144955.2486736-1-imre.deak@intel.com>
 <DM4PR11MB59952D0A2E4B2CA1B01E9BAFDCB49@DM4PR11MB5995.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM4PR11MB59952D0A2E4B2CA1B01E9BAFDCB49@DM4PR11MB5995.namprd11.prod.outlook.com>
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
Reply-To: imre.deak@intel.com
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 25, 2022 at 12:38:50AM +0300, Chery, Nanley G wrote:
> +Jordan (FYI)
> 
> I think the commit message has an extra "color" next to "CC".

IIUC, i915 calls all the planes contained in a framebuffer "color
planes" for consistency (so main-, aux-, CC color planes).

> With or without that dropped,
> 
> Reviewed-by: Nanley Chery <nanley.g.chery@intel.com>

The patch is pushed to drm-misc-next, thanks for the reviews.

--Imre

> Thanks for the fix.
> 
> > -----Original Message-----
> > From: Deak, Imre <imre.deak@intel.com>
> > Sent: Thursday, June 23, 2022 10:50 AM
> > To: dri-devel@lists.freedesktop.org
> > Cc: intel-gfx@lists.freedesktop.org; Chery, Nanley G <nanley.g.chery@intel.com>
> > Subject: [PATCH] drm/fourcc: Document the Intel CCS modifiers' CC plane expected pitch
> >
> > The driver expects the pitch of the Intel CCS CC color planes to be
> > 64 bytes aligned, adjust the modifier descriptions accordingly.
> >
> > Cc: Nanley Chery <nanley.g.chery@intel.com>
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  include/uapi/drm/drm_fourcc.h | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> > index f1972154a5940..c1b4cfda75075 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -559,7 +559,7 @@ extern "C" {
> >   *
> >   * The main surface is Y-tiled and is at plane index 0 whereas CCS is linear
> >   * and at index 1. The clear color is stored at index 2, and the pitch should
> > - * be ignored. The clear color structure is 256 bits. The first 128 bits
> > + * be 64 bytes aligned. The clear color structure is 256 bits. The first 128 bits
> >   * represents Raw Clear Color Red, Green, Blue and Alpha color each represented
> >   * by 32 bits. The raw clear color is consumed by the 3d engine and generates
> >   * the converted clear color of size 64 bits. The first 32 bits store the Lower
> > @@ -612,9 +612,9 @@ extern "C" {
> >   * outside of the GEM object in a reserved memory area dedicated for the
> >   * storage of the CCS data for all RC/RC_CC/MC compressible GEM objects. The
> >   * main surface pitch is required to be a multiple of four Tile 4 widths. The
> > - * clear color is stored at plane index 1 and the pitch should be ignored. The
> > - * format of the 256 bits of clear color data matches the one used for the
> > - * I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC modifier, see its description
> > + * clear color is stored at plane index 1 and the pitch should be 64 bytes
> > + * aligned. The format of the 256 bits of clear color data matches the one used
> > + * for the I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC modifier, see its description
> >   * for details.
> >   */
> >  #define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC fourcc_mod_code(INTEL, 12)
> > --
> > 2.30.2
> 
