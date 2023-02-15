Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1026979F4
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 11:35:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153E110EA91;
	Wed, 15 Feb 2023 10:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0487710EA91;
 Wed, 15 Feb 2023 10:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676457321; x=1707993321;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=I3zjOzp2OCm6DEdwWuHabSUwtBY9qBsr2AkTtLJdMck=;
 b=AUUzl2Qj39v1KmthOyYsR2/d+C0znPdidSIHq9WOtOHAepqh68xmhOwr
 adFVj3ET/9HfopQyh7MtDbLkxdKhCaNk9YFCErKSgA4rBSPP1XyhHP72o
 9yjlVH9nA7NNuzxYUa+jUAKUrrR0jC0h9aRJdwWeTxoEWrjUtN76b7NTp
 0Ura0SGIZpLjfLPRT4JSN1wKtsSBku4MR/qXrSTyZCr4c3biDk4vQYWoN
 EGu5QFYi/woHwp2G+O3Gc6Iq5xbGE0bMmf0E5tGBWPqk0uvmvgB6Mx2H6
 kawQZbqekrhh7539Ndvs4vdIEIm9rQF06boF5Db3xAc9ll5ZdKXx+4Dn0 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="329113039"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="329113039"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 02:33:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="699909316"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="699909316"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by orsmga008.jf.intel.com with SMTP; 15 Feb 2023 02:33:02 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 15 Feb 2023 12:33:01 +0200
Date: Wed, 15 Feb 2023 12:33:01 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Message-ID: <Y+y03W0GWUxSucBW@intel.com>
References: <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
 <0fc18aec-0703-55f4-f635-d09d345e8dc0@amd.com>
 <Y90l+DY0rSaMvN1U@intel.com>
 <758e5cf6-53e0-567c-c760-5b773bc7a11c@amd.com>
 <Y90vrEa3/1RbaGOV@intel.com>
 <CA+hFU4wuM_xHniFyRT+jouQ3k_S3UJsRpAtd1Lgx9UVLtrqZrQ@mail.gmail.com>
 <98d1d22a-1c29-5271-1eaf-89c962eb9678@amd.com>
 <CA+hFU4y=N3bR-vXXeLP0xTe0-HJPgF_GTbKrb3A9St-z2LignQ@mail.gmail.com>
 <Y+vqu3qGUQayTjd+@intel.com> <20230215120125.59b5965c@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230215120125.59b5965c@eldfell>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 Uma Shankar <uma.shankar@intel.com>, amd-gfx@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 15, 2023 at 12:01:25PM +0200, Pekka Paalanen wrote:
> On Tue, 14 Feb 2023 22:10:35 +0200
> Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> 
> > On Tue, Feb 14, 2023 at 08:45:00PM +0100, Sebastian Wick wrote:
> 
> ...
> 
> > > We also have to figure out how a user space which doesn't
> > > know about the new property behaves when another client has set that
> > > property. If any property which currently might change the pixel
> > > values is used, we can't expose the entire color pipeline because the
> > > kernel might have to use some element in it to achieve its magic
> > > conversion. So essentially you already have this hard device between
> > > "old" and "new" and you can't use the new stuff incrementally.  
> > 
> > That problem exists with any new property. Old userspace and new
> > userspace may interact badly enought that nothing works right.
> > In that sense I think these props might even be pretty mundane
> > as the worst you might get from setting the infoframe wrong is
> > perhaps wrong colors on your display.
> > 
> > To solve that particular problem there has been talk (for years)
> > about some kind of "reset all" knob to make sure everything is
> > at a safe default value. I have a feeling there was even some
> > kind of semi-real proposal in recent times, but maybe I imgained
> > it?
> 
> I've been talking about that too, but I think it all collapsed into
> "let's just fix all KMS apps to always set all KMS properties" which
> results in patches like
> https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/952

That requires some knowledge about the property in question to
pick the value. I think for some prop types (enums at least)
we could guarantee that the first value is always the safe default,
but for eg. range properties there is no way to know. So doing
that fully blind is not possible atm.

I guess one option might be to include a "reset value" in the
props somehow, and just have everyclient set all unknown props
to that. But there are of course other options too (reset
flag to atomic ioctl, etc.).

> 
> It does not seem to be a serious enough problem for anyone to put in
> the work. And why would it be, when you can easily fix it in your own
> project like that Weston example. The Weston example is not even
> representative, because I did it before I saw any real problems.
> 
> Other musings have been in the direction that maybe logind (since it
> opens DRM devices for you) should save the full KMS state on the very
> first open after a reboot, and then KMS applications can ask logind
> what the boot-up state was. This is a variation of "save all KMS state
> from the moment you launch, and use that as the base if you ever let
> something else touch KMS in between".
> 
> You also never see the problem to begin with, if you never let
> something else touch KMS in between, so that already makes the problem
> rare outside of the tiny set of compositor developers.

Yeah, it's a pretty rare problem so not much interest I guess.

-- 
Ville Syrjälä
Intel
