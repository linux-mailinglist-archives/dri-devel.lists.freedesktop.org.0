Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F3423B5A3
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 09:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD5D6E435;
	Tue,  4 Aug 2020 07:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5D86E171
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 00:31:13 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id x6so12433683qvr.8
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Aug 2020 17:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Keb4Jl8eGTMNDh85x/MoXRXdhRswB8awzn31D2vbMj0=;
 b=XSTwLSZ1mADWjStO1ZNWRlwInkzdfEkyVSUc8QZ7UMJD2/JREd2lztc/i9omVInOj6
 3gK1qEvMEiseqAKq/F384o3Yp/u51Vrx+lJWgkgq+uqyUlsqbTOPCV4Sg43QaJhFvr+Z
 c7Okotqw3+F9HP7Eh5oNxhVKmZCce3oOW6E5SzaUDtdWQl+Lkt2tnu9kmHllfPWwkoId
 9eaNI28lQOQ738moL42u723ahUZXoYVNrr/aTxt/QKjkG1idXCYYTCyoO3Wk3f4gxFls
 0Zkn7AL88C5G8qpmrudx7OXgchljK+Tb6n1IliP0Mz6AP/ahxAJIogxWdgdfRFsGEfQv
 ulFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Keb4Jl8eGTMNDh85x/MoXRXdhRswB8awzn31D2vbMj0=;
 b=TG04uvgfi3KBEyC4rTwGIlVRXpD0j6e8tlDpD6lTibeCpVpyLq83afuJswnggMLEG9
 XGsg8PNKk1SHDYl3AqmBhoEOWF/DLuIjzK6BedCMm+kndvGOgq/ulcljVBJS3nOxMNwb
 zVAgvqzcElwidlnrHtdH/OQlu/8ejP+/gjo+e97rNY12LjNiOJFnLfLOayA0YbyzT7Ig
 bw1QyirBKUsmzI5lTaMJuWnq9tcvhx6v/yWZ7dY2S9r0gC4qhgS06eWGWkqmFG+Ns8zO
 2TxXR9M7I4okSs6/Lw1dotU8JeGVos4j1vYOP9laQhDCf3UzY/jSNK177s6ZrqyRvVf5
 fGxA==
X-Gm-Message-State: AOAM530kQpC15AfZWzw/CbN4pHIHaFTe0vfBwL9AAR2qj0guMUV9G7ti
 k+oaqvSsUNlWpwYEknPQB8VJDA9v+Xp8N6uA4N140g==
X-Google-Smtp-Source: ABdhPJwzMvPWvyBxmyaZCvmqJjM3a+Az+ZwSYEPaUKkscBswzjvkcy7RYCd4ipv9IlL5fWfBRoT2auKF3Vsb/KH734w=
X-Received: by 2002:a0c:9b96:: with SMTP id o22mr10770174qve.213.1596501071827; 
 Mon, 03 Aug 2020 17:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200803144719.3184138-1-kaleshsingh@google.com>
 <20200803144719.3184138-2-kaleshsingh@google.com>
In-Reply-To: <20200803144719.3184138-2-kaleshsingh@google.com>
From: Joel Fernandes <joelaf@google.com>
Date: Mon, 3 Aug 2020 20:30:59 -0400
Message-ID: <CAJWu+orzhpO5hPfUWd0EJp-ViWMifeQ_Ng+R4fHf7xabL+Bggw@mail.gmail.com>
Subject: Re: [PATCH 1/2] fs: Add fd_install file operation
To: Kalesh Singh <kaleshsingh@google.com>
X-Mailman-Approved-At: Tue, 04 Aug 2020 07:27:04 +0000
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

On Mon, Aug 3, 2020 at 10:47 AM 'Kalesh Singh' via kernel-team
<kernel-team@android.com> wrote:
>
> Provides a per process hook for the acquisition of file descriptors,
> despite the method used to obtain the descriptor.
>

Hi,
So apart from all of the comments received, I think it is hard to
understand what the problem is, what the front-end looks like etc.
Your commit message is 1 line only.

I do remember some of the challenges discussed before, but it would
describe the problem in the commit message in detail and then discuss
why this solution is fit.  Please read submitting-patches.rst
especially "2) Describe your changes".

thanks,

 - Joel


> Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> ---
>  Documentation/filesystems/vfs.rst | 5 +++++
>  fs/file.c                         | 3 +++
>  include/linux/fs.h                | 1 +
>  3 files changed, 9 insertions(+)
>
> diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
> index ed17771c212b..95b30142c8d9 100644
> --- a/Documentation/filesystems/vfs.rst
> +++ b/Documentation/filesystems/vfs.rst
> @@ -1123,6 +1123,11 @@ otherwise noted.
>  ``fadvise``
>         possibly called by the fadvise64() system call.
>
> +``fd_install``
> +       called by the VFS when a file descriptor is installed in the
> +       process's file descriptor table, regardless how the file descriptor
> +       was acquired -- be it via the open syscall, received over IPC, etc.
> +
>  Note that the file operations are implemented by the specific
>  filesystem in which the inode resides.  When opening a device node
>  (character or block special) most filesystems will call special
> diff --git a/fs/file.c b/fs/file.c
> index abb8b7081d7a..f5db8622b851 100644
> --- a/fs/file.c
> +++ b/fs/file.c
> @@ -616,6 +616,9 @@ void __fd_install(struct files_struct *files, unsigned int fd,
>  void fd_install(unsigned int fd, struct file *file)
>  {
>         __fd_install(current->files, fd, file);
> +
> +       if (file->f_op->fd_install)
> +               file->f_op->fd_install(fd, file);
>  }
>
>  EXPORT_SYMBOL(fd_install);
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index f5abba86107d..b976fbe8c902 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -1864,6 +1864,7 @@ struct file_operations {
>                                    struct file *file_out, loff_t pos_out,
>                                    loff_t len, unsigned int remap_flags);
>         int (*fadvise)(struct file *, loff_t, loff_t, int);
> +       void (*fd_install)(int, struct file *);
>  } __randomize_layout;
>
>  struct inode_operations {
> --
> 2.28.0.163.g6104cc2f0b6-goog
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
