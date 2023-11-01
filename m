Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9121C7DDCE6
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 08:00:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 689FE10E028;
	Wed,  1 Nov 2023 06:59:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9451D10E028
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 06:59:54 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9d8d3b65a67so29043566b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 23:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698821993; x=1699426793; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OoRJsZQA0JRmj7+Zm7KWg2a0Vv+QGemQYHWSkunKRm8=;
 b=H6GZpJzlAejT6u7gnvq/E/LKL7NTTBm/t+r5RMxoIL9pP7CWUPRNExpfKiSw0Im1zr
 dlrKOuVebCD5/UxKALSgT9aEJmWwDO9vxBF9TaRWLiXq5OLEfIZ0P8cx42m9MnzzPwUy
 VlIz8xQkeo1mcxDt/PsUjdAsXValWZ2txypYOZCMlhKqzhiAD0SeU4B7vg6jQ9ivI7FL
 0YNgD+FON8HEN3KhUtoDOmc/MRw0BpQFtp/gl8Vr5uTyCDF/mHvtvQiKtV3uRg52MwqE
 ilFylLhJkoJMzffNN9kyb2jkACgdZL6KqhJHTAlq/euxdNrdwUzbdj7jEhUBYpyAAeni
 UjwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698821993; x=1699426793;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OoRJsZQA0JRmj7+Zm7KWg2a0Vv+QGemQYHWSkunKRm8=;
 b=Vwtxbxr7rq4eQaKNNlK+XOjmcjnqUVvIrd7UdvAvTFuwSAXtBIXaPjBZiJuvV7tdI/
 Reuk6ky0aI+M6YuIZMvYY7RpqhBykwHOvfl7Zr1hJ/ndqmisbk8oUH7jSF1iwn9jrZB5
 Q1fqNrUXmLfqaxqfEnB5EGpoDQ23UucI3uSvX27viLbiBwBX0UQ/whnViaUclleh5wtw
 LDqykl4VHyzPEU9JdnDkl46ObGBQo4epEdDEogoYjzOy9X43t6BO7z/B2+xultqmLZiY
 cHIwQUdBAdeaQ54EBf+ZTIDFOHoHTgI4LnfE9vy0eWOkeW1vEgLEYXk5xhDE0E7FgYok
 YTPw==
X-Gm-Message-State: AOJu0YzWyx7qBoNwVql25mH8bF8RO3dTHBv+4T3fCogHKqFYzIaWLTwA
 wKUU9PLS1Ft5lQBQRpLYuR7Sb+Ag0q7ira+tUGI=
X-Google-Smtp-Source: AGHT+IEr42YbSo5u1ztwgfEXuJgcVFbGHH6ew8zc8QEvevYhY3xgiLLyXDW3jKmYJXFF/eUQO4FOj43/eeqO2NRVnLo=
X-Received: by 2002:a17:907:36cd:b0:9be:5ab2:73c2 with SMTP id
 bj13-20020a17090736cd00b009be5ab273c2mr1135771ejc.58.1698821992749; Tue, 31
 Oct 2023 23:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <9c0cff84-45b1-268f-bdad-38c16316dbc3@amd.com>
 <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
 <20230714-drm-sched-fixes-v1-2-c567249709f7@asahilina.net>
 <bef7ef62-3cd9-6ceb-5eb4-5ae0c0236778@amd.com>
 <de502b41-2864-db1e-16a0-8a5d5e0e4ad3@asahilina.net>
 <d9dc2fd5-d054-dbf3-72b7-fe9deaa46350@amd.com>
 <236422117088ca854a6717114de73d99b2b9ba2f@rosenzweig.io>
 <a42bd218-6eb5-6ddb-bbb4-d25118c59f40@amd.com>
 <7b564e55-a9b7-0585-3cf1-d1f132f9a918@asahilina.net>
 <daf48d76-ceee-c82d-a63a-e8e7770a9d83@amd.com>
 <f5de10fa-57d6-a3d0-1cf9-084491aa6025@asahilina.net>
 <200e9d74-7191-b1ed-e5f3-775827550853@amd.com>
In-Reply-To: <200e9d74-7191-b1ed-e5f3-775827550853@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 1 Nov 2023 16:59:40 +1000
Message-ID: <CAPM=9txcC9+ZePA5onJxtQr+nBe8UcA3_Kp5Da3zjKL7ZB4JPQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/scheduler: Fix UAF in
 drm_sched_fence_get_timeline_name
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: asahi@lists.linux.dev, Asahi Lina <lina@asahilina.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luben Tuikov <luben.tuikov@amd.com>, alyssa@rosenzweig.io,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>
> Well, to make it clear once more: Signaling a dma_fence from the
> destructor of a reference counted object is very problematic! This will
> be rejected no matter if you do that in C or in Rust.
>
> What we can do is to make it safe in the sense that you don't access
> freed up memory by using the scheduler fences even more as wrapper
> around the hardware fence as we do now. But this quite a change and
> requires a bit more than just hacking around
> drm_sched_fence_get_timeline_name().

I really think this needs to be documented if nothing else out of this thread.

Clearly nobody is going to get it right and hidden here in this
thread, this info isn't useful.

Can we have some sort of design document for the dma-fence/scheduler
interactions written and we can try and refine it with solutions on
the list, because I'm tired of people proposing things and NAK's
getting thrown around without anything to point people at.

The next NAK I see on the list will mean I block all patches from the
sender until they write a documentation patch, because seriously this
stuff is too hard for someone to just keep it in their head and expect
everyone else to understand from reading the code.

Dave.
