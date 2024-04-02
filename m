Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4E9895BA2
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 20:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D03A110E2A9;
	Tue,  2 Apr 2024 18:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="sEi9sxdy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E5410E408
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 18:22:21 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-dd161eb03afso4833536276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 11:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1712082140; x=1712686940;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ia/tbJPIdeMfQ6ZZ+vaPcpfh03Y3DgIKVILN8aSZC/Q=;
 b=sEi9sxdy7jXqW8x+FRebZX1D13t973fihctVksKTwtelIjcSRIuB39dUtR/q3UYKJQ
 gLqsO6paoF/gvCBM+hBbv+6qvA1jQjwYT0chcT7bTiwPUTrYNuQtqgItbHu/vN/PbNxw
 3eQEgw1kX3b71mNsqQjdDZjrAATCdrFedCwbsbT1jAW5QOTZOwugbzMUSYwbMkD3tCsn
 ky+P/soMz4gGtHw0OOeQFgaAzUbtSfX6F/5gMNlz65GuFpxRfC+Dz4KewJTnvEqDhKBd
 b7BGSJOwbl//nljuI/HS4s65ulrWg+yfwv7x5Yx2oc1Rr37Y2lM93FZomA7Qvto8B7q2
 IUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712082140; x=1712686940;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ia/tbJPIdeMfQ6ZZ+vaPcpfh03Y3DgIKVILN8aSZC/Q=;
 b=nZkTDA8UcBuwcD/93A0eU/LMuxhw91FgsswBDNBO45BZNlSPq0DeglWLf1iAZAX5xJ
 rG+2xmw7m3JG7d9y4yFgcPdLqHWm90fNh47nzsXmNG6wYrCEtUIjUCfggnowIbbqy8O+
 EH4+gsS25OZpz0xb4YoxPwWnMWWv2F74op1Tn/mu3ZOl4mO0obR568yNkMqtUVNDjHN2
 SKGys30Hedha3kJo3DdT9TVqkkxi4mna+G/bhuPQNHFl4qVxC+Bz/rHdTOtMbzW2uSnJ
 da9vVuKPfeYITLoPyhCD5GMoOwQpkG9QeLKTjd+BJEVLpbqtqP4CLqDOAwRUyXbvaOrW
 uhNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKmiU1OpQe39bCZYeQ9m4v0uU5+gpUL3ynA9fXcdw6UiadayWlOhOFLo7r+mCwcBBob5ATJ8TLqQt6XhOBUord6+ok7RQEbqRlgihQKNT7
X-Gm-Message-State: AOJu0Yz5D1vk2EKM2cGAvR+vCSlsP8sUA2AZRtk1FVH3pCtOP272Erjb
 ArSej0YpAvo2HKygMSwrKqYAOmFTAEFeFB3mHH6XhxCoS38og20kRTJYWY1BIz+7Aor9SNDFDuF
 mM9z0RtrdFV/g1dv3l/NUkKd7WY93skRUu5WN
X-Google-Smtp-Source: AGHT+IELVyAijo8pj3GcLmB3cCFiU9WkTzB0n0l7/6pGqPaQ1F3PpSSJA0zcslPbroERdF7pfvQPJq16K7fY/gzJvBE=
X-Received: by 2002:a25:ad12:0:b0:dc2:466a:23bd with SMTP id
 y18-20020a25ad12000000b00dc2466a23bdmr11110164ybi.54.1712082140449; Tue, 02
 Apr 2024 11:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240327022903.776-1-justinjiang@vivo.com>
 <5cf29162-a29d-4af7-b68e-aac5c862d20e@amd.com>
 <cc7defae-60c1-4cc8-aee5-475d4460e574@vivo.com>
 <23375ba8-9558-4886-9c65-af9fe8e8e8b6@amd.com>
In-Reply-To: <23375ba8-9558-4886-9c65-af9fe8e8e8b6@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 2 Apr 2024 11:22:08 -0700
Message-ID: <CABdmKX2Kf4ZmVzv3LGTz2GyP-9+rAtFY9hSAxdkrwK8mG0gDvQ@mail.gmail.com>
Subject: Re: [PATCH] dmabuf: fix dmabuf file poll uaf issue
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: zhiguojiang <justinjiang@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 opensource.kernel@vivo.com
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

On Tue, Apr 2, 2024 at 1:08=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> Am 02.04.24 um 08:49 schrieb zhiguojiang:
> >> As far as I can see that's not because of the DMA-buf code, but
> >> because you are somehow using this interface incorrectly.
> >>
> >> When dma_buf_poll() is called it is mandatory for the caller to hold
> >> a reference to the file descriptor on which the poll operation is
> >> executed.
> >>
> >> So adding code like "if (!file_count(file))" in the beginning of
> >> dma_buf_poll() is certainly broken.
> >>
> >> My best guess is that you have some unbalanced
> >> dma_buf_get()/dma_buf_put() somewhere instead.
> >>
> >>
> > Hi Christian,
> >
> > The kernel dma_buf_poll() code shound not cause system crashes due to
> > the user mode usage logical issues ?
>
> What user mode logical issues are you talking about? Closing a file
> while polling on it is perfectly valid.
>
> dma_buf_poll() is called by the filesystem layer and it's the filesystem
> layer which should make sure that a file can't be closed while polling
> for an event.
>
> If that doesn't work then you have stumbled over a massive bug in the fs
> layer. And I have some doubts that this is actually the case.
>
> What is more likely is that some driver messes up the reference count
> and because of this you see an UAF.
>
> Anyway as far as I can see the DMA-buf code is correct regarding this.
>
> Regards,
> Christian.

I tried to reproduce this problem but I couldn't. What I see is a ref
get taken when poll is first called. So subsequently closing the fd in
userspace while it's being polled doesn't take the refcount all the
way to 0. That happens when dma_buf_poll_cb fires, either due to an
event or when the fd is closed upon timeout.

I don't really see how this could be triggered from userspace so I am
also suspicious of dma_buf_get/put.
