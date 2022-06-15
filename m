Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC9B54CFEB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 19:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A3D811275F;
	Wed, 15 Jun 2022 17:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43EA112766
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 17:31:34 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id g7so17209655eda.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 10:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w3YUx2QLwqjC4yt6Na4HDX+YOsTdcO8b9CpzZpDW+SU=;
 b=SumGg4ML2+ipUmc7XA+lq9lEeAMN0G+c1nkIb8xlQdeSVIXK7p8gchHLt4JMr6H2DB
 oay1lq5P2vRcbJXDcviUhEXtOuH0wnMLPDb9TSVPWMFmqsCzv/3C5/PS3UIUNxLhWLFF
 stiOnXVgBnI1zKc+m2gV4bh+ZP9jm2By0atDyoqFmq9V6owXGPdCIBexAyREiyN/lqWP
 sE0WUW66Z3ial6A4UoLjgKhJjd15EU91IEkibIDuhAx6QDoDtHXsAnahe4K9HdlDUCRk
 bV02tDWRCArcwrkIhFBPyvdeAp0V7KDoiMmXTmMmQR0oyvjc0mW2aORSBPxsiKFydKXZ
 joRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w3YUx2QLwqjC4yt6Na4HDX+YOsTdcO8b9CpzZpDW+SU=;
 b=3AHui3ggE1nYtaqf3ZZ1lGkO4/cCAYHAFz0h4IRkbDSRFF+f9JTbmipl4ws0J/nPs9
 He6PDG7YOVLWywm6Fi1vxsC5WYAx+O3LW15ukOQff5xHAmhSzKpeHZhWnYl/afwa4+kg
 HpZSlqsJeHMBj68NxOqcW7TnQTKa6RRezy4hzPr50SeKcHn0CjtLvJCkNX15j4eRQ1lu
 gc/reapEYi0wBz5XoWLIdEHcr4hjvLhnhGmCEIBGSMiFj+E0qu46j80I6w3OTJufHSz3
 Cv+Fpneq9SAW6pjW7bkxH0c+g9n4Ze4Gg/0iIMOn9UKJ8Zd5enDfSYDyjTzzzHkwIcTb
 /V2A==
X-Gm-Message-State: AJIora8sv5XLD8xFscZuGNjwB5vjFhVNaSrd/gP4fdD+3NZIA+TTfqpX
 4qzX89TmFYjKlpbfc24Tfx3wBYg/5dSIfhBsOhxm2A==
X-Google-Smtp-Source: AGRyM1sS/o8uE5SIVvuRne76FHmKtTOxLuF/9qz0QiBkZZh/OtXHhO00qEM0M0U9FVkRkm0Vv+czaVupYJU60sZU7Ow=
X-Received: by 2002:a05:6402:3325:b0:42d:e1d8:99e9 with SMTP id
 e37-20020a056402332500b0042de1d899e9mr1033464eda.87.1655314293062; Wed, 15
 Jun 2022 10:31:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220510235653.933868-1-tjmercier@google.com>
 <3365cd1d750e84fedc8e75d646a77ffd85619d35.camel@ndufresne.ca>
 <CABdmKX3ZV6-u-oLvW_wWavAMBfrsZ=C_rCgK_Uz4VjxcRvRFew@mail.gmail.com>
 <81026ef07c1ce20f8673b75b17bab79a2b39c548.camel@ndufresne.ca>
 <CABdmKX2LxZ6zZR=fhXfnuWCB2BR+gzDd1-t1DD2A2XP24wvuGQ@mail.gmail.com>
 <Yn6DpUsoSz1/15Kc@slm.duckdns.org>
 <CABdmKX1xvm87WMEDkMc9Aye46E4zv1-scenwgaRxHesrOCsaYg@mail.gmail.com>
 <YodHjYlMx1XGtM2+@slm.duckdns.org>
 <CABdmKX2Ok023rN1drQgXVZLKUO_DVYrzmEamCgMMu6BPO67yhQ@mail.gmail.com>
In-Reply-To: <CABdmKX2Ok023rN1drQgXVZLKUO_DVYrzmEamCgMMu6BPO67yhQ@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 15 Jun 2022 10:31:21 -0700
Message-ID: <CABdmKX0WV8VWgeafVGJ++nJ4xsJD7Wpz=3KX=BW1du=huttfvw@mail.gmail.com>
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

On Fri, May 20, 2022 at 9:25 AM T.J. Mercier <tjmercier@google.com> wrote:
>
> On Fri, May 20, 2022 at 12:47 AM Tejun Heo <tj@kernel.org> wrote:
> >
> > Hello,
> >
> > On Tue, May 17, 2022 at 04:30:29PM -0700, T.J. Mercier wrote:
> > > Thanks for your suggestion. This almost works. "dmabuf" as a key could
> > > work, but I'd actually like to account for each heap. Since heaps can
> > > be dynamically added, I can't accommodate every potential heap name by
> > > hardcoding registrations in the misc controller.
> >
> > On its own, that's a pretty weak reason to be adding a separate gpu
> > controller especially given that it doesn't really seem to be one with
> > proper abstractions for gpu resources. We don't want to keep adding random
> > keys to misc controller but can definitely add limited flexibility. What
> > kind of keys do you need?
> >
> Well the dmabuf-from-heaps component of this is the initial use case.
> I was envisioning we'd have additional keys as discussed here:
> https://lore.kernel.org/lkml/20220328035951.1817417-1-tjmercier@google.com/T/#m82e5fe9d8674bb60160701e52dae4356fea2ddfa
> So we'd end up with a well-defined core set of keys like "system", and
> then drivers would be free to use their own keys for their own unique
> purposes which could be complementary or orthogonal to the core set.
> Yesterday I was talking with someone who is interested in limiting gpu
> cores and bus IDs in addition to gpu memory. How to define core keys
> is the part where it looks like there's trouble.
>
> For my use case it would be sufficient to have current and maximum
> values for an arbitrary number of keys - one per heap. So the only
> part missing from the misc controller (for my use case) is the ability
> to register a new key at runtime as heaps are added. Instead of
> keeping track of resources with enum misc_res_type, requesting a
> resource handle/ID from the misc controller at runtime is what I think
> would be required instead.
>
Quick update: I'm going to make an attempt to modify the misc
controller to support a limited amount of dynamic resource
registration/tracking in place of the new controller in this series.

Thanks everyone for the feedback.
-T.J.

> > Thanks.
> >
> > --
> > tejun
