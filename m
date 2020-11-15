Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 847802B3842
	for <lists+dri-devel@lfdr.de>; Sun, 15 Nov 2020 20:08:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 313BB6E99A;
	Sun, 15 Nov 2020 19:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157D96E99A
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 19:08:20 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id D1C88804F2;
 Sun, 15 Nov 2020 20:08:17 +0100 (CET)
Date: Sun, 15 Nov 2020 20:08:16 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: Re: [PATCH] drm/gma500: Remove 2D accel code
Message-ID: <20201115190816.GA4067505@ravnborg.org>
References: <20201115175420.32167-1-patrik.r.jakobsson@gmail.com>
 <20201115183255.GA4011888@ravnborg.org>
 <CAMeQTsZHRgexWdHpHHFy9kDdHRvoM74UFRV6iC=NTcw8pQAMmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMeQTsZHRgexWdHpHHFy9kDdHRvoM74UFRV6iC=NTcw8pQAMmQ@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8
 a=9l5qod2cuWEH7sCH9FcA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Patrik,
On Sun, Nov 15, 2020 at 07:51:27PM +0100, Patrik Jakobsson wrote:
> On Sun, Nov 15, 2020 at 7:32 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > Hi Patrik.
> > On Sun, Nov 15, 2020 at 06:54:20PM +0100, Patrik Jakobsson wrote:
> > > 2D acceleration is only available on PSB and MRST and very slow on both
> > > platforms. CPU acceleration is faster so don't bother with 2D accel
> > > anymore.
> > >
> > > Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> >
> > I like the patch and it follows up on the discussions to
> > remove accellerations that is not really a benefit.
> > But I tried to apply it on top of drm-misc-next and it failed in
> > framebuffer.c - did you remove psbfb_roll_ops in another patch?
> 
> Hi Sam,
> Right, sorry I should have mentioned that it sits on top of
> https://patchwork.freedesktop.org/series/83153/

I thought I had seen something like this before.
So all is good - patch is:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
