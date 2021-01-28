Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F09F307EF1
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 20:46:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0E46EA25;
	Thu, 28 Jan 2021 19:46:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E396E219
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 19:12:31 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id y205so4626695pfc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 11:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IBcaBxN7rIYPltmLF4tz+shL5hdw0svuXh9/OlgZjcM=;
 b=pMRhqDW7RRYahqumIx8lD//Y2GZakdZJ/lq6Bt6+NzvNTNztEopb6IXKXtOZ7jSexb
 Q7DA+EnqIXVwXXP4fO17mIRhFCIvOYyDeNtwRgH8gZOHtNJKPdyMrGxLKkCWJFaOZsEH
 FEKhUOj5MemPg31DqNoFoxNg5HK1MESDbC7mVVJkR2fvPQvg1+3fXP1GQX0wiKwCRQJL
 zjUsFJcVEPsbePciGF2X7DZmVck78aL157Z58+VVMC3JoSC1mXlN8S7rgM8joCxZVc4T
 BCKv+ZNJTTKDsMT7su69+GyqcJ+v7ONIvo8ZMsC/egvoUt152Rz8kYMKzMhkcHhbdgLm
 hI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IBcaBxN7rIYPltmLF4tz+shL5hdw0svuXh9/OlgZjcM=;
 b=ISwTfzdvRGtK1Q9p62OH7Hmu2+caDatgqDVHLxmJsMdVwIwmNAFHS8gdhmdhcOEY+i
 p//WeW24P3r6xdkFN4ayrakjmPtXZMty5tAB1gS5QGuB8omaAnTh3vZaOM8kfGcGMxO+
 otZOu9qmKodjPE6o78YUKk++jlhKeX7TeLBJkNe6vaEEs0wYELkw/RDllNxL8j8n8yl/
 jtx0LblJQIwv8cc/FTYjg+HCQ3hbHOB5y45+YXgBIMm1ZgeFseGl3P2oRZNx9GK86XSI
 2z9zjjATBu31DNRYh8d/71fQsZ/S1xdxIAgw/K/BHC6wmWw22O+VSMoPUz5++jNBMy2e
 dLJQ==
X-Gm-Message-State: AOAM531FZ5B73MosQpSau7XSHwJrevdX/8b5WORe/xMSqjqqoBBFLzFB
 MTJynVlql38hMjn68OMi3qz3JgABFQePMvpnj/demw==
X-Google-Smtp-Source: ABdhPJyUv+dwd5WmKqNz38zZST1AP9P7WbtSgmpv3u0AckrDw+zwOSpL51rCjkrQcRQq9tWDnAWSbybhCw0ZlnYaPhY=
X-Received: by 2002:aa7:910a:0:b029:1c8:9947:305c with SMTP id
 10-20020aa7910a0000b02901c89947305cmr896292pfh.75.1611861150754; Thu, 28 Jan
 2021 11:12:30 -0800 (PST)
MIME-Version: 1.0
References: <20210128182432.2216573-1-kaleshsingh@google.com>
 <20210128182432.2216573-2-kaleshsingh@google.com>
 <CAJuCfpGgoFyRxm9__5ZwOnCahoUCi0y+-q7s-x10_4JKOq9y1w@mail.gmail.com>
In-Reply-To: <CAJuCfpGgoFyRxm9__5ZwOnCahoUCi0y+-q7s-x10_4JKOq9y1w@mail.gmail.com>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Thu, 28 Jan 2021 14:12:17 -0500
Message-ID: <CAC_TJveR2kJ044CjS5qJ7EFcrW1-B198sLDqKwwVWbA63DHWmg@mail.gmail.com>
Subject: Re: [PATCH 1/2] procfs: Allow reading fdinfo with PTRACE_MODE_READ
To: Suren Baghdasaryan <surenb@google.com>
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
 kernel-team <kernel-team@android.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 linux-media <linux-media@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 Jann Horn <jannh@google.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Bernd Edlinger <bernd.edlinger@hotmail.de>,
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

On Thu, Jan 28, 2021 at 2:04 PM Suren Baghdasaryan <surenb@google.com> wrote:
>
> On Thu, Jan 28, 2021 at 10:24 AM Kalesh Singh <kaleshsingh@google.com> wrote:
> >
> > Since fdinfo doesn't permit reading process memory and manipulating
> > process state, allow accessing fdinfo under PTRACE_MODE_READ_FSCRED.
>
> I would copy some of the reasoning from your cover letter so that this
> patch has more context on its own when merged.

Sounds good. I'll update this description in the next version.

>
> >
> > Suggested-by: Jann Horn <jannh@google.com>
> > Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> > ---
> >  fs/proc/base.c |  4 ++--
> >  fs/proc/fd.c   | 15 ++++++++++++++-
> >  2 files changed, 16 insertions(+), 3 deletions(-)
> >
> > diff --git a/fs/proc/base.c b/fs/proc/base.c
> > index b3422cda2a91..a37f9de7103f 100644
> > --- a/fs/proc/base.c
> > +++ b/fs/proc/base.c
> > @@ -3160,7 +3160,7 @@ static const struct pid_entry tgid_base_stuff[] = {
> >         DIR("task",       S_IRUGO|S_IXUGO, proc_task_inode_operations, proc_task_operations),
> >         DIR("fd",         S_IRUSR|S_IXUSR, proc_fd_inode_operations, proc_fd_operations),
> >         DIR("map_files",  S_IRUSR|S_IXUSR, proc_map_files_inode_operations, proc_map_files_operations),
> > -       DIR("fdinfo",     S_IRUSR|S_IXUSR, proc_fdinfo_inode_operations, proc_fdinfo_operations),
> > +       DIR("fdinfo",     S_IRUGO|S_IXUGO, proc_fdinfo_inode_operations, proc_fdinfo_operations),
> >         DIR("ns",         S_IRUSR|S_IXUGO, proc_ns_dir_inode_operations, proc_ns_dir_operations),
> >  #ifdef CONFIG_NET
> >         DIR("net",        S_IRUGO|S_IXUGO, proc_net_inode_operations, proc_net_operations),
> > @@ -3504,7 +3504,7 @@ static const struct inode_operations proc_tid_comm_inode_operations = {
> >   */
> >  static const struct pid_entry tid_base_stuff[] = {
> >         DIR("fd",        S_IRUSR|S_IXUSR, proc_fd_inode_operations, proc_fd_operations),
> > -       DIR("fdinfo",    S_IRUSR|S_IXUSR, proc_fdinfo_inode_operations, proc_fdinfo_operations),
> > +       DIR("fdinfo",    S_IRUGO|S_IXUGO, proc_fdinfo_inode_operations, proc_fdinfo_operations),
> >         DIR("ns",        S_IRUSR|S_IXUGO, proc_ns_dir_inode_operations, proc_ns_dir_operations),
> >  #ifdef CONFIG_NET
> >         DIR("net",        S_IRUGO|S_IXUGO, proc_net_inode_operations, proc_net_operations),
> > diff --git a/fs/proc/fd.c b/fs/proc/fd.c
> > index cb51763ed554..585e213301f9 100644
> > --- a/fs/proc/fd.c
> > +++ b/fs/proc/fd.c
> > @@ -6,6 +6,7 @@
> >  #include <linux/fdtable.h>
> >  #include <linux/namei.h>
> >  #include <linux/pid.h>
> > +#include <linux/ptrace.h>
> >  #include <linux/security.h>
> >  #include <linux/file.h>
> >  #include <linux/seq_file.h>
> > @@ -72,6 +73,18 @@ static int seq_show(struct seq_file *m, void *v)
> >
> >  static int seq_fdinfo_open(struct inode *inode, struct file *file)
> >  {
> > +       bool allowed = false;
> > +       struct task_struct *task = get_proc_task(inode);
> > +
> > +       if (!task)
> > +               return -ESRCH;
> > +
> > +       allowed = ptrace_may_access(task, PTRACE_MODE_READ_FSCREDS);
> > +       put_task_struct(task);
> > +
> > +       if (!allowed)
> > +               return -EACCES;
> > +
> >         return single_open(file, seq_show, inode);
> >  }
> >
> > @@ -307,7 +320,7 @@ static struct dentry *proc_fdinfo_instantiate(struct dentry *dentry,
> >         struct proc_inode *ei;
> >         struct inode *inode;
> >
> > -       inode = proc_pid_make_inode(dentry->d_sb, task, S_IFREG | S_IRUSR);
> > +       inode = proc_pid_make_inode(dentry->d_sb, task, S_IFREG | S_IRUGO);
> >         if (!inode)
> >                 return ERR_PTR(-ENOENT);
> >
> > --
> > 2.30.0.365.g02bc693789-goog
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
