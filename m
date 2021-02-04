Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E524830F2BB
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 12:53:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5786E059;
	Thu,  4 Feb 2021 11:53:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1916E059
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 11:53:10 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id k9so1596194vsr.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 03:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rm7m5YlsC+StQHgN1LsisWu24TyMg0O2DhHvjSKrLQ4=;
 b=gCnt6XeRGlMB4qF9XNy+/6cdkdDNhGumznRsd7JuHdqQCw6RNu2UbeoZd0HPI6RvfV
 pBDzLYIjzI4gFgjnwnG+1Yt4+ynZeC1hJVtnJEwdQmld/NMi3yfsrkfjhogD7nrTib1r
 4wKoJg/TL1SgOZ/wXNFZT/JkcqyZnAZHlUHcawft9T/AMSDPQKN7/+ss3r/TViWWKZVs
 Tp+qOpQN+02Z3wjUL8eJkWivRiaI5iQY4CrqYPQRWT7Uy7M/d9fJYMlyJtccCgruZTjV
 ZtbfY1gecsTeZw0YaLc8tg8Gtx+dW0AjqhC1syd22m3XR0EFRP5RY34Zeru2ChIHrQKC
 DkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rm7m5YlsC+StQHgN1LsisWu24TyMg0O2DhHvjSKrLQ4=;
 b=hc9wLkiu0DjCxn0+Vz1VVnQOBlftGv2QikEiI5HnFPAAqAKJjrG6VV9wjkEv6jfGcQ
 6mPYtxG9zxdJk0cvPOHktz+1MPQoCSV7Q1KfWrAqvGFPnyasPMMRKuNCH/weTSgr07GS
 ECoEd98PTatCZ5l7pROdez6+G8sn4EoqocG43cxG71FNuLrLWqjozTNi85TZFyNkxbyz
 UXTKB7GnzuQD3NpBawGHZludqS99VqshP2Tg5QdGFRWFFCYfBwzjFkR6MOd6fYsUHJ8X
 AosC228brIECopR9zIeVhcG4X6OLo5wHv00uzQru7sElOvKEJ/Q7ZJkELHwlL+fYJpLA
 t/RA==
X-Gm-Message-State: AOAM531qjjPwSrUPj2xLD+8taUEWh+nUH3VNGDht3Exl5oJYbqJW0WNb
 Semc4CMiZZgohmrUTEPOfRwbSslJeJMV4PD/Fr4=
X-Google-Smtp-Source: ABdhPJx9gtkTYMYUNwornqNqLuwJhyx0xvc99DHOnOcNWZABiSBjtGX3XsbqHplXyVscPSaKhzLS1DVfCASd9H6fUjY=
X-Received: by 2002:a67:fe4a:: with SMTP id m10mr4355107vsr.18.1612439589085; 
 Thu, 04 Feb 2021 03:53:09 -0800 (PST)
MIME-Version: 1.0
References: <20210202224704.2794318-1-emil.l.velikov@gmail.com>
 <CABjik9dde-HCWBsfwxjD+jTKaoy-YxDeSObmH7X5rSzNHoA_qA@mail.gmail.com>
 <CACvgo53wJ2XrLRBy4ysOBfU5TFo7nBwDS_CyrPkB1rotJXW5Nw@mail.gmail.com>
 <KZZVYm0Qza351oOJ53ZX0pUcEa6NRh2sJJiq5OR2IjRlmJsdCZXRusR3ZuiiL5dqUgpR_STva8ySdYIJAUnSHVkU5HnNLzC68pNSEcuYdcA=@emersion.fr>
 <1eXnpBNSePW1qsq6q5BR3IEa6Q4DGeWBmJ23QArM9eGt12sN9W2Mhpk2OkUwZj-fhRjAtf9XNne5vxJ-7_JjPl549Ml3wxwMo0hhKsojL_4=@emersion.fr>
 <CACvgo53_f83NFhCkzDx5ydE+H0KdEYKx6Mgdk+-z1hZE8piM7Q@mail.gmail.com>
 <_L67Dl3bTZirFqSulhWUeN215npWnjsPyUzg7Rb-2iffHxMbZ1-H6ex7R14gdkDqZfpRw9xLoiol8m5WtPKuJxiBN_FcnailoQHvW02qNI0=@emersion.fr>
 <CACvgo51PDiXPQ=gfChZw2LQmg=NmvshTqw5F3HgkV_9vGYs=5w@mail.gmail.com>
 <N0eVw6YLfc6v63pbpbmd1GPURTahNkBdrWWuwvJNYtXTryToehQecES5PSEqhZvm9yDhH6VLVw4wnSj1Ba3JXINtwZ6tWQXAgokAP32oIA0=@emersion.fr>
 <CACvgo51nJLrcuAAH=RGxCY9Cf-ZGvgPqzdrKj8ODuhbL+eTWjw@mail.gmail.com>
 <3YZGYeCokyp-fEABJS4acHkPKfFBiHtsL3lM8fRBI-ma8q--4afeisOnhmHURa5iF8AVHpUdw2E7fKCe5bug9PX4j8HJ4btFWDdWepXftBY=@emersion.fr>
In-Reply-To: <3YZGYeCokyp-fEABJS4acHkPKfFBiHtsL3lM8fRBI-ma8q--4afeisOnhmHURa5iF8AVHpUdw2E7fKCe5bug9PX4j8HJ4btFWDdWepXftBY=@emersion.fr>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 4 Feb 2021 11:52:57 +0000
Message-ID: <CACvgo51ZY+tL6h5OnV5ERWieLRR-zNws33iFFTCz082sKswe8Q@mail.gmail.com>
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

On Wed, 3 Feb 2021 at 14:21, Simon Ser <contact@emersion.fr> wrote:
>
> On Wednesday, February 3rd, 2021 at 3:13 PM, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> > As said before, there are multiple ways to handle this without
> > introducing yet another UAPI header. I don't see why you're dismissing
> > all of them, can you elaborate?
>
> Because I hate it when I have to adjust my compiler flags because of
> some third-party header.
>
Mentioned it over IRC, but adding here for posterity:
I think it's perfectly normal to be unhappy, angry, etc but please
mention that upfront so that we know what we're working with.

In this case, one gets to deal with the warning, if they _explicitly_ opts-in.
That said, v2 should be warnings free in virtually any permutation.

> Can you explain what were the past issues with introducing a new
> header?

Few that come to mind:
 - distros shipping partial header set
 - mixing headers, be that any of:
   - distros shipping kernel headers, as well as libdrm
   - system libdrm and local - be that imported or installed to /usr/local/

A bigger annoyance that just came to mind - having the same header
name/guard within your project as the one introduced.

So while it may seem like bikeshed, there are many subtle ways where
things can go bad :-\

HTH
Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
