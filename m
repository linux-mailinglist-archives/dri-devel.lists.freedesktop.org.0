Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4866D53A974
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 16:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D7A10EA26;
	Wed,  1 Jun 2022 14:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8879210EA26
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 14:58:28 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d26so2707772wrb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 07:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bcxJZOoEGdj9HHyfjULCcOOxYPoZGRjHpoFm81lNVOs=;
 b=P+A7Ep4P+FL+NTqEOtoX8UyZXTOoMsHDrPThvBn0p2XBWcLvNZFCRF7csyce5aJIgC
 /9J8TqZFKIKxg2L9BWSFt0+g/QdglYWeGwGr9vBpkG6lvUtwe24zixvQnaVAwqK2LTTw
 1epOyxU982uVJ8EcAUJAU6U9HLFl24Deyae4kvazM0NpvT9iCnL1FaKKzMmKp4f/M2Cf
 KtruZqQI5Mxe/3mT8Qb8rfG3YG75gK3bweRHBCVUOlHWwTfHTMSj3dbyzs0XWy9/z5XF
 jQKHq1dd7J3P8yVThLPD9s+w3k5yM1y6Z2oMhGM33BXvo/V2LfUPw0tyLQzHiaLK66HC
 0syg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bcxJZOoEGdj9HHyfjULCcOOxYPoZGRjHpoFm81lNVOs=;
 b=Xaga9LfiG6ojCodNB3ZhiwufBZLuAFjOBsV6zf9yDxA5oGNn2t/SYLNY1j1soxf0aP
 OCviOHxdnXI9DkeVxRbej+oJfGtauW6d+1el9qkmwkp37k9ciTJg7QIEULStF/0qdJTz
 /iMbxabKJ36LT5yITENrXJ4H+APyqthQMNx1KNJlGouFAK55neGtBdtDxXuoqngaA1SG
 vJkkMtcLiw3XTX4N25cyt+xYv+kIsnewqDmC8ISa1yd8YvY4yHSuCRDsZIvT6thsRzCo
 7C98+XMqeRIkQ/VmwZpIhlblNF9hcIdig6nHyOB1EgvCgvJOKWp5la+7FvAal2OScqpj
 CiEw==
X-Gm-Message-State: AOAM5304eR0FrMTVX6nAHj/HQuWeZapr//DwEOuMF4kNr3G6XmlkWQaY
 YDJ/7PtbERXr6GdwOlwCRXVIcJgQCZ/rKMOiMxdZLw==
X-Google-Smtp-Source: ABdhPJwGBhJdLWicc8l4yIAJBeULOWR4YtzFjOWhqpz0EB4Y0mtAJ7jVfp5UnN5oAyj8L/4fmel35fvjSN1Ws9Bq2yA=
X-Received: by 2002:a05:6000:71b:b0:20e:ed96:e976 with SMTP id
 bs27-20020a056000071b00b0020eed96e976mr178409wrb.500.1654095506747; Wed, 01
 Jun 2022 07:58:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220531212521.1231133-1-kaleshsingh@google.com>
 <20220531212521.1231133-2-kaleshsingh@google.com>
 <78efbada-6dd5-ead7-fc10-38b5e1e92fc5@amd.com>
In-Reply-To: <78efbada-6dd5-ead7-fc10-38b5e1e92fc5@amd.com>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Wed, 1 Jun 2022 07:58:15 -0700
Message-ID: <CAC_TJve6CTA-ssG9zJm2_=MJqRhCqV7Bwgz1YiSH7RVVy+pg4g@mail.gmail.com>
Subject: Re: [PATCH 1/2] procfs: Add 'size' to /proc/<pid>/fdinfo/
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Randy Dunlap <rdunlap@infradead.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>,
 "Cc: Android Kernel" <kernel-team@android.com>,
 David Hildenbrand <david@redhat.com>, Ioannis Ilkos <ilkos@google.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 "T.J. Mercier" <tjmercier@google.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Paul Gortmaker <paul.gortmaker@windriver.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Mike Rapoport <rppt@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 1, 2022 at 6:55 AM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 31.05.22 um 23:25 schrieb Kalesh Singh:
> > To be able to account the amount of memory a process is keeping pinned
> > by open file descriptors add a 'size' field to fdinfo output.
> >
> > dmabufs fds already expose a 'size' field for this reason, remove this
> > and make it a common field for all fds. This allows tracking of
> > other types of memory (e.g. memfd and ashmem in Android).
> >
> > Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
>
> At least for the DMA-buf part feel free to add an Reviewed-by: Christian
> K=C3=B6nig <christian.koenig@amd.com> for this.

Thanks for the review, Christian.

--Kalesh

>
> Regards,
> Christian.
>
> > ---
> >
> > Changes from rfc:
> >    - Split adding 'size' and 'path' into a separate patches, per Christ=
ian
> >    - Split fdinfo seq_printf into separate lines, per Christian
> >    - Fix indentation (use tabs) in documentaion, per Randy
> >
> >   Documentation/filesystems/proc.rst | 12 ++++++++++--
> >   drivers/dma-buf/dma-buf.c          |  1 -
> >   fs/proc/fd.c                       |  9 +++++----
> >   3 files changed, 15 insertions(+), 7 deletions(-)
> >
> > diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesys=
tems/proc.rst
> > index 1bc91fb8c321..779c05528e87 100644
> > --- a/Documentation/filesystems/proc.rst
> > +++ b/Documentation/filesystems/proc.rst
> > @@ -1886,13 +1886,14 @@ if precise results are needed.
> >   3.8 /proc/<pid>/fdinfo/<fd> - Information about opened file
> >   ---------------------------------------------------------------
> >   This file provides information associated with an opened file. The re=
gular
> > -files have at least four fields -- 'pos', 'flags', 'mnt_id' and 'ino'.
> > +files have at least five fields -- 'pos', 'flags', 'mnt_id', 'ino', an=
d 'size'.
> > +
> >   The 'pos' represents the current offset of the opened file in decimal
> >   form [see lseek(2) for details], 'flags' denotes the octal O_xxx mask=
 the
> >   file has been created with [see open(2) for details] and 'mnt_id' rep=
resents
> >   mount ID of the file system containing the opened file [see 3.5
> >   /proc/<pid>/mountinfo for details]. 'ino' represents the inode number=
 of
> > -the file.
> > +the file, and 'size' represents the size of the file in bytes.
> >
> >   A typical output is::
> >
> > @@ -1900,6 +1901,7 @@ A typical output is::
> >       flags:  0100002
> >       mnt_id: 19
> >       ino:    63107
> > +     size:   0
> >
> >   All locks associated with a file descriptor are shown in its fdinfo t=
oo::
> >
> > @@ -1917,6 +1919,7 @@ Eventfd files
> >       flags:  04002
> >       mnt_id: 9
> >       ino:    63107
> > +     size:   0
> >       eventfd-count:  5a
> >
> >   where 'eventfd-count' is hex value of a counter.
> > @@ -1930,6 +1933,7 @@ Signalfd files
> >       flags:  04002
> >       mnt_id: 9
> >       ino:    63107
> > +     size:   0
> >       sigmask:        0000000000000200
> >
> >   where 'sigmask' is hex value of the signal mask associated
> > @@ -1944,6 +1948,7 @@ Epoll files
> >       flags:  02
> >       mnt_id: 9
> >       ino:    63107
> > +     size:   0
> >       tfd:        5 events:       1d data: ffffffffffffffff pos:0 ino:6=
1af sdev:7
> >
> >   where 'tfd' is a target file descriptor number in decimal form,
> > @@ -1962,6 +1967,7 @@ For inotify files the format is the following::
> >       flags:  02000000
> >       mnt_id: 9
> >       ino:    63107
> > +     size:   0
> >       inotify wd:3 ino:9e7e sdev:800013 mask:800afce ignored_mask:0 fha=
ndle-bytes:8 fhandle-type:1 f_handle:7e9e0000640d1b6d
> >
> >   where 'wd' is a watch descriptor in decimal form, i.e. a target file
> > @@ -1985,6 +1991,7 @@ For fanotify files the format is::
> >       flags:  02
> >       mnt_id: 9
> >       ino:    63107
> > +     size:   0
> >       fanotify flags:10 event-flags:0
> >       fanotify mnt_id:12 mflags:40 mask:38 ignored_mask:40000003
> >       fanotify ino:4f969 sdev:800013 mflags:0 mask:3b ignored_mask:4000=
0000 fhandle-bytes:8 fhandle-type:1 f_handle:69f90400c275b5b4
> > @@ -2010,6 +2017,7 @@ Timerfd files
> >       flags:  02
> >       mnt_id: 9
> >       ino:    63107
> > +     size:   0
> >       clockid: 0
> >       ticks: 0
> >       settime flags: 01
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 32f55640890c..5f2ae38c960f 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -378,7 +378,6 @@ static void dma_buf_show_fdinfo(struct seq_file *m,=
 struct file *file)
> >   {
> >       struct dma_buf *dmabuf =3D file->private_data;
> >
> > -     seq_printf(m, "size:\t%zu\n", dmabuf->size);
> >       /* Don't count the temporary reference taken inside procfs seq_sh=
ow */
> >       seq_printf(m, "count:\t%ld\n", file_count(dmabuf->file) - 1);
> >       seq_printf(m, "exp_name:\t%s\n", dmabuf->exp_name);
> > diff --git a/fs/proc/fd.c b/fs/proc/fd.c
> > index 913bef0d2a36..464bc3f55759 100644
> > --- a/fs/proc/fd.c
> > +++ b/fs/proc/fd.c
> > @@ -54,10 +54,11 @@ static int seq_show(struct seq_file *m, void *v)
> >       if (ret)
> >               return ret;
> >
> > -     seq_printf(m, "pos:\t%lli\nflags:\t0%o\nmnt_id:\t%i\nino:\t%lu\n"=
,
> > -                (long long)file->f_pos, f_flags,
> > -                real_mount(file->f_path.mnt)->mnt_id,
> > -                file_inode(file)->i_ino);
> > +     seq_printf(m, "pos:\t%lli\n", (long long)file->f_pos);
> > +     seq_printf(m, "flags:\t0%o\n", f_flags);
> > +     seq_printf(m, "mnt_id:\t%i\n", real_mount(file->f_path.mnt)->mnt_=
id);
> > +     seq_printf(m, "ino:\t%lu\n", file_inode(file)->i_ino);
> > +     seq_printf(m, "size:\t%lli\n", (long long)file_inode(file)->i_siz=
e);
> >
> >       /* show_fd_locks() never deferences files so a stale value is saf=
e */
> >       show_fd_locks(m, file, files);
>
