Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC412C35E53
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 14:44:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032FB10E74F;
	Wed,  5 Nov 2025 13:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gptkpj3p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D156D10E750
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 13:44:41 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-3407f385dd0so4426777a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 05:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762350281; x=1762955081; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qozxgj9+n8IudzDS4TqAFoNwmAmvO9fyBs0Aa70Hb2o=;
 b=Gptkpj3p8kriGwMrrASaEVpJDmbZPvT33sfLI4Y4zcrXeTPE/qzYI/9i01b+p9y0pP
 ZrWo6XRkHej2Na4VlzOtLWVem5M/E6cYAIkmVdUoowNZfI6Q6T+B6KDiyOEw+KjIUspE
 8Yq0QS+tB2rNtbKvNLtVVyZtbOBh4oPiiXGRBaBoB69cnWZmaCSQ2oIk4xbDcqaOt/ME
 gAL7YrLn7tJQpqetA4JL1kkQYf3eD6W3xTEldfCWzN0GlhvMfG5ztPSqpufzw4TWdU9l
 DMMXT24BL17fuz4ofMvG5cZT2F4qv9hKqJ2UFl6Vp1szsqL5boHNfHOA/g2NFqXiZAWB
 Oq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762350281; x=1762955081;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qozxgj9+n8IudzDS4TqAFoNwmAmvO9fyBs0Aa70Hb2o=;
 b=PJnvhlTgC+ThPxqymtQDXgYI52kGR+DPYzgKOfyLODNoiWl5PK5BBE1lwlaYUT6uTL
 jgHHc53j0qoxTvWruBmNc975d/XcQs+FIevzITHNvz7qqPttp44+GLgnNZZQlUz1WrO5
 4bMfVa9MGapPSfvUIEH03Xhu84/njaZLae5rC6qLrZvphYjCGfYL+mSKEWsfFfcuq5lq
 Hsh0Oh8ZhEgPxA5R6hqjy6QTXqlvIABkQYg+Tgs8oWjN94nKRMEYUI/cPcVdflFYpRJJ
 nuFQzLhAh7at5M/pDx8y6fvsM8qQcnqu8Hpox6M6c7O9eSILUHGDbuovMjAZttil7X7E
 ++Ng==
X-Gm-Message-State: AOJu0Yw9Usjr5StMnQixfPqc0YAzYarkzuDXYhgPiUZWEekvg0pnybp1
 umJyixRGNUo72hBfMW24lf4PiJd1U7lR5j+8h+2bBKZ/5fmFmfZT0RHqk6rgS3Z+vXSIWOdocAq
 LK4VZKtcZbS+yeO0GS00nNIJ3iQf0lVs=
X-Gm-Gg: ASbGncuO94huvHIeiwagDbm8T48G93KwFQWY3pIfm10o+x+Gpp3NTgan1wpVp6u2PU/
 k80vsURpsxrjpvkwWSVJsCSI5sc5mR0Pc77HvIJZ12jXiAWjzA8tuBHpTLwx2D/TUU5usdTBF71
 tpzWZCQd7aG989NJUU4yb0DufWFM8+GhftQAyXJ2kV4CDrvFLGM13+AhQVFad0XUmhWwLUzG1eE
 rAmbzcnFAGwNkYJome1eJkO+QfdA8mH55U4f8+EiQxNEWiU3glNSrC6jCuAWA==
X-Google-Smtp-Source: AGHT+IGOJWY9um79qVuxu4njBLsN3GbMeipdERxJ3YAlKCuabjVwh3d1X0BvNDhx4+pngzesRjCSQ9dXqon7QtnjBCc=
X-Received: by 2002:a17:902:ef09:b0:295:5d0b:e119 with SMTP id
 d9443c01a7336-2962adf02f0mr47786145ad.26.1762350281231; Wed, 05 Nov 2025
 05:44:41 -0800 (PST)
MIME-Version: 1.0
References: <20250919183042.273687-1-marek.vasut@mailbox.org>
 <CAH9NwWcK_z_4CcDBRYS2nf3AxYV9-XwirvTd+O9uJtHMhyA3Og@mail.gmail.com>
 <CAH9NwWdkjpV5YHmOpuCE=f7RVm1kXzqAOgN6=Sx1s-wxO_SGGA@mail.gmail.com>
 <4ac9dd98-adc8-4be9-9f5c-4e653f656453@mailbox.org>
In-Reply-To: <4ac9dd98-adc8-4be9-9f5c-4e653f656453@mailbox.org>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 5 Nov 2025 14:44:29 +0100
X-Gm-Features: AWmQ_bkTuB0eZgSzf5gvoRARCsMfrXaYv_vl3dBWTq6IB-6XyDxKZI40c5vqEcA
Message-ID: <CAH9NwWd+1MSBGdn6G0zRQgmC7cHCmG3BSxeDUQV-waMG75E2KQ@mail.gmail.com>
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

> On 11/4/25 4:50 PM, Christian Gmeiner wrote:
> >>> This is the GPU/NPU combined device found on the ST STM32MP25 SoC.
> >>> Feature bits taken from the downstream kernel driver 6.4.21.
> >>>
> >>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> >>
> >> Acked-by: Christian Gmeiner <cgmeiner@igalia.com>
> >>
> >>> ---
> >>> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> >>> Cc: David Airlie <airlied@gmail.com>
> >>> Cc: Lucas Stach <l.stach@pengutronix.de>
> >>> Cc: Simona Vetter <simona@ffwll.ch>
> >>> Cc: dri-devel@lists.freedesktop.org
> >>> Cc: etnaviv@lists.freedesktop.org
> >>> Cc: linux-kernel@vger.kernel.org
> >>> ---
> >>>   drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 32 ++++++++++++++++++++++++++
> >>>   1 file changed, 32 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> >>> index 8665f2658d51b..32d710baf17fe 100644
> >>> --- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> >>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> >>> @@ -196,6 +196,38 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
> >>>                  .minor_features10 = 0x90044250,
> >>>                  .minor_features11 = 0x00000024,
> >>>          },
> >>> +       {
> >>> +               .model = 0x8000,
> >>> +               .revision = 0x6205,
> >>> +               .product_id = 0x80003,
> >>> +               .customer_id = 0x15,
> >>> +               .eco_id = 0,
> >>> +               .stream_count = 16,
> >>> +               .register_max = 64,
> >>> +               .thread_count = 512,
> >>> +               .shader_core_count = 2,
> >>> +               .nn_core_count = 2,
> >>> +               .vertex_cache_size = 16,
> >>> +               .vertex_output_buffer_size = 1024,
> >>> +               .pixel_pipes = 1,
> >>> +               .instruction_count = 512,
> >>> +               .num_constants = 320,
> >>> +               .buffer_size = 0,
> >>> +               .varyings_count = 16,
> >>> +               .features = 0xe0287c8d,
> >>> +               .minor_features0 = 0xc1799eff,
> >>> +               .minor_features1 = 0xfefbfad9,
> >>> +               .minor_features2 = 0xeb9d4fbf,
> >>> +               .minor_features3 = 0xedfffced,
> >>> +               .minor_features4 = 0xdb0dafc7,
> >>> +               .minor_features5 = 0x7b5ac333,
> >>> +               .minor_features6 = 0xfcce6000,
> >>> +               .minor_features7 = 0x03fbfa6f,
> >>> +               .minor_features8 = 0x00ef0ef0,
> >>> +               .minor_features9 = 0x0eca703c,
> >>> +               .minor_features10 = 0x898048f0,
> >>> +               .minor_features11 = 0x00000034,
> >>> +       },
> >>>          {
> >>>                  .model = 0x8000,
> >>>                  .revision = 0x7120,
> >>> --
> >>> 2.51.0
> >>>
> >>
> >
> > Applied to drm-misc-next.
> Thank you.
>
> I _think_ I will try to respin the flop reset patchset next.

Gert told me on irc that he has reworked the series already and just
needs to do some testing. Maybe wait another 1-2 weeks
and/or sync with him directly.

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
