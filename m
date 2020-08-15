Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAA7245063
	for <lists+dri-devel@lfdr.de>; Sat, 15 Aug 2020 04:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659756EC57;
	Sat, 15 Aug 2020 02:19:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148866EC57
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Aug 2020 02:19:58 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id k12so9135659otr.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 19:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kotVL2MVQP+yaUdPHEdye5LclV8vVVPvzmwQlj45VGA=;
 b=RTB9HEWhawVWaOVivVEaeJlv0EDtpps/Dvnysqh+sfXQcrhgY36YW5WMpXVQ3E03De
 BfHJGAyPOioZ7kOWqdSQIe2pfq2XEO7q/+kCJMd7WFieWUtZm5DmOQH0cMzm3OFrDfl6
 KSF238ON/iriNpjcgkGO8ZZoC2u79B/Xqgw0TVxTQHwU7JtRGkNPhW8vro7AdN+J0S0v
 xEYUfZVTrcRl3KH3h2RjbwjC7XM0wFl01LmOcUK+u1taG15uYnn7vGR4pA0VoNqSagns
 N92QFNP5r9ZaE4etZxVqeRGuIt0/ShuHjQ7LIzmqB3JKtaouIOCqUaQVSS8jCnKy63HB
 eR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kotVL2MVQP+yaUdPHEdye5LclV8vVVPvzmwQlj45VGA=;
 b=kquJcR/hmhVbMohHLkblgRTa4OR+WrCv9I72uV56hTqiIiWsTu8/pAwlTeJ2XVVhyS
 wHh7/gSnOeZGw4f/gwGN8QdEysxeWN9nyuRvfIEORLOF8Gv4dvhnB+tYbfknv8iAG8A/
 2DJFsNhTNZV5+zxzfIMUtmQulidELtjh9BSXg4+7gjRC4mMyNinGRh/FkKINoo3TV8CW
 MAKzkxHe1B1mXqiI4m6TEHQflRh3foLVOHpvMCnQNWyi/YCM4l9XInG3A+3OifdxOTU+
 KpXncWJMKS5m9ORArlWOt4/f0jtMyTaWbOpyRw/Q6m9bB2v5M7KOM5EVbYSKqsn/BFvT
 Iidw==
X-Gm-Message-State: AOAM533YRWzAAOF+p1E1A/b7j5JyPm0xCKueogFROIuYNiuCSoOPZl28
 W8n16BsbN1hLIfx7Ik2WjWa9D4oVf1DDMjlmj3f6nA==
X-Google-Smtp-Source: ABdhPJy+n0F6ds6KPCecQRLWeKyt7/kkaH52AH58xx1rQoWzIvkR4h1GmHPPbdbsDbWnnwEdgh+f7kNaM9jPgYlAeKo=
X-Received: by 2002:a9d:6f8f:: with SMTP id h15mr3758994otq.221.1597457997320; 
 Fri, 14 Aug 2020 19:19:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200814142516.148934-1-ezequiel@collabora.com>
In-Reply-To: <20200814142516.148934-1-ezequiel@collabora.com>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 14 Aug 2020 19:19:45 -0700
Message-ID: <CALAqxLWytSnPugPH2Ux5=C_bzC0DLGKQyB+Szcp4LOVfhKPFqg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heap-helpers: Set dma-buf exporter name
To: Ezequiel Garcia <ezequiel@collabora.com>
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
Cc: Liam Mark <lmark@codeaurora.org>, "Andrew F . Davis" <afd@ti.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Laura Abbott <labbott@kernel.org>,
 kernel@collabora.com, linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 14, 2020 at 7:25 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> Currently the heap helper uses DEFINE_DMA_BUF_EXPORT_INFO,
> which uses KBUILD_MODNAME for the dma_buf_export_info.exp_name.
>
> This effectively makes all dma-bufs exported by the heap
> helper as coming from "heap-helpers", instead of the actual heap name
> (cma, system, etc).
>
> Fix this by adding a dma-heap name getter, and then setting
> dma_buf_export_info.exp_name.
>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

Untested, but looks sane to me.

Acked-by: John Stultz <john.stultz@linaro.org>

On a slightly related note, I'm starting to regret the current
heap-helpers approach (Andrew probably gets an "I told you so" there
:). While it avoids a lot of duplication, it's really an all or
nothing approach, and doesn't really compare well to other drm style
helper functions.  I may eventually try to break the system and cma
implementations out of the helper code and try to consider a different
approach to avoid the duplication.

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
