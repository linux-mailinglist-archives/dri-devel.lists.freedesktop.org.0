Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6B02C1F93
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 09:09:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344FF6E239;
	Tue, 24 Nov 2020 08:09:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B8089DC1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 13:53:06 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id o25so19736738oie.5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 05:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GKD+c+BERbhK3PerK4pqbY+tD6ko39fVI+C/aQeshLg=;
 b=D4uTZ+cJb47lcFigifoVMq9XCUYU9dMufeCQB5F8TcweyVHwuU+CNxGmBBvXUH3n4e
 jGSWNnt0yiaNhdJjOQJxAlQAxGdr63Cgd7nBOS9KAwI7ChZ62FqTLm3f+OxmbnhEAGeX
 DwyNalrVuhoAe5O2MRFdH4TcaPPA8Jsi9cUQud2BxA9jwxJqxcIQPzbnoDcATQT2lHOG
 9zf6BAM7bidzIBgDXdGsefWTuSSjTqW0qKu1OxUeAgfbHbf7IIuETlBkJWSGVdwTn6u+
 js3jHc3vbrDserZca5T6+iIBDAUTrhDZAbNeHzlAnlDdNnW0g9Igru6a3GBdz/EE1p5D
 Fi8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GKD+c+BERbhK3PerK4pqbY+tD6ko39fVI+C/aQeshLg=;
 b=i4A3lYF2imLt1LJiMZh3M7HyotuO9tLW9I2GJiHjxOiXAhWpkMuYS4eE1gO8GBzfhe
 0PI52CxWqHZgJRICPwDmpk3ID9kWecjSbV1YCgHaJZSOHprFqWCoUL2ZIQfGMDvH6ROx
 nEdZCCVaQWK8XOvxYJ4SWJEflZGzyj+NjslA86okS5M3xM0wiw4Kby9GJZ5E1Nk277D/
 QDcvk/+lsOgf8FYCIgia7ZHJUGwCiccDzbSKBRuonoiEhmgOgVooabP4dCAluFrwO2qi
 f96/ouyKWUk9EhqFaUOWvIzY2lBn2p38jNXmjm/lAgLUPTldT+MSJOcyICjit5NrmtEF
 7EYg==
X-Gm-Message-State: AOAM5310DgM51P7AudG4PrYVoi/iuodimjr8klu4cEamUAIjy90NA9uE
 Jk7l7m8a0bccehNdv5Irk/eIfZ9CewRbGsOITsfwyQ==
X-Google-Smtp-Source: ABdhPJxK4i0Lk3O9hvh8zfIA0brc5LtgA6CwE8bQ+rJfhMWX9xp+gz2NWr4CrsIbaEr1QSc3NaEqxuACEkab2G+uN1I=
X-Received: by 2002:aca:c657:: with SMTP id w84mr12368311oif.47.1606139586278; 
 Mon, 23 Nov 2020 05:53:06 -0800 (PST)
MIME-Version: 1.0
References: <1606115436-15332-1-git-send-email-a869920004@163.com>
In-Reply-To: <1606115436-15332-1-git-send-email-a869920004@163.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 23 Nov 2020 14:52:55 +0100
Message-ID: <CAHUa44HB6WKoubGEWFANh8SmsOU0Z=p+42AV5-At8TC1B08npA@mail.gmail.com>
Subject: Re: [PATCH] Properly check tee_shm buffer mmap offset
To: gaoyusong <a869920004@163.com>
X-Mailman-Approved-At: Tue, 24 Nov 2020 08:08:40 +0000
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Nov 23, 2020 at 8:10 AM gaoyusong <a869920004@163.com> wrote:
>
> The memmap options in tee_shm_op_mmap were not being checked for all
> sets of possible crazy values. Fix this up by properly check tee_shm
> buffer offsets.
>
> Signed-off-by: gaoyusong <a869920004@163.com>
> ---
>  drivers/tee/tee_shm.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index 827ac3d..3f762c8 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -75,6 +75,16 @@ static int tee_shm_op_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
>  {
>         struct tee_shm *shm = dmabuf->priv;
>         size_t size = vma->vm_end - vma->vm_start;
> +       unsigned long offset;
> +
> +       /* Check dmabuffer mmap offset */
> +       if (vma->vm_pgoff > (~0UL >> PAGE_SHIFT))
> +               return -EINVAL;
> +
> +       offset = vma->vm_pgoff << PAGE_SHIFT;
> +
> +       if (offset > shm->size || size > shm->size - offset)
> +               return -EINVAL;

If we would have used vm_pgoff below to offset into the shm buffer
these checks would be needed.
Currently we're ignoring this field though. That might be a bit
inconsistent with the mmap() API, but on the other hand this buffer
has just been carved out of the shared memory pool for the purpose of
mapping it in user space. To carve out more than we're going to map
would be wasteful so I guess that in the end it makes sense to ignore
vm_pgoff.

Thanks,
Jens

>
>         /* Refuse sharing shared memory provided by application */
>         if (shm->flags & TEE_SHM_USER_MAPPED)
> --
> 1.8.3.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
