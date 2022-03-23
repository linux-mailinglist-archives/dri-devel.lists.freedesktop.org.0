Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 415934E5BE2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 00:37:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD2E10E1D8;
	Wed, 23 Mar 2022 23:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C1510E1D8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 23:37:20 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id r23so3741532edb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 16:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lYs3d+G/MqnkVL5mPK5nuhjYbBx01naVFSe4Xk42kfM=;
 b=lKb4AaK6N9O62KVZSBFpoXMFMKi2DX++d0hcldo7VKltrYvP1ZV+I9dYXZlx13MpxC
 U6xbiC42KS2p1EnoJU/ZpUu2VFNzNn/B5ByWL9Zt/vr5XdA+yDneUYBZIcau3mhQ0muv
 V4ah+EZCicq3OsyPu2g/e6akuJDlkHFQFQdx2jnBGU1XDVC3q67LkJ1lTpu2QD3b10Gm
 //++HMvqfQRnNJ7DQNGYM/1Pf8y6AjoqHMxScOBz3cW/cZXBbkCYsHBTNfYHMC39INi5
 cHWn+JRXaDWTnRSK6VSSXCSqWAo9ASLt+74RRIvM/eLnYs1Iz3CUqvYDSdMrTd/CQ+rq
 7Uww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lYs3d+G/MqnkVL5mPK5nuhjYbBx01naVFSe4Xk42kfM=;
 b=VkzfjjKRXUrZH0WSP/hAEVeHQBjd/KBqc04YUzyGgLyJzps0r17Q9vOusSK9wcah9Z
 L5swjZwaWent+N+cIcqycwgEcquUyETuPmmgsG3Ol5A/vZC8oLMZtIk41eqwBMxKbqjL
 Q42jB/Pf8UFZZGdz1Z5By+1TdFBNEZrEzSstzsDsR/RQ3FSLdaGRhHZAE87XilgxOvEK
 Y1xH8TksuNrrZZIkcsS/xuXkHk5HE5R+utMAtG3y+87y1sqxpAulsImS5GfkteutgEJ6
 u6QrsYsZXNzSaDHaWcl2nRTCJTdC8fC3kXr1lroNs/CpSK/UbXS/oLC3vk0WIOwaUmLo
 3mnw==
X-Gm-Message-State: AOAM533TYlj6Ak9nBaKTnzNJ3Ka+ppF6jq0LAJ1pWBg+eQqFQCgxfDtL
 qQhtQYhf1nuUvK/gJTZ1BOsN89dFGkxqw+/3eRxNDw==
X-Google-Smtp-Source: ABdhPJwADoSTh9axrzXODWW9/zmv/BOuIsIRoK4uginvkl+fxm/Pmh4atOmF02EcDNdhjJn90v29djoFR8TlCQGU8F0=
X-Received: by 2002:a50:9b4f:0:b0:419:49af:429c with SMTP id
 a15-20020a509b4f000000b0041949af429cmr3390112edj.276.1648078639171; Wed, 23
 Mar 2022 16:37:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220322095223.GG8477@blackbody.suse.cz>
 <CABdmKX2hZChBO09xfhqB7EbH6RY9JdmDp7zh23DaGuwidn=v4w@mail.gmail.com>
In-Reply-To: <CABdmKX2hZChBO09xfhqB7EbH6RY9JdmDp7zh23DaGuwidn=v4w@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 23 Mar 2022 16:37:08 -0700
Message-ID: <CABdmKX3Un=k3yU1BuCnEEoZkOqMovVrjcg=GiqDEtLZD_awX3g@mail.gmail.com>
Subject: Re: [RFC v3 5/8] dmabuf: Add gpu cgroup charge transfer function
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 linux-media@vger.kernel.org, Todd Kjos <tkjos@android.com>,
 linaro-mm-sig@lists.linaro.org, Tejun Heo <tj@kernel.org>,
 "Subject: Re: \[RFC v3 5/8\] dmabuf: Add gpu cgroup charge transfer function
 Reply-To: In-Reply-To:"
 <CABdmKX3+mTjxWzgrv44SKWT7mdGnQKMrv6c26d=iWdNPG7f1VQ@mail.gmail.com>,
 cgroups@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 Hridya Valsaraju <hridya@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 22, 2022 at 9:47 AM T.J. Mercier <tjmercier@google.com> wrote:
>
> On Tue, Mar 22, 2022 at 2:52 AM Michal Koutn=C3=BD <mkoutny@suse.com> wro=
te:
> >
> > On Mon, Mar 21, 2022 at 04:54:26PM -0700, "T.J. Mercier"
> > <tjmercier@google.com> wrote:
> > > Since the charge is duplicated in two cgroups for a short period
> > > before it is uncharged from the source cgroup I guess the situation
> > > you're thinking about is a global (or common ancestor) limit?
> >
> > The common ancestor was on my mind (after the self-shortcut).
> >
> > > I can see how that would be a problem for transfers done this way and
> > > an alternative would be to swap the order of the charge operations:
> > > first uncharge, then try_charge. To be certain the uncharge is
> > > reversible if the try_charge fails, I think I'd need either a mutex
> > > used at all gpucg_*charge call sites or access to the gpucg_mutex,
> >
> > Yes, that'd provide safe conditions for such operations, although I'm
> > not sure these special types of memory can afford global lock on their
> > fast paths.
>
> I have a benchmark I think is suitable, so let me try this change to
> the transfer implementation and see how it compares.

I added a mutex to struct gpucg which is locked when charging the
cgroup initially during allocation, and also only for the source
cgroup during dma_buf_charge_transfer. Then I used a multithreaded
benchmark where each thread allocates 4, 8, 16, or 32 DMA buffers and
then sends them through Binder to another process with charge transfer
enabled. This was intended to generate contention for the mutex in
dma_buf_charge_transfer. The results of this benchmark show that the
difference between a mutex protected charge transfer and an
unprotected charge transfer is within measurement noise. The worst
data point shows about 3% overheard for the mutex.

So I'll prep this change for the next revision. Thanks for pointing it out.
>
> >
> > > which implies adding transfer support to gpu.c as part of the gpucg_*
> > > API itself and calling it here. Am I following correctly here?
> >
> > My idea was to provide a special API (apart from
> > gpucp_{try_charge,uncharge}) to facilitate transfers...
> >
> > > This series doesn't actually add limit support just accounting, but
> > > I'd like to get it right here.
> >
> > ...which could be implemented (or changed) depending on how the chargin=
g
> > is realized internally.
> >
> >
> > Michal
