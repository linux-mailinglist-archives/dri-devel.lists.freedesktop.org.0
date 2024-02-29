Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8996D86BFCC
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 05:18:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B6010E398;
	Thu, 29 Feb 2024 04:18:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="TbSBtNAc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F1710E398
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 04:18:09 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-412a2c2ce88so24585e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 20:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1709180288; x=1709785088;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4ZRYC3eQbqO5jHdABTpHXvMtzoXuiWeOf7cPhtqaeWU=;
 b=TbSBtNAcUMUyfuJyKDWIfPoFDT0cSFKaUGZPFSYyYUTU6QOo8YFSypiI4+1w/dUnRJ
 ytr3ao04YxEC3VRz4QpFZj3yamKA2ry/VUzApiRI3NJDHNHAFZKba3afWGcSbm3c0CZo
 3o1arm9v39Mex57KvWN9c9EHPTDcI4sKoEHgn3RcLuIxFDmwTv2lnvRAJTP4nGep2coV
 FIQVU7s5w+49XM19WkNQ4V7Mzmxvg06DkPJMK5RbIrdaeGFd95P0uzcml94pnk4ZYhyH
 EEXRggPnGzGCqu8XAgipYWOphA03hYFdMHf94PyWHHRM00jTuHMJ88OZv2HEtNmhZu7I
 cLMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709180288; x=1709785088;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4ZRYC3eQbqO5jHdABTpHXvMtzoXuiWeOf7cPhtqaeWU=;
 b=EhtXLA441VJeKKWjO1yAbZ14reRBky7zpMLvgpiIDbKI+uaj9FJEfoXIlvY7GYKx7L
 um8gBuXjuUo3chXdu2S4yY6XU0/3lbps2N6vIESUlxOQUdz1tzlaNAkikqQbE9PEZt/0
 /HleKF090Epr8Qlo941ml4W+qtqcd75SxXqpkASz1j1aQupIUHiezRh5HCNvA1zc+pQl
 t2S6QwL7KeCoi1WX2q5hcgnne0C7X08JgZWCbeXIuykxlRIfEcv3bxbZIiL0pb+GHKx2
 7FIg6y75yZTPu5hOEnYLj0/b4NvH1tds+B23hSC5pLbxgy7+Vkt8Um0qRME6CgpHgatN
 hFVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkF4MwjxlcI2FzK2/fputc4KWnYHe+uw0Vpv0g84+ZmKcwfDHDS0lj6p+QayLKhNVT/knGET470S5FGj0TmLDjQYjMEviN/lQ1kPptn7b/
X-Gm-Message-State: AOJu0YxGn5Rsne9wD5nKBAIKcRPzqSV71r6jYoyOQXJsGvdZCnHQavML
 I+MNoKR9XMukLICMqQvDt6nHj+FXMsZlMiwAAAEO0uVSr0BzKLVsrwTdD7xAtLQcVyYUu5i2Vv5
 DFuvPeyKU+xfdHz69YrLqYVhIhp+C1/OmoGU=
X-Google-Smtp-Source: AGHT+IEdAISHJic0YRCY4eYW9TXIlfte7WHoViC9o9WO2SnJ+GucjOMncEU5Qlfu9EM/Y2Uqp6ddT+4i3av0jdD18Jk=
X-Received: by 2002:a05:600c:1f09:b0:412:a9ce:5f68 with SMTP id
 bd9-20020a05600c1f0900b00412a9ce5f68mr63100wmb.2.1709180288042; Wed, 28 Feb
 2024 20:18:08 -0800 (PST)
MIME-Version: 1.0
References: <20240228-nifty-flashy-shrew-905edc@houat>
In-Reply-To: <20240228-nifty-flashy-shrew-905edc@houat>
From: John Stultz <jstultz@google.com>
Date: Wed, 28 Feb 2024 20:17:55 -0800
Message-ID: <CANDhNCquJn6bH3KxKf65BWiTYLVqSd9892-xtFDHHqqyrroCMQ@mail.gmail.com>
Subject: Re: ECC memory semantics for heaps
To: Maxime Ripard <mripard@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org
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

On Wed, Feb 28, 2024 at 7:24=E2=80=AFAM Maxime Ripard <mripard@redhat.com> =
wrote:
>
> I'm currently working on a platform that seems to have togglable RAM ECC
> support. Enabling ECC reduces the memory capacity and memory bandwidth,
> so while it's a good idea to protect most of the system, it's not worth
> it for things like framebuffers that won't really be affected by a
> bitflip.
>
> It's currently setup by enabling ECC on the entire memory, and then
> having a region of memory where ECC is disabled and where we're supposed
> to allocate from for allocations that don't need it.
>
> My first thought to support this was to create a reserved memory region
> for the !ECC memory, and to create a heap to allocate buffers from that
> region. That would leave the system protected by ECC, while enabling
> userspace to be nicer to the system by allocating buffers from the !ECC
> region if it doesn't need it.
>
> However, this creates basically a new combination compared to the one we
> already have (ie, physically contiguous vs virtually contiguous), and we
> probably would want to throw in cacheable vs non-cacheable too.
>
> If we had to provide new heaps for each variation, we would have 8 heaps
> (and 6 new ones), which could be fine I guess but would still increase
> quite a lot the number of heaps we have so far.
>
> Is it something that would be a problem? If it is, do you see another
> way to support those kind of allocations (like providing hints through
> the ioctl maybe?)?

So, the dma-buf heaps interface uses chardevs so that we can have a
lot of flexibility in the types of heaps (and don't have the risk of
bitmask exhaustion like ION had). So I don't see adding many
differently named heaps as particularly problematic.

That said, if there are truly generic properties (cacheable vs
non-cachable is maybe one of those) which apply to most heaps, I'm
open to making use of the flags. But I want to avoid having per-heap
flags, it really needs to be a generic attribute.

And I personally don't mind the idea of having things added as heaps
initially, and potentially upgrading them to flags if needed (allowing
heap drivers to optionally enumerate the old chardevs behind a config
option for backwards compatibility).

How common is the hardware that is going to provide this configurable
ECC option, and will you really want the option on all of the heap
types? Will there be any hardware constraint limitations caused by the
ECC/!ECC flags? (ie: Devices that can't use !ECC allocated buffers?)

If not, I wonder if it would make sense to have something more along
the lines using a fcntl()  like how F_SEAL_* is used with memfds?
With some of the discussion around "restricted"/"secure" heaps that
can change state, I've liked this idea of just allocating dmabufs from
normal heaps and then using fcntl or something similar to modify
properties of the buffer that are separate from the type of memory
that is needed to be allocated to satisfy device constraints.

thanks
-john
