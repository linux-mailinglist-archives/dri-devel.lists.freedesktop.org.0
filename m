Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAAE494C8F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 12:12:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DA610E40C;
	Thu, 20 Jan 2022 11:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC0A210E40C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 11:12:40 +0000 (UTC)
Received: by mail-ua1-x929.google.com with SMTP id y4so10186789uad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 03:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=kMjIpt1c5UKX7PMhTqHhaYPV9fI4F7FYowL5GOMYs44=;
 b=tvhKKbhfRUYInyIiGIV5u/96f/Zn6BZyUGMKxGENe8EXBb4F2V7wMUCXY5jgTU0YIr
 KGZiRSDEIYO7pVT7CnUvWo2FhVG83bdHOaLv5KPi+LqPCXz4hiUiqNfv+zYRCjVbUqu6
 tUEqPEdRxAaknOe1O78vlXUR483l0JYosJNUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=kMjIpt1c5UKX7PMhTqHhaYPV9fI4F7FYowL5GOMYs44=;
 b=SZGoukvVkEUXRU3LTb7k/qeyMrH6sVhDAK24ArgLMMuIaj1Fa32pYzCzmqpV0Nz48m
 j5U5MfEHnRlVK/0/sS/TeeZCY8Pgq5cAtpVdqRGhmC+u0UlN+pUgoQmKmy3ZHEV/WAIN
 UG3EfzNHLdaEJ8bf1x2HAKuuENyrL7cSu7m8Gh/pL54KgriaB/BqtxdeqXwL6AGflBcX
 DzdKG3UJXMruTikisnMArf1TVqg7MNhXLVtVyoJqX6SGnz17Yi9Hsim6OhY1HpzQIHbw
 wifyg4Hl+Knx8NmF13DidPGg9wC9xoxXagN/Fv5F3QgBKzH9+bWYBNNjFwTAT/DjV7KU
 7lYw==
X-Gm-Message-State: AOAM530IuakfOg0uoFGcco/4zk2IoMRQRnjjlIPzo2BiDcTYTxq1reMp
 ltHBjrxieKmCiIiKfWHn9xLDpmF3ZJKuvOlcZhY9yQ==
X-Google-Smtp-Source: ABdhPJxPvd0PThfv03SEpUww64Zb4UBGpIXRyKp92BrZVZyTlM5MOR6vAhcFdFjhNi7v17pf6fH0w6ae5M564YvMyP0=
X-Received: by 2002:ab0:6f90:: with SMTP id f16mr6800254uav.113.1642677159660; 
 Thu, 20 Jan 2022 03:12:39 -0800 (PST)
MIME-Version: 1.0
References: <CAFr9PXnig9YfnwSzMg5UPm3UtAsEAQT_xVheBbLppiU45mc_QQ@mail.gmail.com>
 <Yeg8mi0S2ACy9q8O@phenom.ffwll.local>
In-Reply-To: <Yeg8mi0S2ACy9q8O@phenom.ffwll.local>
From: Daniel Palmer <daniel@0x0f.com>
Date: Thu, 20 Jan 2022 20:15:40 +0900
Message-ID: <CAFr9PXkUwfyZ9yJgNYHX5_jo_SFfDU9wKA3Ldf+hbVL23faqKQ@mail.gmail.com>
Subject: Re: [RFC] How to add hardware rotation,
 scaling etc to a DRM/KMS driver
To: Daniel Palmer <daniel@0x0f.com>, Hans de Goede <j.w.r.degoede@gmail.com>, 
 dri-devel@lists.freedesktop.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Thu, 20 Jan 2022 at 01:30, Daniel Vetter <daniel@ffwll.ch> wrote:
> > I got the feeling that maybe I should just provide an interface to the
> > blitter from userspace and userspace should be doing the rotation. I'd
> > like to do it in the kernel so stuff like SDL1 apps just work but
> > maybe that isn't possible?
>
> panel orientation property is for that stuff:
> fbcon will head this and rotate in sw,

This is working. On boot I get Tux rotated correctly etc.

> as should any competent compositor
> in userspace (but some might not, it depends).

That's the problem I guess. I don't have one. SDL1 apps like prboom
use the fbdev emulation as-is so they render upside down[0].
I have 16MB of local storage and 128MB of RAM so I don't think I'll
manage to get the standard userland bits onto it.

I wanted to do the rotation in the kernel so I didn't have to hack up SDL1.

Cheers,

Daniel

0 - https://twitter.com/linux_chenxing/status/1479801511274491909
