Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B63F9596EEE
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 15:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DAC91B63;
	Wed, 17 Aug 2022 13:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44CC8A582;
 Wed, 17 Aug 2022 13:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660741520; x=1692277520;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0r/wRpHDY/cJKimAN46sLg8b9MsBF0hryVYD2PnhY/Y=;
 b=iG+48tqi+bA+fLYyRVCn7MvqPBWlgW+8Aomcoo5yGjHOiOZp3jBri/1B
 bA7OVhVTtZ6d3gSonuIVdOpFBbg+lyvnBW963DsCxE2wfDGvyYYxzC26v
 sGiekwpDQ+3CmiUFpsSM1RgfX72pD61Wcf0XE7oode6OmLdG5y1NuzgzB
 gQFfLF1fIsFEliusLTQUHpI+Ffx5zh9CISuWPMyon1GRNclrg+5J5cGu1
 5mERaxGKI2D/fFiulp+Ic9Ud5NNy6V94ErLf1cczuUdNgu/BdMgJYfLs8
 HXb2lhTatoKuRHh87Ji7v3ZkkAmpDERAGm0+ortOpNWoeOgKVqef8yuuy g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="275538018"
X-IronPort-AV: E=Sophos;i="5.93,243,1654585200"; d="scan'208";a="275538018"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2022 06:05:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,243,1654585200"; d="scan'208";a="710542739"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.59])
 by fmsmga002.fm.intel.com with SMTP; 17 Aug 2022 06:05:14 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 17 Aug 2022 16:05:13 +0300
Date: Wed, 17 Aug 2022 16:05:13 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Switch TGL-H DP-IN to dGFX when
 it's supported
Message-ID: <YvzniYpjr+PBIa56@intel.com>
References: <20220816025217.618181-1-kai.heng.feng@canonical.com>
 <CACO55tt=Op=0E94kK+1M8cDXNCk5Tkc=FMR8=OQFc5ohehjwaw@mail.gmail.com>
 <CAAd53p49X95MKrTDUq92LuHw3y2i09fUA2HEPzM1EcO8xO97Eg@mail.gmail.com>
 <CACO55tvgmb4Vog701idDYGuh125S9mjWPXhftxDMZ7hg-nQXBw@mail.gmail.com>
 <CAAd53p4W9rjmVJcUasy9hb1Yam+846+Oomvc2r9RMNmWeh_=0w@mail.gmail.com>
 <YvzYGGXils/Gf44d@intel.com>
 <CAAd53p49zc2G1KutPMUcUBM3_rbCh9_40e0mdtcZKb+C69QL_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAd53p49zc2G1KutPMUcUBM3_rbCh9_40e0mdtcZKb+C69QL_Q@mail.gmail.com>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com,
 Zenghui Yu <yuzenghui@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 17, 2022 at 08:15:58PM +0800, Kai-Heng Feng wrote:
> On Wed, Aug 17, 2022 at 7:59 PM Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
> 
> [snipped]
> 
> > I had a quick trawl through some Windows stuff for this and
> > it does seem to do a few extra checks:
> > - platform must be TGL-H (nothing else has the DPin stuff I guess)
> > - OpRegion header must indicate dGPU presence
> 
> Is the dGPU presence denoted by the return bitmask of
> INTEL_DSM_FN_GET_BIOS_DATA_FUNCS_SUPPORTED

No, there are apparently some extra bits in the OpRegion
header which we're not currently even decoding.

> 
> IIUC the mask 20 won't be set when dGPU is not present.

Not sure whether that bit would change depending on the dGPU
presence or not. Windows doesn't seem trust it alone, so either
it won't change or someone was just extra paranoid.

> 
> >
> > Otherwise it does call this DSM uncoditionally on boot/S4 resume
> > so seems like that is the only really validated configuration.
> > Although it does seem to explicitly turn off displays prior to
> > the DSM so that does perhaps indicate that those ports might have
> > also been enabled via the iGPU by the BIOS. Not sure if disabling
> > the ports would work correctly after the DSM or not. If not then
> > the DSM call would need to happen after state readout/sanitization
> > so that we can shut things down gracefully.
> >
> > Additionally after the DSM call it scans the FIA TC live state
> > bits to check for DPin usage. Looks like its trying to make sure
> > the driver stops poking at the relevant power wells once in DPin
> > mode. i915 doesn't check that stuff atm so we might end up
> > mangling something while the dGPU is driving the port.
> 
> Thanks for investigating this. I am not really familiar with other
> stuffs you mentioned, but I am happy to test any follow-up patch.
> 
> Kai-Heng
> 
> >
> > --
> > Ville Syrjälä
> > Intel

-- 
Ville Syrjälä
Intel
