Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9381E914E05
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 15:11:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D1E10E423;
	Mon, 24 Jun 2024 13:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CJpY7uAB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966AA10E257;
 Mon, 24 Jun 2024 13:10:59 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-7163489149eso2436418a12.1; 
 Mon, 24 Jun 2024 06:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719234659; x=1719839459; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7Zl2jQ/WctmJZFzH2dUAxZSdFn1V8A5MAbnvqmdgc7M=;
 b=CJpY7uABpz1A3A2QpBztuXG6IMOrUqj6YNS445DKS4Atf5ZK6eeiy+ZyIqH83tMmHa
 mFjPU6SrRC3eYWINpuf/H347MHaSnyEH71EQZgcBWwj7cuewJij/cQTmAI0vK7epq2SC
 T/Vbys91eGCpDlrpte+vJCOpm9SS5ArFDm0jEF4AntU5QXZuV8mbb+t9Xbhk1Pge38yl
 zUwxI/eUAK2qJGePk9MPPYeQaFGkleeRxrkgY0WDhI72RV80ncPZFzG7yCIMkMiTHLDy
 qC09DImE6E8Y8u4ZKBCxOyye4PGpU9Zrdojt8I0pqRITHbJS1G2B5KVfetNMW2OdjOP7
 LGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719234659; x=1719839459;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7Zl2jQ/WctmJZFzH2dUAxZSdFn1V8A5MAbnvqmdgc7M=;
 b=SRJxfeZ/gE3x/MFipVXGBZVCA2l88Wzc67MmdjM5XuY+quNPRmMagMEosfK5/wwODU
 LaGBIr+7J24WcPtaI1Alv7tSCjauGYI1688xD8ptw4IZr6XAc6EGyAhihlXeK6fOkrMb
 7D/AxZJkWSWbJjkYr7wy3vYwJhCQKN0a32QEwbgLff79JDcxpKM8wewh+H5amq6Ut1Uf
 5ytcsgb6d7JIXiUR1+JCrKN0S9cB8VLx5fTx2l//s0+DI76VzIRyaS4YWW7z8dhz1q1D
 T1XadOqOovzHe3tD5PRy1XhRn20tJ1FZrQEwdiOvHd7I7nDlOwpX5BygOiZNHHFWKbjA
 W44Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDJbQJxazaMi4B9B6yTdJe8I7XAOrgFJ6zrGPpEMyXnnkz7fvUsqHf5C/kSNcs3mIbf/fdVYyjR1ZCsJmur0b1ItIssdeIt1K/tOnWktZS
X-Gm-Message-State: AOJu0Yy8NftgdWWFLV4l/WZuH/qcEN1xpFCRPZMOq1fMxUVfigoCPHRw
 JMQZCr2hBYYthoto5Trne0anVm/uytg02+vOd5bOE5KLwJ/Aaz321v6gLJPzRY8ZAk85WYomAMl
 6AskCWQQone/rQXHaonb5TeUXp7dgw/Xo
X-Google-Smtp-Source: AGHT+IH5aFjPXG15ZpstQFuPAR1zNRPt6e/mobyNXrpewR5WoiCzEtWLm774hDrPaV3Ld8hUHmdJj+cUUns7tXfzu/w=
X-Received: by 2002:a17:90b:20e:b0:2c8:81b:20f7 with SMTP id
 98e67ed59e1d1-2c8614ac61amr3024965a91.44.1719234658722; Mon, 24 Jun 2024
 06:10:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240621200020.491579-1-l.stach@pengutronix.de>
In-Reply-To: <20240621200020.491579-1-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 24 Jun 2024 15:10:46 +0200
Message-ID: <CAH9NwWeCzvRxkOD1wkTc09Cx_vqnDFGOg9Cn3i++DCN=8dqpYQ@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: reduce number of ktime_get calls in IRQ
 handler
To: Lucas Stach <l.stach@pengutronix.de>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Russell King <linux+etnaviv@armlinux.org.uk>, patchwork-lst@pengutronix.de, 
 kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
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

>
> A single IRQ might signal the completion of multiple jobs/fences
> at once. There is no point in attaching a new timestamp to each
> fence that only differs in when exactly the IRQ handler was able
> to process this fence.
>
> Get a single timestamp when the IRQ handler has determined that
> there are completed jobs and reuse this for all fences that get
> signalled by the handler.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 7502c55199b8..7c7f97793ddd 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1548,6 +1548,7 @@ static irqreturn_t irq_handler(int irq, void *data)
>         u32 intr = gpu_read(gpu, VIVS_HI_INTR_ACKNOWLEDGE);
>
>         if (intr != 0) {
> +               ktime_t now = ktime_get();
>                 int event;
>
>                 pm_runtime_mark_last_busy(gpu->dev);
> @@ -1597,7 +1598,7 @@ static irqreturn_t irq_handler(int irq, void *data)
>                          */
>                         if (fence_after(fence->seqno, gpu->completed_fence))
>                                 gpu->completed_fence = fence->seqno;
> -                       dma_fence_signal(fence);
> +                       dma_fence_signal_timestamp(fence, now);
>
>                         event_free(gpu, event);
>                 }
> --
> 2.39.2
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
