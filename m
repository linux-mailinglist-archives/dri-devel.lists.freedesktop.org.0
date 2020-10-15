Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C69928F54A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 16:53:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17EC16ED22;
	Thu, 15 Oct 2020 14:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B68156ED22
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 14:53:41 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id e2so4017082wme.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 07:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M+E7HunszzPZSotVNRgNcC7Nfy+vpMwTQ74FpdWH9JM=;
 b=sLA+aCJEXSwtHlBJJzmLua1KG22wStLlb7ofOKhxgeNdjBAzu596rx2IbIMwrnB3ps
 5bGPxHqmQZWqVkdslLY7Cam7xHB/fmD0W6JSSrbBTNpEPYHZfsGW/X9M1+dcxYX9w4au
 dfGvCiNpJ/DSZMDkeyANmvgoMk4tua9uZw6A5zCOsxzzvxJpXN+EI2DbfQIvgYW83yjZ
 om2L/YC8lsOWyvRJVJnmAG7EJKdTEJ92WfNEKuo0Ti0rfr+yeelhiKmQ8ZZ3q6Y8EXgs
 9EU4KjGn/ww708Jz8tBSf9dViHOQtgxS8ieiiuLnU2yqmXKwBwHAxhWxaHWyalymzah+
 gEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M+E7HunszzPZSotVNRgNcC7Nfy+vpMwTQ74FpdWH9JM=;
 b=YfJkXPbQOWyxY4LxHSEPRAEGTMvpzLimkdqRZFIgw5jdH+d7DdAvTbAYYClXyrgf6I
 mdja53ZW17tGYYFomt/rxV+SDWISlhUJalYCZyGNZEm+nRPa+DxnEe49Y3JetkatIoBG
 7K+Tr7h4Zq/7JmaLnrYpnJEGaQgoDJjuV9nNkEiaYmd19chQVhdiKbV3Px3xpMQxTthm
 4mT4TX1ddNwOQgY9cq/lt+2guZZzsDgNh9nXdvOW6mzEw2Zp9WvcaPnPc2c/+wK5NXCE
 kSY5bAaqu4XClPSzG9MPkYbm9Zp2GpXPrre/2tCDe5s1qt0NPVjEQYk5ogzSuW5prAsd
 nsTw==
X-Gm-Message-State: AOAM533CXljI5ZRITo4MQk5EnNT0NkfOKbZBwQ70CjXeaL22+1zTDgNC
 fukOa82yBcycnvNlnZcPlwXfOWWAJ2Ne36eXFmE=
X-Google-Smtp-Source: ABdhPJxSVlYADlSa2G7Ly6zx6sWDW2MUAiGZDD0DOatN/musxqLz9Ij2aDC59rAdSqszHKz9juBSxDcxeCvNNcJTVcE=
X-Received: by 2002:a1c:1d15:: with SMTP id d21mr4537548wmd.79.1602773620456; 
 Thu, 15 Oct 2020 07:53:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txyMmW1DWhS--SuYQu4qDK1GPzgHJwxbAfhHT=hUsPODA@mail.gmail.com>
 <20201015135932.GA277152@PWN>
In-Reply-To: <20201015135932.GA277152@PWN>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 Oct 2020 10:53:28 -0400
Message-ID: <CADnq5_PqhJFRDofb0pNsgrp7O8M_D9o3gz5_Nt8KL=0cgMWoKA@mail.gmail.com>
Subject: Re: [git pull] drm next pull for 5.10-rc1
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 15, 2020 at 9:59 AM Peilin Ye <yepeilin.cs@gmail.com> wrote:
>
> Hi all,
>
> On Thu, Oct 15, 2020 at 11:33:08AM +1000, Dave Airlie wrote:
> > Peilin Ye (1):
> >       drm/amdgpu: Prevent kernel-infoleak in amdgpu_info_ioctl()
>
> This patch is already in mainline:
>
> commit 543e8669ed9bfb30545fd52bc0e047ca4df7fb31
> Author: Peilin Ye <yepeilin.cs@gmail.com>
> Date:   Tue Jul 28 15:29:24 2020 -0400
>
>     drm/amdgpu: Prevent kernel-infoleak in amdgpu_info_ioctl()
>
> It has been applied to linux-next twice, for unknown reasons. Thank you!

The patch was already in drm-next, but since it was a bug fix it was
applied it to 5.9 as well.

Alex
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
