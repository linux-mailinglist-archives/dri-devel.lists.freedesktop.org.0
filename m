Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFFE367307
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 21:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DCDF6E0D9;
	Wed, 21 Apr 2021 19:02:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81026E0D9
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 19:02:37 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 i16-20020a9d68d00000b0290286edfdfe9eso29252848oto.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 12:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=s9FLTXEW/DtWvaN9LaTv0x1ijj98X3ajcN+7b+Y4Vm0=;
 b=Bzbr+bptOOO+Uza9KmmlAPfZTA89UmwFHHnUvutcC0l6LisR1ZUdljSnulsiSiUhUl
 bq5uU2xjord7twTsRSGz6kPJKBzsZsSaSOpQBLc93juGrWaLZAEIlcqUKwm+DHGa6x/m
 sE/PUP74NiRYXZ3Akuy/wCoFbYsCZLZyXB3ts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=s9FLTXEW/DtWvaN9LaTv0x1ijj98X3ajcN+7b+Y4Vm0=;
 b=fXzmqL2KT4UOtfBZxfwGqYuz5zpeUwfV0m1cu3hEoyU1S/6ezAg2ZPA/t+h/bB+3Ex
 QCa424kcWM36oePFHmboa5bzwMXvLoW13zkzo3s8GJE8FNAhaM+hQT1AVFKS7gO1CTgz
 23ZD9pNuNZhJ2wvex3asey8kgj49b/5Z9Hke2XAQioqt3K2sGjxMiVYTLKjvXjLHpBwA
 m9iTXuLBAdlRhl5jjkSsivFe//Pg/aZBTr7elTx+ZOU84Fquy0gpDBcJruJScxMzWNZ4
 ZyxXPCdzSqtu/W6IW+y2Z4IwYQUu5073puwBqB+nM5ALVtnXPyClFfDumhJc2RCVXn1y
 3PbA==
X-Gm-Message-State: AOAM530+F6QIit/cheduMb7A+lsRizmdg/wwaaxQyD9E4cJNdEObmn11
 F2f2K4XWWbChm6xOYyj2rSlg0DmPJo1mkc/k0nCcYa7I5lc=
X-Google-Smtp-Source: ABdhPJx8qRDitnxRa3n5V3YpiLfAeANzWB5FMO9ORrTa9vIF6bSmXbqBIFPl9ubmHoPT2/109WAH37OEsymvozhU0lY=
X-Received: by 2002:a05:6830:1398:: with SMTP id
 d24mr24940630otq.281.1619031757088; 
 Wed, 21 Apr 2021 12:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <f7add0a2-162e-3bd2-b1be-344a94f2acbf@vmware.com>
 <CAPM=9twZd-Y6dnx7eQW6paw8BoREnMiPAe5FnBM1sZ-3uPk9YQ@mail.gmail.com>
 <2dea2bb1-ff91-601d-5945-f9974d3f050b@vmware.com>
In-Reply-To: <2dea2bb1-ff91-601d-5945-f9974d3f050b@vmware.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 21 Apr 2021 21:02:26 +0200
Message-ID: <CAKMK7uExn01wSKtAgr6P0npEhdeDe1+ie1yH5Pz0tFx7QWjeFw@mail.gmail.com>
Subject: Re: [git pull] drm/vmwgfx fixes for 5.12-rc8
To: Zack Rusin <zackr@vmware.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 21, 2021 at 7:00 PM Zack Rusin <zackr@vmware.com> wrote:
>
> On 4/17/21 7:02 PM, Dave Airlie wrote:
> > Hi Zack,
> >
> > Please make sure to always cc dri-devel and/or Daniel on these so if
> > I'm away they don't get lost, but also so that they make it into
> > patchwork for processing.
> >
> > If you have a chance can you resend it, I'll see if we can process
> > this out of band and get it to Linus before release.
> Hi, Dave.
>
> Thank you! I just noticed that you've sent it out. Would you still like me to resend it through dri-devel? The patches all went through dri-devel already, I just assumed that from dri-misc docs that drm-misc-fixes wouldn't be merged again until after 5.13 was out which is why I went directly.

drm-misc-fixes will get pulled into the merge window when it misses
the last release (which would be 5.12). drm-misc-next-fixes is the
special branch which is for fixes during the merge window time, for
issues in drm-next (so for 5.13).

I know that ideally maintainters would just cherry-pick bugfixes to
the right release branch (like on mesa or xserver or well any other
reasonable project), but since drm-misc is volunteer run committers
need to pick the right branch. But aside from that drm-misc is always
open for bugfixes (and also always open for feature work).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
