Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D4AAC9A04
	for <lists+dri-devel@lfdr.de>; Sat, 31 May 2025 10:18:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9162910E291;
	Sat, 31 May 2025 08:18:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hl6jGlxN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDFF810E07D
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 13:43:55 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-ad8a8da2376so335629166b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 06:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748612634; x=1749217434; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cg27jRbqgT6Vx96cOZmKzT7mRTBBHTh/rcABmd3nHl0=;
 b=Hl6jGlxNnLTVu+B2uw+6iYPD19wkomc6w5nMDQoW4jMnPoyXuVF8m4iteQie45olPq
 OeThXlcByMRZeQphPmfZysVsz0gRSxWpANJKnsmy+SByqZQ5AkCv+cZGQEv+whq7N9Eh
 kTrPOQO4/9PzT9jbtVd9c25TXsHfA790ZLtsEvKrDgDsPdQL+0/l3P6R+TomS/isTOQd
 GR61BHkKdEsdiwz5vTlwfLd0dS9eKTm3yh9pTxorR2NTIx/qyn7IsMxwCf4i8kHRwVUl
 2LDdfLdr4aMRiFsNWW1z5I0TI85OSG36aw77f0OvLCxefz4tGDfNzJaFr9h4SbAspDNE
 BPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748612634; x=1749217434;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cg27jRbqgT6Vx96cOZmKzT7mRTBBHTh/rcABmd3nHl0=;
 b=VHO4UqgUh9OsSIywC3bC/hpRNSuZJS5lb/L4ruBGusYh4tgct8m/Pfw5i8NvxxbveP
 VG5g/PwqqpSKKsCW0NEKuYYSsmkJkTnkAxLAwOTE1nH6jhqQ/+xYnEUNaRtdujREPOTv
 CN4CZ7I7vS1V0JuFxesiRB19fKGyAhQzBK/tvUlRP+v/rwWLs+M42JYac6HyiXyJpudq
 UQkFKewhbi2A0V+E6OUX3QgLPv9OsLP4EM+aKtiv7GMgwq8XJyrrV8OZWhAp1Hit2uEf
 470zQdBBdbL0+OoAwHGeUWN7pU/uEobbN5+2ieg/tZ4D/+szbk+gT3fPy6bU+aiP9RNy
 bziQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2cdJ8CvoxtniCExJ8YvWPQIZvbbd20granLhiLA7GI1C1bFGq4jJ8BvMwp4jmMZH4Vm6uEBr+3Io=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywn8VyESKZ6cIKsAVtArFwOWU6TGj/eyZjv3EwEF0YAwe1ghDbr
 nghe1kucQC/3liyWMIudcayss9VzZgLyBbWk47TH2SvmYSzj9tAWlBOkIti05iNk5qWpG67deZL
 Sc20pAk6jhcnwm6uIuGFz4MOw5Cgjf38=
X-Gm-Gg: ASbGncsmEE+BrJyKVFeSkFPdXC0kPnaQBhREih/4P3KEHvJwD4x0P4kSOOZA8bxn8d+
 GuV+hIktyR/0R5dLFy4D6dwD4nBYMVr7OwjuVDl1VVlK7pebp4pw6STGjhdEkkpR59cqSDlhMTz
 cmCw9/UoIfwJihvcPcw2vOjIukhcffaJoB
X-Google-Smtp-Source: AGHT+IHvBpjR/endSRQUt5FTF0eDLYH+Kdk5Qc8W51rWZR6eg4HtuFzDot8VeE8MsEjFbuxlldLzfxh7KxymP/Pqh8M=
X-Received: by 2002:a17:907:9282:b0:ad8:959c:c55d with SMTP id
 a640c23a62f3a-adb322457f2mr313580966b.2.1748612634069; Fri, 30 May 2025
 06:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250530103941.11092-1-tao.wangtao@honor.com>
 <20250530103941.11092-2-tao.wangtao@honor.com>
In-Reply-To: <20250530103941.11092-2-tao.wangtao@honor.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 30 May 2025 15:43:43 +0200
X-Gm-Features: AX0GCFshwnygoYp9lqAc5QflEKgeVEHCIAtDwsKnm5KS2y3iB6_sX14JgNpIns4
Message-ID: <CAOQ4uxid9dn3akvN3gMBVOJXoazF5gm6xO+=eaRCzDaC62K5OA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] fs: allow cross-FS copy_file_range for
 memory-backed files
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
X-Mailman-Approved-At: Sat, 31 May 2025 08:18:51 +0000
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

On Fri, May 30, 2025 at 12:40=E2=80=AFPM wangtao <tao.wangtao@honor.com> wr=
ote:
>
> Memory-backed files can optimize copy performance via
> copy_file_range callbacks. Compared to mmap&read: reduces
> GUP (get_user_pages) overhead; vs sendfile/splice: eliminates
> one memory copy; supports dmabuf zero-copy implementation.
>
> Signed-off-by: wangtao <tao.wangtao@honor.com>
> ---

Hi wangtao,

Let me rephrase my reaction gently:
Regardless of the proposed API extension, and referring to the
implementation itself -
I wrote the current code and I can barely understand the logic every time
I come back to read it.

Your changes make it too messy to be reviewed/maintained.
I have a few suggestions for simplifications (see below).

The complication arise from the fact that normally the destination fops
are used to call the copy_range() method and this case is a deviation
from this standard, we need to make the cope simpler using a helper
to choose the fops to use.

>  fs/read_write.c    | 71 +++++++++++++++++++++++++++++++++-------------
>  include/linux/fs.h |  2 ++
>  2 files changed, 54 insertions(+), 19 deletions(-)
>
> diff --git a/fs/read_write.c b/fs/read_write.c
> index bb0ed26a0b3a..591c6db7b785 100644
> --- a/fs/read_write.c
> +++ b/fs/read_write.c
> @@ -1469,6 +1469,20 @@ COMPAT_SYSCALL_DEFINE4(sendfile64, int, out_fd, in=
t, in_fd,
>  }
>  #endif
>
> +static inline bool is_copy_memory_file_to_file(struct file *file_in,
> +                               struct file *file_out)
> +{
> +       return (file_in->f_op->fop_flags & FOP_MEMORY_FILE) &&
> +               file_in->f_op->copy_file_range && file_out->f_op->write_i=
ter;
> +}
> +
> +static inline bool is_copy_file_to_memory_file(struct file *file_in,
> +                               struct file *file_out)
> +{
> +       return (file_out->f_op->fop_flags & FOP_MEMORY_FILE) &&
> +               file_in->f_op->read_iter && file_out->f_op->copy_file_ran=
ge;
> +}
> +

Please combine that to a helper:
const struct file_operations *memory_copy_file_ops(struct file
*file_in, struct file *file_out)
which returns either file_in->f_op, file_out->f_op or NULL.


>  /*
>   * Performs necessary checks before doing a file copy
>   *
> @@ -1484,11 +1498,23 @@ static int generic_copy_file_checks(struct file *=
file_in, loff_t pos_in,
>         struct inode *inode_out =3D file_inode(file_out);
>         uint64_t count =3D *req_count;
>         loff_t size_in;
> +       bool splice =3D flags & COPY_FILE_SPLICE;
> +       bool has_memory_file;
>         int ret;
>
> -       ret =3D generic_file_rw_checks(file_in, file_out);
> -       if (ret)
> -               return ret;
> +       /* Skip generic checks, allow cross-sb copies for dma-buf/tmpfs *=
/
> +       has_memory_file =3D is_copy_memory_file_to_file(file_in, file_out=
) ||
> +                         is_copy_file_to_memory_file(file_in, file_out);
> +       if (!splice && has_memory_file) {
> +               if (!(file_in->f_mode & FMODE_READ) ||
> +                   !(file_out->f_mode & FMODE_WRITE) ||
> +                   (file_out->f_flags & O_APPEND))
> +                       return -EBADF;

I don't like that this both duplicates code and does not check all the chec=
ks in
generic_file_rw_checks() for the non-memory file side.
I do not currently have a suggestion how to make this less messy,
more human readable and correct.

> +       } else {
> +               ret =3D generic_file_rw_checks(file_in, file_out);
> +               if (ret)
> +                       return ret;
> +       }
>
>         /*
>          * We allow some filesystems to handle cross sb copy, but passing
> @@ -1500,7 +1526,7 @@ static int generic_copy_file_checks(struct file *fi=
le_in, loff_t pos_in,
>          * and several different sets of file_operations, but they all en=
d up
>          * using the same ->copy_file_range() function pointer.
>          */
> -       if (flags & COPY_FILE_SPLICE) {
> +       if (splice || has_memory_file) {
>                 /* cross sb splice is allowed */

This comment is not accurate - it should say "cross fs-type", because it sk=
ips
the test that compares the ->copy_file_range pointers, not the sb.
If you are making changes to this function, this should be clarified.

>         } else if (file_out->f_op->copy_file_range) {
>                 if (file_in->f_op->copy_file_range !=3D
> @@ -1581,23 +1607,30 @@ ssize_t vfs_copy_file_range(struct file *file_in,=
 loff_t pos_in,
>          * same sb using clone, but for filesystems where both clone and =
copy
>          * are supported (e.g. nfs,cifs), we only call the copy method.
>          */
> -       if (!splice && file_out->f_op->copy_file_range) {
> -               ret =3D file_out->f_op->copy_file_range(file_in, pos_in,
> -                                                     file_out, pos_out,
> -                                                     len, flags);
> -       } else if (!splice && file_in->f_op->remap_file_range && samesb) =
{
> -               ret =3D file_in->f_op->remap_file_range(file_in, pos_in,
> -                               file_out, pos_out,
> -                               min_t(loff_t, MAX_RW_COUNT, len),
> -                               REMAP_FILE_CAN_SHORTEN);
> -               /* fallback to splice */
> -               if (ret <=3D 0)
> +       if (!splice) {
> +               if (is_copy_memory_file_to_file(file_in, file_out)) {
> +                       ret =3D file_in->f_op->copy_file_range(file_in, p=
os_in,
> +                                       file_out, pos_out, len, flags);
> +               } else if (is_copy_file_to_memory_file(file_in, file_out)=
) {
> +                       ret =3D file_out->f_op->copy_file_range(file_in, =
pos_in,
> +                                       file_out, pos_out, len, flags);
> +               } else if (file_out->f_op->copy_file_range) {
> +                       ret =3D file_out->f_op->copy_file_range(file_in, =
pos_in,
> +                                                       file_out, pos_out=
,
> +                                                       len, flags);
> +               } else if (file_in->f_op->remap_file_range && samesb) {
> +                       ret =3D file_in->f_op->remap_file_range(file_in, =
pos_in,
> +                                       file_out, pos_out,
> +                                       min_t(loff_t, MAX_RW_COUNT, len),
> +                                       REMAP_FILE_CAN_SHORTEN);
> +                       /* fallback to splice */
> +                       if (ret <=3D 0)
> +                               splice =3D true;
> +               } else if (samesb) {
> +                       /* Fallback to splice for same sb copy for backwa=
rd compat */
>                         splice =3D true;
> -       } else if (samesb) {
> -               /* Fallback to splice for same sb copy for backward compa=
t */
> -               splice =3D true;
> +               }

This is the way-too-ugly-to-live part.
Was pretty bad before and now it is unacceptable.
way too much unneeded nesting and too hard to follow.

First of all, please use splice label and call goto splice (before the comm=
ent)
instead of adding another nesting level.
I would do that even if not adding memory fd copy support.

Second, please store result of mem_fops =3D memory_copy_file_ops()
and start with:
+    if (mem_fops) {
+        ret =3D mem_fops->copy_file_range(file_in, pos_in,
+
file_out, pos_out,
+                                                               len, flags)=
;
 +   } else if (file_out->f_op->copy_file_range) { ...

and update the comment above to say that:
+ * For copy to/from memory fd, we alway call the copy method of the memory=
 fd.
   */

I think that makes the code not more ugly than it already is.

Thanks,
Amir.
