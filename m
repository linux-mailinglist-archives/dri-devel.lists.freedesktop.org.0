Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AA52D5B27
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 14:04:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2299889F2D;
	Thu, 10 Dec 2020 13:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E73689F2D
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 13:04:14 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id c79so4008792pfc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 05:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=92Wh2LQtBXzTX4NkNdCAHhIqaKi2BFUPf+cbDuzZ2dM=;
 b=FBMPE2JaoBmrOk3y40Mrmo8b1Mvkmv7ogxXi/Fxml/kMrLZjoWb3g6V1eeHeaSuBf6
 lpP6yv9RhhduV0xpST+COmF6of3lXMi9gdBpiz16bzy7tscOk2EdY8Oa5EJll5qrMII7
 rMGmNJmTsIg+86qlY0EF9tEuPhIopz0sTxiYSrPJFA6wQi510LFJQxKGBH90CVlOjT6T
 8wisBOIVM8xpVLOUpvDc7PeJTu5hKYlpznhQVb0wdXzBuzeI9ZnTyEII/X+zoEuZTOmy
 e0q+nZlanVaFzW9lBFv9yM/QNrG+7Fhf+HYGlM59T7cJlFye0iospfsZZ+1JLXWmD0Sp
 t2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=92Wh2LQtBXzTX4NkNdCAHhIqaKi2BFUPf+cbDuzZ2dM=;
 b=AvTUFPIcyuluGNiCG7vhBS8Cm1Otw7pSGQ2oGnGeE430PC9I7Fe+pR4LkhMmNdY+2X
 PsAbJCgCGargiNTf5pGtZJkPyFp5WHC5krHP3TzpMkhMCYRO3Q8qfx0uK74oTvlC+xgR
 HOiWUyaf1mRLgSEvgYBDzlhCLwQuA5Sw86yxxq4YBTl0TPWXYu4pLZ+YRJH2wctB90zN
 Df+swp9Q3axXqXJBh1FFhfhN7cH8aECv54MzpDVnoPpmHz3mPrJoX3ZPMc9fv2MSzJ2i
 Fat4sfqy1cmWhbv9J/PKKuqfr3fs1uxiU9yAzhEF1KhWJPoPtM5z1YTPQSrIkuZGWzgB
 F1Rg==
X-Gm-Message-State: AOAM532VHtkcu05dqzFTkNcoUl2MHsVy2Fqb+jJVoI1iK/SDcgQEEcVq
 g8ltwBvCeeQQMzrCqTNtEdn4obgONqd5cxecGgw=
X-Google-Smtp-Source: ABdhPJx6pQh8UTUI6wTm+2am3BYMKhPGQWSY4Ulu5ZwL6w0nVgmYWZh7f4gx79f7WBvYQAFphvYasrY2UUg54Dkc8U8=
X-Received: by 2002:a17:90a:34cb:: with SMTP id
 m11mr7555981pjf.181.1607605454205; 
 Thu, 10 Dec 2020 05:04:14 -0800 (PST)
MIME-Version: 1.0
References: <20201113105441.1427-1-sakari.ailus@linux.intel.com>
 <X9Hdg3lJm+TZAQGX@alley>
In-Reply-To: <X9Hdg3lJm+TZAQGX@alley>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 10 Dec 2020 15:05:02 +0200
Message-ID: <CAHp75VcY_b7uaGWoEa1Y6YDk0MmmzC4hV2yx8zVT7J-fD67Hyg@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
To: Petr Mladek <pmladek@suse.com>
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
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
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

On Thu, Dec 10, 2020 at 2:16 PM Petr Mladek <pmladek@suse.com> wrote:
> On Fri 2020-11-13 12:54:41, Sakari Ailus wrote:
> > Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> > pixel formats denoted by fourccs. The fourcc encoding is the same for both
> > so the same implementation can be used.
> >
> > Suggested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>
> Andy, Rasmus,
>
> the last version looks fine to me. I am going to push it.
> Please, speak up if you are against it.

My concerns are:
- not so standard format of representation (why not to use
string_escape_mem() helper?) or is it?
- no compatibility with generic 4cc
  (I would rather have an additional specifier here for v4l2 cases.
OTOH generic %p4cc to me sounds like an equivalent to %4pEh (but we
have similar cases with MAC where %6ph is the same as %pM).

But I'm not insisting on them, consider it like just my 2 cents to the
discussion.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
