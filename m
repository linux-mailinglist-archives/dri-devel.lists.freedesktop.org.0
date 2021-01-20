Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4872FCF4D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 13:12:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A196E196;
	Wed, 20 Jan 2021 12:12:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 571D46E196
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 12:12:33 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id e70so7715248ote.11
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 04:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hD1HawmEClOJ27r0GX30v0QKKxXQVQE5i1tHxMOMmNc=;
 b=hKkZSQzL5sjvaAXJLUHwokzSagQnpFCjgMj5vVlXrvdtqgTy9PlGR/9lqEgREZXmAI
 0VsETZV3ZG8TGD/aaAtcLyi8XSLYXIClLVbbDqMR4X23BKiHV/Ml9je7VHLhNUD7kNla
 Npw/zjpoBQOErQ0l0I7tZUPNpCssE85vRzn0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hD1HawmEClOJ27r0GX30v0QKKxXQVQE5i1tHxMOMmNc=;
 b=mrd+Ho41fook88JtE83/QXlZe1BCl+Mgu/nF26t7KQNjZU4i/VtVZD3jiY4G9odmlm
 bFjUSHn/GZkJmX61iMnJBcH8mNRKW8Qe3bvgoKNu1yh4JKqEmDfBQEuK2SYSL1titRF9
 XiG1Hx8AQ392QNpMpxVNZFIWNDuB+Ls37js/SOx3Y74Ut+W+9hX6vhxGwdKv2is52bO/
 iEVFOBvII5vsFQaUjz6a6+5rLmEftHQvzmIByy2wFaAkO0Q+PMJWvR6va4IfNmUXHYDz
 A+5g7A3j0yseA9rNnvPWW/pImNYNRENKMHf1hE9/fMiTPHotsHMvax0ZGnnu0HhblaUf
 p3IA==
X-Gm-Message-State: AOAM5339B1MAhVMgdL6NUteoMvL3p0PnkzM7BsDAa96gGJ4NW9I29dEl
 8aV+DYl3Ju1n8nAhbrm1wVO97Cv4NAGh8XNM12Ysmw==
X-Google-Smtp-Source: ABdhPJxN4e7pxvgB00qQH6R3k3PZ5lVut4BMuNJQ+CqfUb/Pnb/8RPiMXbS8EeohqA1lQD/s2x0tfMsCwbDWW1uWq1I=
X-Received: by 2002:a9d:ea6:: with SMTP id 35mr6742495otj.188.1611144752644;
 Wed, 20 Jan 2021 04:12:32 -0800 (PST)
MIME-Version: 1.0
References: <20210108115518.2b3fdf58@canb.auug.org.au>
 <20210108122540.657501b2@canb.auug.org.au>
 <20210111105654.17e3aa76@canb.auug.org.au>
 <20210118115924.6ee14fd3@canb.auug.org.au>
 <CAPM=9tz7bEZewNwg_96Jj+oyBk3=c7hZ4aFbSKdMAsewJpfXHw@mail.gmail.com>
In-Reply-To: <CAPM=9tz7bEZewNwg_96Jj+oyBk3=c7hZ4aFbSKdMAsewJpfXHw@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 20 Jan 2021 13:12:21 +0100
Message-ID: <CAKMK7uEtpi+20rEp4zg5P+d=qS7XcPi0VCp2OdHirX_Fm9TX7A@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm tree
To: Dave Airlie <airlied@gmail.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, DRI <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 18, 2021 at 2:06 AM Dave Airlie <airlied@gmail.com> wrote:
>
> On Mon, 18 Jan 2021 at 10:59, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > On Mon, 11 Jan 2021 10:56:54 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > On Fri, 8 Jan 2021 12:25:40 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > >
> > > > On Fri, 8 Jan 2021 11:55:18 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > > >
> > > > > After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
> > > > > failed like this:
> > > > >
> > > > > error: the following would cause module name conflict:
> > > > >   drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.ko
> > > > >   drivers/gpu/drm/panel/panel-dsi-cm.ko
> > > > >
> > > > > Maybe caused by commit
> > > > >
> > > > >   cf64148abcfd ("drm/panel: Move OMAP's DSI command mode panel driver")
> > > > >
> > > > > I have used the drm tree from next-20210107 for today.
> > > >
> > > > This has affected the drm-misc tree as well (since it merged in the drm
> > > > tree).
> > > >
> > > > I have used the drm-misc tree from next-20210107 for today.
> > >
> > > And now the drm-intel tree.
> > >
> > > I have used the drm-intel tree from next-20210108 for today.
> >
> > This is still affecting the drm and drm-intel trees.
>
> I think the fix for this is in drm-misc-next, Maarten can you send me
> a -next PR to fix this?

I've pulled drm-misc-next into drm-next now, so as long as all other
drm trees are merged after drm, this should be solved now.
drm-intel-next also has their msm build breakage fixed (I acked the
patch already), so hopefully we should be all clean again.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
