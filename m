Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEE7571B2F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 15:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC2494751;
	Tue, 12 Jul 2022 13:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50CC19474C;
 Tue, 12 Jul 2022 13:27:16 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id ss3so8275492ejc.11;
 Tue, 12 Jul 2022 06:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=omKDGKrDnZ/IkPXT5RBomOOPrYkiPKJbtYb6UMrNSaM=;
 b=TdIaTQTUpJe1Qw/zD95bu1yP1ZupdD6IiMyhad4UyI1OuxFJ2RWEVQXV6yPb0tat+I
 e9KgLx+90JCtfHZgNqv1WXvRgyzvc9Im/j3q1Oy5f+xbPluB41jYJbEVkhte0mN/3Ooh
 X2KSsTRVRO1BR9AS7JvKV6kEPhjiRCBNBcrBlJi1Brn6VqHGN2cYs8WEGumBrNu68GSV
 FpQSMxE9Vn4MYm4KMjvc5V6j7K2rPgJKntgD4zngMfwPBy3F418VvH6n2dFxxa8GQW1n
 QD6NknDzPlnCASKL3zadtNcKd/aC0AYe/w7B+bgTG0B8I1063JlPu9mQbfQpgZTbnxfE
 yTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=omKDGKrDnZ/IkPXT5RBomOOPrYkiPKJbtYb6UMrNSaM=;
 b=ESYMMsgsfxLj5rStd1k+kWcJCJSud+wB6sSB2UZJ3APW7nwcjz5K7lROwfA3HgV5yt
 uBgZqqamRawc/znIv5JcKEBJYhVGIyh1QmnMW4EhrHwyILO9iMTGbFJv2hWuAtmCfwmv
 gLENM0A/qiWQFoh+E22PvoxuU6NUPclLtLX031TEpn6xyBi9GcuIIsboeNOG+Kf3x/IF
 kz8dF89NI0LC1NLO439G4E1RbxPooYTOXTupro06QLLfmbvCjj3gZLc07CVl3I/q8J5s
 PivFpOOoWODnVhZIp4DlpUmcXvtw4FGr3pm4ANBaYKL3WtMzjj96Ags1aEuDlLYl265X
 sUgQ==
X-Gm-Message-State: AJIora/123bjYwLUPHQGV7rBLz6PiEyqhGf/HL8XoROurMq6F2ymjtOJ
 u4Z3y8U7nLAtCCkmob2Xs3TSvpmm0Q54JpEdM9I=
X-Google-Smtp-Source: AGRyM1vOjvHM7mJAaDS7p1aTNG5U9p4boViVosKcsmm6k5RlVqpv6fPQo4roJps+C/WvQc7z+WABdeKSoMHsgw7D5EY=
X-Received: by 2002:a17:907:2888:b0:72b:8f41:1405 with SMTP id
 em8-20020a170907288800b0072b8f411405mr168023ejc.564.1657632434858; Tue, 12
 Jul 2022 06:27:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220712102849.1562-1-christian.koenig@amd.com>
 <6570e584-7ddc-4029-0555-276020750dd2@intel.com>
 <f4804bb1-4f0e-2755-6b00-8aa0ba1c5c90@amd.com>
In-Reply-To: <f4804bb1-4f0e-2755-6b00-8aa0ba1c5c90@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Jul 2022 09:27:03 -0400
Message-ID: <CADnq5_Mv=4G1qb7J7a2nm=7cVWSbRxrRBBNKpaeajKOj_cGp3g@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: revert "return only unsignaled fences in
 dma_fence_unwrap_for_each v3"
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Karolina Drobnik <karolina.drobnik@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 12, 2022 at 8:06 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Hi Karolina,
>
> Am 12.07.22 um 14:04 schrieb Karolina Drobnik:
> > Hi Christian,
> >
> > On 12.07.2022 12:28, Christian K=C3=B6nig wrote:
> >> This reverts commit 8f61973718485f3e89bc4f408f929048b7b47c83.
> >>
> >> It turned out that this is not correct. Especially the sync_file info
> >> IOCTL needs to see even signaled fences to correctly report back their
> >> status to userspace.
> >>
> >> Instead add the filter in the merge function again where it makes sens=
e.
> >>
> >> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >
> > After applying the patch, fence merging works and all sw_sync subtests
> > are passing. Thanks for taking care of this.
> >
> > Tested-by: Karolina Drobnik <karolina.drobnik@intel.com>
>
> can anybody give me an rb or at least an Acked-by as well so that I can
> push this upstream?

Patch makes sense.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

>
> Thanks,
> Christian.
>
> >
> >> ---
> >>   drivers/dma-buf/dma-fence-unwrap.c | 3 ++-
> >>   include/linux/dma-fence-unwrap.h   | 6 +-----
> >>   2 files changed, 3 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/dma-buf/dma-fence-unwrap.c
> >> b/drivers/dma-buf/dma-fence-unwrap.c
> >> index 502a65ea6d44..7002bca792ff 100644
> >> --- a/drivers/dma-buf/dma-fence-unwrap.c
> >> +++ b/drivers/dma-buf/dma-fence-unwrap.c
> >> @@ -72,7 +72,8 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned
> >> int num_fences,
> >>       count =3D 0;
> >>       for (i =3D 0; i < num_fences; ++i) {
> >>           dma_fence_unwrap_for_each(tmp, &iter[i], fences[i])
> >> -            ++count;
> >> +            if (!dma_fence_is_signaled(tmp))
> >> +                ++count;
> >>       }
> >>         if (count =3D=3D 0)
> >> diff --git a/include/linux/dma-fence-unwrap.h
> >> b/include/linux/dma-fence-unwrap.h
> >> index 390de1ee9d35..66b1e56fbb81 100644
> >> --- a/include/linux/dma-fence-unwrap.h
> >> +++ b/include/linux/dma-fence-unwrap.h
> >> @@ -43,14 +43,10 @@ struct dma_fence *dma_fence_unwrap_next(struct
> >> dma_fence_unwrap *cursor);
> >>    * Unwrap dma_fence_chain and dma_fence_array containers and deep
> >> dive into all
> >>    * potential fences in them. If @head is just a normal fence only
> >> that one is
> >>    * returned.
> >> - *
> >> - * Note that signalled fences are opportunistically filtered out, whi=
ch
> >> - * means the iteration is potentially over no fence at all.
> >>    */
> >>   #define dma_fence_unwrap_for_each(fence, cursor, head)            \
> >>       for (fence =3D dma_fence_unwrap_first(head, cursor); fence;    \
> >> -         fence =3D dma_fence_unwrap_next(cursor))            \
> >> -        if (!dma_fence_is_signaled(fence))
> >> +         fence =3D dma_fence_unwrap_next(cursor))
> >>     struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences=
,
> >>                          struct dma_fence **fences,
>
