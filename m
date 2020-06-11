Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE271F62F2
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 09:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA496E220;
	Thu, 11 Jun 2020 07:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 493636E220
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 07:52:35 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id p18so3244937eds.7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 00:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=infCVxRBFq8wcPbhY9NtQOYTjb0b7Xr0kvySKO6/Bf8=;
 b=bHhNRa8JV/1DPjXZSUYmndVbsxCvamN9ht7/kqUeQI0A+5jGWD8l3LqfKkKxlEwZqd
 ojD/p761Q/GqIu6EnaldNC3MExdBcc5E7/WcQIJP/ds7TnfPJYpVXxhTeFPQA8q9Qdfc
 CHI4Flr+Mah6/SJkT3mcqdoqHTneUkr9vmuy6vYu9m4+6Bep2m3a98bbmA29wu7uzjVo
 xNCKDSwktlUs+8YEuKmgFrXo2UEKCcvs9sD3LRvHs9ALPSqcd3dMoYnWgTeocsTI611A
 4eE5VqPcS4Dt6o867TGHKaeqVlaPhLoNOz/QY7uS+TGLbH0zG4t8bt086zzaVW4bft/S
 JqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=infCVxRBFq8wcPbhY9NtQOYTjb0b7Xr0kvySKO6/Bf8=;
 b=I8l8wkGdW9u+kfiqIohd3mzs+2cyMHuoNWatw+eTUNSCWvMXvNM7/db1d8jsGKfVE2
 cjhFXrTellQjXODYntbpzjL5HZr3jOTKus9zRTf92Pvox3HTDO263M1AEOsdQTIRqKJv
 we+b13jTGWgc8t1F4lWtKZR1G8/BuyfO2vMmV1vIHQxU6KCwEDMILOdv4y8Nk1yPZPhN
 Gl7a6KwmMoumXRJ6twakr5xxzZkXpN3gO21VEhdFWE9ZDoZt1+hC1SVovg8eYaysoL1f
 3wvlza8WPJCRhiAUEBW23nRbvRKPTbY5t1VkUC4IUMcqUNUdOUTohgMxSmt6qEWJkkUk
 71EA==
X-Gm-Message-State: AOAM53060qCgur8sBpBhUErVXF3971x0XJPidyVT+Q43Mvf/FMPux3gc
 BIQMQvtKjLya8aUy1NKvVTn8UkgWgtzO+whEVJzHDQ==
X-Google-Smtp-Source: ABdhPJwnX0YDM2BHMYIRO8m7ItOvNpONSCGfBYPDq6B5P14y7Ybu1YyQaJs1FffHxDvXRGAmSf18qGgGM4zkfI9T/aQ=
X-Received: by 2002:a05:6402:c06:: with SMTP id
 co6mr5700483edb.298.1591861953758; 
 Thu, 11 Jun 2020 00:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tySU_oXYv+FF5D3GkkyngdxWfkb_6KDK6nA0uBx6EB=qw@mail.gmail.com>
In-Reply-To: <CAPM=9tySU_oXYv+FF5D3GkkyngdxWfkb_6KDK6nA0uBx6EB=qw@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 11 Jun 2020 17:52:22 +1000
Message-ID: <CAPM=9tx_F=dePpDWsmNP4qSCO9mTN37RMYWojdhy7pWswu3WHg@mail.gmail.com>
Subject: Re: [git pull] drm i915 fixes for rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 11 Jun 2020 at 13:56, Dave Airlie <airlied@gmail.com> wrote:
>
> Hi Linus,

Hey actually skip this one in favour of the later one, one of the ast
fixes needs to get into stable as well.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
