Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C7C1D6CFA
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 22:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E18B489CF3;
	Sun, 17 May 2020 20:52:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A74E89CF3
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 20:52:53 +0000 (UTC)
Received: by mail-vk1-xa43.google.com with SMTP id z3so1908994vka.10
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 13:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kRpHuRKc3Bl5TABsYSL7dPRXInYL17v1wVRbBgtX7NU=;
 b=BHa30mzp37Lx79gKYaUpW35MfR/+nyf53/vZfb5HUDKCP+7TubeNHZQ1DYE/8kYYbn
 jEzI8UdvK58BUbyWQOKQEf/UJOkvX2dQA3eOITt4CKH8Z5cJ7UILc9Vvj3fO0yh4vWEg
 3x97oavd04iRx/wYwoNap1FdYnqdKNsI6C0xtr8QjajzLqGzEb793iL99VwfdWu6XTEa
 qstMMN+z9D5pwTONtStgS/sHYzMx0w0zv1ToEKy7mZjWuNtHD1YKBt+qgegXJ1GKq3Rd
 ZxFAw376tZwcO24fv/PuyU/MiOMGhFcrkZUJmJOMjBs3noHZ/tFm0BH4Trz0THJHhNRb
 PPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kRpHuRKc3Bl5TABsYSL7dPRXInYL17v1wVRbBgtX7NU=;
 b=oChe0UpHKgzA6cTWjxV0PFm/b7b+StD7q9tupe/ToqN8CfqBGu+xLBexk/SOQtogVs
 IBnU2cRZJPVa8DSjwkopOBP4TN+fhjhI5igh10XRIbdCFj4PoderJd0r1Lf+wpijmE6W
 aUxzE/DIszpUYBW38AXvGlp0gWJnfL1WCP9OyzHRtUbNNxPNCpjce2jTUrE9z+WnwN0s
 TuWr6BrkDXtyyzycXXZSB9HwQrbgfq7b47sVVJFsXgbG8/pXAfqudoLYRBcb+PLzMFuD
 wavBu5M1xHRw2nNUW3EHYnlZVkwNhyW5xo3rmWJrwDcc0giKW2TxGHLBNnzuR14GkY3A
 30xA==
X-Gm-Message-State: AOAM531HvnvlcGihhiF5KAe4Du65Ljgr9r1/jEiJbeQyWvOEtVdTFnFY
 ZEmJemwYrIWmyp3kzzNxa2MwVk9sRNiNShneRWw=
X-Google-Smtp-Source: ABdhPJxxoulbFHKkk5sAmi3frB7/d9hBxGQD8EXWebg6haLP3CNxcYOexxdkVTIOKDudrgSrCIxG+52osvlzN3ensV0=
X-Received: by 2002:a1f:ac0e:: with SMTP id v14mr9168388vke.28.1589748772323; 
 Sun, 17 May 2020 13:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200316163907.13709-1-wsa+renesas@sang-engineering.com>
 <20200512162837.GJ13516@ninjato>
 <CACvgo526Ut+rpi9TXP4jZKPZmRUbnh8U-ETj7VTAz9ykut5Uig@mail.gmail.com>
In-Reply-To: <CACvgo526Ut+rpi9TXP4jZKPZmRUbnh8U-ETj7VTAz9ykut5Uig@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Sun, 17 May 2020 21:50:03 +0100
Message-ID: <CACvgo51TTsggO4r3C5rsmgJP6w41twD4ngX6M5QxhyH7Jj4v0Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm: encoder_slave: some updates
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
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
Cc: linux-renesas-soc@vger.kernel.org, Dave Airlie <airlied@redhat.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 May 2020 at 10:35, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> Hi Wolfram,
>
> On Wed, 13 May 2020 at 10:10, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> >
> > On Mon, Mar 16, 2020 at 05:39:05PM +0100, Wolfram Sang wrote:
> > > While converting I2C users to new APIs, I found a refcounting problem in
> > > the encoder_slave implementation. This series fixes it and converts to
> > > the new API.
> > >
> > > Based on linux-next and only build tested.
> > >
> > > Wolfram Sang (2):
> > >   drm: encoder_slave: fix refcouting error for modules
> > >   drm: encoder_slave: use new I2C API
> > >
> > >  drivers/gpu/drm/drm_encoder_slave.c | 15 +++++----------
> > >  1 file changed, 5 insertions(+), 10 deletions(-)
> >
> > Is there someone I should add to the CC list maybe?
> >
> The series is:
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>
> Unless someone beats me to it, I'll commit them to drm-misc later today.
>
And after a short delay, pushed to drm-misc-next.
Thanks for the patches Wolfram.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
