Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 699DEA0B455
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 11:18:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F60110E291;
	Mon, 13 Jan 2025 10:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="F9aqWR9f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7693710E046;
 Mon, 13 Jan 2025 10:17:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1B3685C4CCA;
 Mon, 13 Jan 2025 10:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3759C4CED6;
 Mon, 13 Jan 2025 10:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736763478;
 bh=mReMEICzRw+0m0DEjJ0DZMWlcFfpkmbkNSz/MeRD4tg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=F9aqWR9f0isUe3iRtEp64bcoEleiEqmcdZv6tHWCoF6K/SBhiPLYOKuDX2TYuTBny
 KRkIPRKbGmP8BxgaZDtthR6sp3YrNmHDns0s8mjD/t8/E4WQo1r7H9gvDu7poBLSS3
 tqIAEUbSXIhHgepe/KRG+ZFjPQ5u9tXusb+T/kA67f7I/oyEWqeAQL2jY6geDojpFn
 XwY3kXYURTejANmSfzJhD9VVXyKiZWZ0B8eGyoSqi4FZ4bNSy8GTBHTxV7Gw5D0zvl
 QgwZ9IeKtku92j4eHGJOTx2hSHBBiK0vxvdoOFj1yqVx9vTVKPFaETR8fryHqscJjW
 1sJJtkQD1ZQ/g==
Date: Mon, 13 Jan 2025 12:17:49 +0200
From: Zhi Wang <zhiwang@kernel.org>
To: Zhenyu Wang <zhenyuw.linux@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, zhiyuan.lv@intel.com,
 james.y.wu@intel.com, kevin.tian@intel.com, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, "Dr. David Alan Gilbert" <linux@treblig.org>,
 zhi.wang.linux@gmail.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Lucas De
 Marchi <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: GVT-g status (was: Re: [PATCH 0/3] drm/i915/gvt: Deadcoding)
Message-ID: <20250113121749.00006dec.zhiwang@kernel.org>
In-Reply-To: <Z4IA6XtXX-e0Du-6@dell-wzy>
References: <20241222002043.173080-1-linux@treblig.org>
 <Z2dcZfW8eNMnxT0v@gallifrey> <Z3uGjO36tfhQsnfp@dell-wzy>
 <Z4A7QDtTrU6w2Yhv@intel.com> <877c73j64o.fsf@intel.com>
 <Z4IA6XtXX-e0Du-6@dell-wzy>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 11 Jan 2025 14:26:01 +0900
Zhenyu Wang <zhenyuw.linux@gmail.com> wrote:

> On Fri, Jan 10, 2025 at 12:49:27PM +0200, Jani Nikula wrote:
> > On Thu, 09 Jan 2025, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> > > On Mon, Jan 06, 2025 at 04:30:20PM +0900, Zhenyu Wang wrote:
> > >> On Sun, Dec 22, 2024 at 12:25:09AM +0000, Dr. David Alan Gilbert
> > >> wrote:
> > >> > Note: zhenyuw@linux.intel.com's address bounces:
> > >> > 
> > >> 
> > >> yeah, I've left Intel so can't use that box any more, looks
> > >> Rodrigo hasn't queue up my address change patch yet. Rodrigo?
> > >
> > > pushed to drm-intel-next now, although I was assuming this to come
> > > on a gvt pull request...
> > >
> > > what about this patch here? coming in a PR or should I take this
> > > directly at drm-intel-next as well?
> > 
> > AFAICT the last gvt-next pull request was more than two years ago
> > and gvt-fixes slightly less than one year ago.
> > 
> > There's a single cleanup commit in gvt-next applied two years ago
> > for which there hasn't been a pull request.
> > 
> > The GVT github page [1] says, "This repository has been archived by
> > the owner on Oct 3, 2024. It is now read-only." The intel-gvt-dev
> > mailing list [2] appears to be mostly spam.
> > 
> > Seems to me something like this would be appropriate:
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 1c3eab5d2b1a..161206fdaf05 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11557,11 +11557,10 @@ F:	drivers/gpio/gpio-tangier.h
> >  INTEL GVT-g DRIVERS (Intel GPU Virtualization)
> >  M:	Zhenyu Wang <zhenyuw.linux@gmail.com>
> >  M:	Zhi Wang <zhi.wang.linux@gmail.com>
> > -L:	intel-gvt-dev@lists.freedesktop.org
> >  L:	intel-gfx@lists.freedesktop.org
> > -S:	Supported
> > +S:	Maintained
> >  W:	https://github.com/intel/gvt-linux/wiki
> > -T:	git https://github.com/intel/gvt-linux.git
> > +T:	git https://gitlab.freedesktop.org/drm/i915/kernel.git
> >  F:	drivers/gpu/drm/i915/gvt/
> >
> 
> Looks fine with me.
> 
> Acked-by: Zhenyu Wang <zhenyuw.linux@gmail.com>
> 
> >  INTEL HID EVENT DRIVER
> > 
> > But I don't think it would be far from the truth to have "S: Odd
> > Fixes" either. And the extreme would be to just remove the whole
> > maintainers entry and have it fall back to the i915 entry.
> > 
> > Thoughts?
> >
> 
> When I left Intel, I have raised similar question to manager or
> related people to see their ideas on how to keep GVT-g maintenance
> work for upstream, but I didn't get real answers before my last day
> at Intel...So still cc some intel gvt related people to double
> confirm.
> 
> For me, it's fine to remove the maintainer entry maybe only keep as
> reviewer?
> 
> Thanks to raise up this issue, Jani! 
> 

Works for me as well. I am mostly doing this as a hobby on my Skylake
desktop in my spare time.

Z.
