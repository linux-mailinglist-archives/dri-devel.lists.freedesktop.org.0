Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C80B94F199D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 19:49:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4661C89CE2;
	Mon,  4 Apr 2022 17:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4743B88843
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 17:49:25 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id ot30so11621245ejb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 10:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vABpGBhTQYtFSOzIwpkJiQp51DmO237fnb6hvRyBNdc=;
 b=kq6Yz32DSK9zOJ7bPFvcjQc80bzG6ufNST/PLxnAZDgUll2EsHl/7DOBySFQGPGQBO
 KMODRAMzGVkg4wqeYXpIEQMsuSa51JzFJkHYQV/My/8bthoa0wEAwWm7JnYdhKy4f0IT
 IYKHfXxzGnqGNhFnMBgVhoIPXAaka/SXRk3ohySgOUIybytsG3xyO6h2D7l0K9voeYoc
 FYu5KchV6tYEpdQHe9DyEGR2HYvvOlDHDoh49SMaDGfn3ZJuDuFq+z31146fxq/I3vjU
 3Dn3Z+2p5l8tnkxwc2V2sRlJAeC27tWtZrvSRD17I4uVRkSVjpL8J+bR+U9LjYMfhu8d
 puPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vABpGBhTQYtFSOzIwpkJiQp51DmO237fnb6hvRyBNdc=;
 b=oYZ4Fq9uPcdobixHINFuDqOVZJUegFyWfR+tl9e4mGcUlqAMElwY/VdL+Rgl1YditR
 fAmqwqjC/bnuJ4NABnK8l30eRdM6wVLBv+HEktAtb25ijFsGYRKS9LWnbvYS2Jx0+pcu
 wSxZgCdW4qw613KgCMMZr3ZsmKj1NlNjPhJiIbfVwH0+49L4dJVd1BnXS+rBiNUd8Zbm
 vJnmJB8BLAXWlhmBVI2VMRimDyzjPAqvCog6VWK+3w4dyLGMNs5vQh5yuGGe/Yu4cQ3o
 RLl4N45iXv7XYKSxXdcqORtWr1GuCRhG1tnhLU1Fboe5kIIc112jeyh2fkK8GCfRG81e
 O3Zw==
X-Gm-Message-State: AOAM533QFX7eSPGXZJLGiqIeXiKldxsbBe4B+Jq794v5oC26ALfSLXok
 g/ZT7iZGkBsQxHblSZFbrx0LU1kiDZZY2SeYI09z/Q==
X-Google-Smtp-Source: ABdhPJxeKG3vf8CXWCkQRoUM6NvTL32UYsKMz1d5IhptaAJYwGgG3KUfWseo+ekkT3O/3+91ErXB7keFFH7bAAKG860=
X-Received: by 2002:a17:906:7304:b0:6da:9243:865 with SMTP id
 di4-20020a170906730400b006da92430865mr1195561ejc.665.1649094563498; Mon, 04
 Apr 2022 10:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220328035951.1817417-1-tjmercier@google.com>
 <20220328035951.1817417-3-tjmercier@google.com>
 <YkM6/57mVxoNfSvm@slm.duckdns.org>
 <CABdmKX2Gxg35k7QiL2Vn4zWhmQ4UnM-Z8cnOXR0fwBWyJnZ+Ng@mail.gmail.com>
 <Ykst5K/cI+DUVc94@slm.duckdns.org>
In-Reply-To: <Ykst5K/cI+DUVc94@slm.duckdns.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 4 Apr 2022 10:49:12 -0700
Message-ID: <CABdmKX3LR1h_tac+UCCXf57hhDQ9CmmmYe2ymS8ZFiDA9Mcv4w@mail.gmail.com>
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

On Mon, Apr 4, 2022 at 10:42 AM Tejun Heo <tj@kernel.org> wrote:
>
> Hello,
>
> On Wed, Mar 30, 2022 at 01:56:09PM -0700, T.J. Mercier wrote:
> > The use case we have for accounting the total (separate from the
> > individual devices) is to include the value as part of bugreports, for
> > understanding the system-wide amount of dmabuf allocations. I'm not
> > aware of an existing need to limit the total. Admittedly this is just
> > the sum over the devices, but we currently maintain out of tree code
> > to do this sort of thing today. [1]
>
> So, drop this part?

Ok, will do - I'll drop the "total" limitation text from the series.
>
> Thanks.
>
> --
> tejun
