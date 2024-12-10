Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB26B9EBE2B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 23:51:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DEF110E0AE;
	Tue, 10 Dec 2024 22:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="P9Q9Oefs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4548910E0AE
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 22:51:41 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-e3a58827e25so1680512276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 14:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google; t=1733871100; x=1734475900;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Of5DDpOleFOvOX8j9iWLw9UYEkdTXgB6XMX5OY79lzQ=;
 b=P9Q9Oefs2MPEb9GlKOTn2seYbfe0pUGvA9eOsSqs56RLPr4PKCdgn/PfIAr0Iyhqts
 IFYsZfOEsDmku296/ooBUiSLg0cv4SsSP0JaQVO9lOUTUmRC5YzObZRAzX6ncUokrUa6
 J1RJn9XFoKa4afLTQWAZs2X64+Tk1+EmR5FCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733871100; x=1734475900;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Of5DDpOleFOvOX8j9iWLw9UYEkdTXgB6XMX5OY79lzQ=;
 b=Q3XMXoQh84IxigCKvjhJ1uovtm6g+tpQVBYN7DM1UzHS+Nsdctgdg+sw3X7cOaYOZv
 nUYQ+aEu5CEbutr8YcZRPLL4O7NUYt0SrZcPxeWHdU0Ox27asTCgumHyImb+WucbGm+h
 U5+m/lCsHxDqGbvc448YDK9+qxovJeJRUd2XL/rCjWJz307gK8OGYS1Kb5Sm3EHCFAbq
 TklHizoFwQZhWAqKCLMhJuLV7gQdUY0nvGFawZ6TCCsP6aJG5th8eSuDlHxeOfZUWL0l
 3tWyznP9HOnrBsCYTGHi1Wdwiati0fY4yz3Hl7+t4xmxYO3jvlJnslUZQqiZDG/dRJ50
 87cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRpbe+XJlO0tjEz2eyW3771+ClJpf3Ush3HoXzik8xXdhhe6v0yGEXMClAHmqdDLG/073DbMII0X0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1bA+lKsyTwYtyp7YnzsOoB+0RV3vKJUMemv/gwtUhHhjjmNB4
 CIh4vqkuR+PjrQ/LqTrzpKUzDSr8hGptO3fL0Y0ZMIKp+G4dyPkagtq89M9OFR8PQwkQxFT3eZG
 jYT//+Hhw3TKrTG5IjRElQ2zJzZK75NAPUtO4BA==
X-Gm-Gg: ASbGncuYimk5eO+epyBGXKLZKcOyfeza10V6JDsXnlZHV1BFOBOnnRTguw9H3S5cGYu
 700QcR6PI/mdcs47YKw5cLpAZVCKXQS2Z5gYF
X-Google-Smtp-Source: AGHT+IGbV0oeq+nxJsXu16SzSxYPduPX1VVqzU+lMF3Y51q8XM3CkxJyeEHqg7wjGvxVi7LtqKCG8kkaYpwciZTvMTk=
X-Received: by 2002:a05:6902:2206:b0:e3a:235a:4da3 with SMTP id
 3f1490d57ef6-e3c8e48b8e6mr1094296276.24.1733871100343; Tue, 10 Dec 2024
 14:51:40 -0800 (PST)
MIME-Version: 1.0
References: <20241204-udmabuf-fixes-v2-0-23887289de1c@google.com>
 <20241204-udmabuf-fixes-v2-1-23887289de1c@google.com>
In-Reply-To: <20241204-udmabuf-fixes-v2-1-23887289de1c@google.com>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Tue, 10 Dec 2024 17:51:29 -0500
Message-ID: <CAEXW_YRb4PsFgEvHW2QBDY5dxJ+aoMTn3qtj5v9eboxO3SxPLg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] udmabuf: fix racy memfd sealing check
To: Jann Horn <jannh@google.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, John Stultz <jstultz@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, Julian Orth <ju.orth@gmail.com>,
 stable@vger.kernel.org
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

On Wed, Dec 4, 2024 at 11:27=E2=80=AFAM Jann Horn <jannh@google.com> wrote:
>
> The current check_memfd_seals() is racy: Since we first do
> check_memfd_seals() and then udmabuf_pin_folios() without holding any
> relevant lock across both, F_SEAL_WRITE can be set in between.
> This is problematic because we can end up holding pins to pages in a
> write-sealed memfd.
>
> Fix it using the inode lock, that's probably the easiest way.
> In the future, we might want to consider moving this logic into memfd,
> especially if anyone else wants to use memfd_pin_folios().

I am curious, why is it not possible to have a reproducer for this
issue, is it not reproducible and is theoretical?

thanks,

 - Joel

>
> Reported-by: Julian Orth <ju.orth@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D219106
> Closes: https://lore.kernel.org/r/CAG48ez0w8HrFEZtJkfmkVKFDhE5aP7nz=3Dobr=
imeTgpD+StkV9w@mail.gmail.com
> Fixes: fbb0de795078 ("Add udmabuf misc device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jann Horn <jannh@google.com>
> ---
>  drivers/dma-buf/udmabuf.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 8ce1f074c2d32a0a9f59ff7184359e37d56548c6..c1d8c2766d6d36fc5fe1b3d73=
057f6e01ec6678f 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -436,14 +436,19 @@ static long udmabuf_create(struct miscdevice *devic=
e,
>                         goto err;
>                 }
>
> +               /*
> +                * Take the inode lock to protect against concurrent
> +                * memfd_add_seals(), which takes this lock in write mode=
.
> +                */
> +               inode_lock_shared(file_inode(memfd));
>                 ret =3D check_memfd_seals(memfd);
> -               if (ret < 0) {
> -                       fput(memfd);
> -                       goto err;
> -               }
> +               if (ret)
> +                       goto out_unlock;
>
>                 ret =3D udmabuf_pin_folios(ubuf, memfd, list[i].offset,
>                                          list[i].size, folios);
> +out_unlock:
> +               inode_unlock_shared(file_inode(memfd));
>                 fput(memfd);
>                 if (ret)
>                         goto err;
>
> --
> 2.47.0.338.g60cca15819-goog
>
