Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD484ECE47
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 22:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972ED10E425;
	Wed, 30 Mar 2022 20:56:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD8010E425
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 20:56:22 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id r23so25921738edb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 13:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nrCvj7Yq7SSib6FwgrmdzFU7UXWII5P9ju8EtUscCW0=;
 b=boNOk7s9MFWRe9Q5TIHyCBcLZAL3UIEBNmLOOWFhXw6emE+CwKKHdvhC0KffHeh0nF
 M6pQueP4aCRuJFI7dDzsd8w7oMHmH5zQ1LRTPvQqJiDWbX35wE19ft4HqpfvXL9C1Got
 NCX+Q7kxCou/I+IrAEJ9Str9SLE8Vpfu1F+nizveKZzqZBmp0ZbLt4163c8iNRc9oq8L
 +OvcysVAV7F4grrtlsY0RpODotiBIJhRyklfusZBaq0zNt0ADmOlhrzyjpVkba5kg+sN
 XtIoUFtjlMDxb5pCPzyxnwJLsJ9yaQfPKTqYXEV4ifVXSG43LsveuoFab9UFC5oCyEkr
 VAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nrCvj7Yq7SSib6FwgrmdzFU7UXWII5P9ju8EtUscCW0=;
 b=7VZKEwj/rovarIO43BUEu5ul4GGYbZ5TLHWiT9jDJLucbbY4yF8jWG5/Pubbcz9o2s
 wrVcRkyxhWzxwvdRL4sWhOymn2KVH0Bx0yFhosMcSS9XFw+SC+/+CEsMGIRh7ywHFtQ2
 XmgjD6KY1PQdzUwv9k2wUIhRkokB83M2wOMYxjnHUJYQXdjgOHxG3Czs9M6XngXa/v4r
 IssuS9gpSU/nW5uGs4O6uE4E41xx3ujkmYqu1dffUrqt1CzwPkzZDRdfNabYbTPx71mx
 AKSLQt0EqFpXwClv3qj4W0IyNx5G3X8s734AejpIIwhnEuCUKti7c+yM2leOyvSIZ2TJ
 UtjQ==
X-Gm-Message-State: AOAM531w3vhPnRQZryBSSf/henB+KkXyJmPPrdUElyL3qrFoBqopk4B8
 aNevN7kNJPmIDJc9neZMnlH/drrQgBwTWntYelz0Rw==
X-Google-Smtp-Source: ABdhPJxrjw92bYCs2jMACCLJM4/KOh2wxHOU9997F7UwcQsMWyUFgKpYWFcmr9tg4GWCYtbl/45JU/IvvXHerOIfRxk=
X-Received: by 2002:a05:6402:3452:b0:418:f963:42a3 with SMTP id
 l18-20020a056402345200b00418f96342a3mr13302952edc.12.1648673780493; Wed, 30
 Mar 2022 13:56:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220328035951.1817417-1-tjmercier@google.com>
 <20220328035951.1817417-3-tjmercier@google.com>
 <YkM6/57mVxoNfSvm@slm.duckdns.org>
In-Reply-To: <YkM6/57mVxoNfSvm@slm.duckdns.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 30 Mar 2022 13:56:09 -0700
Message-ID: <CABdmKX2Gxg35k7QiL2Vn4zWhmQ4UnM-Z8cnOXR0fwBWyJnZ+Ng@mail.gmail.com>
Subject: Re: [RFC v4 2/8] cgroup: gpu: Add a cgroup controller for allocator
 attribution of GPU memory
To: Tejun Heo <tj@kernel.org>
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
Cc: Zefan Li <lizefan.x@bytedance.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Kenny.Ho@amd.com, Jonathan Corbet <corbet@lwn.net>,
 Martijn Coenen <maco@android.com>, Laura Abbott <labbott@redhat.com>,
 linux-media@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Todd Kjos <tkjos@android.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 linaro-mm-sig@lists.linaro.org, Shuah Khan <skhan@linuxfoundation.org>,
 cgroups@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Hridya Valsaraju <hridya@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 29, 2022 at 9:59 AM Tejun Heo <tj@kernel.org> wrote:
>
> Hello,

I'm sorry for the delay Tejun, my test device stopped working and my
attention has been occupied with that.

>
> On Mon, Mar 28, 2022 at 03:59:41AM +0000, T.J. Mercier wrote:
> > The API/UAPI can be extended to set per-device/total allocation limits
> > in the future.
>
> This total thing kinda bothers me. Can you please provide some concrete
> examples of how this and per-device limits would be used?

The use case we have for accounting the total (separate from the
individual devices) is to include the value as part of bugreports, for
understanding the system-wide amount of dmabuf allocations. I'm not
aware of an existing need to limit the total. Admittedly this is just
the sum over the devices, but we currently maintain out of tree code
to do this sort of thing today. [1]

The per-device limits would be used to restrict the amount of each
type of allocation charged to an individual application to prevent
hogging or to completely prevent access. This limitation is not
something we have implemented today, but it is on our roadmap.

[1] https://android-review.googlesource.com/c/kernel/common/+/1566704/3/drivers/dma-buf/dma-heap.c

>
> Thanks.
>
> --
> tejun
