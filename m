Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AFE307EEF
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 20:46:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757886EA22;
	Thu, 28 Jan 2021 19:46:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93DF6E9CF
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 19:21:20 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id o63so4915007pgo.6
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 11:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t7cdO3p2LDzHlz2Hrhn2F19GJzOY36dqtjQ3Rxczlx0=;
 b=TKObny7//Im0/FRfVmAnOl4bRdpRMCwcEFsmbIMFvezlFmAZ28nz5mJypjzQfZrd/F
 Xq7usP0wNy3uRlb13g8XpKwGTShGrpe0bsNaOyZ87u7Pf2BkvQ7aTnprb9TqXhdLSxG1
 ISpBXdfJ6bup53/Xh+MJ40lgkAwNc0Q+w3djq9m5r41bJoP+oqDqe/SOxJWHF/XNVkNJ
 e3abjlW8sJOAVXmC6pKxZrK8/EOByYVxUITTrnVniElfamhD5YgIrqkkHR1iFDRW5Cfg
 GsNuM8+oJ6TegOfp8s9S8NQSTBi4nX9THsLSy9c2Uei91O7HwCgoyqUc39PeExwcuYZg
 gQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t7cdO3p2LDzHlz2Hrhn2F19GJzOY36dqtjQ3Rxczlx0=;
 b=Ab+Ny8FB1TL4N9rnoWfMQdmglzs+wXm1BAgETcsbDo8TmjsVBm05Yg3o3O3Ksg4IYF
 bK2G+1TpcXQ5f/Qfx1lBFS+6bRSKGXViFI434ltg5DJXHyu0lxAM3wGZ5GOB7oUGyG3j
 T0TKvpKGyjDPZtiRPDPDFEZjDJVEgaNU+CpZXptWImVmOxP7Tkze6L85PG1zntbdtYv+
 vT1H9RsCVNhEtswNdNKmF89m4dJVQPJ/iNL8Il579QgXm6+nGRhdJFzSEkWwa+CmZbbl
 BOKcIUB8Xs7X89obw6jfOQ1EIFawcjXJkPBFA9zS5AvvCe/ELL6Brxtb55DmAnJnFq/u
 LgIQ==
X-Gm-Message-State: AOAM531SLYAi0k8Uu1wW2o+mEAUQ3hr3e14EGmkEKEA4wAFecweIrVIW
 VcwsZOK3qqLsFsDaI8bz7sscS6ZiXDAXLI+CtAo1nA==
X-Google-Smtp-Source: ABdhPJzucOY7Wf5rDg/yIKU4Bna7vFQxUsOQUmmwpxjGh5skR73VZpdTE+rg2c7nmuBRiXiLo7kEyjINx0TNrAU+dAg=
X-Received: by 2002:a63:5309:: with SMTP id h9mr913629pgb.19.1611861680197;
 Thu, 28 Jan 2021 11:21:20 -0800 (PST)
MIME-Version: 1.0
References: <20210128182432.2216573-1-kaleshsingh@google.com>
 <20210128182432.2216573-3-kaleshsingh@google.com>
 <94bd3e83-698f-ea80-f3ff-a69fc3d39217@infradead.org>
In-Reply-To: <94bd3e83-698f-ea80-f3ff-a69fc3d39217@infradead.org>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Thu, 28 Jan 2021 14:21:07 -0500
Message-ID: <CAC_TJvc=m6bMsqPPDijksPkA-8TxUnv7c3yD8Tm_BdY90CXavA@mail.gmail.com>
Subject: Re: [PATCH 2/2] dmabuf: Add dmabuf inode no to fdinfo
To: Randy Dunlap <rdunlap@infradead.org>
X-Mailman-Approved-At: Thu, 28 Jan 2021 19:44:34 +0000
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
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>,
 Andrei Vagin <avagin@gmail.com>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Michel Lespinasse <walken@google.com>, Jeffrey Vander Stoep <jeffv@google.com>,
 "Cc: Android Kernel" <kernel-team@android.com>,
 Alexey Dobriyan <adobriyan@gmail.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Bernd Edlinger <bernd.edlinger@hotmail.de>,
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Alexey Gladkov <gladkov.alexey@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Minchan Kim <minchan@kernel.org>, Yafang Shao <laoar.shao@gmail.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 28, 2021 at 1:55 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 1/28/21 10:24 AM, Kalesh Singh wrote:
> > The dmabuf inode number allows userspace to uniquely identify the buffer
> > and avoids a dependency on /proc/<pid>/fd/* when accounting per-process
> > DMA buffer sizes.
> >
> > Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> > ---
> >  drivers/dma-buf/dma-buf.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 9ad6397aaa97..d869099ede83 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -414,6 +414,7 @@ static void dma_buf_show_fdinfo(struct seq_file *m, struct file *file)
> >  {
> >       struct dma_buf *dmabuf = file->private_data;
> >
> > +     seq_printf(m, "dmabuf_inode_no:\t%lu\n", file_inode(file)->i_ino);
> >       seq_printf(m, "size:\t%zu\n", dmabuf->size);
> >       /* Don't count the temporary reference taken inside procfs seq_show */
> >       seq_printf(m, "count:\t%ld\n", file_count(dmabuf->file) - 1);
> >
>
> [resending; hopefully the first one didn't go anywhere]
>
>
> Hi,
>
> The subject is a little confusing.
> It seems to say that the dmabuf inode no is being added to /proc/<pid>/fdinfo,
> but looking at the code, it is being added to /proc/dmabuf (or /proc/<pid>/dmabuf).
>
> Please clarify.
>
> and is the /proc file format documented anywhere?

Hi Randy,

The patch adds the inode number in /proc/<pid>/fdinfo/* and
/proc/<pid>/task/<tid>/fdinfo/* for FDs corresponding to dmabufs.
fdinfo is documented in proc man pages, but it doesn't include the
dmabuf specific fields, so this will need to be updated. I hope this
clarifies.

Thanks,
Kalesh

>
>
> thanks.
>
> --
> ~Randy
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
