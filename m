Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C47A468F12B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 15:49:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47BF010E7A1;
	Wed,  8 Feb 2023 14:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 797C710E799;
 Wed,  8 Feb 2023 14:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675867787; x=1707403787;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=UQXWo6TjDdebzIpdk/+ZIVkUr+YHexlGBDjSbMSM9rM=;
 b=Nyj6Ah0jmxv66Vfj5/+rkCHkfbvQy74A70VFEIyozfMQI1wdaZDrOKiP
 9JXwZPC7V+N/9h4Qj8131JmwzdxhijGWHsC9MncPKR0eO9XCwxRcEYua+
 fReClb+F9HnQncEJ6YMhwR8KBO3ggSb+xGGajcvmxMltwiwdS287GVcml
 zuVnjUpVpzhWXdn96D/3SXo8iN00aJIruhlc06ae15rT5mhLtgJEJcq6o
 UV20XWDPF+CRE4rmkXhqkr2s1KRYQvHL/VwSGCIfqLVvwuWGWao76nhqu
 2LkCqDimUr5BDVajVnRTFQLkISAGArWkD4OlLALgKFJrXCWy8JxDRiA6O w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="394404949"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; d="scan'208";a="394404949"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2023 06:49:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="730882821"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; d="scan'208";a="730882821"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by fmsmga008.fm.intel.com with SMTP; 08 Feb 2023 06:49:32 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 08 Feb 2023 16:49:31 +0200
Date: Wed, 8 Feb 2023 16:49:31 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Message-ID: <Y+O2e8ZOp2EjAJI/@intel.com>
References: <20230203020744.30745-1-joshua@froggi.es>
 <20230203020744.30745-3-joshua@froggi.es>
 <Y9zkef5FjtZ7guVS@intel.com>
 <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
 <Y90NkvVabh+ue9hF@intel.com>
 <CA+hFU4xR_8=w=z=Jqs3sujTvnXfEQJVHAMFW-X4-55POF=Bu9g@mail.gmail.com>
 <Y90UC43KouMRh8I2@intel.com> <20230208111842.4d7aacb2@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230208111842.4d7aacb2@eldfell>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, amd-gfx@lists.freedesktop.org,
 Uma Shankar <uma.shankar@intel.com>, dri-devel@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 08, 2023 at 11:18:42AM +0200, Pekka Paalanen wrote:
> On Fri, 3 Feb 2023 16:02:51 +0200
> Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> 
> > On Fri, Feb 03, 2023 at 02:52:50PM +0100, Sebastian Wick wrote:
> > > On Fri, Feb 3, 2023 at 2:35 PM Ville Syrjälä
> > > <ville.syrjala@linux.intel.com> wrote:  
> > > >
> > > > On Fri, Feb 03, 2023 at 01:59:07PM +0100, Sebastian Wick wrote:  
> > > > > On Fri, Feb 3, 2023 at 11:40 AM Ville Syrjälä
> > > > > <ville.syrjala@linux.intel.com> wrote:  
> > > > > >
> > > > > > On Fri, Feb 03, 2023 at 02:07:44AM +0000, Joshua Ashton wrote:  
> > > > > > > Userspace has no way of controlling or knowing the pixel encoding
> > > > > > > currently, so there is no way for it to ever get the right values here.  
> > > > > >
> > > > > > That applies to a lot of the other values as well (they are
> > > > > > explicitly RGB or YCC). The idea was that this property sets the
> > > > > > infoframe/MSA/SDP value exactly, and other properties should be
> > > > > > added to for use userspace to control the pixel encoding/colorspace
> > > > > > conversion(if desired, or userspace just makes sure to
> > > > > > directly feed in correct kind of data).  
> > > > >
> > > > > I'm all for getting userspace control over pixel encoding but even
> > > > > then the kernel always knows which pixel encoding is selected and
> > > > > which InfoFrame has to be sent. Is there a reason why userspace would
> > > > > want to control the variant explicitly to the wrong value?  
> > > >
> > > > What do you mean wrong value? Userspace sets it based on what
> > > > kind of data it has generated (or asked the display hardware
> > > > to generate if/when we get explicit control over that part).  
> > > 
> > > Wrong in the sense of sending the YCC variant when the pixel encoding
> > > is RGB for example.
> > > 
> > > Maybe I'm missing something here but my assumption is that the kernel
> > > always has to know the pixel encoding anyway. The color pipeline also
> > > assumes that the pixel values are RGB. User space might be able to
> > > generate YCC content but for subsampling etc the pixel encoding still
> > > has to be explicitly set.  
> > 
> > The kernel doesn't really know much atm. In theory you can just
> > configure the thing to do a straight passthough and put anything you
> > want into your pixels.
> 
> But it's impossible to use a YCbCr framebuffer and have that *not*
> converted to RGB for the KMS color pipeline even if userspace wanted it
> to be strictly pass-through, only to be converted again to YCbCr for
> the cable, is it not?
> 
> Even more so with 4:2:0.
> 
> How could it be possible to stop the driver from doing those two
> YUV-to-RGB and RGB-to-YCbCr conversions at the beginning and at the end
> of the KMS color pipeline?

You can stop the conversion at the start of the pipeline by
using a "RGB" framebuffer. At the end of the pipe it's not
possible with the current props.

-- 
Ville Syrjälä
Intel
