Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 986FBC31EDE
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 16:50:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF92210E639;
	Tue,  4 Nov 2025 15:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J6sSuoi6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862A210E639
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 15:50:50 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-290aaff555eso53096125ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 07:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762271450; x=1762876250; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DF+Xg0KfbjravoPnRqbNNYO0SUruQaoSS8eSZYe/j4M=;
 b=J6sSuoi6y9bgH9itz8lsbANjM1Xz7DIBVHEGsZtcBT+9I40grjU3oBDGWkZxMWIC69
 bA4t2cwpe1ynAW4vcnMQ8f57/TObDZFvjYexplR5IDz9lmhDSXBIXrmYimFzPwwOnjU4
 YGmra9mekVX6mGBMaBE2LIjKdqwk0d4toJvgmVpBCERKwy7PXSR3CbPPJoRsOtfH4er3
 bfQp8XKX2wzjMyOPjHQBIEYS3iW09OMwZayY7ycZVELirALQEx3P7TnQ3cz3JDJVHk9F
 swI2+XvIy6ztlSajjj4L7/pKopMB1Qc9QoEPUrVUbGBzKG+ceULnEfQBGRDumChPmqx9
 RT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762271450; x=1762876250;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DF+Xg0KfbjravoPnRqbNNYO0SUruQaoSS8eSZYe/j4M=;
 b=feEmQxokwhuEOEyre8/QsQe3avCVdB7Sf5ck98MKngL3BOyroot8owGy9IorQL5HhF
 UXqkPrQlty2/TIqLxiQqk4B3g0EX7v3rxwndxqy1GtKJqWroCbnbUGK0P25WO36YAcBv
 JwymBaTxAgeiZbA9aKOw0L9lyAdnWeNh5Y+EQU9ySbqkuhCqs4YuFHb3tkapenE/16oM
 7xHpeo9YU20zj6Ol9H6/IvlBSj2AmLVflZx/4SSBmoyVq9HqjJs3Bmb6HSMpvnaoPvQP
 oIR7eegY7QunPGpJFM8mfVxn4EaeH0QTa1kOKHP0+WKOwYnlIsdHyPRxAJ+Rq3fKGEf3
 /8lg==
X-Gm-Message-State: AOJu0YyouY9P+ACq/Frv2+Ouzd5fulKEgtTo20mF0hV70yImRpTu2NpP
 SX6egMA4RBnn9k8YpVszHfPXzPOH0Ao7LTyW+FGopmsqjAiHeLRFDzt48xg5xQVOvH9ZOero4cX
 B0v9kEV5QGfTimrSym6URYZtwKBr6Exg=
X-Gm-Gg: ASbGncv8LKZqwlyILLkqR56Gm6VwyjCUF6bZxBDT+iWtNrduSzU9llUL5477aLLB6cE
 cS93EiVIPX5KomxKB6/tm96m9Q49SetfsZXiPj+iiR0fX9p/SJbaTBWduSD0CPe3Ko4aVkPIkrZ
 qjVhXzRkqwMvEsR3CsN1Rfoq/m5F0NwU0S+/QjU7rR4NxG7eHgtwtfsFj2YFobkYNuHHzBM+4Fi
 pWGqGn2sQ/VPxgdhLqLJg+JVNIu2wbWbAuk6olO+T28y7CSJygtNWFU6Myl9w==
X-Google-Smtp-Source: AGHT+IFMX3GimODm1zGJLS3LPmzvdh2a8d1e8mZX8+bPjZowTFcWILNTw2aU/zYsH97Ej4/MFFRAuPJ+g4TDC+o8/KY=
X-Received: by 2002:a17:902:c40d:b0:295:fe17:83e with SMTP id
 d9443c01a7336-2962ad1c9a2mr1375335ad.19.1762271449948; Tue, 04 Nov 2025
 07:50:49 -0800 (PST)
MIME-Version: 1.0
References: <20250919183042.273687-1-marek.vasut@mailbox.org>
 <CAH9NwWcK_z_4CcDBRYS2nf3AxYV9-XwirvTd+O9uJtHMhyA3Og@mail.gmail.com>
In-Reply-To: <CAH9NwWcK_z_4CcDBRYS2nf3AxYV9-XwirvTd+O9uJtHMhyA3Og@mail.gmail.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Tue, 4 Nov 2025 16:50:36 +0100
X-Gm-Features: AWmQ_bkWGPLr80FTYocQH54j43c8QbQrHNTa44SWp_HgbPcP7OEt6fQrdnJo2z8
Message-ID: <CAH9NwWdkjpV5YHmOpuCE=f7RVm1kXzqAOgN6=Sx1s-wxO_SGGA@mail.gmail.com>
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

> > This is the GPU/NPU combined device found on the ST STM32MP25 SoC.
> > Feature bits taken from the downstream kernel driver 6.4.21.
> >
> > Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>
> Acked-by: Christian Gmeiner <cgmeiner@igalia.com>
>
> > ---
> > Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Lucas Stach <l.stach@pengutronix.de>
> > Cc: Simona Vetter <simona@ffwll.ch>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: etnaviv@lists.freedesktop.org
> > Cc: linux-kernel@vger.kernel.org
> > ---
> >  drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 32 ++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> > index 8665f2658d51b..32d710baf17fe 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> > @@ -196,6 +196,38 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
> >                 .minor_features10 = 0x90044250,
> >                 .minor_features11 = 0x00000024,
> >         },
> > +       {
> > +               .model = 0x8000,
> > +               .revision = 0x6205,
> > +               .product_id = 0x80003,
> > +               .customer_id = 0x15,
> > +               .eco_id = 0,
> > +               .stream_count = 16,
> > +               .register_max = 64,
> > +               .thread_count = 512,
> > +               .shader_core_count = 2,
> > +               .nn_core_count = 2,
> > +               .vertex_cache_size = 16,
> > +               .vertex_output_buffer_size = 1024,
> > +               .pixel_pipes = 1,
> > +               .instruction_count = 512,
> > +               .num_constants = 320,
> > +               .buffer_size = 0,
> > +               .varyings_count = 16,
> > +               .features = 0xe0287c8d,
> > +               .minor_features0 = 0xc1799eff,
> > +               .minor_features1 = 0xfefbfad9,
> > +               .minor_features2 = 0xeb9d4fbf,
> > +               .minor_features3 = 0xedfffced,
> > +               .minor_features4 = 0xdb0dafc7,
> > +               .minor_features5 = 0x7b5ac333,
> > +               .minor_features6 = 0xfcce6000,
> > +               .minor_features7 = 0x03fbfa6f,
> > +               .minor_features8 = 0x00ef0ef0,
> > +               .minor_features9 = 0x0eca703c,
> > +               .minor_features10 = 0x898048f0,
> > +               .minor_features11 = 0x00000034,
> > +       },
> >         {
> >                 .model = 0x8000,
> >                 .revision = 0x7120,
> > --
> > 2.51.0
> >
>

Applied to drm-misc-next.

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
