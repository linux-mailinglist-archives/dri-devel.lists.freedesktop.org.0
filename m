Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A47EB1930AE
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 19:53:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1885E6E1F9;
	Wed, 25 Mar 2020 18:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BA06E19B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 18:53:41 +0000 (UTC)
IronPort-SDR: gYj8eu8X9RR6bbKoV9TgyT2sc/ZAxvA+Rjg9195FkfyLZ0NWaI7zpmyG1mHc80nNBRKF4X04U8
 E30SnA59DvLA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 11:53:40 -0700
IronPort-SDR: CuEazhPQX4Ep7yHyBiM6whSZC0Uf8n695K9lyoqpQ9iEKs67BclaUttydKLtqaAxqgTn+yoCav
 nZc3jFQ6KC5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,305,1580803200"; d="scan'208";a="357896634"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO intel.com)
 ([10.165.21.211])
 by fmsmga001.fm.intel.com with ESMTP; 25 Mar 2020 11:53:39 -0700
Date: Wed, 25 Mar 2020 11:55:27 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: Harry Wentland <hwentlan@amd.com>
Subject: Re: Variable Refresh Rate & flickering screens
Message-ID: <20200325185526.GA14320@intel.com>
References: <bRy2hTFvMya3tNzlzsjQv6uzpsgC18d0NYQx1A9Otma6wCsYLHH9X6esb47-9KWzUjVNWTi3VXCVLVGX-dlW17P0YeCFCg4OZ4KEykC0Czw=@emersion.fr>
 <647ff0e7-f186-4e16-f9b9-0908a3171051@daenzer.net>
 <tQBNlPxJxKY8FDg82d7XAuqLUkgBj4ATufP43APGI17BfwCiRpJCpUOSZiAq0V-6QONBC8S_dpI4sHsb-qQkhfkKX4usw6hSSUG_pXO3uX0=@emersion.fr>
 <db6547cf-77d7-5163-8926-e1bb5ddb6d57@amd.com>
 <vjPM-1gAz4OKHfOHPPwHH_InBbZpD9EsrXKujfN7QKEEME_LmCEsZ-tXJiAAOhyG2mkN8GcNZmpEgGwRgqPlOYumKiLXk2jBGZuWavGYVMM=@emersion.fr>
 <d921efb1-1074-1ac2-6eda-8ebb39a262d8@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d921efb1-1074-1ac2-6eda-8ebb39a262d8@amd.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Scott Anderson <scott@anderso.nz>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 "Anthony.Koo@amd.com" <Anthony.Koo@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 17, 2020 at 09:25:33AM -0400, Harry Wentland wrote:
> 
> 
> On 2020-03-17 5:08 a.m., Simon Ser wrote:
> > On Thursday, March 12, 2020 3:43 PM, Harry Wentland <hwentlan@amd.com> wrote:
> > 
> >> Not the main VRR expert and we're still discussing this internally but I
> >> think it'll very much depend on the display whether you'll see flicker
> >> in this case.
> >>
> >> The other complication is that for gaming we don't want to use the
> >> cursor as a VRR trigger and only look at page flips in order to allow
> >> for smooth gameplay. For a desktop use-case that's probably not the
> >> right policy.
> > 
> > I think user-space can handle this and correctly synchronize cursor
> > updates with game updates via the KMS atomic API.
> > 
> > However I still think flickering should be avoided by the hardware.
> > Flickering is a completely separate issue and user-space shouldn't add
> > workarounds for screen issues like this.
> > 
> > Do you think that would be acceptable? Do you have any "slew rate
> > register" in AMD hardware?
> >

In case of Intel HW, we do have a way to program the maxshift so the max increment or
decrement in the vblank in successive frames. This is designed to be used for
the displays that  have a restriction on the maximum change in refresh rate between two consecutive frames.

But I am still figuring out how the panel indicates this restriction that we need to program
in the HW registers.

Harry/SImon, do you know of any such panels that have these restrictions and if they
indicate this limitation or the maxshift through EDID or DPCD?

Manasi
 
> 
> There are no slew rate registers in current AMD HW but I also think
> slewing would best be done in kernel space, either directly in HW by HW
> that supports it or in SW for HW that doesn't support it.
> 
> Harry
> 
> > Thanks,
> > 
> > Simon
> > 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
