Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D6F7800F5
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 00:18:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8378910E125;
	Thu, 17 Aug 2023 22:18:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [IPv6:2607:f8b0:4864:20::a2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA83C10E125
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 22:18:47 +0000 (UTC)
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-48adb3677d3so84635e0c.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 15:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1692310726; x=1692915526;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i90jKdNjvYHfOh8lmPDp40Qdp095YCdh1Oy/+Cvt5J4=;
 b=nzRIbPr05yBxns7Ih/cfXcZJ30f+k1kQZlBxBe2yWnkmc9ysAOdx9pXxuvy5SYpvc3
 +u0MfgV71NhJualJhPYe5Xad/yI7An051nCYOvcshM/+JCtph42QKThML1xR1ERXrVZY
 2s5552xNfD1RblGd5AXsfUZ7n5qvSTZRRt/XBYLmDnMK/fG1nMyQvbYOVtS9QvXKNXGg
 BQjS8494d4cFQvMCgONrVePKljTc3VA88SfKjYSzbJrRYBZOLecuxu78FCpdwew70Kx1
 UxejfnKPH+oYpEzqUDKLHzrUqaTCuHDXvKolh445LRugaIAwVaRw2/Gr6+ssL9DLVr/0
 VeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692310726; x=1692915526;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i90jKdNjvYHfOh8lmPDp40Qdp095YCdh1Oy/+Cvt5J4=;
 b=C3/41F1He4oemA3UPvIgpe0KODe5Q3Y6FP6efIV8PYhp5j/PUpKDG4tebjFXgSkeAR
 4rdtDWYlcWDH5RhJRKeuinO4AtwUPiLntODeEH9nvAt92KfHfGBoPOkj8L8YSyvqnn96
 mDjkhLl7CX/zIlD3QC/Nxvr9Z3mJf4Fcp+1SuIM0OhiR72Ri07ui9hoTjzPlVLpk5XlL
 Wv1eZ/OLQdwe3ZQqTU0qU1Q1d0Cx7w8KYdpGfLE2Dup7cRijPDJYiBYH4VFIZw9p1Ze6
 8U7rP82Ff4WZtiFrmDDEBqSzpMierp9xxghVoBUdv41dkGk5DGbANCwxXrxEr7JQvrtV
 JM+g==
X-Gm-Message-State: AOJu0YxLRodqLUlLi1lygd5RpliM+pnqvXgqQm1QpAupi8PfbMENbaAU
 2DLpulXhuqMN4Jtgm5JE8uy0GkkpTjYyqaRYnMQhhg==
X-Google-Smtp-Source: AGHT+IHxiahQBibd9E5tQcywrVqF/Dce4Pc5zTgH7kI9+WMihsI2390MeC2HVHwqce1iFLC7pwbzbsRWAEGIIPh2JH8=
X-Received: by 2002:a67:f343:0:b0:447:4cb2:74fd with SMTP id
 p3-20020a67f343000000b004474cb274fdmr1190943vsm.8.1692310726590; Thu, 17 Aug
 2023 15:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230810015751.3297321-1-almasrymina@google.com>
 <7dc4427f-ee99-e401-9ff8-d554999e60ca@kernel.org>
 <7889b4f8-78d9-9a0a-e2cc-aae4ed8a80fd@gmail.com>
In-Reply-To: <7889b4f8-78d9-9a0a-e2cc-aae4ed8a80fd@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 17 Aug 2023 15:18:35 -0700
Message-ID: <CAHS8izNZ1pJAFqa-3FPiUdMWEPE_md2vP1-6t-KPT6CPbO03+g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/11] Device Memory TCP
To: Pavel Begunkov <asml.silence@gmail.com>
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
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, David Wei <dw@davidwei.uk>,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 stephen@networkplumber.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Eric Dumazet <edumazet@google.com>, sdf@google.com,
 Andy Lutomirski <luto@kernel.org>, Hari Ramakrishnan <rharix@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 17, 2023 at 11:04=E2=80=AFAM Pavel Begunkov <asml.silence@gmail=
.com> wrote:
>
> On 8/14/23 02:12, David Ahern wrote:
> > On 8/9/23 7:57 PM, Mina Almasry wrote:
> >> Changes in RFC v2:
> >> ------------------
> ...
> >> ** Test Setup
> >>
> >> Kernel: net-next with this RFC and memory provider API cherry-picked
> >> locally.
> >>
> >> Hardware: Google Cloud A3 VMs.
> >>
> >> NIC: GVE with header split & RSS & flow steering support.
> >
> > This set seems to depend on Jakub's memory provider patches and a netde=
v
> > driver change which is not included. For the testing mentioned here, yo=
u
> > must have a tree + branch with all of the patches. Is it publicly avail=
able?
> >
> > It would be interesting to see how well (easy) this integrates with
> > io_uring. Besides avoiding all of the syscalls for receiving the iov an=
d
> > releasing the buffers back to the pool, io_uring also brings in the
> > ability to seed a page_pool with registered buffers which provides a
> > means to get simpler Rx ZC for host memory.
>
> The patchset sounds pretty interesting. I've been working with David Wei
> (CC'ing) on io_uring zc rx (prototype polishing stage) all that is old
> similar approaches based on allocating an rx queue. It targets host
> memory and device memory as an extra feature, uapi is different, lifetime=
s
> are managed/bound to io_uring. Completions/buffers are returned to user v=
ia
> a separate queue instead of cmsg, and pushed back granularly to the kerne=
l
> via another queue. I'll leave it to David to elaborate
>
> It sounds like we have space for collaboration here, if not merging then
> reusing internals as much as we can, but we'd need to look into the
> details deeper.
>

I'm happy to look at your implementation and collaborate on something
that works for both use cases. Feel free to share unpolished prototype
so I can start having a general idea if possible.

> > Overall I like the intent and possibilities for extensions, but a lot o=
f
> > details are missing - perhaps some are answered by seeing an end-to-end
> > implementation.
>
> --
> Pavel Begunkov



--=20
Thanks,
Mina
