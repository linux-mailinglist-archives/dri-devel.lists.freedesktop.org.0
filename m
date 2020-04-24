Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2939D1B7FD6
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0667E6EB21;
	Fri, 24 Apr 2020 20:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 578806EB07
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 18:54:09 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id g13so12207831wrb.8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 11:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/fa1lIdPjeBael8cMEhc7IuBn0JvLE/K0WBOBkkjajE=;
 b=cDdCHgQ0oyn8ld2w4vSKA5KrJOwPIZ8HOdv39BGqbVr2KomUN3LesnYwcauNFI4nWU
 Ori/1jWxRqTF6Wsq4H4By9IgDciMJtkAgvZXcdcjqKIWWnq5zYAlJiSw+ouwEejpzjXQ
 pzCbNKNJTgX76ZN5xXZ4AwTNTdnfipNKtYNYLrfyJlDmgD7oG83NOj/ELbnYwafOnHM4
 HO3NmvkjkLE45jP3XqTzcD3iH0Hhlt2BtHYpb83WGugsxMhfxqMohaWem82n60TA1P2B
 KpK0bNwZU587W035JrYaKidCk2plpT1L7QYC/Qex5XJnIJiG1g9irlOZUvqJc9HDhQk0
 0+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/fa1lIdPjeBael8cMEhc7IuBn0JvLE/K0WBOBkkjajE=;
 b=gRWYgFjq89scNEAe0fVwjio2ABu9+ipngrWlfDVfpQ7ZB93HJ34hDlva9A/IYg/i0T
 hvQ4wni09zMhEPx88+AzmVWFX25GCMEkVhYCc8KfiQd4Wd926RJnAOzt/Zw8P93vUeg0
 xWfwNMWvVnKtUSv2DiLHgQxFGMSdhZGmXxnm0yGNPxlZtOlK3NJgUlsinUTKC6zVNCez
 qUd3cXoH0ZVO0qZs6h11x4wdqcelFeTgKaTuYHEF6yEdog7IaQsRJT0y6J71/8vicr2p
 U/ZUkHuGzev6wmIktP3D7w3M8edZQM0HrXncn14MN2i8gM3qThzmIp348aZsDNEjij0T
 7nhw==
X-Gm-Message-State: AGi0PuYFFTBI0H+Q4hgFbs0Km19V28ZENOIpKgaAsgydmPDXxEbSt0Q1
 EAuVhxiAjUvlFIsgi8tj/YUDah6ykqpHAmpgg1ReGQ==
X-Google-Smtp-Source: APiQypKKx0TRp2i5DhYOsD8tUAAQe75oUvoFuDNZwPO551ezSE2ihJzaD9gTXha+PHvYon9oiBQhBTYBKCvHgADtHl8=
X-Received: by 2002:a5d:6acc:: with SMTP id u12mr13737704wrw.198.1587754447542; 
 Fri, 24 Apr 2020 11:54:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200423223459.200858-1-pcc@google.com>
 <CACvgo50xnz9g8PE6+4FxHr=NJ4sWd1no4erFBJ2RY2msE12PYA@mail.gmail.com>
In-Reply-To: <CACvgo50xnz9g8PE6+4FxHr=NJ4sWd1no4erFBJ2RY2msE12PYA@mail.gmail.com>
From: Peter Collingbourne <pcc@google.com>
Date: Fri, 24 Apr 2020 11:53:55 -0700
Message-ID: <CAMn1gO5i-nBU_S-U896qrYYOUU6W4yD=KG8KTwijUOF62ts36g@mail.gmail.com>
Subject: Re: [PATCH] drm: pl111: enable render node
To: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailman-Approved-At: Fri, 24 Apr 2020 20:08:26 +0000
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 24, 2020 at 4:11 AM Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> On Thu, 23 Apr 2020 at 23:51, Peter Collingbourne <pcc@google.com> wrote:
> >
> > The render node is required by Android which does not support the legacy
> > drmAuth authentication process.
> >
> > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > ---
> >  drivers/gpu/drm/pl111/pl111_drv.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> The summary talks about drmAuth, yet exposes a render node. Even
> through there's no rendering engine in the HW, as mentioned by Eric.
>
> AFAICT the only way drmAuth is relevant with pl111 is when you want to
> export/import dma bufs.
> Although that is handled in core and the artificial DRM_AUTH
> restriction has been lifted with commit [1].
>
> -Emil
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.7-rc2&id=30a958526d2cc6df38347336a602479d048d92e7

Okay, most likely drmAuth is irrelevant here (I don't know much about
it to be honest; I know that Android uses render nodes, so I figured
that drmAuth must therefore be the thing that it doesn't use). Sorry
for the confusion. Here is a better explanation of why I needed this
change.

Android has a composer process that opens the primary node and uses
DRM_IOCTL_MODE_ATOMIC to switch between frame buffers, and a renderer
process (surfaceflinger) that opens the render node, prepares frame
buffers and sends them to the composer. One idea for adapting this
architecture to devices without render nodes is to have the renderer
process open the primary node instead. But this runs into a problem:
suppose that the renderer process starts before the composer process.
In this case, the kernel makes the renderer the DRM master, so the
composer can't change the frame buffer. Render nodes don't have this
problem because opening them doesn't affect the master.

I considered fixing this by having the composer issue
DRM_IOCTL_SET_MASTER, but this requires root privileges. If we require
drivers to provide render nodes and control access to the primary node
while opening up the render node, we can ensure that only authorized
processes can become the master without requiring them to be root.

Peter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
