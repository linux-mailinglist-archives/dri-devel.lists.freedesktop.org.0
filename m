Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5525E55FFBC
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8113C113B4B;
	Wed, 29 Jun 2022 12:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F538997E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656505431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EYDBXIB3xoIWC8aCI7RzeLW7qStzkUrLkNcQjH128XA=;
 b=AjmeGh54ohC+B1d1Oaph0T5hVlPOXMM0wUoOuogkzluu6wRroIX6sCmtMsfBxSIrhO73A6
 KG6XWRIZVRmGJWZAQygZGBypC7No8YfqZtQ8Kd4g/updeZUNcvOtAzE8a1qKceFR4EOqmd
 ZMQDKIN1MLAd+pYOUtwY8hQPX7/tdsI=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-cZEHVQ4UPLSs7xUmui4mVg-1; Wed, 29 Jun 2022 08:23:50 -0400
X-MC-Unique: cZEHVQ4UPLSs7xUmui4mVg-1
Received: by mail-qk1-f198.google.com with SMTP id
 bl27-20020a05620a1a9b00b0069994eeb30cso16084945qkb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 05:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EYDBXIB3xoIWC8aCI7RzeLW7qStzkUrLkNcQjH128XA=;
 b=w8z4yKrSwZKZXRlHvRsKdf6ZHd69lKcCfaqrfykyg+1YDdqMh+w3ASc0z8OkXZzcoc
 VN8W2zZujHw7VKPWLAP3Vl0kDYpwpt0UU2HOBUVIU7NLg3fh/YOFbPhhV5LWMPfyoL//
 ZEvT+QnXihzLvxBtb2BWawmA4G6cRWmaE8RbofFVvNt6xy74kNUXGXKecFlto8H/ZD43
 KzJWjwsX0pEEKeftkfVXZIAqcYT1QQd0lvfYWMCs/thHShsNRi29/QxDIqQ895XWi7nE
 7ScX6199tkf4ecCrlxxpXpwl37mcIodAntFcu0xTZv8iamx4Fapec4zfWwbuIIK2MZT6
 9uMA==
X-Gm-Message-State: AJIora9jyQ5tvMCC6vnxYqqSSs0LXKPEEtIfMTBsM94n1hO38vqrV9yT
 GwqUGOwR7K5DkmCCCBwBG0jJNLwQWmf9yxrYuPohOD/+L2K+hdTISaEL6byuwG0PJKMDWAf62/9
 lifAh1mUl1a9jYC4GrjOS40fI6cDH
X-Received: by 2002:a05:6214:268d:b0:472:aaf1:5f27 with SMTP id
 gm13-20020a056214268d00b00472aaf15f27mr694660qvb.110.1656505429159; 
 Wed, 29 Jun 2022 05:23:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u3h0V3fdhVV+HucGS5oArvomDWB3I4qcdeLL7MDHAtkOnDR5VNPMUAvyAUfaXGCeU2LIejWA==
X-Received: by 2002:a05:6214:268d:b0:472:aaf1:5f27 with SMTP id
 gm13-20020a056214268d00b00472aaf15f27mr694617qvb.110.1656505428790; 
 Wed, 29 Jun 2022 05:23:48 -0700 (PDT)
Received: from bfoster (c-24-61-119-116.hsd1.ma.comcast.net. [24.61.119.116])
 by smtp.gmail.com with ESMTPSA id
 v123-20020a379381000000b006a6c230f5e0sm4399269qkd.31.2022.06.29.05.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 05:23:48 -0700 (PDT)
Date: Wed, 29 Jun 2022 08:23:45 -0400
From: Brian Foster <bfoster@redhat.com>
To: Kalesh Singh <kaleshsingh@google.com>
Subject: Re: [PATCH v2 1/2] procfs: Add 'size' to /proc/<pid>/fdinfo/
Message-ID: <YrxEUbDkYLE6XF6x@bfoster>
References: <20220623220613.3014268-1-kaleshsingh@google.com>
 <20220623220613.3014268-2-kaleshsingh@google.com>
 <Yrrrz7MxMu8OoEPU@bfoster>
 <CAC_TJvejs5gbggC1hekyjUNctC_8+3FmVn0B7zAZox2+MkEjaA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAC_TJvejs5gbggC1hekyjUNctC_8+3FmVn0B7zAZox2+MkEjaA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bfoster@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Suren Baghdasaryan <surenb@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 Randy Dunlap <rdunlap@infradead.org>, Ioannis Ilkos <ilkos@google.com>,
 LKML <linux-kernel@vger.kernel.org>, David.Laight@aculab.com,
 Johannes Weiner <hannes@cmpxchg.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 28, 2022 at 03:38:02PM -0700, Kalesh Singh wrote:
> On Tue, Jun 28, 2022 at 4:54 AM Brian Foster <bfoster@redhat.com> wrote:
> >
> > On Thu, Jun 23, 2022 at 03:06:06PM -0700, Kalesh Singh wrote:
> > > To be able to account the amount of memory a process is keeping pinned
> > > by open file descriptors add a 'size' field to fdinfo output.
> > >
> > > dmabufs fds already expose a 'size' field for this reason, remove this
> > > and make it a common field for all fds. This allows tracking of
> > > other types of memory (e.g. memfd and ashmem in Android).
> > >
> > > Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> > > Reviewed-by: Christian König <christian.koenig@amd.com>
> > > ---
> > >
> > > Changes in v2:
> > >   - Add Christian's Reviewed-by
> > >
> > > Changes from rfc:
> > >   - Split adding 'size' and 'path' into a separate patches, per Christian
> > >   - Split fdinfo seq_printf into separate lines, per Christian
> > >   - Fix indentation (use tabs) in documentaion, per Randy
> > >
> > >  Documentation/filesystems/proc.rst | 12 ++++++++++--
> > >  drivers/dma-buf/dma-buf.c          |  1 -
> > >  fs/proc/fd.c                       |  9 +++++----
> > >  3 files changed, 15 insertions(+), 7 deletions(-)
> > >
...
> >
> > Also not sure if it matters that much for your use case, but something
> > worth noting at least with shmem is that one can do something like:
> >
> > # cat /proc/meminfo | grep Shmem:
> > Shmem:               764 kB
> > # xfs_io -fc "falloc -k 0 10m" ./file
> > # ls -alh file
> > -rw-------. 1 root root 0 Jun 28 07:22 file
> > # stat file
> >   File: file
> >   Size: 0               Blocks: 20480      IO Block: 4096   regular empty file
> > # cat /proc/meminfo | grep Shmem:
> > Shmem:             11004 kB
> >
> > ... where the resulting memory usage isn't reflected in i_size (but is
> > is in i_blocks/bytes).
> 
> I tried a similar experiment a few times, but I don't see the same
> results. In my case, there is not any change in shmem. IIUC the
> fallocate is allocating the disk space not shared memory.
> 

Sorry, it was implied in my previous test was that I was running against
tmpfs. So regardless of fs, the fallocate keep_size semantics shown in
both cases is as expected: the underlying blocks are allocated and the
inode size is unchanged.

What wasn't totally clear to me when I read this patch was 1. whether
tmpfs refers to Shmem and 2. whether tmpfs allowed this sort of
operation. The test above seems to confirm both, however, right? E.g., a
more detailed example:

# mount | grep /tmp
tmpfs on /tmp type tmpfs (rw,nosuid,nodev,seclabel,nr_inodes=1048576,inode64)
# cat /proc/meminfo | grep Shmem:
Shmem:              5300 kB
# xfs_io -fc "falloc -k 0 1g" /tmp/file
# stat /tmp/file 
  File: /tmp/file
  Size: 0               Blocks: 2097152    IO Block: 4096   regular empty file
Device: 22h/34d Inode: 45          Links: 1
Access: (0600/-rw-------)  Uid: (    0/    root)   Gid: (    0/    root)
Context: unconfined_u:object_r:user_tmp_t:s0
Access: 2022-06-29 08:04:01.301307154 -0400
Modify: 2022-06-29 08:04:01.301307154 -0400
Change: 2022-06-29 08:04:01.451312834 -0400
 Birth: 2022-06-29 08:04:01.301307154 -0400
# cat /proc/meminfo | grep Shmem:
Shmem:           1053876 kB
# rm -f /tmp/file 
# cat /proc/meminfo | grep Shmem:
Shmem:              5300 kB

So clearly this impacts Shmem.. was your test run against tmpfs or some
other (disk based) fs?

FWIW, I don't have any objection to exposing inode size if it's commonly
useful information. My feedback was more just an fyi that i_size doesn't
necessarily reflect underlying space consumption (whether it's memory or
disk space) in more generic cases, because it sounds like that is really
what you're after here. The opposite example to the above would be
something like an 'xfs_io -fc "truncate 1t" /tmp/file', which shows a
1TB inode size with zero additional shmem usage.

Brian

> cat /proc/meminfo > meminfo.start
> xfs_io -fc "falloc -k 0 50m" ./xfs_file
> cat /proc/meminfo > meminfo.stop
> tail -n +1 meminfo.st* | grep -i '==\|Shmem:'
> 
> ==> meminfo.start <==
> Shmem:               484 kB
> ==> meminfo.stop <==
> Shmem:               484 kB
> 
> ls -lh xfs_file
> -rw------- 1 root root 0 Jun 28 15:12 xfs_file
> 
> stat xfs_file
>   File: xfs_file
>   Size: 0               Blocks: 102400     IO Block: 4096   regular empty file
> 
> Thanks,
> Kalesh
> 
> >
> > Brian
> >
> > >
> > >       /* show_fd_locks() never deferences files so a stale value is safe */
> > >       show_fd_locks(m, file, files);
> > > --
> > > 2.37.0.rc0.161.g10f37bed90-goog
> > >
> >
> 

