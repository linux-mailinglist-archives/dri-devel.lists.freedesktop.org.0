Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BCF1D4AA2
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 12:14:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638836EC56;
	Fri, 15 May 2020 10:14:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B55D6EC56
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 10:14:44 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id z3so430381vka.10
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 03:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EZ6OfaKWMNYLsq/vPPXTECTxhgHBG6tG/ll2X5nosuY=;
 b=CMChNp0FChPCbFs3F+MPjQ8mCacNZi+APaqwCEJMony0vvfP4fzBL/plYi1PTDsgjK
 3QT3ITHBA23ywLRg/M8uhZvZvgMqYwefgNad/vATXqp5pZCAy5KnBj2Lnm47dp+fm07g
 luF6VNtLHrIuV7oxuc2jQ2uEQe2HUEvZOr72HWZhEgMhQVS6Bb+jTOtbmSis2Q9HU4km
 Rw+76lFSY3QaXJQmOnNFPR7Ya4yfLqY9yugsS076acxRvt1+K6DjB6LbVYs0KpcOtdd8
 k2Ke3achgeQ0U5rXPq3LNHZ6+oXMPBlKrgMuI0+qhdU3YD3/GsU9mbdxp1MmB+3gVpQz
 7Rbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EZ6OfaKWMNYLsq/vPPXTECTxhgHBG6tG/ll2X5nosuY=;
 b=oPcBC2NKceYf9LJ2XnFGKP2DX3tJ2fK1l/Z+oARdjlxwjEBP7DEIgv4tJLZ1wMvG6e
 SBTspTX46U/Zq7alvNy3utGl2BT3qet3tEbjzBSMERAM/RPAXuGlkAG/b4eGdqb21+Zu
 cHYPkHjM3wMsHY5VyF1+mjNwQB8Mmk5aMQbe+ChcToBWCQp9CIwGufUnVloFwR478t0Z
 3PzTpSvLfRbAXRDq9tWehuvjCBAEIiakJ1UFuZQHkl2qa/Z9zro6hUr2uNJNDx7OCMEz
 plojQYzcBqogl1MSAxlTrcjpKS8zyKK+725OkFiSVy0QUh59Mo4KgU3n3JrZtruWAP7q
 ecvA==
X-Gm-Message-State: AOAM532QB8z1lESehTurgQ+AGLqB7OSV7KFYL1wsSC4AFc4DQ4t8e0bl
 lHMVZEDz3licbpH/wVsMfWJkeCGa3QKwy0N7d0vv4w==
X-Google-Smtp-Source: ABdhPJwySImY4STiLUyhyA0RYWBwnXcjZprr971z+NO8BgHmDKAA0Y4ycqtqtV/2t6BMdwfeII55n5dCjcYyTEMlNyk=
X-Received: by 2002:a1f:2f91:: with SMTP id v139mr2005615vkv.22.1589537682435; 
 Fri, 15 May 2020 03:14:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
 <20200513214351.2138580-10-emil.l.velikov@gmail.com>
 <CAJZ5v0iM5H03=RTtk2sZtUzaW0XJ+AaX1M00C8QjvaNz0ZE3bQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0iM5H03=RTtk2sZtUzaW0XJ+AaX1M00C8QjvaNz0ZE3bQ@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 15 May 2020 11:11:57 +0100
Message-ID: <CACvgo52myKJ+3s8pYPnqNBxWqg6bCHQXqGJrLwmrSvocuqU=pg@mail.gmail.com>
Subject: Re: [PATCH 10/11] kernel/power: constify sysrq_key_op
To: "Rafael J. Wysocki" <rafael@kernel.org>
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
Cc: Len Brown <len.brown@intel.com>, Linux PM <linux-pm@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 May 2020 at 12:21, Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Wed, May 13, 2020 at 11:46 PM Emil Velikov <emil.l.velikov@gmail.com> wrote:
> >
> > With earlier commits, the API no longer discards the const-ness of the
> > sysrq_key_op. As such we can add the notation.
> >
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Jiri Slaby <jslaby@suse.com>
> > Cc: linux-kernel@vger.kernel.org
> > Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
> > Cc: Len Brown <len.brown@intel.com>
> > Cc: linux-pm@vger.kernel.org
> > Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>
Thanks

> and I'm assuming that this is going to be applied along with the rest
> of the series.
>
I believe so, although I have not heard anything from the TTY maintainers yet.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
