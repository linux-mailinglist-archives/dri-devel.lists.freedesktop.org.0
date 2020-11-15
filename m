Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4412B3862
	for <lists+dri-devel@lfdr.de>; Sun, 15 Nov 2020 20:16:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E226E99A;
	Sun, 15 Nov 2020 19:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B016E99A
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 19:16:43 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id r9so21904011lfn.11
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 11:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mAEGB2jpi5QgFIxhSCMleEK8Xk277gfbW4tZR+yOuTE=;
 b=fJtU4HocBaeARteMdEGJU6+DnCiJBEgmh5n7TxUMb30OF0mVR3l4dOZBSYjAs58ZZ7
 4HPbGcghLJ4QHgsJiBftZga0/L2o8sCNitf6UvWfwEqQxJkFQxWrcHbY0muSebh6912c
 yL3jFh8NQ+r9iKnqFIE6RK4aVpjZxfzPzrxNaGCrVlY6v7n9/3qm3ReMn/CJgz9iMqJq
 kEqvJTDIVZ/jVOZH3G1SkOW6vAh4+pvK8pVbHRFJRn5qQPJrCKDZgwiVM1ghRN+yF8Zg
 q0g1cVSbXJuXUCEx3a1BQciw+RHr89MSOrIXj5eeq25vKf6KOHmS5KfdF04Zpi2y/EIv
 Fozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mAEGB2jpi5QgFIxhSCMleEK8Xk277gfbW4tZR+yOuTE=;
 b=lgMEi6DEhiyvw7czPPmlopw7sT08wKeGAyV47z5JoTua0YaS5uxVeqeiMgaKxYLPW3
 hJ08W8Wewg5tGwRKwzaLyUmpBd6nU61y0/GH2x3iKpDadYU3Gzb8//Bx9xCQ+7/QXle8
 6b3S6nUl1X2IKmU0VkbXd6YKcsrjxgVnWtg6eOQ6zVrYakOY+Yw/bTaCXJ4yrqATP50G
 xhvkSLn0WwOX8BzpjW/Bs0lAqhJ4uO/x63Z14rwkyOk99RMp/EAX2MR1xq0q5BNwezo8
 hkaQZSGdtmEuEP9R2MwestqlAjFNXtfrtCCkdkEa12hD62kGEEeFjsrgLJ5nuxAqE5GR
 DZEg==
X-Gm-Message-State: AOAM533v8PWX3B+b9psthla2dDNUxtSzt2xxxY5QPcR2XdQiHbFUrrGK
 QdXh8xbBNv0zMJdT0bZormnYyWdUtRZKMTWpaY8=
X-Google-Smtp-Source: ABdhPJzW2mlVeRTgDjMVaNGjE0cLc7LO+DvbD2Yme7rGVyWbWizu1mrXiVd+ha3SSPw3sY7u+jzHnCZQbYEzn59/QaU=
X-Received: by 2002:a19:c191:: with SMTP id r139mr4872710lff.258.1605467802151; 
 Sun, 15 Nov 2020 11:16:42 -0800 (PST)
MIME-Version: 1.0
References: <20201115175420.32167-1-patrik.r.jakobsson@gmail.com>
 <20201115183255.GA4011888@ravnborg.org>
 <CAMeQTsZHRgexWdHpHHFy9kDdHRvoM74UFRV6iC=NTcw8pQAMmQ@mail.gmail.com>
 <20201115190816.GA4067505@ravnborg.org>
In-Reply-To: <20201115190816.GA4067505@ravnborg.org>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Sun, 15 Nov 2020 20:16:31 +0100
Message-ID: <CAMeQTsaznHD74Gp89Nx6MSSszLnEgxoQO8iMyJ42pYa-kmAsMA@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: Remove 2D accel code
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 15, 2020 at 8:08 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Patrik,
> On Sun, Nov 15, 2020 at 07:51:27PM +0100, Patrik Jakobsson wrote:
> > On Sun, Nov 15, 2020 at 7:32 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > >
> > > Hi Patrik.
> > > On Sun, Nov 15, 2020 at 06:54:20PM +0100, Patrik Jakobsson wrote:
> > > > 2D acceleration is only available on PSB and MRST and very slow on both
> > > > platforms. CPU acceleration is faster so don't bother with 2D accel
> > > > anymore.
> > > >
> > > > Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> > >
> > > I like the patch and it follows up on the discussions to
> > > remove accellerations that is not really a benefit.
> > > But I tried to apply it on top of drm-misc-next and it failed in
> > > framebuffer.c - did you remove psbfb_roll_ops in another patch?
> >
> > Hi Sam,
> > Right, sorry I should have mentioned that it sits on top of
> > https://patchwork.freedesktop.org/series/83153/
>
> I thought I had seen something like this before.
> So all is good - patch is:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Great, thanks for the review. Patches are pushed to drm-misc-next

>
>         Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
