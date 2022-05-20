Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B36B052F087
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 18:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E233010E923;
	Fri, 20 May 2022 16:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8EB910E923
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 16:25:51 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id y13so15822198eje.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 09:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FUaa/CsIoXFhGcqQomBYha0KA+E1xpoSdaSoOErgusY=;
 b=sCdCdZqIB2fM6C3/IMxJnyMHv4TxKGmIAEibbdWMh6FRbyWFI9mTEtryWRZ/NF+hj8
 +Hx7jY6REjkdGsBVNwZIlsBAmuMkblQlokQialFoP0r3E+mVoJ7qGv/cmH27SzZH0S3E
 6LoxOjAbQe+XtYP+GErjofpGVizVrpa3tPrxVs+yqbwCv/s6FVcSIgxyZOKq/Unt6sfK
 WQdH0KeBkcXcGDUDuTf8vX6Et8/Yi9aMTfXHIESge8rquWo4PxOSekV4zJTp0tvovfMW
 u6nTEG2KKtXD08jklErYVdrtfiimeio1bUddW1+xIx6fvJXFqqsrZgzOoeJe1LhQ/lrW
 jHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FUaa/CsIoXFhGcqQomBYha0KA+E1xpoSdaSoOErgusY=;
 b=o7dl0d9ewK40fP0TBw94a0ok5GBSufaOh4SoMeNFuMdkDFJ75FpPNLIpZXTFOvSSl5
 4WxDfAD7ooSv3leiqyA8cpZg5y0DuHssNzX1qhpOTU7vYrO9z4IQD+0e8iuFsOF23Yyt
 RUyuqS7WD5wVPREW84fp/G5yCGSxfvVcjBiBi/iHjpWrQgRVvQMVfKJ2ggNZWYvENgD3
 Db47ih+I9SMwOsYHUHOf9SnCU2RGPJOJ90C7/trA7k8oyli+4jJ6coDVHotZ2/LvGqEd
 ZGYoK1EXgPOOKpGbVLW/XpHAYrWZFPdO5AZA9JmwVkRzHOSp58JUSD0+UFGMF8+whXv1
 wblQ==
X-Gm-Message-State: AOAM5316HjXZ3Vt7KMa8wTOH9w+MyTBvMIdeJ93vvfVUmr3FkF+EYUUF
 9/NCbstXUcGD+CEQW1nY/dfScq4F7/0m0FkiKn7D0A==
X-Google-Smtp-Source: ABdhPJzp/NHzceLMjs5KyttxLo22ikbB+moAIzlm/g7LpDw857XHy/sDkHqgW7kFrYOz58Ub2ZX5aqSsTj4pK+KZ3Kc=
X-Received: by 2002:a17:907:9813:b0:6fa:78b0:9be2 with SMTP id
 ji19-20020a170907981300b006fa78b09be2mr9585859ejc.159.1653063949975; Fri, 20
 May 2022 09:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220510235653.933868-1-tjmercier@google.com>
 <3365cd1d750e84fedc8e75d646a77ffd85619d35.camel@ndufresne.ca>
 <CABdmKX3ZV6-u-oLvW_wWavAMBfrsZ=C_rCgK_Uz4VjxcRvRFew@mail.gmail.com>
 <81026ef07c1ce20f8673b75b17bab79a2b39c548.camel@ndufresne.ca>
 <CABdmKX2LxZ6zZR=fhXfnuWCB2BR+gzDd1-t1DD2A2XP24wvuGQ@mail.gmail.com>
 <Yn6DpUsoSz1/15Kc@slm.duckdns.org>
 <CABdmKX1xvm87WMEDkMc9Aye46E4zv1-scenwgaRxHesrOCsaYg@mail.gmail.com>
 <YodHjYlMx1XGtM2+@slm.duckdns.org>
In-Reply-To: <YodHjYlMx1XGtM2+@slm.duckdns.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 20 May 2022 09:25:38 -0700
Message-ID: <CABdmKX2Ok023rN1drQgXVZLKUO_DVYrzmEamCgMMu6BPO67yhQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] Proposal for a GPU cgroup controller
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
Cc: linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 Carlos Llamas <cmllamas@google.com>, dri-devel@lists.freedesktop.org,
 John Stultz <jstultz@google.com>, Zefan Li <lizefan.x@bytedance.com>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Kenny.Ho@amd.com, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>, Martijn Coenen <maco@android.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Laura Abbott <labbott@redhat.com>,
 kernel-team@android.com, linux-media@vger.kernel.org,
 Todd Kjos <tkjos@android.com>, linaro-mm-sig@lists.linaro.org,
 Shuah Khan <skhan@linuxfoundation.org>, cgroups@vger.kernel.org,
 Suren Baghdasaryan <surenb@google.com>, Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Hridya Valsaraju <hridya@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 20, 2022 at 12:47 AM Tejun Heo <tj@kernel.org> wrote:
>
> Hello,
>
> On Tue, May 17, 2022 at 04:30:29PM -0700, T.J. Mercier wrote:
> > Thanks for your suggestion. This almost works. "dmabuf" as a key could
> > work, but I'd actually like to account for each heap. Since heaps can
> > be dynamically added, I can't accommodate every potential heap name by
> > hardcoding registrations in the misc controller.
>
> On its own, that's a pretty weak reason to be adding a separate gpu
> controller especially given that it doesn't really seem to be one with
> proper abstractions for gpu resources. We don't want to keep adding random
> keys to misc controller but can definitely add limited flexibility. What
> kind of keys do you need?
>
Well the dmabuf-from-heaps component of this is the initial use case.
I was envisioning we'd have additional keys as discussed here:
https://lore.kernel.org/lkml/20220328035951.1817417-1-tjmercier@google.com/T/#m82e5fe9d8674bb60160701e52dae4356fea2ddfa
So we'd end up with a well-defined core set of keys like "system", and
then drivers would be free to use their own keys for their own unique
purposes which could be complementary or orthogonal to the core set.
Yesterday I was talking with someone who is interested in limiting gpu
cores and bus IDs in addition to gpu memory. How to define core keys
is the part where it looks like there's trouble.

For my use case it would be sufficient to have current and maximum
values for an arbitrary number of keys - one per heap. So the only
part missing from the misc controller (for my use case) is the ability
to register a new key at runtime as heaps are added. Instead of
keeping track of resources with enum misc_res_type, requesting a
resource handle/ID from the misc controller at runtime is what I think
would be required instead.

> Thanks.
>
> --
> tejun
