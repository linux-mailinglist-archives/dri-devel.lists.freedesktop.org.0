Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 785A81E91C8
	for <lists+dri-devel@lfdr.de>; Sat, 30 May 2020 15:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D7A6E079;
	Sat, 30 May 2020 13:43:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFD66E079
 for <dri-devel@lists.freedesktop.org>; Sat, 30 May 2020 13:43:38 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 3B81920022;
 Sat, 30 May 2020 15:43:36 +0200 (CEST)
Date: Sat, 30 May 2020 15:43:34 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v2 2/2] drm/auth: make drm_{set,drop]master_ioctl
 symmetrical
Message-ID: <20200530134334.GA84399@ravnborg.org>
References: <20200530124640.4176323-1-emil.l.velikov@gmail.com>
 <20200530124640.4176323-2-emil.l.velikov@gmail.com>
 <20200530131815.GA82487@ravnborg.org>
 <CACvgo52VvmS-izutgFwdpvuB5gPqNL8jMfd7qYuyfum-hp7XOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo52VvmS-izutgFwdpvuB5gPqNL8jMfd7qYuyfum-hp7XOQ@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=edQTgYMH c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=DfNHnWVPAAAA:8 a=pGLkceISAAAA:8
 a=e5mUnYsNAAAA:8 a=IHM-zVLVvYTKNbD97AUA:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=rjTVMONInIDnV1a_A2c_:22
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
Cc: David Airlie <airlied@linux.ie>, Colin Ian King <colin.king@canonical.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 30, 2020 at 02:34:10PM +0100, Emil Velikov wrote:
> On Sat, 30 May 2020 at 14:18, Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > Hi Emil.
> > On Sat, May 30, 2020 at 01:46:40PM +0100, Emil Velikov wrote:
> > > Currently the ret handling is all over the place - with two redundant
> > > assignments and another one addressed earlier.
> > >
> > > Use the exact same flow in both functions.
> > >
> > > v2: straighten the code flow, instead of just removing the assignments
> > Now even I should be able to follow the flow - thanks :-)
> >
> Fwiw reading at the code the first couple of times, did confuse the
> hell out of me.
> So "there is nothing wrong with your television set" :-P
> 
> > >
> > > Cc: David Airlie <airlied@linux.ie>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Colin Ian King <colin.king@canonical.com>
> > > Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
> Thanks. If you're up for a few more neat patches - check these out [1].
> 
> -Emil
> 
> [1] https://patchwork.freedesktop.org/series/76967/

On my backlog. They require, I think, a bit more time.
backlog atm is way too big - but thats a common issue for everyone.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
