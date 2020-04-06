Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D31C19F3C5
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 12:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067E389D4B;
	Mon,  6 Apr 2020 10:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912C689D4B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 10:44:38 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id a24so7322908pfc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Apr 2020 03:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xpsSm03PNhhxTrDlHzFJiusW57aSpekqQTtY3BOaBJM=;
 b=UAAKjx9GNKdrzDHCWGjcfG41gX/Cbvy7YW/ZDTHOCFMSnTDLchGMzaZssW3ScDGV/Z
 7xchbKVwU0h/QPo1jv8RAxe5RxVcjUPD53V97HNIiPvht7dfc+zCDKwkcES05y/PEtcJ
 rAg9Ae8Xo+ud9jnCybuOAMh4CNwue3K2HYxbG27mWvt9yKfXUcPcaS6xcjuzQ8ulKDvC
 KIyQgQAo+c3WbeESfa6Vq+e6Apnszf/AWiZRxO5elgadEPGV4l3sV10OmnSeWfDDmNSY
 Em2V4dRFPNjfWO03MliMwvxHo6lpw6Vnq/29y40ardOztBxJlJp5++zzfo/YXPNqEom1
 KrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xpsSm03PNhhxTrDlHzFJiusW57aSpekqQTtY3BOaBJM=;
 b=ApS1fS32phhEmaqLRLUMPupMmjNchXkSl5CM1zcy2YezMOqstx6Ef720LyWuNSKSLd
 X1e9JmSso9HShu+zxA57c9KdFZlVT33Ycyjpe/lkISXyyMrW/2pNO+Xqbp4L3SC5XrJ3
 KRk0RRScHttxgSqcGrlfWuuf7voygudsk8BZ7GOWxOJ/Wr7gwLv8vOJPELccliy9DpfS
 l9ODvBWpzTJF5Z6kNU8t4TjEl4jgjosuhOaUrddS5qSDLAjKYUTiJ9gc+KtJCuz0hQSB
 1zEVEOIjEtGiBbcxB4B7Yv6dw28nTWX+uwrYNTEWQDSHyyaAPYfQGq9NJ4kO7Qp9UHoj
 5PSA==
X-Gm-Message-State: AGi0PuZKuIGT9V7UmZU803/gvWk4Aq8nrNMXCrjbWHeZAekBlo0qpsSa
 E2Ir91fl5TyWABgmP07z1tZSrLPM1gp+cz/IYno=
X-Google-Smtp-Source: APiQypLVSCmp8W0PDDGXSdgvI9VwsRklH3NMg3fhaSk4LJ3JUwswPj1zXOnxcgmDKNT+oXenNn+9hpYhOP+QXuhOQUU=
X-Received: by 2002:a05:6a00:2b4:: with SMTP id
 q20mr21324803pfs.36.1586169878219; 
 Mon, 06 Apr 2020 03:44:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200403091156.7814-1-sakari.ailus@linux.intel.com>
 <1105bfe5-88f1-040e-db40-54d7761747d5@rasmusvillemoes.dk>
 <b1e6213ba9f67da8278dd5c5f5e4def8ab927c83.camel@perches.com>
 <20200403193242.38611906@coco.lan>
 <2751400ae13b25d8259a8a9d7b36caf98ec2d367.camel@perches.com>
 <CAHp75Vf+m_qzOwZb38dObLpKV2N27-J_7beqffhFVoSHaNV2vg@mail.gmail.com>
 <20200406094645.5f96457a@coco.lan>
In-Reply-To: <20200406094645.5f96457a@coco.lan>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 6 Apr 2020 13:44:30 +0300
Message-ID: <CAHp75Vdp+PXaJxrm99DgpJSS+6PcD1FfAfE3U1auFr2oxk5-tA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
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
Cc: Petr Mladek <pmladek@suse.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Joe Perches <joe@perches.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 6, 2020 at 10:46 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
> Em Fri, 3 Apr 2020 21:32:42 +0300
> Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:
> > On Fri, Apr 3, 2020 at 8:54 PM Joe Perches <joe@perches.com> wrote:
> > > On Fri, 2020-04-03 at 19:32 +0200, Mauro Carvalho Chehab wrote:
> > > > Em Fri, 03 Apr 2020 09:56:42 -0700
> > > > Joe Perches <joe@perches.com> escreveu:
> >
> > > It _might_ be useful to use a CONFIG_MEDIA_SUPPORT guard
> > > in lib/vsprintf for this.
> >
> > No need. FourCC, if Sakari makes it more generic, can be used for
> > other purposes, e.g. printing component names from the chips (not
> > related to media at all).
> >
>
> Hmm... not 100% sure about what you're meaning with "component names".

4cc is pretty much wide standard, media is just one of (famous) users of it.

As I emphasized the example I referring to has nothing to do with media.

Now, I have already two examples:
- component name inside hardware register (used by Synopsys DesignWare)
- CSRT table in ACPI uses this code for vendor ID.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
