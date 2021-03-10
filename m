Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F327A334B45
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 23:15:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953B16EA6F;
	Wed, 10 Mar 2021 22:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666B56EA6F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 22:15:19 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 e19-20020a4a73530000b02901b62c0e1bb6so186218oof.11
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 14:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fRJjXSbgkkAjrqPgFAeZvP0VDQm/EVT4CD6KgmK+uLk=;
 b=MXowPZe/y+iIjsc9BM37z75RkB5Kd0dTEi16WoYboopyDccVoQWj2wyeLZctrWVIQY
 FzGiFOEdOJsxt4kuNG2Y9mKI09NN/RHFkAVhreL0lsiDJXTmNaW3DpSD22MNJVBvyp+g
 mQCxxB5GapgRH2SqtnNF/vxZJwc8RLTqAjd2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fRJjXSbgkkAjrqPgFAeZvP0VDQm/EVT4CD6KgmK+uLk=;
 b=C7vLOKHKzs8Gn3iCOrJlBcldTwy3B1v4tIOO7VblWhLlzATBJOaC+6y2X7V1rDZFkC
 +tST+AkfzLCnel9OwQLPJkNmcRT3t8oWFlNm38LRULJpU4FVClGx1YvF8m0GKP+jfRkS
 hNY+A540s4fiuZTdEjKLLdZecLwAW6l08DtT4ZEBeF3p2Eyoqk/o62G/ycEgWPv/fJVJ
 9SVvDwkRLgawUl6CZMN3FTWdG9gnDRCvcrH7F7vSsA40oQ/8pgykbCIT42Hahu3oMZKO
 xG45h/nU2cR7Gr+nM9JHoEU9Wmk7uBqQY+bJ2f2/0DF6HQBSnYnl83L6Cl+qWlvtPWSR
 vkYQ==
X-Gm-Message-State: AOAM5333ylSoRxv7rBVWZNanBAeU6P3Gp+kQJj8V84JIMBAQAkQcq3rB
 6JPZiwrHEQHYsKKeZMODQKYpWvQLPYWm2ZmhlLzdtQ==
X-Google-Smtp-Source: ABdhPJwINVkWBknCV1enfQAk5uDyEN7ZExw17wRnvkDYfOCuZKrthTo3goTlrjWbPDP+pAnr7UBmgU3R8DJ6Y8dJBMw=
X-Received: by 2002:a4a:424c:: with SMTP id i12mr4012905ooj.85.1615414518675; 
 Wed, 10 Mar 2021 14:15:18 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9tyZF=seWUswnp7M3RbDQC2hLUc0wjpYYyEfn3dgpOf4zw@mail.gmail.com>
 <20210310074851.x4lo4ymkq25e2iw2@gilmour>
 <CAPM=9tym-LbpFhFCyezYRZeOv6ryEcGj-Jh5yH_87x45g8NN_w@mail.gmail.com>
In-Reply-To: <CAPM=9tym-LbpFhFCyezYRZeOv6ryEcGj-Jh5yH_87x45g8NN_w@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 10 Mar 2021 23:15:07 +0100
Message-ID: <CAKMK7uGbcCH-W5tM6Bg4fBLVuXiR4EeYUnHA9pn=WTdkOyA42g@mail.gmail.com>
Subject: Re: don't base trees on 5.12-rc1
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 10, 2021 at 8:11 PM Dave Airlie <airlied@gmail.com> wrote:
>
> On Wed, 10 Mar 2021 at 17:48, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Hi Dave,
> >
> > On Wed, Mar 10, 2021 at 09:50:29AM +1000, Dave Airlie wrote:
> > > I'm mostly sending this to the -misc maintainers because
> > > drm-misc-fixes is based on rc1 at present.
> > >
> > > This needs to be *rebased* not merged up to 5.12-rc2. Merging will
> > > still have the bad landmine commits in the bisect history. This is a
> > > very special case.
> >
> > I'm sorry, I'm not entirely sure I get this. -rc1 is still in the -rc2
> > history, so how would that change anything in the bisect history?
> >
>
> We can't get rid of the bad commit range, we can reduce the amount of
> times someone accidentally bisects into it, by not using it as a base
> commit for future changes.
>
> If in the future a bisect happens to want to test one of the patches
> in drm-misc-fixes that is based on rc1, it will land the user with an
> rc1 test kernel and could eat their swapfile/disk. We can avoid that
> problem by not using rc1 as a base for drm-misc-fixes.
>
> We can't avoid them bisecting into the broken commits between when
> this landed and was fixed, but rebasing trees can minimise the chances
> of this when bisecting other changesets.

Same for backmerge, backmerge -rc2, not -rc1. I think there's a
request for backmerge pending from Noralf anyway. Also for any topic
branch and all that.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
