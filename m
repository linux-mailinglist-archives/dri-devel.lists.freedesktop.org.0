Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DBD3FDE12
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 16:53:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE12897CD;
	Wed,  1 Sep 2021 14:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8C0897CD
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 14:53:32 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id y34so6938606lfa.8
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Sep 2021 07:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=R7swwfs76GtOKaLkQcImmfvW5/PylHTwP10pVluX+vY=;
 b=dUQNULUf7o38XtIIUIGapPI/R8YJbqrP7AZz+/8/4DqUcOcHDJUWBxuuvKj+KmehON
 EBNaJgselMgivt63h4fDM0jTy8g0UggAswyJkjCv2owWr6IsJxeWSQ7OaJPqsIS/zap3
 hqw4Hv2YhJZl/5mgQYeAr/JZ8FWEFDH0YXJbvZKwUffzScye+zY7rTkE367UyhQcndIB
 Ystlif+Uhnp/x8W7bp3oPHisc7Rb7FpAEzDO5gV9Nv/nSGehHIyZgjbufLjzfzJzZ9uk
 /nD8wSIUS3cy8gkO1nF1Syh+jkm+OUHRYn6/7iTUheS0HJqBpbkvZ62dnizWZ6iEIO3m
 niCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=R7swwfs76GtOKaLkQcImmfvW5/PylHTwP10pVluX+vY=;
 b=pJ3OW0LkqEh/dcdVAKwvZaQfnWQDc/Jv9fvFjiwvmQnl5Urg5JWqRTogGuGechw22E
 vn6TJLBa2nN0b6QDGf6t8a/Bw+Hj/QPhLY+A6z6i59LL32n7/vXbEl3WBmYSVKKe2kXp
 H8FDuNxtivKxZBPwp9vH8hIO35+dUtZzciVI/xZ6f7cFRwRJzBmOsq/5/9EW+Ipnri31
 YsnVz3gg8B+J/5cnBqARYBTLwBatpAo5kUKQbxBE4r54U10wpf4z2ZnYjedycqlAopcq
 bVHcDthoczPLYMDxF9P5TxeyklNwXBmYCgDvTEq21kgNwC/aupr3Cb0IKaagnyy7sDHs
 dWvw==
X-Gm-Message-State: AOAM530yB5ZU3qKIBQlDr4lHytq+APAFQ4Qa2xX11wI9QlG4boLhfc67
 QBBYv3U42lKaK4UHdo7OnoOLBkMBTuHv9qm/S00gjQ==
X-Google-Smtp-Source: ABdhPJx34u69889m4GTkVMm/pm8wHU2X0TnJw4WPzWKbsT60lT5/r3bjlY7vh2nRzbGJeN8UB7GrAqBNHnyvEfK4qMo=
X-Received: by 2002:a05:6512:1114:: with SMTP id
 l20mr26405181lfg.550.1630508010717; 
 Wed, 01 Sep 2021 07:53:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210901080002.5892-1-christian.koenig@amd.com>
In-Reply-To: <20210901080002.5892-1-christian.koenig@amd.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Wed, 1 Sep 2021 20:23:19 +0530
Message-ID: <CAO_48GG0KVArNe23KcwL4qXCn9PGCmfx9B21een4_h+UUv7xMA@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: cleanup kerneldoc of removed component
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>
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

Hi Christian,

On Wed, 1 Sept 2021 at 13:30, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> The seqno-fence was removed, cleanup the kerneldoc include as well.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Fixes: 992c238188a8 ("dma-buf: nuke seqno-fence")
Thanks for fixing; LGTM, please feel free to add my
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>

Or I could push it as well, if you'd like.

> ---
>  Documentation/driver-api/dma-buf.rst | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-=
api/dma-buf.rst
> index f5ac4c90b237..2cd7db82d9fe 100644
> --- a/Documentation/driver-api/dma-buf.rst
> +++ b/Documentation/driver-api/dma-buf.rst
> @@ -176,12 +176,6 @@ DMA Fences Functions Reference
>  .. kernel-doc:: include/linux/dma-fence.h
>     :internal:
>
> -Seqno Hardware Fences
> -~~~~~~~~~~~~~~~~~~~~~
> -
> -.. kernel-doc:: include/linux/seqno-fence.h
> -   :internal:
> -
>  DMA Fence Array
>  ~~~~~~~~~~~~~~~
>
> --
> 2.25.1
>

Best,
Sumit.
