Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABB4241D0B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 17:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF866E575;
	Tue, 11 Aug 2020 15:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CCE86E575
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 15:18:39 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id l204so12565241oib.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 08:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PRHFf+1V4zs1Z1mpFWt+/3W5MvoHt6dY6emjYsF2JRo=;
 b=NQYFWaCoc5YUoeGNnjlE0qIBLYA7+Kt7geVuoqISdqg7uHGa7E1ky8EHhlZwzOg1pG
 4Y1BrX0r23qbH06IIIf6TH05AuKDIUbOvHWoMBxIJnx1Se5BGfZ7/Sn3uKHy0+DKDgKi
 Rt5RROtOKHE5FQ+KYx1/9+8dODgdSJaV/Ya3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PRHFf+1V4zs1Z1mpFWt+/3W5MvoHt6dY6emjYsF2JRo=;
 b=hXzc/tknWi1U5PgNR9629qLJgTVac6YZ//tRXrFJMHp8nCruYe38jro9ctLJM9iBqX
 jC33NrHCFPCOZGGCLZyEHGTbS4Wl3cvKXjcaC6zdMksPx5Vcfm/Dx4W7pbKICwEvZ7MM
 UAoUmjkcbK/71gZFfPucfcJ+Nc9qxxgThg89n29pyXERbjuYK450vMHz5D53LVZwy7ww
 mD+aT5s80Y1xBm8UKSZMmV4SQ/guN6uBigMwM7ldffZ/ZH2wDibKWj25qhRJ6OvZS/Qh
 fqSuXoI8FVO7CjuiuQyllOMZna4E/eysJECLrvHJIhfR4Smo7798OxSihmAee4rN2NDE
 lOlA==
X-Gm-Message-State: AOAM5327gRnIcZrk9/CljCSLd4GmCO9+G43Qm7TdAPDezFM+S81y/ZF8
 MXdk7JNW29Vne+1OnA5f1mrq6CFFYnaXYaKES8K3ERQA
X-Google-Smtp-Source: ABdhPJyeGGiG1Ew5w0WgMsU6OA6Qa74bcQJ/Ai6znmls3Fh7l3rGTJm0jJiQBzDdjkcdnXJ3uk2wYJlontmF+ezZXRk=
X-Received: by 2002:aca:88a:: with SMTP id 132mr3328060oii.101.1597159026695; 
 Tue, 11 Aug 2020 08:17:06 -0700 (PDT)
MIME-Version: 1.0
References: <f25a430a491c46a9bacef9f62c3c2129@systecnet.com>
In-Reply-To: <f25a430a491c46a9bacef9f62c3c2129@systecnet.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 11 Aug 2020 17:16:55 +0200
Message-ID: <CAKMK7uFaAMmnLOEdm29fKmVpK4i=HnCLDGhk8sTu2KAhhn3cMQ@mail.gmail.com>
Subject: Re: imx-drm: master bind failed: -517 with parallel_display (on
 i.MX6DL)
To: Stefan Birkholz <Birkholz@systecnet.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 11, 2020 at 5:07 PM Stefan Birkholz <Birkholz@systecnet.com> wrote:
>
> Hello,
>
> we are using the mainline kernel (currently on 4.19.128) successfully on an i.MX6DL-based system, but when we try to upgrade to any more recent kernel (>5.1) the display output stops working (screen is blank, backlight works).
>
> The relevant entries from the kernel log seem to be:
> [    8.954942] imx-drm display-subsystem: bound imx-ipuv3-crtc.3 (ops imx_drm_exit [imxdrm])
> [    9.028406] imx-drm display-subsystem: failed to bind disp0 (ops imx_pd_ops [parallel_display]): -517
> [    9.037873] imx-drm display-subsystem: master bind failed: -517
>
> (I can reproduce those by un-/reloading the parallel-display.ko module.)
>
> On a working 4.19.128 the corresponding entries are:
> [    8.879050] imx-drm display-subsystem: bound imx-ipuv3-crtc.3 (ops imx_drm_exit [imxdrm])
> [    8.887361] imx-drm display-subsystem: bound disp0 (ops imx_pd_ops [parallel_display])
> [    9.131288] imx-drm display-subsystem: fb0: DRM emulated frame buffer device
> [    9.139618] [drm] Initialized imx-drm 1.0.0 20120507 for display-subsystem on minor 2
>
> Via git bisection I found the last "good" commit at [044175a06706d516aa42874bb44dbbfc3c4d20eb], and the next "bad" commit at [228cd2dba27cee9956c1af97e6445be056881e41].

There's over 8k commits in that range, what's the reason git bisect
didn't continue to further drill down into what the bad commit is?
This range contains an entire drm merge window pull request, so pretty
hard to guess what broke.

> I tested both these versions with exactly the same .dtb and our .config (adapted via "make olddefconfig" for both versions) from the 4.19.128 kernel.
>
> Do you have any suggestions what we can do to try and fix this problem?

Further reducing the range of suspect commits should help. Maybe imx
maintainers have some guess, but I definitely don't have much idea
what's missing among that big a pile of commits.

Thanks, Daniel

>
> Kind regards,
>  Stefan Birkholz
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
