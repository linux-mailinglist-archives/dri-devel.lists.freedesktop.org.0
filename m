Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC15B1EC446
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 23:22:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6950E6E20A;
	Tue,  2 Jun 2020 21:22:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E3D6E20A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 21:22:11 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id o9so56909ljj.6
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jun 2020 14:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3SbTnu2Joe/UmPFYZAmB5Tz+5GBec7GBEWVsnaWkdrg=;
 b=ABcLIDWzz1tu1GxHTVMe7bjHac2QIuX7rTxa1aa3QDOFpZ/9DRCPuAFOILb1zcCXs0
 7oUcgqs5wDu6bDImq/IzRWVqXPzk1Z2lJmThYxYj/arN3jC60c31M2tmQB5Ue9KM6qt/
 pb18/JsW9x4nynCcy3hfXBohGrqvWxPqFBFSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3SbTnu2Joe/UmPFYZAmB5Tz+5GBec7GBEWVsnaWkdrg=;
 b=Wphdm7gO85AkSUuGvo5LFmQBWdj8gdYOYQCGf/DKZhCIo2KzrsrKxvJj2P++9NgMNz
 rQELR3SxAyt1alDku1iI7N2/dL53apQC952pCQICTAWMRERBbVClInGvyr+AfJ1NV5nW
 o8iZXvqmQ5zfN2rYiBeMZiSnECxvZI6jFOoeSZ6JmiTRXPfONnQ60ZGqC0HnyXDn/qMm
 NHU4nNyXYZ0tRleUD3iuISaiNb3oLzmRR3AIMHzjESP7YQlF68R1zZGCuylrNo28HZCC
 7k7H3lWIm1ooc5IgJqSqGnP9MojvyZuTSCeOSnGkDuX2FyHPjlEJKCp/ETLrEdltX4gE
 hYGA==
X-Gm-Message-State: AOAM532fGsYXd9/7ULQPr9RS43oNcafjQBIDX1LdPQCOUxdK9kK93Edx
 g/I/npyC1//r6Rc5WPfPGsj82++r3/U=
X-Google-Smtp-Source: ABdhPJzzKvj41ROhFlBZxa3GYT8mmLjuqr1wGkYn9TOI104srNWLekGZHGJdsinjzn2yIJgTAFWjTA==
X-Received: by 2002:a2e:6a11:: with SMTP id f17mr455972ljc.109.1591132929205; 
 Tue, 02 Jun 2020 14:22:09 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
 [209.85.208.179])
 by smtp.gmail.com with ESMTPSA id f16sm58856lfa.10.2020.06.02.14.22.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 14:22:08 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id 9so44468ljc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jun 2020 14:22:07 -0700 (PDT)
X-Received: by 2002:a2e:b5d9:: with SMTP id g25mr252353ljn.285.1591132927271; 
 Tue, 02 Jun 2020 14:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txGww+omvateOTizZRV9_wLdAbq6uAz3DRa_S6bn1jQuQ@mail.gmail.com>
In-Reply-To: <CAPM=9txGww+omvateOTizZRV9_wLdAbq6uAz3DRa_S6bn1jQuQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 2 Jun 2020 14:21:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjvVjei5d45D=GQMsFMssD8knSFWqxMbd4bH8qSgXk-Lg@mail.gmail.com>
Message-ID: <CAHk-=wjvVjei5d45D=GQMsFMssD8knSFWqxMbd4bH8qSgXk-Lg@mail.gmail.com>
Subject: Re: [git pull] drm for 5.8-rc1
To: Dave Airlie <airlied@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 1, 2020 at 11:06 PM Dave Airlie <airlied@gmail.com> wrote:
>
> This tree is a bit conflicty, the i915 ones are probably the hairy
> ones, but amdgpu has a bunch as well, along with smattering of others.

Hmm. Some of them are due to your previous mis-merges.

Your commit 937eea297e26 ("Merge tag 'amd-drm-next-5.8-2020-04-24' of
git://people.freedesktop.org/~agd5f/linux into drm-next") seems to
have mis-merged the CONFIG_DEBUG_FS thing in
drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c.

I'm still working through the rest of the merge, so far that was the
only one that made me go "Whaa?".

                Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
