Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1E219DDFD
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 20:32:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6D96EC65;
	Fri,  3 Apr 2020 18:32:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934716EC65
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 18:32:50 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id g32so3914316pgb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 11:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FzPfvi3I/HmH3OyF3HqqnKY2AW2ORrTIHByXu3Bwni8=;
 b=lH7T1YpxFgux3nqxzeng0K2rPNoR2sfinwJlU96tTh5l3OmatqWHV0mZcgeAKR7Y8R
 Ft2/GO0QrOd97Ck5Gy4eLeCizaIt+4GFz2g6tiga3K2b/KmDsiF8TzYKIRIS5DAOGAYD
 Hw6cmIjC8Xe+R5c3yJwySVbvLY8MophPyx/jp4Tyq76vvxL0/f2d0XA+5TLj+klW9Umq
 7KA+v3ZLzuTC7tRsCW48A3WaU24znc9ilEvSu9kITrf3bsqQPibq+/QBmveNZX0venkL
 M1FtNDuE6OyTLizs8iBsv6acltEm58mJH5Em/HLgAeVPZhTM5nfLvkz3KBj2eygy7zGg
 hUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FzPfvi3I/HmH3OyF3HqqnKY2AW2ORrTIHByXu3Bwni8=;
 b=rOibaHVkal99S+/lqXOxxp0eqekzTD8kKg5b3cDA6uX10cvCOYSNIhj//ZEnikbBt0
 rw7xc5unyCdVfdz0gWqXGDvBtU40wydGFz5e69tLx7w//lvH793Ve7M2glpFN/a7QdNz
 W74nUU6d8RVnN+ZzYSM5grWwRrlijReSQJRBtObHKFhbRoMyvDLH3D+XdXvYJWMRs5i0
 MGY1ZgxROcDNtY08jzaXCFvBc7q0Wnqzq7YZCsvKHTGvGQrSSW998pYei+kAQQg7MyQ3
 GFB6Xcz+PXD1T1g0rhvddnUKGVseqY4sEeGFbehq+afvUuk6AYDn99vo1MmwQDm32igP
 TRIQ==
X-Gm-Message-State: AGi0PubHiIkeHKPMRmQfQKtQTbi0W5gJMfYSSsJuCiZdYysrY2I+sp+b
 cG0t47c/qHCAa80foegRTgy+efIr81cKtUsd4+w=
X-Google-Smtp-Source: APiQypIinwhumgGUt5DCeRKHr/ntgaMAqGInmnYQfu/+UNIt74kFm7mloe68bJzGZFPbOBTMbIZcwwsq2pTaxMlkK+E=
X-Received: by 2002:a63:1c1:: with SMTP id 184mr9915310pgb.203.1585938770173; 
 Fri, 03 Apr 2020 11:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200403091156.7814-1-sakari.ailus@linux.intel.com>
 <1105bfe5-88f1-040e-db40-54d7761747d5@rasmusvillemoes.dk>
 <b1e6213ba9f67da8278dd5c5f5e4def8ab927c83.camel@perches.com>
 <20200403193242.38611906@coco.lan>
 <2751400ae13b25d8259a8a9d7b36caf98ec2d367.camel@perches.com>
In-Reply-To: <2751400ae13b25d8259a8a9d7b36caf98ec2d367.camel@perches.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 3 Apr 2020 21:32:42 +0300
Message-ID: <CAHp75Vf+m_qzOwZb38dObLpKV2N27-J_7beqffhFVoSHaNV2vg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
To: Joe Perches <joe@perches.com>
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
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 3, 2020 at 8:54 PM Joe Perches <joe@perches.com> wrote:
> On Fri, 2020-04-03 at 19:32 +0200, Mauro Carvalho Chehab wrote:
> > Em Fri, 03 Apr 2020 09:56:42 -0700
> > Joe Perches <joe@perches.com> escreveu:

> It _might_ be useful to use a CONFIG_MEDIA_SUPPORT guard
> in lib/vsprintf for this.

No need. FourCC, if Sakari makes it more generic, can be used for
other purposes, e.g. printing component names from the chips (not
related to media at all).

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
