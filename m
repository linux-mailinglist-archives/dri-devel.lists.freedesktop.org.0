Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC28268AD5
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 14:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE1F89D4A;
	Mon, 14 Sep 2020 12:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B3989CAD
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 12:25:55 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id g4so17398032edk.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 05:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7BdFAddq3RL7rFBEGnlqI6CKwA0tfgEjJpCRYq7bxjU=;
 b=SY+nMVNE8BVVG8ruSR5EiacuhIKxjjgXR9WrOal16ZSF/q8w+hTw0Ovle+QzD6126z
 7fcMPAlyyrMVpVqQt9fd7pJ+l946ySRRZ9i0JaFdIGyuYAczoOGJ/uxKt6pXehjk4vAX
 JLgJDFoB5rHn/zw0yh5fFvwqdFgLQz+5h7c+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7BdFAddq3RL7rFBEGnlqI6CKwA0tfgEjJpCRYq7bxjU=;
 b=hvbtJb8YfsaK/XXkITGzJvTpBNoQzCKszbj18eJUM+tOwSg+SZ3W/DfNNVfaPa6lRJ
 ohRsyKY0PDaampPcwlamMVXGEGhyRuBTs7leQTur3qY4wojwEtTedrmMtx2WgFL+RxR8
 n4OG3END+tiwiV9/vcjCpCaPsFpOnInxJ1G5145jzRZdLu/M3W31jFfI8gKc1NP3ydpf
 rnW30zvcJJBlxaAuPPE2RgNdNEcKfdaLtlIvUVXitQk/XyP2m+gMVHm9BCiSBgLSGdLZ
 ATP7EkvpFE6Y3lX6xUF1QO6mWwE2fnuobNCBS7ZXVgJIxmaSK2ykKgClFsMe9SZ3hNAh
 vl+Q==
X-Gm-Message-State: AOAM531WY1e0ZYM42XiMoDF5dOhHnqnJmJWxdg3MLcwnJmOHtIq1mYEP
 2GUyGZEbdDx3sP62KqJUgA+0wcCidOlZNUiy4MI=
X-Google-Smtp-Source: ABdhPJwSGNnu67PnYtbgAyhVZqnOww0LDfKxxJooWZDtBPLdj0aTdSYJeckD3nPCMOPCHtjf4qb+aGCqyjmZbea0upw=
X-Received: by 2002:a50:fb0e:: with SMTP id d14mr17550786edq.172.1600086354159; 
 Mon, 14 Sep 2020 05:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200912183334.22683-1-lukas.bulwahn@gmail.com>
 <alpine.DEB.2.21.2009131156090.6163@felia>
In-Reply-To: <alpine.DEB.2.21.2009131156090.6163@felia>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 14 Sep 2020 12:25:41 +0000
Message-ID: <CACPK8XdvmUN6XsqGEYMwyb1JhWtm9Nyrje8xXx2zBN4N=+gNow@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: make linux-aspeed list remarks consistent
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Joe Perches <joe@perches.com>,
 Pia Eichinger <pia.eichinger@st.oth-regensburg.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 13 Sep 2020 at 09:57, Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
>
>
> On Sat, 12 Sep 2020, Lukas Bulwahn wrote:
>
> > Commit f15a3ea80391 ("MAINTAINERS: Add ASPEED BMC GFX DRM driver entry")
> > does not mention that linux-aspeed@lists.ozlabs.org is moderated for
> > non-subscribers, but the other three entries for
> > linux-aspeed@lists.ozlabs.org do.
> >
> > By 'majority vote' among entries, let us assume it was just missed here and
> > adjust it to be consistent with others.
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> > applies cleanly on master and next-20200911
> >
> > Joel, please ack.
> > David, Daniel, please pick this minor non-urgent clean-up patch.
> >
> > This patch submission will also show me if linux-aspeed is moderated or
> > not. I have not subscribed to linux-aspeed and if it shows up quickly in
> > the archive, the list is probably not moderated; and if it takes longer,
> > it is moderated, and hence, validating the patch.
> >
>
> I did quickly get back an moderation email that my email is being held
> back. So, that response validates my patch.

The bmc related lists (openbmc@, linux-aspeed@, linux-fsi@) on
ozlabs.org that I own have a soft-moderation policy. The first time
you post a patch I add you to a whitelist. Given the low volume on
these lists this works for me.

I don't know if this necessitates marking the lists as moderated in
MAINTINERS, but if you find that helpful then that's fine with me.

Acked-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
