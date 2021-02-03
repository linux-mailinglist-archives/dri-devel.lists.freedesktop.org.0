Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3AC30D80F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 12:04:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38AB6EA55;
	Wed,  3 Feb 2021 11:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76556EA5E
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 11:04:12 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id i3so8173538uai.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 03:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wGZV2/lrQJtIK/R+2h5Sm61xNKFsTPbLB+C520SYMiM=;
 b=ra2RCAF1fcNX1FJ7NvH8eYv72Z9T/GhYhzN+bhEdBnGKMtf/NaZSqgUiaodykIIgIM
 T6pQrsspr6wf3FCuEKKJr7GKwDnNK760Cn97qaJ++GQzrQzYCyCBZWSMCZ0MFvAf5zhc
 eEai3Bxuz7NEEnRJj0w94gTx/TyZmig3M9QZS0ErYpQrSBvrkmDBvR4fuUgqQ0Rab/3N
 Gy9FAnY1tEM7I+wgvjFJxW/JbsyXIWYxfjPqlQ6fclzE7NJzzwjr3sh6ckl3qkfU2OUk
 uQawmm6tSjLY6qpGdm927iVwrRH6titarAfla1VHWs6e3F4ghiHj1GnubkfEvrjAWrWH
 I4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wGZV2/lrQJtIK/R+2h5Sm61xNKFsTPbLB+C520SYMiM=;
 b=ceU3/UHuFLBXzEuD8fKeGGrU9oZqGtceWQuYrPPWbkltqWk8a1vl/IxTf7OmbyU8DF
 wcB/oD4X7HpvP5lm57PAib7IepO9XjBe7RKLixA8z5CKWcER7+PkdZEkGAyIeb/HVEef
 q6g6Uz0+puggoE2zsVHGdk9gpGF0t3CgA2MVK3WizYeQDR16Q+3wZjEzltsrfHWlJnm3
 dtZhfhnvHa2S+jz5tI9V00XehR/Bs8snbSCue2hY0BNOKhnEo8dzXyMLnw84X0xkZdFf
 +f0QMwDipijiZR0Da34vw/AjMFiCoYy/J9BKxeQGGz0gmeBZn28JfP76xPT9T7lfHLa/
 Lc7g==
X-Gm-Message-State: AOAM533ck0/Euep+AwoCjUTE3rkZVCct2xoGU05thkQdpsJC3x+AwFJb
 FoCGR3kPiCwrfxkcmFvg+Zc304BEUUziHSMTSPs=
X-Google-Smtp-Source: ABdhPJxsNSSLLVNQA8n5p8IGlAIWxCaHK/wgnn1cK19pTFDuk85PIYe/HOM3edZRXat+EIcdXNlIEJCUxw8wv7oe+I0=
X-Received: by 2002:a9f:35a1:: with SMTP id t30mr1257758uad.106.1612350250867; 
 Wed, 03 Feb 2021 03:04:10 -0800 (PST)
MIME-Version: 1.0
References: <20210202224704.2794318-1-emil.l.velikov@gmail.com>
 <CABjik9dde-HCWBsfwxjD+jTKaoy-YxDeSObmH7X5rSzNHoA_qA@mail.gmail.com>
 <CACvgo53wJ2XrLRBy4ysOBfU5TFo7nBwDS_CyrPkB1rotJXW5Nw@mail.gmail.com>
 <KZZVYm0Qza351oOJ53ZX0pUcEa6NRh2sJJiq5OR2IjRlmJsdCZXRusR3ZuiiL5dqUgpR_STva8ySdYIJAUnSHVkU5HnNLzC68pNSEcuYdcA=@emersion.fr>
 <1eXnpBNSePW1qsq6q5BR3IEa6Q4DGeWBmJ23QArM9eGt12sN9W2Mhpk2OkUwZj-fhRjAtf9XNne5vxJ-7_JjPl549Ml3wxwMo0hhKsojL_4=@emersion.fr>
 <CACvgo53_f83NFhCkzDx5ydE+H0KdEYKx6Mgdk+-z1hZE8piM7Q@mail.gmail.com>
 <_L67Dl3bTZirFqSulhWUeN215npWnjsPyUzg7Rb-2iffHxMbZ1-H6ex7R14gdkDqZfpRw9xLoiol8m5WtPKuJxiBN_FcnailoQHvW02qNI0=@emersion.fr>
In-Reply-To: <_L67Dl3bTZirFqSulhWUeN215npWnjsPyUzg7Rb-2iffHxMbZ1-H6ex7R14gdkDqZfpRw9xLoiol8m5WtPKuJxiBN_FcnailoQHvW02qNI0=@emersion.fr>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 3 Feb 2021 11:03:59 +0000
Message-ID: <CACvgo51PDiXPQ=gfChZw2LQmg=NmvshTqw5F3HgkV_9vGYs=5w@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: introduce DRM_FOURCC_STANDALONE guard
To: Simon Ser <contact@emersion.fr>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 James Park <james.park@lagfreegames.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 3 Feb 2021 at 10:15, Simon Ser <contact@emersion.fr> wrote:
>
> On Wednesday, February 3rd, 2021 at 11:08 AM, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> > On Wed, 3 Feb 2021 at 09:27, Simon Ser <contact@emersion.fr> wrote:
> > >
> > > On Wednesday, February 3rd, 2021 at 1:56 AM, Emil Velikov emil.l.velikov@gmail.com wrote:
> > >
> > > > As summed in the commit message the burden is only applicable when all
> > > > of the following are set:
> > > >  - non-linux
> > > >  - force DRM_FOURCC_STANDALONE
> > > >  - c99 -pedantic
> > >
> > > Oh, and FWIW, this is not a theoretical situation at all. All of these
> > > conditions happen to be true on my compositor. It has FreeBSD CI,
> > > -Werror, and will use DRM_FOURCC_STANDALONE when available.
> >
> > There are ways to disable [1] or silence [2] this - are you
> > intentionally ignoring them?
>
> We have a policy against pragma. However we already use -std=c11, so in fact
> wouldn't be affected by this change.
>
No issue then, great. Let's merge this trivial solution and move on to
other things.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
