Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CABBACE50
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 14:43:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CB110E2B9;
	Tue, 30 Sep 2025 12:43:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OH8w9Tfz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0DE10E2B9
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 12:43:26 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-3304dd2f119so4530201a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759236206; x=1759841006; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1/Agq+DmRlV3c936zuz7MXdyoSR3KCIK7Avb8fH1+Us=;
 b=OH8w9TfzCNKvn1Lce5lGEGia0m63FhCMKKpPBZ8HpASZv4i30n0Ngddw/80TqhEPcj
 +XwcC9Lp4MuA9swCRTPPBdwDYmorYLVcr7RgYZzz/tNGuCM97C09HNsXONlUqGdMOE0F
 IxAbp+2JBYY3hOLIqidQzff7qF5dNrp9LZiVd9g34sw1RuHYSM3eSEcI5gGQfMoJTQgp
 u5qnUeCsoZegbYNhG02SlMk0t2/w0xbPwUO4pnSqvwczToUjJ7Qp5cKtmGpqN9ppdh60
 7KSKBtm27fTs2Ys3140CEkWZMQDpg4xiTYIgxxWgyQ+6mEM24OaiFK4QKaHjKX8MMyzk
 r96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759236206; x=1759841006;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1/Agq+DmRlV3c936zuz7MXdyoSR3KCIK7Avb8fH1+Us=;
 b=mS0tRM8A/d1X/tfjXJ1wTwcU9/TGACuKiKLcEBj/FlNAku7bPEKMQ84JwNUzZBMunZ
 ImqHMDPA/dytqFNgXL5xYU4FAVhnZoDtT4JPQRGtK03dwH/B5Gialj8WxHpBYuRgoYce
 bjNCCogXHQHOAJhQg6eN812WE01C3VHNMXj0Yl1wG+AVEcQ64l/7nwQWCaOPACRoN+jE
 s72/thlqJdTehCFm1Ga0Ezu2v2p2TqB1/9vQSZYRCXcYTSZJhpXE32TEskuZ5M1E2uun
 4DWvJe36vN0Cd2LpBiedu6193P0jFbJBDALLzuIeeRhJ+/rUpkav5EPbvtxaAUJYmB0T
 Km8Q==
X-Gm-Message-State: AOJu0Yy9pE+5JUrpQVIndgemnkVyeLd9X10dEsprvJL8GB1iWziBbygb
 t7RQwzHdxQLObLG2i0MG2RE9PPWT9waQzAvPKaq8Mb/6REZ8VCMNg5SWYUiuE9QRZraRipHMdUA
 amkNYRrFF9eqv1GV8O70ET1jp5lBtCag=
X-Gm-Gg: ASbGnctqec6AdGdD1e6kt/uWCcChOxWsPDUMrbW8fvNgS95GMBrNCqMchjA/YCGa6el
 GOU3JYUNEGWkiObDTlCVxxXHmteOkSDY8+fQ6cfLRhuVoxorbClG019+3KhyKrVhxc+XjOeKQpu
 eWy49lH6cZOTVV7qMcU2bi7rQ80Tj3+Zt2Ye0O/fFnvIbyXZqE5QeEAH1wG8EOIj/5/EbS0prib
 clQLbLDCAVAAJQfcVOM1ZYPiogWEYTtn/q6zpLDar7sCdnjPt4aPpnzhzxPQA+rjCAzt1o=
X-Google-Smtp-Source: AGHT+IGlDVENqyPUF/wBYi60oP57IjahL5kiurXffE7HAwGcLmim1a+I7hD66oNEXQccJV8ZSViK42Xuiz9c9fax5QA=
X-Received: by 2002:a17:90b:58c5:b0:32e:d011:ea0f with SMTP id
 98e67ed59e1d1-3342a2d1bacmr17879511a91.25.1759236206384; Tue, 30 Sep 2025
 05:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250919183042.273687-1-marek.vasut@mailbox.org>
In-Reply-To: <20250919183042.273687-1-marek.vasut@mailbox.org>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Tue, 30 Sep 2025 14:43:14 +0200
X-Gm-Features: AS18NWDS9-HN51yhqFAHzOnB17BCVRavC4Epbi5odLIjFtiVIVzgVXHC6qF2PyQ
Message-ID: <CAH9NwWcK_z_4CcDBRYS2nf3AxYV9-XwirvTd+O9uJtHMhyA3Og@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: add HWDB entry for GC8000 Nano Ultra VIP
 r6205
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Simona Vetter <simona@ffwll.ch>,
 etnaviv@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

> This is the GPU/NPU combined device found on the ST STM32MP25 SoC.
> Feature bits taken from the downstream kernel driver 6.4.21.
>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

Acked-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: etnaviv@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 32 ++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> index 8665f2658d51b..32d710baf17fe 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> @@ -196,6 +196,38 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
>                 .minor_features10 = 0x90044250,
>                 .minor_features11 = 0x00000024,
>         },
> +       {
> +               .model = 0x8000,
> +               .revision = 0x6205,
> +               .product_id = 0x80003,
> +               .customer_id = 0x15,
> +               .eco_id = 0,
> +               .stream_count = 16,
> +               .register_max = 64,
> +               .thread_count = 512,
> +               .shader_core_count = 2,
> +               .nn_core_count = 2,
> +               .vertex_cache_size = 16,
> +               .vertex_output_buffer_size = 1024,
> +               .pixel_pipes = 1,
> +               .instruction_count = 512,
> +               .num_constants = 320,
> +               .buffer_size = 0,
> +               .varyings_count = 16,
> +               .features = 0xe0287c8d,
> +               .minor_features0 = 0xc1799eff,
> +               .minor_features1 = 0xfefbfad9,
> +               .minor_features2 = 0xeb9d4fbf,
> +               .minor_features3 = 0xedfffced,
> +               .minor_features4 = 0xdb0dafc7,
> +               .minor_features5 = 0x7b5ac333,
> +               .minor_features6 = 0xfcce6000,
> +               .minor_features7 = 0x03fbfa6f,
> +               .minor_features8 = 0x00ef0ef0,
> +               .minor_features9 = 0x0eca703c,
> +               .minor_features10 = 0x898048f0,
> +               .minor_features11 = 0x00000034,
> +       },
>         {
>                 .model = 0x8000,
>                 .revision = 0x7120,
> --
> 2.51.0
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
