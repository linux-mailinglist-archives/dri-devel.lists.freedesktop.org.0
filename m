Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 751BB1D7565
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 12:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 900646E417;
	Mon, 18 May 2020 10:42:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4EF089DC7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 10:41:59 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id r11so1007389vkf.11
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 03:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NBcS3bR7gp0XGsXpfIkEyLYNHmBwNwug8bSe+F12pcw=;
 b=XiLQ0WtpzuGG8Q+YGNeGJ7oDQwQZVmpXGcF1/j1XFtBa2tfSX7VMCG1W48UNa1BMBP
 qen5gyRFYExvfE+2a/mK+1mP224+ciAQ58QBSTGknrzqVmZO3dfqxoujmXk1Z+H/JWRJ
 4fmTp6Y3HN8eK66nYb69+V2U1fuuAtvFLoRAX7t26O8cRsV3/NUSuK+6sg743xjZm9C/
 Z1+lQfz6dBDVnbB31Ou10a3jTnMpspWTBdxXf0Y/V10svdJWLMBjxamrEpXOJjq6jZdY
 Q3eSPYgqJsCz9Wnv1vEzbZY+2m/8CrCSTVySgX+1hV0cuKeBawBF9Q+PWvMIww96STIC
 FQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NBcS3bR7gp0XGsXpfIkEyLYNHmBwNwug8bSe+F12pcw=;
 b=VLjqKsJ4YdF2P08tLKuEwK4dgaNOHTmJ1THNpElw99ucxnODBnZEs4Mmhr35UkKGIk
 Tmh4YjYs1cAJFsQLTnK/TrmBGACeOAee2vK+1ysKVYZnGWLaDO7WXd5DTQzP97AkjrJK
 nf4JRTGWWz7FhUl4Ct73WxWog9rrpFCAXZiRt0Dalcw5bEo9kPOx9h9ACejqNAr1uXmm
 uhAZyedl886M6MbGu+JoC7ry805yjjrz7D4WCun+djuhvKy+JmYj+3z01v/hw/aTfXhG
 yMTy4Pz83fF1b72NJOtRxpXarBv6HTODilun3v4O9ZBTPNi09tw7HztHTtjBi73pBuwP
 Dc5g==
X-Gm-Message-State: AOAM531c8xcnyJU6wREC6lI/Ga2p6v3mYcRQ/6dSSSIgmvw4X3RRoSgN
 XT24xFs6KSs17hETqd5qd9weyoDL7hinyqNLf/v2ywm/
X-Google-Smtp-Source: ABdhPJyoyV3HqGdtYa7UlVQbrbegHMpIyurrZWEZMtT5Q9lrsXNJkqaeQ+WiQLCdQSDGiIYC+juCZWDle0nngZoMZag=
X-Received: by 2002:a1f:2bd7:: with SMTP id r206mr770720vkr.28.1589798519040; 
 Mon, 18 May 2020 03:41:59 -0700 (PDT)
MIME-Version: 1.0
References: <87shgq8qh9.fsf@nikula.org>
 <20170817104307.17124-1-m.tretter@pengutronix.de>
 <87mv6y8lup.fsf@nikula.org>
 <CACvgo52u6pVjA5SjSf6E6aXWuvhb5t=VDcndd+P7Oyup676Obw@mail.gmail.com>
 <87wo5938dx.fsf@intel.com>
In-Reply-To: <87wo5938dx.fsf@intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 18 May 2020 11:39:08 +0100
Message-ID: <CACvgo51MY_TMqL=h03MHRs4F-wy_mch_2DTb__3tFL2AamRDOg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/debugfs: fix plain echo to connector "force"
 attribute
To: Jani Nikula <jani.nikula@linux.intel.com>
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
Cc: Sascha Hauer <kernel@pengutronix.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Michael Tretter <m.tretter@pengutronix.de>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 18 May 2020 at 10:22, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Sun, 17 May 2020, Emil Velikov <emil.l.velikov@gmail.com> wrote:
> > On Thu, 17 Aug 2017 at 12:34, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> >>
> >> On Thu, 17 Aug 2017, Michael Tretter <m.tretter@pengutronix.de> wrote:
> >> > Using plain echo to set the "force" connector attribute fails with
> >> > -EINVAL, because echo appends a newline to the output.
> >> >
> >> > Replace strcmp with sysfs_streq to also accept strings that end with a
> >> > newline.
> >> >
> >> > v2: use sysfs_streq instead of stripping trailing whitespace
> >> >
> >> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> >>
> >> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> >>
> > Seems like this fell through the cracks. Pushed to drm-misc-next.
>
> From 2017? How'd you find it? :o
>
> My bad, thanks.
>
A colleague mentioned about their experiences with \n, so I remembered
seeing something.
From a quick grep, we have have handful of other cases mostly in
amdgpu and radeon. Will see it I can prep a patch later on today.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
