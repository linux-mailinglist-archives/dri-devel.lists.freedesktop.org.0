Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A400F689AE3
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 15:03:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3C010E059;
	Fri,  3 Feb 2023 14:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DED510E059;
 Fri,  3 Feb 2023 14:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675432977; x=1706968977;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=irv3lGzYjgRrPupsMvPPq8fHSBpnLKmUkKwUr8MxDSE=;
 b=hjD1qntADYKQ1Us+Y+xLmbLv7ZwN3JkH6okpugshN5IP3UMPEYNpwoou
 Alw8qD0WF4Tqs3vk6rMQSprhNHBqkIF+VVN2gQ5RzhFcxqHhnxJIYyuM1
 ar5o69kA1CShPQ5/6CJRRdA0zFVmiMh1WwrgpGY4PPgg3UAAYmBVmYVZV
 os3NI1JRLxKLJDuqBfy7MK2HpIRf1U7xDYW8v04gueVGvyxDbFAOtKaNQ
 nx8ilGa6ukmnzr2e2cteZ2LWHIpyAzB1UUg9+qk59LC2CO+wMUqj+P3BL
 Zka4mjj6acxQyQ0pZTlY0rabI60DEnslXjR2tCcdBTpVZDD7cMlWZy1J9 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="328767145"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="328767145"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 06:02:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="665726345"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="665726345"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by orsmga002.jf.intel.com with SMTP; 03 Feb 2023 06:02:53 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 03 Feb 2023 16:02:51 +0200
Date: Fri, 3 Feb 2023 16:02:51 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sebastian Wick <sebastian.wick@redhat.com>
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Message-ID: <Y90UC43KouMRh8I2@intel.com>
References: <20230203020744.30745-1-joshua@froggi.es>
 <20230203020744.30745-3-joshua@froggi.es>
 <Y9zkef5FjtZ7guVS@intel.com>
 <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
 <Y90NkvVabh+ue9hF@intel.com>
 <CA+hFU4xR_8=w=z=Jqs3sujTvnXfEQJVHAMFW-X4-55POF=Bu9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+hFU4xR_8=w=z=Jqs3sujTvnXfEQJVHAMFW-X4-55POF=Bu9g@mail.gmail.com>
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
Cc: amd-gfx@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Uma Shankar <uma.shankar@intel.com>, dri-devel@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 03, 2023 at 02:52:50PM +0100, Sebastian Wick wrote:
> On Fri, Feb 3, 2023 at 2:35 PM Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Fri, Feb 03, 2023 at 01:59:07PM +0100, Sebastian Wick wrote:
> > > On Fri, Feb 3, 2023 at 11:40 AM Ville Syrjälä
> > > <ville.syrjala@linux.intel.com> wrote:
> > > >
> > > > On Fri, Feb 03, 2023 at 02:07:44AM +0000, Joshua Ashton wrote:
> > > > > Userspace has no way of controlling or knowing the pixel encoding
> > > > > currently, so there is no way for it to ever get the right values here.
> > > >
> > > > That applies to a lot of the other values as well (they are
> > > > explicitly RGB or YCC). The idea was that this property sets the
> > > > infoframe/MSA/SDP value exactly, and other properties should be
> > > > added to for use userspace to control the pixel encoding/colorspace
> > > > conversion(if desired, or userspace just makes sure to
> > > > directly feed in correct kind of data).
> > >
> > > I'm all for getting userspace control over pixel encoding but even
> > > then the kernel always knows which pixel encoding is selected and
> > > which InfoFrame has to be sent. Is there a reason why userspace would
> > > want to control the variant explicitly to the wrong value?
> >
> > What do you mean wrong value? Userspace sets it based on what
> > kind of data it has generated (or asked the display hardware
> > to generate if/when we get explicit control over that part).
> 
> Wrong in the sense of sending the YCC variant when the pixel encoding
> is RGB for example.
> 
> Maybe I'm missing something here but my assumption is that the kernel
> always has to know the pixel encoding anyway. The color pipeline also
> assumes that the pixel values are RGB. User space might be able to
> generate YCC content but for subsampling etc the pixel encoding still
> has to be explicitly set.

The kernel doesn't really know much atm. In theory you can just
configure the thing to do a straight passthough and put anything you
want into your pixels.

> 
> So with the kernel always knowing exactly what pixel encoding is sent,
> why do we need those variants? I just don't see why this is necessary.
> 
> >
> > --
> > Ville Syrjälä
> > Intel
> >

-- 
Ville Syrjälä
Intel
