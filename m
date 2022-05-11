Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91270523E9D
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 22:14:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27395112B76;
	Wed, 11 May 2022 20:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BBB5112B70;
 Wed, 11 May 2022 20:14:38 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id q23so4483795wra.1;
 Wed, 11 May 2022 13:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=26U6FjTddM6hMOoXqBgd+U1pVJTYKKyaMhCJDRRHP8Q=;
 b=OfF4r+GBI6gJgaPnkOAKlUi3xv+vUiMvbqV5l3pyxwzt/6gPuIR9yHlcFvb9dj6qUS
 IEvOG49NoEeHlYHQPcgiU7gUZsjqEKRc/OHJuM6U+PCOXSLx9LPylMnkCuZFkqodZq3m
 ChQNbH6jvZRLDQEwLh7ABU/QtBzfdBAU8JH5btSWrFvlOg0ad5p7A5j63bWoAy3URl/+
 7RkPGehI0s4EXU7/JJ27jRvnGAE/A7IE3jpox7sR3OZvJLqzSL+1Q7ndmGt2cjx2ei7d
 6Cert7LU04UElFku2ITtmrZls7N92MHKiHiTSXfLU0Kej4CwI7DBJEGHp6VVa4N47NQ4
 h9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=26U6FjTddM6hMOoXqBgd+U1pVJTYKKyaMhCJDRRHP8Q=;
 b=soJm2aqZdt6ugRkrAvXjyL39sLDvOFWuBs9IuXW2pJOc/sffdBDy5AyoQqYWOg9bzZ
 LuPExODhlwUc60Ca8fWJaw7ETX9iBSbQgRmSeAl/zNW8Kgz51Aaev5Cjjw58uEkiRR5s
 OC7r7z20Cwf9g0voRz7dqsFwfBpzovcVHW0FAX1UuSkhLgJh9xauTZoXr3A0jMnROeEo
 l3yY+Gm5LTvAO7KF0JOmpNjuq6Ohs5Lp6jyr1njAaTnRxGl0UMNGvj1OnAl37fz5uEmt
 tNiF4wynwOcpT1HU+hLon9zWnnW4+x7Nbv1WDczpXus+dTCchkVwpdy74R4OsV55Fv0/
 fshQ==
X-Gm-Message-State: AOAM530NYpBfZstpD34wesw7I6ns77XFBzH5NAKivo+cHtdqecC8aEq0
 6H6vaS2TpCnPn2gJflsPYOwfewDfOBUKe38hItw=
X-Google-Smtp-Source: ABdhPJzvvh9nJybwAqQZ3Plz6hYwOeqb8EOKQDncj+ijFnW9f3YS+owxQLFlorcvAcurmC3OW/aa1UTE9sLkMURbu0Y=
X-Received: by 2002:a05:6000:1a87:b0:20c:687f:6d10 with SMTP id
 f7-20020a0560001a8700b0020c687f6d10mr23644213wry.574.1652300076914; Wed, 11
 May 2022 13:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220510070140.45407-1-tomeu.vizoso@collabora.com>
 <20220510141329.54414-1-tomeu.vizoso@collabora.com>
 <CAPM=9tzLR-wsLhg2ikGjoK06s-ju5XWa1rtPPiUpN=pwD1vgtA@mail.gmail.com>
 <CAHk-=wg8YgH1h3wrm9CtXff7rSewa+NE0Z5upb1GOE8XiTL9HA@mail.gmail.com>
 <CAF6AEGusO9XAqHNatJLgV+wpVoyyLg1vHtUsnSkAxJeV7n3WNg@mail.gmail.com>
 <CAHk-=wjbE0f2AGroB1Hy=fx2fh7cRpS0wNdB46Ybk14Mb0b5Jw@mail.gmail.com>
 <CAHk-=wjy4DY_ya8TBs9W2wLWHibBiHMQW2T43DQR1SGRkqD=gw@mail.gmail.com>
In-Reply-To: <CAHk-=wjy4DY_ya8TBs9W2wLWHibBiHMQW2T43DQR1SGRkqD=gw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 11 May 2022 13:14:24 -0700
Message-ID: <CAF6AEGtWCkOv4xpWz+ds9fSiB4_W4CV9exYyus1G_-crD2YFGg@mail.gmail.com>
Subject: Re: [Freedreno] Adding CI results to the kernel tree was Re: [RFC v2]
 drm/msm: Add initial ci/ subdirectory
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Sean Paul <sean@poorly.run>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 11, 2022 at 12:12 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, May 11, 2022 at 12:08 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > The kernel tree might have just the expected *failures* listed, if
> > there are any. Presumably the ci tree has to have the expected results
> > anyway, so what's the advantage of listing non-failures?
>
> .. put another way: I think a list of "we are aware that these
> currently fail" is quite reasonable for a development tree, maybe even
> with a comment in the commit that created them about why they
> currently fail.
>
> That also ends up being very nice if you fix a problem, and the fix
> commit might then remove the failure for the list, and that all makes
> perfect sense.
>
> But having just the raw output of "these are the expected CI results"
> that is being done and specified by some other tree entirely - that
> seems pointless and just noise to me. There's no actual reason to have
> that kind of noise - and update that kind of noise - that I really
> see.

Yeah, the only reason we have full results is that the current tool to
check for pass/fail of the entire CI job is 'diff' ;-)

It has the nice benefit of generating a patch for you to squash into
whatever commit to update the expectation files, I suppose.  But we
have something more clever on the mesa-ci side of things where we list
skips/flakes/expected-fails but not expected-passes.  To be fair, the
# of tests on the mesa side is something on the order of 750,000, I
don't expect to ever get close to that # on the kernel side.

BR,
-R

>
>                 Linus
