Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C3789CE65
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 00:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BEAD10E38C;
	Mon,  8 Apr 2024 22:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fmX8Ow3W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A54810E38C;
 Mon,  8 Apr 2024 22:28:27 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-56e2e09fc27so6782230a12.0; 
 Mon, 08 Apr 2024 15:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712615305; x=1713220105; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QGCVo4CTXBLwTYH+iiI/NIF2pRRvzU2RZ76rFTzzLEo=;
 b=fmX8Ow3WnS/U3bhsx1vKwOhDLGZf9inFgLXF22CbuPZbrPP6dQw4jSaqLJQAC65srj
 JSufHJrVGBrU7bUi3DrozdGJNzauAOaeQqBd+vKmeDj9Sh/QQvs2/oW6muzlEjBh9hah
 TybaJLQlNyeuvzMrBEoy/HGhXANdd/oF/1dkHzeOoPltMhZa9ZLzKHp/l8BLy8MamQ1c
 lZ2T3QF7FrNmIzV7Dg1IX86TBlXx+rxFkF1ZAwgfyL8+BxYTft2fkNonaTjkys9T3DSV
 yJS0BWIyng3q7llCh0jFYfROKjF0nn/lWmvzGzMZSdUCotxmPAW4LkWI6hp3gDZZNQqe
 /rbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712615305; x=1713220105;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QGCVo4CTXBLwTYH+iiI/NIF2pRRvzU2RZ76rFTzzLEo=;
 b=Yj2hulpk/f8vY8z7II6F9ZJPgDE/gAm4ybwanNJYHbLUOMZjuzIHNYFk7F/c5rK+5w
 GAnL5BIxu+UppXczfaaBRBQcXm0nppH4w0uod7ha1OBuBluFd1DOnJMj8NLHk50m+2e4
 KTh5n8Lir8tmbjQSqzlnhXTxScEvQVheAWl4oc3vvPS+gqJc87ys6ezCtb02+UGAerwb
 RXxA+HjWhsyaELTTr9Xf3UDfUiJRlka5piQrk9VhSEN6a18xUTdXJBGvLef59jsDITyD
 AKzjoYRSS3RoAYNWo02Ww/USxKPmng1NSfdQmi+1vwquEPJgvEWaxxzj2QHz/uf8NbNL
 oj0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZTtTtxFWStmUi3zuS6kYE8Go1xoNXKsC2GE9a73V6aadDd/6oT5SZpLfDnm4GIguHKhMI16M+MCbV5UqpwBscsG+X2gljTrBlZviF2Y8T
X-Gm-Message-State: AOJu0YxeXZOVrsHVvXIPVET4y6h6AbLoSdUNdZqLCOWtpT2z9972h1Yu
 vMqvHrLBs4MGMwHNMVnzYBuEOE7Pkjvv/QXVgA6qoJvlSV3Uy+BGQlRxu3om2/c71NhF9IgDnb8
 kv2C0oZ4yO/cr0ihdJ/uqgnrCH6veBkU8c28=
X-Google-Smtp-Source: AGHT+IGEgHggUKRJS6kEApnOO0TdYyJ8yYoQMQXYMTy+aSEO7rQgl7Xwa4KDmwUZYs+d9EYIdW7qHtqfjtn0F9QggOw=
X-Received: by 2002:a50:9fc9:0:b0:56d:f29d:c80d with SMTP id
 c67-20020a509fc9000000b0056df29dc80dmr762183edf.5.1712615304926; Mon, 08 Apr
 2024 15:28:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240404233736.7946-1-lyude@redhat.com>
 <20240404233736.7946-2-lyude@redhat.com>
In-Reply-To: <20240404233736.7946-2-lyude@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 9 Apr 2024 08:28:11 +1000
Message-ID: <CAPM=9twXXx9c9O7GFBHMhANOuMqt_tUKr97-2cPCwzZoJFtH0g@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/nouveau/kms/nv50-: Disable AUX bus for
 disconnected DP ports
To: Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Karol Herbst <kherbst@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
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

On Fri, 5 Apr 2024 at 09:37, Lyude Paul <lyude@redhat.com> wrote:
>
> GSP has its own state for keeping track of whether or not a given display
> connector is plugged in or not, and enforces this state on the driver. In
> particular, AUX transactions on a DisplayPort connector which GSP says is
> disconnected can never succeed - and can in some cases even cause
> unexpected timeouts, which can trickle up to cause other problems. A good
> example of this is runtime power management: where we can actually get
> stuck trying to resume the GPU if a userspace application like fwupd tries
> accessing a drm_aux_dev for a disconnected port. This was an issue I hit a
> few times with my Slimbook Executive 16 - where trying to offload something
> to the discrete GPU would wake it up, and then potentially cause it to
> timeout as fwupd tried to immediately access the dp_aux_dev nodes for
> nouveau.
>
> Likewise: we don't really have any cases I know of where we'd want to
> ignore this state and try an aux transaction anyway - and failing pointless
> aux transactions immediately can even speed things up. So - let's start
> enabling/disabling the aux bus in nouveau_dp_detect() to fix this. We
> enable the aux bus during connector probing, and leave it enabled if we
> discover something is actually on the connector. Otherwise, we just shut it
> off.
>
> This should fix some people's runtime PM issues (like myself), and also get
> rid of quite of a lot of GSP error spam in dmesg.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>


For the two patches,

Reviewed-by: Dave Airlie <airlied@redhat.com>

> ---
>  drivers/gpu/drm/nouveau/nouveau_dp.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
> index fb06ee17d9e54..8b1be7dd64ebe 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dp.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
> @@ -232,6 +232,9 @@ nouveau_dp_detect(struct nouveau_connector *nv_connector,
>             dpcd[DP_DPCD_REV] != 0)
>                 return NOUVEAU_DP_SST;
>
> +       // Ensure that the aux bus is enabled for probing
> +       drm_dp_dpcd_set_powered(&nv_connector->aux, true);
> +
>         mutex_lock(&nv_encoder->dp.hpd_irq_lock);
>         if (mstm) {
>                 /* If we're not ready to handle MST state changes yet, just
> @@ -293,6 +296,13 @@ nouveau_dp_detect(struct nouveau_connector *nv_connector,
>         if (mstm && !mstm->suspended && ret != NOUVEAU_DP_MST)
>                 nv50_mstm_remove(mstm);
>
> +       /* GSP doesn't like when we try to do aux transactions on a port it considers disconnected,
> +        * and since we don't really have a usecase for that anyway - just disable the aux bus here
> +        * if we've decided the connector is disconnected
> +        */
> +       if (ret == NOUVEAU_DP_NONE)
> +               drm_dp_dpcd_set_powered(&nv_connector->aux, false);
> +
>         mutex_unlock(&nv_encoder->dp.hpd_irq_lock);
>         return ret;
>  }
> --
> 2.44.0
>
