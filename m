Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F67C62E31
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 09:27:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D3E10E19D;
	Mon, 17 Nov 2025 08:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QwB2YUWj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F36B10E2F2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 08:27:21 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-29808a9a96aso40839305ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 00:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763368041; x=1763972841; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NqMbp3spyXSyI+jmYwX/g0BR2jSvoVtMc4BEmXvtchY=;
 b=QwB2YUWjSrZ1I7jzdkL0FYFMbf2XKI48CmOMLI1N5LQMue+73zaQu7yeYNmU6ZMmUL
 nMkVLGPPA5fuQCeS1fw7SLPn8O87QPpX1C8SIj8BCB7/3KEwD7Pv0awaRmE3xqBYBiS+
 D5yJN+1iRZ+cAyWrTsUzT/oeJ2r0KPvmiDudB6i/7j9CKqrDSN78Mpyd3ivJgYVVM06y
 rQ6U23695V0kezPU/uMR2h1N92eTxaWcZZYfo+Hn5pAgkAJY1KUaXTwfxNacn4ksGfGR
 daw/RTdL4VFIp8baJnzWC1IC203eREKQepBtZg0N0Qe+cLRFcejdaQ8PdDfY08unmAYt
 m3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763368041; x=1763972841;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NqMbp3spyXSyI+jmYwX/g0BR2jSvoVtMc4BEmXvtchY=;
 b=OF3R81sfFVUez/4FMMq/MhQ63sdDOVJKa13SysOkFRmbbDB3wbdcD0bG/AV5X1HiZd
 p9MHg7VBlAHgYeB+pDZTx3E8owPodV/T4XGU3gRJEzDZt+wZUTGDLKk6BMOwmGfnIOvb
 R/82iGsEKuoBu+MXTlz7z2yrTcEavjEBprKRJVa/w4CIKO+5YoHqk8Z1hnpuOCR1dkrr
 ICxgu5NC4Zhi2qu/v/fPYb7BQfPxD/7Ec/bWsJ3QbXPolpHCt5lA/4ZtPywVzC8p782l
 4NNMHbUNV+6Fglm8MlSe7JgX87/BoMU+urK5sl80zMo8xOj8KjtZtwLxbTAuLQEwwxCZ
 O8vA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXP9Ui4Zx/n+LC2z8O4pGAIx0cpGktYP7qz5fN0EP+PkRyv/93crfHFgiYZWwcz8iCdydYsyhytSw4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzdkau6Kns/6z9Er5F6MMbyEV4ZlhBepCNYiJdPxr5knGT65nus
 WMXJLu1jhwi4qfVBlILBTi8uA3I3u/0oi/d4GPhGR94vnU4+KyVv1hPrdelCJ55H1Dz11Z+L9Jw
 O/x/LXU5V992UhOTx5VSEhVipjuHy8LA=
X-Gm-Gg: ASbGnctPKCouzrdCncspOLC5rEx0+wW3dvUvZDbinBFBmLkm/sRtgq+JfKdtcijwwy6
 nRF3Y459B1UDHz7ifpSHk6KfUJlEA8ebvhgg9XXOlMOiKtmHDa/z1rA9PG1+iUg5XfHWKyygrXS
 d2IHrXsWnuMBy1GJqLwn3wKaI8QvsCsp/oPgpg/wtWorLw5Jy3lGb8ij4XTP/JI4/TFktt9vLpo
 IN6fVxhEZISXvDyUC2JBczXn9da062nOzt7PogoGntu8+QDcGooSD17MP4=
X-Google-Smtp-Source: AGHT+IGkMzDEoqI+rt/qEDTD5D9OKmtIrTYe7/+Lovr1JTaZZ98IJ17G6IuDXmpuZQ5NwMT3Xw1q+4mJ9OZDJ2OQMhQ=
X-Received: by 2002:a17:90b:4b49:b0:32e:9f1e:4ee4 with SMTP id
 98e67ed59e1d1-343fa636eb2mr14964476a91.17.1763368040651; Mon, 17 Nov 2025
 00:27:20 -0800 (PST)
MIME-Version: 1.0
References: <20250630202703.13844-1-gert.wollny@collabora.com>
 <20251110144625.18653-1-gert.wollny@collabora.com>
 <20251110144625.18653-4-gert.wollny@collabora.com>
In-Reply-To: <20251110144625.18653-4-gert.wollny@collabora.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 17 Nov 2025 09:27:08 +0100
X-Gm-Features: AWmQ_bn0nno6cG5xru1AolIX5ZHV2GGQts5Yy54PHH5Linq0pWMcgulnMZdcLgw
Message-ID: <CAH9NwWev7PjkkSW8N=0aM+3LVOLXajnhs12SPCe6w2ULRA830w@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] drm/etnaviv: Add a new function to emit a series
 of states to cmd stream
To: gert.wollny@collabora.com
Cc: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

> From: Gert Wollny <gert.wollny@collabora.com>
>
> v2: fix formatting and remove superfluous masking (Lucas)
>
> Signed-off-by: Gert Wollny <gert.wollny@collabora.com>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_buffer.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.h b/drivers/gpu/drm/etnaviv/etnaviv_buffer.h
> index ae1ba1db6c8a..9388a686edcf 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.h
> @@ -43,6 +43,19 @@ static inline void CMD_LOAD_STATE(struct etnaviv_cmdbuf *buffer, u32 reg,
>         OUT(buffer, value);
>  }
>
> +static inline void CMD_LOAD_STATES_START(struct etnaviv_cmdbuf *buffer, u32 reg,
> +                                        u32 nvalues)
> +{
> +       u32 index = reg >> VIV_FE_LOAD_STATE_HEADER_OFFSET__SHR;
> +
> +       buffer->user_size = ALIGN(buffer->user_size, 8);
> +
> +       /* write a register via cmd stream */
> +       OUT(buffer, VIV_FE_LOAD_STATE_HEADER_OP_LOAD_STATE |
> +                           VIV_FE_LOAD_STATE_HEADER_OFFSET(index) |
> +                           VIV_FE_LOAD_STATE_HEADER_COUNT(nvalues));
> +}
> +
>  static inline void CMD_END(struct etnaviv_cmdbuf *buffer)
>  {
>         buffer->user_size = ALIGN(buffer->user_size, 8);
> --
> 2.51.0
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
