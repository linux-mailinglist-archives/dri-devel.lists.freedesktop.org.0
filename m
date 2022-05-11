Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B307C523EEC
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 22:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7566010FF45;
	Wed, 11 May 2022 20:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C411810FF3E
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 20:31:34 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id l18so6293784ejc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 13:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NtnsiSlzAsgk6JSDuHz/1OPfXFBF7aKsHI2VLVjE4mA=;
 b=i3i7R0BIr+3+EJlo4/FKvf6VjOLkaPM7rKKI+8dqKMsTaNxwWnv3LE8BGwOnIDDGAK
 NsE1xSDPzAHSynn+8De9PJm+Tyzj3SNS5c7VTGsrF2quHbe42sxZXMkT4g9IXuHRLOs8
 4eSvkpyTauQtKOR6F8INy6pUpAgsuvayvRY2KuD3+A0V4ZqRWWf9Nqv4Ltw3a/OISyhX
 8JB9/NNhniJvfAMsxNjnOORqf0K8cR+gA3mLFBg7I8Yb4NKtpL7PK8Dlr07rJU1CtfjT
 VF4cY0bfevbmzz+g4wFAGQSIlj7aEMd4y63rh0VNzb6nfUtS9GyBB851W+0Rb1umA8q5
 KOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NtnsiSlzAsgk6JSDuHz/1OPfXFBF7aKsHI2VLVjE4mA=;
 b=S2WrU/xAE+C7VfKyTzU5p7fuR3Uz2j6Agu+v9TLHcFqzlnvL5i7iLKzw/U52IRn7Nz
 /uAKISb3+6BNpDE0V3pKlbf1Jy67ZT3ZLSv5ZGqP/o/zwhDXfY/DygibUoj5jIYiHZn2
 5BuaDgqqlN48urErusdMrIgwrSIBREShNMrFXD6LHOTszVNIuAfHsyRhdfjyODixfKgn
 exYh0MJEBIZWxzaEdDowVQQ8t56CureMO8/9awj6pr3Ce6+i83KD/jz0MFZmKd8PO2R7
 FUxoP6mO9JOAFIdWlYyGoQ7jpK4Di5qQ6FPUgoWP5Fz212fAY0bUe1mwoeU+1edyL13j
 IW0Q==
X-Gm-Message-State: AOAM5300sP7ChAy8+3NwSZLYLVwHlwH9YpsPz5RVZi5RKgqXAAzPKQqL
 D9gUfaHlrds82U0lfxFs5eUwDbUGqJzkZBDllconVQ==
X-Google-Smtp-Source: ABdhPJxb/XjzBnmW9iYFi84Q/OyDUGaQMVPDhuq+gFp43QSLMsQYymDs1HWXTy6XgO9awgEqB2nLCu3Z5kq/j2+eFnc=
X-Received: by 2002:a17:907:9606:b0:6f3:f999:ed82 with SMTP id
 gb6-20020a170907960600b006f3f999ed82mr26746141ejc.368.1652301093047; Wed, 11
 May 2022 13:31:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220510235653.933868-1-tjmercier@google.com>
 <3365cd1d750e84fedc8e75d646a77ffd85619d35.camel@ndufresne.ca>
In-Reply-To: <3365cd1d750e84fedc8e75d646a77ffd85619d35.camel@ndufresne.ca>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 11 May 2022 13:31:20 -0700
Message-ID: <CABdmKX3ZV6-u-oLvW_wWavAMBfrsZ=C_rCgK_Uz4VjxcRvRFew@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] Proposal for a GPU cgroup controller
To: Nicolas Dufresne <nicolas@ndufresne.ca>
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
Cc: linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 Carlos Llamas <cmllamas@google.com>, dri-devel@lists.freedesktop.org,
 John Stultz <jstultz@google.com>, Zefan Li <lizefan.x@bytedance.com>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Kenny.Ho@amd.com, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>, Martijn Coenen <maco@android.com>,
 Laura Abbott <labbott@redhat.com>, kernel-team@android.com,
 linux-media@vger.kernel.org, Todd Kjos <tkjos@android.com>,
 linaro-mm-sig@lists.linaro.org, Hridya Valsaraju <hridya@google.com>,
 Shuah Khan <skhan@linuxfoundation.org>, cgroups@vger.kernel.org,
 Suren Baghdasaryan <surenb@google.com>, Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 11, 2022 at 6:21 AM Nicolas Dufresne <nicolas@ndufresne.ca> wro=
te:
>
> Hi,
>
> Le mardi 10 mai 2022 =C3=A0 23:56 +0000, T.J. Mercier a =C3=A9crit :
> > This patch series revisits the proposal for a GPU cgroup controller to
> > track and limit memory allocations by various device/allocator
> > subsystems. The patch series also contains a simple prototype to
> > illustrate how Android intends to implement DMA-BUF allocator
> > attribution using the GPU cgroup controller. The prototype does not
> > include resource limit enforcements.
>
> I'm sorry, since I'm not in-depth technically involve. But from reading t=
he
> topic I don't understand the bound this creates between DMABuf Heaps and =
GPU. Is
> this an attempt to really track the DMABuf allocated by userland, or just
> something for GPU ? What about V4L2 devices ? Any way this can be clarifi=
ed,
> specially what would other subsystem needs to have cgroup DMABuf allocati=
on
> controller support ?
>
Hi Nicolas,

The link between dmabufs, dmabuf heaps, and "GPU memory" is maybe
somewhat of an Androidism. However this change aims to be usable for
tracking all GPU related allocations. It's just that this initial
series only adds support for tracking dmabufs allocated from dmabuf
heaps.

In Android most graphics buffers are dma buffers allocated from a
dmabuf heap, so that is why these dmabuf heap allocations are being
tracked under the GPU cgroup. Other dmabuf exporters like V4L2 might
also want to track their buffers, but would probably want to do so
under a bucket name of something like "v4l2". Same goes for GEM
dmabufs. The naming scheme for this is still yet to be decided. It
would be cool to be able to attribute memory at the driver level, or
even different types of memory at the driver level, but I imagine
there is a point of diminishing returns for fine-grained
naming/bucketing.

So far, I haven't tried to create a strict definition of what is and
is not "GPU memory" for the purpose of this accounting, so I don't
think we should be restricted to tracking just dmabufs. I don't see
why this couldn't be anything a driver wants to consider as GPU memory
as long as it is named/bucketed appropriately, such as both on-package
graphics card memory use and CPU memory dedicated for graphics use
like for host/device transfers.

Is that helpful?

Best,
T.J.

> >
> > Changelog:
> > v7:
> > Hide gpucg and gpucg_bucket struct definitions per Michal Koutn=C3=BD.
> > This means gpucg_register_bucket now returns an internally allocated
> > struct gpucg_bucket.
> >
> > Move all public function documentation to the cgroup_gpu.h header.
> >
> > Remove comment in documentation about duplicate name rejection which
> > is not relevant to cgroups users per Michal Koutn=C3=BD.
> >
> > v6:
> > Move documentation into cgroup-v2.rst per Tejun Heo.
> >
> > Rename BINDER_FD{A}_FLAG_SENDER_NO_NEED ->
> > BINDER_FD{A}_FLAG_XFER_CHARGE per Carlos Llamas.
> >
> > Return error on transfer failure per Carlos Llamas.
> >
> > v5:
> > Rebase on top of v5.18-rc3
> >
> > Drop the global GPU cgroup "total" (sum of all device totals) portion
> > of the design since there is no currently known use for this per
> > Tejun Heo.
> >
> > Fix commit message which still contained the old name for
> > dma_buf_transfer_charge per Michal Koutn=C3=BD.
> >
> > Remove all GPU cgroup code except what's necessary to support charge tr=
ansfer
> > from dma_buf. Previously charging was done in export, but for non-Andro=
id
> > graphics use-cases this is not ideal since there may be a delay between
> > allocation and export, during which time there is no accounting.
> >
> > Merge dmabuf: Use the GPU cgroup charge/uncharge APIs patch into
> > dmabuf: heaps: export system_heap buffers with GPU cgroup charging as a
> > result of above.
> >
> > Put the charge and uncharge code in the same file (system_heap_allocate=
,
> > system_heap_dma_buf_release) instead of splitting them between the heap=
 and
> > the dma_buf_release. This avoids asymmetric management of the gpucg cha=
rges.
> >
> > Modify the dma_buf_transfer_charge API to accept a task_struct instead
> > of a gpucg. This avoids requiring the caller to manage the refcount
> > of the gpucg upon failure and confusing ownership transfer logic.
> >
> > Support all strings for gpucg_register_bucket instead of just string
> > literals.
> >
> > Enforce globally unique gpucg_bucket names.
> >
> > Constrain gpucg_bucket name lengths to 64 bytes.
> >
> > Append "-heap" to gpucg_bucket names from dmabuf-heaps.
> >
> > Drop patch 7 from the series, which changed the types of
> > binder_transaction_data's sender_pid and sender_euid fields. This was
> > done in another commit here:
> > https://lore.kernel.org/all/20220210021129.3386083-4-masahiroy@kernel.o=
rg/
> >
> > Rename:
> >   gpucg_try_charge -> gpucg_charge
> >   find_cg_rpool_locked -> cg_rpool_find_locked
> >   init_cg_rpool -> cg_rpool_init
> >   get_cg_rpool_locked -> cg_rpool_get_locked
> >   "gpu cgroup controller" -> "GPU controller"
> >   gpucg_device -> gpucg_bucket
> >   usage -> size
> >
> > Tests:
> >   Support both binder_fd_array_object and binder_fd_object. This is
> >   necessary because new versions of Android will use binder_fd_object
> >   instead of binder_fd_array_object, and we need to support both.
> >
> >   Tests for both binder_fd_array_object and binder_fd_object.
> >
> >   For binder_utils return error codes instead of
> >   struct binder{fs}_ctx.
> >
> >   Use ifdef __ANDROID__ to choose platform-dependent temp path instead
> >   of a runtime fallback.
> >
> >   Ensure binderfs_mntpt ends with a trailing '/' character instead of
> >   prepending it where used.
> >
> > v4:
> > Skip test if not run as root per Shuah Khan
> >
> > Add better test logging for abnormal child termination per Shuah Khan
> >
> > Adjust ordering of charge/uncharge during transfer to avoid potentially
> > hitting cgroup limit per Michal Koutn=C3=BD
> >
> > Adjust gpucg_try_charge critical section for charge transfer functional=
ity
> >
> > Fix uninitialized return code error for dmabuf_try_charge error case
> >
> > v3:
> > Remove Upstreaming Plan from gpu-cgroup.rst per John Stultz
> >
> > Use more common dual author commit message format per John Stultz
> >
> > Remove android from binder changes title per Todd Kjos
> >
> > Add a kselftest for this new behavior per Greg Kroah-Hartman
> >
> > Include details on behavior for all combinations of kernel/userspace
> > versions in changelog (thanks Suren Baghdasaryan) per Greg Kroah-Hartma=
n.
> >
> > Fix pid and uid types in binder UAPI header
> >
> > v2:
> > See the previous revision of this change submitted by Hridya Valsaraju
> > at: https://lore.kernel.org/all/20220115010622.3185921-1-hridya@google.=
com/
> >
> > Move dma-buf cgroup charge transfer from a dma_buf_op defined by every
> > heap to a single dma-buf function for all heaps per Daniel Vetter and
> > Christian K=C3=B6nig. Pointers to struct gpucg and struct gpucg_device
> > tracking the current associations were added to the dma_buf struct to
> > achieve this.
> >
> > Fix incorrect Kconfig help section indentation per Randy Dunlap.
> >
> > History of the GPU cgroup controller
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > The GPU/DRM cgroup controller came into being when a consensus[1]
> > was reached that the resources it tracked were unsuitable to be integra=
ted
> > into memcg. Originally, the proposed controller was specific to the DRM
> > subsystem and was intended to track GEM buffers and GPU-specific
> > resources[2]. In order to help establish a unified memory accounting mo=
del
> > for all GPU and all related subsystems, Daniel Vetter put forth a
> > suggestion to move it out of the DRM subsystem so that it can be used b=
y
> > other DMA-BUF exporters as well[3]. This RFC proposes an interface that
> > does the same.
> >
> > [1]: https://patchwork.kernel.org/project/dri-devel/cover/2019050114043=
8.9506-1-brian.welty@intel.com/#22624705
> > [2]: https://lore.kernel.org/amd-gfx/20210126214626.16260-1-brian.welty=
@intel.com/
> > [3]: https://lore.kernel.org/amd-gfx/YCVOl8%2F87bqRSQei@phenom.ffwll.lo=
cal/
> >
> > Hridya Valsaraju (3):
> >   gpu: rfc: Proposal for a GPU cgroup controller
> >   cgroup: gpu: Add a cgroup controller for allocator attribution of GPU
> >     memory
> >   binder: Add flags to relinquish ownership of fds
> >
> > T.J. Mercier (3):
> >   dmabuf: heaps: export system_heap buffers with GPU cgroup charging
> >   dmabuf: Add gpu cgroup charge transfer function
> >   selftests: Add binder cgroup gpu memory transfer tests
> >
> >  Documentation/admin-guide/cgroup-v2.rst       |  23 +
> >  drivers/android/binder.c                      |  31 +-
> >  drivers/dma-buf/dma-buf.c                     |  80 ++-
> >  drivers/dma-buf/dma-heap.c                    |  38 ++
> >  drivers/dma-buf/heaps/system_heap.c           |  28 +-
> >  include/linux/cgroup_gpu.h                    | 146 +++++
> >  include/linux/cgroup_subsys.h                 |   4 +
> >  include/linux/dma-buf.h                       |  49 +-
> >  include/linux/dma-heap.h                      |  15 +
> >  include/uapi/linux/android/binder.h           |  23 +-
> >  init/Kconfig                                  |   7 +
> >  kernel/cgroup/Makefile                        |   1 +
> >  kernel/cgroup/gpu.c                           | 390 +++++++++++++
> >  .../selftests/drivers/android/binder/Makefile |   8 +
> >  .../drivers/android/binder/binder_util.c      | 250 +++++++++
> >  .../drivers/android/binder/binder_util.h      |  32 ++
> >  .../selftests/drivers/android/binder/config   |   4 +
> >  .../binder/test_dmabuf_cgroup_transfer.c      | 526 ++++++++++++++++++
> >  18 files changed, 1632 insertions(+), 23 deletions(-)
> >  create mode 100644 include/linux/cgroup_gpu.h
> >  create mode 100644 kernel/cgroup/gpu.c
> >  create mode 100644 tools/testing/selftests/drivers/android/binder/Make=
file
> >  create mode 100644 tools/testing/selftests/drivers/android/binder/bind=
er_util.c
> >  create mode 100644 tools/testing/selftests/drivers/android/binder/bind=
er_util.h
> >  create mode 100644 tools/testing/selftests/drivers/android/binder/conf=
ig
> >  create mode 100644 tools/testing/selftests/drivers/android/binder/test=
_dmabuf_cgroup_transfer.c
> >
>
