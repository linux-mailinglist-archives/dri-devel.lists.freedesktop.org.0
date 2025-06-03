Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BB0ACC4C1
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 12:56:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A7710E027;
	Tue,  3 Jun 2025 10:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YD+/Vwnd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C0910E027
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 10:56:54 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-adb2bd27c7bso771810566b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 03:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748948213; x=1749553013; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/7blXBO4JKraFXyZYVYjtLes0xIhtY9NoXA5LD7gBEk=;
 b=YD+/VwndclrUkyjX0jqGmQmL+BU1kDX5wX6WUrcb3JNamjLO7tcjJtcwNYPbrSrRY7
 X/YJnajpbfoxQvbcujLzHQpVgzj6d7qWsw2YJIXFXAzipYXew5lK1gfKgrBLbDrgRQdX
 TEL3s1b1bmzHulFVLYJE2zoyaMaqpVx5va4eyIdPLig6jeYS8j3SzJPamF+678QXxncR
 w4nxaUBKbeM5+QyFZbn5RpMK1PdcMElfpnU2bsJ8b2z7D4NX7cHM8V4bvwQQTmqztGba
 Frm7c3ZAeg7b8c7rOQub+n4xQcO1+wfDzuLznBimMusJynNvaJkI520sqsN7nhhH99gs
 1m0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748948213; x=1749553013;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/7blXBO4JKraFXyZYVYjtLes0xIhtY9NoXA5LD7gBEk=;
 b=TCZXH/MWEUNJVeadN98TF4uLCIxivlFPrRNsn142j24Ol1B6wdU+9CeIz7TMKuq/vn
 D+1wMaUN5TXuFqYUE/1wCHFPTDwS6L40Way1SWsLhesLBcYgH5axYuSgyB2tYsMQx3gN
 A6vQi2L3h+AIgZNyHGhKzxiWdZXh6F9h/ht2c1ug/EISTqQ4zOQattmK0SDrmLakC019
 hhY8dE4fdEeSp8JxuCMeJ/GfKUdfXG6fLjQWGoABNWNPEde7L2OxvzqkpW7S9njD3ZXb
 8VlK0ciVvsNlpdyEcCCMEcPPOG+p6HYEkGcverFU9WtKrWspgY/EZuaDuDfFYEibdeh7
 8jDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6Weyke+LJWilLlETyXmWLIEQUv50RswZe+tmfgGwHLPASt582W2KRhVHlT41l9LZWqkzAbxx6zq8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRMIn37qX8bVj4OGr8fhe37gnikOxUfWxyoHBEXpNZXLOgSIQ4
 M7ec5ioYk/N9P20jJKJCtVI1pype5xa2slj9ux0bTvZr4lM1S6ALJ/xoYgG1P0/AJv8TR7PB9MW
 r9l5jqllL+ykuEPtR6TQqzkcmTeXMNz8=
X-Gm-Gg: ASbGncuvInAI0K4w2k/j7ti/OLXG9sNMrXbTU69TweUySqqn3v4EqG1r42rf4U3cQDC
 3b5nAPNn5pDfKcmzwDSEUYKaHSHimmWFzl3NKO29JYtrIvmTzFw/XjcYmG/3HZ+xiicX2L90w1c
 NlfJiSEdxUalPl5zW4pnrMBUtIin4+Jfui
X-Google-Smtp-Source: AGHT+IGpvLn8hqrgPkcWVTHoe15k+0yqKJqtqmp3PMmzbuAIudjHSPH95skJXXoflNa4a233DOM5y2pvJ1SiAlHm6rU=
X-Received: by 2002:a17:907:da9:b0:ad8:97d8:a52e with SMTP id
 a640c23a62f3a-adb495983admr1239171966b.55.1748948212831; Tue, 03 Jun 2025
 03:56:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250603095245.17478-1-tao.wangtao@honor.com>
 <20250603095245.17478-2-tao.wangtao@honor.com>
In-Reply-To: <20250603095245.17478-2-tao.wangtao@honor.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 3 Jun 2025 12:56:41 +0200
X-Gm-Features: AX0GCFvUGt-jkPjKb-TaQfCiyDY6ri9AEn30VaTl2bfo8Rvzx6IYm2tIEQwOB0U
Message-ID: <CAOQ4uxgYmSLY25WtQjHxvViG0eNSSsswF77djBJZsSJCq1OyLA@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] fs: allow cross-FS copy_file_range for memory file
 with direct I/O
To: wangtao <tao.wangtao@honor.com>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, kraxel@redhat.com, 
 vivek.kasireddy@intel.com, viro@zeniv.linux.org.uk, brauner@kernel.org, 
 hughd@google.com, akpm@linux-foundation.org, benjamin.gaignard@collabora.com, 
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com, jack@suse.cz, 
 baolin.wang@linux.alibaba.com, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, bintian.wang@honor.com, yipengxiang@honor.com, 
 liulu.liu@honor.com, feng.han@honor.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 3, 2025 at 11:53=E2=80=AFAM wangtao <tao.wangtao@honor.com> wro=
te:
>
> Memory files can optimize copy performance via copy_file_range callbacks:
> -Compared to mmap&read: reduces GUP (get_user_pages) overhead
> -Compared to sendfile/splice: eliminates one memory copy
> -Supports dma-buf direct I/O zero-copy implementation
>
> Suggested by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Suggested by: Amir Goldstein <amir73il@gmail.com>
> Signed-off-by: wangtao <tao.wangtao@honor.com>
> ---
>  fs/read_write.c    | 64 +++++++++++++++++++++++++++++++++++++---------
>  include/linux/fs.h |  2 ++
>  2 files changed, 54 insertions(+), 12 deletions(-)
>
> diff --git a/fs/read_write.c b/fs/read_write.c
> index bb0ed26a0b3a..ecb4f753c632 100644
> --- a/fs/read_write.c
> +++ b/fs/read_write.c
> @@ -1469,6 +1469,31 @@ COMPAT_SYSCALL_DEFINE4(sendfile64, int, out_fd, in=
t, in_fd,
>  }
>  #endif
>
> +static const struct file_operations *memory_copy_file_ops(
> +                       struct file *file_in, struct file *file_out)
> +{
> +       if ((file_in->f_op->fop_flags & FOP_MEMORY_FILE) &&
> +           (file_in->f_mode & FMODE_CAN_ODIRECT) &&
> +           file_in->f_op->copy_file_range && file_out->f_op->write_iter)
> +               return file_in->f_op;
> +       else if ((file_out->f_op->fop_flags & FOP_MEMORY_FILE) &&
> +                (file_out->f_mode & FMODE_CAN_ODIRECT) &&
> +                file_in->f_op->read_iter && file_out->f_op->copy_file_ra=
nge)
> +               return file_out->f_op;
> +       else
> +               return NULL;
> +}
> +
> +static int essential_file_rw_checks(struct file *file_in, struct file *f=
ile_out)
> +{
> +       if (!(file_in->f_mode & FMODE_READ) ||
> +           !(file_out->f_mode & FMODE_WRITE) ||
> +           (file_out->f_flags & O_APPEND))
> +               return -EBADF;
> +
> +       return 0;
> +}
> +
>  /*
>   * Performs necessary checks before doing a file copy
>   *
> @@ -1484,9 +1509,16 @@ static int generic_copy_file_checks(struct file *f=
ile_in, loff_t pos_in,
>         struct inode *inode_out =3D file_inode(file_out);
>         uint64_t count =3D *req_count;
>         loff_t size_in;
> +       bool splice =3D flags & COPY_FILE_SPLICE;
> +       const struct file_operations *mem_fops;
>         int ret;
>
> -       ret =3D generic_file_rw_checks(file_in, file_out);
> +       /* The dma-buf file is not a regular file. */
> +       mem_fops =3D memory_copy_file_ops(file_in, file_out);
> +       if (splice || mem_fops =3D=3D NULL)

nit: use !mem_fops please

Considering that the flag COPY_FILE_SPLICE is not allowed
from userspace and is only called by nfsd and ksmbd
I think we should assert and deny the combination of
mem_fops && splice because it is very much unexpected.

After asserting this, it would be nicer to write as:
        if (mem_fops)
               ret =3D essential_file_rw_checks(file_in, file_out);
        else
               ret =3D generic_file_rw_checks(file_in, file_out);

> +       else
> +               ret =3D essential_file_rw_checks(file_in, file_out);
>         if (ret)
>                 return ret;
>
> @@ -1500,8 +1532,10 @@ static int generic_copy_file_checks(struct file *f=
ile_in, loff_t pos_in,
>          * and several different sets of file_operations, but they all en=
d up
>          * using the same ->copy_file_range() function pointer.
>          */
> -       if (flags & COPY_FILE_SPLICE) {
> +       if (splice) {
>                 /* cross sb splice is allowed */
> +       } else if (mem_fops !=3D NULL) {

With the assertion that splice && mem_fops is not allowed
if (splice || mem_fops) {

would go well together because they both allow cross-fs
copy not only cross sb.

> +               /* cross-fs copy is allowed for memory file. */
>         } else if (file_out->f_op->copy_file_range) {
>                 if (file_in->f_op->copy_file_range !=3D
>                     file_out->f_op->copy_file_range)
> @@ -1554,6 +1588,7 @@ ssize_t vfs_copy_file_range(struct file *file_in, l=
off_t pos_in,
>         ssize_t ret;
>         bool splice =3D flags & COPY_FILE_SPLICE;
>         bool samesb =3D file_inode(file_in)->i_sb =3D=3D file_inode(file_=
out)->i_sb;
> +       const struct file_operations *mem_fops;
>
>         if (flags & ~COPY_FILE_SPLICE)
>                 return -EINVAL;
> @@ -1574,18 +1609,27 @@ ssize_t vfs_copy_file_range(struct file *file_in,=
 loff_t pos_in,
>         if (len =3D=3D 0)
>                 return 0;
>
> +       if (splice)
> +               goto do_splice;
> +
>         file_start_write(file_out);
>

goto do_splice needs to be after file_start_write

Please wait for feedback from vfs maintainers before posting another
version addressing my review comments.

Thanks,
Amir.
