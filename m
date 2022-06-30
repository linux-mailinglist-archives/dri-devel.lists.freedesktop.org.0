Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2157562542
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 23:30:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C1310EC24;
	Thu, 30 Jun 2022 21:30:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F20D510EC03
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 21:30:26 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id k7so378027wrc.12
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 14:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TK13O2fc2Qey/nv0w8Yb46V++JBjODuVf0Eb/jbY6Gc=;
 b=H3MitQaRwHJtdIHW7Q0yV8AMtLIJ5fN2TAYTsv8ANTQdrxHy1APK5cKBkHMrH66THT
 tM2gjSeVpOVxY+zTrqNGHXsHf1u3Uk6g5l6nlUhuuRnKOft2rpFffn9ceeL8/E+UC4Ws
 8hF3stIJ3SQefsOUmMOuM2rzkm+pxUlRB5E6VM0Vpkq3roiIB4foy/0ueECQqIv1pvKd
 IuEXSkf5AkU+H5FM5qTVp2egIr/K2VwXMsSXHkq26joE6ICs7u1LXBw4IlsBez7roZlc
 qDA8FHIJWouhvuF6XU8Rr4URUmIOVx7N7MO9jyPBVDpEEstOvNpZsGaBoNycLzZMbIvr
 2OvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TK13O2fc2Qey/nv0w8Yb46V++JBjODuVf0Eb/jbY6Gc=;
 b=XGfO1D/dZd1gjwO6ZVm1cNnXVJ9szA0EjI2T7tCcR2au1gk0xSJqmSNVmnJ20Oh8X/
 S5MNLdkkms5gEvNmADKSl18nQejyv45TtetXsj68O8DeNuvXPHyaSlnAkT/NaUtfTc2v
 Wj1KQLhfg4RAfsbGMcXc/LpNeKgfs4D2jHCC2YvFqXbtfnQHMKQglN0CcbMNhuEfS70N
 G6aJ36bctVgwwhxn7Tvg9cbm8P3E1yiSe4dwgUxS0S+BSxaHNQ/4qdmuRGuMayosY6/d
 HiPOYxeOsGHcIsUzc3sMR6jaASsl8y1lg1otKaDmHXJs5L3/rK3HMZbN9GQMtEy8NX5s
 0cuQ==
X-Gm-Message-State: AJIora9Yj3Eke5l4UYDz4d3zEXmsrRklzAuw+icbaFTM1QhOF/nGdgXb
 Exoolnoz7xfjq1O/UnscDdxTRDJtULaKqmoWbm3YKQ==
X-Google-Smtp-Source: AGRyM1sBdFPDTyGDxyCVLXM2YiEFLpMYmDgVyNGLTnahTzUn7DUvqpAjuY+EarzFOF5+Fb7jlTi5g474LC3KMTnGpJg=
X-Received: by 2002:a5d:4304:0:b0:21b:9b2c:be34 with SMTP id
 h4-20020a5d4304000000b0021b9b2cbe34mr11026223wrq.577.1656624625307; Thu, 30
 Jun 2022 14:30:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220623220613.3014268-1-kaleshsingh@google.com>
 <20220623220613.3014268-2-kaleshsingh@google.com> <Yrrrz7MxMu8OoEPU@bfoster>
 <CAC_TJvejs5gbggC1hekyjUNctC_8+3FmVn0B7zAZox2+MkEjaA@mail.gmail.com>
 <YrxEUbDkYLE6XF6x@bfoster>
 <CAC_TJvcRd7=9xGXP5-t8v3g5iFWtYANpGA-nTqaGZBVTwa=07w@mail.gmail.com>
 <Yr2NngYE2qX8WzPV@bfoster> <Yr2RI3dJ0B4TALE5@bfoster>
In-Reply-To: <Yr2RI3dJ0B4TALE5@bfoster>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Thu, 30 Jun 2022 14:30:14 -0700
Message-ID: <CAC_TJvfpVR1ioD=S11XV4dqM0PvDBXB+CpgCwDp5RoB=BVYOKg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] procfs: Add 'size' to /proc/<pid>/fdinfo/
To: Brian Foster <bfoster@redhat.com>
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
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Stephen Brennan <stephen.s.brennan@oracle.com>,
 Paul Gortmaker <paul.gortmaker@windriver.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>,
 Christoph Hellwig <hch@infradead.org>,
 "Cc: Android Kernel" <kernel-team@android.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Suren Baghdasaryan <surenb@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 Randy Dunlap <rdunlap@infradead.org>, Ioannis Ilkos <ilkos@google.com>,
 LKML <linux-kernel@vger.kernel.org>, David.Laight@aculab.com,
 Johannes Weiner <hannes@cmpxchg.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 30, 2022 at 5:03 AM Brian Foster <bfoster@redhat.com> wrote:
>
> On Thu, Jun 30, 2022 at 07:48:46AM -0400, Brian Foster wrote:
> > On Wed, Jun 29, 2022 at 01:43:11PM -0700, Kalesh Singh wrote:
> > > On Wed, Jun 29, 2022 at 5:23 AM Brian Foster <bfoster@redhat.com> wro=
te:
> > > >
> > > > On Tue, Jun 28, 2022 at 03:38:02PM -0700, Kalesh Singh wrote:
> > > > > On Tue, Jun 28, 2022 at 4:54 AM Brian Foster <bfoster@redhat.com>=
 wrote:
> > > > > >
> > > > > > On Thu, Jun 23, 2022 at 03:06:06PM -0700, Kalesh Singh wrote:
> > > > > > > To be able to account the amount of memory a process is keepi=
ng pinned
> > > > > > > by open file descriptors add a 'size' field to fdinfo output.
> > > > > > >
> > > > > > > dmabufs fds already expose a 'size' field for this reason, re=
move this
> > > > > > > and make it a common field for all fds. This allows tracking =
of
> > > > > > > other types of memory (e.g. memfd and ashmem in Android).
> > > > > > >
> > > > > > > Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> > > > > > > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > > > > ---
> > > > > > >
> > > > > > > Changes in v2:
> > > > > > >   - Add Christian's Reviewed-by
> > > > > > >
> > > > > > > Changes from rfc:
> > > > > > >   - Split adding 'size' and 'path' into a separate patches, p=
er Christian
> > > > > > >   - Split fdinfo seq_printf into separate lines, per Christia=
n
> > > > > > >   - Fix indentation (use tabs) in documentaion, per Randy
> > > > > > >
> > > > > > >  Documentation/filesystems/proc.rst | 12 ++++++++++--
> > > > > > >  drivers/dma-buf/dma-buf.c          |  1 -
> > > > > > >  fs/proc/fd.c                       |  9 +++++----
> > > > > > >  3 files changed, 15 insertions(+), 7 deletions(-)
> > > > > > >
> > > > ...
> > > > > >
> > > > > > Also not sure if it matters that much for your use case, but so=
mething
> > > > > > worth noting at least with shmem is that one can do something l=
ike:
> > > > > >
> > > > > > # cat /proc/meminfo | grep Shmem:
> > > > > > Shmem:               764 kB
> > > > > > # xfs_io -fc "falloc -k 0 10m" ./file
> > > > > > # ls -alh file
> > > > > > -rw-------. 1 root root 0 Jun 28 07:22 file
> > > > > > # stat file
> > > > > >   File: file
> > > > > >   Size: 0               Blocks: 20480      IO Block: 4096   reg=
ular empty file
> > > > > > # cat /proc/meminfo | grep Shmem:
> > > > > > Shmem:             11004 kB
> > > > > >
> > > > > > ... where the resulting memory usage isn't reflected in i_size =
(but is
> > > > > > is in i_blocks/bytes).
> > > > >
> > > > > I tried a similar experiment a few times, but I don't see the sam=
e
> > > > > results. In my case, there is not any change in shmem. IIUC the
> > > > > fallocate is allocating the disk space not shared memory.
> > > > >
> > > >
> > > > Sorry, it was implied in my previous test was that I was running ag=
ainst
> > > > tmpfs. So regardless of fs, the fallocate keep_size semantics shown=
 in
> > > > both cases is as expected: the underlying blocks are allocated and =
the
> > > > inode size is unchanged.
> > > >
> > > > What wasn't totally clear to me when I read this patch was 1. wheth=
er
> > > > tmpfs refers to Shmem and 2. whether tmpfs allowed this sort of
> > > > operation. The test above seems to confirm both, however, right? E.=
g., a
> > > > more detailed example:
> > > >
> > > > # mount | grep /tmp
> > > > tmpfs on /tmp type tmpfs (rw,nosuid,nodev,seclabel,nr_inodes=3D1048=
576,inode64)
> > > > # cat /proc/meminfo | grep Shmem:
> > > > Shmem:              5300 kB
> > > > # xfs_io -fc "falloc -k 0 1g" /tmp/file
> > > > # stat /tmp/file
> > > >   File: /tmp/file
> > > >   Size: 0               Blocks: 2097152    IO Block: 4096   regular=
 empty file
> > > > Device: 22h/34d Inode: 45          Links: 1
> > > > Access: (0600/-rw-------)  Uid: (    0/    root)   Gid: (    0/    =
root)
> > > > Context: unconfined_u:object_r:user_tmp_t:s0
> > > > Access: 2022-06-29 08:04:01.301307154 -0400
> > > > Modify: 2022-06-29 08:04:01.301307154 -0400
> > > > Change: 2022-06-29 08:04:01.451312834 -0400
> > > >  Birth: 2022-06-29 08:04:01.301307154 -0400
> > > > # cat /proc/meminfo | grep Shmem:
> > > > Shmem:           1053876 kB
> > > > # rm -f /tmp/file
> > > > # cat /proc/meminfo | grep Shmem:
> > > > Shmem:              5300 kB
> > > >
> > > > So clearly this impacts Shmem.. was your test run against tmpfs or =
some
> > > > other (disk based) fs?
> > >
> > > Hi Brian,
> > >
> > > Thanks for clarifying. My issue was tmpfs not mounted at /tmp in my s=
ystem:
> > >
> > > =3D=3D> meminfo.start <=3D=3D
> > > Shmem:               572 kB
> > > =3D=3D> meminfo.stop <=3D=3D
> > > Shmem:             51688 kB
> > >
> >
> > Ok, makes sense.
> >
> > > >
> > > > FWIW, I don't have any objection to exposing inode size if it's com=
monly
> > > > useful information. My feedback was more just an fyi that i_size do=
esn't
> > > > necessarily reflect underlying space consumption (whether it's memo=
ry or
> > > > disk space) in more generic cases, because it sounds like that is r=
eally
> > > > what you're after here. The opposite example to the above would be
> > > > something like an 'xfs_io -fc "truncate 1t" /tmp/file', which shows=
 a
> > > > 1TB inode size with zero additional shmem usage.
> > >
> > > From these cases, it seems the more generic way to do this is by
> > > calculating the actual size consumed using the blocks. (i_blocks *
> > > 512). So in the latter example  'xfs_io -fc "truncate 1t" /tmp/file'
> > > the size consumed would be zero. Let me know if it sounds ok to you
> > > and I can repost the updated version.
> > >
> >
> > That sounds a bit more useful to me if you're interested in space usage=
,
> > or at least I don't have a better idea for you. ;)
> >
> > One thing to note is that I'm not sure whether all fs' use i_blocks
> > reliably. E.g., XFS populates stat->blocks via a separate block counter
> > in the XFS specific inode structure (see xfs_vn_getattr()). A bunch of
> > other fs' seem to touch it so perhaps that is just an outlier. You coul=
d
> > consider fixing that up, perhaps make a ->getattr() call to avoid it, o=
r
> > just use the field directly if it's useful enough as is and there are n=
o
> > other objections. Something to think about anyways..
> >

Hi Brian,

Thanks for pointing it out. Let me take a look into the xfs case.

>
> Oh, I wonder if you're looking for similar "file rss" information this
> series wants to collect/expose..?
>
> https://lore.kernel.org/linux-fsdevel/20220624080444.7619-1-christian.koe=
nig@amd.com/#r

Christian's series seems to have some overlap with what we want to
achieve here. IIUC it exposes the information on the per process
granularity. Perhaps if that approach is agreed on, I think we can use
the file_rss() f_op to expose the  per file size in the fdinfo for the
cases where the i_blocks are unreliable.

Thanks,
Kalesh

>
> Brian
>
> > Brian
> >
> > > Thanks,
> > > Kalesh
> > >
> > > >
> > > > Brian
> > > >
> > > > > cat /proc/meminfo > meminfo.start
> > > > > xfs_io -fc "falloc -k 0 50m" ./xfs_file
> > > > > cat /proc/meminfo > meminfo.stop
> > > > > tail -n +1 meminfo.st* | grep -i '=3D=3D\|Shmem:'
> > > > >
> > > > > =3D=3D> meminfo.start <=3D=3D
> > > > > Shmem:               484 kB
> > > > > =3D=3D> meminfo.stop <=3D=3D
> > > > > Shmem:               484 kB
> > > > >
> > > > > ls -lh xfs_file
> > > > > -rw------- 1 root root 0 Jun 28 15:12 xfs_file
> > > > >
> > > > > stat xfs_file
> > > > >   File: xfs_file
> > > > >   Size: 0               Blocks: 102400     IO Block: 4096   regul=
ar empty file
> > > > >
> > > > > Thanks,
> > > > > Kalesh
> > > > >
> > > > > >
> > > > > > Brian
> > > > > >
> > > > > > >
> > > > > > >       /* show_fd_locks() never deferences files so a stale va=
lue is safe */
> > > > > > >       show_fd_locks(m, file, files);
> > > > > > > --
> > > > > > > 2.37.0.rc0.161.g10f37bed90-goog
> > > > > > >
> > > > > >
> > > > >
> > > >
> > > > --
> > > > To unsubscribe from this group and stop receiving emails from it, s=
end an email to kernel-team+unsubscribe@android.com.
> > > >
> > >
>
