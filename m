Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6958D230512
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 10:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 092E58972D;
	Tue, 28 Jul 2020 08:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Tue, 28 Jul 2020 08:16:33 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD048972D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 08:16:33 +0000 (UTC)
Received: from mail-qt1-f182.google.com ([209.85.160.182]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M5fQq-1jt9yH03T8-007ALe for <dri-devel@lists.freedesktop.org>; Tue, 28
 Jul 2020 10:11:27 +0200
Received: by mail-qt1-f182.google.com with SMTP id s16so14246552qtn.7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 01:11:26 -0700 (PDT)
X-Gm-Message-State: AOAM5303QoLpcwivmJkjXhTUnHFD81/WadPCcu1Y/wD86FDwF4jLIHh8
 68uKCH3tGhuSUBFf+zrHCNKYsefIjruFTUL1ZA0=
X-Google-Smtp-Source: ABdhPJxCGAB7BbsjfSD7bgaCnwv1WyrC1BKE9mDKkcAW39Ma3IJ37NCcsslzqEKXCuFNjQfzfNsrIHGbS8NsRXh+AwY=
X-Received: by 2002:aed:2946:: with SMTP id s64mr5570242qtd.204.1595923885496; 
 Tue, 28 Jul 2020 01:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200728014343.341303-1-yepeilin.cs@gmail.com>
In-Reply-To: <20200728014343.341303-1-yepeilin.cs@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 28 Jul 2020 10:11:09 +0200
X-Gmail-Original-Message-ID: <CAK8P3a29=CugbGtZRQc0abGXvexp=gBk+LwOCG3yNCPakup+NQ@mail.gmail.com>
Message-ID: <CAK8P3a29=CugbGtZRQc0abGXvexp=gBk+LwOCG3yNCPakup+NQ@mail.gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] drm/bufs: Prevent kernel-infoleak
 in copy_one_buf()
To: Peilin Ye <yepeilin.cs@gmail.com>
X-Provags-ID: V03:K1:B+6BYeOOyZpCFdtyn8Js+L+KYnoty9yDmiNAssDpwvADQIzuOMq
 mMgPap4YD9aqdjjT2KUd8HLIkKBRU3n1j44gBjIfoZD0MlkAq9WXsyuFtjxU6Ils5PYVJv8
 58PkO6JpGr5pbCz6XzyklykZOxSvTxHO5eaXzaTSoaznNhW7rr9iGkIVA7dphyQabb8dZy6
 Uz855igug00VOreWaUB0Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:s6+wc9rkA1c=:nAbCkX8CpYF0Xg736qMPWT
 njHKxRZwmeM/w+WUnIQVHuYyE8m9jZz5eQMk5uZ2pI7cPEh2RCPOlHRDKW14FzGHgGMMOxAlD
 CIk0/zS5I3pS7NjJqeGGVb2OqNGm+7eC/X42ZzcH0v8Tv40dwrJP+TXIa9PigSHungmaqaq4C
 8nqod/vhJwol8sqY78cBmrRfe3ohNgI8NcZidaxlF2RHpCFgCDB/H3t+vqzCvgLXh+meWu8L0
 Is4xAylTEPcBWlQKl/nIq+ZliFUwjoLEnwKw/GDqOVmWJ6Bh6TPHkqWxtThbPasyQx2uOcHj1
 ZHw2rXGPCQ/ObADLLEldoDYsGze2yqEG3GUJEDJen+C2T3mw3Cu2ijLmkvmAEd7mF+R5eMmFR
 M3zkvacnVn4joi3B/6H0/vmv1rDvna0Ogch6wynpO/eAr4taUMRK/FuLXtZQzewCyiCfunTFg
 jwQbl13INWNofHLDHP29b8rp0JwY5WaWX0BD8cDgbevXCaYCQeMdHG5QHreYzeSyapRLYPryO
 PrAn2DdDswlF/X1CI4IA+Qajg32c/fvcXz8TUkfd9OVTVRGzl9qqTN4tBVqY/uNlu5s6qCge7
 J4znvGbk24DIIcXFSiZn3nhIcvP8DWHaHeMZ/Qk8xhhEpsmAmrRAvJjyL2MEWTOyiGqNKpzaR
 9GU0uGtxTAIHaimG02Zn9+tWqlmXu/XSSeXjw/cSXvxoOqnVC6fpK/a/NwyUGvKRumqtTbgm1
 BzYZgL9TbwKDcs6oUVnFKEFspfN2GQnPC1WW/KfodJV6BT5fB5i1mJo+X19LD3msXrl3vkkFV
 gGZzdedYUVWTF8b/p1EX7rUGBSyFgxSe6ttpZvJ8bxop7OlpcR83Iv/FfIFYdbxjEzhVTynnM
 QElfQskAIVa+17KLrigkYUINa3v9j1nKVRGDVzsjLfE4/JKHMnlJ/0Y8v497k+t9CT5EYCHzi
 pJC0OjKLCMX3+D+q6vYP4AL7Nw5lfrCTmXAdmf/Ms9ThCsZzXCDSc
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 28, 2020 at 3:45 AM Peilin Ye <yepeilin.cs@gmail.com> wrote:
>
> copy_one_buf() is copying uninitialized stack memory to userspace due to
> the compiler not initializing holes in statically allocated structures.
> Fix it by initializing `v` with memset().

I would add 'potentially' somewhere in that description: it is architecture
dependent whether there are holes in this structure as 'enum' types
and 'long' are both dependent on the ABI, and even if there is a hole,
it is undefined behavior whether the hold gets initialized.

Other than that, the patch looks good.

> Cc: stable@vger.kernel.org
> Fixes: 5c7640ab6258 ("switch compat_drm_infobufs() to drm_ioctl_kernel()")
> Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

> ---
>  drivers/gpu/drm/drm_bufs.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
> index a0735fbc144b..f99cd4a3f951 100644
> --- a/drivers/gpu/drm/drm_bufs.c
> +++ b/drivers/gpu/drm/drm_bufs.c
> @@ -1349,10 +1349,14 @@ static int copy_one_buf(void *data, int count, struct drm_buf_entry *from)
>  {
>         struct drm_buf_info *request = data;
>         struct drm_buf_desc __user *to = &request->list[count];
> -       struct drm_buf_desc v = {.count = from->buf_count,
> -                                .size = from->buf_size,
> -                                .low_mark = from->low_mark,
> -                                .high_mark = from->high_mark};
> +       struct drm_buf_desc v;
> +
> +       memset(&v, 0, sizeof(v));
> +
> +       v.count = from->buf_count;
> +       v.size = from->buf_size;
> +       v.low_mark = from->low_mark;
> +       v.high_mark = from->high_mark;
>
>         if (copy_to_user(to, &v, offsetof(struct drm_buf_desc, flags)))
>                 return -EFAULT;
> --
> 2.25.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
