Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E41454CF3E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 19:00:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE7E112624;
	Wed, 15 Jun 2022 17:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248E6112622
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 17:00:28 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id u8so16162631wrm.13
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 10:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pr7/sSYVOXPdtGS1/T+T8Lqb0MTvzV5EwQqM4oOBt7M=;
 b=RGjh36gsbSL7V2Cy2m2NjJhaQAc9PMFRxBITRzbJo0e6uQYU2PYDC5NLnQ+yGyDl+R
 0zS71FKcfX5hIOSm8TbBXXs4Lfr/g8YMMGK1+H7L0MHHJ4ERPJnOAiuvX9kjV/6/j5Jf
 680iSXj86QecnfayPEJekK0udeX/yNBxkmuLB73Bj7pk1WJkjC4f6VHX7hiLma5UpuCU
 3V8UHCvzboc1/yrqh8ZW3uLcljQHUwyDtBrjgE/WcQOhhxXOIOYHrY676rcuM4sVZhGn
 M8SyyBbMOXfe2nTSiGRVqHzLG6gokbEVq5KPRFXRH/NNheY3zwpuJxDGd0jNQRIA3ntp
 L5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pr7/sSYVOXPdtGS1/T+T8Lqb0MTvzV5EwQqM4oOBt7M=;
 b=UQg+QQtKVqCfc/BO8Wc/IHcVof6ISU6WQJzX+hvq0vqJOr7g79W7aZfy9qF7naVmst
 wBCMk6fWL0pbg2rGhj2dUFCNHaUfCEIO4jIThu+7yO70wuAM0EN61feqIhn8IRTBCcat
 d+o/R/u21DBHhfgYjnhjLf+0xlvbO9OC4yZAYttO2bPzsx0cgr35rqyczj0CWTXx4Tns
 gJv7Fd4V6MbGi/6OL2WKgu20pLw6y8Fh9ll7qcKar5UAGr3Gkb3eJ4jI6JGsZoT3mayb
 CDfqbCRIFFRx7wqpOSa5MkyCT9tkXN5eHO0lVyOq1JXzmMwkeTTducWTg/SxKsz8Gciv
 gfuQ==
X-Gm-Message-State: AJIora+cdxqekbLeWXiQQsOiYnNM7sCeqwHv9hAfHbOshjqAE/RMrX6l
 2YHLBrYYloTiGOqEjV3IAaCYKyJI2dbmuhs8/HJLew==
X-Google-Smtp-Source: AGRyM1uB0UDMl9b/896cLH/y+hwYakenLps6KtvwAg3Fh2+Uxwu1swfsOSTeK8iwAI8IasAO3ym5N1xcQXZHz/gUbP8=
X-Received: by 2002:a05:6000:18a9:b0:218:7791:a9ad with SMTP id
 b9-20020a05600018a900b002187791a9admr777565wri.116.1655312425754; Wed, 15 Jun
 2022 10:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220531212521.1231133-1-kaleshsingh@google.com>
 <20220531212521.1231133-3-kaleshsingh@google.com>
 <14f85d24-a9de-9706-32f0-30be4999c71c@oracle.com>
 <CAC_TJveDzDaYQKmuLSkGWpnuCW+gvrqdVJqq=wbzoTRjw4OoFw@mail.gmail.com>
 <875yll1fp1.fsf@stepbren-lnx.us.oracle.com>
 <4b79c2ea-dd1a-623d-e5b4-faa732c1a42d@gmail.com>
 <CAC_TJvdU=bhaeJACz70JOAL34W846Bk=EmvkXL8ccfoALJdaOQ@mail.gmail.com>
In-Reply-To: <CAC_TJvdU=bhaeJACz70JOAL34W846Bk=EmvkXL8ccfoALJdaOQ@mail.gmail.com>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Wed, 15 Jun 2022 10:00:14 -0700
Message-ID: <CAC_TJvd6znLxqRON8DTxwsFKmDh_crQyzWmBugS7JPFrPn12Vw@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH 2/2] procfs: Add 'path' to
 /proc/<pid>/fdinfo/
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@infradead.org>
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
 David Hildenbrand <david@redhat.com>,
 "Cc: Android Kernel" <kernel-team@android.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Suren Baghdasaryan <surenb@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 Randy Dunlap <rdunlap@infradead.org>, Ioannis Ilkos <ilkos@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Colin Cross <ccross@google.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 1, 2022 at 8:31 PM Kalesh Singh <kaleshsingh@google.com> wrote:
>
> On Wed, Jun 1, 2022 at 8:02 AM Christian K=C3=B6nig
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > Am 01.06.22 um 00:48 schrieb Stephen Brennan:
> > > Kalesh Singh <kaleshsingh@google.com> writes:
> > >> On Tue, May 31, 2022 at 3:07 PM Stephen Brennan
> > >> <stephen.s.brennan@oracle.com> wrote:
> > >>> On 5/31/22 14:25, Kalesh Singh wrote:
> > >>>> In order to identify the type of memory a process has pinned throu=
gh
> > >>>> its open fds, add the file path to fdinfo output. This allows
> > >>>> identifying memory types based on common prefixes. e.g. "/memfd...=
",
> > >>>> "/dmabuf...", "/dev/ashmem...".
> > >>>>
> > >>>> Access to /proc/<pid>/fdinfo is governed by PTRACE_MODE_READ_FSCRE=
DS
> > >>>> the same as /proc/<pid>/maps which also exposes the file path of
> > >>>> mappings; so the security permissions for accessing path is consis=
tent
> > >>>> with that of /proc/<pid>/maps.
> > >>> Hi Kalesh,
> > >> Hi Stephen,
> > >>
> > >> Thanks for taking a look.
> > >>
> > >>> I think I see the value in the size field, but I'm curious about pa=
th,
> > >>> which is available via readlink /proc/<pid>/fd/<n>, since those are
> > >>> symlinks to the file themselves.
> > >> This could work if we are root, but the file permissions wouldn't
> > >> allow us to do the readlink on other processes otherwise. We want to
> > >> be able to capture the system state in production environments from
> > >> some trusted process with ptrace read capability.
> > > Interesting, thanks for explaining. It seems weird to have a duplicat=
e
> > > interface for the same information but such is life.
> >
> > Yeah, the size change is really straight forward but for this one I'm
> > not 100% sure either.
>
> The 2 concerns I think are:
>   1. Fun characters in the path names
>   2. If exposing the path is appropriate to begin with.
>
> One way I think we can address both is to only expose the path for
> anon inodes. Then we have well-known path formats and we don't expose
> much about which files a process is accessing since these aren't real
> paths.
>
> +       if (is_anon_inode(inode)) {
> +               seq_puts(m, "path:\t");
> +               seq_file_path(m, file, "\n");
> +               seq_putc(m, '\n');
> +       }
>
> Interested to hear thoughts on it.

Adding Christoph,

To be able to identify types of shared memory processes pin through
FDs in production builds, we would like to add a 'path' field to
fdinfo of anon inodes. We could then use the common prefixes
("/dmabuf", "/memfd", ...) to identify different types.

Would appreciate any feedback from the FS perspective.

Thanks,
Kalesh

>
> >
> > Probably best to ping some core fs developer before going further with =
it.
>
> linux-fsdevel is cc'd here. Adding Al Vrio as well. Please let me know
> if there are other parties I should include.
>
> >
> > BTW: Any preferred branch to push this upstream? If not I can take it
> > through drm-misc-next.
>
> No other dependencies for this, so drm-misc-next is good.
>
> Thanks,
> Kalesh
>
> >
> > Regards,
> > Christian.
> >
> > >
> > >>> File paths can contain fun characters like newlines or colons, whic=
h
> > >>> could make parsing out filenames in this text file... fun. How woul=
d your
> > >>> userspace parsing logic handle "/home/stephen/filename\nsize:\t4096=
"? The
> > >>> readlink(2) API makes that easy already.
> > >> I think since we have escaped the "\n" (seq_file_path(m, file, "\n")=
),
> > > I really should have read through that function before commenting,
> > > thanks for teaching me something new :)
> > >
> > > Stephen
> > >
> > >> then user space might parse this line like:
> > >>
> > >> if (strncmp(line, "path:\t", 6) =3D=3D 0)
> > >>          char* path =3D line + 6;
> > >>
> > >>
> > >> Thanks,
> > >> Kalesh
> > >>
> > >>> Is the goal avoiding races (e.g. file descriptor 3 is closed and re=
opened
> > >>> to a different path between reading fdinfo and stating the fd)?
> > >>>
> > >>> Stephen
> > >>>
> > >>>> Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> > >>>> ---
> > >>>>
> > >>>> Changes from rfc:
> > >>>>    - Split adding 'size' and 'path' into a separate patches, per C=
hristian
> > >>>>    - Fix indentation (use tabs) in documentaion, per Randy
> > >>>>
> > >>>>   Documentation/filesystems/proc.rst | 14 ++++++++++++--
> > >>>>   fs/proc/fd.c                       |  4 ++++
> > >>>>   2 files changed, 16 insertions(+), 2 deletions(-)
> > >>>>
> > >>>> diff --git a/Documentation/filesystems/proc.rst b/Documentation/fi=
lesystems/proc.rst
> > >>>> index 779c05528e87..591f12d30d97 100644
> > >>>> --- a/Documentation/filesystems/proc.rst
> > >>>> +++ b/Documentation/filesystems/proc.rst
> > >>>> @@ -1886,14 +1886,16 @@ if precise results are needed.
> > >>>>   3.8  /proc/<pid>/fdinfo/<fd> - Information about opened file
> > >>>>   ---------------------------------------------------------------
> > >>>>   This file provides information associated with an opened file. T=
he regular
> > >>>> -files have at least five fields -- 'pos', 'flags', 'mnt_id', 'ino=
', and 'size'.
> > >>>> +files have at least six fields -- 'pos', 'flags', 'mnt_id', 'ino'=
, 'size',
> > >>>> +and 'path'.
> > >>>>
> > >>>>   The 'pos' represents the current offset of the opened file in de=
cimal
> > >>>>   form [see lseek(2) for details], 'flags' denotes the octal O_xxx=
 mask the
> > >>>>   file has been created with [see open(2) for details] and 'mnt_id=
' represents
> > >>>>   mount ID of the file system containing the opened file [see 3.5
> > >>>>   /proc/<pid>/mountinfo for details]. 'ino' represents the inode n=
umber of
> > >>>> -the file, and 'size' represents the size of the file in bytes.
> > >>>> +the file, 'size' represents the size of the file in bytes, and 'p=
ath'
> > >>>> +represents the file path.
> > >>>>
> > >>>>   A typical output is::
> > >>>>
> > >>>> @@ -1902,6 +1904,7 @@ A typical output is::
> > >>>>        mnt_id: 19
> > >>>>        ino:    63107
> > >>>>        size:   0
> > >>>> +     path:   /dev/null
> > >>>>
> > >>>>   All locks associated with a file descriptor are shown in its fdi=
nfo too::
> > >>>>
> > >>>> @@ -1920,6 +1923,7 @@ Eventfd files
> > >>>>        mnt_id: 9
> > >>>>        ino:    63107
> > >>>>        size:   0
> > >>>> +     path:   anon_inode:[eventfd]
> > >>>>        eventfd-count:  5a
> > >>>>
> > >>>>   where 'eventfd-count' is hex value of a counter.
> > >>>> @@ -1934,6 +1938,7 @@ Signalfd files
> > >>>>        mnt_id: 9
> > >>>>        ino:    63107
> > >>>>        size:   0
> > >>>> +     path:   anon_inode:[signalfd]
> > >>>>        sigmask:        0000000000000200
> > >>>>
> > >>>>   where 'sigmask' is hex value of the signal mask associated
> > >>>> @@ -1949,6 +1954,7 @@ Epoll files
> > >>>>        mnt_id: 9
> > >>>>        ino:    63107
> > >>>>        size:   0
> > >>>> +     path:   anon_inode:[eventpoll]
> > >>>>        tfd:        5 events:       1d data: ffffffffffffffff pos:0=
 ino:61af sdev:7
> > >>>>
> > >>>>   where 'tfd' is a target file descriptor number in decimal form,
> > >>>> @@ -1968,6 +1974,7 @@ For inotify files the format is the followin=
g::
> > >>>>        mnt_id: 9
> > >>>>        ino:    63107
> > >>>>        size:   0
> > >>>> +     path:   anon_inode:inotify
> > >>>>        inotify wd:3 ino:9e7e sdev:800013 mask:800afce ignored_mask=
:0 fhandle-bytes:8 fhandle-type:1 f_handle:7e9e0000640d1b6d
> > >>>>
> > >>>>   where 'wd' is a watch descriptor in decimal form, i.e. a target =
file
> > >>>> @@ -1992,6 +1999,7 @@ For fanotify files the format is::
> > >>>>        mnt_id: 9
> > >>>>        ino:    63107
> > >>>>        size:   0
> > >>>> +     path:   anon_inode:[fanotify]
> > >>>>        fanotify flags:10 event-flags:0
> > >>>>        fanotify mnt_id:12 mflags:40 mask:38 ignored_mask:40000003
> > >>>>        fanotify ino:4f969 sdev:800013 mflags:0 mask:3b ignored_mas=
k:40000000 fhandle-bytes:8 fhandle-type:1 f_handle:69f90400c275b5b4
> > >>>> @@ -2018,6 +2026,7 @@ Timerfd files
> > >>>>        mnt_id: 9
> > >>>>        ino:    63107
> > >>>>        size:   0
> > >>>> +     path:   anon_inode:[timerfd]
> > >>>>        clockid: 0
> > >>>>        ticks: 0
> > >>>>        settime flags: 01
> > >>>> @@ -2042,6 +2051,7 @@ DMA Buffer files
> > >>>>        mnt_id: 9
> > >>>>        ino:    63107
> > >>>>        size:   32768
> > >>>> +     path:   /dmabuf:
> > >>>>        count:  2
> > >>>>        exp_name:  system-heap
> > >>>>
> > >>>> diff --git a/fs/proc/fd.c b/fs/proc/fd.c
> > >>>> index 464bc3f55759..8889a8ba09d4 100644
> > >>>> --- a/fs/proc/fd.c
> > >>>> +++ b/fs/proc/fd.c
> > >>>> @@ -60,6 +60,10 @@ static int seq_show(struct seq_file *m, void *v=
)
> > >>>>        seq_printf(m, "ino:\t%lu\n", file_inode(file)->i_ino);
> > >>>>        seq_printf(m, "size:\t%lli\n", (long long)file_inode(file)-=
>i_size);
> > >>>>
> > >>>> +     seq_puts(m, "path:\t");
> > >>>> +     seq_file_path(m, file, "\n");
> > >>>> +     seq_putc(m, '\n');
> > >>>> +
> > >>>>        /* show_fd_locks() never deferences files so a stale value =
is safe */
> > >>>>        show_fd_locks(m, file, files);
> > >>>>        if (seq_has_overflowed(m))
> > >>> --
> > >>> To unsubscribe from this group and stop receiving emails from it, s=
end an email to kernel-team+unsubscribe@android.com.
> > >>>
> > > _______________________________________________
> > > Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> > > To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org
> >
