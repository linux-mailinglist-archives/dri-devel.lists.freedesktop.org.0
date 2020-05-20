Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7B81DAA13
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 07:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E36E6E111;
	Wed, 20 May 2020 05:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75BBE6E111
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 05:47:10 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id l21so1841252eji.4
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 22:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q4D1mAShAC4l59B3K6Oolb/s/eKcWB+SWLNcnrtynW0=;
 b=ruhr6k9z4APz6IBGe7+e3gmK730Pz8G8TfI+wb+oKMRKT+nBmimz4oeB9NYv1JVPKQ
 QtLODp2tkygpCo6jVgHgfmpZqGfMnJYyb/jEjFInlm2OhEujZlRbJHJtaIsXAHERN18p
 aXvkdkT7t5/7IxlNjiKBy0Qbs/ftzhiy4cgwaSpJQXFHTne939SL9awDZOAPjA1+ky1l
 GUtnSLsET02/tSJsjZ3a6sWiEyKXAyPCpkpC2hSVug4CMfxjepaXIg2kBJ49cJw0E9Dq
 J4RNAzH/xeOrNNYFPWZBKYQFcemsovC1GPZ6YOXTQ6T/uGq8cPqXV2AsmPUy2cCRdN3Z
 6JAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q4D1mAShAC4l59B3K6Oolb/s/eKcWB+SWLNcnrtynW0=;
 b=etdROaTej9WvnbhG+crZ729NeUFo+m9gY1Pmvr6RcDMQS6Jmq7FhTKe6LC40C+3GPH
 v/osglX+qG9xklcc98MDlsfXIM1xpOxjlfaYeuDt0LspovjN1En44sUUrUZm3jSp47HW
 Gxichapyfrv2ShFHuOF0q9CSBogkQ9MZFAIQ8tSoOMH9Rx7f/x21OQ90BwgxsWPlfb2F
 XM4wQnB6/00pE7UTwCX6okGR01tUY2SbXcFPzAu+j8CobVyuTB88lYcV0KI/9zs/lp90
 TPhOlyZ2qvJBAPNTvu/y0kjPdePV2oxixbNXf8n10IN8HenQg8/waXY3V2g/pEcBi55a
 +SWg==
X-Gm-Message-State: AOAM5315DK3g9BCU1vbQxXB8ntUzoEZIgdvIYYDBqVmJ+Ep3A38Zmx/e
 +On9yv8ffCWMzskFlYvoEJr4a6RzEdUDqApgCpY=
X-Google-Smtp-Source: ABdhPJwOXJy6qXi34NYqjCgJGLajatJD/bp8vNU2KMWdyX4sCwMVHRzIiezVzgqnAaVmKZ0bfKUtt8I9oVrETSTnMPE=
X-Received: by 2002:a17:906:b843:: with SMTP id
 ga3mr2272412ejb.340.1589953629054; 
 Tue, 19 May 2020 22:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAAOTY_8tz9nNbCHFJhk9xX8fm9Jd8ETcdNCQfE31AOjZLpNKog@mail.gmail.com>
 <CAPM=9txm_fdy_+Kg=cdXe5SosbYBoXHtsDWYMFm2WQh1QtC_YQ@mail.gmail.com>
In-Reply-To: <CAPM=9txm_fdy_+Kg=cdXe5SosbYBoXHtsDWYMFm2WQh1QtC_YQ@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 20 May 2020 15:46:57 +1000
Message-ID: <CAPM=9tzqQ5G82mSACX5speUF2j-8vz7SrOcj7XLsKCjhe3GT6A@mail.gmail.com>
Subject: Re: [GIT PULL v2] mediatek drm next for 5.8
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, David Airlie <airlied@linux.ie>,
 Bernard Zhao <bernard@vivo.com>, YueHaibing <yuehaibing@huawei.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Anand K Mistry <amistry@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 20 May 2020 at 15:44, Dave Airlie <airlied@gmail.com> wrote:
>
> On Mon, 18 May 2020 at 10:06, Chun-Kuang Hu <chunkuang.hu@kernel.org> wrote:
> >
> > Hi, Dave & Daniel:
> >
> > This include dpi pin mode swap, config mipi_tx current and impedance,
> > and some fixup. I drop drm_bridge patches in this version.
> >
> > The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:
> >   Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)
> > are available in the Git repository at:
> >   https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git
> > tags/mediatek-drm-next-5.8
> > for you to fetch changes up to 007d274a017bb4e2ef7b922c2f54f40cf2073664:
>
> Did you edit this by hand or pass it through some mailserver that
> chewed it up, I had to reconstruct this pull from the above bits, I've
> no idea why it's so messed up in the first place.

and why does it contain an unexplained backmerge?

 Merge tag 'v5.7-next-drm-stable' of
ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux
into mediatek-drm-next

Please don't ever backmerge fixes into next pull, without a long
explaination or if you really need it ask us first,

Please resend this again cleaned up.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
