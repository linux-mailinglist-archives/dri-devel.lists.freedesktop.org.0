Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 681FA1E9C12
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 05:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85DAA89E11;
	Mon,  1 Jun 2020 03:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0F489E0E;
 Mon,  1 Jun 2020 03:37:32 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id p123so4499086yba.6;
 Sun, 31 May 2020 20:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M3kXy6Foois4p4YwmWOHbsqPi5NG9OlA8HpHEWFskMI=;
 b=Fp8ru2YzEzjxWuQL+FWVNIMbN3heKyS6JRkhel7hpnw7QyD+5Eeu3oGkcEbEylFli1
 afbaRGhIWktXw/VO3jXYZe63X+tqmpdiBWVqfeST7O6t3ce5/qZMfkVV7StGkjHRAst8
 zf0YapuP2s6yQGFSB6IUaFpe8gXroDNc5aUk7jkRvdFvBut2RSDWTYjdxjxlGvCTvFrf
 MAzutSUGG/eGym5XmwSeSXjRIl4cDNGhV7XDC94XUKv6VkG31kwr5tym/OcWyPmk7QoO
 7BhH5VN9UfkI+RTH3+J+mR4KjcB45oYKxwbO/n6zZbdCpLhQ3Qswuj4kwQf1wpkNJ+I6
 /pKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M3kXy6Foois4p4YwmWOHbsqPi5NG9OlA8HpHEWFskMI=;
 b=LEQxU3wM7L+USCuJKGvSbieJiiyAEGgtL6fiPneKs6DgePVrEgVAQBiHk9vW/a8Krt
 gVD1xG/t2FP7QmyV9BOTSEscosQJpozCd+F3BEwnpabTrx4nwnK62zeDUohE8NGijUCq
 6/0TPzC8bvh39q85VpDDcNJ6V8wJG+q9cak4qxSWU4ehfAJGv8PYrxje2fEWMGvmB5Zt
 uVl6lPvj+foo4VE32Jzvx3DqYHN8hvu2yunM2HFTG+EZ3WOjXFcg4VKkpsQFJCWJSFK0
 nGC2gGRbR8XRhWkBwoCQZqihybQmulL5mBLaZC1B401ooYrmkRHnfrt80qBo9nPdc0vs
 Wvog==
X-Gm-Message-State: AOAM533xrL4bGiZzKjGnglTHkKocFaZCKoh/7/EGrKnLQ3UuYNO70i5g
 kpyJOpZnfV0bfaig24VrTNkBgj0DJXIo1fQF54M=
X-Google-Smtp-Source: ABdhPJydpKDkvSPYSJk0wcttMYKs+HSyWTjov0ZbhQNnhDIn7/fYDuUakw4pz4rV8NAtwoNzLHJuKOHwA0Hm/1ro+dM=
X-Received: by 2002:a25:9d82:: with SMTP id v2mr30191893ybp.268.1590982651331; 
 Sun, 31 May 2020 20:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200529080042.6082-1-dinghao.liu@zju.edu.cn>
 <CACAvsv73wZK_pKk4TDHaTeBUqxYHvK0KhLQBgPC8Be_VviY2jg@mail.gmail.com>
 <6a65a5b1.dd4b7.1726deaea0a.Coremail.dinghao.liu@zju.edu.cn>
In-Reply-To: <6a65a5b1.dd4b7.1726deaea0a.Coremail.dinghao.liu@zju.edu.cn>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Mon, 1 Jun 2020 13:37:20 +1000
Message-ID: <CACAvsv5kcUC_kOfMPxqY-irSAexmhm=WKO8Vk=wTZWdsbaartw@mail.gmail.com>
Subject: Re: Re: [PATCH] drm/nouveau/clk/gm20b: Fix memory leak in
 gm20b_clk_new
To: dinghao.liu@zju.edu.cn
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
Cc: David Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>,
 kjlu@umn.edu, LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, Markus.Elfring@web.de,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 1 Jun 2020 at 13:27, <dinghao.liu@zju.edu.cn> wrote:
>
>
> Hi Ben,
>
> > > When gk20a_clk_ctor() returns an error code, pointer "clk"
> > > should be released. It's the same when gm20b_clk_new()
> > > returns from elsewhere following this call.
> > This shouldn't be necessary.  If a subdev constructor fails, and
> > returns a pointer, the core will call the destructor to clean things
> > up.
> >
>
> I'm not familiar with the behavior of the caller of gm20b_clk_new().
> If the subdev constructor fails, the core will check the pointer
> (here is "pclk"), then it's ok and there is no bug (Do you mean
> this?). If the core executes error handling code only according to
> the error code, there may be a memory leak bug (the caller cannot
> know if -ENOMEM comes from the failure of kzalloc or gk20a_clk_ctor).
> If the core always calls the destructor as long as the constructor
> fails (even if the kzalloc fails), we may have a double free bug.
>
> Would you like to give a more detailed explanation about the behavior
> of the core?
If there's *any* error, it'll check the pointer, if it's non-NULL,
it'll call the destructor.  If kzalloc() fails, the pointer will be
NULL, there's no double-free bug.  *every* subdev is written this way
to avoid duplicating cleanup logic.

Ben.
>
> Regards,
> Dinghao
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
