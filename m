Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFB3553825
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 18:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D923410E03A;
	Tue, 21 Jun 2022 16:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49ED310E123
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 16:45:37 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id n185so7815497wmn.4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 09:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=V4bwUD9URAvG9TnC6bTvCel9nYIn8pBzaujJmJwjfWg=;
 b=OwGj9wf+/UPr5RAu60UVuMseqK5Za5SxdkXYGVGq+OPG0i+ltlI3VfEizOlZ80sHsV
 VlouhI+GNZHc1M1tX3eSGszwDA4OH5e6WmDAbIxkTspZW7ZYX4Ca3dfCCoUKVPgGg8gw
 F4JGOY6HC+h6WR1I2BQqBsNZrkue4/4y2q5gcRnis1NbAdJJQRnj4Mirp5rjgv6oQ6eb
 h3invfU2IDlZfJicATADd6hEQ/ROwCA2WPHhZYtRbkiedsf2h/V+5pcx2fochIh/4sBW
 Q1BYLww12muZYdnTBw0YiTwWEEjqhojS5WQOMg2cA7VYC57fsezA7E9H3drUyW45Gg1R
 gMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=V4bwUD9URAvG9TnC6bTvCel9nYIn8pBzaujJmJwjfWg=;
 b=MCHB8mxNeSwcz8X4c/TAsfjxmhLbzbxQqkw5IMkAJ4WVDtboMUj2VWFIsvjTPo/XFp
 emy/7J3wmJXNCN1jIyAbw2zoUqjcFH1GOFpLVqK1ciJVnGVbBTk8RBvaEjr2wP6wZqex
 I/z3VsXXrtiOZLrSpOG5qr4OONs2eEWISjqSInjvk+PUc1T998orLTcHoFyPhNUgz1y/
 E2sid2tm0PTr2KQr7SSpaHcsWRtF6D37OIn8l5PNFFfZogHj2KsZZTXIHzamH4fbZzV4
 e8tXpkblkVloS0zoZaqRCiBb+yYp8FNEpaikobkGK58zvGTqPdsMqPX4zZtGlugA/nyX
 /BkA==
X-Gm-Message-State: AJIora87PCuIog7/YKzmBIN3vJZIkHrO8cK+FQuaGPnQsBlR+6pltkgz
 YvugDhsZBx6yz7vRdCoNsDYHoA92QsPl1U2+/1Q6fg==
X-Google-Smtp-Source: AGRyM1v5YZU2UycAZBfAyPppp3BGGAKhNEzsQK4vZV80Rn7R19quXW0OM0OZMXK7bHfx6X8glGiW5QEWdKeF8jmekbw=
X-Received: by 2002:a7b:c92b:0:b0:39e:eabd:cfd8 with SMTP id
 h11-20020a7bc92b000000b0039eeabdcfd8mr22794903wml.178.1655829935413; Tue, 21
 Jun 2022 09:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220531212521.1231133-1-kaleshsingh@google.com>
 <20220531212521.1231133-3-kaleshsingh@google.com>
 <14f85d24-a9de-9706-32f0-30be4999c71c@oracle.com>
 <CAC_TJveDzDaYQKmuLSkGWpnuCW+gvrqdVJqq=wbzoTRjw4OoFw@mail.gmail.com>
 <875yll1fp1.fsf@stepbren-lnx.us.oracle.com>
 <4b79c2ea-dd1a-623d-e5b4-faa732c1a42d@gmail.com>
 <CAC_TJvdU=bhaeJACz70JOAL34W846Bk=EmvkXL8ccfoALJdaOQ@mail.gmail.com>
 <CAC_TJvd6znLxqRON8DTxwsFKmDh_crQyzWmBugS7JPFrPn12Vw@mail.gmail.com>
In-Reply-To: <CAC_TJvd6znLxqRON8DTxwsFKmDh_crQyzWmBugS7JPFrPn12Vw@mail.gmail.com>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Tue, 21 Jun 2022 09:45:23 -0700
Message-ID: <CAC_TJvfWos07gCJ2V8cdp29QKSgJrXv5g9b_jGfg42c6f8simw@mail.gmail.com>
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

On Wed, Jun 15, 2022 at 10:00 AM Kalesh Singh <kaleshsingh@google.com> wrot=
e:
>
> On Wed, Jun 1, 2022 at 8:31 PM Kalesh Singh <kaleshsingh@google.com> wrot=
e:
> >
> > On Wed, Jun 1, 2022 at 8:02 AM Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> > >
> > > Am 01.06.22 um 00:48 schrieb Stephen Brennan:
> > > > Kalesh Singh <kaleshsingh@google.com> writes:
> > > >> On Tue, May 31, 2022 at 3:07 PM Stephen Brennan
> > > >> <stephen.s.brennan@oracle.com> wrote:
> > > >>> On 5/31/22 14:25, Kalesh Singh wrote:
> > > >>>> In order to identify the type of memory a process has pinned thr=
ough
> > > >>>> its open fds, add the file path to fdinfo output. This allows
> > > >>>> identifying memory types based on common prefixes. e.g. "/memfd.=
..",
> > > >>>> "/dmabuf...", "/dev/ashmem...".
> > > >>>>
> > > >>>> Access to /proc/<pid>/fdinfo is governed by PTRACE_MODE_READ_FSC=
REDS
> > > >>>> the same as /proc/<pid>/maps which also exposes the file path of
> > > >>>> mappings; so the security permissions for accessing path is cons=
istent
> > > >>>> with that of /proc/<pid>/maps.
> > > >>> Hi Kalesh,
> > > >> Hi Stephen,
> > > >>
> > > >> Thanks for taking a look.
> > > >>
> > > >>> I think I see the value in the size field, but I'm curious about =
path,
> > > >>> which is available via readlink /proc/<pid>/fd/<n>, since those a=
re
> > > >>> symlinks to the file themselves.
> > > >> This could work if we are root, but the file permissions wouldn't
> > > >> allow us to do the readlink on other processes otherwise. We want =
to
> > > >> be able to capture the system state in production environments fro=
m
> > > >> some trusted process with ptrace read capability.
> > > > Interesting, thanks for explaining. It seems weird to have a duplic=
ate
> > > > interface for the same information but such is life.
> > >
> > > Yeah, the size change is really straight forward but for this one I'm
> > > not 100% sure either.
> >
> > The 2 concerns I think are:
> >   1. Fun characters in the path names
> >   2. If exposing the path is appropriate to begin with.
> >
> > One way I think we can address both is to only expose the path for
> > anon inodes. Then we have well-known path formats and we don't expose
> > much about which files a process is accessing since these aren't real
> > paths.
> >
> > +       if (is_anon_inode(inode)) {
> > +               seq_puts(m, "path:\t");
> > +               seq_file_path(m, file, "\n");
> > +               seq_putc(m, '\n');
> > +       }
> >
> > Interested to hear thoughts on it.
>
> Adding Christoph,
>
> To be able to identify types of shared memory processes pin through
> FDs in production builds, we would like to add a 'path' field to
> fdinfo of anon inodes. We could then use the common prefixes
> ("/dmabuf", "/memfd", ...) to identify different types.
>
> Would appreciate any feedback from the FS perspective.

Hi all,

If there are no objections to this, then I plan to respin the patch
for just anonymous inodes. Please let me know if there are further
concerns.

Thanks,
Kalesh

>
> Thanks,
> Kalesh
>
> >
> > >
> > > Probably best to ping some core fs developer before going further wit=
h it.
> >
> > linux-fsdevel is cc'd here. Adding Al Vrio as well. Please let me know
> > if there are other parties I should include.
> >
> > >
> > > BTW: Any preferred branch to push this upstream? If not I can take it
> > > through drm-misc-next.
> >
> > No other dependencies for this, so drm-misc-next is good.
> >
> > Thanks,
> > Kalesh
> >
> > >
> > > Regards,
> > > Christian.
> > >
> > > >
> > > >>> File paths can contain fun characters like newlines or colons, wh=
ich
> > > >>> could make parsing out filenames in this text file... fun. How wo=
uld your
> > > >>> userspace parsing logic handle "/home/stephen/filename\nsize:\t40=
96"? The
> > > >>> readlink(2) API makes that easy already.
> > > >> I think since we have escaped the "\n" (seq_file_path(m, file, "\n=
")),
> > > > I really should have read through that function before commenting,
> > > > thanks for teaching me something new :)
> > > >
> > > > Stephen
> > > >
> > > >> then user space might parse this line like:
> > > >>
> > > >> if (strncmp(line, "path:\t", 6) =3D=3D 0)
> > > >>          char* path =3D line + 6;
> > > >>
> > > >>
> > > >> Thanks,
> > > >> Kalesh
> > > >>
> > > >>> Is the goal avoiding races (e.g. file descriptor 3 is closed and =
reopened
> > > >>> to a different path between reading fdinfo and stating the fd)?
> > > >>>
> > > >>> Stephen
> > > >>>
> > > >>>> Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> > > >>>> ---
> > > >>>>
> > > >>>> Changes from rfc:
> > > >>>>    - Split adding 'size' and 'path' into a separate patches, per=
 Christian
> > > >>>>    - Fix indentation (use tabs) in documentaion, per Randy
> > > >>>>
> > > >>>>   Documentation/filesystems/proc.rst | 14 ++++++++++++--
> > > >>>>   fs/proc/fd.c                       |  4 ++++
> > > >>>>   2 files changed, 16 insertions(+), 2 deletions(-)
> > > >>>>
> > > >>>> diff --git a/Documentation/filesystems/proc.rst b/Documentation/=
filesystems/proc.rst
> > > >>>> index 779c05528e87..591f12d30d97 100644
> > > >>>> --- a/Documentation/filesystems/proc.rst
> > > >>>> +++ b/Documentation/filesystems/proc.rst
> > > >>>> @@ -1886,14 +1886,16 @@ if precise results are needed.
> > > >>>>   3.8  /proc/<pid>/fdinfo/<fd> - Information about opened file
> > > >>>>   --------------------------------------------------------------=
-
> > > >>>>   This file provides information associated with an opened file.=
 The regular
> > > >>>> -files have at least five fields -- 'pos', 'flags', 'mnt_id', 'i=
no', and 'size'.
> > > >>>> +files have at least six fields -- 'pos', 'flags', 'mnt_id', 'in=
o', 'size',
> > > >>>> +and 'path'.
> > > >>>>
> > > >>>>   The 'pos' represents the current offset of the opened file in =
decimal
> > > >>>>   form [see lseek(2) for details], 'flags' denotes the octal O_x=
xx mask the
> > > >>>>   file has been created with [see open(2) for details] and 'mnt_=
id' represents
> > > >>>>   mount ID of the file system containing the opened file [see 3.=
5
> > > >>>>   /proc/<pid>/mountinfo for details]. 'ino' represents the inode=
 number of
> > > >>>> -the file, and 'size' represents the size of the file in bytes.
> > > >>>> +the file, 'size' represents the size of the file in bytes, and =
'path'
> > > >>>> +represents the file path.
> > > >>>>
> > > >>>>   A typical output is::
> > > >>>>
> > > >>>> @@ -1902,6 +1904,7 @@ A typical output is::
> > > >>>>        mnt_id: 19
> > > >>>>        ino:    63107
> > > >>>>        size:   0
> > > >>>> +     path:   /dev/null
> > > >>>>
> > > >>>>   All locks associated with a file descriptor are shown in its f=
dinfo too::
> > > >>>>
> > > >>>> @@ -1920,6 +1923,7 @@ Eventfd files
> > > >>>>        mnt_id: 9
> > > >>>>        ino:    63107
> > > >>>>        size:   0
> > > >>>> +     path:   anon_inode:[eventfd]
> > > >>>>        eventfd-count:  5a
> > > >>>>
> > > >>>>   where 'eventfd-count' is hex value of a counter.
> > > >>>> @@ -1934,6 +1938,7 @@ Signalfd files
> > > >>>>        mnt_id: 9
> > > >>>>        ino:    63107
> > > >>>>        size:   0
> > > >>>> +     path:   anon_inode:[signalfd]
> > > >>>>        sigmask:        0000000000000200
> > > >>>>
> > > >>>>   where 'sigmask' is hex value of the signal mask associated
> > > >>>> @@ -1949,6 +1954,7 @@ Epoll files
> > > >>>>        mnt_id: 9
> > > >>>>        ino:    63107
> > > >>>>        size:   0
> > > >>>> +     path:   anon_inode:[eventpoll]
> > > >>>>        tfd:        5 events:       1d data: ffffffffffffffff pos=
:0 ino:61af sdev:7
> > > >>>>
> > > >>>>   where 'tfd' is a target file descriptor number in decimal form=
,
> > > >>>> @@ -1968,6 +1974,7 @@ For inotify files the format is the follow=
ing::
> > > >>>>        mnt_id: 9
> > > >>>>        ino:    63107
> > > >>>>        size:   0
> > > >>>> +     path:   anon_inode:inotify
> > > >>>>        inotify wd:3 ino:9e7e sdev:800013 mask:800afce ignored_ma=
sk:0 fhandle-bytes:8 fhandle-type:1 f_handle:7e9e0000640d1b6d
> > > >>>>
> > > >>>>   where 'wd' is a watch descriptor in decimal form, i.e. a targe=
t file
> > > >>>> @@ -1992,6 +1999,7 @@ For fanotify files the format is::
> > > >>>>        mnt_id: 9
> > > >>>>        ino:    63107
> > > >>>>        size:   0
> > > >>>> +     path:   anon_inode:[fanotify]
> > > >>>>        fanotify flags:10 event-flags:0
> > > >>>>        fanotify mnt_id:12 mflags:40 mask:38 ignored_mask:4000000=
3
> > > >>>>        fanotify ino:4f969 sdev:800013 mflags:0 mask:3b ignored_m=
ask:40000000 fhandle-bytes:8 fhandle-type:1 f_handle:69f90400c275b5b4
> > > >>>> @@ -2018,6 +2026,7 @@ Timerfd files
> > > >>>>        mnt_id: 9
> > > >>>>        ino:    63107
> > > >>>>        size:   0
> > > >>>> +     path:   anon_inode:[timerfd]
> > > >>>>        clockid: 0
> > > >>>>        ticks: 0
> > > >>>>        settime flags: 01
> > > >>>> @@ -2042,6 +2051,7 @@ DMA Buffer files
> > > >>>>        mnt_id: 9
> > > >>>>        ino:    63107
> > > >>>>        size:   32768
> > > >>>> +     path:   /dmabuf:
> > > >>>>        count:  2
> > > >>>>        exp_name:  system-heap
> > > >>>>
> > > >>>> diff --git a/fs/proc/fd.c b/fs/proc/fd.c
> > > >>>> index 464bc3f55759..8889a8ba09d4 100644
> > > >>>> --- a/fs/proc/fd.c
> > > >>>> +++ b/fs/proc/fd.c
> > > >>>> @@ -60,6 +60,10 @@ static int seq_show(struct seq_file *m, void =
*v)
> > > >>>>        seq_printf(m, "ino:\t%lu\n", file_inode(file)->i_ino);
> > > >>>>        seq_printf(m, "size:\t%lli\n", (long long)file_inode(file=
)->i_size);
> > > >>>>
> > > >>>> +     seq_puts(m, "path:\t");
> > > >>>> +     seq_file_path(m, file, "\n");
> > > >>>> +     seq_putc(m, '\n');
> > > >>>> +
> > > >>>>        /* show_fd_locks() never deferences files so a stale valu=
e is safe */
> > > >>>>        show_fd_locks(m, file, files);
> > > >>>>        if (seq_has_overflowed(m))
> > > >>> --
> > > >>> To unsubscribe from this group and stop receiving emails from it,=
 send an email to kernel-team+unsubscribe@android.com.
> > > >>>
> > > > _______________________________________________
> > > > Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> > > > To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.or=
g
> > >
