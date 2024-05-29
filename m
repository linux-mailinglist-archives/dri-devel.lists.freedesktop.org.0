Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1912F8D349C
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 12:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4726310E7D5;
	Wed, 29 May 2024 10:31:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="AfOrVGm1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710F610E7D5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 10:31:36 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-42012c85e61so65495e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 03:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1716978694; x=1717583494;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8T+4C++Ip51NQNCNOm8O3oTdvMVRbk5XM6uYT3Xq7q4=;
 b=AfOrVGm1OTocDmixrHaO6d+pJ9YehbWTFUzNKRbJWGCNvmltDmUcfPXcRy25FHFCL8
 0IC/UHRxsN5EhsjdktpkUBzqTAZMy8kc6tqgrH2p+bZZF16rMG/8PRE5kR7aq6tzIyWt
 wkg4Vz8DhEmWY7vZQyC7xlo96lTr7xrchm1dFnQ0GRDn2O0qG88Zbvr8jDbTA8ZLLYer
 dP3ILcu7rY6+fwXCZjQi9LfiLbshtaeKokYF8DJl7pgDKzjB///t02tlR8ucx3c+xQY1
 YEGhITLwfKEUBw9NO1NwazpFEoayd+LQ02dZSPtSB5fVOuiaFtmDuMsYjnDbm1PEC+Wy
 soEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716978694; x=1717583494;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8T+4C++Ip51NQNCNOm8O3oTdvMVRbk5XM6uYT3Xq7q4=;
 b=hnsKNYrdGyO113hddA3qm7Rdhb1iJNbBZIstbWuTFVj6dqIgeDu5bH/6WQffA30vkv
 3NJDQHc6gFX/lGNeU9GtQfxHYPwHMv01oSKv1hsDwp7DBtkK5M69yosqY+9pxYJvXLs2
 eihsZz5iY3iWsN5AJRN6a77gPaJ2xn1mSA9b5EcKg+EupMdVXk6tHMrTF9KUd93Bnpjd
 F9iAtAXdpApt6Jvoqux1lTr4c10Hnd7Ge0JgdRTsGBmUpOIZ51638q+1ewz2ENry9gYO
 QBF0W4SLw51z1EFMl81VxQor+5dQHLf/1x87Ljw6TKNK5LvwT+AtfjG9bdJ5IeDSY9tX
 IM7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVh9CtiwpsQQKagcgRW2MVSW7mnLYHs0eZD09aqO0br6BL5weot9U9SqMkFfa6ffUz8XifkDD+9PPqok0/IPJczSZyzACYqYTsVQsvOV2zu
X-Gm-Message-State: AOJu0YzmkTN1RQPGBDGiQGbJvodT8qV2rEF8wPGrDNjqeNUnFpqQL61S
 G3/QyZ5mumOSjonrWuYtFL1JeukG29GP7VoiVNHw2WFLrIopUyUuQyXNnVh5Rvy59ljEZh4+DUK
 cHV874t85KxQe5YyOk+9w3ZRsUasCg2DnKfc=
X-Google-Smtp-Source: AGHT+IF06N0AywzCp/IQE6BefdLVbzE7nu58juaSZM1QzbsQ9KSqgjIx7pyF//JuzfivcCk7P8QZxUDTY6QzUp2n4Jk=
X-Received: by 2002:a05:600c:3b18:b0:41f:a15d:2228 with SMTP id
 5b1f17b1804b1-42122909a1cmr1457685e9.0.1716978694494; Wed, 29 May 2024
 03:31:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240522090158.121797-1-21cnbao@gmail.com>
In-Reply-To: <20240522090158.121797-1-21cnbao@gmail.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 29 May 2024 03:31:22 -0700
Message-ID: <CANDhNCqr4MtkEXG4uBOViPAODQnuQOgpdNZCmP4yvVSNwnU5ew@mail.gmail.com>
Subject: Re: [RFC PATCH] dma-buf: align fd_flags and heap_flags with
 dma_heap_allocation_data
To: Barry Song <21cnbao@gmail.com>
Cc: sumit.semwal@linaro.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, benjamin.gaignard@collabora.com, 
 Brian.Starkey@arm.com, tjmercier@google.com, christian.koenig@amd.com, 
 Barry Song <v-songbaohua@oppo.com>
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

On Wed, May 22, 2024 at 2:02=E2=80=AFAM Barry Song <21cnbao@gmail.com> wrot=
e:
>
> From: Barry Song <v-songbaohua@oppo.com>
>
> dma_heap_allocation_data defines the UAPI as follows:
>
>  struct dma_heap_allocation_data {
>          __u64 len;
>          __u32 fd;
>          __u32 fd_flags;
>          __u64 heap_flags;
>  };
>
> However, dma_heap_buffer_alloc() casts them into unsigned int. It's uncle=
ar
> whether this is intentional or what the purpose is, but it can be quite
> confusing for users.
>
> Adding to the confusion, dma_heap_ops.allocate defines both of these as
> unsigned long. Fortunately, since dma_heap_ops is not part of the UAPI,
> it is less of a concern.
>
> struct dma_heap_ops {
>         struct dma_buf *(*allocate)(struct dma_heap *heap,
>                                     unsigned long len,
>                                     unsigned long fd_flags,
>                                     unsigned long heap_flags);
> };
>
> I am sending this RFC in hopes of clarifying these confusions.
>
> If the goal is to constrain both flags to 32 bits while ensuring the stru=
ct
> is aligned to 64 bits, it would have been more suitable to define
> dma_heap_allocation_data accordingly from the beginning, like so:
>
>  struct dma_heap_allocation_data {
>          __u64 len;
>          __u32 fd;
>          __u32 fd_flags;
>          __u32 heap_flags;
>          __u32 padding;
>  };

So here, if I recall, the intent was to keep 64bits for potential
future heap_flags.

But your point above that we're inconsistent with types in the non
UAPI arguments is valid.
So I think your patch makes sense.

Thanks for raising this issue!
Acked-by: John Stultz <jstultz@google.com>
