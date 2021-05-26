Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1B939188A
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 15:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B131A6E4D2;
	Wed, 26 May 2021 13:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79C488AA1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 13:08:32 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 n5-20020a1c72050000b0290192e1f9a7e1so478146wmc.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 06:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+nExywDxPIuijKm2l+qFP8fUdIzvDs2GQX85MC7L2wU=;
 b=IJJnnZRdPL55RjlCC8zHlOtVaALgJTZiv1zvNCLFR9aRnNV/Y5/ixKaFWxQDpTQzJS
 Eaz60ArY64mUqmGGJYJnA27PXdS305UEvfW8dAzCOKPA9l3YLfVI5Dm9zgeDs0xGB5tN
 pyuomLGVSBwkQs1CzWMYpoItjTxakHIhMKxXG5QgthrAouNhd7QsM3xNcmlzHboNnfzu
 0eqOddDdO8jkZv1Az+k7ElH7ciRoWVRd2FYi0v1QXEHncaAGQKyFItnmSafXTtV/9RcM
 H94phqV7fD08eqcyqFd6MWgdHI3OrJZ3jSvnEvhNsVeLZ9MNU7ieBSl8Y0GzZdb6P0p0
 j5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+nExywDxPIuijKm2l+qFP8fUdIzvDs2GQX85MC7L2wU=;
 b=IcDnCuCOKvUw3kVqL40nW4BLzxzc0sau1NGZfJFuX7Fuqwms1JCFxweedDuwIV5e9o
 YFuaHjDRkLBZdFy0LyO/h7P+XoeQbtj0sKIM+jWjbODOkme4QBkCRHPrzZCTjb4zBrum
 tnd2V+Jgq/5L2sYbAYwQPM9k2VSvHPrloHhdrkSWqje61HdBDrvkRogBYwwH7wGYm2mZ
 VUkQ624rj5aK0uSxUOeAH78/SK+l19r3nkguq5RUW6d3WXCuEtma7kl9Thp+sbjS6msn
 LLphlyir/u3L6lfadM2p2d0L0AxjoeM8J4yNeaA1YRVYbElMc/m5fuYV/Inwq1/+FqNV
 k5FA==
X-Gm-Message-State: AOAM531k6OjO/b9no4ZW0/GvUCQyt8iLRD4EUP/IDnIa5v9px6qXuCun
 fDH6G5OgRcjtFHYhCxoYKw41hyAMXzqQ7s8dRsFfNQ==
X-Google-Smtp-Source: ABdhPJyQk/giYYF/3ka6teKlmPw4gdCxhFqXNCnKnKMzdZAWj3Z1sgCP25zOy4+sUNHq/35EtuL7/QKiyIpH6VNb+IE=
X-Received: by 2002:a1c:7c03:: with SMTP id x3mr3375462wmc.168.1622034511354; 
 Wed, 26 May 2021 06:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210520190007.534046-1-jason@jlekstrand.net>
 <20210520190007.534046-5-jason@jlekstrand.net>
 <CAPj87rPW2xmOLKg6OgQST6QrH9u5-qmdRJrNDug+rWa=Uv6ZBQ@mail.gmail.com>
 <CAOFGe97b-djqwV95Y91xe9-ZVUyeGqjdPE8vj7MoSfV0Kcrp1Q@mail.gmail.com>
 <CAPj87rNJTHNKkdiZREVb8v6iiwUhYLXW10pjVOdV=zttd+tG3Q@mail.gmail.com>
 <CAKMK7uHqxLe_CH_cOjfy-rouYcxwg=n6AkkxprzAKnb-y_A3NQ@mail.gmail.com>
In-Reply-To: <CAKMK7uHqxLe_CH_cOjfy-rouYcxwg=n6AkkxprzAKnb-y_A3NQ@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 26 May 2021 14:08:19 +0100
Message-ID: <CAPj87rOW_633K_n4nwq2qkPt5Q5efc3BpRnzT+=Npb=agWGTew@mail.gmail.com>
Subject: Re: [PATCH 4/4] RFC: dma-buf: Add an API for importing sync files (v6)
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

On Wed, 26 May 2021 at 13:35, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Wed, May 26, 2021 at 1:09 PM Daniel Stone <daniel@fooishbar.org> wrote:
> > Yeah, I don't think there's any difference between shared and
> > exclusive wrt safety. The difference lies in, well, exclusive putting
> > a hard serialisation barrier between everything which comes before and
> > everything that comes after, and shared being more relaxed to allow
> > for reads to retire in parallel.
> >
> > As said below, I think there's a good argument for the latter once you
> > get out of the very straightforward uses. One of the arguments for
> > these ioctls is to eliminate oversync, but then the import ioctl
> > mandates oversync in the case where the consumer only does
> > non-destructive reads - which is the case for the vast majority of
> > users!
>
> Just wanted to comment on this: Right now we attach always attach a
> shared end-of-batch fence to every dma_resv. So reads are
> automatically and always synced. So in that sense having an explicit
> ioct to set the read fence is not really useful, since at most you
> just make everything worse.

Are you saying that if a compositor imports a client-provided dmabuf
as an EGLImage to use as a source texture for its rendering, and then
provides it to VA-API or V4L2 to use as a media encode source (both
purely read-only ops), that these will both serialise against each
other? Like, my media decode job won't begin execution until the
composition read has fully retired?

If so, a) good lord that hurts, and b) what are shared fences actually ... for?

Cheers,
Daniel
