Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B75690FF3
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 19:09:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 121F010E266;
	Thu,  9 Feb 2023 18:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94AF510E241;
 Thu,  9 Feb 2023 18:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675966176; x=1707502176;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=13BZUT8q8FKiiVQAuUSqOrM5BE7lTrKHMlcPe1OmrP0=;
 b=FACEwR64FOMM2ApE+q3VWWMXCDIFSMJ6tMjvSWjFIGr7B8iVhh+2bMeu
 yHQPpOIxgU8aWFEBU/YJdGsM3Msp+vpe8vGF9to4NV/5MtUA0A+7WlJ8x
 qFuJBvhhXuQzf+7KwDOR5NUN5jCsOvv2vL6BJadv0d0R26bbM71vZI9+n
 z+uzHXV94n7/cL/RERv7n/tR8i2YaX3+6dpMmRxc43UfMEwSdMYh2HuGe
 YWqETXQQi9WMfHVKK6vkvJIbFAhrJLvaPpgxEXEJ9MhGZaFC4vXCIkySZ
 HIPFo3z5lt1Qvfo09OYb6yJPDrMg2QWmVi0iQUerwwjDWpW/Uw2LTGrFA g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="328830891"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; d="scan'208";a="328830891"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 10:09:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="667774629"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; d="scan'208";a="667774629"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by orsmga002.jf.intel.com with SMTP; 09 Feb 2023 10:08:59 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 09 Feb 2023 20:08:57 +0200
Date: Thu, 9 Feb 2023 20:08:57 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Message-ID: <Y+U2uZ4SVhg1IsJx@intel.com>
References: <20230203020744.30745-1-joshua@froggi.es>
 <20230203020744.30745-3-joshua@froggi.es>
 <20230208113041.70691449@eldfell>
 <54695463-3e7f-4e4a-cd76-fa6f9de1d8e8@froggi.es>
 <hlhk2_vNweAm7d8c2FK8GlUEi1-JHOZTU2W8unUHLoyTtyjXQnnAoGur8KqYgrbw6nsP9Yy91k8OzgiP1k_zwIX4JB0Qt5W178zqOgHilZY=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hlhk2_vNweAm7d8c2FK8GlUEi1-JHOZTU2W8unUHLoyTtyjXQnnAoGur8KqYgrbw6nsP9Yy91k8OzgiP1k_zwIX4JB0Qt5W178zqOgHilZY=@emersion.fr>
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
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 dri-devel@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 09, 2023 at 05:03:19PM +0000, Simon Ser wrote:
> On Thursday, February 9th, 2023 at 17:38, Joshua Ashton <joshua@froggi.es> wrote:
> 
> > > I mean, the strings are the uAPI, not the integers, right?
> >
> > Both are uAPI these days.
> 
> Yes. The integers are uAPI, if you change them you'll break libliftoff
> users. There is an old thread discussing this somewhere. The tl;dr was
> that there is no use-case for exposing the same string with a different
> integer, so no good reason to justify the substantial complexity of
> handling this case.

If people actually depend on that we should probably have tests to
make sure no one breaks it by accident.

-- 
Ville Syrjälä
Intel
