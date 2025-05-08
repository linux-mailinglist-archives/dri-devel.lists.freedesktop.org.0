Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DA9AB02DC
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 20:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14ABD10E955;
	Thu,  8 May 2025 18:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="t7NB/AL1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D905710E955
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 18:32:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 21E42A4E17A
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 18:32:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A3EFC4AF0D
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 18:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746729172;
 bh=dI9PYz2NiVcz9XB8oLCo4yQGCH+anaoEe3DTOVFETh0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=t7NB/AL1fy/mTrbiHY/MCL2wqDOxfSJ5ZaouwvyNeFyhSvHVzRHcapexCm80sRaiE
 qN8bkVF2Wluimr+pQyWA3JqyyvItf+KYo1kdpcVw11nq4aeYiZGjmha/CJDJ0naK8u
 qmlmHGbqa0T9ikWCJPAgCzIFrmOQdtmnrWa3Hjamo4RXGxrVg/M/eAX9oYz56/jHbY
 2d8t+yRuqWPz7TCMvBmBxtT9aPzZJDKSyXA4wZ8jOQI4s9WpNHjRSgSFnBIiqd2UYW
 dr19azTjkz5GVGlRbnHMQCe83yZZvPQdTTFfqyQEUdrs8nAh70VlkbcrLUe+4vyu1X
 c8Sjjw9ybXmXA==
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-6f0c30a1cb6so11384126d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 May 2025 11:32:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUW/g+BHrRr6d2OLKi36P9eS8nHvucPNoXs2QQeUVvM9nrkOsy+HdKJpgEVahCZsmXIXrcOajabaxY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7/tX8YwG4ab96HdbN10XTNx5k+oc2qUa+F3302RMV7xitqkpV
 IjW69YIh9M5tKAgE/wdNx4LaQDUq+lgUy59q053Dx6Le4V0dwm1166fjnEWtOgN6Ci2ki8tC6v/
 7Gyv/hYWINzmBMTUeoYIJNlsKgIs=
X-Google-Smtp-Source: AGHT+IFGy1cRgySSEQi/MG5bIU6lid7JLUbcXDq643AD1ZUr6eRMCZ7Yix8NvK6uHTAvzj7j2m5rR44CYrq6wg9RldQ=
X-Received: by 2002:ad4:5dcf:0:b0:6f5:46b0:7d11 with SMTP id
 6a1803df08f44-6f6e48100a9mr5001936d6.36.1746729171544; Thu, 08 May 2025
 11:32:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250508182025.2961555-1-tjmercier@google.com>
 <20250508182025.2961555-2-tjmercier@google.com>
In-Reply-To: <20250508182025.2961555-2-tjmercier@google.com>
From: Song Liu <song@kernel.org>
Date: Thu, 8 May 2025 11:32:39 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7aGCof7=4kcPC0qFr9R1CD-L8aXFV6viBBK43UJZB1KQ@mail.gmail.com>
X-Gm-Features: ATxdqUF9-QhsdlBFsjsiwpLDumtKQSWnSrDHS1EoJZlTkU8ysEENxH7Dxn847kM
Message-ID: <CAPhsuW7aGCof7=4kcPC0qFr9R1CD-L8aXFV6viBBK43UJZB1KQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 1/5] dma-buf: Rename debugfs symbols
To: "T.J. Mercier" <tjmercier@google.com>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
 skhan@linuxfoundation.org, alexei.starovoitov@gmail.com, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, android-mm@google.com, 
 simona@ffwll.ch, eddyz87@gmail.com, yonghong.song@linux.dev, 
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
 jolsa@kernel.org, mykolal@fb.com, shuah@kernel.org
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

On Thu, May 8, 2025 at 11:20=E2=80=AFAM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> Rename the debugfs list and mutex so it's clear they are now usable
> without the need for CONFIG_DEBUG_FS. The list will always be populated
> to support the creation of a BPF iterator for dmabufs.
>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Acked-by: Song Liu <song@kernel.org>
