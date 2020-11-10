Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5803E2AD7F2
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 14:46:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C258089AC0;
	Tue, 10 Nov 2020 13:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE19189AC0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 13:46:32 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id m143so14349634oig.7
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 05:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KSBi0cYcjL14hFjS1VAuiIs1ge6Q0TvGqc9wyqKWxHU=;
 b=KxuHLtsg4+HcSlPWK50gx/phNUgDf2ThbSkQ0CvIKqVqDXDWiOfJFapkmTC+NbQ5JB
 K4Lhqy06jvz+cYx+9bOre8LpBa0uzPT6Y4W0Bw0/QCuBi6hCWzKPknd789z+5/2kENxe
 Bb9zMaOyo5IMlrKKcAqWka1ecPC9DB1wrlXgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KSBi0cYcjL14hFjS1VAuiIs1ge6Q0TvGqc9wyqKWxHU=;
 b=Dc3ZEV+gUs+9LXLOW7QK6KYZz0TLgV242vQs/gFhTq3do+gqCfU9Nk/F0YglSO4LTG
 dzXE/JIQEc4Y1ZZsWiwE2U9b9nVaBoyIF7r/poMzMPlNXherxrc22xtDJqGDcgu0Yv3/
 QkZdgXWmxvokaH9F7GzFcddUaHJCOo2CHyPthyMk49irK108EhO/i61RKbC1OjBoPPW1
 n5w5MfCFVurKMcggbmm2at+S90uVZ8PCExTEkx2jDOhTYcvtY4JV0kW98VI/AOCuH49s
 sHzq9n8NZImUqSp0HBR16rmT7TpvcoNod2n8m9m3EHiMHposoKyVg/P+8/2sguu8wnz/
 vDVQ==
X-Gm-Message-State: AOAM5313223kQ8a6wqUgkXuekFMy7srLJbgiESCdQw0i8/EZYuOSZn9S
 woV6w2TnODha5cCG1H+L0qrwMNfFoBFWlHa0uYhmbQ==
X-Google-Smtp-Source: ABdhPJyzdDByyzNbzdz/0OYKTLWy3l6toxa9onFy7mPNpemKtfLkC9dXi+UGbqU1YjK1W1TIvOZMjHKrFai3k7UKmkY=
X-Received: by 2002:aca:b141:: with SMTP id a62mr2579473oif.101.1605015991893; 
 Tue, 10 Nov 2020 05:46:31 -0800 (PST)
MIME-Version: 1.0
References: <c5563eeea36aae7bd72ea2e985bc610d585ece40.1604128639.git.yepeilin.cs@gmail.com>
 <20201106105058.GA2801856@kroah.com>
 <20201110124946.GF401619@phenom.ffwll.local>
 <20201110132445.GA2483842@PWN>
In-Reply-To: <20201110132445.GA2483842@PWN>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 10 Nov 2020 14:46:20 +0100
Message-ID: <CAKMK7uFiCTu9bz1uJqmCvwBSUK4XmuVyRf2C-U=zoArZMb0Pgg@mail.gmail.com>
Subject: Re: [PATCH 1/2] console: Remove dummy con_font_op() callback
 implementations
To: Peilin Ye <yepeilin.cs@gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 USB list <linux-usb@vger.kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 George Kennedy <george.kennedy@oracle.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 10, 2020 at 2:24 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
>
> On Tue, Nov 10, 2020 at 01:49:46PM +0100, Daniel Vetter wrote:
> > Peilin, can you pls resend this together with all the other pending
> > patches from you? I think that's better than me trying to cherry-pick the
> > bits we decided to keep from random places.
>
> Oh, are we doing an -rc3 backmerge soon? At the moment I can base these
> patches on neither drm-misc (due to the font_copy removal), nor mainline
> (due to the signedness issue in font_desc we've talked about), so I'm
> waiting for a backmerge to rebase everything properly. Sorry that I
> didn't mention earlier.

linux-next has all the trees, so you can always use that. And yes I'm
pushing the backmerge through, so in a few days at most I can pull in
all your patches. Meanwhile you can base your work of linux-next.

> > Greg, ok if I just pull these in through drm-misc-next? It's a pretty bad
> > hairball anyway and that avoids the tree coordination issues. Only thing
> > that might get in the way is the vt font_copy removal, but that's in -rc3
> > so easy to backmerge.
>
> I will rebase and send everything (including the font_copy
> garbage-collecting) in a v3 series after the backmerge. Thanks,

No need to be blocked on a backmerge, this is only needed for merging
the patches. Development should not be blocked like this.
-Daniel

>
> Peilin Ye
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
