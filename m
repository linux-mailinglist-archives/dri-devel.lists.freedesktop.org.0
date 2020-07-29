Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8E32318E0
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 07:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 711536E439;
	Wed, 29 Jul 2020 05:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23276E439
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 05:07:54 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id bo3so298404ejb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 22:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=17rgfvEqWRRLKn9YQbbbiT3iU7imxRyw7YqATsKhtFo=;
 b=KNTCiceL1uzKIM2SCntISrAyD2hg5y6BndIU6/klvYBW+Qxkme/gTkC3QOYnpMIp5U
 lJgnl1IMXoNJEJEHd01uN5pexk7koNI0Y+22c8o46aq3bqrCK8ySXvoTdH6wOGjEMCN0
 3m9EOlW09paURv9SGfAmPY/f6q1w716J0KDWpAM5wBrl9IcgZPaYVaJL0znZ2rDOma/Q
 bcKdfA0Ma4LTsZJxcWtjYNZLSWaiKQenRglu1jTKWtDapIUGY74LyzXWtsOsMdiJZO83
 heJtE5efiEjh8AsqyfRKXDs2XQ5H7XL5QrE2NmJQ8/N6w0hVK3n3YAVgE4pu35NXRN4M
 4bVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=17rgfvEqWRRLKn9YQbbbiT3iU7imxRyw7YqATsKhtFo=;
 b=b2BewHWz//eKnE/FHya6Jm4h0ztrG4cmHExlrq8pkllkOQ7x2ZNRH4TlsGueNcBh+s
 yBPp8GgJBkMv36Nn4MmCDb6GVWgqTFCDqs31ewkB8ZV/Ay13ESb5pmTTYVStfakNQZUY
 8XmnbNfO2/ZsaJj84lE/EBgsqgL+CwENLB+EMfWVjUC8DjkBW391lfjuamB0+uBA8OKb
 kz9fxEHJu3yTzEf5KuCrK+UPNaHlRhv+0IbE02PwVj0Ihb+jV1ldQkBUuQcbiGsnczHA
 1IRItFQUoPtYWN9ebdSSE6FxJPWTGRWlAGOyZqS8CgR6O4gOev8nu5Q/eocvCooFzObh
 nfMw==
X-Gm-Message-State: AOAM5306ku//U8bdrzQjxNrIVKy4W4lNwonjP8JFO2Npwr+6OCQvm85P
 g5nAaPfWg6B7vTZ2wDf0My9r/RVwmJhm5r9B62Q=
X-Google-Smtp-Source: ABdhPJxKWHL44O+eQP6IhWRR6v5fi+xjn3BDG/U9J2cVA4fj6g9WSLaeCX3tn089JoOOjSo2F8MaFWutKFLLOZqwRZE=
X-Received: by 2002:a17:906:1104:: with SMTP id
 h4mr19427246eja.456.1595999273441; 
 Tue, 28 Jul 2020 22:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200729050403.jwbgdmvmc3ajdnem@atlas.draconx.ca>
In-Reply-To: <20200729050403.jwbgdmvmc3ajdnem@atlas.draconx.ca>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 29 Jul 2020 15:07:42 +1000
Message-ID: <CAPM=9twPbHvuu7fOXr+nSuB5GRy1PgY1PR6h5HDvzgUo=bobQQ@mail.gmail.com>
Subject: Re: PROBLEM: 5.8-rc7 no video output with nouveau on NV36 (regression)
To: Nick Bowler <nbowler@draconx.ca>
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
Cc: James Jones <jajones@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Jul 2020 at 15:05, Nick Bowler <nbowler@draconx.ca> wrote:
>
> Hi,
>
> After installing Linux 5.8-rc7 I seem to get no video output on my
> NV36 card once the nouveau module is loaded.  The display (connected
> to the digital output) simply reports "No Signal".
>
> I bisected to the following commit, and reverting this commit on
> top of 5.8-rc7 appears to correct the issue.

Can you test the drm fixes pull I just sent to Linus

https://patchwork.freedesktop.org/patch/381225/

Otherwise we are awaiting a fix from James for one other issue, should
be here today/tomorrow.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
