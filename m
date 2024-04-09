Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB3989E099
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 18:37:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4EB7112E16;
	Tue,  9 Apr 2024 16:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="A1wJx8VN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CCA2112E1D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 16:37:20 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-d9b9adaf291so5923059276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 09:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1712680639; x=1713285439;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VWrgc6fSc3w4dKU6IsZCUM+SMdZmjryY3zaMUJ1lg5M=;
 b=A1wJx8VN9oMtOqjtB9wApVlsKDuSB0Bxc4x5zbX0lu6LgxkybitvYsrVTYawoq5rR0
 KYo4aHlzVMDd849P2S7+BXm7vy9UNxk8h4QcCBXVxu9cgy8dtw7tquZosyQac8GZ/CIL
 8IThlnf2R5RZIpnjeHJ4Hf+ZTK2gYvRiia1tn8RzU3IUR25SUSwlRt3SafbRqGVWzkLQ
 ax6yqnXFumLEJnFfTWw/uvZEm3cHwvjRbIvfOj5TDlFzr+ayB7OYkpQsD7UeovMY98hU
 KCiLWy4uxpneHJtSsVW+6BdAz3cjX1PuaXHiuosi48Y5VL4n7RFjnrHZHCKnk2u9G2tz
 napg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712680639; x=1713285439;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VWrgc6fSc3w4dKU6IsZCUM+SMdZmjryY3zaMUJ1lg5M=;
 b=dnQiaSBvVGQkmbDlY2NRVV+t4FRao9Vau7iep4y0xmOZB9xhjpyUPgCwGOs4UKC0NV
 iu3W7gvBM3T+U7zfkRDGPEKumpb04znwPD0yy7bqtZBx/8TeGpRN+EpkFzVPcR06cGIM
 Pjb/L28vKhZuLpjcdqsPt01aBRXMJaYPa1sy1MUjk+2cKR37kjJ6DSbjluj4iX8bWCa2
 SvsZr6SQbncX8P/6lpkCNm5tNnqbEqX6KoFr4OeHwLl8kznGE5diofAf7w2VB1KKU67H
 /eegabcSUW96wsu4lMAHltTal9UePbCHZ69qYhAtq0J6ceW4OI14qkDrgCtk5lJdoIPR
 atcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvczPxuvxEzsNlh4CAFrj+lTA50L+oZEpefdpqa9F16BDKS4rmuNF0PwKUftffXNxRjGmbJUUAXts0M/paipaZB0ih1Dt7/ghKj0WTnGjy
X-Gm-Message-State: AOJu0YzPz/Ji1/s69wTBBEOUtFzbz4WovN4s8sW04eijwuPPFXmbqyRz
 T5R6JI2ve/A4eTXMxRdIeKy4+4Odp/tqJz1uETqtXtsDW4AZuUTo+s/qI1JDR6GoYVw54wsEemQ
 vtxFWN432itcKpvaFxpGnz6d5BTjBYUGCjVOg
X-Google-Smtp-Source: AGHT+IGJRrnZd6GpHhz2e2NeVhdfIMLHOtWWI1dHIs7kshaTz2NJhrtoPZ84nV+L11Kpx9q3bco9EMqTwIkVE14CEDU=
X-Received: by 2002:a5b:cc8:0:b0:de0:de50:d6d4 with SMTP id
 e8-20020a5b0cc8000000b00de0de50d6d4mr296806ybr.8.1712680639127; Tue, 09 Apr
 2024 09:37:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211113062222.3743909-1-jay.xu@rock-chips.com>
 <1da5cdf0-ccb8-3740-cf96-794c4d5b2eb4@amd.com>
 <3175d41a-fc44-4741-91ac-005c8f21abb8@vivo.com>
 <9e6f1f52-db49-43bb-a0c2-b0ad12c28aa1@amd.com>
 <5c7ac24c-79fa-45fc-a4fd-5b8fc77a741b@vivo.com>
In-Reply-To: <5c7ac24c-79fa-45fc-a4fd-5b8fc77a741b@vivo.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 9 Apr 2024 09:37:07 -0700
Message-ID: <CABdmKX1OZ9yT3YQA9e7JzKND9wfiL-hnf87Q6v9pwtnAeLHrdA@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: add DMA_BUF_IOCTL_SYNC_PARTIAL support
To: Rong Qianfeng <11065417@vivo.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Rong Qianfeng <rongqianfeng@vivo.com>, Jianqun Xu <jay.xu@rock-chips.com>,
 sumit.semwal@linaro.org, 
 pekka.paalanen@collabora.com, daniel.vetter@ffwll.ch, jason@jlekstrand.net, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org
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

On Tue, Apr 9, 2024 at 12:34=E2=80=AFAM Rong Qianfeng <11065417@vivo.com> w=
rote:
>
>
> =E5=9C=A8 2024/4/8 15:58, Christian K=C3=B6nig =E5=86=99=E9=81=93:
> > Am 07.04.24 um 09:50 schrieb Rong Qianfeng:
> >> [SNIP]
> >>> Am 13.11.21 um 07:22 schrieb Jianqun Xu:
> >>>> Add DMA_BUF_IOCTL_SYNC_PARTIAL support for user to sync dma-buf with
> >>>> offset and len.
> >>>
> >>> You have not given an use case for this so it is a bit hard to
> >>> review. And from the existing use cases I don't see why this should
> >>> be necessary.
> >>>
> >>> Even worse from the existing backend implementation I don't even see
> >>> how drivers should be able to fulfill this semantics.
> >>>
> >>> Please explain further,
> >>> Christian.
> >> Here is a practical case:
> >> The user space can allocate a large chunk of dma-buf for
> >> self-management, used as a shared memory pool.
> >> Small dma-buf can be allocated from this shared memory pool and
> >> released back to it after use, thus improving the speed of dma-buf
> >> allocation and release.
> >> Additionally, custom functionalities such as memory statistics and
> >> boundary checking can be implemented in the user space.
> >> Of course, the above-mentioned functionalities require the
> >> implementation of a partial cache sync interface.
> >
> > Well that is obvious, but where is the code doing that?
> >
> > You can't send out code without an actual user of it. That will
> > obviously be rejected.
> >
> > Regards,
> > Christian.
>
> In fact, we have already used the user-level dma-buf memory pool in the
> camera shooting scenario on the phone.
>
>  From the test results, The execution time of the photo shooting
> algorithm has been reduced from 3.8s to 3s.
>
For phones, the (out of tree) Android version of the system heap has a
page pool connected to a shrinker. That allows you to skip page
allocation without fully pinning the memory like you get when
allocating a dma-buf that's way larger than necessary. If it's for a
camera maybe you need physically contiguous memory, but it's also
possible to set that up.

https://android.googlesource.com/kernel/common/+/refs/heads/android14-6.1/d=
rivers/dma-buf/heaps/system_heap.c#377


> To be honest, I didn't understand your concern "...how drivers should be
> able to fulfill this semantics." Can you please help explain it in more
> detail?
>
> Thanks,
>
> Rong Qianfeng.
>
> >
> >>
> >> Thanks
> >> Rong Qianfeng.
> >
>
