Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 047FD39BC6A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 17:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377166F613;
	Fri,  4 Jun 2021 15:59:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 507C46F613
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 15:59:23 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id z3so10208163oib.5
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 08:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8C4dMHo9blnndB3n17Ge4HdIFao6pbKc6ZPfLxMFsv4=;
 b=mgNdOGVOt8Jyn+7aoYQr8sHiLTGM2pHh8SsmBSMxfZIUsINX7qilAYD8rJZGGTVXCS
 PQxwdB0meXcDxDPwHjB1SA4ALFx0jCB0slGScsKn7G8ywFSAFTkutJ64ZRTtok7r4QH4
 OozyMbV9lNslxWvHvkq8EkomJgvhL4T0tVZtJ5C3I4B4oeSBGP1oHQI4N4BUYvPGaqPH
 nVN8ZNJPs7imMFAkpAE53OaHcQoq3BNoJWKF+shPtzbD4U3a3DunM1brCePfhjTFilem
 OmBd/VzCSV/AzFNnvUcnPOPZKJz7VHV4JS85aLN2+1J4Gye0R3Sh3YYO5cE8srVZFnaf
 rHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8C4dMHo9blnndB3n17Ge4HdIFao6pbKc6ZPfLxMFsv4=;
 b=CyYk/2kN2+C4j4dR/dNVbE9OKv8TZF4UKv81r79B8WGqdmeR+nFFp6S2a0d1yYq90D
 438B/fWI5hdQlogeIPcg45RngY4WAU0Yd2Thnd168TXY6RYK+W9d1S4ypRyCl8Z0nZfs
 TUp06lzJiCF9ddx/YlDV3jOt55kEkS48uK0gCb2/5BXQq0ONSZVzKFO9qygGQxenK6NP
 ElvE83rzz1Y4voxxczV+HPMgZkQW+iQNVCu3xbqSFb8E/y/wxLLijd16aRdvIQx5xNi1
 2Vrm5EcyI+tqulkNspR8b0XyeT6gX515MWRYCrc6AswAkscvPs7qT99r2e6woRfGEsCq
 Cv5g==
X-Gm-Message-State: AOAM5326mZa6CPmxRTk8OHX8w3srta1uut6hCj2586Xz+eGBJjuQqyS0
 0YrmPCgFtK9mJuIjNj2P7Vm77Ru02q04SdZgZJTcbdie
X-Google-Smtp-Source: ABdhPJwnpPCQSOXWvcHO1af5CTx7yh40sZbzqT7WYAE2DNDfBq0Tw/K4Ob2VR9208yQFiiADp78fG35eAlnc5Tg8l3Y=
X-Received: by 2002:a05:6808:206:: with SMTP id
 l6mr10781610oie.5.1622822362728; 
 Fri, 04 Jun 2021 08:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210604155228.616679-1-christian.koenig@amd.com>
In-Reply-To: <20210604155228.616679-1-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 4 Jun 2021 11:59:11 -0400
Message-ID: <CADnq5_Mrm8GtG2uMxKac+Ev3kTFv6Hn+nL5F8vEFcWHJsceu8Q@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: add missing EXPORT_SYMBOL
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 4, 2021 at 11:52 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> The newly added dma_resv_reset_shared_max() is used from an inline
> function, so it can appear in drivers as well.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/dma-buf/dma-resv.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 3964df438505..6132ba631991 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -226,6 +226,7 @@ void dma_resv_reset_shared_max(struct dma_resv *obj)
>                 fence->shared_max =3D fence->shared_count;
>         }
>  }
> +EXPORT_SYMBOL(dma_resv_reset_shared_max);
>  #endif
>
>  /**
> --
> 2.25.1
>
