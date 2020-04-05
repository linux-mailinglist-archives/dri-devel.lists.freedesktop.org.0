Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5499B19EBE9
	for <lists+dri-devel@lfdr.de>; Sun,  5 Apr 2020 16:11:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE6186E249;
	Sun,  5 Apr 2020 14:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B876E249
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Apr 2020 14:11:35 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id h9so14214976wrc.8
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Apr 2020 07:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z8d6AJalPWCNMrPOGz4TUIkHpGcbuci4u9pqA1PXRY4=;
 b=vYwYgN7F788ec2HchBK0gZg5sIYR9ljFlwIGKfHmBSUxHEvOXZQbgx+BkVjX7AT5Mi
 Rg95I3KaLsK3YliZlxnTwmJGhap+HcDW3XK3X+rWBHLKN9gS90dRxuBpWK5WZnDBUCtF
 oWH9X6a4G7l/NQ38u3iW/1mz+mnLazv6VZ+706fRVfwiz2ndImLjRdtLo+DaHkE0O5jd
 VbuDp/iUrnyZ58m9eKRtGGGGuGcgqcQdMDpgBSBLuoTicTIfF/JWEmkM17l8+55cXgxN
 J1Tc/3jsFpjLnEHITpQc5xjgDIW5PDpygrM3+kpAQiQc5Bn12KuEQh2uaTC6CiHJCKJF
 74AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z8d6AJalPWCNMrPOGz4TUIkHpGcbuci4u9pqA1PXRY4=;
 b=dehtMayOMGv/ZxqaMoaSW9HBjwxz3W5QeQpHo6gAtlRsCQR0MdQgmjdI5EwwNByh2V
 5xFNf31AxqPZRunw09oZWgZc/DuVnmEiy+j53uKPlnbSwJvshB68b0NQuZPGvya8ALBc
 iqJjH0LgtSnSswgDO1P0D+Q4p18VPyrkAEAySH9eVCxqWCxpERpSKDnsCO1SuHWcPOuD
 krmu1tFaw6q8J7odbVJ2CqaPN2jJWX8kgvZ74TwAScbZJBrkZhwvFRla/e3l4/mrfWVT
 yDFuBL2UY+O/NiguYwjv7x3RWxqHhkpVFdH+YxAl8GT3Gh9xbYtbDEuKUrjXJikDthU6
 n7dA==
X-Gm-Message-State: AGi0PuZDvh8osGgMA8SZt/gASD4VZslOMPDRBmmAZXdkOm3UH15PRYVy
 blgglJtha3VLYKJQ21xLe62qGtH9ZFGVKUIt2Mk=
X-Google-Smtp-Source: APiQypI1bpG7n23q0Oyvtk/yrSkc8iHjgkhHT4ACcnN2nkvQdBnroCMPII6M51C6TxRsgRuiEIfOF8NcN0WsL3MFu6s=
X-Received: by 2002:a5d:6742:: with SMTP id l2mr20105220wrw.124.1586095894440; 
 Sun, 05 Apr 2020 07:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <5e863110.1c69fb81.17969.099e@mx.google.com>
 <187eeb8e-5c70-4479-d806-a7123f9023c8@collabora.com>
 <MN2PR12MB4488D9D3984D03030D3BACC3F7C70@MN2PR12MB4488.namprd12.prod.outlook.com>
 <20200404090658.nxfvi5zg2rgag2qo@gilmour.lan>
In-Reply-To: <20200404090658.nxfvi5zg2rgag2qo@gilmour.lan>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Sun, 5 Apr 2020 10:11:23 -0400
Message-ID: <CADnq5_NbDH+aDFAwj2-rajD8QgF2J=Zmq2w9-7mh8wwRYVWk8Q@mail.gmail.com>
Subject: Re: mainline/master bisection: baseline.login on peach-pi
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Joerg Roedel <jroedel@suse.de>, David Airlie <airlied@linux.ie>,
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 Shane Francis <bigbeeshane@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, Tom Murphy <murphyt7@tcd.ie>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "kernelci@groups.io" <kernelci@groups.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 4, 2020 at 8:46 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> On Fri, Apr 03, 2020 at 03:47:46PM +0000, Deucher, Alexander wrote:
> > [AMD Official Use Only - Internal Distribution Only]
> >
> > > -----Original Message-----
> > > From: Guillaume Tucker <guillaume.tucker@collabora.com>
> > > Sent: Friday, April 3, 2020 10:14 AM
> > > To: Michael J. Ruhl <michael.j.ruhl@intel.com>; Shane Francis
> > > <bigbeeshane@gmail.com>; Deucher, Alexander
> > > <Alexander.Deucher@amd.com>
> > > Cc: kernelci@groups.io; dri-devel@lists.freedesktop.org; linux-
> > > kernel@vger.kernel.org; Tom Murphy <murphyt7@tcd.ie>; Joerg Roedel
> > > <jroedel@suse.de>; David Airlie <airlied@linux.ie>; Maarten Lankhorst
> > > <maarten.lankhorst@linux.intel.com>; Daniel Vetter <daniel@ffwll.ch>;
> > > Maxime Ripard <mripard@kernel.org>; Enric Balletbo i Serra
> > > <enric.balletbo@collabora.com>
> > > Subject: Re: mainline/master bisection: baseline.login on peach-pi
> > >
> > > Please see the bisection report below about a boot failure.
> > >
> > > Reports aren't automatically sent to the public while we're trialing new
> > > bisection features on kernelci.org but this one looks valid.
> > >
> > > This bisection was run with exynos_defconfig but the issue can also be
> > > reproduced with multi_v7_defconfig.  It doesn't appear to be affecting any
> > > other platforms on kernelci.org.  This looks like a DRM driver problem, the
> > > kernel image boots fine without the modules installed.  It actually started
> > > failing on Tuesday in mainline.
> >
> > Fixed with this patch:
> > https://patchwork.freedesktop.org/patch/359081/
> >
> > Just trying to get this into 5.7 and stable.  I was waiting for a
> > 5.6 back merge to drm-misc-next-fixes, but I could send it as a
> > separate PR if Dave or Daniel prefer.
>
> You should ask us next time, we're not doing them unless asked :)
>
> I've done it, it's compiling at the moment, it should be pushed in the
> next 10 minutes or so.
>

I sent out a generic ping on IRC.  Next time I'll be more specific.

Thanks!

Alex
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
