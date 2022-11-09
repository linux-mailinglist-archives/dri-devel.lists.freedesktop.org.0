Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A284622A1E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 12:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 641F910E559;
	Wed,  9 Nov 2022 11:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CA210E593
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 11:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667992678; x=1699528678;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Rqq1gX+ZyKpfStliAd1bcLy462SypQdut86eu8BTgpY=;
 b=kb1lRqc6Jt6vycQUBZXtY9mXTLKW70OBRLUMPZIUwfrlVVj6Jse4CPnm
 LrEzplWOg8b0CWdnP8UhnQMUtT5DR/4e0+s+KiqJ6M5pXO4xhOahY9Rk9
 w3l1gDv4TKY9EXx09ptvDxq/Bs1Q2Xi8gONmKDF80dY7c7i+LYv4KjFsb
 Gy0H62PBLfAchE1mLCtt6zufio5i7lns2las6QLvA/B2ShxGke3gecTKZ
 l6XTt9OyAIZokoV1TGljcQr08YsKcpY5Vp7/pCL/3q72HBFW8rDY7XOEH
 3NwjXO9heZGWeCVQpAesKHLGBACl8FbcQijaJTj15i/8Jt2R43a+5dmsh g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="309663362"
X-IronPort-AV: E=Sophos;i="5.96,150,1665471600"; d="scan'208";a="309663362"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 03:17:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="636707228"
X-IronPort-AV: E=Sophos;i="5.96,150,1665471600"; d="scan'208";a="636707228"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga002.jf.intel.com with SMTP; 09 Nov 2022 03:17:48 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 09 Nov 2022 13:17:47 +0200
Date: Wed, 9 Nov 2022 13:17:47 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH v2 0/7] drm: Review of mode copies
Message-ID: <Y2uMW8yJ7I6TsYMW@intel.com>
References: <20221107192545.9896-1-ville.syrjala@linux.intel.com>
 <Y2p7l/6hy8NxO2rP@phenom.ffwll.local>
 <CADnq5_MA1CxFi6ySwsLKVmaZmh9KrB9m83OKiT00xYRdzjpuog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_MA1CxFi6ySwsLKVmaZmh9KrB9m83OKiT00xYRdzjpuog@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 08, 2022 at 05:13:37PM -0500, Alex Deucher wrote:
> On Tue, Nov 8, 2022 at 10:54 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, Nov 07, 2022 at 09:25:38PM +0200, Ville Syrjala wrote:
> > > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > >
> > > Repost of the stragglers from
> > > https://patchwork.freedesktop.org/series/100393/
> > >
> > > Note that I didn't rerun the cocci stuff, nor have I had
> > > time to come up with something to inluce the cocci scripts
> > > in the tree. So it's possible this is missing some new
> > > things that have snuck in the meantime.
> > >
> > > Ville Syrjälä (7):
> > >   drm/amdgpu: Use drm_mode_init() for on-stack modes
> > >   drm/hisilicon: Use drm_mode_init() for on-stack modes
> > >   drm/msm: Use drm_mode_init() for on-stack modes
> > >   drm/msm: Use drm_mode_copy()
> > >   drm/mtk: Use drm_mode_init() for on-stack modes
> > >   drm/rockchip: Use drm_mode_copy()
> > >   drm/sti: Use drm_mode_copy()
> >
> > On the series:
> >
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >
> > Imo ping Alex/Rob and stuff everything left into drm-misc-next.
> 
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> Feel free to take this series through whatever tree makes sense.  If
> you want me to pick up the amdgpu change directly, I can do that too.

Please do. Less work for me ;)

-- 
Ville Syrjälä
Intel
