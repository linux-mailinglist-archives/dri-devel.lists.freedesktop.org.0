Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A950A16008E
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2020 22:13:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD3488284;
	Sat, 15 Feb 2020 21:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FDD56E235
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2020 21:12:53 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 007818045F;
 Sat, 15 Feb 2020 22:12:50 +0100 (CET)
Date: Sat, 15 Feb 2020 22:12:49 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v1 1/1] drm: drop unused drm_crtc callback
Message-ID: <20200215211249.GA23712@ravnborg.org>
References: <20200215173342.GA7458@ravnborg.org>
 <CAKMK7uHweW=yhM=zjzfohL4ki-YoxOO=nfoONY8VDGm7FSdP2w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHweW=yhM=zjzfohL4ki-YoxOO=nfoONY8VDGm7FSdP2w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=Tuv7cbUj50Dypws37FYA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 15, 2020 at 08:09:40PM +0100, Daniel Vetter wrote:
> On Sat, Feb 15, 2020 at 6:33 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > struct drm_encoder_helper_funcs included a callback
> > named drm_crtc.
> >
> > There are no users left - so drop it.
> > There was one reference in drm_crtc_helper.c,
> > which checked if the value was not NULL.
> > As it was never assigned this check could be dropped.
> >
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > ---
> >
> > Stumbled upon this and dediced to check if it was used.
> > Build tested with allyesconfig, allmodconfig for relevant architectures.
> 
> Nice catch!
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Thanks for the quick review.

Applied and pushed out.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
