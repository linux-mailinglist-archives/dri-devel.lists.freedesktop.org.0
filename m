Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ADF1BF17F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 09:33:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149026EB69;
	Thu, 30 Apr 2020 07:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA0A6E081
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 16:51:34 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x18so3403956wrq.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 09:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QpzVcjPQpM+7hEvK66/9HL8xIshwI+2fiuPf9CzkDHQ=;
 b=MnXdWNkAMa3Dagzk5UFixsSFbvB8pSxzLAzNwRgPfWdd9s6mEujME15H2vMtQJXV+T
 rgukw5t3F2LeNaynqnc7n0LPaf3JZuasebnvUP9Ko0MjCPTWSheLRDa+U30XBgpg0xhL
 cY+k4QN3KoDhAWLQ+AphYwEszfiD+0rwt5gKS6aj4SDe1crc+w5SBgJYOkBFBlVZJZ3q
 dqWXIBHrYUfKDuuP8hASWHmdSrnrSDmnf+RMHEBY9Xea6vPkjQdTnMJRj0WUza+Q7v7g
 L7F9IemDes0G6EBqBplDO+J3PY3U+te4NyEa9mMWOX8ouHNvwu2z9VhTKBmgx/Vk0BZx
 KxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QpzVcjPQpM+7hEvK66/9HL8xIshwI+2fiuPf9CzkDHQ=;
 b=SOdnjgObx6xEIWL64+dHpW4MFliJPhKYLEyoOg5JCowOh/oTN0Q/xkkUb51ywFYr4Z
 iR/exCCDo9ZtIrza7WgEiOgEFWwp4yRvZBGXcbbfCty4Z1SgfvrI5EWAlKb7uUvO67Ne
 gMyLs7TkDtNIPQn5w113jMmMv+M2Hrj3ojFPDk+HwjBY2fttSmcAvn1jCnQIH//rYJt+
 JSB3IVuByPJHPZWjRW8p6cmhBzStEXQR8OvNwYxg84H2/EbacSVE3dFBUQ7LDCNcICo8
 68SV3dorv/Us14Z1aEByNq3zjxOC0ojOHpUOhgtbrYd6GURk0axHYB+1bWgLa9WQyrj6
 aJaQ==
X-Gm-Message-State: AGi0PuYjZSDisb2EsmyF8z49+1ru+YNJc3Mghbz15Jxe8NEEIliGQhDR
 KpKHygEeZK3T90k2ywNd79ZBxz54m0KRVrbq3RXcrg==
X-Google-Smtp-Source: APiQypLbe5TS5W5eYhTnvzRLbSU1YgABdnDl9Y3SVqzslXA1+E2q363znlPRZAj6KLnX9lq4kSk+PGKmLgtZWGPkzs0=
X-Received: by 2002:adf:e445:: with SMTP id t5mr39305820wrm.223.1588179092845; 
 Wed, 29 Apr 2020 09:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAMn1gO4NsAoBUN4VFntB+pZK=cVCmwxBGUyipLPYYWFvpH1Z+A@mail.gmail.com>
 <20200427200513.36328-1-pcc@google.com>
 <20200429161650.65m37srq3sucbsit@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20200429161650.65m37srq3sucbsit@DESKTOP-E1NTVVP.localdomain>
From: Peter Collingbourne <pcc@google.com>
Date: Wed, 29 Apr 2020 09:51:19 -0700
Message-ID: <CAMn1gO4ozMZQk3jN7iNGH5Cq-3jQd=d4vgVj-Zr35u3YRsMG0Q@mail.gmail.com>
Subject: Re: [PATCH] drm: enable render nodes wherever buffer sharing is
 supported
To: Brian Starkey <brian.starkey@arm.com>
X-Mailman-Approved-At: Thu, 30 Apr 2020 07:31:56 +0000
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
Cc: Liviu Dudau <Liviu.Dudau@arm.com>, nd@arm.com,
 Emil Velikov <emil.l.velikov@gmail.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 29, 2020 at 9:17 AM Brian Starkey <brian.starkey@arm.com> wrote:
>
> Hi Peter,
>
> On Mon, Apr 27, 2020 at 01:05:13PM -0700, Peter Collingbourne wrote:
> > Render nodes are not just useful for devices supporting GPU hardware
> > acceleration. Even on devices that only support dumb frame buffers,
> > they are useful in situations where composition (using software
> > rasterization) and KMS are done in different processes with buffer
> > sharing being used to send frame buffers between them. This is the
> > situation on Android, where surfaceflinger is the compositor and the
> > composer HAL uses KMS to display the buffers. Thus it is beneficial
> > to expose render nodes on all devices that support buffer sharing.
>
> If I understand your problem right, the issue is that you're getting
> your buffers in minigbm via pl111, which means you want a render node
> just for buffer allocation? Then HWComposer will import those on the
> primary node for displaying.

Correct.

> I'm not at all familiar with how minigbm sits in Android, but on our
> platforms where the Display and GPU devices are different, we allocate
> via ion in Gralloc, and import those into both the GPU and Display.
> I think that should work on pl111 too - if you can allocate contiguous
> memory from ion (or dma-buf heaps) in minigbm, then you don't need the
> render node.

Those contiguous memory regions would not necessarily be compatible
with the pl111 device as far as I know -- according to [1], on some
devices, a designated memory region must be used for the framebuffer
and therefore the memory region allocated in CMA would not be
compatible. That being said, FVP doesn't appear to be one of those
devices, so in principle that might work for FVP (provided that the
user provides a sufficiently large cma=X kernel command line
argument), but not for those other devices.

Peter

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/display/arm%2Cpl11x.txt
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
