Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBA6571B07
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 15:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC271946D1;
	Tue, 12 Jul 2022 13:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428779455A
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 13:21:01 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id m16so10055795edb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 06:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lzZX+A5QVL9QazKD0haBEjpKkR86ZVAetIBUsFsytto=;
 b=hCXsz9bRJuJf0s/Z20noLgz1dGhTSXWYsx6QR11YVNpHS59XmQM1BiJKu5NJnGLMZ8
 EfxqaGbMDqNNL92d1jaQi24zEvZw/l4GQubBiYpFPsVccHWDflP2BMgkulWuy6nMcAfO
 D3K/GPiKZvy20njVnAcEsk9xy62oDquRoK0wgXI+pHqkxBrLfx3au085GlOnxnIZRkzy
 xhyEy9+7HFEBr6ywAOLKFLaUYpWM0jivLbeolObA0m9vAawbBw1QRvlTH3I4c9fV3mSt
 NDzf79hCUWrubOaBzZzyKYipyj6PbF1LPlaaUovrNEfoSsr1rZ8Wo3dud/Ei01vItqoU
 Xtkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lzZX+A5QVL9QazKD0haBEjpKkR86ZVAetIBUsFsytto=;
 b=g4QKPdP+I2h2Mc4emVJlwp92DxGrQ/CQUHd3EscvC8U1qtxXw7jykg4w6j7VagXoee
 HULwuNxw6Lg070kQ/ZugoCzCL7japBYKOVP7PzlCcaKQMdB5zZyBsgmz3/F/AdmMROTS
 K3GYuEKzGD963Io6UpnO5l/I79K2HQRLdok71V56x8AQljQT2BJu2syLdqoHSP4ZGZjs
 p4YxivZOb/F4drCgnqlFF2FVnQlIhWy4Gs/LYqWz1/K3e2ZPecH7UnLPi0x1DnlktqU2
 u7xXTs6ykU8ze50Ka8muu0cABYUU5jJquVV3eT8JZP7hNfVIoqAsJfjtNAQkV3IiIWBQ
 DQpA==
X-Gm-Message-State: AJIora8OWQWW54N3B6X/xVu/1YunOtfEPVibFYzUUjsnLJwI1gCcWF93
 NRticX7slslN0MSA8LqENpkI/ziZBsBC0iOMRRApuLgdSnU=
X-Google-Smtp-Source: AGRyM1uOvVLhZw39DwdTGXT8YQ+sS0EOX2OdZ/7cJ5fgQFnonHM4r+CJXTsL9IW6uethLnLGFZy6DBGtN+ZEhGOEY70=
X-Received: by 2002:a05:6402:28c3:b0:43a:6d78:1b64 with SMTP id
 ef3-20020a05640228c300b0043a6d781b64mr31223403edb.93.1657632059623; Tue, 12
 Jul 2022 06:20:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220712131201.131475-1-christian.koenig@amd.com>
In-Reply-To: <20220712131201.131475-1-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Jul 2022 09:20:47 -0400
Message-ID: <CADnq5_PSECF0b_ynF=UhXu3Os0hYZcvcQtk1pD+T3q+Z1g-Hgg@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf/dma_resv_usage: update explicit
 sync documentation
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 12, 2022 at 9:12 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Make it clear that DMA_RESV_USAGE_BOOKMARK can be used for explicit synce=
d

DMA_RESV_USAGE_BOOKKEEP?

> user space submissions as well and document the rules around adding the
> same fence with different usages.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  include/linux/dma-resv.h | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index c8ccbc94d5d2..264e27e56dff 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -62,6 +62,11 @@ struct dma_resv_list;
>   * For example when asking for WRITE fences then the KERNEL fences are r=
eturned
>   * as well. Similar when asked for READ fences then both WRITE and KERNE=
L
>   * fences are returned as well.
> + *
> + * Already used fences can be promoted in the sense that a fence with
> + * DMA_RESV_USAGE_BOOKMARK could become DMA_RESV_USAGE_READ by adding it=
 again

Same here.

With that fixed,
Acked-by: Alex Deucher <alexander.deucher@amd.com>

Alex

> + * with this usage. But fences can never be degraded in the sense that a=
 fence
> + * with DMA_RESV_USAGE_WRITE could become DMA_RESV_USAGE_READ.
>   */
>  enum dma_resv_usage {
>         /**
> @@ -98,10 +103,15 @@ enum dma_resv_usage {
>          * @DMA_RESV_USAGE_BOOKKEEP: No implicit sync.
>          *
>          * This should be used by submissions which don't want to partici=
pate in
> -        * implicit synchronization.
> +        * any implicit synchronization.
> +        *
> +        * The most common case are preemption fences, page table updates=
, TLB
> +        * flushes as well as explicit synced user submissions.
>          *
> -        * The most common case are preemption fences as well as page tab=
le
> -        * updates and their TLB flushes.
> +        * Explicit synced user user submissions can be promoted to
> +        * DMA_RESV_USAGE_READ or DMA_RESV_USAGE_WRITE as needed using
> +        * dma_buf_import_sync_file() when implicit synchronization shoul=
d
> +        * become necessary after initial adding of the fence.
>          */
>         DMA_RESV_USAGE_BOOKKEEP
>  };
> --
> 2.25.1
>
> _______________________________________________
> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org
