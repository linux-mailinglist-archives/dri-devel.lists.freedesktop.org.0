Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9936B095D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 14:36:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0EA10E5DD;
	Wed,  8 Mar 2023 13:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C1D10E5D3;
 Wed,  8 Mar 2023 13:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678282577; x=1709818577;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=izdQtxLQhq9XnXZ+9Uo0yoXy9vdc+dnM990cd/pSZsQ=;
 b=itkqLgcGpnIiru4PV5NLANBj+q8RF2b56X9C/EqHvpS7G1H5PgUfNb9f
 Z0GJG8miESTI8i/4OFsvtj9uzuIje1/iylsSfGNRfzOktEtjTXa5khpdP
 itSTUei/eCD3R6IDV4wX4h/67n5x2baKVA7iIUYG+K3cIcgLZrpg3OIGY
 c4rL8TDJXyE3iC0b1FNiG9E9IhUlGBR1cBiaXtTGp6ojj6K3eC8N4yJ13
 BM0vd4pzQhnHCaz4Hccs38THnApuM979ll4NvSmOBrWVb/ZFMhA3j7IuG
 SDvCADgy/OwIQ0Y2MA/XklXGBWgWTFc87Bjye0znurci+7FrVcmHqYEJk g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="422420824"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="422420824"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 05:36:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="787123324"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="787123324"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga002.fm.intel.com with SMTP; 08 Mar 2023 05:36:14 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 08 Mar 2023 15:36:13 +0200
Date: Wed, 8 Mar 2023 15:36:13 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [Intel-gfx] [Intel-xe] [PATCH] drm/xe/display: Do not use i915
 frontbuffer tracking implementation
Message-ID: <ZAiPTaBhfhddI+DU@intel.com>
References: <20230306141638.196359-1-maarten.lankhorst@linux.intel.com>
 <edae44735190c4d5fbbe8959f999ad7ca65f3677.camel@intel.com>
 <073f5ef3-523a-2997-c7e9-771cce8f4c24@linux.intel.com>
 <ZAZT6jJlsiTF1A5a@intel.com>
 <fc1c5bf4-8174-50e4-5109-cbf73aafe771@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fc1c5bf4-8174-50e4-5109-cbf73aafe771@linux.intel.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Souza,
 Jose" <jose.souza@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 08, 2023 at 01:47:12PM +0100, Maarten Lankhorst wrote:
> 
> On 2023-03-06 21:58, Ville Syrjälä wrote:
> > On Mon, Mar 06, 2023 at 09:23:50PM +0100, Maarten Lankhorst wrote:
> >> Hey,
> >>
> >> On 2023-03-06 16:23, Souza, Jose wrote:
> >>> On Mon, 2023-03-06 at 15:16 +0100, Maarten Lankhorst wrote:
> >>>> As a fallback if we decide not to merge the frontbuffer tracking, allow
> >>>> i915 to keep its own implementation, and do the right thing in Xe.
> >>>>
> >>>> The frontbuffer tracking for Xe is still done per-fb, while i915 can
> >>>> keep doing the weird intel_frontbuffer + i915_active thing without
> >>>> blocking Xe.
> >>> Please also disable PSR and FBC with this or at least add a way for users to disable those features.
> >>> Without frontbuffer tracker those two features will break in some cases.
> >> FBC and PSR work completely as expected. I don't remove frontbuffer
> >> tracking; I only remove the GEM parts.
> >>
> >> Explicit invalidation using pageflip or CPU rendering + DirtyFB continue
> >> to work, as I validated on my laptop with FBC.
> > Neither of which are relevant to the removal of the gem hooks.
> >
> > Like I already said ~10 times in the last meeting, we need a proper
> > testcase. Here's a rough idea what it should do:
> >
> > prepare a batch with
> > 1. spinner
> > 2. something that clobbers the fb
> >
> > Then
> > 1. grab reference crc
> > 2. execbuffer
> > 3. dirtyfb
> > 4. wait long enough for fbc to recompress
> > 5. terminate spinner
> > 6. gem_sync
> > 7. grab crc and compare with reference
> >
> > No idea what the current status of PSR+CRC is, so not sure
> > whether we can actually test PSR or not.
> 
> This test doesn't make sense. DirtyFB should simply not return before 
> execbuffer finishes.

Of course it should. It's not a blocking ioctl, and can't
be because that will make X unusable.

-- 
Ville Syrjälä
Intel
