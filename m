Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 760E66899D7
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 14:35:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9128A10E796;
	Fri,  3 Feb 2023 13:35:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE5210E57F;
 Fri,  3 Feb 2023 13:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675431319; x=1706967319;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MLFA9sc6d6UkWzA6YjJyjSI+gD+WpHjmuvxAX7ugnKc=;
 b=CHHDLWQO7sk6XHhZW8XLkY+y04Mc40VKFop/9ARuoyMbtxsfV9CyqsV8
 e22MH/t7l3bm530ueKaIBh4skDmoFVG7UzkfKElJ4ckhmgk1Q3tqyVdft
 B9+Y5ascE+0mGTQnFpDTPQMEPmwe6kZGoTfEjAGd2bMkv/w4ky4wcZhqZ
 a453iGx8QUlLaHp/5YgwfNx1K8peaJ8bgUFHirdJoZbOJ7ek9cpyXO63e
 1O86tdbqFz+JwwP1dC+a/ZDM6P7elsInhyjgwEC1Ctixm+3qmL/dULMTJ
 TVBgNRS/ItgbzXsNrEhJLJCOkzCdf/mY7VWQPgm+4f/E1wU89D6LRIHiE w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="316741957"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="316741957"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 05:35:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="808362345"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="808362345"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by fmsmga001.fm.intel.com with SMTP; 03 Feb 2023 05:35:14 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 03 Feb 2023 15:35:14 +0200
Date: Fri, 3 Feb 2023 15:35:14 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sebastian Wick <sebastian.wick@redhat.com>
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Message-ID: <Y90NkvVabh+ue9hF@intel.com>
References: <20230203020744.30745-1-joshua@froggi.es>
 <20230203020744.30745-3-joshua@froggi.es>
 <Y9zkef5FjtZ7guVS@intel.com>
 <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
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

On Fri, Feb 03, 2023 at 01:59:07PM +0100, Sebastian Wick wrote:
> On Fri, Feb 3, 2023 at 11:40 AM Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Fri, Feb 03, 2023 at 02:07:44AM +0000, Joshua Ashton wrote:
> > > Userspace has no way of controlling or knowing the pixel encoding
> > > currently, so there is no way for it to ever get the right values here.
> >
> > That applies to a lot of the other values as well (they are
> > explicitly RGB or YCC). The idea was that this property sets the
> > infoframe/MSA/SDP value exactly, and other properties should be
> > added to for use userspace to control the pixel encoding/colorspace
> > conversion(if desired, or userspace just makes sure to
> > directly feed in correct kind of data).
> 
> I'm all for getting userspace control over pixel encoding but even
> then the kernel always knows which pixel encoding is selected and
> which InfoFrame has to be sent. Is there a reason why userspace would
> want to control the variant explicitly to the wrong value?

What do you mean wrong value? Userspace sets it based on what
kind of data it has generated (or asked the display hardware
to generate if/when we get explicit control over that part).

-- 
Ville Syrjälä
Intel
