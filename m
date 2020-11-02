Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A872A2AFB
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 13:50:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158766E4E6;
	Mon,  2 Nov 2020 12:50:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D346E4E6
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 12:50:08 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id 9so14522230oir.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 04:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DVNWMcSPBU/g3zZ0d7Ty6wn9ZQIqa7Ev7ZHlpwXCmBQ=;
 b=B4Lj3toPyX/Xr2LDmsaOigbkPOiDNU+v6+7DlkkVC0IQKtYIqNMjnptbFaAN8bIZib
 hvlVficvO+0hgZZ0WgiEPMLRKdoRFyLig9NZJSWHcrTcI6yOklbgKea08JkYcdR4Zyuc
 myNEgsjbAIApvPmYeP1Oig3qsomIGg0+t+RuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DVNWMcSPBU/g3zZ0d7Ty6wn9ZQIqa7Ev7ZHlpwXCmBQ=;
 b=AM9v+8xn6IkOIa8OokjCN/F3TxaY5oQHZPbEOzSOo3HeFZUhZ5sqt9ob5VHhi55/2f
 hv3OInbXFZJ/sf2APTtl8OKGLkT0ZURmYAHOF2V/efrX/NxayQ2XqO2w2ySV6dMUrEdq
 lx2cE9dNx7bs5GXTnmsFQTT5ad9Wps6dPuggrNssZls07oYyJTSAH5RVD9v4RR6vL0oW
 6Ju1d/u2pFE7EVNLSWptRETps0KaIZHM4U3CiecjD1COgocOrJiOQozde4F5fIquiAt1
 QJCsRclD3QgRAYAQIfW8IpKcSLVTI1OJ89UdVMaL7vozBKbeG5bKKp50uAZKhWrBi1iQ
 Wpwg==
X-Gm-Message-State: AOAM532RQxUfcBlOYvfHLmjwgHQkYCFXJ4xTIMixm+hiDQVz7mopMx0h
 i+T5Ilas5aJr6ynolLrGDavAdfq969/PbtGEeOcSCQ==
X-Google-Smtp-Source: ABdhPJzqDVhbufH+N07+JlgKSDoNc0BnU9IRqV0qCWdx/pKOKeFQ7AP7HSoS48uIaVTvrHgcFWkaQ4RdR8eNvCRpwx0=
X-Received: by 2002:aca:cc01:: with SMTP id c1mr10114388oig.128.1604321407714; 
 Mon, 02 Nov 2020 04:50:07 -0800 (PST)
MIME-Version: 1.0
References: <20201102110806.429002-1-maxime@cerno.tech>
 <20201102111853.ltghqv3dh3th4v7e@gilmour.lan>
In-Reply-To: <20201102111853.ltghqv3dh3th4v7e@gilmour.lan>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 2 Nov 2020 13:49:56 +0100
Message-ID: <CAKMK7uHeCzj8A1YzOVhaOzaEOb-vReuLq-B-61faeBwQLZh5rQ@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/ttm: Add limits.h
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 2, 2020 at 12:18 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Mon, Nov 02, 2020 at 12:08:06PM +0100, Maxime Ripard wrote:
> > It seems that a recent commit broke the nouveau compilation when swiotlb is
> > disabled (which is the case on our ARM defconfig for example).
> >
> > Daniel says
> >
> > """
> > Since the proper fix is maybe stuck in the usual "drm abuses swiotlb
> > internals" bikeshed, maybe best if we push a fix to including limits.h
> > in nouveau and call it done?
> > """
> >
> > So let's go down the simplest path to fix our build, and goes back to it
> > later if needed.
> >
> > Link: https://patchwork.freedesktop.org/patch/397835/
> > Fixes: 4dbafbd30aef ("drm/nouveu: fix swiotlb include")
> > Acked-by: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> Note that I misunderstood what Daniel was saying on IRC and ended up
> pushing that patch in drm-misc-next. We can revert it if needed.

Yeah I guess I shouldn't ack patches without seeing the commit message
first  and all that :-) Code imo still fine, other bits maybe
suboptimal:
- Even in emergency for reverts or so, patch should still go to the
m-l, as fyi. That's why dim checks for the Link: tag, which should
point at that submission, not something else.
- The Link: tag here should have been a References: or so, since
that's for related discussions and other material.
- sfr's mail would have been good as a References: too, plus including
his explanation for what's going on
- Also maybe some notes why we're rushing here, since there's a few
patches stuck behind the backmerge.
- Reported-by: credits for sfr would have been nice.

Anyway, it's done, so that's all for next time around.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
