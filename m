Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE8B47E54F
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 16:03:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C1E10E269;
	Thu, 23 Dec 2021 15:03:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD5B10E269;
 Thu, 23 Dec 2021 15:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640271806; x=1671807806;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=aD1mewvXbqqunsX5Xqpz33bfhSDk3Xx9zQNCwf7UKxU=;
 b=VkPT64eCZRIBukFdLnd7Mkkw2a75nBt6RGWZ81l913E7RGGZzsbODtuE
 MmoLeNOEqo4pkhiszE8XkbfnLdQz5xFETHjedOL2dtGUGP14/0+YGiB+G
 jBdxgY8pYuMVZZ8h5MJeCJmhAlIVLH3wVNMx8OKjS36+ahx4wS/CV9VoZ
 jzyWuLivTfGq4CWv9d31tu/sTxn46Um5HwjzNN8YoTdfbW87hpGQnVkor
 U8XnGjoGJhCXmW/IiWfd4tbyg5lgKVib+zTRwl4V0NXO/ca/DPIrgkZVJ
 yplCOqVcprkR/jgFb1FfuVvcjyO/3ytjF4xsupFW/MidnBwcv1+RV3E7J g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="221512496"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="221512496"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 07:03:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="614220192"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.147])
 by fmsmga002.fm.intel.com with SMTP; 23 Dec 2021 07:03:19 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 23 Dec 2021 17:03:19 +0200
Date: Thu, 23 Dec 2021 17:03:19 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 1/6] =?iso-8859-1?Q?drm=2Fpl?=
 =?iso-8859-1?Q?ane=3A_Make_format=5Fmod=5Fsupported_truly=A0optional?=
Message-ID: <YcSPt+81fuzteeCu@intel.com>
References: <20211222090552.25972-1-jose.exposito89@gmail.com>
 <20211222090552.25972-2-jose.exposito89@gmail.com>
 <YcRkB7uWyt4EbcZm@intel.com>
 <PIq2EEI7giz2rOuv2cfySbdxwht8AaCye140X5C7NejjXT6kD67E3E28uvg4Ebhob12EJUBtAxGPFNOgZwSWLYEfMtdhRNt3mR8bBGBJmU4=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PIq2EEI7giz2rOuv2cfySbdxwht8AaCye140X5C7NejjXT6kD67E3E28uvg4Ebhob12EJUBtAxGPFNOgZwSWLYEfMtdhRNt3mR8bBGBJmU4=@emersion.fr>
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
Cc: marex@denx.de, mcoquelin.stm32@gmail.com, kernel@pengutronix.de,
 s.hauer@pengutronix.de, tzimmermann@suse.de, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, alexandre.torgue@foss.st.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 yannick.fertre@foss.st.com, linux-imx@nxp.com, benjamin.gaignard@linaro.org,
 rodrigo.vivi@intel.com, dmitry.baryshkov@linaro.org,
 =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, philippe.cornu@foss.st.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 23, 2021 at 01:42:32PM +0000, Simon Ser wrote:
> On Thursday, December 23rd, 2021 at 12:56, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> 
> > > -	/* If we can't determine support, just bail */
> > > -	if (!plane->funcs->format_mod_supported)
> > > -		goto done;
> > > -
> > >  	mod = modifiers_ptr(blob_data);
> > >  	for (i = 0; i < plane->modifier_count; i++) {
> > >  		for (j = 0; j < plane->format_count; j++) {
> > > -			if (plane->funcs->format_mod_supported(plane,
> > > +			if (!plane->funcs->format_mod_supported ||
> > > +			    plane->funcs->format_mod_supported(plane,
> > >  							       plane->format_types[j],
> > >  							       plane->modifiers[i])) {
> >
> > So instead of skipping the whole loop you just skip doing anything
> > inside the loop? Can't see how that achieves anything at all.
> 
> No, the check is skipped when the function isn't populated by the driver.

Ah right. So we advertise all modifiers in that case. Looks like
drm_plane_check_pixel_format() does support that model, so seems OK.

Another related thing that might be worth checking is whether
drivers generally do anything to validate the modifiers in
the addfb2 ioctl. Looks like i915 and amdgpu are the only ones
to use drm_any_plane_has_format() for that, so all the other
drivers must either be checking it manually (or they're just
potentially broken when handed unexpected modifiers by evil
userspace).

-- 
Ville Syrjälä
Intel
