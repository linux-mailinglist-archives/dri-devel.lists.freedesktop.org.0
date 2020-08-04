Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B221C23C6AC
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 09:13:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59836E4FB;
	Wed,  5 Aug 2020 07:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5F16E0F7
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 13:54:17 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id b6so7697564vkb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 06:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Gjh1CQhNcX/dKpwghpqe5PsnWMgHIT7SFzJs24h1UQM=;
 b=MqpYAiWijmvg7loVHczpUKtn2+LJz7S2aV+N438n2Y65/hPVYPyLQR3Af4s3W2Ukz5
 gLYAov6l7shRm+JJpOMpNLndV0/ZN4ObOy7kmt1MItL+zU2Z+xVsuMjvEyJd2qOdyWo0
 FylGqdCVn+1NMjtq4E5q0zRZFh8pRB+uxba1HCcuNm9M02q8JFldhPwgCaiZOYCWBq17
 hVfSRFG/p6V6p2i8FPTcnBgv1pNvvWSi1HNczyO13FgS09NjRa2VVtLpmtPOcrBkTVBA
 UyvW53IFCMp5nvhUMLZR17cge+of0Ri0a1fQv4QKYnq9ADROB24CM2+wvliFp9MVw8OR
 sPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Gjh1CQhNcX/dKpwghpqe5PsnWMgHIT7SFzJs24h1UQM=;
 b=W+cwMu7KVwQmNdlrCokl/RC/oE5iaO2h/f8p678gnC6Q/yEDQr5N743Rp2OLpgdv23
 BK8vd60W3/uJOphfibpE5pEI0srG5v6hbrhnQvDQ51dKM9YhfFbE4IP9z993hXfzhNX1
 DIgMHThbErQmr1BGC6TF8wZvi1eXWqtzGKXH7Mu4TbmMz9v5veNndcfp+LU77hSlmm4v
 gTRrxfedDsKQolcRhEz+p2ZCJvpE/tmbb76Lr29a/vn+hgWWSuA3Ua8Q+k63M9SUl3sK
 2/6+Oj/znSbpDcn+q+d9kVRW2m9071OzgQQOYxEE6JmKEhVGINQbjTuKLYcpWHskUSXW
 bN1w==
X-Gm-Message-State: AOAM533ulyhxWtO0dudM3ZUkTD+epDGDSDmQIzEzol801Ih7L7tfH9tJ
 M+kByQP44fnsZM2Ah1648aATJA==
X-Google-Smtp-Source: ABdhPJywEqRIB+C/laAdsWyb753dUVCT2rmRqL5RBMcCSf76aIKKVtfXUnjQ/uxnkDArh3Jzj6HeBQ==
X-Received: by 2002:a1f:bd02:: with SMTP id n2mr14859615vkf.1.1596549256680;
 Tue, 04 Aug 2020 06:54:16 -0700 (PDT)
Received: from google.com (182.71.196.35.bc.googleusercontent.com.
 [35.196.71.182])
 by smtp.gmail.com with ESMTPSA id n62sm3130893vke.12.2020.08.04.06.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 06:54:15 -0700 (PDT)
Date: Tue, 4 Aug 2020 13:54:12 +0000
From: Kalesh Singh <kaleshsingh@google.com>
To: Joel Fernandes <joelaf@google.com>
Subject: Re: [PATCH 1/2] fs: Add fd_install file operation
Message-ID: <20200804135412.GA934259@google.com>
References: <20200803144719.3184138-1-kaleshsingh@google.com>
 <20200803144719.3184138-2-kaleshsingh@google.com>
 <CAJWu+orzhpO5hPfUWd0EJp-ViWMifeQ_Ng+R4fHf7xabL+Bggw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJWu+orzhpO5hPfUWd0EJp-ViWMifeQ_Ng+R4fHf7xabL+Bggw@mail.gmail.com>
X-Mailman-Approved-At: Wed, 05 Aug 2020 07:13:16 +0000
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
 "Cc: Android Kernel" <kernel-team@android.com>,
 dri-devel@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>,
 Ioannis Ilkos <ilkos@google.com>, LKML <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, linaro-mm-sig@lists.linaro.org,
 Hridya Valsaraju <hridya@google.com>, Ingo Molnar <mingo@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Suren Baghdasaryan <surenb@google.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 03, 2020 at 08:30:59PM -0400, Joel Fernandes wrote:
> On Mon, Aug 3, 2020 at 10:47 AM 'Kalesh Singh' via kernel-team
> <kernel-team@android.com> wrote:
> >
> > Provides a per process hook for the acquisition of file descriptors,
> > despite the method used to obtain the descriptor.
> >
> 
> Hi,
> So apart from all of the comments received, I think it is hard to
> understand what the problem is, what the front-end looks like etc.
> Your commit message is 1 line only.
> 
> I do remember some of the challenges discussed before, but it would
> describe the problem in the commit message in detail and then discuss
> why this solution is fit.  Please read submitting-patches.rst
> especially "2) Describe your changes".
> 
> thanks,
> 
>  - Joel

Thanks for the advice Joel :)
> 
> 
> > Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> > ---
> >  Documentation/filesystems/vfs.rst | 5 +++++
> >  fs/file.c                         | 3 +++
> >  include/linux/fs.h                | 1 +
> >  3 files changed, 9 insertions(+)
> >
> > diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
> > index ed17771c212b..95b30142c8d9 100644
> > --- a/Documentation/filesystems/vfs.rst
> > +++ b/Documentation/filesystems/vfs.rst
> > @@ -1123,6 +1123,11 @@ otherwise noted.
> >  ``fadvise``
> >         possibly called by the fadvise64() system call.
> >
> > +``fd_install``
> > +       called by the VFS when a file descriptor is installed in the
> > +       process's file descriptor table, regardless how the file descriptor
> > +       was acquired -- be it via the open syscall, received over IPC, etc.
> > +
> >  Note that the file operations are implemented by the specific
> >  filesystem in which the inode resides.  When opening a device node
> >  (character or block special) most filesystems will call special
> > diff --git a/fs/file.c b/fs/file.c
> > index abb8b7081d7a..f5db8622b851 100644
> > --- a/fs/file.c
> > +++ b/fs/file.c
> > @@ -616,6 +616,9 @@ void __fd_install(struct files_struct *files, unsigned int fd,
> >  void fd_install(unsigned int fd, struct file *file)
> >  {
> >         __fd_install(current->files, fd, file);
> > +
> > +       if (file->f_op->fd_install)
> > +               file->f_op->fd_install(fd, file);
> >  }
> >
> >  EXPORT_SYMBOL(fd_install);
> > diff --git a/include/linux/fs.h b/include/linux/fs.h
> > index f5abba86107d..b976fbe8c902 100644
> > --- a/include/linux/fs.h
> > +++ b/include/linux/fs.h
> > @@ -1864,6 +1864,7 @@ struct file_operations {
> >                                    struct file *file_out, loff_t pos_out,
> >                                    loff_t len, unsigned int remap_flags);
> >         int (*fadvise)(struct file *, loff_t, loff_t, int);
> > +       void (*fd_install)(int, struct file *);
> >  } __randomize_layout;
> >
> >  struct inode_operations {
> > --
> > 2.28.0.163.g6104cc2f0b6-goog
> >
> > --
> > To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
