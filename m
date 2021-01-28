Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A66307EE6
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 20:45:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 689596EA0A;
	Thu, 28 Jan 2021 19:44:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 348986E219
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 19:04:21 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d16so6471875wro.11
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 11:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z1mBGE+hWjeJJ/jGNDjKQ5+t0s9/hE5JODYqUiqWYZA=;
 b=rysu7fnjSZ3DILzttNso1/0g/N3zCYMKhXgrxC1OufVIp6lLbIrV7JvB+BlCHqK2dT
 iXVHDaoN2Ok+zIVAYM2vdF3bVYefHgwadDk4X/VGj49rSrrmwZsp8d/2UpmHehpjRQ16
 LB+L1azCnOsgTh1ihv736TUwHuMa/3Mz1lzv7OdxfIzqzD3bIjC6XBUaZQu5jWANlxf1
 4gK5RKCrNsYaay9DAylL9nawtc16MzHLzK+d92taVuLc/j7bx6uPvy66AIFBhVmTOpxj
 YGM6kLjSgoIDM14c0iJzPUyNSQ+C8UrnKcrh7UGJZwOyl52PGche933P/5Hx9viCR0To
 u0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z1mBGE+hWjeJJ/jGNDjKQ5+t0s9/hE5JODYqUiqWYZA=;
 b=gOfsExjJhvhoM+gUPY/ya2fB5/o2LWlDgsKG5zmX5gikD1K4IdiuTjtuCsubb/X2Mw
 3Z5QyzY2dAojp85NpamXhjZXmxErGOXViSJ3PnRkq4gA8Ta+Px25b23Bb9l1MCvrnl02
 PVocNxXIdeg89N9UMZcoNlOApNK0lLptJ2QTkgPudSlssJkX+C4yEm9ii5QHDBsgsNdZ
 m+d3nmAdhHp1oQorXmneLdBV/RHabnqkQFgPeQhDr6RarO6Wjea17Y8WcC7xiG4Vb4XI
 oBw4SpWw6PFFOmt3dDwdzfkVT9eTKNXDFDrd3DtiatgIsrSFueGgSMUGA3NPf/uz3dCp
 N3WA==
X-Gm-Message-State: AOAM530YCE13aZIcjxoHnvB+ZLT6R0PPollXsvpO+NuDzYBzs96z26ys
 utMTn2Vtn7PNEOdmKHyi2Wn/p6Ws3PJj4/yE007nfg==
X-Google-Smtp-Source: ABdhPJzU+yAZDVUahLL+Mz4iW/dd2qmW35B9XB0ElgmFdSQqyl9/AMlBhPYuxZI/BQrVQsSRS953LG8fPGEYLieTXus=
X-Received: by 2002:adf:e50e:: with SMTP id j14mr633534wrm.162.1611860659790; 
 Thu, 28 Jan 2021 11:04:19 -0800 (PST)
MIME-Version: 1.0
References: <20210128182432.2216573-1-kaleshsingh@google.com>
 <20210128182432.2216573-2-kaleshsingh@google.com>
In-Reply-To: <20210128182432.2216573-2-kaleshsingh@google.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 28 Jan 2021 11:04:09 -0800
Message-ID: <CAJuCfpGgoFyRxm9__5ZwOnCahoUCi0y+-q7s-x10_4JKOq9y1w@mail.gmail.com>
Subject: Re: [PATCH 1/2] procfs: Allow reading fdinfo with PTRACE_MODE_READ
To: Kalesh Singh <kaleshsingh@google.com>
X-Mailman-Approved-At: Thu, 28 Jan 2021 19:44:35 +0000
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
 linux-fsdevel@vger.kernel.org, Bernd Edlinger <bernd.edlinger@hotmail.de>,
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

On Thu, Jan 28, 2021 at 10:24 AM Kalesh Singh <kaleshsingh@google.com> wrote:
>
> Since fdinfo doesn't permit reading process memory and manipulating
> process state, allow accessing fdinfo under PTRACE_MODE_READ_FSCRED.

I would copy some of the reasoning from your cover letter so that this
patch has more context on its own when merged.

>
> Suggested-by: Jann Horn <jannh@google.com>
> Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> ---
>  fs/proc/base.c |  4 ++--
>  fs/proc/fd.c   | 15 ++++++++++++++-
>  2 files changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/fs/proc/base.c b/fs/proc/base.c
> index b3422cda2a91..a37f9de7103f 100644
> --- a/fs/proc/base.c
> +++ b/fs/proc/base.c
> @@ -3160,7 +3160,7 @@ static const struct pid_entry tgid_base_stuff[] = {
>         DIR("task",       S_IRUGO|S_IXUGO, proc_task_inode_operations, proc_task_operations),
>         DIR("fd",         S_IRUSR|S_IXUSR, proc_fd_inode_operations, proc_fd_operations),
>         DIR("map_files",  S_IRUSR|S_IXUSR, proc_map_files_inode_operations, proc_map_files_operations),
> -       DIR("fdinfo",     S_IRUSR|S_IXUSR, proc_fdinfo_inode_operations, proc_fdinfo_operations),
> +       DIR("fdinfo",     S_IRUGO|S_IXUGO, proc_fdinfo_inode_operations, proc_fdinfo_operations),
>         DIR("ns",         S_IRUSR|S_IXUGO, proc_ns_dir_inode_operations, proc_ns_dir_operations),
>  #ifdef CONFIG_NET
>         DIR("net",        S_IRUGO|S_IXUGO, proc_net_inode_operations, proc_net_operations),
> @@ -3504,7 +3504,7 @@ static const struct inode_operations proc_tid_comm_inode_operations = {
>   */
>  static const struct pid_entry tid_base_stuff[] = {
>         DIR("fd",        S_IRUSR|S_IXUSR, proc_fd_inode_operations, proc_fd_operations),
> -       DIR("fdinfo",    S_IRUSR|S_IXUSR, proc_fdinfo_inode_operations, proc_fdinfo_operations),
> +       DIR("fdinfo",    S_IRUGO|S_IXUGO, proc_fdinfo_inode_operations, proc_fdinfo_operations),
>         DIR("ns",        S_IRUSR|S_IXUGO, proc_ns_dir_inode_operations, proc_ns_dir_operations),
>  #ifdef CONFIG_NET
>         DIR("net",        S_IRUGO|S_IXUGO, proc_net_inode_operations, proc_net_operations),
> diff --git a/fs/proc/fd.c b/fs/proc/fd.c
> index cb51763ed554..585e213301f9 100644
> --- a/fs/proc/fd.c
> +++ b/fs/proc/fd.c
> @@ -6,6 +6,7 @@
>  #include <linux/fdtable.h>
>  #include <linux/namei.h>
>  #include <linux/pid.h>
> +#include <linux/ptrace.h>
>  #include <linux/security.h>
>  #include <linux/file.h>
>  #include <linux/seq_file.h>
> @@ -72,6 +73,18 @@ static int seq_show(struct seq_file *m, void *v)
>
>  static int seq_fdinfo_open(struct inode *inode, struct file *file)
>  {
> +       bool allowed = false;
> +       struct task_struct *task = get_proc_task(inode);
> +
> +       if (!task)
> +               return -ESRCH;
> +
> +       allowed = ptrace_may_access(task, PTRACE_MODE_READ_FSCREDS);
> +       put_task_struct(task);
> +
> +       if (!allowed)
> +               return -EACCES;
> +
>         return single_open(file, seq_show, inode);
>  }
>
> @@ -307,7 +320,7 @@ static struct dentry *proc_fdinfo_instantiate(struct dentry *dentry,
>         struct proc_inode *ei;
>         struct inode *inode;
>
> -       inode = proc_pid_make_inode(dentry->d_sb, task, S_IFREG | S_IRUSR);
> +       inode = proc_pid_make_inode(dentry->d_sb, task, S_IFREG | S_IRUGO);
>         if (!inode)
>                 return ERR_PTR(-ENOENT);
>
> --
> 2.30.0.365.g02bc693789-goog
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
